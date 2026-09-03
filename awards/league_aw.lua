--PhÇn th­ëng Liªn ®Êu
-- 22/2/2022
Include("\\script\\headers\\tasklist.lua");
Include("\\script\\headers\\moc_cap_nhat_kinh_nghiem_server1.lua");
if not ALREADY_INCLUDE_BASETTING then
Include("\\script\\headers\\basesetting.lua");
ALREADY_INCLUDE_BASETTING = 1;
end
Include("\\script\\event\\dropper.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
Include("\\script\\event\\quockhanh0209\\helper.lua");

function g_giveawld(nWin)
    local nLevel = GetLevel()
    if(nWin == 0) then
        if(nLevel < EN_SUPPORT_LEVEL) then
            AddOwnExp(floor(ChonKinhNghiemTheoMocServer1(3000000, 9000000)*defEXP_LGRATE*EN_SUPPORT_LVEXP))
        else
            AddOwnExp(floor(ChonKinhNghiemTheoMocServer1(3000000, 9000000)*defEXP_LGRATE))
        end
        if(nLevel >= 90) then
			-- event 01/06/2026 (th­ëng hoan thanh fld)
			-- Duc_GiveKeoCam(10);
			-- Duc_GiveThiep(10, 10);
			
			-- event vu lan
			-- Duc_GiveBongHong(10);
			-- Duc_GiveThiep(10, 10);
			
			-- event Trung thu
			-- DucTT_GiveHatSen(10);   -- OFF: khong phat Hat Sen
			-- DucTT_GiveLongDen(10, 10);
            QKHelper_Add(5)
			----- kÕt thóc -----
        end
    elseif(nWin == 1) then
        if(nLevel < EN_SUPPORT_LEVEL) then
            AddOwnExp(floor(ChonKinhNghiemTheoMocServer1(1500000, 4500000)*defEXP_LGRATE*EN_SUPPORT_LVEXP))
        else
            AddOwnExp(floor(ChonKinhNghiemTheoMocServer1(1500000, 4500000)*defEXP_LGRATE))
        end
    else    --2
        if(nLevel < EN_SUPPORT_LEVEL) then
            AddOwnExp(floor(ChonKinhNghiemTheoMocServer1(1000000, 3000000)*defEXP_LGRATE*EN_SUPPORT_LVEXP))
        else
            AddOwnExp(floor(ChonKinhNghiemTheoMocServer1(1000000, 3000000)*defEXP_LGRATE))
        end
        if(nLevel >= 90) then
			-- event 01/06/2026 (th­ëng hoan thanh fld)
			-- Duc_GiveKeoCam(5);
			-- Duc_GiveThiep(5, 5);
			----- kÕt thóc -----
			
			-- event Vu Lan (th­ëng hoan thanh fld)
			-- Duc_GiveBongHong(5);
			-- Duc_GiveThiep(5, 5);
			----- kÕt thóc -----
			
			QKHelper_Add(6)
			-- event Trung thu (th­ëng hoan thanh fld)
			-- DucTT_GiveHatSen(5);   -- OFF: khong phat Hat Sen
			-- DucTT_GiveLongDen(5, 5);   -- OFF: khong phat Long Den (thuong fld)
			----- kÕt thóc -----
        end
    end
    if(nLevel >= 90) then
        give_event_lg(nWin)
    end
end;