Include("\\script\\headers\\tasklist.lua");
Include("\\script\\headers\\trainmapnpc.lua")
Include("\\script\\event\\dropper.lua");
Include("\\script\\tong\\task\\taskhead.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
-- Include("\\script\\event\\trungthu\\helper.lua"); -- event Trung Thu
Include("\\script\\item\\luatrai\\head.lua");
Include("\\script\\event\\quockhanh0209\\helper.lua"); -- quoc khanh


SERIES_Normal9x = {
	[75] = { 1, 3, 4 },
	[144] = { 0, 2, 4 },
	[93] = { 1, 3, 4 },
	[124] = { 0, 1, 2 },
	[152] = { 1, 2, 3 },
};

function Born(nNpcIdx)
	local w, x, y = GetNpcPos(nNpcIdx);
	if (SERIES_Normal9x[w] ~= nil) then
		SetNpcSeries(nNpcIdx, SERIES_Normal9x[w][1], SERIES_Normal9x[w][2], SERIES_Normal9x[w][3]);
	else
		SetNpcSeries(nNpcIdx, 5, 5, 5);
	end
	SetNpcExp(nNpcIdx, NPCEXP[NPCLEVEL9X], 1);
	SetLife(nNpcIdx, NPCLIFE[NPCLEVEL9X], 1);
	SetNpcAR(nNpcIdx, ATTACK_RBASE * NPCLEVEL9X, 1);
	SetNpcDefense(nNpcIdx, DEFENSE_BASE * NPCLEVEL9X, 1);
	SetNpcRevTime(nNpcIdx, 800);
	SetNpcDamage(nNpcIdx, 0, 0);
	SetNoSkillDamage(nNpcIdx, 1);
	SetNpcSkillFreezeTime(nNpcIdx, ceil(25 * FRZTIMERATE)); --®ãng b¨ng
	Wake(nNpcIdx);
end

MAP_AITIME9X = {
	{ 321, 26 },
	{ 322, 26 },
	{ 225, 26 },
	{ 226, 26 },
	{ 227, 26 },
	{ 875, 26 },
};

function Wake(nNpcIdx)
	local Series = GetNpcSeries(nNpcIdx) + 1;
	SetNpcResist(nNpcIdx, RESIST90[Series][1],
		RESIST90[Series][2],
		RESIST90[Series][3],
		RESIST90[Series][4],
		RESIST90[Series][5], 1);
	local nSettingsIdx = GetNpcSetIdx(nNpcIdx);
	mons9x_setskill(nNpcIdx, Series, nSettingsIdx);
	local bBoss = 0;
	if (random(9000) == 2) then
		bBoss = 1;
	end
	if (bBoss == 1) then
		SetBoss(nNpcIdx, 1);
		SetNpcDmgRate(nNpcIdx, 10);
		SetAIMode(nNpcIdx, 1);
		g_SetBossStandardAIParam(nNpcIdx);
		SetAIMaxTime(nNpcIdx, 9);
		SetNpcExp(nNpcIdx, NPCEXP[NPCLEVEL9X] * 8);
		SetNpcHitR(nNpcIdx, HIT_RBASE[NPCLEVEL9X] * 2);
		SetNpcSpeed(nNpcIdx, 10);
		SetNpcLRep(nNpcIdx, 5);
		SetNpcDamage5(nNpcIdx, SKILLDMG[Series][1] * 3, SKILLDMG[Series][2] * 3, SKILLDMG[Series][3] * 3,
			SKILLDMG[Series][4] * 3, SKILLDMG[Series][5] * 3, 2);
	else
		SetBoss(nNpcIdx, 0)
		SetNpcHitR(nNpcIdx, HIT_RBASE[NPCLEVEL9X]);
		SetNpcDamage5(nNpcIdx, SKILLDMG[Series][1], SKILLDMG[Series][2], SKILLDMG[Series][3], SKILLDMG[Series][4],
			SKILLDMG[Series][5], 2);
		for i = 1, getn(MAP_AITIME9X) do
			if (SubWorld == SubWorldID2Idx(MAP_AITIME9X[i][1])) then
				SetAIMaxTime(nNpcIdx, MAP_AITIME9X[i][2]); --tèc ®é ho¹t ®éng cña qu¸i, cµng nhá cµng nhanh
				break
			end
		end
	end
end

ANIMAL_TYPE9X = {
	13, 14, 20
};

AIParam_9xNormal = {
	[75] = 10,
	[144] = 15,
	[124] = 15,
	[93] = 15,
};

function mons9x_setskill(nNpcIdx, Series, nSettingsIdx)
	local nAiMode = GetAIMode(nNpcIdx)
	local nAiPrNum = 6;
	if (nAiMode == 1 or nAiMode == 4) then
		nAiPrNum = 4;
	end
	local w, x, y = GetNpcPos(nNpcIdx);
	if (AIParam_9xNormal[w] ~= nil) then
		SetAIParam(nNpcIdx, nAiPrNum, AIParam_9xNormal[w]); --AIparam7 x¸c suÊt ®¸nh skill thø 4
	else
		SetAIParam(nNpcIdx, nAiPrNum, 50);            --AIparam7 x¸c suÊt ®¸nh skill thø 4
	end

	local Arr = 0;
	for i = 1, getn(ANIMAL_TYPE9X) do
		if (ANIMAL_TYPE9X[i] == nSettingsIdx) then
			Arr = i;
			break
		end
	end
	--skilllevel lµ ngò hµnh t­¬ng kh¾c
	if (Arr > 0) then
		SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 35, 1); --cËn, ngo¹i, ngò hµnh
		SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 35, 2); --cËn, ngo¹i, ngò hµnh
		SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 35, 3); --cËn, ngo¹i, ngò hµnh
		SetNpcSkill(nNpcIdx, 416, 1, 4);            --npc ®o¹n hån thÝch, ngo¹i, v« hÖ
		return
	end
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 35, 1); --cËn, ngo¹i, ngò hµnh
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 35, 2); --cËn, ngo¹i, ngò hµnh
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 35, 3); --cËn, ngo¹i, ngò hµnh
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][2], 35, 4); --xa, néi, ngò hµnh
end

function LastPlayer(nNpcIdx)
	LT_OnKillTrainMonster(nNpcIdx, NPCLEVEL9X)
	if (PlayerIndex > 0) then
		--if(GetBossType(nNpcIdx) > 0) then
		--	trainskill_monster(90)
		--else
		--	trainskill_monster(30)
		--end
		--------nhiÖm vô lÖnh bµi bang héi--------
		local taskval = GetTask(TASKQUEST06)
		local nCurTask = Get3Cell(taskval, 2)
		if (nCurTask > 0) then
			local w, x, y = GetWorldPos()
			local nSettingsIdx = GetNpcSetIdx(nNpcIdx);
			local nNeedCount = Ttask_killmonsinfo(nCurTask, w, nSettingsIdx);
			if (nNeedCount > 0) then --®óng lo¹i
				local nCurCount = Get2Cell(taskval, 4);
				if (nCurCount < nNeedCount) then
					nCurCount = nCurCount + 1;
					if (nCurCount < nNeedCount) then
						SetTask(TASKQUEST06, Set2Cell(taskval, 4, nCurCount))
						AddTaskGuide(2, 5, nCurTask, 0, "")
						AddTaskGuide(2, 5, nCurTask, 0,
							tbTRandTASKSTR[nCurTask][2] .. " Sè l­îng ®· hoµn thµnh: <color=green>" .. nCurCount, 1,
							tbTRandMOREIF[nCurTask][6], 0, 0);
						Msg2Player("B¹n h¹ ®­îc " .. nCurCount .. " " .. GetNpcName(nNpcIdx))
					else --hoµn thµnh nhiÖm vô
						AddTaskGuide(2, 5, nCurTask, 0, "")
						AddTaskGuide(2, 5, nCurTask, 1,
							tbTRandTASKSTR[nCurTask][2] .. " Sè l­îng ®· hoµn thµnh: <color=green>" .. nCurCount);
						taskval = Set3Cell(taskval, 2, 0)
						taskval = Set2Cell(taskval, 4, 0)
						SetTask(TASKQUEST06, taskval)
						Ttask_DoneTask(nCurTask)
					end
				end
			end
		end
	end
end

---- edit: Duc huynh
-- HAM ROT MANH TRANG BI XANH HONG
tbManhXanhHong = { 1528, 1529 };
function Duc_DropManhXanhHong(nNpcIdx)
	local nManh = tbManhXanhHong[random(getn(tbManhXanhHong))];
	local nMIdx = AddItemTemp(0, 4, nManh, 0, 0, 5, 0, 0);
	if (nMIdx ~= nil and nMIdx > 0) then
		DropItemIdx(nNpcIdx, nMIdx);
	end
end

function Drop(nNpcIdx)
	local nSeries = GetNpcSeries(nNpcIdx)
	local nDropNum = 1;
	local nLucky = GetLucky()
	local bBoss = GetBossType(nNpcIdx);
	if (bBoss > 0) then
		nLucky = nLucky + 10;
		nDropNum = DROP_Number[NPCLEVEL9X];
		Duc_DropManhXanhHong(nNpcIdx); --- boss xanh roi manh trang bi xanh hong
	end
	local ipcount = 1            --GetIPCount(GetIP(2))
	for i = 1, nDropNum do
		if (Drop_SpecialItem(nNpcIdx, NPCLEVEL9X, nLucky, bBoss) == 0) then
			Drop_NormalItem(nNpcIdx, NPCLEVEL9X, NPCLEVEL9X, bBoss, nSeries, nLucky, 1, 1, 1, 1, 1, ipcount)
		end
	end
	RD_ApplyReputeBonusDrop(nNpcIdx, nDropNum, NPCLEVEL9X, NPCLEVEL9X, bBoss, nSeries, nLucky, 1, 1, 1, 1, 1, ipcount)
	drop_event(nNpcIdx, 9)
	LT_DropWood(nNpcIdx)
	-- Duc_DropEventThieuNhi(nNpcIdx,9) --- event 01062026
	-- Duc_DropEventVuLan(nNpcIdx,9) --- event vu lan
	-- DucTT_DropEventTrungThu(nNpcIdx,9) --- event trung thu
	QK_DropEvent(nNpcIdx, 9)
end
