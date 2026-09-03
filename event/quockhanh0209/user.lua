Include("\\script\\event\\quockhanh0209\\helper.lua")

function main(idx)
    if (IsMyItem(idx) == 0) then
        Msg2Player("VËt phÈm kh«ng cßn trong hµnh trang.")
        return
    end
    local nIdx, t, g, d, p, l, s, r = GetItemProp(idx)
    if (g == 6 and p == 5008 and d >= 1 and d <= 3) then
        QK_UseQuanTrang(idx, g, d, p)
        return
    end
    if (g == 6 and p == 5008 and d == 4) then
        QK_OpenHopQua(idx, g, d, p)
        return
    end
    if (g == 6 and p == 5009 and d >= 1 and d <= 2) then
        if (QK_IsEndKhaoNghiem()) then
            Talk(1, "", QK_MSG_KN_END)
            return
        end
        QKKN_Main()
        return
    end
    if (g == 6 and p == 5010 and d == 1) then
        QK_UseHoCotTuu(idx, g, d, p)
        return
    end
    if (g == 6 and p == 5010 and d == 2) then
        QK_UseBoDoanTuu(idx, g, d, p)
        return
    end
    -- tro ve trung thu roi
    -- if (g == 6 and p == 5010 and d == 3) then
    --     QK_AskUseHuanChuongDocLap(idx, g, d, p)
    --     return
    -- end
    -- if (g == 6 and p == 5010 and d == 4) then
    --     QK_AskUseHuanChuongTuDo(idx, g, d, p)
    --     return
    -- end
    if (g == 6 and p == 5020 and d == 1) then
        QK_UseRuongManh4Bo(idx)
        return
    end
    if (g == 6 and p == 5020 and d == 2) then
        QK_UseTuVaHaoKhi(idx)
        return
    end
    if (g == 6 and p == 5020 and d == 3) then
        QK_UseHoaPhaoHieuTrieu(idx)
        return
    end
end

function QK_IsForbiddenMap()
    local w, x, y = GetWorldPos()
    if (w >= 387 and w <= 396) then return 1 end -- Lien Dau
    if (w == 209) then return 1 end              -- Cong Binh Tu
    if (w == 851) then return 1 end              -- Chuong Mon
    if (w >= 862 and w <= 865) then return 1 end -- Dai Hoi Vo Lam
    return nil
end

QK_RUONG_MANH_INI = "event\\quockhanh0209\\counterRuongManh.ini"
QK_RUONG_MANH_DATA = nil
function QK_GetRuongManhCount(szRole)
    if (szRole == nil or szRole == "") then szRole = GetName() end
    local nVal = GetIniInt(QK_RUONG_MANH_INI, "Count", szRole)
    if (nVal == nil) then nVal = 0 end
    return nVal
end

function QK_SetRuongManhCount(szRole, nVal)
    if (szRole == nil or szRole == "") then szRole = GetName() end
    SetIniInt(QK_RUONG_MANH_INI, "Count", szRole, nVal, 1)
end

function QK_AddRuongManhCount(szRole)
    local nCur = QK_GetRuongManhCount(szRole)
    QK_SetRuongManhCount(szRole, nCur + 1)
    return nCur + 1
end

-- Danh sach toan bo manh cua 4 bo Nhu Tinh - Hiep Cot - An Bang - Dinh Quoc
TB_MANH_4_BO = {
    -- Nhu Tinh (32 manh: 1399..1430)
    1399, 1400, 1401, 1402, 1403, 1404, 1405, 1406,
    1407, 1408, 1409, 1410, 1411, 1412, 1413, 1414,
    1415, 1416, 1417, 1418, 1419, 1420, 1421, 1422,
    1423, 1424, 1425, 1426, 1427, 1428, 1429, 1430,
    -- Hiep Cot (32 manh: 1431..1462)
    1431, 1432, 1433, 1434, 1435, 1436, 1437, 1438,
    1439, 1440, 1441, 1442, 1443, 1444, 1445, 1446,
    1447, 1448, 1449, 1450, 1451, 1452, 1453, 1454,
    1455, 1456, 1457, 1458, 1459, 1460, 1461, 1462,
    -- An Bang (24 manh: 747..770)
    747, 748, 749, 750, 751, 752,
    753, 754, 755, 756, 757, 758,
    759, 760, 761, 762, 763, 764,
    765, 766, 767, 768, 769, 770,
    -- Dinh Quoc (24 manh: 783..806)
    783, 784, 785, 786, 787, 788,
    789, 790, 791, 792, 793, 794,
    795, 796, 797, 798, 799, 800,
    801, 802, 803, 804, 805, 806
}

function QK_UseRuongManh4Bo(idx)
    if (IsMyItem(idx) == 0) then return end
    if (CalcFreeItemCell() < 2) then
        Talk(1, "", "Hµnh trang cÇn Ýt nhÊt 2 « trèng.")
        return
    end
    RemoveItem(idx, 1, 1)
    local nTotal = getn(TB_MANH_4_BO)
    local nPickDetail = TB_MANH_4_BO[random(1, nTotal)]
    local nItemIdx = QK_GiveItem({ g = 4, d = nPickDetail, p = 1 }, 1, 0, 0)
    local szName = (nItemIdx and nItemIdx > 0) and GetItemName(nItemIdx) or "M¶nh trang bÞ"
    local nCount = QK_AddRuongManhCount(GetName())
    Msg2Player("Më <color=yellow>R­¬ng M¶nh Nhu T×nh - HiÖp Cèt - An Bang - §Þnh Quèc<color> (LÇn thø " ..
        nCount .. "), nhËn ®­îc: <color=green>" .. szName .. "<color>.")
    WriteLog("RuongManh4Bo_" .. GetServerIdx() .. ".txt",
        format("acc<%s> role<%s> mo lan <%d> nhan <%s (4,%d,1)>", GetAccount(), GetName(), nCount, szName, nPickDetail))
end

function QK_UseTuVaHaoKhi(idx)
    if (IsMyItem(idx) == 0) then return end
    if (QK_IsForbiddenMap()) then
        Talk(1, "", "Kh«ng thÓ sö dông t¹i b¶n ®å nµy")
        return
    end
    if (IsStateSkill(GetNpcIdx(), 978) == 1) then
        Msg2Player("HiÖu øng <color=yellow>Tö Hµ Hµo KhÝ<color> vÉn cßn, kh«ng thÓ sö dông céng dån.")
        return
    end
    RemoveItem(idx, 1, 1)
    AddSkillState(978, 3, 1, 10800) -- Tang 3% KTC trong 10 phut (10800 ticks), chet khong mat
    Msg2Player("Sö dông thµnh c«ng <color=yellow>Tö Hµ Hµo KhÝ<color>, t¨ng 3% Kh¸ng tÊt c¶ trong 10 phót.")
end

function QK_UseHoaPhaoHieuTrieu(idx)
    if (IsMyItem(idx) == 0) then return end
    if (QK_IsForbiddenMap()) then
        Talk(1, "", "Kh«ng thÓ sö dông t¹i b¶n ®å nµy")
        return
    end
    if (IsStateSkill(GetNpcIdx(), 735) == 1) then
        Msg2Player("HiÖu øng <color=yellow>Ho¶ Ph¸o HiÖu TriÖu<color> vÉn cßn, kh«ng thÓ sö dông céng dån.")
        return
    end
    RemoveItem(idx, 1, 1)
    AddSkillState(735, 2, 1, 10800) -- Tang 200 SL, 200 NL, 3% KTC trong 10 phut (10800 ticks), chet khong mat
    Msg2Player(
        "Sö dông thµnh c«ng <color=yellow>Háa Ph¸o HiÖu TriÖu<color>, t¨ng 200 sinh lùc, 200 néi lùc va 3% Kh¸ng tÊt c¶ trong 10 phut.")
end

function QK_UseHoCotTuu(idx, g, d, p)
    if (IsMyItem(idx) == 0) then return end
    if (GetLevel() < 80) then
        Talk(1, "", "CÇn ®¹t cÊp 80 trì lªn ®Ó sö dông.")
        return
    end
    local nTaskVal = GetTask(TASK4_CLEAR_EVENTQUOCKHANH)
    if (nTaskVal == nil) then nTaskVal = 0 end
    local nUsed = Get1Cell(nTaskVal, 1)
    if (nUsed >= 2) then
        Talk(1, "", "Mçi nh©n vËt chØ cã thÓ sö dông tèi ®a <color=red>2 Hæ Cèt Töu Quèc Kh¸nh [TiÒm N¨ng]<color>.")
        return
    end
    RemoveItem(idx, 1, 1)
    AddPotential(5)
    SetTask(TASK4_CLEAR_EVENTQUOCKHANH, Set1Cell(nTaskVal, 1, nUsed + 1))
    Msg2Player("Sö dông thµnh c«ng Hæ Cèt Töu Quèc Kh¸nh [TiÒm N¨ng] (" ..
        (nUsed + 1) .. "/2), nhan duoc <color=yellow>5 diem tiem nang<color>.")
end

function QK_UseBoDoanTuu(idx, g, d, p)
    if (IsMyItem(idx) == 0) then return end
    if (GetLevel() < 80) then
        Talk(1, "", "CÇn ®¹t cÊp 80 trì lªn ®Ó sö dông.")
        return
    end
    local nTaskVal = GetTask(TASK4_CLEAR_EVENTQUOCKHANH)
    if (nTaskVal == nil) then nTaskVal = 0 end
    local nUsed = Get1Cell(nTaskVal, 2)
    if (nUsed >= 2) then
        Talk(1, "", "Mçi nh©n vËt chØ cã thÓ sö dông tèi ®a <color=red>2 Bå §oµn Töu Quèc Kh¸nh [Kü N¨ng]<color>.")
        return
    end
    RemoveItem(idx, 1, 1)
    AddMagicPoint(1)
    SetTask(TASK4_CLEAR_EVENTQUOCKHANH, Set1Cell(nTaskVal, 2, nUsed + 1))
    Msg2Player("Sö dông thµnh c«ng Bå §oµn Töu Quèc Kh¸nh [Kü N¨ng] (" ..
        (nUsed + 1) .. "/2), nhan duoc <color=yellow>1 diem ky nang<color>.")
end

function QK_AskUseHuanChuongDocLap(idx, G, D, P)
    local tBtn = {
        "Ta ®ång y/#QK_DoUseHuanChuongDocLap(" .. idx .. ", " .. G .. ", " .. D .. ", " .. P .. ")",
        "Khong dung/Exit"
    }
    SayNew(
        "Su dung <color=yellow>Huan Chuong Doc Lap<color>: ton <color=red>20 van<color>, nhan <color=green>10% diem may man trong 30 phut<color> cho ban than va dong doi.\nDai hiep co dong y khong?",
        getn(tBtn), tBtn)
end

function QK_DoUseHuanChuongDocLap(idx, G, D, P)
    if (IsMyItem(idx) == 0) then
        Msg2Player("<color=red>VËt phÈm kh«ng cßn trong hµnh trang.<color>")
        return
    end
    if (GetItemCount(D, G, P) < 1) then
        Msg2Player("<color=red>Sè l­îng vËt phÈm kh«ng ®ñ.<color>")
        return
    end
    local itemName = GetItemName(idx)
    if (GetLevel() < 80) then
        Msg2Player("Ph¶i ®¹t cÊp <color=red>80<color> míi cã thÓ sö dông " .. itemName)
        return
    end
    if (IsStateSkill(GetNpcIdx(), 631) == 1) then
        Msg2Player("HiÖu øng <color=yellow>" .. itemName .. "<color> vÉn cßn, xin ®õng l·ng phÝ.")
        return
    end
    if (GetCash() < 200000) then
        Msg2Player("Trong ng­ëi kh«ng ®ñ <color=red>20 v¹n<color>, kh«ng thÓ sö dông " .. itemName)
        return
    end

    local nMemCount = GetTeamSize()
    if (nMemCount == 0) then
        AddSkillState(631, 1, 1, 32400)
        Pay(200000)
        RemoveItem(idx, 1, 1)
        Msg2Player("Sö dông thµnh c«ng " .. itemName .. ", nhËn 10% may mÀn trong 30 phót.")
        return
    end

    Pay(200000)
    RemoveItem(idx, 1, 1)
    local nTeamId = GetTeam()
    for i = 0, 7 do
        PlayerIndex = GetTeamMem(nTeamId, i)
        if (PlayerIndex > 0) then
            if (IsStateSkill(GetNpcIdx(), 631) ~= 1) then
                AddSkillState(631, 1, 1, 32400)
            end
        end
    end
    Msg2Player("Sö dông thµnh c«ng " .. itemName .. ", toµn ®éi nhËn 10% may m¾n trong 30 phót.")
end

function QK_AskUseHuanChuongTuDo(idx, G, D, P)
    local tBtn = {
        "Ta ®ång ý/#QK_DoUseHuanChuongTuDo(" .. idx .. ", " .. G .. ", " .. D .. ", " .. P .. ")",
        "Kh«ng dïng/Exit"
    }
    SayNew(
        "Sö dông <color=yellow>Hu©n Ch­¬ng Tù Do<color>: tèn <color=red>50 xu<color>, nhËn <color=green>20% ®iÓm may m¾n trong 30 phut<color> cho b¶n th©n va ®ång ®éi.\n§¹i hiÖp cã ®ång ý kh«ng?",
        getn(tBtn), tBtn)
end

function QK_DoUseHuanChuongTuDo(idx, G, D, P)
    if (IsMyItem(idx) == 0) then
        Msg2Player("<color=red>VËt phÈm kh«ng cßn trong hµnh trang.<color>")
        return
    end
    if (GetItemCount(D, G, P) < 1) then
        Msg2Player("<color=red>Sè l­îng vËt phÈm kh«ng ®ñ.<color>")
        return
    end
    local itemName = GetItemName(idx)
    if (GetLevel() < 80) then
        Msg2Player("Ph¶i ®¹t cÊp <color=red>80<color> míi cã thÓ sö dông " .. itemName)
        return
    end
    if (IsStateSkill(GetNpcIdx(), 631) == 1) then
        Msg2Player("HiÖu øng <color=yellow>" .. itemName .. "<color> vÉn cßn, xin ®õng l·ng phÝ.")
        return
    end
    if (GetItemCount(5, 6, 4984, 0, 3, 2) < 50) then
        Msg2Player("Trong ng­ëi kh«ng ®ñ <color=red>50 xu<color>, kh«ng thÓ sö dông " .. itemName)
        return
    end

    local nMemCount = GetTeamSize()
    if (nMemCount == 0) then
        AddSkillState(631, 2, 1, 32400)
        DelItem(5, 6, 50, 4984)
        RemoveItem(idx, 1, 1)
        Msg2Player("Sö dông thµnh c«ng " .. itemName .. ", nhËn 20% may mÀn trong 30 phót.")
        return
    end

    DelItem(5, 6, 50, 4984)
    RemoveItem(idx, 1, 1)
    local nTeamId = GetTeam()
    for i = 0, 7 do
        PlayerIndex = GetTeamMem(nTeamId, i)
        if (PlayerIndex > 0) then
            if (IsStateSkill(GetNpcIdx(), 631) ~= 1) then
                AddSkillState(631, 2, 1, 32400)
            end
        end
    end
    Msg2Player("Sö dông thµnh c«ng " .. itemName .. ", toµn ®éi nhËn 20% may mÀn trong 30 phót.")
end
