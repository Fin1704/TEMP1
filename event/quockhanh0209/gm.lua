QK_tbMenu_Main = {
    {
        "Thªm Xu", "_AddCoin"
    },
    {
        "Thªm V¹n", "_AddVan",
    },
    {
        "Thªm §iÓm TÝch Lòy", "_AddDiemTichLuy"
    }
};
function Exit()

end

function _AddCoin()
    AddCoin(100000)
end

function _AddVan()
    Earn(100000)
end

function _AddDiemTichLuy()
    AddSJPoint(100000)
end

function main(nNpcIdx)
    local tBtn = {};
    for i = 1, getn(QK_tbMenu_Main) do
        tinsert(tBtn, QK_tbMenu_Main[i][1] .. "/" .. QK_tbMenu_Main[i][2]);
    end

    SayNew("", getn(tBtn), tBtn);
end
