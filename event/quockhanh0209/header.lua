QK_Enum_HD = {
	TONG_KIM=1,
	PHONG_LANG_DO =2,
	DA_TAU = 3,
	QUA_HUY_HOANG = 4,
	LIEN_DAU_WIN = 5,
	LIEN_DAU_LOSE =6,
	VA = 7
}
QK_Enum_EventItem={
    QuanTrangChienThang=1,
    QuanTrangChienCong=2,
    QuanTrangAnhDung=3,
    AoQuanNhan=4,
    NonQuanNhan=5,
    GiayQuanNhan=6,
    NgoiSaoChienThang=7,
    NgoiSaoChienCong=8,
    NgoiSaoAnhDung=9,

    Package1000NgauNhien = 0,
}
QK_Enum_LVL = {
	LV_8X = 1,
	LV_9X = 2,
}
--https://www.uuid.lol/cuid2 
EVENT_iyaabda66e6ng0v3ckgjqkna = EVENT_iyaabda66e6ng0v3ckgjqkna or {}
EVENT_iyaabda66e6ng0v3ckgjqkna.KhaoNghiem = {GuildFile="event\\quockhanh0209\\BangHoi.ini", PersonalFile="event\\quockhanh0209\\CaNhan.ini", GuildLimit=200, GuildExp=100000, JoinDay=3}
EVENT_iyaabda66e6ng0v3ckgjqkna.Time ={
Start = {
			y=2026,
			m=9,
			d=1,
		},
        End = {
            y = 2026,
            m = 10,
            d = 1
        },
		KN_End = {
			y=2026,
			m=9,
			d = 26
		}

}
EVENT_iyaabda66e6ng0v3ckgjqkna.Msg = {
        LimitBag = 2,
        BagFull = "CÇn Ýt nhÊt 2 « trèng trong hµnh trang.",
        End = "<color=red>Sù kiÖn Quèc Kh¸nh kÕt thóc.<color>",
        EndedKN = "<color=red>Kh¶o nghiÖm Quèc Kh¸nh kÕt thóc.<color>",
    }
EVENT_iyaabda66e6ng0v3ckgjqkna.Recipe={
	[QK_Enum_EventItem.QuanTrangChienThang]={
        { Item = QK_Enum_EventItem.AoQuanNhan,     Need = 1 },
        { Item = QK_Enum_EventItem.NonQuanNhan,    Need = 1 },
        { Item = QK_Enum_EventItem.GiayQuanNhan,   Need = 1 },
        { Item = QK_Enum_EventItem.NgoiSaoChienThang, Need = 1 }
            
    },
    [QK_Enum_EventItem.QuanTrangChienCong]={
        { Item = QK_Enum_EventItem.AoQuanNhan,     Need = 1 },
        { Item = QK_Enum_EventItem.NonQuanNhan,    Need = 1 },
        { Item = QK_Enum_EventItem.GiayQuanNhan,   Need = 1 },
        { Item = QK_Enum_EventItem.NgoiSaoChienCong, Need = 1 }
        },
    [QK_Enum_EventItem.QuanTrangAnhDung]={
        { Item = QK_Enum_EventItem.AoQuanNhan,     Need = 1 },
        { Item = QK_Enum_EventItem.NonQuanNhan,    Need = 1 },
        { Item = QK_Enum_EventItem.GiayQuanNhan,   Need = 1 },
        { Item = QK_Enum_EventItem.NgoiSaoAnhDung, Need = 1 }
    },
}
EVENT_iyaabda66e6ng0v3ckgjqkna.RateDropItem={
	[QK_Enum_LVL.LV_8X]={
		[QK_Enum_EventItem.AoQuanNhan] = 60,
		[QK_Enum_EventItem.NonQuanNhan] = 30,
		[QK_Enum_EventItem.GiayQuanNhan]=10,
	},
	[QK_Enum_LVL.LV_9X]={
		[QK_Enum_EventItem.AoQuanNhan] = 60,
		[QK_Enum_EventItem.NonQuanNhan] = 30,
		[QK_Enum_EventItem.GiayQuanNhan]=10,
	}
}
EVENT_iyaabda66e6ng0v3ckgjqkna.EventBox = {
    [QK_Enum_EventItem.QuanTrangChienThang] = {
        Name = "QuanTrangChienThang",
        Exp = 4000000,
        NeedLevel = 80,
        MaxUse = 1000,
        Task = TASK1_CLEAR_EVENTQUOCKHANH,
        Cell = 1,
    },
    [QK_Enum_EventItem.QuanTrangChienCong] = {
        Name = "QuanTrangChienCong",
        Exp = 5000000,
        NeedLevel = 80,
        MaxUse = 1000,
        Task = TASK1_CLEAR_EVENTQUOCKHANH,
        Cell = 2,
    },
    [QK_Enum_EventItem.QuanTrangAnhDung] = {
        Name = "QuanTrangAnhDung",
        Exp = 8000000,
        NeedLevel = 0,
        MaxUse = 1000,
        Task = TASK2_CLEAR_EVENTQUOCKHANH,
        Cell = 1,
    },
}
EVENT_iyaabda66e6ng0v3ckgjqkna.RewardVongSang = {
	Task = TASK3_CLEAR_EVENTQUOCKHANH,
	Cell = 3,
	Rank = 1,
	EXP  = 0,
	RewardKey={}
}
EVENT_iyaabda66e6ng0v3ckgjqkna.RewardMaxEvent={
	Exp = 3000000000, 
	Task = TASK3_CLEAR_EVENTQUOCKHANH,
	Cell = 4
};

EVENT_iyaabda66e6ng0v3ckgjqkna.EventItem = {
    [QK_Enum_EventItem.AoQuanNhan] = {Name="¸o Qu©n Nh©n", g=6, d=1, p=5007},
    [QK_Enum_EventItem.NonQuanNhan] = {Name="Nãn Qu©n Nh©n", g=6, d=2, p=5007},
    [QK_Enum_EventItem.GiayQuanNhan] = {Name="Giµy Qu©n Nh©n", g=6, d=3, p=5007},
    [QK_Enum_EventItem.NgoiSaoChienThang] = {Name="Ng«i Sao ChiÕn Th¾ng", g=6, d=4, p=5007},
    [QK_Enum_EventItem.NgoiSaoChienCong] = {Name="Ng«i Sao ChiÕn C«ng", g=6, d=5, p=5007},
    [QK_Enum_EventItem.NgoiSaoAnhDung] = {Name="Ng«i Sao Anh Dòng", g=6, d=6, p=5007},
    [QK_Enum_EventItem.QuanTrangChienThang] = {Name="Qu©n Trang ChiÕn Th¾ng", g=6, d=1, p=5008},
    [QK_Enum_EventItem.QuanTrangChienCong] = {Name="Qu©n Trang ChiÕn C«ng", g=6, d=2, p=5008},
    [QK_Enum_EventItem.QuanTrangAnhDung] = {Name="Qu©n Trang Anh Dòng", g=6, d=3, p=5008},
    VongHoaCaNhan = {Name="Vßng Hoa Quèc Kh¸nh [C¸ Nh©n]", g=6, d=1, p=5009},
    VongHoaBang = {Name="Vßng Hoa Quèc Kh¸nh [Bang]", g=6, d=2, p=5009},
}

EVENT_iyaabda66e6ng0v3ckgjqkna.PackageSale = {
    [QK_Enum_EventItem.QuanTrangChienCong]={
		Name="100 Qu©n Trang ChiÕn C«ng",
        Van =500, 
        TichLuy = 5000,
        Count = 100,
        RewardKey = QK_Enum_EventItem.QuanTrangChienCong,
    },
    [QK_Enum_EventItem.QuanTrangAnhDung] = {
		Name = "100 Qu©n Trang Anh Dòng",
        Xu = 1400,
        TichLuy = 5000,
        Count = 100,
        RewardKey = QK_Enum_EventItem.QuanTrangAnhDung,
    },
    [QK_Enum_EventItem.NgoiSaoChienThang]={
		Name="100 Ng«i Sao ChiÕn Th¾ng",
        Xu=50,
        Count = 100,
        RewardKey = QK_Enum_EventItem.NgoiSaoChienThang,
    },
    [QK_Enum_EventItem.NgoiSaoChienCong]={
		Name="Ng«i Sao ChiÕn C«ng",
        Van=3,
        TichLuy = 100,
        Count= 1,
        RewardKey = QK_Enum_EventItem.NgoiSaoChienCong
    },
    [QK_Enum_EventItem.NgoiSaoAnhDung] = {
		Name="Ng«i Sao Anh Dòng",
        Xu = 10,
        TichLuy = 100,
        Count = 1,
        RewardKey = QK_Enum_EventItem.NgoiSaoAnhDung
    },
    [QK_Enum_EventItem.Package1000NgauNhien]={
		Name = "1000 Nguyªn LiÖu NgÉu Nhiªn",
        Xu = 20,
        IsOpen = 1,
        Count = 1000,
		RewardKey = {
			{Item= QK_Enum_EventItem.AoQuanNhan, rate = 60},
			{Item = QK_Enum_EventItem.NonQuanNhan, rate = 30},
			{Item = QK_Enum_EventItem.GiayQuanNhan, rate =10}
		}
    }
}

QK_REWARD = {
	BOSS_XANH = 1,
	HUAN_CHUONG_DOC_LAP = 2,
	VONG_HOA_BANG = 3,
	VONG_HOA_CA_NHAN = 4,
	THIET_LA_HAN = 5,
	TIN_VAT_MON_PHAI = 6,
	PHUC_DUYEN_LE_NHO = 7,
	PHUC_DUYEN_LE_TRUNG = 8,
	PHUC_DUYEN_LE_LON = 9,
	TINH_HONG_BAO_THACH = 10,
	THUY_TINH_LAM = 11,
	THUY_TINH_TIM = 12,
	THUY_TINH_LUC = 13,
	CO_KHO = 14,
	PHOI_KIM_CUONG_BAO = 15,
	PHOI_GIANG_SA_BAO = 16,
	DONG_CUI_KHO = 17,
	THUOC_NGOAI_CONG = 18,
	TIEN_THAO_LO = 19,
	THIEN_SON_BAO_LO = 20,
	BAN_NHUOC_TAM_KINH = 21,
	LAO_TAU_PHUC_MENH_THU = 22,
	XA_LOI_KIM_DON = 23,
	SAT_THU_GIAN = 24,
	LENH_BAI_PLD = 25,
	PHI_TOC_HOAN = 26,
	CHIEN_CO_TONG_KIM = 27,
	LENH_BAI_TONG_KIM = 28,
	THIEN_SON_TUYET_LIEN = 29,
	MANH_BI_KIP_1 = 30,
	MANH_BI_KIP_2 = 31,
	MANH_BI_KIP_3 = 32,
	MANH_BI_KIP_4 = 33,
	MANH_BI_KIP_5 = 34,
	MANH_BI_KIP_6 = 35,
	MANH_BI_KIP_7 = 36,
	MANH_BI_KIP_8 = 37,
	QUE_HOA_TUU = 38,
	LONG_DEN_HOA_DANG = 39,
	RUONG_MANH_HIEP_COT = 40,
	MAT_NA_BANG_HOI = 41,
	NEN_BINH_AN = 42,
	NEN_HANH_PHUC = 43,
	TANG_KIEM_LENH_THAN_BINH = 44,
	TANG_KIEM_LENH_BAO_GIAP = 45,
	TANG_KIEM_LENH_NGU_MAO = 46,
	TANG_KIEM_LENH_PHI_HAI = 47,
	TANG_KIEM_LENH_KY_TRAN = 48,
	MANH_CHIEU_DA_1 = 49,
	MANH_CHIEU_DA_2 = 50,
	MANH_CHIEU_DA_3 = 51,
	MANH_CHIEU_DA_4 = 52,
	MANH_CHIEU_DA_5 = 53,
	MANH_CHIEU_DA_6 = 54,
	MANH_CHIEU_DA_7 = 55,
	MANH_CHIEU_DA_8 = 56,
	MANH_XICH_THO_1 = 57,
	MANH_XICH_THO_2 = 58,
	MANH_XICH_THO_3 = 59,
	MANH_XICH_THO_4 = 60,
	MANH_XICH_THO_5 = 61,
	MANH_XICH_THO_6 = 62,
	MANH_XICH_THO_7 = 63,
	MANH_XICH_THO_8 = 64,
	MANH_PHI_VAN_1 = 65,
	MANH_PHI_VAN_2 = 66,
	MANH_PHI_VAN_3 = 67,
	MANH_PHI_VAN_4 = 68,
	MANH_PHI_VAN_5 = 69,
	MANH_PHI_VAN_6 = 70,
	MANH_PHI_VAN_7 = 71,
	BANH_PHUOC_LOC = 72,
	HOP_MANH_THACH_ANH = 73,
	TUI_DO_NGHE_MAC_GIA = 74,
	DA_HOAN_THACH = 75,
	LENH_BAI_HONG_ANH = 76,
	RUONG_BAO_HAP_TUYET_HOC = 77,
	BICH_NGOC_NGU_PHUC = 78,
	LUC_QUA_QUAN_TINH = 79,
	BACH_CHAN_DON = 80,
	HUYET_CHAN_DON = 81,
	HUYEN_CHAN_DON = 82,
	VO_LAM_MAT_TICH = 83,
	TAY_TUY_KINH = 84,
	TRAN_PHAI_LINH_DON = 85,
	TRAN_PHAI_LINH_DUOC = 86,
	BI_KIP_THUAN_XICH_THO = 87,
	BI_KIP_THUAN_CHIEU_DA = 88,
	BI_KIP_THUAN_PHI_VAN = 89,
	BI_KIP_VO_CONG_TUYET_THE = 90,
	DA_PHAT_SANG = 91,
	THUY_TINH_LAM_KHOA = 92,
	THUY_TINH_TIM_KHOA = 93,
	THUY_TINH_LUC_KHOA = 94,
	HOA_SEN_PHU_QUY = 95,
	LENH_BAI_BOSS_TIEU = 96,
	LENH_BAI_BOSS_DAI = 97,
	BICH_NGOC_NGU_PHUC_3 = 98,
	LUC_PHA_QUAN_TINH_4 = 99,
	HOAN_BINH_THACH = 100,
	VO_LAM_MAT_TICH_QUYEN_2 = 101,
	TAY_TUY_KINH_QUYEN_2 = 102,
	CAN_KHON_SONG_TUYET_BOI = 103,
	RUONG_AO_HIEP_COT = 104,
	RUONG_NGOC_BOI_HIEP_COT = 105,
	RUONG_TRANG_BI_HIEP_COT = 106,
	PHO_HAO_QUANG_XICH_THO = 107,
	PHO_HAO_QUANG_CHIEU_DA = 108,
	PHO_HAO_QUANG_PHI_VAN = 109,
	AN_QUANG_PHO = 110,
	NHU_Y_QUANG_PHO = 111,
	HONG_ANH_LE_BAO = 112,
	NGUA_CHIEU_DA = 113,
	NGUA_XICH_THO = 114,
	NGUA_CHIEU_DA_15_NGAY = 115,
	NGUA_XICH_THO_15_NGAY = 116,
	NGUA_DICH_LO = 117,
	NGUA_O_VAN = 118,
	NGUA_TUYET_ANH = 119,
	NHAT_KY_CAN_KHON_PHU = 120,
	HOP_QUA_TRUNG_THU = 121,
	MANH_NHAT_KY_CAN_KHON_PHU = 122,
	HOP_QUA_QUOC_KHANH = 123,
	LE_BAO_BI_KIP_TU_CHON = 124,
	DAI_THANH_BI_KIP_90 = 125,
	CHAN_KINH_TAN_QUYEN = 126,
	TU_NGOC = 127,
	BACH_NGOC = 128,
	YEN_NGUA_HOAC_CHIEN_MA = 129,
	MANH_CAN_KHON_SONG_TUYET_BOI = 130,
	THIEN_MENH_HO_PHU = 131,
	TRUONG_SINH_HO_PHU = 132,
	MANH_VO_LAM_MAT_TICH_QUYEN_2 = 133,
	MANH_TAY_TUY_KINH_QUYEN_2 = 134,
	MANH_TRANG_BI_XANH_HONG_6 = 135,
	MANH_TRANG_BI_XANH_HONG_7 = 136,
	MANH_TRANG_BI_XANH_HONG_8 = 137,
	MANH_TRANG_BI_XANH_HONG_9 = 138,
	MANH_TRANG_BI_XANH_HONG_10 = 139,
	TU_VA_HAO_KHI = 140,
}

QK_REWARD_DESC = {
	[QK_REWARD.TU_VA_HAO_KHI] = { 0, 6, 2, 5020, 0, 5, 1, 0},
	[QK_REWARD.BOSS_XANH] = { 0, 6, 1, 4992, 0, 5, 1, 0 },
	[QK_REWARD.HUAN_CHUONG_DOC_LAP] = { 0, 6, 3, 5010, 0, 5, 1, 0 },
	[QK_REWARD.VONG_HOA_BANG] = { 0, 6, 2, 5009, 0, 5, {20,100}, 0 },
	[QK_REWARD.VONG_HOA_CA_NHAN] = { 0, 6, 1, 5009, 0, 5, {20,100}, 0 },
	[QK_REWARD.THIET_LA_HAN] = { 0, 6, 1, 23, 0, 5, 0, 0 },
	[QK_REWARD.TIN_VAT_MON_PHAI] = { 0, 6, 1, 1670, 0, 5, 0, 0 },
	[QK_REWARD.PHUC_DUYEN_LE_NHO] = { 0, 6, 1, 122, 0, 5, 0, 0 },
	[QK_REWARD.PHUC_DUYEN_LE_TRUNG] = { 0, 6, 1, 123, 0, 5, 0, 0 },
	[QK_REWARD.PHUC_DUYEN_LE_LON] = { 0, 6, 1, 124, 0, 5, 0, 0 },
	[QK_REWARD.TINH_HONG_BAO_THACH] = { 0, 4, 353, 0, 0, 5, 0, 0 },
	[QK_REWARD.THUY_TINH_LAM] = { 0, 4, 238, 0, 0, 5, 0, 0 },
	[QK_REWARD.THUY_TINH_TIM] = { 0, 4, 239, 0, 0, 5, 0, 0 },
	[QK_REWARD.THUY_TINH_LUC] = { 0, 4, 240, 0, 0, 5, 0, 0 },
	[QK_REWARD.CO_KHO] = { 0, 4, 1490, 1, 0, 5, 0, 0 },
	[QK_REWARD.PHOI_KIM_CUONG_BAO] = { 0, 4, 1472, 0, 0, 5, 0, 0 },
	[QK_REWARD.PHOI_GIANG_SA_BAO] = { 0, 4, 1473, 0, 0, 5, 0, 0 },
	[QK_REWARD.DONG_CUI_KHO] = { 0, 6, 1, 4996, 0, 5, 1, 0 }, -- Dong Cui Kho                (~125 / 1000) (HSD 3 ngay het han cung 1 time de xep chong)
	[QK_REWARD.THUOC_NGOAI_CONG] = {0,6,0,{1,10},0,5,0,0}, -- thuoc ngoai cong (particular ngau nhien 1..10)
	[QK_REWARD.TIEN_THAO_LO] = {0,6,1,71,0,5,0,0}, -- Tien Thao Lo
	[QK_REWARD.THIEN_SON_BAO_LO] = {0,6,1,72,0,5,0,0}, -- Thien Son Bao Lo
	[QK_REWARD.BAN_NHUOC_TAM_KINH] = {0,6,1,12,0,5,0,0}, -- Ban Nhuoc Tam Kinh
	[QK_REWARD.LAO_TAU_PHUC_MENH_THU] = {0,4,1326,0,0,5,0,0}, -- Lao Tau Phuc Menh Thu
	[QK_REWARD.XA_LOI_KIM_DON] = {0,6,1,2620,0,5,0,0}, -- Xa Loi Kim Don
	[QK_REWARD.SAT_THU_GIAN] = {0,6,1,400,90,nil,0,0}, -- Sat thu gian
	[QK_REWARD.LENH_BAI_PLD] = {0,4,489,0,0,5,0,0}, -- Lenh bai pld
	[QK_REWARD.PHI_TOC_HOAN] = {0,6,1,190,0,5,0,0}, -- Phi Toc Hoan
	[QK_REWARD.CHIEN_CO_TONG_KIM] = {0,6,1,156,0,5,0,0}, -- Chien Co Tong Kim
	[QK_REWARD.LENH_BAI_TONG_KIM] = {0,6,1,157,0,5,0,0}, -- Lenh Bai Tong Kim
	[QK_REWARD.THIEN_SON_TUYET_LIEN] = {0,6,1,1431,0,5,0,0}, -- Thien Son Tuyet Lien
	[QK_REWARD.MANH_BI_KIP_1] = {0,4,1463,0,0,5,0,0}, -- Manh Bi Kip 1
	[QK_REWARD.MANH_BI_KIP_2] = {0,4,1464,0,0,5,0,0}, -- Manh Bi Kip 2
	[QK_REWARD.MANH_BI_KIP_3] = {0,4,1465,0,0,5,0,0}, -- Manh Bi Kip 3
	[QK_REWARD.MANH_BI_KIP_4] = {0,4,1466,0,0,5,0,0}, -- Manh Bi Kip 4
	[QK_REWARD.MANH_BI_KIP_5] = {0,4,1467,0,0,5,0,0}, -- Manh Bi Kip 5
	[QK_REWARD.MANH_BI_KIP_6] = {0,4,1468,0,0,5,0,0}, -- Manh Bi Kip 6
	[QK_REWARD.MANH_BI_KIP_7] = {0,4,1469,0,0,5,0,0}, -- Manh Bi Kip 7
	[QK_REWARD.MANH_BI_KIP_8] = {0,4,1470,0,0,5,0,0}, -- Manh Bi Kip 8
	[QK_REWARD.QUE_HOA_TUU] = {0,6,1,125,0,5,0,0}, -- Que Hoa Tuu
	[QK_REWARD.HUAN_CHUONG_TU_DO] = {0,6,4,5010,0,5,1,0},
	[QK_REWARD.LONG_DEN_HOA_DANG] = {0,6,4,5010,0,5,1,0}, -- Long Den Hoa Dang  (~10 / 1000)
	[QK_REWARD.RUONG_MANH_HIEP_COT] = {0,6,1,5003,0,5,0,0}, -- Ruong manh hiep cot
	[QK_REWARD.MAT_NA_BANG_HOI] = {0,6,1,1109,0,5,0,0}, -- Mat na bang hoi
	[QK_REWARD.NEN_BINH_AN] = {0,6,1,1096,0,5,0,0}, -- Nen binh an
	[QK_REWARD.NEN_HANH_PHUC] = {0,6,1,1098,0,5,0,0}, -- Nen hanh phuc
	[QK_REWARD.TANG_KIEM_LENH_THAN_BINH] = {0,6,5,5002,0,5,0,0}, -- Tang kiem lenh than binh
	[QK_REWARD.TANG_KIEM_LENH_BAO_GIAP] = {0,6,4,5002,0,5,0,0}, -- Tang kiem lenh bao giap
	[QK_REWARD.TANG_KIEM_LENH_NGU_MAO] = {0,6,3,5002,0,5,0,0}, -- Tang kiem lenh ngu mao
	[QK_REWARD.TANG_KIEM_LENH_PHI_HAI] = {0,6,2,5002,0,5,0,0}, -- Tang kiem lenh phi hai
	[QK_REWARD.TANG_KIEM_LENH_KY_TRAN] = {0,6,1,5002,0,5,0,0}, -- Tang kiem lenh ky tran
	[QK_REWARD.MANH_CHIEU_DA_1] = {0,4,1474,1,0,5,0,0}, -- Manh Chieu da 1
	[QK_REWARD.MANH_CHIEU_DA_2] = {0,4,1475,1,0,5,0,0}, -- Manh Chieu da 2
	[QK_REWARD.MANH_CHIEU_DA_3] = {0,4,1476,1,0,5,0,0}, -- Manh Chieu da 3
	[QK_REWARD.MANH_CHIEU_DA_4] = {0,4,1477,1,0,5,0,0}, -- Manh Chieu da 4
	[QK_REWARD.MANH_CHIEU_DA_5] = {0,4,1478,1,0,5,0,0}, -- Manh Chieu da 5
	[QK_REWARD.MANH_CHIEU_DA_6] = {0,4,1479,1,0,5,0,0}, -- Manh Chieu da 6
	[QK_REWARD.MANH_CHIEU_DA_7] = {0,4,1480,1,0,5,0,0}, -- Manh Chieu da 7
	[QK_REWARD.MANH_CHIEU_DA_8] = {0,4,1481,1,0,5,0,0}, -- Manh Chieu da 8
	[QK_REWARD.MANH_XICH_THO_1] = {0,4,1482,1,0,5,0,0}, -- Manh Xich Tho 1
	[QK_REWARD.MANH_XICH_THO_2] = {0,4,1483,1,0,5,0,0}, -- Manh Xich Tho 2
	[QK_REWARD.MANH_XICH_THO_3] = {0,4,1484,1,0,5,0,0}, -- Manh Xich Tho 3
	[QK_REWARD.MANH_XICH_THO_4] = {0,4,1485,1,0,5,0,0}, -- Manh Xich Tho 4
	[QK_REWARD.MANH_XICH_THO_5] = {0,4,1486,1,0,5,0,0}, -- Manh Xich Tho 5
	[QK_REWARD.MANH_XICH_THO_6] = {0,4,1487,1,0,5,0,0}, -- Manh Xich Tho 6
	[QK_REWARD.MANH_XICH_THO_7] = {0,4,1488,1,0,5,0,0}, -- Manh Xich Tho 7
	[QK_REWARD.MANH_XICH_THO_8] = {0,4,1489,1,0,5,0,0}, -- Manh Xich Tho 8
	[QK_REWARD.MANH_PHI_VAN_1] = {0,4,1497,1,0,5,0,0}, -- Manh Phi Van 1
	[QK_REWARD.MANH_PHI_VAN_2] = {0,4,1498,1,0,5,0,0}, -- Manh Phi Van 2
	[QK_REWARD.MANH_PHI_VAN_3] = {0,4,1499,1,0,5,0,0}, -- Manh Phi Van 3
	[QK_REWARD.MANH_PHI_VAN_4] = {0,4,1500,1,0,5,0,0}, -- Manh Phi Van 4
	[QK_REWARD.MANH_PHI_VAN_5] = {0,4,1501,1,0,5,0,0}, -- Manh Phi Van 5
	[QK_REWARD.MANH_PHI_VAN_6] = {0,4,1502,1,0,5,0,0}, -- Manh Phi Van 6
	[QK_REWARD.MANH_PHI_VAN_7] = {0,4,1503,1,0,5,0,0}, -- Manh Phi Van 7
	[QK_REWARD.BANH_PHUOC_LOC] = {0,6,1,5011,0,5,{2,4},0}, -- Banh Phuoc Loc (~3 / 1000, muc 2~4)
	[QK_REWARD.HOP_MANH_THACH_ANH] = {0,6,1,5012,0,5,0,0}, -- Hop Manh Thach Anh (~6.5 / 1000, muc 4~10)
	[QK_REWARD.TUI_DO_NGHE_MAC_GIA] = {0,6,1,5013,0,5,0,0}, -- Tui Do Nghe Mac Gia (~6.5 / 1000, muc 4~10)
	[QK_REWARD.DA_HOAN_THACH] = {0,4,1515,1,0,5,0,0}, -- Da Hoan Thach (~6.5 / 1000, muc 4~10)
	[QK_REWARD.LENH_BAI_HONG_ANH] = {0,4,1516,1,0,5,0,0}, -- Lenh Bai Hong Anh (~3 / 1000, muc 2~4)
	[QK_REWARD.RUONG_BAO_HAP_TUYET_HOC] = {0,6,3,4991,0,5,0,0}, -- Ruong Bao Hap Tuyet Hoc            (~0.5 / 1000)
	[QK_REWARD.BICH_NGOC_NGU_PHUC] = {0,0,14,1,0,5,0,0}, -- Bich ngoc ngu phuc
	[QK_REWARD.LUC_QUA_QUAN_TINH] = {0,0,14,2,0,5,0,0}, -- Luc qua quan tinh
	[QK_REWARD.BACH_CHAN_DON] = {0,6,1,1676,0,5,0,0}, -- Bach chan don
	[QK_REWARD.HUYET_CHAN_DON] = {0,6,1,1677,0,5,0,0}, -- Huyet chan don
	[QK_REWARD.HUYEN_CHAN_DON] = {0,6,1,1678,0,5,0,0}, -- Huyen chan don
	[QK_REWARD.VO_LAM_MAT_TICH] = {0,6,1,26,0,5,0,0}, -- Vo Lam mat tich
	[QK_REWARD.TAY_TUY_KINH] = {0,6,1,22,0,5,0,0}, -- Tay tuy kinh
	[QK_REWARD.TRAN_PHAI_LINH_DON] = {0,6,1,1704,0,5,0,0}, -- Tran phai linh don
	[QK_REWARD.TRAN_PHAI_LINH_DUOC] = {0,6,1,1705,0,5,0,0}, -- Tran phai linh duoc
	[QK_REWARD.BI_KIP_THUAN_XICH_THO] = {0,4,1494,1,0,5,0,0}, -- Bi kip thuan xich tho
	[QK_REWARD.BI_KIP_THUAN_CHIEU_DA] = {0,4,1495,1,0,5,0,0}, -- Bi kip thuan chieu da
	[QK_REWARD.BI_KIP_THUAN_PHI_VAN] = {0,4,1496,1,0,5,0,0}, -- Bi kip thuan phi van
	[QK_REWARD.BI_KIP_VO_CONG_TUYET_THE] = {0,6,1,5004,0,5,0,0}, -- Bi kip vo cong tuyet the
	[QK_REWARD.DA_PHAT_SANG] = {0,4,1493,1,0,5,0,0}, -- Da Phat Sang
	[QK_REWARD.THUY_TINH_LAM_KHOA] = {0,4,238,1,0,5,0,0}, -- Thuy tinh
	[QK_REWARD.THUY_TINH_TIM_KHOA] = {0,4,239,1,0,5,0,0}, -- Thuy tinh
	[QK_REWARD.THUY_TINH_LUC_KHOA] = {0,4,240,1,0,5,0,0}, -- Thuy tinh
	[QK_REWARD.HOA_SEN_PHU_QUY] = {0,6,5,5010,0,5,0,0}, -- Hoa Sen Phu Quy (OFF)
	[QK_REWARD.LENH_BAI_BOSS_TIEU] = {0,6,2,1022,0,5,0,0}, -- Lenh Bai Boss Tieu
	[QK_REWARD.LENH_BAI_BOSS_DAI] = {0,6,3,1022,0,5,0,0}, -- Lenh Bai Boss Dai
	[QK_REWARD.BICH_NGOC_NGU_PHUC_3] = {0,0,14,3,0,5,0,0}, -- Bch ngc ng phc
	[QK_REWARD.LUC_PHA_QUAN_TINH_4] = {0,0,14,4,0,5,0,0}, -- Lc ph qun tinh
	[QK_REWARD.HOAN_BINH_THACH] = {0,4,1580,0,0,5,0,0}, -- Hoan Binh Thach (HSD het event)
	[QK_REWARD.VO_LAM_MAT_TICH_QUYEN_2] = {0,6,2,5014,0,5,0,0}, -- Vo Lam Mat Tich - quyen 2
	[QK_REWARD.TAY_TUY_KINH_QUYEN_2] = {0,6,1,5014,0,5,0,0}, -- Tay Tuy Kinh - quyen 2
	[QK_REWARD.CAN_KHON_SONG_TUYET_BOI] = {0,6,2,2219,0,5,0,0}, -- Can Khon Song Tuyet Boi (tac dung 15 ngay - HSD 15 ngay)
	[QK_REWARD.RUONG_AO_HIEP_COT] = {0,6,1,4997,0,5,0,0}, -- Ruong Ao Hiep Cot (OFF -> gop vao Ruong trang bi 5016)
	[QK_REWARD.RUONG_NGOC_BOI_HIEP_COT] = {0,6,2,4997,0,5,0,0}, -- Ruong Ngoc Boi Hiep Cot (OFF -> gop vao Ruong trang bi 5016)
	[QK_REWARD.RUONG_TRANG_BI_HIEP_COT] = {0,6,1,5016,0,5,0,0}, -- Ruong trang bi hiep cot (mo -> random ao 80/ngoc boi 20)
	[QK_REWARD.PHO_HAO_QUANG_XICH_THO] = {0,4,1510,1,0,5,0,0}, -- Pho Hao Quang Xich Tho (setting sv9)
	[QK_REWARD.PHO_HAO_QUANG_CHIEU_DA] = {0,4,1511,1,0,5,0,0}, -- Pho Hao Quang Chieu Da (setting sv9)
	[QK_REWARD.PHO_HAO_QUANG_PHI_VAN] = {0,4,1512,1,0,5,0,0}, -- Pho Hao Quang Phi Van (setting sv9)
	[QK_REWARD.AN_QUANG_PHO] = {0,4,1508,1,0,5,0,0}, -- An Quang Pho (setting sv9)
	[QK_REWARD.NHU_Y_QUANG_PHO] = {0,4,1509,1,0,5,0,0}, -- Nhu Y Quang Pho (setting sv9)
	[QK_REWARD.HONG_ANH_LE_BAO] = {0,6,4,1147,0,5,0,0}, -- Hong anh le bao (co thoi han) - item HSD het event, mo ra bo do HSD het event
	[QK_REWARD.NGUA_CHIEU_DA] = {0,0,10,5,5,0,0,0}, -- Ngua Chieu Da (V.V)
	[QK_REWARD.NGUA_XICH_THO] = {0,0,10,5,2,0,0,0}, -- Ngua Xich Tho (V.V)
	[QK_REWARD.NGUA_CHIEU_DA_15_NGAY] = {0,0,10,5,5,0,0,15}, -- Ngua Chieu Da (15 ngay)
	[QK_REWARD.NGUA_XICH_THO_15_NGAY] = {0,0,10,5,2,0,0,15}, -- Ngua Xich Tho (15 ngay)
	[QK_REWARD.NGUA_DICH_LO] = {0,0,10,5,4,0,0,15}, -- Ngua Dich Lo (15 ngay)
	[QK_REWARD.NGUA_O_VAN] = {0,0,10,5,1,0,0,15}, -- Ngua O Van (15 ngay)
	[QK_REWARD.NGUA_TUYET_ANH] = {0,0,10,5,3,0,0,15}, -- Ngua Tuyet Anh (15 ngay)
	[QK_REWARD.NHAT_KY_CAN_KHON_PHU] = {0,6,3,2126,0,5,0,0}, -- Nhat Ky Can Khon Phu (15 ngay, d random)
	[QK_REWARD.HOP_QUA_TRUNG_THU]={0,6,4,5008,0,5,0,0},
	[QK_REWARD.MANH_NHAT_KY_CAN_KHON_PHU] = { 0, 4, 1471, 0, 0, 5, 1, 0 },
	[QK_REWARD.HOP_QUA_QUOC_KHANH] = { 0, 6, 4, 5008, 0, 5, 1, 0 },
	[QK_REWARD.LE_BAO_BI_KIP_TU_CHON] = { 0, 6, 1, 4986, 0, 5, 1, 0 },
	[QK_REWARD.DAI_THANH_BI_KIP_90] = { 0, 6, 1, 2424, 0, 5, 1, 0 },
	[QK_REWARD.CHAN_KINH_TAN_QUYEN] = { 0, 6, 3, 4986, 0, 5, 1, 0 },
	[QK_REWARD.TU_NGOC] = { 0, 6, 1, 2391, 0, 5, 1, 0 },
	[QK_REWARD.BACH_NGOC] = { 0, 6, 1, 2390, 0, 5, 1, 0 },
	[QK_REWARD.YEN_NGUA_HOAC_CHIEN_MA] = { 0, 4, { 1491, 1492 }, 0, 0, 5, 1, 0 },
	[QK_REWARD.MANH_CAN_KHON_SONG_TUYET_BOI] = { 0, 4, 1517, 0, 0, 5, 1, 0 },
	[QK_REWARD.THIEN_MENH_HO_PHU] = { 0, 0, 14, 1, 0, 5, 1, 0 },
	[QK_REWARD.TRUONG_SINH_HO_PHU] = { 0, 0, 14, 2, 0, 5, 1, 0 },
	[QK_REWARD.MANH_VO_LAM_MAT_TICH_QUYEN_2] = { 0, 4, 1519, 0, 0, 5, 1, 0 },
	[QK_REWARD.MANH_TAY_TUY_KINH_QUYEN_2] = { 0, 4, 1518, 0, 0, 5, 1, 0 },
	[QK_REWARD.MANH_TRANG_BI_XANH_HONG_6] = { 0, 4, 1525, 0, 0, 5, 1, 0 },
	[QK_REWARD.MANH_TRANG_BI_XANH_HONG_7] = { 0, 4, 1526, 0, 0, 5, 1, 0 },
	[QK_REWARD.MANH_TRANG_BI_XANH_HONG_8] = { 0, 4, 1527, 0, 0, 5, 1, 0 },
	[QK_REWARD.MANH_TRANG_BI_XANH_HONG_9] = { 0, 4, 1528, 0, 0, 5, 1, 0 },
	[QK_REWARD.MANH_TRANG_BI_XANH_HONG_10] = { 0, 4, 1529, 0, 0, 5, 1, 0 }
}
QK_Enum_Filter ={
    EVENTBOX = 1,
    MATS = 2,
    RECIPE = 3,
}
EVENT_iyaabda66e6ng0v3ckgjqkna.Reward ={
	[QK_Enum_EventItem.QuanTrangChienCong]={
		Exp = 2000000,
		Sure = {
			{ Item = QK_REWARD_DESC[QK_REWARD.BOSS_XANH], Count = 1, Days = 0, Lock = 0 }, -- Lenh Bai Boss Xanh
			{ Item = QK_REWARD_DESC[QK_REWARD.DONG_CUI_KHO], Count = 1, Days = -3, Lock = 0 }, -- Dong Cui Kho (HSD 3 ngay 12h trua de xep chong)
			{ Item = QK_REWARD_DESC[QK_REWARD.HUAN_CHUONG_DOC_LAP], Count = 1, Days = 0, Lock = 0 }, -- Huan Chuong Doc Lap
			{ Item = QK_REWARD_DESC[QK_REWARD.VONG_HOA_BANG], Count = { 20, 100 }, Days = -1, Lock = 1 }, -- Vong Hoa [Bang Hoi] HSD het khao nghiem (20..100 cai)
			{ Item = QK_REWARD_DESC[QK_REWARD.VONG_HOA_CA_NHAN], Count = { 20, 100 }, Days = -1, Lock = 0 }, -- Vong Hoa [Ca Nhan] HSD het khao nghiem (20..100 cai)
		},

	},
	[QK_Enum_EventItem.QuanTrangAnhDung]={
		Exp= 3000000,
		RewardKey={
			{ 1500, { QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_NHO], 0 }, 0 }, -- Phuc Duyen Le (tieu)
			{ 1000, { QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_TRUNG], 0 }, 0 }, -- Phuc Duyen Le (trung)
			{ 700, { QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_LON], 0 }, 0 }, -- Phuc Duyen Le (dai)
			{ 150, { QK_REWARD_DESC[QK_REWARD.THUOC_NGOAI_CONG], 0 }, 0 }, -- thuoc ngoai cong (particular ngau nhien 1..10)
			{ 100, { QK_REWARD_DESC[QK_REWARD.THIET_LA_HAN], 0 }, 0 }, -- thiet la han
			{ 80, { QK_REWARD_DESC[QK_REWARD.TIEN_THAO_LO], 0 }, 0 }, -- Tien Thao Lo
			{ 60, { QK_REWARD_DESC[QK_REWARD.THIEN_SON_BAO_LO], 0 }, 0 }, -- Thien Son Bao Lo
			{ 200, { QK_REWARD_DESC[QK_REWARD.BAN_NHUOC_TAM_KINH], 0 }, 0 }, -- Ban Nhuoc Tam Kinh
			{ 120, { QK_REWARD_DESC[QK_REWARD.LAO_TAU_PHUC_MENH_THU], 0 }, 0 }, -- Lao Tau Phuc Menh Thu
			{ 40, { QK_REWARD_DESC[QK_REWARD.THUY_TINH_LAM], 0 }, 0 }, -- Thuy Tinh
			{ 40, { QK_REWARD_DESC[QK_REWARD.THUY_TINH_TIM], 0 }, 0 }, -- Thuy Tinh
			{ 40, { QK_REWARD_DESC[QK_REWARD.THUY_TINH_LUC], 0 }, 0 }, -- Thuy Tinh
			{ 40, { QK_REWARD_DESC[QK_REWARD.TINH_HONG_BAO_THACH], 0 }, 0 }, -- Tinh Hong Bao Thach
			{ 100, { QK_REWARD_DESC[QK_REWARD.THIET_LA_HAN], 0 }, 0 }, -- thiet la han
			{ 300, { QK_REWARD_DESC[QK_REWARD.XA_LOI_KIM_DON], 0 }, 0 }, -- Xa Loi Kim Don
			{ 200, { QK_REWARD_DESC[QK_REWARD.SAT_THU_GIAN], 0 }, 0 }, -- Sat thu gian
			{ 200, { QK_REWARD_DESC[QK_REWARD.LENH_BAI_PLD], 0 }, 0 }, -- Lenh bai pld
			{ 3000, { QK_REWARD_DESC[QK_REWARD.PHI_TOC_HOAN], 0 }, 0 }, -- Phi Toc Hoan
			{ 3000, { QK_REWARD_DESC[QK_REWARD.CHIEN_CO_TONG_KIM], 0 }, 0 }, -- Chien Co Tong Kim
			{ 3000, { QK_REWARD_DESC[QK_REWARD.LENH_BAI_TONG_KIM], 0 }, 0 }, -- Lenh Bai Tong Kim
			{ 30, { QK_REWARD_DESC[QK_REWARD.THIEN_SON_TUYET_LIEN], 0 }, 0 }, -- Thien Son Tuyet Lien
			{ 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_1], 0 }, 0 }, -- Manh Bi Kip 1
			{ 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_2], 0 }, 0 }, -- Manh Bi Kip 2
			{ 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_3], 0 }, 0 }, -- Manh Bi Kip 3
			{ 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_4], 0 }, 0 }, -- Manh Bi Kip 4
			{ 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_5], 0 }, 0 }, -- Manh Bi Kip 5
			{ 10, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_6], 0 }, 0 }, -- Manh Bi Kip 6
			{ 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_7], 0 }, 0 }, -- Manh Bi Kip 7
			{ 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_8], 0 }, 0 }, -- Manh Bi Kip 8
			{ 120, { QK_REWARD_DESC[QK_REWARD.QUE_HOA_TUU], 0 }, 0 }, -- Que Hoa Tuu
			{ 175, { QK_REWARD_DESC[QK_REWARD.HUAN_CHUONG_DOC_LAP], 0 }, 0 }, -- Long Den Ngoi Sao (~10 / 1000)
			{ 175, { QK_REWARD_DESC[QK_REWARD.LONG_DEN_HOA_DANG], 0 }, 0 }, -- Long Den Hoa Dang  (~10 / 1000)
			{ 175, { QK_REWARD_DESC[QK_REWARD.RUONG_MANH_HIEP_COT], 0 }, 0 }, -- Ruong manh hiep cot
			{ 175, { QK_REWARD_DESC[QK_REWARD.MAT_NA_BANG_HOI], 0 }, 0 }, -- Mat na bang hoi
			{ 175, { QK_REWARD_DESC[QK_REWARD.NEN_BINH_AN], 0 }, 0 }, -- Nen binh an
			{ 175, { QK_REWARD_DESC[QK_REWARD.NEN_HANH_PHUC], 0 }, 0 }, -- Nen hanh phuc
			{ 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_THAN_BINH], 0 }, 0 }, -- Tang kiem lenh than binh
			{ 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_BAO_GIAP], 0 }, 0 }, -- Tang kiem lenh bao giap
			{ 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_NGU_MAO], 0 }, 0 }, -- Tang kiem lenh ngu mao
			{ 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_PHI_HAI], 0 }, 0 }, -- Tang kiem lenh phi hai
			{ 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_KY_TRAN], 0 }, 0 }, -- Tang kiem lenh ky tran
			{ 1, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_1], 0 }, 0 }, -- Manh Chieu da 1
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_2], 0 }, 0 }, -- Manh Chieu da 2
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_3], 0 }, 0 }, -- Manh Chieu da 3
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_4], 0 }, 0 }, -- Manh Chieu da 4
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_5], 0 }, 0 }, -- Manh Chieu da 5
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_6], 0 }, 0 }, -- Manh Chieu da 6
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_7], 0 }, 0 }, -- Manh Chieu da 7
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_8], 0 }, 0 }, -- Manh Chieu da 8
			{ 1, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_1], 0 }, 0 }, -- Manh Xich Tho 1
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_2], 0 }, 0 }, -- Manh Xich Tho 2
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_3], 0 }, 0 }, -- Manh Xich Tho 3
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_4], 0 }, 0 }, -- Manh Xich Tho 4
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_5], 0 }, 0 }, -- Manh Xich Tho 5
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_6], 0 }, 0 }, -- Manh Xich Tho 6
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_7], 0 }, 0 }, -- Manh Xich Tho 7
			{ 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_8], 0 }, 0 }, -- Manh Xich Tho 8
			{ 60, { QK_REWARD_DESC[QK_REWARD.CO_KHO], 0 }, 0 }, -- Co Kho
			{ 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_1], 0 }, 0 }, -- Manh Phi Van 1
			{ 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_2], 0 }, 0 }, -- Manh Phi Van 2
			{ 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_3], 0 }, 0 }, -- Manh Phi Van 3
			{ 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_4], 0 }, 0 }, -- Manh Phi Van 4
			{ 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_5], 0 }, 0 }, -- Manh Phi Van 5
			{ 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_6], 0 }, 0 }, -- Manh Phi Van 6
			{ 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_7], 0 }, 0 }, -- Manh Phi Van 7
			{ 250, { QK_REWARD_DESC[QK_REWARD.BANH_PHUOC_LOC], 0 }, 0 }, -- Banh Phuoc Loc (~3 / 1000, muc 2~4)
			{ 550, { QK_REWARD_DESC[QK_REWARD.HOP_MANH_THACH_ANH], 0 }, 0 }, -- Hop Manh Thach Anh (~6.5 / 1000, muc 4~10)
			{ 550, { QK_REWARD_DESC[QK_REWARD.TUI_DO_NGHE_MAC_GIA], 0 }, 0 }, -- Tui Do Nghe Mac Gia (~6.5 / 1000, muc 4~10)
			{ 550, { QK_REWARD_DESC[QK_REWARD.DA_HOAN_THACH], 0 }, 0 }, -- Da Hoan Thach (~6.5 / 1000, muc 4~10)
			{ 250, { QK_REWARD_DESC[QK_REWARD.LENH_BAI_HONG_ANH], 0 }, 0 }, -- Lenh Bai Hong Anh (~3 / 1000, muc 2~4)
			{ 40, { QK_REWARD_DESC[QK_REWARD.RUONG_BAO_HAP_TUYET_HOC], 0 }, 0 }, -- Ruong Bao Hap Tuyet Hoc            (~0.5 / 1000)
			{ 150, { QK_REWARD_DESC[QK_REWARD.RUONG_MANH_4_BO], 0 }, 0 }, -- Ruong Manh Nhu Tinh - Hiep Cot - An Bang - Dinh Quoc
			{ 200, { QK_REWARD_DESC[QK_REWARD.TU_VA_HAO_KHI], 3 }, 0 }, -- Tu Va Hao Khi (HSD 3 ngay)
			{ 200, { QK_REWARD_DESC[QK_REWARD.HOA_PHAO_HIEU_TRIEU], 3 }, 0 }, -- Hoa Phao Hieu Trieu (HSD 3 ngay)
			{ 5000, { QK_REWARD_DESC[QK_REWARD.VONG_HOA_BANG], -1 }, 1 }, -- Long Den [Bang] khoa V.V - HSD het khao nghiem 23h59 25/08 (~29 cai / 1000 lan an, khoang 20~100)
			{ 5000, { QK_REWARD_DESC[QK_REWARD.VONG_HOA_CA_NHAN], -1 }, 0 }, -- Long Den [Ca Nhan] - HSD het khao nghiem 23h59 25/08 (~30 cai / 1000 lan an, khoang 20~100)
			{ 340, { QK_REWARD_DESC[QK_REWARD.BOSS_XANH], 0 }, 0 }, -- Lenh Bai Boss Xanh (~7 / 1000)
		},
		Random={
			
		}
	}
}
EVENT_iyaabda66e6ng0v3ckgjqkna.Reward1000 = {
	[QK_Enum_EventItem.QuanTrangChienCong] = {
		Task = TASK3_CLEAR_EVENTQUOCKHANH,
		Cell = 1,
		Exp = 2000000000,
		VongHoa = 200,
		BagNeed = 10,
	},
	[QK_Enum_EventItem.QuanTrangAnhDung] = {
		Task = TASK3_CLEAR_EVENTQUOCKHANH,
		Cell = 2,
		Exp = 3000000000,
		VongHoa = 300,
		BagNeed = 25,
		Sure = {
			{ Item = QK_REWARD_DESC[QK_REWARD.MANH_NHAT_KY_CAN_KHON_PHU], Days = -1, Lock = 0 }, -- Manh Nhat Ky Can Khon Phu (HSD het event)
			{ Item = QK_REWARD_DESC[QK_REWARD.HOP_QUA_QUOC_KHANH], Days = 0, Lock = 0 },          -- Hop Qua Quoc Khanh
			{ Item = QK_REWARD_DESC[QK_REWARD.LE_BAO_BI_KIP_TU_CHON], Days = 0, Lock = 0 },       -- 1 Le Bao Bi Kip Tu Chon
			{ Item = QK_REWARD_DESC[QK_REWARD.DAI_THANH_BI_KIP_90], Days = 0, Lock = 0 },         -- Dai Thanh Bi Kip 90
			{ Item = QK_REWARD_DESC[QK_REWARD.NHAT_KY_CAN_KHON_PHU], Days = 15, Lock = 0 },        -- 1 Nhat Ky Can Khon Phu (tac dung 15 ngay)
			{ Item = QK_REWARD_DESC[QK_REWARD.CHAN_KINH_TAN_QUYEN], Days = 0, Lock = 0 },         -- Chan Kinh Tan Quyen
			{ Item = QK_REWARD_DESC[QK_REWARD.TU_NGOC], Days = 0, Lock = 0 },                     -- Tu Ngoc
			{ Item = QK_REWARD_DESC[QK_REWARD.BACH_NGOC], Days = 0, Lock = 0 },                   -- Bach Ngoc
			{ Item = QK_REWARD_DESC[QK_REWARD.YEN_NGUA_HOAC_CHIEN_MA], Days = 0, Lock = 0 },      -- Yen Ngua hoac Chien Ma (random 1491, 1492)
			{ Item = QK_REWARD_DESC[QK_REWARD.CO_KHO], Days = 0, Lock = 0 },                      -- Nguyen lieu thuan hoa ngua (Co Kho)
			{ Item = QK_REWARD_DESC[QK_REWARD.HUAN_CHUONG_TU_DO], Days = 0, Lock = 0 },           -- Sao Vang Tu Do (Huan Chuong Tu Do)
			{ Item = QK_REWARD_DESC[QK_REWARD.LENH_BAI_BOSS_TIEU], Days = 0, Lock = 0 },          -- Lenh Bai Goi Boss Tieu
			{ Item = QK_REWARD_DESC[QK_REWARD.LENH_BAI_BOSS_DAI], Days = 0, Lock = 0 },           -- Lenh Bai Goi Boss Dai
			{ Item = QK_REWARD_DESC[QK_REWARD.MANH_CAN_KHON_SONG_TUYET_BOI], Days = -1, Lock = 0 }, -- Manh Can Khon Song Tuyet Boi (HSD het event)
		},
		RandomSets = {
			[1] = {
				{ rate = 50, Item = QK_REWARD_DESC[QK_REWARD.THIEN_MENH_HO_PHU], Days = -1, Lock = 0 }, -- Thien Menh Ho Phu (KTC +5%)
				{ rate = 50, Item = QK_REWARD_DESC[QK_REWARD.TRUONG_SINH_HO_PHU], Days = -1, Lock = 0 }, -- Truong Sinh Ho Phu (Sinh luc +200)
			},
			[2] = {
				{ rate = 50, Item = QK_REWARD_DESC[QK_REWARD.MANH_VO_LAM_MAT_TICH_QUYEN_2], Days = 0, Lock = 0 }, -- Manh Vo Lam Mat Tich quyen 2
				{ rate = 50, Item = QK_REWARD_DESC[QK_REWARD.MANH_TAY_TUY_KINH_QUYEN_2], Days = 0, Lock = 0 },   -- Manh Tay Tuy Kinh quyen 2
			},
			[3] = {
				{ rate = 34, Item = QK_REWARD_DESC[QK_REWARD.BACH_CHAN_DON], Days = 0, Lock = 0 },  -- Bach Chan Don (200tr exp)
				{ rate = 33, Item = QK_REWARD_DESC[QK_REWARD.HUYET_CHAN_DON], Days = 0, Lock = 0 }, -- Huyet Chan Don (300tr exp)
				{ rate = 33, Item = QK_REWARD_DESC[QK_REWARD.HUYEN_CHAN_DON], Days = 0, Lock = 0 }, -- Huyen Chan Don (500tr exp)
			},
			[4] = {
				{ rate = 20, Item = QK_REWARD_DESC[QK_REWARD.MANH_TRANG_BI_XANH_HONG_6], Days = 0, Lock = 0 },  -- Manh Trang Bi Xanh Hong [cap 6]
				{ rate = 20, Item = QK_REWARD_DESC[QK_REWARD.MANH_TRANG_BI_XANH_HONG_7], Days = 0, Lock = 0 },  -- Manh Trang Bi Xanh Hong [cap 7]
				{ rate = 20, Item = QK_REWARD_DESC[QK_REWARD.MANH_TRANG_BI_XANH_HONG_8], Days = 0, Lock = 0 },  -- Manh Trang Bi Xanh Hong [cap 8]
				{ rate = 20, Item = QK_REWARD_DESC[QK_REWARD.MANH_TRANG_BI_XANH_HONG_9], Days = 0, Lock = 0 },  -- Manh Trang Bi Xanh Hong [cap 9]
				{ rate = 20, Item = QK_REWARD_DESC[QK_REWARD.MANH_TRANG_BI_XANH_HONG_10], Days = 0, Lock = 0 }, -- Manh Trang Bi Xanh Hong [cap 10]
			},
		},
		ExtraPool = {
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.HOAN_BINH_THACH], Days = -1, Lock = 0 }, -- Hoan Binh Thach (HSD het event)
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.DA_PHAT_SANG], Days = 0, Lock = 0 },      -- Da Phat Sang
			{ rate = 60,  Item = QK_REWARD_DESC[QK_REWARD.BICH_NGOC_NGU_PHUC_3], Days = 0, Lock = 0 }, -- Bich Ngoc Ngu Phuc (KTC 3% + MM 10%)
			{ rate = 60,  Item = QK_REWARD_DESC[QK_REWARD.LUC_PHA_QUAN_TINH_4], Days = 0, Lock = 0 },  -- Luc Pha Quan Tinh (10% sat thuong boss)
			{ rate = 65,  Item = QK_REWARD_DESC[QK_REWARD.PHOI_KIM_CUONG_BAO], Days = 7, Lock = 0 }, -- Phoi Kim Cuong Bao (7 ngay)
			{ rate = 65,  Item = QK_REWARD_DESC[QK_REWARD.PHOI_GIANG_SA_BAO], Days = 7, Lock = 0 },  -- Phoi Giang Sa Bao (7 ngay)
			{ rate = 45,  Item = QK_REWARD_DESC[QK_REWARD.BACH_CHAN_DON], Days = 0, Lock = 0 },      -- Bach Chan Don
			{ rate = 45,  Item = QK_REWARD_DESC[QK_REWARD.HUYET_CHAN_DON], Days = 0, Lock = 0 },     -- Huyet Chan Don
			{ rate = 40,  Item = QK_REWARD_DESC[QK_REWARD.HUYEN_CHAN_DON], Days = 0, Lock = 0 },     -- Huyen Chan Don
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.VO_LAM_MAT_TICH_QUYEN_2], Days = 0, Lock = 0 }, -- Vo Lam Mat Tich Quyen 2
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.TAY_TUY_KINH_QUYEN_2], Days = 0, Lock = 0 },   -- Tay Tuy Kinh Quyen 2
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.VO_LAM_MAT_TICH], Days = 0, Lock = 0 },        -- Vo Lam Mat Tich
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.TAY_TUY_KINH], Days = 0, Lock = 0 },           -- Tay Tuy Kinh
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.TRAN_PHAI_LINH_DUOC], Days = 0, Lock = 0 },    -- Tran Phai Linh Duoc
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.TRAN_PHAI_LINH_DON], Days = 0, Lock = 0 },     -- Tran Phai Linh Don
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.BI_KIP_THUAN_XICH_THO], Days = 0, Lock = 0 },  -- Bi Kip Thuan Xich Tho
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.BI_KIP_THUAN_CHIEU_DA], Days = 0, Lock = 0 },  -- Bi Kip Thuan Chieu Da
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.BI_KIP_THUAN_PHI_VAN], Days = 0, Lock = 0 },   -- Bi Kip Thuan Phi Van
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.BI_KIP_VO_CONG_TUYET_THE], Days = 0, Lock = 0 },-- Bi Kip Vo Cong Tuyet The
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.TIN_VAT_MON_PHAI], Days = 0, Lock = 0 },       -- Tin Vat Mon Phai
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.CAN_KHON_SONG_TUYET_BOI], Days = 15, Lock = 0 }, -- Can Khon Song Tuyet Boi (15 ngay)
			{ rate = 50,  Item = QK_REWARD_DESC[QK_REWARD.RUONG_TRANG_BI_HIEP_COT], Days = 0, Lock = 0 },  -- Ruong Trang Bi Hiep Cot (Ao 80%/Ngoc Boi 20%)
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.PHO_HAO_QUANG_XICH_THO], Days = 0, Lock = 0 },  -- Pho Hao Quang Xich Tho
			{ rate = 100, Item = QK_REWARD_DESC[QK_REWARD.PHO_HAO_QUANG_CHIEU_DA], Days = 0, Lock = 0 },  -- Pho Hao Quang Chieu Da
			{ rate = 80,  Item = QK_REWARD_DESC[QK_REWARD.PHO_HAO_QUANG_PHI_VAN], Days = 0, Lock = 0 },   -- Pho Hao Quang Phi Van
			{ rate = 80,  Item = QK_REWARD_DESC[QK_REWARD.AN_QUANG_PHO], Days = 0, Lock = 0 },            -- An Quang Pho
			{ rate = 80,  Item = QK_REWARD_DESC[QK_REWARD.NHU_Y_QUANG_PHO], Days = 0, Lock = 0 },         -- Nhu Y Quang Pho
			{ rate = 60,  Item = QK_REWARD_DESC[QK_REWARD.HONG_ANH_LE_BAO], Days = -1, Lock = 0 },        -- Hong Anh Le Bao (HSD het event)
		}
	}
}
EVENT_iyaabda66e6ng0v3ckgjqkna.HopQuaQuocKhanh = {
	NeedLevel = 80,
	Random = {
		HiRate  = 65, 
		HiCount = 3, 
		Reward = {
			{100, {QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_NHO], 0}, 0},    
			{100, {QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_TRUNG], 0}, 0},   
			{100, {QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_LON], 0}, 0},   
			{100, {QK_REWARD_DESC[QK_REWARD.THUY_TINH_LAM], 0}, 0},    
			{100, {QK_REWARD_DESC[QK_REWARD.THUY_TINH_LUC], 0}, 0},    
			{100, {QK_REWARD_DESC[QK_REWARD.THUY_TINH_TIM], 0}, 0},   
			{100, {QK_REWARD_DESC[QK_REWARD.NGUA_CHIEU_DA], 15}, 0},   
			{100, {QK_REWARD_DESC[QK_REWARD.NGUA_XICH_THO], 15}, 0}, 
			{100, {QK_REWARD_DESC[QK_REWARD.NGUA_DICH_LO], 15}, 0},   
			{100, {QK_REWARD_DESC[QK_REWARD.NGUA_O_VAN], 15}, 0},  
			{100, {QK_REWARD_DESC[QK_REWARD.NGUA_TUYET_ANH], 15}, 0},  
		},
	},
	Exp = 200000000,
	Task = TASK4_CLEAR_EVENTQUOCKHANH,
	MaxUse = 2,
	Cell = 1,
}
function QK_GetConfig() return EVENT_iyaabda66e6ng0v3ckgjqkna end
function QKLib_getTime() return EVENT_iyaabda66e6ng0v3ckgjqkna.Time end
function QKLib_getMsg() return EVENT_iyaabda66e6ng0v3ckgjqkna.Msg end
function QKLib_getPackageSale(key) return EVENT_iyaabda66e6ng0v3ckgjqkna.PackageSale[key] end
function QKLib_get(key, filter)
    if (filter == QK_Enum_Filter.EVENTBOX) then return EVENT_iyaabda66e6ng0v3ckgjqkna.EventBox[key] end
    if (filter == QK_Enum_Filter.MATS) then return EVENT_iyaabda66e6ng0v3ckgjqkna.EventItem[key] end
    if (filter == QK_Enum_Filter.RECIPE) then return EVENT_iyaabda66e6ng0v3ckgjqkna.Recipe[key] end
	if (type(filter)=="table") then
		local rs={}
		for i=1,getn(filter) do
			rs[filter[i]]=%QKLib_get(key,filter[i])
		end
		return rs;
	end
    return nil
end
function QK_getMat(key) return EVENT_iyaabda66e6ng0v3ckgjqkna.EventItem[key] end
function QK_getListMat() return EVENT_iyaabda66e6ng0v3ckgjqkna.EventItem end
function QK_GetDropData(level) return EVENT_iyaabda66e6ng0v3ckgjqkna.RateDropItem[level] end
function QK_GetReward(key) return EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[key] end
function QK_GetReward1000(key) return EVENT_iyaabda66e6ng0v3ckgjqkna.Reward1000[key] end
function QK_GetRewardVongSang() return EVENT_iyaabda66e6ng0v3ckgjqkna.RewardVongSang end
function QK_GetRewardMaxEvent() return EVENT_iyaabda66e6ng0v3ckgjqkna.RewardMaxEvent end
function QK_GetHopQua() return EVENT_iyaabda66e6ng0v3ckgjqkna.HopQuaQuocKhanh end
function QK_GetKhaoNghiem() return EVENT_iyaabda66e6ng0v3ckgjqkna.KhaoNghiem end
function QK_GetVongHoaBang() return EVENT_iyaabda66e6ng0v3ckgjqkna.EventItem.VongHoaBang end
function QK_GetVongHoaCaNhan() return EVENT_iyaabda66e6ng0v3ckgjqkna.EventItem.VongHoaCaNhan end
function QK_GetItemByGDP(g, d, p)
    for key=1,9 do
        local item=EVENT_iyaabda66e6ng0v3ckgjqkna.EventItem[key]
        if (item ~= nil and item.g == g and item.d == d and item.p == p) then return key, item.Name end
    end
    return nil, nil
end
function QK_GetMaterialDropConfig()
    local rate=EVENT_iyaabda66e6ng0v3ckgjqkna.RateDropItem[QK_Enum_LVL.LV_8X]
    return {Items={QK_Enum_EventItem.AoQuanNhan,QK_Enum_EventItem.NonQuanNhan,QK_Enum_EventItem.GiayQuanNhan}, Rates={rate[QK_Enum_EventItem.AoQuanNhan],rate[QK_Enum_EventItem.NonQuanNhan],rate[QK_Enum_EventItem.GiayQuanNhan]}}
end



