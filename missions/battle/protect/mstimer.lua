-- missiontimer
Include("\\script\\headers\\lockprogram.lua");
Include("\\script\\headers\\tasklist.lua");
Include("\\script\\missions\\battle\\battlehead.lua");
Include("\\script\\missions\\battle\\chienthan_tongkim.lua");
Include("\\script\\missions\\battle\\npcpos.lua");
Include("\\script\\awards\\battletop_awards.lua");
Include("\\script\\event\\alphatest\\funct.lua");
Include("\\script\\event\\30042026\\header.lua");
Include("\\script\\headers\\moc_cap_nhat_kinh_nghiem_server1.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
Include("\\script\\event\\quockhanh0209\\helper.lua"); -- event Quoc Khanh


function OnMissionTimer(nMId, TimerId)
	if (TimerId == 1) then --®Õn giê khai chiÕn
		StopMissionTimer(nMId, 1)
		StopMissionTimer(nMId, 2)
		prt_startfight()
		return
	end
	if (TimerId == 2) then --lÆp th«ng b¸o
		if (GetMissionV(BTLMSV_ISNOTICE) == 0) then
			return
		end
		local nRestTime = GetMSRestTime(nMId, 1); --time b¸o danh
		if (nRestTime > 1500) then
			nRestTime = ceil(nRestTime / (60 * 18));
			AddGlobalCountNews(1474, 1, 0, nRestTime .. " phót")
		end
		return
	end
	if (TimerId == 3) then --so¸i 1 ra
		StopMissionTimer(nMId, 3)
		local Tpoint = GetMissionV(BTLMSV_TPOINT)
		local Kpoint = GetMissionV(BTLMSV_KPOINT)
		if (Kpoint > Tpoint) then              --Tèng ra tr­íc
			SetMissionV(BTLMSV_NEXTGNRCAMP, 2)
			StartMissionTimer(BTLMSID, 6, 10 * 60 * 18) --10 phót n÷a so¸i 2 ra
			prt_callgeneral(1)
		elseif (Tpoint > Kpoint) then          --Kim ra tr­íc
			SetMissionV(BTLMSV_NEXTGNRCAMP, 1)
			StartMissionTimer(BTLMSID, 6, 10 * 60 * 18) --10 phót n÷a so¸i 2 ra
			prt_callgeneral(2)
		else                                   --ra cïng lóc
			prt_callgeneral(1)
			prt_callgeneral(2)
		end
		return
	end
	if (TimerId == 4) then --lÆp 1 phót trong lóc ®¸nh
		local nLoop = GetMissionV(BTLMSV_LOOP) + 1;
		SetMissionV(BTLMSV_LOOP, nLoop);
		prt_callfightnpc(nLoop)
		return
	end
	if (TimerId == 5) then --hÕt giê
		prt_endgame()
		return
	end
	if (TimerId == 6) then --so¸i 2 ra
		StopMissionTimer(nMId, 6)
		prt_callgeneral(GetMissionV(BTLMSV_NEXTGNRCAMP))
		return
	end
	if (TimerId == 7) then --cËp nhËt xÕp h¹ng
		prt_SendRankToAllPlayer()
		return
	end
	if (TimerId == 8) then --so s¸nh t­¬ng quan topten
		local nRestMinute = ceil(GetMSRestTime(BTLMSID, 5) / 1080);
		if (nRestMinute <= 2) then
			StopMissionTimer(nMId, 8)
			SetMissionV(BTLMSV_POWERTOPCAMP, 0)
		elseif (nRestMinute <= (BTLTOTALSHORTTIME - 2)) then
			SetMissionV(BTLMSV_POWERTOPCAMP, g_GetPowerTopCamp())
		end
		return
	end
end;

function prt_startfight()
	if (GetMSPlayerCount(BTLMSID, 1) < 1) then --ko cã ng­êi
		CloseMission(BTLMSID)
		CloseMission(2)
		return
	end
	StartMissionTimer(BTLMSID, 3, BTLGNRSHORTTIME * 60 * 18) --thêi gian nguyªn so¸i 01 xuÊt hiÖn, 30 phót sau
	StartMissionTimer(BTLMSID, 4, 1 * 60 * 18)              --vßng lÆp xuyªn suèt (1 phót)
	StartMissionTimer(BTLMSID, 5, BTLTOTALSHORTTIME * 60 * 18) --thêi gian chÊm døt trËn chiÕn (50 phót)
	StartMissionTimer(BTLMSID, 8, 2 * 60 * 18)              --vßng lÆp xuyªn suèt so s¸nh top bªn nµo m¹nh h¬n (2 phót)
	local maptype = GetMissionV(BTLMSV_MTYPE)               --kiÓu map
	local nbtLevel = GetMissionV(BTLMSV_LEVEL)              --s¬ trung cao
	local nIdx;
	-- Code cu:
	-- for i=1,getn(tbTongNpcPos) do ... end
	-- for i=1,getn(tbKimNpcPos) do ... end
	-- Linh cap 1 giu phe logic Tong/Kim, nhung toa do tien tuyen phai theo home vat ly da random.
	local tbTongNpcPos = Duc_GetNpcPosTable(maptype, 1, 2);
	local tbKimNpcPos = Duc_GetNpcPosTable(maptype, 2, 2);
	if (tbTongNpcPos == nil or tbKimNpcPos == nil) then
		Duc_BattleDevLog("protect.prt_startfight", "front npc pos nil maptype=" .. maptype);
		return
	end;
	--LÝnh cÊp 1 phe Tèng (tiÒn tuyÕn)
	for i = 1, getn(tbTongNpcPos) do
		nIdx = AddNpc(BTLtbSOLDIERID[1][1], 1, BTLMAPTYPE[maptype][nbtLevel],
			tbTongNpcPos[i][1], tbTongNpcPos[i][2],
			SCRIPT_BATTLE_SOLDIER)
		AddMSNpc(BTLMSID, nIdx)
	end
	--LÝnh cÊp 1 phe Kim (tiÒn tuyÕn)
	for i = 1, getn(tbKimNpcPos) do
		nIdx = AddNpc(BTLtbSOLDIERID[2][1], 1, BTLMAPTYPE[maptype][nbtLevel],
			tbKimNpcPos[i][1], tbKimNpcPos[i][2],
			SCRIPT_BATTLE_SOLDIER)
		AddMSNpc(BTLMSID, nIdx)
	end
	local resultstr = ""
	if (nbtLevel == 1) then
		resultstr = "Khu vùc S¬ cÊp "
	elseif (nbtLevel == 2) then
		resultstr = "Khu vùc Trung cÊp "
	elseif (nbtLevel == 3) then
		resultstr = "Khu vùc Cao cÊp "
	end
	Msg2MSAll(BTLMSID, 1475);
	AddGlobalCountNews(resultstr .. "...Thêi gian b¸o danh Tèng Kim ®· hÕt, cuéc chiÕn chÝnh thøc b¾t ®Çu!", 1,
		random(0, 1));
	--bËt timer ®Èy player
	local nDIdx = MSGetNextPlayer(BTLMSID, 0);
	while (nDIdx > 0) do
		if (GetPMParam(BTLMSID, nDIdx, 0) > 0) then
			PlayerIndex = MSDIdx2PIdx(BTLMSID, nDIdx)
			PutMessage(1476)
			if (GetFightState() == 0) then
				SetTimer(TIMERTIME_BTLOUTFORCE, TIMERID_BTLREST)
			end
		end
		nDIdx = MSGetNextPlayer(BTLMSID, nDIdx);
	end
end;

function prt_callfightnpc(nLoop)
	for i = 2, 5 do                                                              --th¶ lÝnh cÊp 2->5 (nÕu cã)
		local npcCount = GetMissionV(BTLMSV_NPCCOUNTtb[i][1][1]);                --phe Tèng
		if (npcCount < BTLMSV_NPCCOUNTtb[i][1][2]) then
			local interval = floor(BTLTOTALSHORTTIME / (BTLMSV_NPCCOUNTtb[i][1][2] + 1)); --50 phót / (sè npc cÇn th¶ + 1)
			if (interval < 1) then interval = 1 end
			if (mod(nLoop, interval) == 0) then                                  --chia hÕt cho interval
				SetMissionV(BTLMSV_NPCCOUNTtb[i][1][1], npcCount + 1)
				prt_addrandfightnpc(i, 1, 1, 1)
			end
		end
		npcCount = GetMissionV(BTLMSV_NPCCOUNTtb[i][2][1]);                      --phe Kim
		if (npcCount < BTLMSV_NPCCOUNTtb[i][2][2]) then
			local interval = floor(BTLTOTALSHORTTIME / (BTLMSV_NPCCOUNTtb[i][2][2] + 1)); --50 phót / (sè npc cÇn th¶ + 1)
			if (interval < 1) then interval = 1 end
			if (mod(nLoop, interval) == 0) then                                  --chia hÕt cho interval
				SetMissionV(BTLMSV_NPCCOUNTtb[i][2][1], npcCount + 1)
				prt_addrandfightnpc(i, 2, 1, 1)
			end
		end
	end
end

function prt_addrandfightnpc(level, camp, count, delwhendie)
	if (level < 1 or level > 5 or BTLtbSOLDIERID[camp] == nil) then
		Duc_BattleDevLog("protect.prt_addrandfightnpc",
			"invalid level/camp level=" .. Duc_BattleValue(level) .. " camp=" .. Duc_BattleValue(camp));
		return
	end
	local maptype = GetMissionV(BTLMSV_MTYPE)
	local nbtLevel = GetMissionV(BTLMSV_LEVEL)
	local nIdx;
	for i = 1, count do
		local nArea = random(2); --côm 1(®¹i doanh); côm 2(tiÒn tuyÕn)
		-- Code cu:
		-- local nPos = random(getn(BTLMTYPE_NPCPOS[maptype][camp][nArea]));
		-- local x,y = BTLMTYPE_NPCPOS[maptype][camp][nArea][nPos][1],BTLMTYPE_NPCPOS[maptype][camp][nArea][nPos][2];
		-- NPC goi them can theo cung mapping voi trap, neu khong se de lech camp voi cua ra vao.
		local tbNpcPos = Duc_GetNpcPosTable(maptype, camp, nArea);
		if (tbNpcPos == nil) then
			Duc_BattleDevLog("protect.prt_addrandfightnpc",
				"npc pos nil maptype=" .. maptype .. " camp=" .. Duc_BattleValue(camp) .. " area=" .. nArea);
			return
		end;
		local nPos = random(getn(tbNpcPos));
		local x, y = tbNpcPos[nPos][1], tbNpcPos[nPos][2];
		nIdx = AddNpc(BTLtbSOLDIERID[camp][level], level, BTLMAPTYPE[maptype][nbtLevel],
			x, y, SCRIPT_BATTLE_SOLDIER)
		SetNpcTask(nIdx, 1, delwhendie) --xãa khi chÕt
		AddMSNpc(BTLMSID, nIdx)
		if (level > 3) then       --phã t­íng trë lªn
			local nGroup = camp + 1; if (nGroup > 2) then nGroup = 1 end;
			Msg2MSGroup(BTLMSID, nGroup,
				"Trinh s¸t håi b¸o: <color=White>" ..
				GetNpcName(nIdx) .. "<color> xuÊt hiÖn t¹i <color=yellow>(" .. floor(x / 256) .. "," .. floor(y / 512) ..
				")")
		end
	end
end;

function prt_callgeneral(camp)
	if (BTLtbSOLDIERID[camp] == nil) then
		Duc_BattleDevLog("protect.prt_callgeneral", "soldier id nil camp=" .. Duc_BattleValue(camp));
		return
	end
	local level = 6;
	local maptype = GetMissionV(BTLMSV_MTYPE)
	local nbtLevel = GetMissionV(BTLMSV_LEVEL)
	local nIdx;
	-- Code cu:
	-- local x,y = BTLGENERALPOS[maptype][camp][1],BTLGENERALPOS[maptype][camp][2];
	-- Nguyen soai cung la NPC tien tuyen, vi vay toa do phai doi theo home cua phe.
	local tbGeneralPos = Duc_GetGeneralPos(maptype, camp);
	if (tbGeneralPos == nil) then
		Duc_BattleDevLog("protect.prt_callgeneral", "general pos nil maptype=" ..
			maptype .. " camp=" .. Duc_BattleValue(camp));
		return
	end;
	local x, y = tbGeneralPos[1], tbGeneralPos[2];
	local nIdx = AddNpc(BTLtbSOLDIERID[camp][level], level, BTLMAPTYPE[maptype][nbtLevel],
		x, y, SCRIPT_BATTLE_SOLDIER)
	SetNpcTask(nIdx, 1, 1) --xãa khi chÕt
	AddMSNpc(BTLMSID, nIdx)
	if (camp == 1) then
		SetMissionV(BTLMSV_GNREXIST_T, 1)
		Msg2MSAll(BTLMSID, "<color=0x00FFFF>Tèng Kim chiÕn b¸o: Nguyªn So¸i phe Tèng ®· xuÊt hiÖn")
	else
		SetMissionV(BTLMSV_GNREXIST_K, 1)
		Msg2MSAll(BTLMSID, "<color=0x9BFF9B>Tèng Kim chiÕn b¸o: Nguyªn So¸i phe Kim ®· xuÊt hiÖn")
	end
end;

function prt_SendRankToAllPlayer()
	local nDIdx = MSGetNextPlayer(BTLMSID, 0);
	if (nDIdx == 0) then
		return
	end
	local nRCount = 0
	local tbRank = {}
	if (GetMissionV(BTLMSV_UPRANK) == 1) then
		SetMissionV(BTLMSV_UPRANK, 0)
		for i = 1, 10 do --so¹n th¶o bxh
			local nMSRIdx = GetMissionV(i + 10)
			if (GetMissionV(i) == 0 or nMSRIdx == 0) then
				break
			end
			tbRank[i] = {}
			nRCount = nRCount + 1
			tbRank[i][1] = GetMSIdxGroup(BTLMSID, nMSRIdx)
			tbRank[i][2] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_TOTALPT)
			tbRank[i][3] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_PLCOUNT)
			tbRank[i][4] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_NPCCOUNT)
			tbRank[i][5] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_BEKILLED)
			tbRank[i][6] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_MAXSERKILL)
			tbRank[i][7] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_GETITEM)
			tbRank[i][8] = 0; --task
			tbRank[i][9] = GetPMParam(BTLMSID, nMSRIdx, -1)
		end
	end

	local nRestMinute = ceil(GetMSRestTime(BTLMSID, 5) / 1080);
	local TNum = GetMSGroupCount(BTLMSID, 1);
	local KNum = GetMSGroupCount(BTLMSID, 2);

	while (nDIdx > 0) do
		if (GetPMParam(BTLMSID, nDIdx, 0) > 0) then
			PlayerIndex = MSDIdx2PIdx(BTLMSID, nDIdx)
			SendBattleInfo(1, nRestMinute) --phót cßn l¹i
			SendBattleInfo(2, TNum, KNum) --qu©n sè
			if (nRCount > 0) then --sau khi vµo ®¸nh míi cã ®iÓm ®Ó up h¹ng
				SendBattleInfo(0) --clear
				for i = 1, nRCount do
					SendBattleInfo(4, i - 1,
						tbRank[i][1], --param 0
						tbRank[i][2], --param 1
						tbRank[i][3], --param 2
						tbRank[i][4], --param 3
						tbRank[i][5], --param 4
						tbRank[i][6], --param 5
						tbRank[i][7], --param 6
						tbRank[i][8], --param 7
						tbRank[i][9] -- tªn
					);
				end
			end
		end
		nDIdx = MSGetNextPlayer(BTLMSID, nDIdx);
	end
end;

--kÕt thóc cuéc ch¬i
function prt_endgame()
	local bSpecTime = GetMissionV(BTLMSV_ISONSPECIALTIME);
	local OldSubWrd = SubWorld;
	local nbtLevel = GetMissionV(BTLMSV_LEVEL) --s¬ trung cao
	local signsubw = {}
	for i = 1, 3 do
		signsubw[i] = SubWorldID2Idx(BTLtbSIGNOUTPOS[i][1]) --map b¸o danh t­¬ng øng nbtLevel
	end
	local nRCount = 0
	local tbRank = {}
	for i = 1, 10 do --so¹n th¶o bxh
		local nMSRIdx = GetMissionV(i + 10)
		if (GetMissionV(i) == 0 or nMSRIdx == 0) then
			break
		end
		tbRank[i] = {}
		nRCount = nRCount + 1
		tbRank[i][1] = GetMSIdxGroup(BTLMSID, nMSRIdx)
		tbRank[i][2] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_TOTALPT)
		tbRank[i][3] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_PLCOUNT)
		tbRank[i][4] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_NPCCOUNT)
		tbRank[i][5] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_BEKILLED)
		tbRank[i][6] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_MAXSERKILL)
		tbRank[i][7] = GetPMParam(BTLMSID, nMSRIdx, BTLPM_GETITEM)
		tbRank[i][8] = 0; --task
		tbRank[i][9] = GetPMParam(BTLMSID, nMSRIdx, -1)
		SubWorld = signsubw[nbtLevel];
		SetMissionS(i, tbRank[i][9])
		SubWorld = OldSubWrd;
	end


	local Tpoint = GetMissionV(BTLMSV_TPOINT)
	local Kpoint = GetMissionV(BTLMSV_KPOINT)
	local nWinCamp = GetMissionV(BTLMSV_CAMPBEATGNR)
	local pwcamp = nWinCamp
	if (nWinCamp == 0) then --2 so¸i ®Òu die, so ®iÓm TL
		if (Tpoint > Kpoint) then
			pwcamp = 1
		elseif (Kpoint > Tpoint) then
			pwcamp = 2
		end
	end
	local tbPTab = {};
	local count = 0;
	local nDIdx = MSGetNextPlayer(BTLMSID, 0);
	while (nDIdx > 0) do
		if (GetPMParam(BTLMSID, nDIdx, 0) > 0) then --player cã ë trong map
			PlayerIndex = MSDIdx2PIdx(BTLMSID, nDIdx)
			TradeAction(0)
			tinsert(tbPTab, PlayerIndex)
			count = count + 1;
			--th­ëng player
			local nTotalPoint = GetPMParam(BTLMSID, nDIdx, BTLPM_TOTALPT);
			--if(bSpecTime > 0) then
			--	SetIniInt(defszBTLTopFile,"Repare","Point"..count, nTotalPoint, 1) --save trùc tiÕp (1)
			--	SetIniStr(defszBTLTopFile,"Repare","Name"..count, GetPMParam(BTLMSID,nDIdx,-1), 1) --save trùc tiÕp (1)
			--end
			local nCheckAWPoint = nTotalPoint;
			local nIsFree = CalcFreeItemCell();
			local Yr, Mth, Dy, Hr, Mn, Se = GetDate();
			if (pwcamp == 0) then --hßa
				nTotalPoint = nTotalPoint + floor(BTL_TIEGAME_POINT * BTLBonusRate[nbtLevel]);
				Say(1502, 0, floor(BTL_TIEGAME_POINT * BTLBonusRate[nbtLevel]));
			else
				if (GetCurCamp() == pwcamp) then --phe th¾ng
					--------- Thuong default ------------------------------------------------------------
					if (nTotalPoint >= 1000) then
						nTotalPoint = nTotalPoint + floor(BTL_WINGAME_POINT * BTLBonusRate[nbtLevel]);
					end
					SetTaskTemp(TEMP_SUB3PARAM, 1)
					if (nTotalPoint >= 1000) then
						AddRepute(3);
						Msg2Player("Danh väng cña b¹n t¨ng thªm 3 ®iÓm!")
						Say(1503, 0, floor(BTL_WINGAME_POINT * BTLBonusRate[nbtLevel]));
					else
						Say("Ng­¬i kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.", 0)
					end

					if (nTotalPoint >= 5000) then
						if (nIsFree >= 1) then
							idx = AddItemTemp(0, 6, 2, 4984, 0, 5, 0) --thïng bia
							SetItemDate(idx, 3 * 24 * 60);
							AddItemIdx(idx);
							WriteLog("BattleAW.txt", format("acc<%s> role<%s> +1 vien kn", GetAccount(), GetName()))
						else
							Talk(1, "",
								"B¹n kh«ng cßn ®ñ chç trèng trong hµnh trang nªn kh«ng thÓ nhËn  viªn kinh nghiÖm thèng kim.")
							WriteLog("BattleAW.txt",
								format("acc<%s> role<%s> khong du cho trong nhan vien kn", GetAccount(), GetName()))
						end
						local nAddExp = 0
						if (Hr == 21) then
							if (nbtLevel == 2 or nbtLevel == 3) then
								nAddExp = ChonKinhNghiemTheoMocServer1(5000000, 15000000)
							else
								nAddExp = 5000000
							end
						elseif (Hr == 9 or Hr == 13 or Hr == 23) then
							if (nbtLevel == 2 or nbtLevel == 3) then
								nAddExp = ChonKinhNghiemTheoMocServer1(3000000, 9000000)
							else
								nAddExp = 3000000
							end
						end
						if (nAddExp > 0) then
							local nCurExp = GetExp();
							if (nCurExp ~= nil) then
								local nNextExp = GetExpNext();
								if (nNextExp > 0) then
									local nReNeedExp = nNextExp - nCurExp; --phÇn kinh nghiÖm cÇn ®Ó lªn cÊp
									while (nAddExp > 0 and nReNeedExp > 0) do
										AddOwnExp(nAddExp);
										nAddExp = nAddExp - nReNeedExp;
										nReNeedExp = GetExpNext();
									end
								end
							end
						end
					end
				else --phe thua
					if (nTotalPoint >= 1000) then
						nTotalPoint = nTotalPoint + floor(BTL_LOSEGAME_POINT * BTLBonusRate[nbtLevel]);
						Say(1504, 0, floor(BTL_LOSEGAME_POINT * BTLBonusRate[nbtLevel]));
					else
						Say("Ng­¬i kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.", 0)
					end
					SetTaskTemp(TEMP_SUB3PARAM, 0);

					if (nTotalPoint >= 5000) then
						if (nIsFree >= 1) then
							idx = AddItemTemp(0, 6, 1, 4984, 0, 5, 0) --thïng bia
							SetItemDate(idx, 3 * 24 * 60);
							AddItemIdx(idx);
							WriteLog("BattleAW.txt", format("acc<%s> role<%s> +1 vien kn", GetAccount(), GetName()))
						else
							Talk(1, "",
								"B¹n kh«ng cßn ®ñ chç trèng trong hµnh trang nªn kh«ng thÓ nhËn  viªn kinh nghiÖm thèng kim.")
							WriteLog("BattleAW.txt",
								format("acc<%s> role<%s> khong du cho trong nhan vien kn", GetAccount(), GetName()))
						end
						local nAddExp = 0
						if (Hr == 21) then
							if (nbtLevel == 2 or nbtLevel == 3) then
								nAddExp = ChonKinhNghiemTheoMocServer1(4000000, 12000000)
							else
								nAddExp = 4000000
							end
						elseif (Hr == 9 or Hr == 13 or Hr == 23) then
							if (nbtLevel == 2 or nbtLevel == 3) then
								nAddExp = ChonKinhNghiemTheoMocServer1(2000000, 6000000)
							else
								nAddExp = 2000000
							end
						end
						if (nAddExp > 0) then
							local nCurExp = GetExp();
							if (nCurExp ~= nil) then
								local nNextExp = GetExpNext();
								if (nNextExp > 0) then
									local nReNeedExp = nNextExp - nCurExp; --phÇn kinh nghiÖm cÇn ®Ó lªn cÊp
									while (nAddExp > 0 and nReNeedExp > 0) do
										AddOwnExp(nAddExp);
										nAddExp = nAddExp - nReNeedExp;
										nReNeedExp = GetExpNext();
									end
								end
							end
						end
					end
				end
			end


			-- Tong Kim(Thuong Event): chi thuong trong khung gio hop le (9/13/23 = thuong, 21 = Vang)
			if (Hr == 9 or Hr == 13 or Hr == 21 or Hr == 23) then
				local bH21         = (Hr == 21);
				local nThiepBang   = 0;
				local nThiepCaNhan = 0;
				if (nTotalPoint >= 50000) then
					if (bH21) then
						nThiepBang = 50; nThiepCaNhan = 50;
					else
						nThiepBang = 20; nThiepCaNhan = 20;
					end
				elseif (nTotalPoint >= 30000) then
					if (bH21) then
						nThiepBang = 30; nThiepCaNhan = 30;
					else
						nThiepBang = 15; nThiepCaNhan = 15;
					end
				elseif (nTotalPoint >= 20000) then
					if (bH21) then
						nThiepBang = 20; nThiepCaNhan = 20;
					else
						nThiepBang = 10; nThiepCaNhan = 10;
					end
				elseif (nTotalPoint >= 10000) then
					if (bH21) then
						nThiepBang = 10; nThiepCaNhan = 10;
					else
						nThiepBang = 5; nThiepCaNhan = 5;
					end
				elseif (nTotalPoint >= 5000) then
					if (bH21) then
						nThiepBang = 5; nThiepCaNhan = 5;
					else
						nThiepBang = 0; nThiepCaNhan = 0;
					end
				end
				if (nThiepBang > 0 or nThiepCaNhan > 0) then
					-- Duc_GiveKeoCam(10);
					-- Duc_GiveThiep(nThiepBang, nThiepCaNhan);

					-- Duc_GiveBongHong(10);
					-- Duc_GiveThiep(nThiepBang, nThiepCaNhan);

					-- DucTT_GiveHatSen(10);
					-- DucTT_GiveLongDen(nThiepBang, nThiepCaNhan);
					QK_GiveVongHoaCaNhan(nThiepCaNhan);
				end
			end

			--if(ENABLE_EVENT_3004 == 1 and nTotalPoint > 5000) then
			--if(CalcFreeItemCell() < 1) then
			--	Msg2Player("B¹n kh«ng ®ñ « trèng nªn sÏ mÊt phÇn th­ëng sù kiÖn.")
			--else
			--	if(Hr == 13 or Hr == 23) then
			--		local idx = AddItemTemp(0,6,4,4985,0,5,50)
			--		LockItem(idx)
			--		SetItemDate(idx,EVENT_3004_ENDDATE[1],EVENT_3004_ENDDATE[2],EVENT_3004_ENDDATE[3],EVENT_3004_ENDDATE[4],EVENT_3004_ENDDATE[5])
			--		AddItemIdx(idx);
			--		Msg2Player("NhËn ®­îc 50 c¸i hu©n ch­¬ng chiÕn th¾ng")
			--	elseif(Hr == 21) then
			--		local idx = AddItemTemp(0,6,4,4985,0,5,100)
			--		LockItem(idx)
			--		SetItemDate(idx,EVENT_3004_ENDDATE[1],EVENT_3004_ENDDATE[2],EVENT_3004_ENDDATE[3],EVENT_3004_ENDDATE[4],EVENT_3004_ENDDATE[5])
			--		AddItemIdx(idx);
			--		Msg2Player("NhËn ®­îc 50 c¸i hu©n ch­¬ng chiÕn th¾ng")
			--	end
			--end
			--end

			--local _,_,_,_Hrs,_,_ = GetDate();
			--if(ENABLE_EVENT_3004 == 1 and (_Hrs ==  13 or _Hrs == 23))  then
			--	if(CalcFreeItemCell() < 1) then
			--		Msg2Player("B¹n kh«ng ®ñ « trèng nªn sÏ mÊt phÇn th­ëng sù kiÖn.")
			--	else
			--		local idx = AddItemTemp(0,6,4,4985,0,5,50)
			--		LockItem(idx)
			--		SetItemDate(idx,EVENT_3004_ENDDATE[1],EVENT_3004_ENDDATE[2],EVENT_3004_ENDDATE[3],EVENT_3004_ENDDATE[4],EVENT_3004_ENDDATE[5])
			--		AddItemIdx(idx);
			--		Msg2Player("NhËn ®­îc 50 c¸i hu©n ch­¬ng chiÕn th¾ng")
			--	end
			--elseif (ENABLE_EVENT_3004 == 1 and (_Hrs == 21))  then
			--	if(CalcFreeItemCell() < 1) then
			--		Msg2Player("B¹n kh«ng ®ñ « trèng nªn sÏ mÊt phÇn th­ëng sù kiÖn.")
			--	else
			--		local idx = AddItemTemp(0,6,4,4985,0,5,100)
			--		LockItem(idx)
			--		SetItemDate(idx,EVENT_3004_ENDDATE[1],EVENT_3004_ENDDATE[2],EVENT_3004_ENDDATE[3],EVENT_3004_ENDDATE[4],EVENT_3004_ENDDATE[5])
			--		AddItemIdx(idx);
			--		Msg2Player("NhËn ®­îc 100 c¸i hu©n ch­¬ng chiÕn th¾ng")
			--	end
			--end

			AddSJPoint(nTotalPoint) --®iÓm TL cã thÓ xµi ®c bªn ngoµi
			Msg2Player(1540, "", nTotalPoint)
			--g_GiveAwardsBTLPoint(nbtLevel, nCheckAWPoint)
			--sync bxh cuèi cïng
			SendBattleInfo(1, 0) --phót cßn l¹i 0
			SendBattleInfo(0) --clear
			for i = 1, nRCount do
				SendBattleInfo(4, i - 1,
					tbRank[i][1], --param 0
					tbRank[i][2], --param 1
					tbRank[i][3], --param 2
					tbRank[i][4], --param 3
					tbRank[i][5], --param 4
					tbRank[i][6], --param 5
					tbRank[i][7], --param 6
					tbRank[i][8], --param 7
					tbRank[i][9] -- tªn
				);
			end
			--if(ENABLE_EVENT_OP == 1) then
			--print("==========TOP TONG KIM==========")
			--	for j=1,getn(tbRankTop20) do
			--		if(GetName() == tbRankTop20[j][9]) then
			--			print("Tong Kim Phat Top",j,tbRankTop20[j][9],tbRankTop20[j][2])
			--			BattleTop(j)
			--		end
			--	end
			if (nTotalPoint >= 10000) then
				QKHelper_Add(1);
			end
			--print("==========TOP TONG KIM END==========")
			--end
		end
		nDIdx = MSGetNextPlayer(BTLMSID, nDIdx);
	end

	local tbCTTKAllRank = CTTK_BuildAllRank(BTLMSID);
	CTTK_OnBattleResult(nbtLevel, BTLRULEID_PROTECT, tbCTTKAllRank, getn(tbCTTKAllRank));

	local tbNTab = {};
	local cNpc = 0;
	local nIdx = MSGetNextNpc(BTLMSID, 0);
	while (nIdx > 0) do
		local nNpcIdx = MSNpcData2Idx(BTLMSID, nIdx);
		if (GetNpcSetIdx(nNpcIdx) == 49) or (GetNpcSetIdx(nNpcIdx) == 55) or (GetNpcSetIdx(nNpcIdx) == 625) then
			tinsert(tbNTab, nNpcIdx);
			cNpc = cNpc + 1;
			-- print(cNpc,GetNpcName(nNpcIdx),nNpcIdx);
		end
		nIdx = MSGetNextNpc(BTLMSID, nIdx);
	end

	CloseMission(BTLMSID)
	CloseMission(2)
	if (count == 0) then
		return
	end
	--if(bSpecTime > 0) then
	--	SetIniInt(defszBTLTopFile,"Repare","Count", count, 1) --save trùc tiÕp (1)
	--end
	for i = 1, getn(tbPTab) do --®­a vÒ b¸o danh
		PlayerIndex = tbPTab[i];
		local nCamp = GetCurCamp();
		if (nCamp ~= 1 and nCamp ~= 2) then
			nCamp = 1
		end
		StopTimer()
		SetDeathScript(0)
		SetPunish(0)
		SetPKFlag(0, 0)
		SetLogoutRV(0)
		SetCreateTeam(1)
		ClearState()
		SubChannel(0, nCamp) --phô thuéc subworld ®ang ®øng, unsubscribe
		NewWorld(BTLtbSIGNOUTPOS[nbtLevel][1],
			random(BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][1], BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][2]),
			random(BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][3], BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][4]));
		SetFightState(0)
		SetCurCamp(GetCamp())
		SetRevPos(nCamp)                           --®Þa ®iÓm håi sinh phô thuéc subworld ®ang ®øng cña player
		SetRankEx(Get4Cell(GetTask(TASKVALUE_XRANK), 1)) --phôc håi danh hiÖu cò
	end

	---- DelNpc default ms TK---------
	if getn(tbNTab) > 0 then
		for i = 1, getn(tbNTab) do
			-- print(tbNTab[i])
			DelNpc(tbNTab[i])
		end
	end

	local resultstr = ""
	if (nbtLevel == 1) then
		resultstr = "Khu vùc S¬ cÊp "
	elseif (nbtLevel == 2) then
		resultstr = "Khu vùc Trung cÊp "
	elseif (nbtLevel == 3) then
		resultstr = "Khu vùc Cao cÊp "
	end
	if (nWinCamp == 1) then
		AddGlobalCountNews(resultstr .. "...ChiÕn sù ®· kÕt thóc, phe Tèng b¶o vÖ Nguyªn So¸i vµ giµnh ®­îc th¾ng lîi!",
			1, random(0, 1));
	elseif (nWinCamp == 2) then
		AddGlobalCountNews(resultstr .. "...ChiÕn sù ®· kÕt thóc, phe Kim b¶o vÖ Nguyªn So¸i vµ giµnh ®­îc th¾ng lîi!", 1,
			random(0, 1));
	elseif (nWinCamp == 0) then
		if (pwcamp == 1) then
			AddGlobalCountNews(
				resultstr ..
				"...ChiÕn sù ®· kÕt thóc, ®iÓm tÝch lòy phe Tèng:" ..
				Tpoint .. "-phe Kim:" .. Kpoint .. ". Phe Tèng giµnh ®­îc th¾ng lîi!", 1, random(0, 1));
		elseif (pwcamp == 2) then
			AddGlobalCountNews(
				resultstr ..
				"...ChiÕn sù ®· kÕt thóc, ®iÓm tÝch lòy phe Tèng:" ..
				Tpoint .. "-phe Kim:" .. Kpoint .. ". Phe Kim giµnh ®­îc th¾ng lîi!", 1, random(0, 1));
		else
			AddGlobalCountNews(
				resultstr ..
				"...ChiÕn sù ®· kÕt thóc, ®iÓm tÝch lòy phe Tèng:" ..
				Tpoint .. "-phe Kim:" .. Kpoint .. ". TrËn chiÕn nµy t¹m hßa!", 1, random(0, 1));
		end
	end
	--chuÈn bÞ xÕp h¹ng tuÇn
	--if(bSpecTime == 0) then
	--	return
	--end
	--SubWorld = signsubw[nbtLevel];
	--CloseMission(1)
	--OpenMission(1, defszBTLTopScript)
	--StartMissionTimer(1,1,18)
end;

function OnLeave(nMId, PIndex, bQuit)
	--th«ng b¸o ®Ó lµm c¸i g×? kh«ng cÇn thiÕt!
	--PlayerIndex = PIndex
	--Msg2MSAll(GetName().." rêi khái chiÕn tr­êng")
end;
