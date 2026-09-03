--PhÇn th­ëng Phong L¨ng ®é
-- 3/4/2021
Include("\\script\\awards\\awardfunc.lua")
Include("\\script\\headers\\moc_cap_nhat_kinh_nghiem_server1.lua");
Include("\\script\\headers\\math.lua")
Include("\\script\\headers\\bluedrop.lua")
--Include("\\script\\headers\\basesetting.lua");--®· cã npclevels.lua ë file sö dông
--®· cã tasklist ë file sö dông
Include("\\script\\event\\dropper.lua");--globallist
Include("\\script\\item\\pld_hatmam\\head.lua");
Include("\\script\\awards\\stackaw.lua");
Include("\\script\\headers\\sumexp.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
Include("\\script\\event\\quockhanh0209\\helper.lua"); 

tbCertificate_exp =	--tæng tØ lÖ = 1000
{
	[1]	= {nExp = 10, 	nRate = 300},
	[2]	= {nExp = 12, 	nRate = 400},
	[3]	= {nExp = 15, 	nRate = 200},
	[4]	= {nExp = 18, 	nRate = 50},
	[5]	= {nExp = 20, 	nRate = 50},
};--th­ëng Truy C«ng LÖnh
function pld_certificate_award(bSpecial)
	--local nstep = random(1000);
	--local ncurstep 	= 0;
	--local naddedexp = 0;
	--for i = 1, getn(tbCertificate_exp) do
	--	if (ncurstep + tbCertificate_exp[i].nRate >= nstep) then
	--		naddedexp = tbCertificate_exp[i].nExp;
	--		break;
	--	end
	--	ncurstep = ncurstep + tbCertificate_exp[i].nRate;
	--end
	--if(GetLevel() < EN_SUPPORT_LEVEL) then
	--	AddOwnExp(floor(naddedexp * 200000 * defEXP_TRCLRATE*EN_SUPPORT_LVEXP));
	--else
	--	AddOwnExp(floor(naddedexp * 200000 * defEXP_TRCLRATE));
	--end
	--if(bSpecial > 0) then	--th­ëng thªm cho lo¹i ®Æc biÖt (lÖnh bµi thñy tÆc)
	--	gAddStack_PTC(10)	--sl: 10 c¸i phiÕu trß ch¬i
	--end
	AddSumpExp(ChonKinhNghiemTheoMocServer1(5000000, 15000000));
	--if(GetGlbMissionV(GMSV_MIDPROGRAM) > 0) then	--nhËn tinh anh bµi sè 1
	--	gAddStackInBox(6,2,4090,0,5,0,0);
	--end
	
	if(CalcFreeItemCell() > 0) then
		idx = AddItemTemp(0,6,8,4984,0,5,0)
		SetItemDate(idx,7*60*24)
		AddItemIdx(idx)
	end
				
	give_event_pld_killrobber()
end

--th­ëng khi qua bê b¾c
function pld_endaward()
	--if(HaveSpace(1,1) == 1) then
	--	gAddStack_PTC(1)	--sl: 1 c¸i phiÕu trß ch¬i
	--end
	--nv t©n thñ-------------
	local taskclear = GetTask(TASKCLEARDAY_12);
	local passcount = Get1Cell(taskclear,5);
	SetTask(TASKCLEARDAY_12,Set1Cell(taskclear,5,passcount+1));
	--------------------------
	--SetTask(TASKVALUE_NEWPOINT, GetTask(TASKVALUE_NEWPOINT) + 2)
	--Msg2Player("B¹n nhËn ®­îc <color=yellow>2 ®iÓm Tinh Lùc")
	--local almtask = GetTask(TASKBIGQUEST_7);
	--local almtimes = Get3Cell(almtask,3);
	--if(almtimes > 0) then
	--	almtimes = almtimes - 1;
	--	SetTask(TASKBIGQUEST_7,Set3Cell(almtask,3,almtimes));
	--	local almpoint = random(2,3);
	--	SetTask(TASKVALUE_ALMIGHTYPOINT, GetTask(TASKVALUE_ALMIGHTYPOINT) + almpoint)
	--	Msg2Player("[Toµn n¨ng lÖnh] B¹n nhËn ®­îc <color=yellow>"..almpoint.." §iÓm Toµn N¨ng<color>. C¬ héi cßn:<color=green> "..almtimes.." lÇn")
	--end
	give_event_pld()
	
	-- event 01/06/2026 (th­ëng hoan thanh fld)
	-- Duc_GiveKeoCam(10);
	-- Duc_GiveThiep(20, 20);
	----- kÕt thóc -----
	-- event Vu Lan (th­ëng hoan thanh fld)
	-- Duc_GiveBongHong(10);
	-- Duc_GiveThiep(20, 20);
	-- event Trung thu
	QKHelper_Add(2);
	----- kÕt thóc -----
end

tbPLDNormalDrop=
{  --{rate,{item,date,delwhenpick}},
  {50,{nil,nil,nil}},--§å xanh
  {600,{{0,1,2,0,5,5,0,0},1,0}},--m¸u
  --{10,{{0,4,489,0,0,5,0,0},7,0}},--lÖnh bµi Phong l¨ng ®é
  --{10,{{0,6,1,18,0,5,0,0},0,0}},--T©m T©m T­¬ng ¸nh phï
  --{700,{{0,6,1,206,0,5,0,0},0,1}},--®å chÝ param3=1:nhÆt sö dông ngay
  --{10,{{0,6,1,400,90,0,0,0},7,0}},--S¸t thñ gi¶n
  --{30,{{0,6,0,20,0,5,0,0},0,0}},--hoa hång
  --{10,{{0,6,0,{1,10},0,5,0,0},0,0}},--thuèc ngo¹i c«ng
};

--rít qu¸i th­êng
function pld_dropnormal(nNpcIdx)
	local nLucky = GetLucky();
	local nRand = random(10000-nLucky*3);
	local index = g_GetOdds_Award(tbPLDNormalDrop, nRand);
	if(index > 0) then
		if(tbPLDNormalDrop[index][2][1] == nil) then		--®å xanh
			nLucky = nLucky + 40;
			local series = GetNpcSeries(nNpcIdx);
			nRand = 300;
			generate_blueitem(nNpcIdx, 10, 12, series, nLucky, nRand, 1, 1, 1, 1, 1, 1)
		else
			local detail,particular = 0,0;
			if(type(tbPLDNormalDrop[index][2][1][3]) == "number") then
				detail = tbPLDNormalDrop[index][2][1][3];
			else
				detail = random(tbPLDNormalDrop[index][2][1][3][1],tbPLDNormalDrop[index][2][1][3][2]);
			end
			if(type(tbPLDNormalDrop[index][2][1][4]) == "number") then
				particular = tbPLDNormalDrop[index][2][1][4];
			else
				particular = random(tbPLDNormalDrop[index][2][1][4][1],tbPLDNormalDrop[index][2][1][4][2]);
			end
			local idx = AddItemTemp(	tbPLDNormalDrop[index][2][1][1],
									tbPLDNormalDrop[index][2][1][2],
									detail,
									particular,
									tbPLDNormalDrop[index][2][1][5],
									tbPLDNormalDrop[index][2][1][6],
									tbPLDNormalDrop[index][2][1][7],
									tbPLDNormalDrop[index][2][1][8]);
			if(tbPLDNormalDrop[index][2][3] > 0) then		--nhÆt xãa
				DelWhenPick(idx,1)
			end
			if(tbPLDNormalDrop[index][2][2] > 0) then	--cã H¹n sö dông
				SetItemDate(idx,tbPLDNormalDrop[index][2][2],0)
			end
			DropItemIdx(nNpcIdx,idx)
		end
	end
	PLDPF_DropHatMamNormal(nNpcIdx)
end

tbPLDBossDrop_Sure=  --ch¾c ch¾n rít
{  --{rate,{item,date}},
  --{0,{{0,6,1,2743,0,5,0,0},0}},--B¶o R­¬ng Thñy TÆc
  {0,{{0,6,1,18,0,5,0,0},0}},--T©m T©m T­¬ng ¸nh phï
  --{0,{{0,6,2,1372,0,5,0,0},7}},--B¹ch C©u Hoµn x2 kü n¨ng
  {0,{{0,6,0,3,0,5,0,0},0}},--®¹i lùc
};

tbPLDBossDropS_Sure=  --ch¾c ch¾n rít
{  --{rate,{item,date}},
  {0,{{0,6,1,2743,0,5,0,0},0}},--B¶o R­¬ng Thñy TÆc
  {0,{{0,6,1,18,0,5,0,0},0}},--T©m T©m T­¬ng ¸nh phï
  --{0,{{0,6,2,1372,0,5,0,0},7}},--B¹ch C©u Hoµn x2 kü n¨ng
  {0,{{0,6,0,3,0,5,0,0},0}},--®¹i lùc
  {0,{{0,4,353,0,0,5,0,0},0}},--Tinh Hång B¶o Th¹ch
  {0,{{0,4,238,0,0,5,0,0},0}},--Thñy tinh
};


--boss cui
tbPLDBossDrop=
{  --{rate,{item,date}},
  {1000,{{0,1,2,0,5,5,0,0},0}},--m¸u
  {800,{{0,6,1,122,0,5,0,0},0}},--Phóc Duyªn nhá
  {700,{{0,6,1,123,0,5,0,0},0}},--Phóc Duyªn võa
  {600,{{0,6,1,124,0,5,0,0},0}},--Phóc Duyªn lín
  --{4,{{0,6,1,26,0,5,0,0},0}},--vlmt
  --{4,{{0,6,1,22,0,5,0,0},0}},--tÈy tñy kinh
  {150,{{0,6,1,71,0,5,0,0},3}},--Tiªn Th¶o Lé
  {150,{{0,6,1,72,0,5,0,0},3}},--Thiªn s¬n B¶o Lé
  {210,{{0,6,1,73,0,5,0,0},3}},--B¸ch Qu¶ Lé
  {1000,{{0,6,0,20,0,5,0,0},0,0}},--hoa hång
  --{120,{{0,6,1,23,0,5,0,0},0}},--thiÕt la h¸n
  {30,{{0,4,353,0,0,5,0,0},0}},--Tinh Hång B¶o Th¹ch
  {600,{{0,6,0,{1,10},0,5,0,0},0}},--thuèc ngo¹i c«ng
  {500,{{0,6,1,{117,121},0,5,0,0},0}},--thuèc néi c«ng
  {10,{{0,4,240,0,0,5,0,0},0}},--Thñy tinh
  {10,{{0,4,238,0,0,5,0,0},0}},--Thñy tinh
  {10,{{0,4,239,0,0,5,0,0},0}},--Thñy tinh
  --{450,{{0,6,1,400,90,0,0,0},7}},--S¸t thñ gi¶n
  --{420,{{0,4,489,0,0,5,0,0},7}},--LÖnh bµi Phong L¨ng §é
  --{30,{{0,6,1,12,0,5,0,0},0}},--Bµn Nh­îc T©m Kinh
  --{160,{{0,6,1,2620,0,5,0,0},3}},--X¸ Lîi Kim §¬n
  {100,{{0,6,1,15,0,5,0,0},0}},--Phi Phong
  --{200,{{0,6,2,1182,0,5,0,0},7}},--B¹ch C©u Hoµn x3 kü n¨ng
  --{300,{{0,6,2,123,0,5,0,0},0}},--danh väng lé tiÓu
  --{150,{{0,6,2,124,0,5,0,0},0}},--danh väng lé §¹i
  --{250,{{0,6,1,14,0,5,0,0},0}},--TiÓu Hång Bao
  --{25,{{0,6,1,13,0,5,0,0},0}},--§¹i Hång Bao
  --{250,{{0,6,1,440,0,5,0,0},0}},--M¶nh S¬n Hµ X· T¾c 100
  --{50,{{0,6,1,2514,0,5,0,0},0}},--M¶nh S¬n Hµ X· T¾c 1000
  --{30,{{0,6,1,125,0,5,0,0},3}},--QuÕ Hoa Töu
  --{60,{{0,6,1,{27,28,33,34,35,36,37,38,39,40,41,42,43,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59}, 0, 5, 0, 0},0}},--bÝ kÝp c¸c lo¹i
  {300,{{0,6,1,2743,0,5,0,0},0}},--B¶o R­¬ng Thñy TÆc
  --{10,{{0,6,1,2739,0,5,0,0},0}},--cµn kh«n phÝch lÞch ®¬n
};

tbPLDBossDropS=
{  --{rate,{item,date}},
  {1000,{{0,1,2,0,5,5,0,0},0}},--m¸u
  {800,{{0,6,1,122,0,5,0,0},0}},--Phóc Duyªn nhá
  {700,{{0,6,1,123,0,5,0,0},0}},--Phóc Duyªn võa
  {600,{{0,6,1,124,0,5,0,0},0}},--Phóc Duyªn lín
  {4,{{0,6,1,26,0,5,0,0},0}},--vlmt
  {4,{{0,6,1,22,0,5,0,0},0}},--tÈy tñy kinh
  {150,{{0,6,1,71,0,5,0,0},3}},--Tiªn Th¶o Lé
  {150,{{0,6,1,72,0,5,0,0},3}},--Thiªn s¬n B¶o Lé
  {210,{{0,6,1,73,0,5,0,0},3}},--B¸ch Qu¶ Lé
  {1000,{{0,6,0,20,0,5,0,0},0,0}},--hoa hång
  {120,{{0,6,1,23,0,5,0,0},0}},--thiÕt la h¸n
  {50,{{0,4,353,0,0,5,0,0},0}},--Tinh Hång B¶o Th¹ch
  {600,{{0,6,0,{1,10},0,5,0,0},0}},--thuèc ngo¹i c«ng
  {500,{{0,6,1,{117,121},0,5,0,0},0}},--thuèc néi c«ng
  {15,{{0,4,240,0,0,5,0,0},0}},--Thñy tinh
  {15,{{0,4,238,0,0,5,0,0},0}},--Thñy tinh
  {15,{{0,4,239,0,0,5,0,0},0}},--Thñy tinh
  --{450,{{0,6,1,400,90,0,0,0},7}},--S¸t thñ gi¶n
  --{420,{{0,4,489,0,0,5,0,0},7}},--LÖnh bµi Phong L¨ng §é
  {30,{{0,6,1,12,0,5,0,0},0}},--Bµn Nh­îc T©m Kinh
  {160,{{0,6,1,2620,0,5,0,0},3}},--X¸ Lîi Kim §¬n
  {100,{{0,6,1,15,0,5,0,0},0}},--Phi Phong
  --{200,{{0,6,2,1182,0,5,0,0},7}},--B¹ch C©u Hoµn x3 kü n¨ng
  {300,{{0,6,2,123,0,5,0,0},0}},--danh väng lé tiÓu
  {150,{{0,6,2,124,0,5,0,0},0}},--danh väng lé §¹i
  {250,{{0,6,1,14,0,5,0,0},0}},--TiÓu Hång Bao
  {25,{{0,6,1,13,0,5,0,0},0}},--§¹i Hång Bao
  {250,{{0,6,1,440,0,5,0,0},0}},--M¶nh S¬n Hµ X· T¾c 100
  {50,{{0,6,1,2514,0,5,0,0},0}},--M¶nh S¬n Hµ X· T¾c 1000
  {30,{{0,6,1,125,0,5,0,0},3}},--QuÕ Hoa Töu
  {60,{{0,6,1,{27,28,33,34,35,36,37,38,39,40,41,42,43,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59}, 0, 5, 0, 0},0}},--bÝ kÝp c¸c lo¹i
  {300,{{0,6,1,2743,0,5,0,0},0}},--B¶o R­¬ng Thñy TÆc
  --{10,{{0,6,1,2739,0,5,0,0},0}},--cµn kh«n phÝch lÞch ®¬n
};

--rít boss thñy tÆc
function pld_dropboss(nNpcIdx, bBigBoss)
	for i=1,getn(tbPLDBossDrop_Sure) do	--list ch¾c ch¾n rít
		local idx = AddItemTemp(	tbPLDBossDrop_Sure[i][2][1][1],
								tbPLDBossDrop_Sure[i][2][1][2],
								tbPLDBossDrop_Sure[i][2][1][3],
								tbPLDBossDrop_Sure[i][2][1][4],
								tbPLDBossDrop_Sure[i][2][1][5],
								tbPLDBossDrop_Sure[i][2][1][6],
								tbPLDBossDrop_Sure[i][2][1][7],
								tbPLDBossDrop_Sure[i][2][1][8]);
		if(tbPLDBossDrop_Sure[i][2][2] > 0) then	--cã H¹n sö dông
			SetItemDate(idx,tbPLDBossDrop_Sure[i][2][2],0)
		end
		DropItemIdx(nNpcIdx,idx)
	end
	local aluck = GetLucky()*3;
	local dropnum = 15;
	if(bBigBoss > 0) then
		for i=1,dropnum do	--list ngÉu nhiªn
			local index = g_GetOdds_Award(tbPLDBossDropS, random(12000-aluck));
			if(index <= 0) then
				index = 1;
			end
			local detail,particular = 0,0;
			if(type(tbPLDBossDropS[index][2][1][3]) == "number") then
				detail = tbPLDBossDropS[index][2][1][3];
			else
				detail = random(tbPLDBossDropS[index][2][1][3][1],tbPLDBossDropS[index][2][1][3][2]);
			end
			if(type(tbPLDBossDropS[index][2][1][4]) == "number") then
				particular = tbPLDBossDropS[index][2][1][4];
			else
				particular = random(tbPLDBossDropS[index][2][1][4][1],tbPLDBossDropS[index][2][1][4][2]);
			end
			
			local idx = AddItemTemp(tbPLDBossDropS[index][2][1][1],
									tbPLDBossDropS[index][2][1][2],
									detail,
									particular,
									tbPLDBossDropS[index][2][1][5],
									tbPLDBossDropS[index][2][1][6],
									tbPLDBossDropS[index][2][1][7],
									tbPLDBossDropS[index][2][1][8]);
			if(tbPLDBossDropS[index][2][2] > 0) then	--cã H¹n sö dông
				SetItemDate(idx,tbPLDBossDropS[index][2][2],0)
			end
			DropItemIdx(nNpcIdx,idx)
		end
	else
		for i=1,dropnum do	--list ngÉu nhiªn
			local index = g_GetOdds_Award(tbPLDBossDrop, random(12000-aluck));
			if(index <= 0) then
				index = 1;
			end
			local detail,particular = 0,0;
			if(type(tbPLDBossDrop[index][2][1][3]) == "number") then
				detail = tbPLDBossDrop[index][2][1][3];
			else
				detail = random(tbPLDBossDrop[index][2][1][3][1],tbPLDBossDrop[index][2][1][3][2]);
			end
			if(type(tbPLDBossDrop[index][2][1][4]) == "number") then
				particular = tbPLDBossDrop[index][2][1][4];
			else
				particular = random(tbPLDBossDrop[index][2][1][4][1],tbPLDBossDrop[index][2][1][4][2]);
			end
			
			local idx = AddItemTemp(tbPLDBossDrop[index][2][1][1],
									tbPLDBossDrop[index][2][1][2],
									detail,
									particular,
									tbPLDBossDrop[index][2][1][5],
									tbPLDBossDrop[index][2][1][6],
									tbPLDBossDrop[index][2][1][7],
									tbPLDBossDrop[index][2][1][8]);
			if(tbPLDBossDrop[index][2][2] > 0) then	--cã H¹n sö dông
				SetItemDate(idx,tbPLDBossDrop[index][2][2],0)
			end
			DropItemIdx(nNpcIdx,idx)
		end
	end

	
	
	local aroundexp = floor(ChonKinhNghiemTheoMocServer1(2000000, 6000000)*EXPRATE);
	if(bBigBoss > 0) then	--®¹i thñy tÆc ®Çu lÜnh
	
		for i=1,getn(tbPLDBossDropS_Sure) do	--list ch¾c ch¾n rít
			local idx = AddItemTemp(	tbPLDBossDropS_Sure[i][2][1][1],
									tbPLDBossDropS_Sure[i][2][1][2],
									tbPLDBossDropS_Sure[i][2][1][3],
									tbPLDBossDropS_Sure[i][2][1][4],
									tbPLDBossDropS_Sure[i][2][1][5],
									tbPLDBossDropS_Sure[i][2][1][6],
									tbPLDBossDropS_Sure[i][2][1][7],
									tbPLDBossDropS_Sure[i][2][1][8]);
			if(tbPLDBossDropS_Sure[i][2][2] > 0) then	--cã H¹n sö dông
				SetItemDate(idx,tbPLDBossDropS_Sure[i][2][2],0)
			end
			DropItemIdx(nNpcIdx,idx)
		end
	
		DropItem(nNpcIdx, 0,6,1,2743,0,5,0,0)	--b¶o r­¬ng thñy tÆc
		DropItem(nNpcIdx, 0,6,0,6,0,5,0,0)	--phi tèc
		for i=1,5 do
			bDrop = AddItemTemp(0, 6, 1, 2015, 0, 5, 0)
			if(bDrop > 0) then
				local Yr,Mth,Dy,Hr,Mn,Se = GetDate();
				SetItemDate(bDrop, Yr,Mth,Dy,23,59)
				DropItemIdx(nNpcIdx, bDrop)
			end
		end
		--SetTask(TASKVALUE_NEWPOINT, GetTask(TASKVALUE_NEWPOINT) + 1)
		--Msg2Player("B¹n nhËn ®­îc <color=yellow>1 ®iÓm Tinh Lùc")
		aroundexp = floor(ChonKinhNghiemTheoMocServer1(5000000, 15000000)*EXPRATE);
	else
		local bDrop = AddItemTemp(0, 6, 1, 2015, 0, 5, 0)
		if(bDrop > 0) then
			local Yr,Mth,Dy,Hr,Mn,Se = GetDate();
			SetItemDate(bDrop, Yr,Mth,Dy,23,59)
			DropItemIdx(nNpcIdx, bDrop)
		end
	end
	PLDPF_DropHatMamBoss(nNpcIdx, bBigBoss)
	local w,x,y = GetNpcPos(nNpcIdx);
	for i=0,8 do
		local nPIdx = GetNextPlayerAroundNpc(nNpcIdx,0,i)
		while nPIdx > 0 do
			PlayerIndex = nPIdx;
			local dw,dx,dy = GetWorldPos();
			if(GetDistance(x,y,dx,dy) < 800) then	--®øng gÇn boss ®c nhËn
				if(GetLevel() < EN_SUPPORT_LEVEL) then
					AddOwnExp(floor(aroundexp*EN_SUPPORT_LVEXP));
				else
					AddOwnExp(aroundexp)
				end
				--SetTask(TASKVALUE_NEWPOINT, GetTask(TASKVALUE_NEWPOINT) + 1)
				--Msg2Player("B¹n nhËn ®­îc <color=yellow>1 ®iÓm Tinh Lùc")
			end
			nPIdx = GetNextPlayerAroundNpc(nNpcIdx,nPIdx,i)
		end
	end
end
