-- V­ît ¶i NPC chÕt
--Code Designer: MrTuPham
--Date:12/3/2021
Include("\\script\\missions\\timechallenge\\tch_npc.lua");
Include("\\script\\lockprogram.lua");
Include("\\script\\headers\\moc_cap_nhat_kinh_nghiem_server1.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
Include("\\script\\event\\quockhanh0209\\helper.lua"); -- event Quoc Khanh

function LastPlayer(nNpcIdx)
	SubWorld = GetNpcTask(nNpcIdx, 0)
	local npckillnum = GetPMParam(TCHMSID, GetMSDataIdx(), TCHMSP_NPCKILLNUM) + 1;
	if (GetBossType(nNpcIdx) > 0) then
		npckillnum = npckillnum + 1;
	end
	SetPMParam(TCHMSID, GetMSDataIdx(), TCHMSP_NPCKILLNUM, npckillnum); --sè l­îng giÕt qu¸i
	DelMSNpc(TCHMSID, nNpcIdx)
	local count = GetMissionV(TCHMSV_NPC_COUNT) - 1;
	SetMissionV(TCHMSV_NPC_COUNT, count);
	if (count <= 0) then                           --hoµn thµnh 1 ¶i
		if (GetMissionV(TCHMSV_BEGIN_SECRETMS) == 1) then --®ang trong ¶i 29 bÝ mËt --> kÕt thóc
			Msg2MSAll(TCHMSID, "§éi ngò cña b¹n v­ît qua ¶i bÝ mËt vµ nhËn vÒ phÇn th­ëng!");
			award_hidden_mission(nNpcIdx);         --th­ëng ¶i 29
			tch_teamout(TCHMSID);                  --®­a vÒ nhµ
		else
			local batch = GetMissionV(TCHMSV_NPC_BATCH);
			Msg2MSAll(TCHMSID,
				"§éi ngò " .. GetMissionS(TCHMSS_CAPNAME) .. " ®· tiªu diÖt toµn bé ®¸m qu¸i ¶i thø <color=green>" ..
				batch);
			award_batch(batch, nNpcIdx);                  --th­ëng hoµn thµnh 1 ¶i ®¬n
			if (batch >= getn(tbTCH_HNpc)) then           --®· qua hÕt 28 ¶i
				SetMissionV(TCHMSV_BEGIN_SECRETMS, 1)
				local UseTime = TCH_FTIME - GetMSRestTime(TCHMSID, 2); --thêi gian ®· sö dông
				local usemin = floor(UseTime / (60 * 18));
				local usesec = floor((mod(UseTime, (60 * 18))) / 18);
				local usetick = UseTime - usemin * 60 * 18 - usesec * 18;
				local teamname = GetMissionS(TCHMSS_CAPNAME);
				AddLocalCountNews(
				"§éi ngò " ..
				teamname ..
				" ®· th¾ng lîi hoµn thµnh v­ît ¶i ®óng thêi gian: " .. usemin .. " phót " .. usesec .. " gi©y " ..
				usetick, 1)
				award_success(nNpcIdx, UseTime); --th­ëng hoµn thµnh 28 ¶i
				tch_AddQueueLadder(teamname, UseTime) --vµo hµng ®îi xÕp h¹ng

				if (usemin < 20) then     --hoµn thµnh d­íi 20 phót --> khëi ®éng ¶i 29
					Msg2MSAll(TCHMSID, "<color=green><#>NhiÖm vô bÝ mËt ®· khëi ®éng! S½n sµng øng chiÕn!");
					local index = random(getn(map_hidden_npc));
					create_all_npc(map_hidden_npc[index][2]);
				else
					tch_teamout(TCHMSID) --®­a vÒ nhµ
				end
			else
				batch = batch + 1; --më ¶i tiÕp theo
				SetMissionV(TCHMSV_NPC_BATCH, batch);
				create_batch_npc(batch);
			end
		end
	end
	DelNpc(nNpcIdx)
end

function award_batch(batch, npcidx) --th­ëng 1 ¶i
	if (tbTCH_HNpc[batch] == nil) then
		return
	end
	award_batch_item(batch, npcidx, tbTCH_HNpc[batch][1], 0);
	--award_batch_extend(batch)
end

function award_batch_item(batch, npcidx, item, nTime, bEndBatch)
	local nOldPlayer = PlayerIndex;
	local expparam = item[1];
	local boxsuredrop = 0;
	if (GetMissionV(TCHMSV_SMALLNTT_BATCH) == batch) then --¶i cã boss random thªm
		expparam = expparam * 2;
		boxsuredrop = 1;
	end
	local nDIdx = MSGetNextPlayer(TCHMSID, 0);
	while (nDIdx > 0) do
		if (GetPMParam(TCHMSID, nDIdx, 0) > 0) then
			PlayerIndex = MSDIdx2PIdx(TCHMSID, nDIdx);
			award_player(expparam, nTime); --th­ëng kn tõng player khi hoµn thµnh 1 ¶i ®¬n
			if (bEndBatch) then   --th­ëng kÕt thóc ¶i 28
				TradeAction(0)
				tch_player_award_end(npcidx, GetPMParam(TCHMSID, nDIdx, TCHMSP_NPCKILLNUM))

				if (CalcFreeItemCell() > 0) then
					idx = AddItemTemp(0, 6, 7, 4984, 0, 5, 0)
					SetItemDate(idx, 3 * 24 * 60);
					AddItemIdx(idx);
					WriteLog("VAAW.txt", format("acc<%s> role<%s> +1 vien kn", GetAccount(), GetName()))
				else
					WriteLog("VAAW.txt", format("acc<%s> role<%s> lost 1 vien kn", GetAccount(), GetName()))
				end

				-- event 01/06/2026 (th­ëng khi qua bê b¾c)
				-- Duc_GiveKeoCam(10);
				-- Duc_GiveThiep(20, 20);

				-- event vu lan
				-- Duc_GiveBongHong(10);
				-- Duc_GiveThiep(20, 20);

				-- event Trung thu
				-- DucTT_GiveHatSen(10);
				-- DucTT_GiveLongDen(20, 20);
				----- kÕt thóc -----
				QKHelper_Add(7)
			end
		end
		nDIdx = MSGetNextPlayer(TCHMSID, nDIdx);
	end

	PlayerIndex = 0;               --rít tù do, ai còng lôm ®c
	if (item[2] > 0) then          --rít sl b×nh m¸u
		for i = 1, item[2] do
			if (THE_GOLDEN_SERVER == 0) then --kiÓu sv ctc (ngò hoa ngäc lé hoµn)
				DropItem(npcidx, 0, 1, 2, 0, 5, 5, 0, 0);
			else
				DropItem(npcidx, 0, 1, 8, 0, 4, 5, 0, 0); --kiÓu sv hoµng kim (håi thiªn t¸i t¹o ®¬n)
			end
		end
	end

	if ((boxsuredrop == 1) or ((batch >= 10) and (random(100) <= 7))) then -- ¶i 10 trë lªn --> 7% hép lÔ vËt v­ît ¶i
		DropItem(npcidx, 0, 6, 1, 1392, 0, 5, 0, 0);
	end

	PlayerIndex = nOldPlayer;
end

function award_player(expparam, usetime)
	local experience = expparam;
	if (type(expparam) == "function") then
		experience = expparam(usetime);
	end

	if (experience > 0) then
		local point = floor(experience * 15000 * defEXP_TCHRATE * ChonKinhNghiemTheoMocServer1(1, 2));
		if (GetName() == GetMissionS(TCHMSS_CAPNAME)) then
			point = floor(point * 1.1); --®éi tr­ëng + 10%
		end;
		if (GetLevel() < EN_SUPPORT_LEVEL) then
			point = floor(point * EN_SUPPORT_LVEXP);
		end
		AddOwnExp(point);
		Msg2Player("<#>B¹n ®¹t ®­îc " .. point .. " ®iÓm kinh nghiÖm.");
	end
end;

function award_success(npcidx, usetime) --hoµn thµnh 28 ¶i
	if usetime == 1 then               -- ai cuoi

	end

	award_batch_item(0, npcidx, tch_award_success, floor(usetime / 18), 1); --chØ kn, sè cuèi: 1 = ¶i cuèi 28
end;

function award_hidden_mission(npcidx) --hoµn thµnh 29 ¶i
	local nDIdx = MSGetNextPlayer(TCHMSID, 0);
	while (nDIdx > 0) do
		if (GetPMParam(TCHMSID, nDIdx, 0) > 0) then
			PlayerIndex = MSDIdx2PIdx(TCHMSID, nDIdx);
			TradeAction(0)
			tch_player_award_hidden(npcidx)
		end
		nDIdx = MSGetNextPlayer(TCHMSID, nDIdx);
	end
end;

function tch_AddQueueLadder(teamname, UseTime)
	if (UseTime <= 0) then
		return
	end
	local addstring = teamname .. "/" .. UseTime;
	ExeGlobal(GBID_ExeFuncOneSV, TCHSCRIPT_NPC_DEATH, 0, "tch_addqueue(" .. addstring .. ")") --ch¹y sv 0
end;

function tch_addqueue(stringinfo) --vµo hµng ®îi xÕp h¹ng
	local qunum = GetIniInt("timechallenge.ini", "Queue", "Count")
	qunum = qunum + 1;
	SetIniInt("timechallenge.ini", "Queue", "Count", qunum, 1) --save trùc tiÕp (1)
	SetIniStr("timechallenge.ini", "Queue", qunum, stringinfo, 1) --save trùc tiÕp (1)
end;

function tch_sortrank()
	local qunum = GetIniInt("timechallenge.ini", "Queue", "Count")
	if (qunum <= 0) then --kh«ng cã hµng ®îi nµo
		return
	end
	local szCurRank = GetIniStr("timechallenge.ini", "Section", "Key"); --b¶ng xÕp h¹ng hiÖn t¹i
	for k = 1, qunum do
		local szQuInfo = GetIniStr("timechallenge.ini", "Queue", k);
		if (szQuInfo ~= "") then
			local name = g_GetStringInString(szQuInfo, 1, "/");
			local value = g_GetNumInString(szQuInfo, 2, "/");
			szCurRank = tch_NewLadder(szCurRank, name, value)
		end
	end
	SetIniStr("timechallenge.ini", "Section", "Key", szCurRank, 1) --save trùc tiÕp (1)
	DelIniSec("timechallenge.ini", "Queue", 1)               --save trùc tiÕp (1)
end;

function tch_NewLadder(szCurRank, teamname, UseTime)
	local tbName = { "", "", "", "", "", "", "", "", "", "" };
	local tbTime = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	for i = 0, 9 do
		local name = g_GetStringInString(szCurRank, i * 2 + 1, "/");
		local value = g_GetNumInString(szCurRank, i * 2 + 2, "/");
		if (name == "") then
			break
		end
		tbName[i + 1] = name;
		tbTime[i + 1] = value;
	end

	local nRank = 0;
	for i = 1, 10 do
		if (tbName[i] == "") then
			break
		end
		if (tbName[i] == teamname) then --®· t×m thÊy cã trong b¶ng
			nRank = i;
			break
		end
	end
	if (nRank > 0) then --xãa tªn khái b¶ng tr­íc, nÕu cã
		if (nRank == 10) then --h¹ng cuèi
			tbName[nRank] = "";
			tbTime[nRank] = 0;
		else --h¹ng gi÷a
			local tbtmpname = {};
			local tbtmptime = {};
			for i = nRank + 1, 10 do
				tinsert(tbtmpname, tbName[i])
				tinsert(tbtmptime, tbTime[i])
			end
			local j = 1;
			for i = nRank, 9 do
				tbName[i] = tbtmpname[j];
				tbTime[i] = tbtmptime[j];
				j = j + 1;
			end
			tbName[10] = "";
			tbTime[10] = 0;
		end
	end

	nRank = 0;
	local bEnter = 0;
	for i = 1, 10 do --check cã thÓ vµo b¶ng
		if (tbName[i] == "") then
			tbName[i] = teamname;
			tbTime[i] = UseTime;
			bEnter = 1
			break
		end
		if (UseTime < tbTime[i]) then
			nRank = i;
			bEnter = 1;
			break
		end
	end

	if (bEnter > 0) then --®ñ ®iÒu kiÖn vµo b¶ng, vÞ trÝ thø nRank
		if (nRank > 0) then
			if (nRank == 10) then --cuèi b¶ng --> thay thÕ
				tbName[nRank] = teamname;
				tbTime[nRank] = UseTime;
			else --gi÷a b¶ng --> ®Èy c¸c h¹ng tõ nRank xuèng 1 bËc
				local tbtmpname = {};
				local tbtmptime = {};
				for i = nRank, 9 do
					tinsert(tbtmpname, tbName[i])
					tinsert(tbtmptime, tbTime[i])
				end
				tbName[nRank] = teamname;
				tbTime[nRank] = UseTime;
				local j = 1;
				for i = nRank + 1, 10 do
					tbName[i] = tbtmpname[j];
					tbTime[i] = tbtmptime[j];
					j = j + 1;
				end
			end
		end

		local addstring = ""
		for i = 1, 10 do --save b¶ng míi
			if (tbName[i] == "") then
				break
			end
			addstring = addstring .. tbName[i] .. "/" .. tbTime[i] .. "/";
		end
		return addstring
	end
	return szCurRank
end;

function Drop(nNpcIdx)

end;
