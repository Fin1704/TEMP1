--Timer mçi server
--ThisFile mçi phót sÏ ch¹y duy nhÊt 1 lÇn
-- new edited version 21/9/2020
Include("\\script\\lockprogram.lua");
Include("\\script\\headers\\tasklist.lua");
Include("\\script\\headers\\globallist.lua");
Include("\\script\\missions\\great_night\\genfruit.lua");
Include("\\script\\missions\\flowerlantern\\create_lanterns.lua");
Include("\\script\\missions\\battle\\battlemain.lua");
Include("\\script\\headers\\globaltimer.lua");
Include("\\script\\headers\\missionv\\blh.lua");
Include("\\script\\missions\\kingwar\\header.lua");
Include("\\script\\missions\\npc_obesity\\gennpc.lua");

TCHSCRIPT_NPC_DEATH 	= FileName2Id("\\script\\missions\\timechallenge\\npc_death.lua")
defSELFSVTIMERID = FileName2Id("\\script\\servertimer.lua")
defQK0209_HELPER = FileName2Id("\\script\\event\\quockhanh0209\\helper.lua")
function OnServerTimer()
	ExeScript(defQK0209_HELPER, 0, "QK_CheckAndSpawnTuong")
	local Y,M,D,H,Mn,S = GetDate();
	local AryNum = H+1;
	if(All_CfgTimer[AryNum] ~= nil) then
		for i=1,getn(All_CfgTimer[AryNum]) do
			if (Mn == All_CfgTimer[AryNum][i][1]) then
			All_CfgTimer[AryNum][i][2]()
			end
		end
	end
	if(Mn ~= 0 and mod(Mn,5) == 0) then
		ServerGuideInfo()
	end
	local svid = GetServerIdx();
	--reset ®¸nh dÊu chat mçi 10 phót
	if(mod(Mn,10) == 0) then
		SubWorld = SubWorldID2Idx(53)
		if(SubWorld >= 0) then
			for i=MSVBIT_JUSTCHATWALK_BEGIN,MSVBIT_JUSTCHATWALK_END do
			SetMissionV(i,0)
			end
			for i=MSVBIT_JUSTCHATFIGHT_BEGIN,MSVBIT_JUSTCHATFIGHT_END do
			SetMissionV(i,0)
			end
			SetMissionV(MSVBLH_WORLDCHAT_USEID,GetMissionV(MSVBLH_WORLDCHAT_USEID)+1)
			SetMissionV(MSVBLH_FIGHTCHAT_WNUM,0)
		end
		for t=1,getn(BTLMAPTYPE) do
			for m=1,getn(BTLMAPTYPE[t]) do
				SubWorld = SubWorldID2Idx(BTLMAPTYPE[t][m])
				if(SubWorld >= 0 and IsMission(BTLMSID) == 1) then
					for i=BTLMSV_JUSTCHAT_BEGIN,BTLMSV_JUSTCHAT_END do
					SetMissionV(i,0)
					end
					SetMissionV(BTLMSV_CHAT_USEID,GetMissionV(BTLMSV_CHAT_USEID)+1)
				end
			end
		end
		for m=323,325 do
			SubWorld = SubWorldID2Idx(m)
			if(SubWorld >= 0) then
				for i=SIGNMSID_JUSTCHATBEGIN,SIGNMSID_JUSTCHATEND do
					SetMissionV(i,0)
				end
			end
		end
	end
	
	if(svid == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn
		if(Mn == 40) then	--phót 40 xÕp h¹ng v­ît ¶i (nÕu cã)
			ExeScript(TCHSCRIPT_NPC_DEATH,0,"tch_sortrank")
		end
	end
	--reset max bang 4 tiÕng (ai)
	if(mod(H,4) == 0 and Mn == 1) then
		SubWorld = SubWorldID2Idx(53)
		if(SubWorld >= 0) then
			SetMissionV(MSVBLH_TOTAL_TCREATE,0)
		end
	end
	---event GS0 chay--------------
	
end;

function Timer_ResetRoleInfo()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeGlobal(GBID_ResetPlayerPerDay)
		--SQLCommand("UPDATE Event SET Value2 = 0 WHERE (Value3 = 2)")	--reset sè l­îng mçi ngµy
	end
end

defSVSCRIPTOBESITY	= FileName2Id("\\script\\missions\\npc_obesity\\gennpc.lua")

function Timer_NpcObesity()
	if(GetServerIdx() == 0) then
		print("Co chay: GetServerIdx");
		local tbMapListObes = {53,78,1,99,37,100,121,80,101,11,20,162,153,174,176};
		local nMapIndex = tbMapListObes[random(1,getn(tbMapListObes))]
		ExeGlobal(GBID_ExeFuncAllSV, defSVSCRIPTOBESITY, 0,"ObstyGenNpcClass("..nMapIndex..")")
		
	
	end
end
function Timer_ActiveBattle(maptype,ruleid)
	local svid = GetServerIdx();
	--local szDay = date("%A")
	--local Y,M,D,H,Mn,S = GetDate();
	--if((szDay == "Friday" or szDay == "Tuesday") and (H == 21)) then
	--ctc disable TK
	--elseif((szDay == "Sunday") and (H == 21)) then
	--	if(svid == 7 or ) then
			--for i=378,386 do
			--	SubWorld = SubWorldID2Idx(i)
			--	if(SubWorld >= 0 and IsMission(1) == 1) then	--thiªn tö ®ang ch¹y
			--		return
			--	end
			--send
			--më TK th­êng
	--		ExeGlobal(GBID_ExeFuncAllSV, defSELFSVTIMERID, 0,"Hand_ActiveBattle("..maptype..","..ruleid..")")
	--	end
	--else
		SetGlbMissionV(GMSV_BATTLETIME, GetCurrentTime());
		if(svid == 7 or svid == 8 ) then
			g_BeginActiveBattle(maptype,ruleid)
		end
	--end
end
function Hand_ActiveBattle(maptype,ruleid)
	local svid = GetServerIdx();
	SetGlbMissionV(GMSV_BATTLETIME, GetCurrentTime());
	if(svid == 7 or svid == 8) then -- 
		g_BeginActiveBattle(maptype,ruleid)
	end
end

function CTTK_TimerActiveBattle21()
	CTTK_FORCE_START_MODE = 1;
	Timer_ActiveBattle(1, BTLRULEID_PROTECT);
	CTTK_FORCE_START_MODE = 0;
end

function CTTK_TimerActiveBattleNormal()
	CTTK_FORCE_START_MODE = 2;
	Timer_ActiveBattle(1, BTLRULEID_PROTECT);
	CTTK_FORCE_START_MODE = 0;
end

function CTTK_TimerEndBattleNow()
	local nEnded = 0;
	local nProtectScript = FileName2Id("\\script\\missions\\battle\\protect\\mstimer.lua");
	local nKingWarScript = FileName2Id("\\script\\missions\\battle\\kingwar\\mstimer.lua");
	for t=1,getn(BTLMAPTYPE) do
		for m=1,getn(BTLMAPTYPE[t]) do
			local nSubWorld = SubWorldID2Idx(BTLMAPTYPE[t][m]);
			if(nSubWorld >= 0) then
				SubWorld = nSubWorld;
				if(IsMission(BTLMSID) == 1) then
					local nRuleId = GetMissionV(BTLMSV_RULEID);
					if(nRuleId == BTLRULEID_PROTECT) then
						ExeScript(nProtectScript, 0, "prt_endgame");
						nEnded = nEnded + 1;
					elseif(nRuleId == BTLRULEID_KINDWAR) then
						ExeScript(nKingWarScript, 0, "kw_endgame");
						nEnded = nEnded + 1;
					end
				end
			end
		end
	end
	if(nEnded <= 0) then
		print("CTTK_TimerEndBattleNow: no active battle mission");
	else
		print("CTTK_TimerEndBattleNow: ended battle count", nEnded);
	end
end
function Timer_StartKingWar()
	if(GetServerIdx() ~= 7) then
		return
	end
	if(ENABLE_KINGWAR > 0) then
		local szDay = date("%A")
		if(szDay == defszDay2Fight) then
			local nTID1 = GetIniInt(defFILEKW,defKWNATIONSEC,"TCampID1");
			local nTID2 = GetIniInt(defFILEKW,defKWNATIONSEC,"TCampID2");
			DelIniSec(defFILEKW,defKWEMPSEC,1)
			if(nTID1 ~= 0 and nTID2 == 0) then	--Tèng ®¨ng c¬
				SetIniInt(defFILEKW,defKWEMPSEC,"WarResult",1,1)
			elseif(nTID1 == 0 and nTID2 ~= 0) then	--Kim ®¨ng c¬
				SetIniInt(defFILEKW,defKWEMPSEC,"WarResult",2,1)
			elseif(nTID1 ~= 0 and nTID2 ~= 0) then	--diÔn ra trËn ®¸nh
				g_BeginActiveBattle(1,2)
			end
		end
	end
end;

defSVSCRIPTLEAGUE	= FileName2Id("\\script\\missions\\league\\startlg.lua")
function Timer_ActiveLeague1()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
		ExeScript(defSVSCRIPTLEAGUE,0,"startleague",1);--sö dông file ®éc lËp
	end
end
function Timer_ActiveLeague2()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
		ExeScript(defSVSCRIPTLEAGUE,0,"startleague",2);--sö dông file ®éc lËp
	end
end
function Timer_ActiveLeague3()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
		ExeScript(defSVSCRIPTLEAGUE,0,"startleague",3);--sö dông file ®éc lËp
	end
end
function Timer_ActiveLeague4()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
		ExeScript(defSVSCRIPTLEAGUE,0,"startleague",4);--sö dông file ®éc lËp
	end
end
function Timer_ActiveLeague5()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	local szDay = date("%A")
	if(szDay == "Friday" or szDay == "Saturday" or szDay == "Sunday") then
		if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
			ExeScript(defSVSCRIPTLEAGUE,0,"startleague",5);--sö dông file ®éc lËp
		end
	end
end
function Timer_ActiveLeague6()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	local szDay = date("%A")
	if(szDay == "Friday" or szDay == "Saturday" or szDay == "Sunday") then
		if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
			ExeScript(defSVSCRIPTLEAGUE,0,"startleague",6);--sö dông file ®éc lËp
		end
	end
end
function Timer_ActiveLeague7()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	local szDay = date("%A")
	if(szDay == "Friday" or szDay == "Saturday" or szDay == "Sunday") then
		if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
			ExeScript(defSVSCRIPTLEAGUE,0,"startleague",7);--sö dông file ®éc lËp
		end
	end
end
function Timer_ActiveLeague8()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	local szDay = date("%A")
	if(szDay == "Friday" or szDay == "Saturday" or szDay == "Sunday") then
		if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
			ExeScript(defSVSCRIPTLEAGUE,0,"startleague",8);--sö dông file ®éc lËp
		end
	end
end
function Timer_ActiveQueryLG()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
		QueryRank(2)
	end
	Msg2SubWorld("<color=yellow>CËp nhËt b¶ng xÕp h¹ng Vâ L©m Liªn §Êu !")
end;
function Timer_ActiveQueryLG2()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	local szDay = date("%A")
	if(szDay == "Friday" or szDay == "Saturday" or szDay == "Sunday") then
		if(GetServerIdx() == 7) then	--chØ cã server G7 ch¹y
			QueryRank(2)
		end
		Msg2SubWorld("<color=yellow>CËp nhËt b¶ng xÕp h¹ng Vâ L©m Liªn §Êu !")
	end
end;
function Timer_SaveLeagueRank()
	if(ENABLE_LEAGUE == 0) then
		return
	end
	if(GetServerIdx() == 0) then	--chØ cã server G0 ch¹y
		for i=0,255 do
		local wPoint, dwTime, btWin, btDraw, btLose, szLeader, szMem1, szMem2, szName = GetTopLeague(i);
		if(wPoint == 0) then
			break
		end
		SetIniStr("liendau.ini","Data","code"..i,"AddLeague("..wPoint..","..dwTime..","..btWin..","..btDraw..","..btLose..",\""..szLeader.."\",\""..szMem1.."\",\""..szMem2.."\",\""..szName.."\")",1)
		end
	end
end;

defSVSCRIPTCHALLENGE	= FileName2Id("\\script\\missions\\timechallenge\\tch_header.lua")
function Timer_ActiveChallenge()
	if(GetServerIdx() == 0) then	
	ExeGlobal(GBID_ExeFuncAllSV, defSVSCRIPTCHALLENGE, 0,"tch_start()")
	end
end

defSVSCRIPTBOATING	= FileName2Id("\\script\\missions\\pld\\mainpld.lua")
function Timer_ActiveBoating()
	ExeScript(defSVSCRIPTBOATING,0,"startboating");--sö dông file ®éc lËp
end

function Timer_GenFruit()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
	mainGlobalGenFruit(0)
	end
end

function Timer_GenGoldFruit()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		mainGlobalGenFruit(1)
	end
end

Include("\\script\\missions\\trongbanghoi\\callnpc.lua");
function Timer_GenDrum()
	if(GetServerIdx() == 7) then	--gs 7 chay
		Duc_CallNpc()
	end
end


function Timer_ActiveLantern()
	lantern_startcreate()
end

defSVSCRIPTGOLDBOSS	= FileName2Id("\\script\\headers\\callboss.lua")
function Timer_ActiveGoldBoss_S1()
	--print("Timer_ActiveGoldBoss_S1")
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",1);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_S2()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		print("Timer_ActiveGoldBoss_S2")
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",2);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_S3()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		print("Timer_ActiveGoldBoss_S3")
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",3);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_S4()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",4);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_S5()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		print("Timer_ActiveGoldBoss_S4")
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",5);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_S6()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		print("Timer_ActiveGoldBoss_S5")
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",6);--sö dông file ®éc lËp
	end
end

function Timer_ActiveGoldBoss_S7()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",7);--sö dông file ®éc lËp
	end
end

function Timer_ActiveGoldBoss_S8()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",8);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_S9()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",9);--sö dông file ®éc lËp
	end
end

function Timer_ActiveGoldBoss_S10()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",10);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_Mix(nNo)--- mix boss dai va boss tieu 
	if(GetServerIdx() == 0) then	--chi server dau tien send global
		if(random(1,2) == 1) then
			ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_S",nNo);
		else	
			ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",nNo);
		end
	end
end
function Timer_ActiveGoldBoss_B1()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",1);--sö dông file ®éc lËp
	end
end

function Timer_ActiveGoldBoss_B2()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",2);--sö dông file ®éc lËp
	end
end

function Timer_ActiveGoldBoss_B3()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",3);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_B4()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",4);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_B5()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",5);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_B6()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",6);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_B7()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",7);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_B8()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",8);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_B9()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",9);--sö dông file ®éc lËp
	end
end
function Timer_ActiveGoldBoss_B10()
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
		ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallBoss_B",10);--sö dông file ®éc lËp
	end
end

function Timer_ActiveSuperBoss()
	--local szDay = date("%A")
	--if(szDay == "Friday" or szDay == "Saturday") then
		--if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn send global, tÊt c¶ server sÏ nhËn sau lÖnh send
			ExeScript(defSVSCRIPTGOLDBOSS,0,"mainGlobalCallSuperBoss");--sö dông file ®éc lËp
		--end
	--end
end;

function Timer_ActiveAlarmBoard()
	if(GetServerIdx() == 7) then	--chØ cã duy nhÊt 1 G7 ch¹y
		local Y,M,D,H,Mn,S = GetDate();
		if( Y == 2026 and M == 7 and D >= 1 and D <= 2 ) then
			local nDay = GetIniInt("champdata.ini","Day","Day");
			if(nDay < 7) then
				nDay = nDay + 1;
				ExeGlobal(GBID_Info2AllServer, 0, 0,"<color=wood>Thiªn H¹ Minh Chñ (Vßng "..nDay..") s¾p diÔn ra. C¸c ®Êu thñ h·y khÈn tr­¬ng gÆp Sø Gi¶ Liªn §Êu vµo héi tr­êng chuÈn bÞ!")
			end
		end
	end
end;

function Timer_ActiveBoardState()
	if(GetServerIdx() == 7) then	--chØ cã duy nhÊt 1 G7 ch¹y
		local Y,M,D,H,Mn,S = GetDate();
		if( Y == 2026 and M == 7 and D >= 15 and D <= 15 ) then
			local nDay = GetIniInt("champdata.ini","Day","Day");
			if(nDay < 7) then
				nDay = nDay + 1;
				SubWorld = SubWorldID2Idx(685);
				if(SubWorld >= 0) then
					CloseMission(1)
					OpenMission(1,"\\script\\missions\\champion\\chptimer.lua")
					StartMissionTimer(1,1,1*60*18)
					StartMissionTimer(1,2,1*60*18)
					ExeGlobal(GBID_Info2AllServer, 0, 0,"<color=wood>Thiªn H¹ Minh Chñ (Vßng "..nDay..") ®ang b¸o danh thi ®Êu. C¸c ®Êu thñ xin nhanh chãng vµo ®Êu tr­êng tham chiÕn!")
				end
			end
		end
	end
end;

function Timer_ActiveSMFNState(nType)
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 G0 ch¹y
		local Y,M,D,H,Mn,S = GetDate();
		if(nType <= 2) then
			if(Y == 2026 and M == 7 and D == 16) then --B¸n KÕt
				SubWorld = SubWorldID2Idx(209)
				if(SubWorld < 0) then
					return
				end
				CloseMission(1)
				OpenMission(1,"\\script\\missions\\champion\\smtimer.lua");
				StartMissionTimer(1,1,1*60*18)
				StartMissionTimer(1,2,1*60*18)
				SetMissionV(13,0)	--MSVSM_MSCAPDATA1
				SetMissionV(14,0)	--MSVSM_MSCAPDATA2
				SetMissionV(15,nType)	--MSVSM_MATCHTYPE
				ExeGlobal(GBID_Info2AllServer, 0, 0,"<color=wood>Thiªn H¹ Minh Chñ [B¸n KÕt "..nType.."] b¾t ®Çu b¸o danh. C¸c ®Êu thñ nhanh chãng gÆp C«ng B×nh Tö T­¬ng D­¬ng ®Ó vµo ®Êu tr­êng!")
			end
		elseif (nType == 3) then
			if(Y == 2026 and M == 7 and D == 16) then	--TrËn tranh 3 - 4
				SubWorld = SubWorldID2Idx(209)
				if(SubWorld < 0) then
					return
				end
				CloseMission(1)
				OpenMission(1,"\\script\\missions\\champion\\smtimer.lua");
				StartMissionTimer(1,1,1*60*18)
				StartMissionTimer(1,2,1*60*18)
				SetMissionV(13,0)	--MSVSM_MSCAPDATA1
				SetMissionV(14,0)	--MSVSM_MSCAPDATA2
				SetMissionV(15,nType)	--MSVSM_MATCHTYPE
				ExeGlobal(GBID_Info2AllServer, 0, 0,"<color=wood>Thiªn H¹ Minh Chñ [TrËn tranh 3 - 4] b¾t ®Çu b¸o danh. C¸c ®Êu thñ nhanh chãng gÆp C«ng B×nh Tö T­¬ng D­¬ng ®Ó vµo ®Êu tr­êng!")
			end
		else
			if(Y == 2026 and M == 7 and D == 16) then	--chung kÕt
				SubWorld = SubWorldID2Idx(209)
				if(SubWorld < 0) then
					return
				end
				CloseMission(1)
				OpenMission(1,"\\script\\missions\\champion\\smtimer.lua");
				StartMissionTimer(1,1,1*60*18)
				StartMissionTimer(1,2,1*60*18)
				SetMissionV(13,0)	--MSVSM_MSCAPDATA1
				SetMissionV(14,0)	--MSVSM_MSCAPDATA2
				SetMissionV(15,nType)	--MSVSM_MATCHTYPE
				ExeGlobal(GBID_Info2AllServer, 0, 0,"<color=wood>Thiªn H¹ Minh Chñ [Chung KÕt] b¾t ®Çu b¸o danh. C¸c ®Êu thñ nhanh chãng gÆp C«ng B×nh Tö T­¬ng D­¬ng ®Ó vµo ®Êu tr­êng!")
			end
		end
	end
end;

defSCRIPTID_FLISLAND = FileName2Id("\\script\\missions\\flisland\\timer.lua");
function Timer_ActiveCollStone()
	ExeScript(defSCRIPTID_FLISLAND, 0, "gen_flisland_mine")
end;

function Timer_DealLuckyNumber()
	if(GetServerIdx() == 0) then	--chØ GS0 xæ sè
		local curVersion = SQLCommandV("SELECT Value1 FROM Event WHERE (Name = 'PQCH_VER')");
		SQLCommand("UPDATE Event SET Value1 = Value1+1,Value2 = 0 WHERE (Name = 'PQCH_VER')");
		SetIniInt("RichBox.ini","Data","Version",curVersion+1,1)
		local tbExistNum = {};
		for i=1,10 do
			local tbSelNum = {};
			for n=10,99 do
				local bHave = 0;
				for k=1,getn(tbExistNum) do
					if(tbExistNum[k] == n) then
						bHave = 1;
						break
					end
				end
				if(bHave == 0) then
					tinsert(tbSelNum,n)
				end
			end
			tbExistNum[i] = tbSelNum[random(getn(tbSelNum))];
			SetIniInt("RichBox.ini","Data","Ret"..i,tbExistNum[i],1)
		end
		ExeGlobal(GBID_Info2AllServer, 0, 1,"Vßng thi <color=wood>Dù ®o¸n con sè may m¾n<color> c«ng bè kÕt qu¶. Xin ®Õn <color=pink>Sßng B¹c<color> t¹i thÊt ®¹i thµnh thÞ xem chi tiÕt vµ nhËn gi¶i th­ëng.")
	end
end;

function Timer_NewBattleWeekTop()
	if(GetServerIdx() == 7) then	--chØ GS7 reset
		local szDay = date("%A")
		if(szDay == "Sunday") then
			DelIniSec(defszBTLTopFile,"WeekTop",1)
			local tbUpdate = {};
			for i=1,10 do
				tbUpdate[i] = {}
				tbUpdate[i][1] = GetIniInt(defszBTLTopFile,"Update","Point"..i);
				tbUpdate[i][2] = GetIniStr(defszBTLTopFile,"Update","Name"..i);
			end
			for i=1,10 do
				if(tbUpdate[i][1] == 0) then
					break
				end
				SetIniInt(defszBTLTopFile,"WeekTop","Point"..i, tbUpdate[i][1], 1) --save trùc tiÕp (1)
				SetIniStr(defszBTLTopFile,"WeekTop","Name"..i, tbUpdate[i][2], 1) --save trùc tiÕp (1)
			end
			DelIniSec(defszBTLTopFile,"Update",1)
			ExeGlobal(GBID_Info2AllServer, 0, 1,"<color=metal>CËp nhËt B¶ng xÕp h¹ng TuÇn tÝch lòy Tèng Kim. C¸c chiÕn sÜ xuÊt s¾c cã thÓ ®Õn Qu©n Nhu Quan ®Ó nhËn l·nh phÇn th­ëng.")
		end
	elseif(GetServerIdx() == 0) then	--chØ GS0 set thµnh CTC tuÇn kÕ
		if(ENABLE_CITYWAR == 0) then
			return
		end
		local szDay = date("%A")
		if(szDay == "Sunday") then
			local nCity = GetIniInt("tong\\CityWar.ini","Info","NextCity") + 1;
			if(nCity >= 4) then
				nCity = 0;
			end
			SetIniInt("tong\\CityWar.ini","Info","NextCity",nCity,1)
		end
	end
end;

function Timer_CW_OpenChallenge()	--b¾t ®Çu clear list khiªu chiÕn lÖnh cña thµnh nCity
	if(ENABLE_CITYWAR == 0) then
		return
	end
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn
		local szDay = date("%A");
		if(szDay == "Thursday" or szDay == "Monday") then
			local bHaveWar = 1;
			local nCity = GetIniInt("tong\\CityWar.ini","Info","NextCity");
			if(nCity < 0 or nCity >= 4) then
				nCity = 0;
			end
			if(nCity == 0) then
				if(szDay == "Thursday") then
					nCity = 0;
				else
					nCity = 2;
				end
			elseif(nCity == 1) then
				if(szDay == "Thursday") then
					nCity = 1;
				else
					nCity = 3;
				end
			elseif(nCity == 2) then
				if(szDay == "Thursday") then
					nCity = 4;
				else
					nCity = 5;
				end
			else
				if(szDay == "Thursday") then
					nCity = 6;
				else
					bHaveWar = 0;
				end
			end
			if(bHaveWar == 1) then
				DelIniSec("tong\\CityWar.ini",nCity,1)
				ExeGlobal(GBID_Info2AllServer, 0, 1,"<color=green>C«ng thµnh chiÕn "..tbCityWar[nCity][2].."<color> b¾t ®Çu b¸o danh tõ 18h00 ®Õn 19h00. Bang chñ cã thÓ ®Õn C«ng Thµnh Quan tranh ®ua Khiªu ChiÕn LÖnh.")
			end
		end
	end
end;

defCITYWAR_SIGN = FileName2Id("\\script\\missions\\citywar\\sign.lua");
function Timer_CW_CloseChallenge()	--chèt list khiªu chiÕn lÖnh cña thµnh nCity
	if(ENABLE_CITYWAR == 0) then
		return
	end
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn
		local szDay = date("%A");
		if(szDay == "Thursday" or szDay == "Monday") then
			local bHaveWar = 1;
			local nCity = GetIniInt("tong\\CityWar.ini","Info","NextCity");
			if(nCity < 0 or nCity >= 4) then
				nCity = 0;
			end
			if(nCity == 0) then
				if(szDay == "Thursday") then
					nCity = 0;
				else
					nCity = 2;
				end
			elseif(nCity == 1) then
				if(szDay == "Thursday") then
					nCity = 1;
				else
					nCity = 3;
				end
			elseif(nCity == 2) then
				if(szDay == "Thursday") then
					nCity = 4;
				else
					nCity = 5;
				end
			else
				if(szDay == "Thursday") then
					nCity = 6;
				else
					bHaveWar = 0;
				end
			end
			if(bHaveWar == 1) then
				ExeScript(defCITYWAR_SIGN, 0, "CloseChallenge",nCity)
			end
		end
	end
end;

function Timer_CW_StartOpenWar()
	if(ENABLE_CITYWAR == 0) then
		return
	end
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn
		local szDay = date("%A");
		if(szDay == "Friday" or szDay == "Tuesday") then
			ExeScript(defCITYWAR_SIGN, 0, "StartCityWar",szDay)
		end
	end
end;

defSCRIPTMSEOBSFILE = FileName2Id("\\script\\missions\\museum\\obstacle.lua")
function Timer_MSE_Open()
	if(ENABLE_MUSEUM == 0) then
		return
	end
	Msg2SubWorld("<color=pink>B¶o Tµng Viªm §Õ<color> ®· cho b¸o danh. C¸c chiÕn ®éi h·y nhanh chãng ®Õn BiÖn Kinh - B×nh B×nh c« n­¬ng ®Ó tham gia. Thêi gian b¸o danh lµ 5 phót.","","",1)
	if(GetServerIdx() ~= 2) then	--biÖn kinh
		return
	end
	AddGlobalCountNews("Ho¹t ®éng v­ît ¶i B¶o Tµng Viªm §Õ ®· b¾t ®Çu b¸o danh råi. ChiÕn ®éi h·y nhanh chãng ®Õn B×nh B×nh c« n­¬ng ë BiÖn Kinh ®Ó ®¨ng ký, thêi gian b¸o danh lµ 5 phót.",1,0)
	for i=851,862 do
		SubWorld = SubWorldID2Idx(i);
		CloseMission(1)
		ClearMissionV()
		if(i ~= 862) then
			ExeScript(defSCRIPTMSEOBSFILE,0,"gClearObjObstacle")
		else
			ExeScript(defSCRIPTMSEOBSFILE,0,"gClearFinalPKObs")
			ExeScript(defSCRIPTMSEOBSFILE,0,"gClearFinalPKTraps")
		end
	end
	SubWorld = SubWorldID2Idx(851);
	OpenMission(1,"\\script\\missions\\museum\\readymap.lua")
	StartMissionTimer(1,1,5*60*18)	--5p
	StartMissionTimer(1,2,30*18)	--30s thong bao
	StartMissionTimer(1,3,18)	--1s quet khoa ruong
	DelIniSec("mse_prize.ini","Data",1)	--file th­ëng xu
end;

defHSBATTLE_OPENFILE = FileName2Id("\\script\\missions\\hsbattle\\openbattle.lua");
function Timer_ActiveHSBalle()
	if(ENABLE_HSBATTLE == 0) then
		return
	end
	if(GetServerIdx() ~= 1) then	--ph­îng t­êng
		return
	end
	ExeScript(defHSBATTLE_OPENFILE, 0, "StartHSBattle")
end;

defBRACE_OPENFILE = FileName2Id("\\script\\missions\\race\\openrace.lua");
function Timer_ActiveBoatRace()
	if(ENABLE_BOATRACE == 0) then
		return
	end
	if(GetServerIdx() ~= 0) then	--t­¬ng d­¬ng
		return
	end
	ExeScript(defBRACE_OPENFILE, 0, "OpenBoatRace")
end;

STATIC_INFOID = 1;
STATIC_INFOSTRING = {
--"<color=metal>Trang chñ: vennguyenkyuc.vn/<enter>Fanpage: facebook.com/...<enter>Nhãm trao ®æi: facebook.com/groups/...",
"<color=0xfb7701>HÖ thèng nhiÖm vô ®­îc cËp nhËt trong b¶ng H­íng dÉn nhiÖm vô. NhÊn F12 ®Ó theo dâi vµ ®i ®Õn n¬i lµm nhiÖm vô.",
--"<color=0xfb7701>H»ng ngµy b¹n cã thÓ nhËn Phóc Duyªn t¹i Vâ L©m TruyÒn Nh©n dùa trªn thêi gian trùc tuyÕn. Sö dông Phóc Duyªn t¹i cöa hµng ThÇn BÝ th­¬ng nh©n T­¬ng D­¬ng",
--"<color=0xfb7701>Cöa hµng ®iÓm Tinh Lùc vµ c¸c ®¹o cô cÇn thiÕt t¹i Hµng Rong c¸c thµnh thÞ. §iÓm Tinh Lùc b¹n cã thÓ nhËn ®­îc khi tham gia c¸c ho¹t ®éng.",
"<color=0xfb7701>TiÒn Trang nhËn cÊt gi÷ VËt phÈm, trao ®æi Kim Nguyªn B¶o vµ TiÒn §ång. T×m TiÒn Trang t¹i thÊt ®¹i thµnh thÞ.",
--"<color=wood>LÔ Quan t¹i c¸c thµnh thÞ th«n trÊn phô tr¸ch th«ng tin vµ phÇn th­ëng §iÓm Toµn N¨ng.",
--"<color=0xfb7701>ThËp ®¹i m«n ph¸i th«ng c¸o tiÕn hµnh thÝ luyÖn nhiÖm vô m«n ph¸i. B¹n cã thÓ t×m c¸c Ch­ëng M«n th«ng qua Hµnh HiÖp LÖnh.",
"<color=yellow>L­u ý tõ nhµ ph¸t hµnh VÑn Nguyªn Ký øc: vËt phÈm, ®¬n vÞ ¶o, ®iÓm th­ëng chØ cã gi¸ trÞ tr¶i nghiÖm trong game, kh«ng ®­îc phÐp quy ®æi thµnh tiÒn, thÎ viÔn th«ng, ng©n hµng hay c¸c hiÖn vËt cã gi¸ trÞ bªn ngoµi theo quy ®Þnh cña ph¸p luËt.",

};

function ServerGuideInfo()
	local infonum = getn(STATIC_INFOSTRING)
	if(infonum <= 0) then
		return
	end
	if(STATIC_INFOID > infonum) then
		STATIC_INFOID = 1
	end
	Msg2SubWorld(STATIC_INFOSTRING[STATIC_INFOID])
	STATIC_INFOID = STATIC_INFOID + 1
end;

tbCityWar={
[0]={78,"T­¬ng D­¬ng"},
[1]={1,"Ph­îng T­êng"},
[2]={37,"BiÖn Kinh"},
[3]={80,"D­¬ng Ch©u"},
[4]={11,"Thµnh §«"},
[5]={162,"§¹i Lý"},
[6]={176,"L©m An"},
};