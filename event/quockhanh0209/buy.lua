Include("\\script\\event\\quockhanh0209\\helper.lua")

function QK_OpenNgauNhien1000(count)
    local ao = 0
    local non = 0
    local giay = 0
    for i = 1, count * 1000 do
        local rand = random(1, 100)
        if rand <= 60 then
            ao = ao + 1
        elseif rand <= 90 then
            non = non + 1
        else
            giay = giay + 1
        end
    end
    if ao > 0 then
        QK_GiveItem(QK_getMat(QK_Enum_EventItem.AoQuanNhan), ao, 0, 0)
    end
    if non > 0 then
        QK_GiveItem(QK_getMat(QK_Enum_EventItem.NonQuanNhan), non, 0, 0)
    end
    if giay > 0 then
        QK_GiveItem(QK_getMat(QK_Enum_EventItem.GiayQuanNhan), giay, 0, 0)
    end
    Talk(1, "", "NhËn ®­îc:\nAo Qu©n Nh©n x" .. ao .. "\nNãn Qu©n Nh©n x" .. non .. "\nGiµy Qu©n Nh©n x" .. giay)
end

function QK_InputBuyEventItem(nIndex, count)
    if (QKLib_isEnd()) then
        Talk(1, "", QKLib_getMsg().End); return
    end
    local packageSale = QKLib_getPackageSale(nIndex)
    if not packageSale then return end
    QK_nBuyTargetIndex = nIndex;
    QK_nBuyTargetCount = count;
    if count == 1 or packageSale.IsOpen==1 then
        QK_DoBuyCallback(1)
    else
        GetString("QK_DoBuyCallback", "NhËp sè l­îng muèn mua: (1 = " .. count .. " vËt phÈm)")
    end
    -- AskClientForNumber("QK_DoBuyCallback", 1, 1000, "NhËp sè l­îng muèn mua: (1 = " .. count .. " vËt phÈm)");
end

function QK_DoBuyCallback(nAmount)
    if not QK_nBuyTargetIndex then return end
    local nIndex = QK_nBuyTargetIndex;
    local count = QK_nBuyTargetCount or 1;
    QK_nBuyTargetIndex = nil;
    QK_nBuyTargetCount = nil;
    QK_DoBuyEventItem(nIndex, nAmount, count);
end

function QK_DoBuyEventItem(nIndex, nAmount, count)
    if (QKLib_isEnd()) then
        Talk(1, "", QKLib_getMsg().End); return
    end
    local packageSale = QKLib_getPackageSale(nIndex)
    if not packageSale then return end
    if not nAmount or nAmount <= 0 then return end

    local nNeedXu = (packageSale.Xu or 0) * nAmount;
    local nNeedVan = (packageSale.Van or 0) * nAmount;
    local nNeedTichLuy = (packageSale.TichLuy or 0) * nAmount;

    if (nNeedXu > 0 and GetItemCount(5, 6, 4984, 0, 3, 2) < nNeedXu) then
        Talk(1, "", "Kh«ng ®ñ xu."); return
    end
    if (nNeedVan > 0 and GetCash() < nNeedVan) then
        Talk(1, "", "Kh«ng ®ñ v¹n l­îng."); return
    end
    if (nNeedTichLuy > 0 and GetSJPoint() < nNeedTichLuy) then
        Talk(1, "", "Kh«ng ®ñ ®iÓm tÝch luü."); return
    end

    local needSlots = 1;
    if nIndex == QK_Enum_EventItem.Package1000NgauNhien then
        needSlots = 3;
    end
    if (CalcFreeItemCell() < needSlots) then
        Talk(1, "", "CÇn Ýt nhÊt " .. needSlots .. " « trèng trong hµnh trang."); return
    end

    if (nNeedXu > 0) then DelItem(5, 6, 4984, 0, 3, 2, nNeedXu) end
    if (nNeedVan > 0) then Pay(nNeedVan) end
    if (nNeedTichLuy > 0) then SetSJPoint(GetSJPoint() - nNeedTichLuy) end

    if nIndex == QK_Enum_EventItem.Package1000NgauNhien then
        QK_OpenNgauNhien1000(nAmount)
    else
        local outItem = QK_getMat(nIndex);
        QK_GiveItem(outItem, nAmount * count, 0, 0)
    end
    Talk(1, "", "Mua thµnh c«ng <color=green>" .. packageSale.Name .. "<color>.")
end
