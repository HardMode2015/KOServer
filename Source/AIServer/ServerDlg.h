#pragma once

#include "Define.h"
#include "../shared/KOSocketMgr.h"
#include "../shared/database/OdbcConnection.h"

#include "GameSocket.h"

#include "MAP.h"
#include "PathFind.h"

#include "../shared/STLMap.h"
#include "../shared/STLMapOnlyLoad.h"

class CNpcThread;
class CNpcTable;
class Unit;

typedef std::map <uint8, CNpcThread*>		NpcThreadArray;
typedef CSTLMap <CNpcTable>					NpcTableArray;
typedef CSTLMap <CNpc>						NpcArray;
typedef CSTLMapOnlyLoad <_MAGIC_TABLE>				MagictableArray;
typedef CSTLMapOnlyLoad <_MAGIC_TYPE1>				Magictype1Array;
typedef CSTLMapOnlyLoad <_MAGIC_TYPE2>				Magictype2Array;
typedef CSTLMapOnlyLoad <_MAGIC_TYPE4>				Magictype4Array;
typedef CSTLMap <_PARTY_GROUP>				PartyArray;
typedef CSTLMapOnlyLoad <_MAKE_WEAPON>				MakeWeaponItemTableArray;
typedef CSTLMapOnlyLoad <_MAKE_ITEM_GRADE_CODE>		MakeGradeItemTableArray;
typedef CSTLMapOnlyLoad <_MAKE_ITEM_LARE_CODE>		MakeLareItemTableArray;
typedef std::list <int>						ZoneNpcInfoList;
typedef CSTLMapOnlyLoad <MAP>						ZoneArray;
typedef CSTLMapOnlyLoad <_K_MONSTER_ITEM>			NpcItemArray;
typedef CSTLMapOnlyLoad <_MAKE_ITEM_GROUP>			MakeItemGroupArray;
typedef CSTLMapOnlyLoad <_SERVER_RESOURCE>			ServerResourceArray;
typedef CSTLMap <_NPC_LIVE_TIME>			NpcLiveTimeArray;
typedef CSTLMapOnlyLoad <_OBJECT_EVENT>				ObjectEventArray;

typedef std::map<uint16, CUser *>			UserSessionMap;

class CServerDlg {
private:
	void ResumeAI();
	bool CreateNpcThread();
	bool GetMagicTableData();
	bool GetMagicType1Data();
	bool GetMagicType2Data();
	bool GetMagicType4Data();
	bool GetNpcTableData(bool bNpcData = true);
	bool GetNpcItemTable();
	bool GetMakeItemGroupTable();
	bool GetMakeWeaponItemTableData();
	bool GetMakeDefensiveItemTableData();
	bool GetMakeGradeItemTableData();
	bool GetMakeLareItemTableData();
	bool GetServerResourceTable();
	bool MapFileLoad();
	void GetServerInfoIni();
	bool GetObjectPostTableData();

public:
	CServerDlg();
	bool Startup();
	void UserEventRoomUpdate(uint16 uid, uint16 RoomEvent);
	bool LoadSpawnCallback(OdbcCommand *dbCommand);
	void GameServerAcceptThread();
	void GetServerResource(int nResourceID, std::string * result, ...);
	bool AddObjectEventNpc(_OBJECT_EVENT* pEvent, MAP * pMap);
	CNpc * SpawnEventNpc(uint16 sSid, bool bIsMonster, uint8 byZone, float fX, float fY, float fZ, uint16 Radius = 0, uint16 sDuration = 0, uint8 nation = 0, int16 socketID = -1, uint16 nEventRoom = 0, bool nIsPet = false, std::string strPetName = "", std::string strUserName = "", uint64 nSerial = 1, uint16 UserId = -1);
	void NpcUpdate(uint16 sSid, bool bIsMonster, uint8 byGroup = 0, uint16 sPid = 0);

	void AllNpcInfo();

	Unit * GetUnitPtr(uint16 id);
	CNpc * GetNpcPtr(uint16 npcId);

	CUser* GetUserPtr(uint16 sessionId);
	bool SetUserPtr(uint16 sessionId, CUser * pUser);
	void DeleteUserPtr(uint16 sessionId);

	MAP * GetZoneByID(int zonenumber);


	static uint32 THREADCALL Timer_CheckAliveTest(void * lpParam);
	static uint32 THREADCALL Timer_CheckLiveTimes(void * lpParam);
	void CheckAliveTest();
	void CheckLiveTimes();
	void DeleteAllUserList(CGameSocket *pSock = nullptr);
	void Send(Packet * pkt);
	void SendSystemMsg(std::string & pMsg, int type = 0);
	void ResetBattleZone();

	~CServerDlg();

public:
	bool CSWOpen;
	uint16 EventNpcID;
	std::vector <uint16> freeIDs;
	NpcArray			m_arNpc;
	NpcTableArray		m_arMonTable;
	NpcTableArray		m_arNpcTable;
	NpcThreadArray		m_arNpcThread;
	PartyArray			m_arParty;
	ZoneNpcInfoList		m_ZoneNpcList;
	MagictableArray		m_MagictableArray;
	Magictype1Array		m_Magictype1Array;
	Magictype2Array		m_Magictype2Array;
	Magictype4Array		m_Magictype4Array;
	MakeWeaponItemTableArray	m_MakeWeaponItemArray;
	MakeWeaponItemTableArray	m_MakeDefensiveItemArray;
	MakeGradeItemTableArray	m_MakeGradeItemArray;
	MakeLareItemTableArray	m_MakeLareItemArray;
	ZoneArray				g_arZone;
	NpcItemArray			m_NpcItemArray;
	MakeItemGroupArray		m_MakeItemGroupArray;
	ServerResourceArray		m_ServerResourceArray;
	NpcLiveTimeArray		m_NpcLiveTimeArray;
	ObjectEventArray		m_ObjectEventArray;
	Thread m_zoneEventThread;
	// Military Camps
	uint8 KarusBaseMilitaryCampCount, ElmoradBaseMilitaryCampCount, KarusEslantMilitaryCampCount, ElmoradEslantMilitaryCampCount, MoradonMilitaryCampCount;

	std::string m_strGameDSN, m_strGameUID, m_strGamePWD;
	OdbcConnection m_GameDB;

	uint32 m_AIServerPort;

	UserSessionMap m_pUser;

	Atomic<uint16>	MaxMonsterID;
	Atomic<uint16>	m_TotalNPC;			// DB���ִ� �� ��
	Atomic<uint16>	m_CurrentNPC;
	short			m_sTotalMap;		// Zone �� 
	short			m_sMapEventNpc;		// Map���� �о���̴� event npc ��

	bool			m_bFirstServerFlag;		// ������ ó�������� �� ���Ӽ����� ���� ��쿡�� 1, ���� ���� ��� 0
	uint8  m_byBattleEvent;				   // ���� �̺�Ʈ ���� �÷���( 1:�������� �ƴ�, 0:������)
	short m_sKillKarusNpc, m_sKillElmoNpc; // ���ﵿ�ȿ� ���� npc����

	uint16	m_iYear, m_iMonth, m_iDate, m_iHour, m_iMin, m_iAmount;
	uint8 m_iWeather;
	bool m_bIsNight;

	std::recursive_mutex m_userLock, m_npcThreadLock, m_makeItemGroupLock, m_freeIdsLock;

	KOSocketMgr<CGameSocket> m_socketMgr;
};

extern CServerDlg * g_pMain;