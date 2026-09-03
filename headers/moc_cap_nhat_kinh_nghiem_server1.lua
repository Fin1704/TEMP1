-- Moc thoi gian ap dung bang kinh nghiem moi server1.
-- Cac ham duoc goi ngay luc phat thuong de khong phu thuoc thoi diem GS load script.

if not DA_NHAP_MOC_CAP_NHAT_KINH_NGHIEM_SERVER1 then
	DA_NHAP_MOC_CAP_NHAT_KINH_NGHIEM_SERVER1 = 1;

	NAM_AP_DUNG_KINH_NGHIEM_SERVER1 = 2026;
	THANG_AP_DUNG_KINH_NGHIEM_SERVER1 = 8;
	NGAY_AP_DUNG_KINH_NGHIEM_SERVER1 = 9;
	GIO_AP_DUNG_KINH_NGHIEM_SERVER1 = 0;
	PHUT_AP_DUNG_KINH_NGHIEM_SERVER1 = 0;
	GIAY_AP_DUNG_KINH_NGHIEM_SERVER1 = 0;

	-- Kiem tra hien tai da den moc ap dung kinh nghiem moi hay chua.
	function DaDenMocCapNhatKinhNghiemServer1()
		local nNam,nThang,nNgay,nGio,nPhut,nGiay = GetDate();
		if(nNam > NAM_AP_DUNG_KINH_NGHIEM_SERVER1) then return 1; end
		if(nNam < NAM_AP_DUNG_KINH_NGHIEM_SERVER1) then return 0; end
		if(nThang > THANG_AP_DUNG_KINH_NGHIEM_SERVER1) then return 1; end
		if(nThang < THANG_AP_DUNG_KINH_NGHIEM_SERVER1) then return 0; end
		if(nNgay > NGAY_AP_DUNG_KINH_NGHIEM_SERVER1) then return 1; end
		if(nNgay < NGAY_AP_DUNG_KINH_NGHIEM_SERVER1) then return 0; end
		if(nGio > GIO_AP_DUNG_KINH_NGHIEM_SERVER1) then return 1; end
		if(nGio < GIO_AP_DUNG_KINH_NGHIEM_SERVER1) then return 0; end
		if(nPhut > PHUT_AP_DUNG_KINH_NGHIEM_SERVER1) then return 1; end
		if(nPhut < PHUT_AP_DUNG_KINH_NGHIEM_SERVER1) then return 0; end
		if(nGiay >= GIAY_AP_DUNG_KINH_NGHIEM_SERVER1) then return 1; end
		return 0;
	end

	-- Chon kinh nghiem cu truoc moc, kinh nghiem moi tu moc cap nhat tro di.
	function ChonKinhNghiemTheoMocServer1(nKinhNghiemCu, nKinhNghiemMoi)
		if(DaDenMocCapNhatKinhNghiemServer1() > 0) then
			return nKinhNghiemMoi;
		end
		return nKinhNghiemCu;
	end

	-- Chon kinh nghiem theo moc, nhan ti le va lam tron xuong.
	function ChonKinhNghiemTheoMocVaTiLeServer1(nKinhNghiemCu, nKinhNghiemMoi, nTiLe)
		local nGiaTriKinhNghiem = ChonKinhNghiemTheoMocServer1(nKinhNghiemCu, nKinhNghiemMoi) * nTiLe;
		if(floor ~= nil) then
			return floor(nGiaTriKinhNghiem);
		end
		return math.floor(nGiaTriKinhNghiem);
	end
end
