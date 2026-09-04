
Include("\\script\\event\\quockhanh0209\\helper.lua")

function QK_AskCraft(nIndex)
    if (QKLib_isEnd()) then Talk(1, "", QKLib_getMsg().End); return end
    local tRecipe = QKLib_get(nIndex, QK_Enum_Filter.RECIPE);
    if not tRecipe then return end

    local nMax = QK_CalcMaxCraft(nIndex);
    if nMax <= 0 then
        Talk(1, "", "<color=red>Kh«ng ®ñ nguyªn liÖu<color> ®Ó ghÐp. H·y thu thËp thªm nguyªn liÖu tr­íc.");
        return
    end

    -- AskClientForNumber("QK_DoCraftCallback", 1, nMax, "NhËp sè l­îng ghÐp: (1 - " .. nMax .. ")");
    GetString("QK_DoCraftCallback", "NhËp sè l­îng ghÐp: (1 - " .. nMax .. ")")
    QK_nCraftTargetIndex = nIndex;
end


function QK_DoCraftCallback(nCount)
    if not QK_nCraftTargetIndex then return end
    local nIndex = QK_nCraftTargetIndex;
    QK_nCraftTargetIndex = nil;
    QK_DoCraft(nIndex, nCount);
end

function QK_DoCraft(nIndex, nCount)
    if (QKLib_isEnd()) then Talk(1, "", QKLib_getMsg().End); return end
    local tRecipe = QKLib_get(nIndex, QK_Enum_Filter.RECIPE);
    if not tRecipe then return end

    local nMax = QK_CalcMaxCraft(nIndex);
    if nMax <= 0 then
        Talk(1, "", "<color=red>Kh«ng ®ñ nguyªn liÖu<color> ®Ó ghÐp.");
        return
    end

    local nNum = nCount or nMax;
    if nNum > nMax then nNum = nMax end
    if nNum <= 0 then return end

    local nCalls = 1;
    if (CalcFreeItemCell() < nCalls) then
        Talk(1, "", "CÇn Ýt nhÊt <color=red>" .. nCalls .. " « trèng<color> trong hµnh trang.");
        return
    end

    for i = 1, getn(tRecipe) do
        local tMat = QK_getMat(tRecipe[i].Item)
        local tMatNeed = tRecipe[i].Need or 1
        DelItem(tMat.d, tMat.g, nNum * tMatNeed, tMat.p);
    end

    local outItem = QK_getMat(nIndex);
    QK_GiveItem(outItem, nNum, 0, 0);
    Talk(1, "", "GhÐp thµnh c«ng <color=green>" .. nNum .. " " .. outItem.Name .. "<color>!");
end
