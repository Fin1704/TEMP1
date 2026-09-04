Include("\\script\\event\\quockhanh0209\\user.lua")

QK_tbMenu_Main = {
    {
        "Thªm Xu", "_AddCoin"
    },
    {
        "Thªm V¹n", "_AddVan",
    },
    {
        "Thªm §iÓm TÝch Lòy", "_AddDiemTichLuy"
    },
    {
        "Më r­¬ng Anh Dòng", "_OpenAnhDung",
    }, {
    "Më r­¬ng ChiÕn C«ng", "_OpenChienCong",
},
    {
        "Më r­¬ng ChiÕn Th¾ng", "_OpenChienThang"
    },
    {
        "Max Event", "_AddMaxEvent"
    },
    {
        "Remove Max Event", "_RemoveMaxEvent"
    }
};
function Exit()

end

function _AddMaxEvent()
    QK_AddUseCount(1, 999)
    QK_AddUseCount(2, 999)
    QK_AddUseCount(3, 999)
end

function _RemoveMaxEvent()
    QK_AddUseCount(1, -999)
    QK_AddUseCount(2, -999)
    QK_AddUseCount(3, -999)
end

function _OpenAnhDung()
    QK_UseQuanTrang(idx, 6, 3, 5008)
end

function _OpenChienCong()
    QK_UseQuanTrang(idx, 6, 2, 5008)
end

function _OpenChienThang()
    QK_UseQuanTrang(idx, 6, 1, 5008)
end

function _AddCoin()
    AddItemIdx(AddItemTemp(0, 6, 5, 4984, 0, 5, 100000))
    print("Thªm coin cho " .. GetName())
end

function _AddVan()
    Earn(100000)
    print("Thªm v¹n cho " .. GetName())
end

function _AddDiemTichLuy()
    AddSJPoint(10000)
    -- AddGrace(10000) --danh vong
    -- AddRepute(10000) -- phuc duyen
    print("Thªm point cho " .. GetName())
end

function main(nNpcIdx)
    local tBtn = {};
    for i = 1, getn(QK_tbMenu_Main) do
        tinsert(tBtn, QK_tbMenu_Main[i][1] .. "/" .. QK_tbMenu_Main[i][2]);
    end
    local tichluy = GetSJPoint()
    local xu = GetItemCount(5, 6, 4984, 0, 3, 2);
    SayNew("XU : " .. xu .. "\n TÝch Lòy : " .. tichluy, getn(tBtn), tBtn);
end
