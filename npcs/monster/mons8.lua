Include("\\script\\headers\\trainmapnpc.lua")
Include("\\script\\event\\dropper.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
-- Include("\\script\\event\\trungthu\\helper.lua"); -- event Trung Thu
Include("\\script\\item\\luatrai\\head.lua");
Include("\\script\\event\\quockhanh0209\\helper.lua"); -- quoc khanh

SERIES_Normal8x={
[199]={0,2,4},
[207]={0,2,4},
[201]={1,2,3},
[143]={0,3,4},
[204]={1,3,4},
[205]={0,3,4},
[200]={0,3,4},
[150]={1,2,3},
[151]={1,2,3},
[10]={0,2,4},
[202]={1,3,4},
[203]={0,1,2},
[181]={1,2,3},
[198]={1,2,3},
};

function Born(nNpcIdx)
	local w,x,y = GetNpcPos(nNpcIdx);
	if(SERIES_Normal8x[w] ~= nil) then
		SetNpcSeries(nNpcIdx,SERIES_Normal8x[w][1],SERIES_Normal8x[w][2],SERIES_Normal8x[w][3]);
	else
		SetNpcSeries(nNpcIdx,5,5,5);
	end
	SetNpcExp(nNpcIdx, NPCEXP[NPCLEVEL8X],1);
	SetLife(nNpcIdx, NPCLIFE[NPCLEVEL8X],1);
	SetNpcAR(nNpcIdx, ATTACK_RBASE*NPCLEVEL8X,1);
	SetNpcDefense(nNpcIdx,DEFENSE_BASE*NPCLEVEL8X,1);
	SetNpcRevTime(nNpcIdx,750);
	SetNpcDamage(nNpcIdx,0,0);
	SetNoSkillDamage(nNpcIdx,1);
	SetNpcSkillFreezeTime(nNpcIdx,ceil(22*FRZTIMERATE));	--®ãng b¨ng
	Wake(nNpcIdx);
end

MAP_AITIME8X={
{224,36},
};

function Wake(nNpcIdx)
	local Series = GetNpcSeries(nNpcIdx) + 1;
	SetNpcResist(nNpcIdx,	RESIST90[Series][1]+RESIST90ST[Series][1]*2,
						RESIST90[Series][2]+RESIST90ST[Series][2]*2,
						RESIST90[Series][3]+RESIST90ST[Series][3]*2,
						RESIST90[Series][4]+RESIST90ST[Series][4]*2,
						RESIST90[Series][5]+RESIST90ST[Series][5]*2,1);
	local nSettingsIdx = GetNpcSetIdx(nNpcIdx);
	mons8x_setskill(nNpcIdx,Series,nSettingsIdx);
	local bBoss = 0;
	if (random(9000) == 2) then
		bBoss = 1;
	end
	if (bBoss == 1) then
		SetBoss(nNpcIdx,1);
		SetNpcDmgRate(nNpcIdx,10);
		SetAIMode(nNpcIdx,1);
		g_SetBossStandardAIParam(nNpcIdx);
		SetAIMaxTime(nNpcIdx,10);
		SetNpcExp(nNpcIdx, NPCEXP[NPCLEVEL8X]*8);
		SetNpcHitR(nNpcIdx,HIT_RBASE[NPCLEVEL8X]*2);
		SetNpcSpeed(nNpcIdx, 10);
		SetNpcLRep(nNpcIdx,4);
		SetNpcDamage5(nNpcIdx,	floor(SKILLDMG[Series][1]/10)*NPCLEVEL8X*3,
								floor(SKILLDMG[Series][2]/10)*NPCLEVEL8X*3,
								floor(SKILLDMG[Series][3]/10)*NPCLEVEL8X*3,
								floor(SKILLDMG[Series][4]/10)*NPCLEVEL8X*3,
								floor(SKILLDMG[Series][5]/10)*NPCLEVEL8X*3,2);
	else
		SetBoss(nNpcIdx,0)
		SetNpcHitR(nNpcIdx,HIT_RBASE[NPCLEVEL8X]);
		SetNpcDamage5(nNpcIdx,	floor(SKILLDMG[Series][1]/10)*NPCLEVEL8X,
								floor(SKILLDMG[Series][2]/10)*NPCLEVEL8X,
								floor(SKILLDMG[Series][3]/10)*NPCLEVEL8X,
								floor(SKILLDMG[Series][4]/10)*NPCLEVEL8X,
								floor(SKILLDMG[Series][5]/10)*NPCLEVEL8X,2);
		for i =1,getn(MAP_AITIME8X) do
			if(SubWorld == SubWorldID2Idx(MAP_AITIME8X[i][1])) then
			SetAIMaxTime(nNpcIdx,MAP_AITIME8X[i][2]);	--tèc ®é ho¹t ®éng cña qu¸i, cµng nhá cµng nhanh
			break end
		end
	end
end

ANIMAL_TYPE8X={
590,22,23,24,44,556,557,558
};

AIParam_8xNormal={
[143]=10,
[10]=10,
[224]=10,
};

function mons8x_setskill(nNpcIdx,Series,nSettingsIdx)
	local nAiMode = GetAIMode(nNpcIdx)
	local nAiPrNum = 6;
	if(nAiMode == 1 or nAiMode == 4) then
		nAiPrNum = 4;
	end
	local w,x,y = GetNpcPos(nNpcIdx);
	if(AIParam_8xNormal[w] ~= nil) then
		SetAIParam(nNpcIdx, nAiPrNum, AIParam_8xNormal[w]);	--AIparam7 x¸c suÊt ®¸nh skill thø 4
	else
		SetAIParam(nNpcIdx, nAiPrNum, 30);	--AIparam7 x¸c suÊt ®¸nh skill thø 4
	end
	local Arr = 0;
	for i=1,getn(ANIMAL_TYPE8X) do
		if(ANIMAL_TYPE8X[i] == nSettingsIdx) then
		Arr = i;
		break end
	end
	--skilllevel lµ ngò hµnh t­¬ng kh¾c
	if(Arr > 0) then
		SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 30, 1);	--cËn, ngo¹i, ngò hµnh
		SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 30, 2);	--cËn, ngo¹i, ngò hµnh
		SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 30, 3);	--cËn, ngo¹i, ngò hµnh
		SetNpcSkill(nNpcIdx, 416, 1, 4);	--npc ®o¹n hån thÝch, ngo¹i, v« hÖ
	return end
	
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 30, 1);	--cËn, ngo¹i, ngò hµnh
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 30, 2);	--cËn, ngo¹i, ngò hµnh
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][1], 30, 3);	--cËn, ngo¹i, ngò hµnh
	SetNpcSkill(nNpcIdx, SKILL_LV[Series][2], 30, 4);	--xa, néi, ngò hµnh
end

function LastPlayer(nNpcIdx)
	LT_OnKillTrainMonster(nNpcIdx, NPCLEVEL8X)
end

---- edit: Duc huynh
-- HAM ROT MANH TRANG BI XANH HONG
tbManhXanhHong = { 1527 };
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
	if(bBoss > 0) then
		nLucky = nLucky + 8;
		nDropNum = DROP_Number[NPCLEVEL8X];
		Duc_DropManhXanhHong(nNpcIdx); --- boss xanh roi manh trang bi xanh hong
	end
	local ipcount = 1--GetIPCount(GetIP(2))
	for i=1,nDropNum do
		if(Drop_SpecialItem(nNpcIdx, NPCLEVEL8X, nLucky, bBoss) == 0) then
			Drop_NormalItem(nNpcIdx, NPCLEVEL8X, NPCLEVEL8X, bBoss, nSeries, nLucky, 1,1,1,1,1,ipcount)
		end
	end
	RD_ApplyReputeBonusDrop(nNpcIdx, nDropNum, NPCLEVEL8X, NPCLEVEL8X, bBoss, nSeries, nLucky, 1,1,1,1,1,ipcount)
	drop_event(nNpcIdx,8)
	
	-- Duc_DropEventThieuNhi(nNpcIdx,8) --- event 01062026
	-- Duc_DropEventVuLan(nNpcIdx,8) --- event vu lan
	-- DucTT_DropEventTrungThu(nNpcIdx,8) --- event trung thu
	QK_DropEvent(nNpcIdx,8)
end
