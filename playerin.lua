--player §¨ng nhËp, hoÆc míi chuyÓn server
-- biªn so¹n
Include("\\script\\lockprogram.lua");
Include("\\script\\headers\\tasklist.lua");
Include("\\script\\headers\\globallist.lua");
Include("\\script\\headers\\math.lua");
Include("\\script\\headers\\taskguide.lua");
Include("\\script\\headers\\facdeclare.lua");
Include("\\script\\players\\ai\\train\\sharehead.lua");
Include("\\script\\tong\\tongheadmini.lua");
Include("\\script\\players\\levelup.lua");
Include("\\script\\npcs\\common\\newgamer.lua");
Include("\\script\\players\\guinewbie.lua");
Include("\\script\\maps\\newworldscript.lua");
Include("\\script\\item\\dachengmiji_90.lua");
Include("\\script\\event\\30042026\\header.lua"); --- event 30/4
Include("\\script\\rankcontrol\\func.lua")
Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
Include("\\script\\event\\trungthu\\helper.lua"); -- event Trung Thu
Include("\\script\\event\\quockhanh0209\\helper.lua"); -- event Quoc Khanh
Include("\\script\\item\\bikip_vctt.lua"); -- event Vu Lan

function main()
	ActiveGM(1)
	local myname = GetName()
	--if((strbyte(myname, 1) == 71 and strbyte(myname, 2) == 77)		--"GM"
	--if (GetAccount() == "thaivanlan") --tªn acc chÝnh x¸c 
	if((GetAccount() == "lamhuynh") --tªn acc chÝnh x¸c 
	or (GetAccount() == "mrthai")
	or (GetAccount() == "baobao92")
	or (GetAccount() == "aly1")
	or (GetAccount() == "abcvlz")
	or (GetAccount() == "emcas2")
	or (GetAccount() == "phucdaubu")
	) then
		ActiveGM(1)
	end
	
	Msg2Player("<color=yellow>L­u ý tõ nhµ ph¸t hµnh VÑn Nguyªn Ký øc: vËt phÈm, ®¬n vÞ ¶o, ®iÓm th­ëng chØ cã gi¸ trÞ tr¶i nghiÖm trong game, kh«ng ®­îc phÐp quy ®æi thµnh tiÒn, thÎ viÔn th«ng, ng©n hµng hay c¸c hiÖn vËt cã gi¸ trÞ bªn ngoµi theo quy ®Þnh cña ph¸p luËt.")

	------------Event 30-4--------------
	--if TimeMinute() < Date2Min(EVENT_3004_ENDDATE[1],EVENT_3004_ENDDATE[2],EVENT_3004_ENDDATE[3],EVENT_3004_ENDDATE[4],EVENT_3004_ENDDATE[5]) then
	--	local szDir = format("%s%s.ini",def_event_data,GetAccount())
	--	local TimeState  = GetIniInt(szDir, "Main" , "TIME_LCCT");	
	--	if TimeState > TimeMinute() then
	--		SetTimer(10*18, TIMERID_LACOCHIENTHANG);	--10s sau b¾t ®Çu h­ëng kinh nghiÖm	
	--	else	
			-- SetRankEx(0,1);
	--		SetIniStr(szDir,"Main" , "TIME_LCCT" , 0, 1);  ---- reset thêi gian
	--	end
	--else
	--	SetRankEx(0,1);
	--end
	----------------------------------------
	
	local nW,_,_ = GetWorldPos()
	g_CheckOnMap(nW)
	
	
	
	g_EditTasks()
	local nAIType = AIGetType();
	if(ENABLE_TESTGAME > 0) then	--®ang thêi gian test game
		local nbitTask = GetTask(TASKBIT_GETPRIZE)
		if(GetBit(nbitTask,31) == 0) then
			SetTask(TASKBIT_GETPRIZE, SetBit(nbitTask,31,1))
			local idx=AddItemTemp(0,6,3,4970,0,5,0)		--Hµnh hiÖp lÖnh
			LockItem(idx)
			AddItemIdx(idx)
			if(GetRepute() == 0) then
			AddLeadExp(9999999)	--d­ søc lËp bang
			AddRepute(2000)
			AddGrace(5000)
			AddSJPoint(20000)
			Msg2Player("Chµo mõng b¹n tham gia thö nghiÖm. Chóc quý nh©n sü thËt nhiÒu niÒm vui!")
			Msg2Player("B¹n nhËn ®­îc: TÝch lòy Tèng Kim:<color=green>20.000<color>, Phóc duyªn:<color=green>5.000<color>, Danh väng:<color=green>2.000")
			end
		end
	else		--®· open
		if(EN_SUPPORT_NEWBIE > 0) then	--hç trî ng­êi míi t¹o c¸i g× ®ã
			if(GetLevel() < 60) then
				SetLevel(60)
				Earn(1000)	--mua vò khÝ cÊp 1
			end
		end
		--söa danh hiÖu m«n ph¸i sai ----------
		--local fact = GetFactionNum();
		--if(nAIType == 0 and fact >= 0 and tbFACRANKID[fact]) then
		--	if(GetRank() ~= tbFACRANKID[fact]) then
		--		SetRank(tbFACRANKID[fact]);
		--	end
		--end
		---------------------------------------------
	end
	
	ngm_sp_it()
	
	local Y,M,D,H,Mn,S = GetDate();
	local nCurMin = TimeMinute();
	local nTask = GetTask(TASKVALUE_DATE)
	local nV1 = GetByte(nTask,1)--day
	local nV2 = GetByte(nTask,2)--month
	local nV3 = GetByte(nTask,3) + 2000;--year
	local nV4 = GetByte(nTask,4)	--ngµy khÝ doanh
	if(nV1 ~= D or nV2 ~= M or nV3 ~= Y) then
		nTask = SetByte(nTask,1,D)
		nTask = SetByte(nTask,2,M)
		nTask = SetByte(nTask,3,Y-2000)
		if(nV4 > 0) then nV4 = nV4-1 end
		nTask = SetByte(nTask,4,nV4)
		SetTask(TASKVALUE_DATE,nTask)
		SetTask(TASKVALUE_PLAYMINUTE,0)
		SetTask(TASKCLEARDAY_1,0)
		SetTask(TASKCLEARDAY_2,0)
		SetTask(TASKCLEARDAY_3,0)
		SetTask(TASKCLEARDAY_4,0)
		SetTask(TASKCLEARDAY_5,0)
		SetTask(TASKCLEARDAY_6,0)
		SetTask(TASKCLEARDAY_7,0)
		SetTask(TASKCLEARDAY_8,0)
		SetTask(TASKCLEARDAY_9,0)
		SetTask(TASKCLEARDAY_10,0)
		SetTask(TASKCLEARDAY_11,0)
		SetTask(TASKCLEARDAY_12,0)
		SetTask(TASKCLEARDAY_13,0)
		SetTask(TASKCLEARDAY_14,0)
		SetTask(TASKCLEARDAY_15,0)
		SetTask(TASKCLEARDAY_16,0)
		SetTask(TASKVALUE_EXP_DAY,0)
		SetTask(TASKVALUE_LIMITITEM_SP,0)
		SetTask(TASKCLEARDAY_17,0)	
		--- event thieu nhi
		SetTask(TASK2_CLEAR_EVENT0106, Set4Cell(GetTask(TASK2_CLEAR_EVENT0106), 2, 0)); -- reset nap thieu bang hoi event thieu nhi 
		Duc_ResetEventThieuNhi(); --- Het h¹n event 0106 th× reset 
		---------------------
		--- event quoc khanh
		QK_ResetDaily();
		QK_ResetEvent();
		------------------
		
		--SetTask(TASKVALUE_LIMITITEM_BATTLE,0)
		--Msg2Player("Reset day");
	end
	
	if(nV4 > 0) then	--add khÝ doanh
		AddSkillState(MER_BREATHSKILLS[GetSeries()],1,1,nV4*86400*18);
	end
	--state special
	nTask = GetTask(TASKVALUE_STATE1)
	local nTask2 = GetTask(TASKVALUE_STATE2)
	nV1 = Get4Cell(nTask,1)--TSBL
	nV2 = Get5Cell(nTask,2)--TTL
	nV3 = Get4Cell(nTask2,1)--BQL
	nV4 = Get4Cell(nTask2,2)--QHT
	local nV5 = Get1Cell(nTask2,9)--TTL lv
	if(nV1 > 0) then
		AddSkillState(441,1,1,nV1*18)
	end
	if(nV2 > 0 and nV5 > 0) then
		AddSkillState(440,nV5,1,nV2*18)
	end
	if(nV3 > 0) then
		AddSkillState(442,1,1,nV3*18)
	end
	if(nV4 > 0) then
		AddSkillState(450,1,1,nV4*18)
	end
	nTask = GetTask(TASKVALUE_STATE3)
	nV1 = Get2Cell(nTask,2)--luyÖn skill lv
	nV2 = Get5Cell(nTask,2)--luyÖn gi©y
	if(nV1 > 0 and nV2 > 0) then
		AddSkillState(799,nV1,1,nV2*18)
	end
	
	nTask = GetTask(TASKVALUE_STATE4)
	nV1 = Get5Cell(nTask,1)--phsl+nl20 time
	nV2 = Get1Cell(nTask,6)--level phsl x5 (src/5)
	if(nV1 > 0 and nV2 > 0) then
		AddSkillState(1485,nV2*5,1,nV1*18)
	else
		local nTask = GetTask(TASKVALUE_STATE6)
		local statetime = Get5Cell(nTask,1)
		local statelv = Get1Cell(nTask,6)
		if(statetime > 0) then
			AddSkillState(1485,statelv*5,1,statetime*18)
			nTask = Set5Cell(nTask,1,0)
			nTask = Set1Cell(nTask,6,0)
			SetTask(TASKVALUE_STATE6,nTask)
		end
	end
	nTask = GetTask(TASKVALUE_STATE5)
	nV1 = Get4Cell(nTask,1)--thien co lenh giay
	if(nV1 > 0) then
		AddSkillState(707,1, 1, nV1*18);
	end
	nV1 = Get1Cell(nTask,5)--tÝn sø yªu bµi id number
	nV2 = Get1Cell(nTask,6)--tÝn sø yªu bµi lv
	nV3 = Get3Cell(nTask,3)--tÝn sø yªu bµi 5 gi©y
	if(nV2 > 0 and nV3 > 0 and nV1 >= 0 and nV1 <= 4) then
		AddSkillState(nV1+631,nV2, 1, nV3*90);
	end
	nTask = GetTask(TASKVALUE_STATE6)
	nTask2 = GetTask(TASKVALUE_STATE7)
	nV1 = Get2Cell(nTask,4)--x kn level
	nV2 = Get5Cell(nTask2,1)--x kn gi©y
	if(nV1 > 0 and nV2 > 0) then
		AddSkillState(623,nV1,1,nV2*18)
	end
	-------danh hiÖu---vßng s¸ng----
	nV1 = Get1Cell(nTask2,9)	--kiÓu vßng s¸ng quèc chñ 0; thiªn tö 1
	nTask = GetTask(TASK_NEXTTIME_5)
	nTask2 = Get4Cell(GetTask(TASKVALUE_XRANK),1)
	if(nTask > 0 and nTask < nCurMin) then
		SetRankEx(0,1)	--xãa danh hiÖu
		SetTask(TASK_NEXTTIME_5,0)
	elseif(nTask > 0) then
		if(nTask2 == 62) then
			AddSkillState(3195, 1, 1, -1)
		elseif(nTask2 == 333) then
			AddSkillState(3203, 1, 1, -1)
		end
	end
	nTask = GetTask(TASK_NEXTTIME_9)
	if(nTask > nCurMin) then
		if(nV1 == 0) then
			AddSkillState(3155, 1, 1, -1)
		else	--1
			AddSkillState(3156, 1, 1, -1)
		end
	end
	--------------------------
	if(nAIType > 0) then
		local loopchattime = GetTask(TASK_NEXTTIME_4)
		if((loopchattime > 0) and (loopchattime < nCurMin)) then
			ExeScript(defSCRIPT_CHATID, 0, "g_ResetLoop")
		end
	end
	g_RequestTaskguide()
	g_ReAddSpecialMapSetting()
	nTask = GetTask(TASKCLEARDAY_5)
	if(Get1Cell(nTask,6) == 1) then
		SetTask(TASKCLEARDAY_5,Set1Cell(nTask,6,0))
		Say("NÕu nh­ ng­¬i ®· muèn gia nhËp bæn m«n, sau nµy ph¶i chuyªn t©m mµ khæ luyÖn, sím cã ngµy ngé ra ®­îc tuyÖt kü vâ häc.",0)
	elseif(nAIType == 0 and GetClientVersion() < REQ_CLIENT_VERSION) then
		Msg2Player("<color=green>B¹n ®ang ë phiªn b¶n cò. Vui lßng t¾t cöa sæ. Ch¹y AUTOUPDATE (hoÆc t¶i l¹i Patch) ®Ó n©ng cÊp lªn Phiªn B¶n Míi NhÊt vµ HiÓn ThÞ Tèt NhÊt.")
	end
	local curtime = GetCurrentTime()
	SetTaskTemp(TEMP_SHIPITEMTIME_1,curtime + 2*60*18)
	SetTaskTemp(TEMP_SHIPITEMTIME_2,curtime + 2*60*18)
	SetTaskTemp(TEMP_SHIPITEMTIME_3,curtime + 2*60*18)
	SetTaskTemp(TEMP_SHIPITEMTIME_4,curtime + 2*60*18)
	SetTaskTemp(TEMP_SHIPITEMTIME_5,curtime + 20*18)
	g_ReAddItemProp()
	
	
	Msg2Player("<color=cyan>Chµo mõng b¹n ®Õn víi VÑn Nguyªn Ký øc - phiªn b¶n míi nhÊt lµ <color=yellow><47><color><color=cyan>. vui lßng cËp nhËt nÕu b¹n ®ang dïng phiªn b¶n nhá h¬n ®Ó cã tr¶i nghiÖm tèt nhÊt.")

	
	if(GetRepute() < 400) then
		AddRepute(400 -GetRepute())
	end
	local nCount = GetPlayerCount()
	if(nCount >= 690) then
		goto_cityRan()
	end
	

	
	--nTask = GetTask(TASKVALUE_STATE8)
	--nV1 = Get4Cell(nTask,1)
	--nV2 = Get4Cell(nTask,2)
	--print(nV1,nV2)
	--if(nV1 > 0) then
	--	AddSkillState(1689,1, 1, nV1*18);
	--end
	
	--if(nV2 > 0) then
	--	AddSkillState(1690,1, 1, nV1*18);
	--end
	
	ActiveFullRank()
	
	get_SkillBiKip() 
	
	
	--local nbitTask = GetTask(TASKBIT_EDITTASK)
	--if(GetBit(nbitTask,5) == 0) then	--version 4
	--	local total, _, _, Sai = GetRealSP()
	--	if(Sai > 0) then
	--		local vlmt = Get2Cell(GetTask(TASKQUEST02),3)
	--		local pnqd = Get1Cell(GetTask(TASKVALUE_STATE4),9)
	--		local nPhaoKn = Get1Cell(GetTask(TASKVALUE_ITEMPOINT),1)
	--		local nKeoKn = Get1Cell(GetTask(TASKVALUE_SKILLPOINT),2)
	--		local nLinhDon = Get2Cell(GetTask(TASKVALUE_SKILLPOINT),2)
	--		local nTotal = vlmt+pnqd+nPhaoKn+nKeoKn+nLinhDon
	--		if(nTotal < Sai) then
	--			local nLech = Sai-nTotal
	--			if(vlmt + nLech <= 15) then
	--				SetTask(TASKQUEST02,Set2Cell(vlmt,3,vlmt + nLech))
	--				WriteLog("EditPoin.txt", format("acc: %s - name: %s - lech: %d", GetAccount(),GetName(),nLech))
	--			else
	--				--Msg2Player("Bi lech: "..nLech.." luu danh sach lai de xu ly")
	--				WriteLog("LoiBugDiem.txt", format("acc: %s - name: %s - lech: %d", GetAccount(),GetName(),nLech))
	--			end
	--		end
	--	end
	--	SetTask(TASKBIT_EDITTASK, SetBit(nbitTask,5,1))
	--end
	
	
end;

function ChangeMapTongWar(nMapIdx)


end






g_tab_RevivePos = {
	[1] = {
		{"Thµnh §« ®«ng", 6, 11},{"Thµnh §« t©y", 7, 11},{"Thµnh §« nam", 8, 11},{"Thµnh §« b¾c", 9, 11},{"Thµnh §« trung t©m", 5, 11}
	},
	[2] = {
		{"T­¬ng D­¬ng ®«ng", 30, 78},{"T­¬ng D­¬ng t©y", 32 , 78},{"T­¬ng D­¬ng nam", 31, 78},{"T­¬ng D­¬ng b¾c", 33, 78},{"T­¬ng D­¬ng trung t©m", 29, 78}
	},
	[3] = {
		{"Ph­îng T­êng ®«ng", 1, 1},{"Ph­îng T­êng t©y", 2, 1},{"Ph­îng T­êng nam", 3, 1},{"Ph­îng T­êng b¾c", 4, 1},{"Ph­îng T­êng trung t©m", 0, 1}
	},
	[4] = {
		{"§¹i lý b¾c", 64, 162},{"§¹i lý trung t©m", 63, 162}
	},
	[5] = {
		{"BiÖn Kinh ®«ng", 24, 37},{"BiÖn Kinh t©y", 25, 37},{"BiÖn Kinh nam", 24, 37},{"BiÖn Kinh b¾c", 26, 37},{"BiÖn Kinh trung t©m", 23, 37}
	},
	[6] = {
		{"D­¬ng Ch©u ®«ng", 35, 80},{"D­¬ng Ch©u t©y", 38, 80},{"D­¬ng Ch©u nam", 37, 80},{"D­¬ng Ch©u b¾c", 36, 80},{"D­¬ng Ch©u trung t©m", 34, 80}
	},
	[7] = {
		{"L©m An ®«ng", 68, 176},{"L©m An nam", 67, 176},{"L©m An b¾c", 69, 176}
	},
	[8] = {
		{"Ba L¨ng huyÖn", 19, 53},{"Giang T©n Th«n", 10, 20},{"VÜnh L¹c trÊn", 43, 99},{"Chu Tiªn trÊn", 45, 100},{"§¹o H­¬ng th«n", 47, 101},{"Long M«n trÊn", 56, 121},{"Th¹ch Cæ trÊn", 59, 153},{"Long TuyÒn th«n", 66, 174},{"T©y S¬n th«n", 1, 175}
	},
	[9] = {
		{"Thiªn V­¬ng Bang", 21, 59},{"ThiÕu L©m ph¸i", 52, 103},{"§­êng M«n", 15, 25},{"Ngò §éc Gi¸o", 71, 183},{"Nga My ph¸i", 13, 13},{"Thóy Yªn m«n", 61, 154},{"Thiªn NhÉn gi¸o", 28, 49},{"C¸i Bang", 53, 115},{"Vâ §ang ph¸i", 40, 81},{"C«n L«n ph¸i", 58, 131},{"Hoa S¬n ph¸i", 1, 333}
	},
};

function goto_cityRan()
	local nIdx = 8
	local nRan = random(1,getn(g_tab_RevivePos[nIdx]))
	gopos_city_rand(nIdx,nRan)
end


function gopos_city_rand(nIdx, nSubIdx)
	local w,x,y = GetWorldPos();
	x,y = GetRevPos(g_tab_RevivePos[nIdx][nSubIdx][2],g_tab_RevivePos[nIdx][nSubIdx][3]);
	
	Msg2Player("PhÝa truíc ®· h¬n 1500 ng­êi, b¹n sÏ ®uîc chuyÓn qua n¬i kh¸c")
	--Msg2Player(format("Tal: %d,%d,%d",w,x,y))
	if(x ~= nil and x > 0) then
		if(NewWorld(g_tab_RevivePos[nIdx][nSubIdx][3],floor(x/32),floor(y/32)) > 0) then
			SetFightState(0)
		end
	end
end;

function g_ReAddItemProp()	--1 sè item cã thuéc tÝnh
	local tbDelItem = {};
	local idx = GetNextItem(0);
	while(idx > 0) do
		local nTaskID = GetItemValue(idx,5)
		local nIdx,t,g,d,p,l,s,r = GetItemProp(idx);
		if(g == 6 and d == 1 and p == 2059) then
			DelWhenPick(idx,2)
			SetTaskTemp(TEMP_HASKINGSIGNET,1)
		elseif((g == 6 and d == 1 and p == 1605) or
		(g == 6 and d == 0 and p >= 1607 and p <= 1616)) then
			tinsert(tbDelItem,idx)
		elseif(nTaskID > 60000) then
			if(g == 6 and d == 1 and p == 1020) then	--lÖnh bµi
				nIdx = 0
			elseif(g == 6 and d == 1 and p == 2) then --mËt ®å
				nIdx = 1
			else
				nIdx = -1
			end
			if(nIdx >= 0) then
				nTaskID = nTaskID - 60000;
				local strDesc = ExeScript(defSCRIPT_RANDTASKID, 1, "get_taskitemstr",nTaskID,nIdx)
				AddItemDesc(idx,strDesc,PlayerIndex)
			end
		end
		idx = GetNextItem(1);
	end
	for i=1,getn(tbDelItem) do
		RemoveItem(tbDelItem[i],1)
	end
	local W,_,_ = GetWorldPos();
	ChangeMapMsg(W)
end;

function ChangeMapMsg(nMap)	--chuyÓn map trong GS
	if(IsGM() > 0) then
		return
	end
	if(GetTaskTemp(TEMP_HASKINGSIGNET) > 0) then
		if(GetItemCount(1,6,2059) > 0 or GetItemCount(1,6,2059,0,8) > 0) then
			local szMsg = format("Giang hå t­¬ng truyÒn: <color=green>%s<color> ®em Ngäc Tû ®Õn <color=yellow>%s", GetName(), GetSubWorldName(nMap));
			ExeGlobal(GBID_Info2AllServer, 0, 0,szMsg)
		end
	end
end;

--chØnh 1 sè task khi cÇn
function g_EditTasks()
	if(ENABLE_EDITTASK == 0) then
		return
	end
	local nbitTask = GetTask(TASKBIT_EDITTASK)
	if(GetBit(nbitTask,4) == 0) then	--version 4
		SetTask(TASKBIT_EDITTASK, SetBit(nbitTask,4,1))
		------reset---------
		SetTask(TASK_EVENT01,0)
		SetTask(TASK_EVENT02,0)
		SetTask(TASK_EVENT03,0)
		SetTask(TASK_EVENT04,0)
		SetTask(TASK_EVENT05,0)
		SetTask(TASK_EVENT06,0)
		SetTask(TASK_EVENT07,0)
	end
end;

defDEATHNEWTRAINPLISCR = FileName2Id("\\script\\players\\death\\newtrain.lua");
--add l¹i cµi ®Æt cña mét sè map ®Æc thï
function g_ReAddSpecialMapSetting()
	local W,X,Y = GetWorldPos();
	if(W == 208) then	--map ®¹i lao
		local nTimerTask = g_GetTaskCell(1, TASKQUEST01, 4);
		local nRestTime = GetTask(TASKVALUE_PRISON_RESTTIME);	--add l¹i timer ®ang ch¹y (nÕu cã)
		SetCreateTeam(0)
		if(nTimerTask == 0 or nTimerTask == 1) then	-- ë tï
			if(nRestTime > 0) then
				SetTimer(nRestTime, TIMERID_PRISON)	--tiÕp tôc thêi gian ë trong tï
			end
		end
	elseif(W >= 242 and W <= 248) then	--tÝnh n¨ng ®¶o tÈy tñy
		SetLogoutRV(1)	--login vµo ®iÓm l­u r­¬ng
		SetPunish(1)	--kiÓu die kh«ng tæn thÊt
	elseif(W >= 917 and W <= 920) then	--b¶n ®å luyÖn c«ng B¹ch cèt
		local nRe10S = g_GetTaskCell(4, TASK_NEWPRATICE, 1);
		if(nRe10S > 6) then
			SetTimer(1080, TIMERID_NEWPRACT)	--lÆp 1 phót
			SetDeathScript(defDEATHNEWTRAINPLISCR)
		else	--hÕt giê ®Èy ra
			g_SetTaskCell(4, TASK_NEWPRATICE, 1, 0);
			Msg2Player("Thêi gian tu luyÖn cña ®¹i hiÖp ®· kÕt thóc, sÏ bÞ c­ìng chÕ ®Èy khái b¶n ®å!");
			W,X,Y = GetCurRevPos();
			if(NewWorld(W, X/32, Y/32) > 0) then
			SetFightState(0)
			end
		end
	elseif(W >= 921 and W <= 924) then	--b¶n ®å luyÖn c«ng Thiªn Long
		local nRe10S = g_GetTaskCell(4, TASK_NEWPRATICE, 2);
		if(nRe10S > 6) then
			SetTimer(1080, TIMERID_NEWPRACT)	--lÆp 1 phót
			SetDeathScript(defDEATHNEWTRAINPLISCR)
		else	--hÕt giê ®Èy ra
			g_SetTaskCell(4, TASK_NEWPRATICE, 2, 0);
			Msg2Player("Thêi gian tu luyÖn cña ®¹i hiÖp ®· kÕt thóc, sÏ bÞ c­ìng chÕ ®Èy khái b¶n ®å!");
			W,X,Y = GetCurRevPos();
			if(NewWorld(W, X/32, Y/32) > 0) then
			SetFightState(0)
			end
		end
	elseif((W >= 586 and W <= 591) or (W >= 593 and W <= 597)) then
		if(GetFightState() > 0) then
			SetFightState(0)
			SetPos(1660,3257)
		end
	elseif(W >= 235 and W <= 241) then	--§µo hoa ®¶o
		SetCreateTeam(0)	--bao gåm leaveteam
		SetCurRevPos(W, 49848, 103807);	--n¬i håi sinh t¹m
	elseif(W >= 950 and W <= 956) then	--¸c lang cèc
		SetPKFlag(0,1)
		SetPunish(2)
	end
end;

--skill khÝ doanh
MER_BREATHSKILLS={
1502,
1505,
1504,
1501,
1503
};
--check login sync quèc chñ
function LoginNationalMaster(nTongID,szTongName)
	if(szTongName == GetIniStr("kingdata.ini","Nation", "TCamp1")) then
		SyncNationalMaster(1)
		return
	end
	if(szTongName == GetIniStr("kingdata.ini","Nation", "TCamp2")) then
		SyncNationalMaster(1)
		return
	end
	SyncNationalMaster(0)
end;
