#include "stdafx.h"

bool CDBProcess::Connect(string & szDSN, string & szUser, string & szPass) {
	if (!m_dbConnection.Connect(szDSN, szUser, szPass)) {
		g_pMain->ReportSQLError(m_dbConnection.GetError());
		return false;
	}

	return true;
}

bool CDBProcess::LoadVersionList() {
	unique_ptr<OdbcCommand> dbCommand(m_dbConnection.CreateCommand());
	if (dbCommand.get() == nullptr)
		return false;

	if (!dbCommand->Execute(_T("SELECT sVersion, sHistoryVersion, strFilename FROM VERSION"))) {
		g_pMain->ReportSQLError(m_dbConnection.GetError());
		return false;
	}

	if (dbCommand->hasData()) {
		g_pMain->m_sLastVersion = 0;
		do {
			_VERSION_INFO *pVersion = new _VERSION_INFO;

			dbCommand->FetchUInt16(1, pVersion->sVersion);
			dbCommand->FetchUInt16(2, pVersion->sHistoryVersion);
			dbCommand->FetchString(3, pVersion->strFilename);

			g_pMain->m_VersionList.insert(make_pair(pVersion->strFilename, pVersion));

			if (g_pMain->m_sLastVersion < pVersion->sVersion)
				g_pMain->m_sLastVersion = pVersion->sVersion;

		} while (dbCommand->MoveNext());
	}

	return true;
}

bool CDBProcess::LoadUserCountList() {
	unique_ptr<OdbcCommand> dbCommand(m_dbConnection.CreateCommand());
	if (dbCommand.get() == nullptr)
		return false;

	if (!dbCommand->Execute(_T("SELECT serverid, zone1_count, zone2_count, zone3_count FROM CONCURRENT"))) {
		g_pMain->ReportSQLError(m_dbConnection.GetError());
		return false;
	}

	if (dbCommand->hasData()) {
		do {
			uint16 zone_1 = 0, zone_2 = 0, zone_3 = 0; uint8 serverID;
			dbCommand->FetchByte(1, serverID);
			dbCommand->FetchUInt16(2, zone_1);
			dbCommand->FetchUInt16(3, zone_2);
			dbCommand->FetchUInt16(4, zone_3);

			if ((uint8) (serverID - 1) < g_pMain->m_ServerList.size())
				g_pMain->m_ServerList[serverID - 1]->sUserCount = zone_1 + zone_2 + zone_3;
		} while (dbCommand->MoveNext());
	}

	return true;
}

uint16 CDBProcess::AccountLogin(string & strAccountID, string & strPasswd) {
	uint16 result = 2;
	unique_ptr<OdbcCommand> dbCommand(m_dbConnection.CreateCommand());
	if (dbCommand.get() == nullptr)
		return 6;

	dbCommand->AddParameter(SQL_PARAM_OUTPUT, &result);
	dbCommand->AddParameter(SQL_PARAM_INPUT, strAccountID.c_str(), strAccountID.length());
	dbCommand->AddParameter(SQL_PARAM_INPUT, strPasswd.c_str(), strPasswd.length());

	if (!dbCommand->Execute(_T("{? = CALL ACCOUNT_LOGIN(?, ?)}")))
		g_pMain->ReportSQLError(m_dbConnection.GetError());

	return result;
}

uint8 CDBProcess::PremiumInsert(string & strAccountID, uint8 pType, uint8 pDays) {
	uint8 result = 0;
	unique_ptr<OdbcCommand> dbCommand(m_dbConnection.CreateCommand());
	if (dbCommand.get() == nullptr)
		return false;

	char strPremiums[PREMIUM_TOTAL * 5] = {0};
	uint8 pCount = 0;
	uint8 pInUse;
	uint32 pTime = 0;

	time(&UNIXTIME);
	pTime = uint32(UNIXTIME + 24 * 60 * 60 * pDays);

	if (pType < 1 || pType > 13) {
		pInUse = 0;
		pCount = 0;
	} else if (pType < 13) {
		pCount = 1;
		pInUse = pType;
	} else if (pType == 13) {
		pCount = 3;
		pType = 10;
		pInUse = 10;
	}

	uint8 aCount2 = 0;
	ByteBuffer PremiumBuffer;
	for (int p = 0; p < pCount; p++) {
		PremiumBuffer << pType++ << pTime;
		aCount2++;
	}

	for (int i = aCount2; i < PREMIUM_TOTAL; i++) {
		PremiumBuffer << uint8(0) << uint8(0) << uint32(0);
	}

	dbCommand->AddParameter(SQL_PARAM_OUTPUT, &result);
	dbCommand->AddParameter(SQL_PARAM_INPUT, strAccountID.c_str(), strAccountID.length());
	dbCommand->AddParameter(SQL_PARAM_INPUT, (char *) PremiumBuffer.contents(), PremiumBuffer.size(), SQL_BINARY);

	if (!dbCommand->Execute(string_format(_T("{? = CALL INSERT_PREMIUM(?, %d, %d, ?)}"), pInUse, pCount))) {
		g_pMain->ReportSQLError(m_dbConnection.GetError());
		return result;
	}

	return result;
}

int16 CDBProcess::AccountPremium(string & strAccountID) {
	int16 sHours = -1;
	unique_ptr<OdbcCommand> dbCommand(m_dbConnection.CreateCommand());
	if (dbCommand.get() == nullptr)
		return sHours;

	dbCommand->AddParameter(SQL_PARAM_OUTPUT, &sHours);
	dbCommand->AddParameter(SQL_PARAM_INPUT, strAccountID.c_str(), strAccountID.length());

	if (!dbCommand->Execute(_T("{? = CALL ACCOUNT_PREMIUM(?)}")))
		g_pMain->ReportSQLError(m_dbConnection.GetError());

	return sHours;
}