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
		Exp= 3000000,
		RewardKey = {},
		Random={}
	}
}

		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 1500, { QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_NHO], 0 }, 0 }) -- Phuc Duyen Le (tieu)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 1000, { QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_TRUNG], 0 }, 0 }) -- Phuc Duyen Le (trung)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 700, { QK_REWARD_DESC[QK_REWARD.PHUC_DUYEN_LE_LON], 0 }, 0 }) -- Phuc Duyen Le (dai)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 150, { QK_REWARD_DESC[QK_REWARD.THUOC_NGOAI_CONG], 0 }, 0 }) -- thuoc ngoai cong (particular ngau nhien 1..10)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.THIET_LA_HAN], 0 }, 0 }) -- thiet la han
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 80, { QK_REWARD_DESC[QK_REWARD.TIEN_THAO_LO], 0 }, 0 }) -- Tien Thao Lo
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 60, { QK_REWARD_DESC[QK_REWARD.THIEN_SON_BAO_LO], 0 }, 0 }) -- Thien Son Bao Lo
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 200, { QK_REWARD_DESC[QK_REWARD.BAN_NHUOC_TAM_KINH], 0 }, 0 }) -- Ban Nhuoc Tam Kinh
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 120, { QK_REWARD_DESC[QK_REWARD.LAO_TAU_PHUC_MENH_THU], 0 }, 0 }) -- Lao Tau Phuc Menh Thu
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 40, { QK_REWARD_DESC[QK_REWARD.THUY_TINH_LAM], 0 }, 0 }) -- Thuy Tinh
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 40, { QK_REWARD_DESC[QK_REWARD.THUY_TINH_TIM], 0 }, 0 }) -- Thuy Tinh
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 40, { QK_REWARD_DESC[QK_REWARD.THUY_TINH_LUC], 0 }, 0 }) -- Thuy Tinh
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 40, { QK_REWARD_DESC[QK_REWARD.TINH_HONG_BAO_THACH], 0 }, 0 }) -- Tinh Hong Bao Thach
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.THIET_LA_HAN], 0 }, 0 }) -- thiet la han
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 300, { QK_REWARD_DESC[QK_REWARD.XA_LOI_KIM_DON], 0 }, 0 }) -- Xa Loi Kim Don
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 200, { QK_REWARD_DESC[QK_REWARD.SAT_THU_GIAN], 0 }, 0 }) -- Sat thu gian
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 200, { QK_REWARD_DESC[QK_REWARD.LENH_BAI_PLD], 0 }, 0 }) -- Lenh bai pld
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 3000, { QK_REWARD_DESC[QK_REWARD.PHI_TOC_HOAN], 0 }, 0 }) -- Phi Toc Hoan
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 3000, { QK_REWARD_DESC[QK_REWARD.CHIEN_CO_TONG_KIM], 0 }, 0 }) -- Chien Co Tong Kim
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 3000, { QK_REWARD_DESC[QK_REWARD.LENH_BAI_TONG_KIM], 0 }, 0 }) -- Lenh Bai Tong Kim
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.THIEN_SON_TUYET_LIEN], 0 }, 0 }) -- Thien Son Tuyet Lien
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_1], 0 }, 0 }) -- Manh Bi Kip 1
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_2], 0 }, 0 }) -- Manh Bi Kip 2
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_3], 0 }, 0 }) -- Manh Bi Kip 3
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_4], 0 }, 0 }) -- Manh Bi Kip 4
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_5], 0 }, 0 }) -- Manh Bi Kip 5
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 10, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_6], 0 }, 0 }) -- Manh Bi Kip 6
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_7], 0 }, 0 }) -- Manh Bi Kip 7
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 100, { QK_REWARD_DESC[QK_REWARD.MANH_BI_KIP_8], 0 }, 0 }) -- Manh Bi Kip 8
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 120, { QK_REWARD_DESC[QK_REWARD.QUE_HOA_TUU], 0 }, 0 }) -- Que Hoa Tuu
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.HUAN_CHUONG_DOC_LAP], 0 }, 0 }) -- Long Den Ngoi Sao (~10 / 1000)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.LONG_DEN_HOA_DANG], 0 }, 0 }) -- Long Den Hoa Dang  (~10 / 1000)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.RUONG_MANH_HIEP_COT], 0 }, 0 }) -- Ruong manh hiep cot
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.MAT_NA_BANG_HOI], 0 }, 0 }) -- Mat na bang hoi
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.NEN_BINH_AN], 0 }, 0 }) -- Nen binh an
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.NEN_HANH_PHUC], 0 }, 0 }) -- Nen hanh phuc
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_THAN_BINH], 0 }, 0 }) -- Tang kiem lenh than binh
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_BAO_GIAP], 0 }, 0 }) -- Tang kiem lenh bao giap
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_NGU_MAO], 0 }, 0 }) -- Tang kiem lenh ngu mao
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_PHI_HAI], 0 }, 0 }) -- Tang kiem lenh phi hai
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 175, { QK_REWARD_DESC[QK_REWARD.TANG_KIEM_LENH_KY_TRAN], 0 }, 0 }) -- Tang kiem lenh ky tran
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 1, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_1], 0 }, 0 }) -- Manh Chieu da 1
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_2], 0 }, 0 }) -- Manh Chieu da 2
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_3], 0 }, 0 }) -- Manh Chieu da 3
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_4], 0 }, 0 }) -- Manh Chieu da 4
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_5], 0 }, 0 }) -- Manh Chieu da 5
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_6], 0 }, 0 }) -- Manh Chieu da 6
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_7], 0 }, 0 }) -- Manh Chieu da 7
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_CHIEU_DA_8], 0 }, 0 }) -- Manh Chieu da 8
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 1, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_1], 0 }, 0 }) -- Manh Xich Tho 1
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_2], 0 }, 0 }) -- Manh Xich Tho 2
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_3], 0 }, 0 }) -- Manh Xich Tho 3
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_4], 0 }, 0 }) -- Manh Xich Tho 4
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_5], 0 }, 0 }) -- Manh Xich Tho 5
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_6], 0 }, 0 }) -- Manh Xich Tho 6
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_7], 0 }, 0 }) -- Manh Xich Tho 7
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 30, { QK_REWARD_DESC[QK_REWARD.MANH_XICH_THO_8], 0 }, 0 }) -- Manh Xich Tho 8
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 60, { QK_REWARD_DESC[QK_REWARD.CO_KHO], 0 }, 0 }) -- Co Kho
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_1], 0 }, 0 }) -- Manh Phi Van 1
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_2], 0 }, 0 }) -- Manh Phi Van 2
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_3], 0 }, 0 }) -- Manh Phi Van 3
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_4], 0 }, 0 }) -- Manh Phi Van 4
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_5], 0 }, 0 }) -- Manh Phi Van 5
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_6], 0 }, 0 }) -- Manh Phi Van 6
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 8, { QK_REWARD_DESC[QK_REWARD.MANH_PHI_VAN_7], 0 }, 0 }) -- Manh Phi Van 7
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 250, { QK_REWARD_DESC[QK_REWARD.BANH_PHUOC_LOC], 0 }, 0 }) -- Banh Phuoc Loc (~3 / 1000, muc 2~4)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 550, { QK_REWARD_DESC[QK_REWARD.HOP_MANH_THACH_ANH], 0 }, 0 }) -- Hop Manh Thach Anh (~6.5 / 1000, muc 4~10)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 550, { QK_REWARD_DESC[QK_REWARD.TUI_DO_NGHE_MAC_GIA], 0 }, 0 }) -- Tui Do Nghe Mac Gia (~6.5 / 1000, muc 4~10)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 550, { QK_REWARD_DESC[QK_REWARD.DA_HOAN_THACH], 0 }, 0 }) -- Da Hoan Thach (~6.5 / 1000, muc 4~10)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 250, { QK_REWARD_DESC[QK_REWARD.LENH_BAI_HONG_ANH], 0 }, 0 }) -- Lenh Bai Hong Anh (~3 / 1000, muc 2~4)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 40, { QK_REWARD_DESC[QK_REWARD.RUONG_BAO_HAP_TUYET_HOC], 0 }, 0 }) -- Ruong Bao Hap Tuyet Hoc            (~0.5 / 1000)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 150, { QK_REWARD_DESC[QK_REWARD.RUONG_MANH_4_BO], 0 }, 0 }) -- Ruong Manh Nhu Tinh - Hiep Cot - An Bang - Dinh Quoc
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 200, { QK_REWARD_DESC[QK_REWARD.TU_VA_HAO_KHI], 3 }, 0 }) -- Tu Va Hao Khi (HSD 3 ngay)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 200, { QK_REWARD_DESC[QK_REWARD.HOA_PHAO_HIEU_TRIEU], 3 }, 0 }) -- Hoa Phao Hieu Trieu (HSD 3 ngay)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 5000, { QK_REWARD_DESC[QK_REWARD.VONG_HOA_BANG], -1 }, 1 }) -- Long Den [Bang] khoa V.V - HSD het khao nghiem 23h59 25/08 (~29 cai / 1000 lan an, khoang 20~100)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 5000, { QK_REWARD_DESC[QK_REWARD.VONG_HOA_CA_NHAN], -1 }, 0 }) -- Long Den [Ca Nhan] - HSD het khao nghiem 23h59 25/08 (~30 cai / 1000 lan an, khoang 20~100)
		tinsert(EVENT_iyaabda66e6ng0v3ckgjqkna.Reward[QK_Enum_EventItem.QuanTrangAnhDung].RewardKey, { 340, { QK_REWARD_DESC[QK_REWARD.BOSS_XANH], 0 }, 0 }) -- Lenh Bai Boss Xanh (~7 / 1000)

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
			rs[filter[i]]=QKLib_get(key,filter[i])
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