--========================================================================
-- File   : user.lua
-- Su kien: LE HOI THIEU NHI
-- Nguoi viet: Huynh Duc
--========================================================================

Include("\\script\\event\\01062026\\helper.lua");
Include("\\script\\headers\\sumexp.lua");
Include("\\script\\awards\\awardfunc.lua");
Include("\\script\\item\\callbossblue.lua");
Include("\\script\\rankcontrol\\func.lua"); --- rank

-- Phan thuong khi an du 1000 cai 1 loai hop keo
local Duc_GiveReward1000 = function(szBoxName, szLog, szAcc, szRole)
    local tInfo = INFO_EVENT_THIEUNHI;
	-- thuong exp
    local tReward = tInfo.Reward1000.Default;
    AddSumpExp(tReward.Exp);
  
	-- Phan thuong mac dinh
	Duc_GiveReward(tReward.GuildCard);                -- Thiep Bang Hoi
	Duc_GiveReward(tReward.SelfCard);                 -- Thiep Ca Nhan
	-- Duc_GiveReward(tReward.PhoiGiangSaBao);                 -- PhoiGiangSaBao
	-- Duc_GiveReward(tReward.PhoiKimCuongBao);                 --  PhoiKimCuongBao
	Duc_GiveReward(tReward.TrangSuc[random(1, 2)]);   -- random 1/2 trang suc (gold)
	Duc_GiveReward(tReward.Manh);                     -- 1 Manh (d = {min,max} -> random)
	Duc_GiveReward(tReward.HopQua);                   -- Hop Qua Thieu Nhi

	-- TICK counter server-wide (1..100, wrap khi du 100 -> reset 0)
	local nC = Duc_GetReward1000Counter() + 1;
	local idx2;
	if (G_REWARD1000_MS_POS[nC] == 1) then
		-- MOC DAC BIET (Pos={23,35,54,87}):
		local tMs = tInfo.Reward1000.Milestone;
		
		local nRow = g_GetOdds_Award(tMs.Reward, random(100)); -- tong 100
		if  nRow <= 0 then nRow = 1; end
		local tbRw = tMs.Reward[nRow][2];
		local Lock = tMs.Reward[nRow][3];
		idx2 = Duc_GiveReward(tbRw[1], tbRw[2], Lock);
	else
		-- THONG THUONG: random theo trong so trong bang Reward1000.Random
		local nRB = g_GetOdds_Award(tInfo.Reward1000.Random, random(G_REWARDRANDOM1000_TONG));
		if (nRB <= 0) then nRB = 1; end
		local tRBin  = tInfo.Reward1000.Random[nRB][2];   -- {desc, Days [, desc2]}
		local nLockB = tInfo.Reward1000.Random[nRB][3];
		idx2 = Duc_GiveReward(tRBin[1], tRBin[2], nLockB);
	end
	
	-- Luu counter (wrap khi du 100 -> reset ve 0 cho chu ki ke tiep)
	if (nC >= 100) then nC = 0; end
	Duc_SetReward1000Counter(nC);

    Msg2SubWorld("<color=green>Chóc mõng ®¹i hiÖp " .. szRole.. " ®¹t mèc <color=yellow>1000 " .. szBoxName .. "<color> nhiÒu phÇn quµ gi¸ trÞ<color>");
    WriteLog(szLog,
        format("acc<%s> role<%s> Reward1000<%s>: %s", szAcc, szRole, szBoxName,GetItemName(idx2)));
end

-- ======== MOC 2: an du 1000 Ngot Ngao + 1000 Thanh Mat ========
-- Goi SetRankEx(0,1) + Exp/Items theo config Reward1000_M2 (bo sung sau)
Duc_GiveReward1000_M2 = function(szLog, szAcc, szRole)
    local tInfo = INFO_EVENT_THIEUNHI;
    local tM2   = tInfo.Reward1000_M2;

    -- Danh hieu / rank moc 2
    -- SetRankEx(0, 1);
	local tbEnd = tInfo.Time.End
	local szEndTime = format(
		"%04d-%02d-%02d %02d:%02d:%02d",
		tbEnd[1], tbEnd[2], tbEnd[3],
		tbEnd[4] or 0, tbEnd[5] or 0, tbEnd[6] or 0
	)
	AddCRTRankBystr(1,szEndTime,1);
	
    -- Exp neu config co
    if (tM2 ~= nil and tM2.Exp > 0) then AddSumpExp(tM2.Exp); end

    -- Vat pham theo config (chua co thi for khong chay)
    if (tM2 ~= nil and tM2.Items ~= nil) then
        local i, tRw;
        for i = 1, getn(tM2.Items) do
            tRw = tM2.Items[i];
            Duc_GiveReward(tRw.desc, tRw.Days, tRw.Lock);
        end
    end

    -- Msg2SubWorld("<color=green>Chóc mõng ®¹i hiÖp " .. szRole .. " ®¹t <color=yellow>Mèc 2 LÔ Héi ThiÕu Nhi<color> - hoµn thµnh 1000 Hép KÑo Ngät Ngµo + 1000 Hép KÑo Thanh M¸t<color>");
	Msg2SubWorld("<color=green>Chóc mõng ®¹i hiÖp " .. szRole .. " ®¹t <color=yellow>Mèc sö dông 1000 Hép KÑo Ngät Ngµo + 1000 Hép KÑo Thanh M¸t.<color>")
    WriteLog(szLog, format("acc<%s> role<%s> Reward1000_M2 Duc_GiveReward1000_M2", szAcc, szRole));
end

-- Mo Hop Qua Nguyen Lieu (p=4989 d=4):
-- rot ngau nhien 1 loai keo theo ti le 60/30/10
local Duc_OpenMaterialBox = function(idx, nGenre, nDetail, nParticular)
    local tInfo = INFO_EVENT_THIEUNHI;
    local tMatBox = tInfo.MaterialBox;
    -- Check lan 2: tranh truong hop het han ngay luc dung
    if (Duc_IsEndEventThieuNhi() == 1) then
        Talk(1, "", tInfo.Msg.Ended);
        return
    end
	
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	
	if(GetItemCount(nDetail, nGenre, nParticular) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
	
	-- Kiem tra ruong
    if (CalcFreeItemCell() < tInfo.Msg.LimitBag) then
        Talk(1, "", tInfo.Msg.BagFull);
        return
    end
	
    local nPick = g_GetOdds_Award(tMatBox, random(1000));   -- tong trong so 600+300+100 = 1000
    if (nPick <= 0) then nPick = 1; end
	
	-- cache table tMatBox[nPick][2]
    local tItem = tMatBox[nPick][2];   -- {0, genre, detail, particular, 0, 5, 0, 0}
	
	-- cache tb tInfo.Time.End
	local tbEndate = tInfo.Time.End;
	
	local nIdx = Duc_GiveReward(tItem, 0, 0);
	if (nIdx ~= nil) then
		-- DelItem(nDetail, nGenre, 1, nParticular);
		local strNameBox = GetItemName(idx);
		RemoveItem(idx,1,1);
		-- cache API GetItemName
		local strNameAward = GetItemName(nIdx);
		-- Msg2Player("Sö dông <color=green>"..strNameBox.."<color> nhËn: <color=yellow"..strNameAward.."<color>")
		WriteLog("event_thieunhi_" .. GetServerIdx() .. ".txt",
			format("acc<%s> role<%s> Duc_OpenMaterialBox", GetAccount(), GetName()));
	end
end

-- Su Dung Hop Keo (p= 4989 , d= 1 d = 2 d = 3): 
-- cong exp + dem so lan (Get4Cell) + trao ruong + moc 1000
local Duc_EatCandyBox = function(idx, nGenre, nDetail, nParticular)
    local tInfo = INFO_EVENT_THIEUNHI;
    -- Check lan 2: tranh het han ngay luc dung
    if (Duc_IsEndEventThieuNhi() == 1) then
        Talk(1, "", tInfo.Msg.Ended);
        return
    end
	
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	
	if(GetItemCount(nDetail, nGenre, nParticular) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
	
	-- Kiem tra ruong
    if (CalcFreeItemCell() < tInfo.Msg.LimitBag) then
        Talk(1, "", tInfo.Msg.BagFull);
        return
    end
	
	-- cache table tMatBox[nPick][2]
    local tBox = tInfo.CandyBox[nDetail];
    if (tBox == nil) then return end

    -- Loai can du cap moi an duoc
    if (tBox.NeedLevel > 0 and GetLevel() < tBox.NeedLevel) then
        Talk(1, "", "Ph¶i ®¹t cÊp " .. tBox.NeedLevel .. " míi cã thÓ sö dông " .. tBox.Name);
        return
    end

    -- Check lan 2 dieu kien gioi han 1000 (tranh vuot moc khi spam)
    local nCurUse = Duc_GetEatCount(nDetail);
	-- Cache MaxUse
	local nMaxUse = tInfo.Limit.MaxEat;
    if (nCurUse >= nMaxUse) then
        Talk(1, "", "§¹i hiÖp ®· sö dông tèi ®a " .. nMaxUse .. " " .. tBox.Name);
        return
    end
	
	-- Kiem tra ruong khi gan dat moc 1000
	if (nDetail == 3) then
		if nCurUse >= 999  then
			if (CalcFreeItemCell() < 10) then
				Talk(1, "", "§¹i hiÖp s¾p ®¹t mèc 1000 vui lßng ®Ó 10 « trèng, míi cã thÓ nhËn th­ëng.");
				return
			end
		end
	end
	
    -- cache tb tInfo.Time.End
    local tbEndate = tInfo.Time.End;
    local nIdx;

	-- Tru hop, cong kinh nghiem, cong so lan
    -- DelItem(nDetail, nGenre, 1, nParticular);
	RemoveItem(idx,1,1);
    AddSumpExp(tBox.Exp);
    nCurUse = Duc_AddEatCount(nDetail);
	
    -- Hop Keo Thanh Mat (d=3)
    if (nDetail == 3) then
        local nRoll = random(G_THANHMAT_TONG_TRONGSO);
        if (nRoll <= G_THANHMAT_FAIL_TRONGSO) then -- mo that bai
            -- Talk(1, "", "§¹i hiÖp lÇn nµy më kh«ng tróng vËt phÈm nµo.");
        else -- mo thanh cong
            local nPick = g_GetOdds_Award(tInfo.ThanhMatRoll, nRoll - G_THANHMAT_FAIL_TRONGSO);
            if (nPick <= 0) then nPick = 1; end
            local tRand     = tInfo.ThanhMatRoll[nPick][2];
            local nLockRand = tInfo.ThanhMatRoll[nPick][3];  -- khoa V.V
            nIdx = Duc_GiveReward(tRand[1], tRand[2], nLockRand);
            -- Talk(1, "", "§¹i hiÖp nhËn ®­îc "..GetItemName(nIdx));
        end
    end

    -- cache API
    local szRole = GetName();
    local szAcc  = GetAccount();
    local szLog  = "event_thieunhi_" .. GetServerIdx() .. ".txt";

    -- Moc 1: chi rieng Hop Keo Thanh Mat (tBox.Reward1000=1) khi du 1000 cai
    if (nCurUse == nMaxUse and tBox.Reward1000 == 1) then
        %Duc_GiveReward1000(tBox.Name, szLog, szAcc, szRole);
    end

    -- Moc 2: an du 1000 Ngot Ngao (d=2) + 1000 Thanh Mat (d=3) -> SetRankEx + thuong dac biet (1 lan)
    -- if ((nDetail == 2 or nDetail == 3)
        -- and Duc_GetEatCount(2) >= nMaxUse
        -- and Duc_GetEatCount(3) >= nMaxUse
        -- and Duc_GetReward1000M2Flag() == 0) then
        -- Duc_GiveReward1000_M2(szLog, szAcc, szRole);
        -- Duc_SetReward1000M2Flag();
    -- end

    -- Talk(1, "", format("Sö dông: %s (%d/%d)", tBox.Name, nCurUse, nMaxUse));
	if nIdx then -- thong bao co vat pham
		Msg2Player(format("§¹i hiÖp nhËn ®­îc %s.\nSö dông: %s (%d/%d)", GetItemName(nIdx), tBox.Name, nCurUse, nMaxUse))
	else
		Msg2Player(format("Sö dông: %s (%d/%d)", tBox.Name, nCurUse, nMaxUse))
	end
    WriteLog(szLog,
        format("acc<%s> role<%s> Duc_EatCandyBox<%s> exp<%d> count<%d>",
            szAcc, szRole, tBox.Name, tBox.Exp, nCurUse));
end

-- Dung Keo Tiem Nang / Ky Nang (p=4991 d = 1, d=2): 
-- Get1Cell trong TASKVALUE_SKILLPOINT
local Duc_UseSkillCandy = function(idx, nGenre, nDetail, nParticular)
    local tInfo = INFO_EVENT_THIEUNHI;
    -- Check lan 2: tranh het han ngay luc dung
    -- if (Duc_IsEndEventThieuNhi() == 1) then
        -- Talk(1, "", tInfo.Msg.Ended);
        -- return
    -- end

    if (GetLevel() < tInfo.Limit.MinLevel) then
        Talk(1, "", "Ph¶i ®¹t cÊp " .. tInfo.Limit.MinLevel .. " míi cã thÓ sö dông vËt phÈm nµy");
        return
    end
	
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	
	if(GetItemCount(nDetail, nGenre, nParticular) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
	
    local tCandy = tInfo.SkillCandy[nDetail];
    if (tCandy == nil) then return end

    local nTaskVal = GetTask(TASKVALUE_SKILLPOINT);
    if (nTaskVal == nil) then nTaskVal = 0; end
    local nUsed = Get1Cell(nTaskVal, tCandy.Cell);

    -- Check lan 2 dieu kien gioi han so lan
    if (nUsed >= tCandy.MaxUse) then
        Talk(1, "", "§¹i hiÖp ®· sö dông " .. tCandy.MaxUse .. " " .. tCandy.Name .. " råi");
        return
    end

    -- Cong chi so theo loai keo
    if (tCandy.Type == "potential") then
        AddProp(5);
        Talk(1, "", "Sö dông thµnh c«ng: nhËn 5 tiÒm n¨ng");
    else
        AddMagicPoint(1);
        Talk(1, "", "Sö dông thµnh c«ng: nhËn 1 ®iÓm kü n¨ng");
    end

    SetTask(TASKVALUE_SKILLPOINT, Set1Cell(nTaskVal, tCandy.Cell, nUsed + 1));
    -- DelItem(nDetail, nGenre, 1, nParticular);
	RemoveItem(idx,1,1);
    WriteLog("event_thieunhi_" .. GetServerIdx() .. ".txt",
        format("acc<%s> role<%s> Duc_UseSkillCandy<%s> count<%d>",
            GetAccount(), GetName(), tCandy.Name, nUsed + 1));
end

--Ruong bao hap tuyet hoc (p=4991 d=3):
function Duc_RuongChon(nG, nD, nP, idx)
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	local nIdx, T, nGenre, nDetail, nParticular, L, S, R = GetItemProp(idx);

	if(GetItemCount(nDetail,nGenre,nParticular) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
	
	-- cache table
    local tInfo = INFO_EVENT_THIEUNHI;
    -- Check lan 2: tranh het han ngay luc bam chon
	-- if (Duc_IsEndEventThieuNhi() == 1) then
        -- Talk(1, "", tInfo.Msg.Ended);
        -- return
    -- end

    if (CalcFreeItemCell() < tInfo.Msg.LimitBag) then
        Talk(1, "", tInfo.Msg.BagFull);
        return
    end
	
    -- Tru 1 Ruong, trao vat pham da chon
	-- DelItem(nDetail, nGenre, 1, nParticular);
	RemoveItem(idx,1,1);
    -- local tbEndate = tInfo.Time.End;
	
    local nIdx = Duc_GiveReward({g = nG, d = nD, p = nP, Count = 1}, 0, 0);
	Talk(1, "", "§¹i hiÖp nhËn ®­îc "..GetItemName(nIdx));
end

-- Hien menu cua Ruong Bao Hap
local Duc_OpenChestSelect = function(idx, nGenre, nDetail, nParticular)
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	if(GetItemCount(nDetail,nGenre,nParticular) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
	
	-- cache table
    local tInfo = INFO_EVENT_THIEUNHI;
	
	-- Kiem tra ruong
    if (CalcFreeItemCell() < tInfo.Msg.LimitBag) then
        Talk(1, "", tInfo.Msg.BagFull);
        return
    end
	
    -- if (Duc_IsEndEventThieuNhi() == 1) then
        -- Talk(1, "", tInfo.Msg.Ended);
        -- return
   -- end
	
    local tBtn = {};
    tinsert(tBtn, "Ph¸o 30 - 04 [TiÒm N¨ng]/#Duc_RuongChon(6,12,4985,"..idx..")");
    tinsert(tBtn, "Ph¸o 30 - 04 [Kü N¨ng]/#Duc_RuongChon(6,13,4985,"..idx..")");
    tinsert(tBtn, "KÑo ThiÕu Nhi [TiÒm N¨ng]/#Duc_RuongChon(6,1,4991,"..idx..")");
    tinsert(tBtn, "KÑo ThiÕu Nhi [Kü N¨ng]/#Duc_RuongChon(6,2,4991,"..idx..")");
	tinsert(tBtn, "§Ìn hoa ®¨ng [tiÒm n¨ng]/#Duc_RuongChon(6,1,5001,"..idx..")");
    tinsert(tBtn, "§Ìn hoa ®¨ng [kü n¨ng]/#Duc_RuongChon(6,2,5001,"..idx..")");
	tinsert(tBtn, "B¸nh trung thu [tiÒm n¨ng]/#Duc_RuongChon(6,1,5010,"..idx..")");
    tinsert(tBtn, "B¸nh trung thu [kü n¨ng]/#Duc_RuongChon(6,2,5010,"..idx..")");
	tinsert(tBtn, "Hå Cèt Töu Quèc Kh¸nh [TiÒm N¨ng]/#Duc_RuongChon(6,1,5010,"..idx..")");
    tinsert(tBtn, "Bæ §oµn Töu Quèc Kh¸nh [Kü N¨ng]/#Duc_RuongChon(6,2,5010,"..idx..")");
	tinsert(tBtn, "KÕt thóc/cance");
    SayNew("Chän vËt phÈm tõ R­¬ng B¶o H¹p TuyÖt Häc:", getn(tBtn), tBtn);
end

--  Ham Main Ngoi Sao May Man
local Duc_UseNgoiSao = function(idx, nGenre, nDetail, nParticular)
    local tInfo = INFO_EVENT_THIEUNHI;
    if (Duc_IsEndEventThieuNhi() == 1) then 
		Talk(1, "", tInfo.Msg.Ended); 
		return 
	end
	
    if (CalcFreeItemCell() < tInfo.Msg.LimitBag) then Talk(1, "", tInfo.Msg.BagFull); return end
	
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	
	if(GetItemCount(nDetail, nGenre, nParticular) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
    -- counter dung chung toan server (uu tien RAM; ini chi load lai khi VER doi)
    local nCur = Duc_GetCounter();
    local nPos = nCur + 1;
    if (nPos > 100) then nPos = 1; end
    local nGrp = G_NGOISAO_POSCOUNTER[nPos];
    if (nGrp == nil) then nGrp = 1; end
    local tRw = tInfo.NgoiSao.Reward[nGrp];

    -- tru 1 Ngoi Sao, trao thuong, luu counter moi
    -- DelItem(nDetail, nGenre, 1, nParticular);
	RemoveItem(idx,1,1);
    local nIdx = Duc_GiveReward(tRw[1], tRw[2], 0);
    Duc_SetCounter(nPos);

    if (nIdx ~= nil) then
        Talk(1, "", "§¹i hiÖp nhËn ®­îc "..GetItemName(nIdx));
    end
    WriteLog("event_thieunhi_" .. GetServerIdx() .. ".txt",
        format("acc<%s> role<%s> Duc_UseNgoiSao pos<%d>", GetAccount(), GetName(), nPos));
end


-- ============ HOP QUA THIEU NHI (p4989 d5): mo hop -> rot 1 vat pham (giong 30-04) ============
local Duc_OpenHopQua = function(idx, nGenre, nDetail, nParticular)
    local tInfo = INFO_EVENT_THIEUNHI;
    if (Duc_IsEndEventThieuNhi() == 1) then Talk(1, "", tInfo.Msg.Ended); return end
    if (CalcFreeItemCell() < tInfo.Msg.LimitBag) then Talk(1, "", tInfo.Msg.BagFull); return end

	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	
	if(GetItemCount(nDetail, nGenre, nParticular) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
	
    -- chon vat pham: >=65 (~36%) -> dong 1-2 ; <65 (~64%) -> dong 3..het
    local arrItem;
    if (random(100) >= tInfo.HopQua.HiRate) then
        arrItem = tInfo.HopQua.Pool[random(1, 2)];
    else
        arrItem = tInfo.HopQua.Pool[random(3, getn(tInfo.HopQua.Pool))];
    end
	print(arrItem[1],arrItem[2],arrItem[3],arrItem[4],arrItem[5],arrItem[6],arrItem[8])
    -- arrItem = descriptor day du {0,g,d,p,..} (ngua genre 0 layout rieng) -> Duc_GiveReward lo het
    local nIdx = Duc_GiveReward(arrItem, arrItem[8], 0);
    if (nIdx == nil) then
        -- print("[ Duc_OpenHopQua ] -- Loi nIdx nil");
        return
    end
    local szName = GetItemName(nIdx);
    -- DelItem(nDetail, nGenre, 1, nParticular);
	RemoveItem(idx,1,1);
    Talk(1, "", "§¹i hiÖp nhËn ®­îc "..szName);
    WriteLog("event_thieunhi_" .. GetServerIdx() .. ".txt",
        format("acc<%s> role<%s> OpenHopQua -> item<%s>", GetAccount(), GetName(), szName));
end


-- local Duc_UseChongChong = function(idx,G,D,P)
Duc_UseChongChong = function(idx,G,D,P)
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	if(GetItemCount(D,G,P) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ")
		return
	end
	local itemName = GetItemName(idx);
	if(IsStateSkill(GetNpcIdx(), 631) == 1) then
	Msg2Player("HiÖu øng "..itemName.." vÉn cßn , xin ®õng l·ng phÝ");
	return end

	if(IsStateSkill(GetNpcIdx(), 631) == 1) then
	Msg2Player("§¹i hiÖp ®· sö dông hiÖu øng 'GÊu b«ng' råi kh«ng thÓ sö dông "..itemName.." ®­îc n÷a");
	return end
	
	if GetCash() < 200000 then
		Msg2Player("Trong ng­êi kh«ng ®ñ 20 v¹n kh«ng thÓ sö dông "..itemName.." ®­îc");
		return
	end

	local nMemCount = GetTeamSize();

	if (nMemCount == 0 ) then
		AddSkillState(631, 1, 1,32400);
		Pay(200000);
		-- DelItem(D,G,1,P);
		RemoveItem(idx,1,1);
		return
	end
	
	Pay(200000);
	-- DelItem(D,G,1,P);
	RemoveItem(idx,1,1);

	local nTeamId = GetTeam();
	for i=0,7 do
		PlayerIndex = GetTeamMem(nTeamId, i );
		if(PlayerIndex > 0) then
			if(IsStateSkill(GetNpcIdx(), 631) ~= 1) then
				AddSkillState(631, 1, 1, 32400);
			end
		end
	end
	

	Msg2Player("Sö dông thµnh c«ng "..itemName.."");
	WriteLog("event_thieunhi_" .. GetServerIdx() .. ".txt",
        format("acc<%s> role<%s> Duc_UseChongChong ", GetAccount(), GetName()));
end

-- local Duc_UseGauBong = function(idx,G,D,P)
Duc_UseGauBong = function(idx,G,D,P)
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	if(GetItemCount(D,G,P) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ")
		return
	end
	local itemName = GetItemName(idx);
	if(IsStateSkill(GetNpcIdx(), 631) == 1) then
	Msg2Player("HiÖu øng "..itemName.." vÉn cßn , xin ®õng l·ng phÝ");
	return end

	if(IsStateSkill(GetNpcIdx(), 631) == 1) then
	Msg2Player("§¹i hiÖp ®· sö dông hiÖu øng 'Chong chãng' råi kh«ng thÓ sö dông "..itemName.." ®­îc n÷a");
	return end

	local cXu = 50;
	local nXuThuong = GetItemCount(5, 6, 4984, 0, 3, 2);
	if nXuThuong < cXu then
		Msg2Player("Trong ng­êi kh«ng ®ñ "..cXu.." xu kh«ng thÓ sö dông "..itemName.."");
		return end
	
	local nMemCount = GetTeamSize();

	if (nMemCount == 0 ) then
		AddSkillState(631, 1, 1,32400);
		DelItem(5, 6, cXu, 4984, 0, 0, 2);
		-- DelItem(D,G,1,P);
		RemoveItem(idx,1,1);
		return
	end
	
	DelItem(5, 6, cXu, 4984, 0, 0, 2);
	-- DelItem(D,G,1,P);
	RemoveItem(idx,1,1);

	local nTeamId = GetTeam();
	for i=0,7 do
		PlayerIndex = GetTeamMem(nTeamId, i );
		if(PlayerIndex > 0) then
			if(IsStateSkill(GetNpcIdx(), 631) ~= 1) then
				AddSkillState(631, 1, 1,32400);
			end
		end
	end

	Msg2Player("Sö dông thµnh c«ng "..itemName.."");
	WriteLog("event_thieunhi_" .. GetServerIdx() .. ".txt",
        format("acc<%s> role<%s> Duc_UseGauBong ", GetAccount(), GetName()));
end

-- ENTRY main(idx)
function main(idx)
	if(IsMyItem(idx) == 0) then
		Msg2Player("VËt phÈm kh«ng cßn trªn ng­êi nhµ ng­êi")
		return
	end
	
    local nIdx, T, G, D, P, L, S, R = GetItemProp(idx);
	if(GetItemCount(D,G,P) < 1) then
		Msg2Player("VËt phÈm kh«ng ®ñ");
		return
	end
	
	-- print(G,D,P,idx)
	local tInfo = INFO_EVENT_THIEUNHI;
    local tItem = tInfo.Item;
	
	-- Kiem tra ruong
    if (CalcFreeItemCell() < tInfo.Msg.LimitBag) then
        Talk(1, "", tInfo.Msg.BagFull);
        return
    end
	
	-- Lenh bai bosss xanh
    if (P == tItem.LenhBaiBossXanh.p and D == tItem.LenhBaiBossXanh.d and G == tItem.LenhBaiBossXanh.g) then
		Duc_UseLBBossXanh(idx, G, D, P);
		return
    end
	
	    -- 4991: d=1 tiem nang, d=2 ky nang
    if (P == tItem.KeoTiemNang.p and (D == 1 or D == 2)) then
        %Duc_UseSkillCandy(idx, G, D, P);
        return
    end
	
	
	    -- 4991 d=3: Ruong Bao Hap -> mo menu SayNew chon vat pham
    if (P == tItem.KeoTiemNang.p and D == 3) then
        %Duc_OpenChestSelect(idx, G, D, P);
        return
    end
	
	
	
	
	
	
    -- Check lan 1 (so voi bien global tinh san, khong goi Date2Min moi lan)
    if (Duc_IsEndEventThieuNhi() == 1) then
        Talk(1, "", tInfo.Msg.Ended);
        return
    end

    -- 4989: d = 4 = hop nguyen lieu
    if (P == tItem.BoxTraiCay.p and D == tItem.BoxNguyenLieu.d) then
        %Duc_OpenMaterialBox(idx, G, D, P);
        return
    end

    -- 4989 d=5: Hop Qua Thieu Nhi 
    if (P == tItem.BoxTraiCay.p and D == tItem.BoxHopQua.d) then
        %Duc_OpenHopQua(idx, G, D, P);
        return
    end

	-- 4989  d=1 d=2 d=3 = an hop keo
    if (P == tItem.BoxTraiCay.p) then
        %Duc_EatCandyBox(idx, G, D, P);
        return
    end


    -- Ngoi Sao May Man (ID tu cho) -> counter global
    if (P == tItem.NgoiSao.p and D == tItem.NgoiSao.d) then
        %Duc_UseNgoiSao(idx, G, D, P);
        return
    end
	
	-- Lenh bai bosss xanh
    -- if (P == tItem.LenhBaiBossXanh.p and D == tItem.LenhBaiBossXanh.d and G == tItem.LenhBaiBossXanh.g) then
        -- Duc_UseLBBossXanh(idx, G, D, P);
        -- return
    -- end
	
	-- Chong Chuong
	if (P == tItem.ChongChong.p and D == tItem.ChongChong.d and G == tItem.ChongChong.g) then
        -- %Duc_UseChongChong(idx, G, D, P);
		local tBtn = {};
		tinsert(tBtn, "Ta ®ång ý/#Duc_UseChongChong("..idx..", "..G..", "..D..", "..P..")");
		tinsert(tBtn, "Khi kh¸c/cance");
		SayNew("§¹i hiÖp cã ®ång ý sö dông kh«ng?", getn(tBtn), tBtn);
        return
    end
	
	-- Gau Bong
	if (P == tItem.GauBong.p and D == tItem.GauBong.d and G == tItem.GauBong.g) then
        -- %Duc_UseGauBong(idx, G, D, P);
		local tBtn = {};
		tinsert(tBtn, "Ta ®ång ý/#Duc_UseGauBong("..idx..", "..G..", "..D..", "..P..")");
		tinsert(tBtn, "Khi kh¸c/cance");
		SayNew("§¹i hiÖp cã ®ång ý sö dông kh«ng?", getn(tBtn), tBtn);
        return
    end
end

function cance()
end