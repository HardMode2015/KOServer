-- [�뺴]����

-- EVENT �� 100�� �̻� ���� ����϶�

-- UID : �������� �����ϴ� ������ȣ
-- EVENT : �������� �����ϴ� ����Ʈ ��ȣ
-- STEP : �������� �����ϴ� ����Ʈ ���� �ܰ�

-- ���� ������ �Ķ��Ÿ�� ��� ����� �׻� ���������� ����?

-- �������� ����...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24430;


if EVENT == 150 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 0�� �϶� 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 8199, NPC, 10, 153);
			 --SetQuestStep(UID, EVENT, 1); -- �� �ϴ� �ɱ�?
			 Ret = 1; -- �̰� �� ���� ���ѿ�? �׳� RETURN�� �ȵǳ���?
		elseif QuestNum > 1 and  QuestNum < 100 then--�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �϶� 
          NpcMsg(UID, 8201, NPC)
      else --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �̻� �϶� 
          EVENT = QuestNum
		end
end

if EVENT == 153 then
    Ret = 1;
end



-- [�뺴]���� Ŭ���� ����Ʈ üũ  
-- Lv 45 Kongau
-------------------------------
-----------�ᰡ ���-----------
-------------------------------

if EVENT == 8270 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8847);
    EVENT = 8271
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8852);
    EVENT = 8271
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8857);
    EVENT = 8271
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8862);
     EVENT = 8271
   end
end

if EVENT == 8271 then
    SelectMsg(UID, 1, 861, 8397, NPC, 3013, 8279);
end

if EVENT == 8279 then
    ShowMap(UID, 560);
end

local MonsterSub = 0;

if EVENT == 8272 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 180, 8398, NPC, 10, 8275);
	else-- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 180, 8399, NPC, 10, 153);
   end
end

if EVENT == 8275 then
    SelectMsg(UID, 4, 180, 8400, NPC, 22, 8273, 23, 8274);
end

if EVENT == 8273 then --������
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8848);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8853);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8858);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8863);
   end
end

if EVENT == 8274 then
   SaveEvent(UID, 8851); -- ������ 
end


-- ��Ḧ �� ������� �õ� �� ���� 

if EVENT == 8280 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8850);
    EVENT = 8281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8855);
    EVENT = 8281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8860);
    EVENT = 8281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8865);
    EVENT = 8281
   end
end

if EVENT == 8281 then
    SelectMsg(UID, 1, 861, 8401, NPC, 3002, 153);
end

if EVENT == 8276 then
    MonsterCount  = CountMonsterQuestSub(UID, 32001);
    if  MonsterCount < 20 then -- ����� ��������
     SelectMsg(UID, 2, 180, 8402, NPC, 10, 8277);
    else -- ����� �Ϸ� �Ǿ����� 
     SelectMsg(UID, 4, 180, 8403, NPC, 10, 8278, 27, 153);
    end
end

if EVENT == 8277 then
   ShowMap(UID, 512);
end

local Check;

if EVENT == 8278 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 989)
        if  Check == true then        
        RunExchange(UID, 989);
        SaveEvent(UID, 8849);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 990)
        if  Check == true then        
        RunExchange(UID, 990);
        SaveEvent(UID, 8854);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 991)
        if  Check == true then        
        RunExchange(UID, 991);
        SaveEvent(UID, 8859);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 992)
        if  Check == true then        
        RunExchange(UID, 992);
        SaveEvent(UID, 8864);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
----------�ᰡ ��� ��---------
-------------------------------
-- Lv 44 Ape
-------------------------------
---------������ ���-----------
-------------------------------

if EVENT == 8600 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8889);
    EVENT = 8601
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8894);
    EVENT = 8601
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8899);
    EVENT = 8601
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8904);
     EVENT = 8601
   end
end

if EVENT == 8601 then
   SelectMsg(UID, 1, 862, 8175, NPC, 3002, 8602);
end

if EVENT == 8602 then
   SelectMsg(UID, 1, 862, 8176, NPC, 4241, 8603);
end

local MonsterSub = 0;

if EVENT == 8603 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 1, 862, 8177, NPC, 10, 8604);
   else-- ���� ���� ����Ʈ�� ������
 	SelectMsg(UID, 1, 862, 8178, NPC, 10, 153);
   end
end

if EVENT == 8604 then
    SelectMsg(UID, 1, 862, 8179, NPC, 22, 8605, 23, 8606);
end

if EVENT == 8605 then --������
   ShowMap(UID, 542);
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8890);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8895);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8900);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8905);
   end
end

if EVENT == 8606 then
   SelectMsg(UID, 1, 862, 8492, NPC, 10, -1);
   SaveEvent(UID, 8893); -- ������ 
end

-- 836�� �Ӽ� 0, 4���� ���

if EVENT == 8610 then
   SelectMsg(UID, 2, 152, 8201, NPC, 3002, 8611);
end

local MonsterSub = 0;

if EVENT == 8611 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 4, 152, 8181, NPC, 3018, 8612, 3019, 8619);
   else-- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 152, 8182, NPC, 4242, 153);
   end
end


if EVENT == 8612 then --������
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8890);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8895);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8900);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8905);
   end
end

if EVENT == 8619 then
   SaveEvent(UID, 8893); -- ������ 
end

-- ��Ḧ �� ������� �õ�� �̼��� ���� 

if EVENT == 8613 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8892);
    EVENT = 8614
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8897);
    EVENT = 8614
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8902);
    EVENT = 8614
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8907);
    EVENT = 8614
   end
end

if EVENT == 8614 then
    SelectMsg(UID, 1, 862, 8401, NPC, 4080, 153);
end

-- 836�� 1�� 3���� ��� 

local MonsterCount = 0;

if EVENT == 8615 then
   MonsterCount  = CountMonsterQuestSub(UID, 32001);
   if  MonsterCount < 30 then -- ����� ��������
    SelectMsg(UID, 2, 152, 8182, NPC, 10, 8617);
   else-- ����� �Ϸ� �Ǿ����� 
    SelectMsg(UID, 4, 152, 8411, NPC, 10, 8618, 27, 153);
   end
end

if EVENT == 8617 then
   ShowMap(UID, 542);
end

local Check;

if EVENT == 8618 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 928)
        if  Check == true then        
        RunExchange(UID, 928);
        SaveEvent(UID, 8891);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 929)
        if  Check == true then        
        RunExchange(UID, 929);
        SaveEvent(UID, 8896);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 930)
        if  Check == true then        
        RunExchange(UID, 930);
        SaveEvent(UID, 8901);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 931)
        if  Check == true then        
        RunExchange(UID, 931);
        SaveEvent(UID, 8906);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
--------������ ��� ��---------
-------------------------------
-- Lv 46 Burning skeleton
-------------------------------
------���� ���̷��� ���-------
-------------------------------

if EVENT == 8500 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8931);
    EVENT = 8501
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8936);
    EVENT = 8501
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8941);
    EVENT = 8501
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8946);
    EVENT = 8501
   end
end

if EVENT == 8501 then
    SelectMsg(UID, 1, 827, 8191, NPC, 56, 153);
end

local MonsterSub = 0;

if EVENT == 8502 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 197, 8192, NPC, 10, 8505);
	else-- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 197, 8399, NPC, 10, 153);
   end
end

if EVENT == 8505 then
    SelectMsg(UID, 4, 197, 8193, NPC, 22, 8503, 23, 8504);
end

if EVENT == 8503 then --������
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8932);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8937);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8942);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8947);
   end
end

if EVENT == 8504 then
   SaveEvent(UID, 8935); -- ������ 
end


-- ��Ḧ �� ������� �õ� �� ���� 

if EVENT == 8510 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8934);
    EVENT = 8511
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8939);
    EVENT = 8511
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8944);
    EVENT = 8511
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8949);
    EVENT = 8511
   end
end

if EVENT == 8511 then
    SelectMsg(UID, 1, 827, 8180, NPC, 3007, 153);
end

if EVENT == 8506 then
    MonsterCount  = CountMonsterQuestSub(UID, 32001);
    if  MonsterCount < 30 then -- ����� ��������
       SelectMsg(UID, 2, 197, 8402, NPC, 10, 8507);
    else -- ����� �Ϸ� �Ǿ����� 
       Class = CheckClass(UID);
        if Class == 1 or Class == 5 or Class == 6 or Class == 3 or Class == 9 or Class == 10 or Class == 4 or Class == 11 or Class == 12 then
        SelectMsg(UID, 4, 197, 8194, NPC, 10, 8508, 27, 153);
        elseif Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, 827, 8171, NPC, 10, 8508, 27, 153);
        end
    end
end

if EVENT == 8507 then
   ShowMap(UID, 510);
end

local Check;

if EVENT == 8508 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 920)
        if  Check == true then        
        RunExchange(UID, 920);
        SaveEvent(UID, 8933);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 921)
        if  Check == true then        
        RunExchange(UID, 921);
        SaveEvent(UID, 8938);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 922)
        if  Check == true then        
        RunExchange(UID, 922);
        SaveEvent(UID, 8943);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 923)
        if  Check == true then        
        RunExchange(UID, 923);
        SaveEvent(UID, 8948);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-----���� ���̷��� ��� ��-----
-------------------------------
-- Lv 48 Ash knights
-------------------------------
-------�ֽ�����Ʈ ���---------
-------------------------------

if EVENT == 8070 then
   SelectMsg(UID, 1, 818, 8147, NPC, 14, 8351);
end

if EVENT == 8071 then
   SaveEvent(UID, 8985);
end

local MonsterSub = 0;

if EVENT == 8072 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
	SelectMsg(UID, 2, 208, 8155, NPC, 10, 8080);
   else-- ���� ���� ����Ʈ�� ������
 	SelectMsg(UID, 2, 208, 8399, NPC, 10, 153);
	end
end

if EVENT == 8080 then
   SelectMsg(UID, 4, 208, 8173, NPC, 22, 8073, 23, 8074);
end

if EVENT == 8073 then
   SaveEvent(UID, 8986);
end

if EVENT == 8074 then
   SaveEvent(UID, 8989);
end

-- ��� �Ϸ�� �õ�� �̼��� ����

if EVENT == 8075 then
   SelectMsg(UID, 1, 818, 8213, NPC, 3014, 153);
   SaveEvent(UID, 8988);
end

local MonsterCount = 0;

if EVENT == 8077 then
   MonsterCount  = CountMonsterQuestSub(UID, 32001);
   if  MonsterCount < 250 then -- ����� ��������
      SelectMsg(UID, 2, 208, 8402, NPC, 10, 8078);
   else-- ����� �Ϸ� �Ǿ����� 
      SelectMsg(UID, 4, 208, 8214, NPC, 10, 8079, 27, 153);
   end
end

if EVENT == 8078 then
   ShowMap(UID, 504);
end

if EVENT == 8079 then
   Check = CheckExchange(UID, 818)
   if  Check == true then
   RunExchange(UID, 818);
   SaveEvent(UID, 8987);
   SaveEvent(UID, 8993);
   else
  Ret = 1;	
  end	 
end

-------------------------------
------�ֽ�����Ʈ ��� ��-------
-------------------------------

-------------------------------
----------�Ͽ��� ���----------
-------------------------------

if EVENT == 8150 then
   SelectMsg(UID, 1, 842, 8217, NPC, 3002, 8151);
end

if EVENT == 8151 then
   SaveEvent(UID, 8997);
end

local MonsterSub = 0;

if EVENT == 8152 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
	SelectMsg(UID, 2, 212, 8218, NPC, 10, 8160);
   else-- ���� ���� ����Ʈ�� ������
 	SelectMsg(UID, 2, 212, 8399, NPC, 10, 153);
	end
end

if EVENT == 8160 then
   SelectMsg(UID, 4, 212, 8219, NPC, 22, 8153, 23, 8154);
end

if EVENT == 8153 then
   SaveEvent(UID, 8998);
end

if EVENT == 8154 then
   SaveEvent(UID, 9001);
end

-- ��� �Ϸ�� �õ�� �̼��� ����

if EVENT == 8155 then
   SelectMsg(UID, 1, 842, 8213, NPC, 3014, 153);
   SaveEvent(UID, 9000);
end

local MonsterCount = 0;

if EVENT == 8157 then
   MonsterCount  = CountMonsterQuestSub(UID, 32001);
   if  MonsterCount < 210 then -- ����� ��������
      SelectMsg(UID, 2, 212, 8402, NPC, 10, 8158);
   else-- ����� �Ϸ� �Ǿ����� 
      SelectMsg(UID, 4, 212, 8220, NPC, 10, 8159, 27, 153);
   end
end

if EVENT == 8158 then
   ShowMap(UID, 516);
end

if EVENT == 8159 then
   Check = CheckExchange(UID, 948)
   if  Check == true then
   RunExchange(UID, 948);
   SaveEvent(UID, 8999);
   SaveEvent(UID, 9005);
   else
  Ret = 1;	
  end	 
end

-------------------------------
---------�Ͽ��� ��� ��--------
-------------------------------

-------------------------------
--------��� ���� ���---------
-------------------------------

if EVENT == 8550 then
   SelectMsg(UID, 1, 849, 8000, NPC, 14, 8551);
end

if EVENT == 8551 then
   SaveEvent(UID, 9045);
end

local MonsterSub = 0;

if EVENT == 8552 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
	SelectMsg(UID, 2, 483, 8001, NPC, 10, 8560);
   else-- ���� ���� ����Ʈ�� ������
 	SelectMsg(UID, 2, 483, 8399, NPC, 10, 153);
	end
end

if EVENT == 8560 then
   SelectMsg(UID, 4, 483, 8002, NPC, 22, 8553, 23, 8554);
end

if EVENT == 8553 then
   SaveEvent(UID, 9046);
end

if EVENT == 8554 then
   SaveEvent(UID, 9049);
end

-- ��� �Ϸ�� �õ�� �̼��� ����

if EVENT == 8555 then
   SelectMsg(UID, 1, 849, 8003, NPC, 3014, 153);
   SaveEvent(UID, 9048);
end

local MonsterCount = 0;

if EVENT == 8557 then
   MonsterCount  = CountMonsterQuestSub(UID, 32001);
   if  MonsterCount < 250 then -- ����� ��������
      SelectMsg(UID, 2, 483, 8402, NPC, 10, 8558);
   else-- ����� �Ϸ� �Ǿ����� 
      SelectMsg(UID, 4, 483, 8004, NPC, 10, 8559, 27, 153);
   end
end

if EVENT == 8558 then
   ShowMap(UID, 585);
end

if EVENT == 8559 then
   Check = CheckExchange(UID, 1001)
   if  Check == true then
   RunExchange(UID, 1001);
   SaveEvent(UID, 9047);
   SaveEvent(UID, 9053);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------��� ���� ��� ��-------
-------------------------------

-------------------------------
--------��� ��� ���---------
-------------------------------

if EVENT == 9000 then
   SelectMsg(UID, 1, 868, 8000, NPC, 14, 9001);
end

if EVENT == 9001 then
   SaveEvent(UID, 9081);
end

local MonsterSub = 0;

if EVENT == 9002 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
	SelectMsg(UID, 2, 239, 8013, NPC, 10, 9010);
   else-- ���� ���� ����Ʈ�� ������
 	SelectMsg(UID, 2, 239, 8399, NPC, 10, 153);
	end
end

if EVENT == 9010 then
   SelectMsg(UID, 4, 239, 8014, NPC, 22, 9003, 23, 9004);
end

if EVENT == 9003 then
   SaveEvent(UID, 9082);
end

if EVENT == 9004 then
   SaveEvent(UID, 9085);
end

-- ��� �Ϸ�� �õ�� �̼��� ����

if EVENT == 9005 then
   SelectMsg(UID, 1, 868, 8003, NPC, 3014, 153);
   SaveEvent(UID, 9084);
end

local MonsterCount = 0;

if EVENT == 9007 then
   MonsterCount  = CountMonsterQuestSub(UID, 32001);
   if  MonsterCount < 250 then -- ����� ��������
      SelectMsg(UID, 2, 239, 8402, NPC, 10, 9008);
   else-- ����� �Ϸ� �Ǿ����� 
      SelectMsg(UID, 4, 239, 8220, NPC, 10, 9009, 27, 153);
   end
end

if EVENT == 9008 then
   ShowMap(UID, 519);
end

if EVENT == 9009 then
   Check = CheckExchange(UID, 942)
   if  Check == true then
   RunExchange(UID, 942);
   SaveEvent(UID, 9083);
   SaveEvent(UID, 9089);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------��� ��� ��� ��-------
-------------------------------
--Sheriff hunt
if EVENT == 9470 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9555);
     EVENT = 9471
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9560);
     EVENT = 9471
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9565);
     EVENT = 9471
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9570);
     EVENT = 9471
   end
end
if EVENT == 9471 then
    SelectMsg(UID, 1, 915, 8764, 24430, 3014, 193);
end

local MonsterSub = 0;

if EVENT == 9472 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 221, 8764, 24430, 10, 9475);
	else-- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 221, 8764, 24430, 10, 193);
   end
end

if EVENT == 9475 then
    SelectMsg(UID, 4, 221, 8764, 24430, 22, 9473, 23, 9474);
end

if EVENT == 9473 then --������
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9556);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9561);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9566);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9571);
   end
end

if EVENT == 9474 then    SaveEvent(UID, 9559);
end


-- ��Ḧ �� ������� �õ� �� ���� 

if EVENT == 9480 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9558);
   EVENT = 9482
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9563);
   EVENT = 9482
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9568);
   EVENT = 9482
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9573);
   EVENT = 9482
   end
end

if EVENT == 9482 then
   SelectMsg(UID, 1, 915, 8764, 24430, 3002, 193);
end

if EVENT == 9476 then
    MonsterCount  = CountMonsterQuestSub(UID, 32001);
    if  MonsterCount < 80 then -- ����� ��������
     SelectMsg(UID, 2, 221, 8764, 24430, 10, 9477);
    else -- ����� �Ϸ� �Ǿ����� 
     SelectMsg(UID, 4, 221, 8764, 24430, 10, 9478, 27, 193);
    end
end

if EVENT == 9477 then
   ShowMap(UID, 621);
end

local Check;

if EVENT == 9478 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1033)
        if  Check == true then        
   RunExchange(UID, 1122);
   SaveEvent(UID, 9557);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1034)
        if  Check == true then        
   RunExchange(UID, 1123);
   SaveEvent(UID, 9562);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1035)
        if  Check == true then        
   RunExchange(UID, 1124);
   SaveEvent(UID, 9567);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1036)
        if  Check == true then        
   RunExchange(UID, 1125);
   SaveEvent(UID, 9572);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
--Sheriff hunt
--Garuna hunt
if EVENT == 9490 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9597);
     EVENT = 9491
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9602);
     EVENT = 9491
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9607);
     EVENT = 9491
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9612);
     EVENT = 9491
   end
end
if EVENT == 9491 then
    SelectMsg(UID, 1, 917, 8766, 24430, 3014, 193);
end

local MonsterSub = 0;

if EVENT == 9492 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 231, 8766, 24430, 10, 9495);
	else-- ���� ���� ����Ʈ�� ������
    SelectMsg(UID, 2, 231, 8766, 24430, 10, 193);
   end
end

if EVENT == 9495 then
    SelectMsg(UID, 4, 231, 8766, 24430, 22, 9493, 23, 9494);
end

if EVENT == 9493 then --������
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9598);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9603);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9608);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9613);
   end
end

if EVENT == 9494 then    SaveEvent(UID, 9601);
end


-- ��Ḧ �� ������� �õ� �� ���� 

if EVENT == 9500 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9600);
   EVENT = 9502
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9605);
   EVENT = 9502
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9610);
   EVENT = 9502
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9615);
   EVENT = 9502
   end
end

if EVENT == 9502 then
   SelectMsg(UID, 1, 917, 8766, 24430, 3002, 193);
end

if EVENT == 9496 then
    MonsterCount  = CountMonsterQuestSub(UID, 32001);
    if  MonsterCount < 50 then -- ����� ��������
     SelectMsg(UID, 2, 231, 8766, 24430, 10, 9497);
    else -- ����� �Ϸ� �Ǿ����� 
     SelectMsg(UID, 4, 231, 8766, 24430, 10, 9498, 27, 193);
    end
end

if EVENT == 9497 then
   ShowMap(UID, 625);
end

local Check;

if EVENT == 9498 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1033)
        if  Check == true then        
   RunExchange(UID, 1130);
   SaveEvent(UID, 9599);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1034)
        if  Check == true then        
   RunExchange(UID, 1131);
   SaveEvent(UID, 9604);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1035)
        if  Check == true then        
   RunExchange(UID, 1132);
   SaveEvent(UID, 9609);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1036)
        if  Check == true then        
   RunExchange(UID, 1133);
   SaveEvent(UID, 9614);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
--Garuna hunt
return Ret;