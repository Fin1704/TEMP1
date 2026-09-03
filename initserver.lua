Include("\\script\\lockprogram.lua");
Include("\\script\\headers\\globallist.lua");
Include("\\script\\headers\\npcdeclare.lua");
Include("\\script\\event\\addnpc.lua");
Include("\\script\\headers\\startserver\\expandmap.lua");
Include("\\script\\missions\\killer\\killerbosshead.lua");
Include("\\script\\missions\\citywar\\addnpc.lua");
Include("\\script\\missions\\plant\\tongtreehead.lua");


SCRIPT_COMMON = "\\script\\npcs\\common\\"
SCRIPT_COMMON_FAC = "\\script\\npcs\\common\\facnpc.lua"
GOLDTASK_DIALOGERFILE = FileName2Id("\\script\\missions\\goldtask\\dialog.lua")
GOLDTASK_MONSTERFILE = FileName2Id("\\script\\missions\\goldtask\\monslevel.lua")
GOLDTASK_BRANCHMONS = FileName2Id("\\script\\missions\\goldtask\\branchmons.lua")
function StartGame(SvNumber)
	if (SvNumber == 0) then
		SQLCommand("UPDATE TongData SET Act = 0 WHERE Act != 0")
	end
	randomseed(GetRandomSeed())
	if (PREPARE_TORACE > 0) then
		SetGlbMissionV(GMSV_PREPARE_TORACE, 1);
	end
	if (ENABLE_DROPEVENT > 0) then
		SetGlbMissionV(GMSV_DROP_EVENT, 1);
	end
	if (ENABLE_MIDPROGRAM > 0) then
		SetGlbMissionV(GMSV_MIDPROGRAM, 1);
	end
	if (ENABLE_STARTFTASK > 0) then
		SetGlbMissionV(GMSV_STARTFTASK, 1);
	end
	if (SubWorldID2Idx(53) >= 0) then --Ba L¨ng huyÖn
		Include("\\script\\headers\\startserver\\balang.lua");
		init_balang()
	end
	if (SubWorldID2Idx(78) >= 0) then --T­¬ng D­¬ng
		Include("\\script\\headers\\startserver\\tuongduong.lua");
		init_tuongduong()
	end
	if (SubWorldID2Idx(320) >= 0) then --Ch©n nói Tr­êng B¹ch
		Include("\\script\\headers\\startserver\\channuitb.lua");
		init_cntb()
	end
	if (SubWorldID2Idx(336) >= 0) then --Phong L¨ng ®é
		Include("\\script\\headers\\startserver\\phonglangdo.lua");
		init_pld()
	end
	if (SubWorldID2Idx(901) >= 0) then --Phong L¨ng ®é b¾c
		Include("\\script\\headers\\startserver\\pldbac.lua");
		init_pldbac()
	end
	if (SubWorldID2Idx(81) >= 0) then --Vâ §ang
		Include("\\script\\headers\\startserver\\vodangphai.lua");
		init_vodangphai()
	end
	if (SubWorldID2Idx(115) >= 0) then --C¸i Bang
		Include("\\script\\headers\\startserver\\caibang.lua");
		init_caibang()
	end
	if (SubWorldID2Idx(79) >= 0) then --MËt ®¹o T­¬ng D­¬ng
		Include("\\script\\headers\\startserver\\matdaotd.lua");
		init_matdaotd()
	end
	if (SubWorldID2Idx(82) >= 0) then --Mª cung §¸y giÕng
		Include("\\script\\headers\\startserver\\mcdaygieng.lua");
		init_mcdaygieng()
	end
	if (SubWorldID2Idx(83) >= 0) then --Háa Lang ®éng
		Include("\\script\\headers\\startserver\\hoalangdong.lua");
		init_hoalangdong()
	end
	if (SubWorldID2Idx(116) >= 0) then --T­êng V©n ®éng 1
		Include("\\script\\headers\\startserver\\tuongvan1.lua");
		init_tuongvan1()
	end
	if (SubWorldID2Idx(117) >= 0) then --T­êng V©n ®éng 2
		Include("\\script\\headers\\startserver\\tuongvan2.lua");
		init_tuongvan2()
	end
	if (SubWorldID2Idx(118) >= 0) then --T­êng V©n ®éng 3
		Include("\\script\\headers\\startserver\\tuongvan3.lua");
		init_tuongvan3()
	end
	if (SubWorldID2Idx(119) >= 0) then --T­êng V©n ®éng 4
		Include("\\script\\headers\\startserver\\tuongvan4.lua");
		init_tuongvan4()
	end
	if (SubWorldID2Idx(120) >= 0) then --T­êng V©n ®éng 5	
		Include("\\script\\headers\\startserver\\tuongvan5.lua");
		init_tuongvan5()
	end
	if (SubWorldID2Idx(125) >= 0) then --L­u Tiªn ®éng 1
		Include("\\script\\headers\\startserver\\luutiendong1.lua");
		init_luutiendong1()
	end
	if (SubWorldID2Idx(126) >= 0) then --L­u Tiªn ®éng 2
		Include("\\script\\headers\\startserver\\luutiendong2.lua");
		init_luutiendong2()
	end
	if (SubWorldID2Idx(127) >= 0) then --L­u Tiªn ®éng 3
		Include("\\script\\headers\\startserver\\luutiendong3.lua");
		init_luutiendong3()
	end
	if (SubWorldID2Idx(128) >= 0) then --L­u Tiªn ®éng 4
		Include("\\script\\headers\\startserver\\luutiendong4.lua");
		init_luutiendong4()
	end
	if (SubWorldID2Idx(129) >= 0) then --L­u Tiªn ®éng 5
		Include("\\script\\headers\\startserver\\luutiendong5.lua");
		init_luutiendong5()
	end
	if (SubWorldID2Idx(130) >= 0) then --L­u Tiªn ®éng 6
		Include("\\script\\headers\\startserver\\luutiendong6.lua");
		init_luutiendong6()
	end
	if (SubWorldID2Idx(199) >= 0) then --Vò L¨ng ®éng
		Include("\\script\\headers\\startserver\\vulangdong.lua");
		init_vulangdong()
	end
	if (SubWorldID2Idx(84) >= 0 --Tö Tiªu ®¹i ®iÖn
			or SubWorldID2Idx(85) >= 0 --ThËp Ph­¬ng ®iÖn
			or SubWorldID2Idx(86) >= 0 --Phô MÉu ®iÖn
			or SubWorldID2Idx(87) >= 0) --Long Hæ ®iÖn
	then
		Include("\\script\\headers\\startserver\\vodangdien.lua");
		if (SubWorldID2Idx(84) >= 0) then
			init_vodangdien(84)
		end
		if (SubWorldID2Idx(85) >= 0) then
			init_vodangdien(85)
		end
		if (SubWorldID2Idx(86) >= 0) then
			init_vodangdien(86)
		end
		if (SubWorldID2Idx(87) >= 0) then
			init_vodangdien(87)
		end
	end
	--if( SubWorldID2Idx(88) >= 0) then --Nh· thÊt 1(ch­a sö dông)
	--end
	--if( SubWorldID2Idx(89) >= 0) then --Nh· thÊt 2(ch­a sö dông)
	--end
	if (SubWorldID2Idx(1) >= 0) then --Ph­îng T­êng
		Include("\\script\\headers\\startserver\\phuongtuong.lua");
		init_phuongtuong()
	end
	if (SubWorldID2Idx(99) >= 0) then --VÜnh L¹c trÊn
		Include("\\script\\headers\\startserver\\vinhlac.lua");
		init_vinhlac()
	end
	if (SubWorldID2Idx(75) >= 0) then --Kháa Lang ®éng (Xi V­u)
		Include("\\script\\headers\\startserver\\khoalangdong.lua")
		init_khoalangdong()
	end
	if (SubWorldID2Idx(321) >= 0 --Tr­êng B¹ch s¬n Nam
			or SubWorldID2Idx(921) >= 0 --Thiªn Phô S¬n
			or SubWorldID2Idx(922) >= 0) --Bµn Long S¬n
	then
		Include("\\script\\headers\\startserver\\tbsnam.lua");
		if (SubWorldID2Idx(321) >= 0) then
			init_truongbachnam()
		end
		if (SubWorldID2Idx(921) >= 0) then
			init_thienphuson()
		end
		if (SubWorldID2Idx(922) >= 0) then
			init_banlongson()
		end
	end
	if (SubWorldID2Idx(2) >= 0) then --Hoa S¬n tuyÖt ®Ønh
		Include("\\script\\headers\\startserver\\hoasoncanh.lua");
		init_hoasoncanh()
	end
	if (SubWorldID2Idx(3) >= 0) then --KiÕm C¸c T©y B¾c
		Include("\\script\\headers\\startserver\\kiemcactaybac.lua");
		init_kiemcactaybac()
	end
	if (SubWorldID2Idx(4) >= 0) then --Kim Quang ®éng
		Include("\\script\\headers\\startserver\\kimquangdong.lua");
		init_kimquangdong()
	end
	if (SubWorldID2Idx(5) >= 0) then --Kinh Hoµng ®éng
		Include("\\script\\headers\\startserver\\kinhhoangdong.lua");
		init_kinhhoangdong()
	end
	if (SubWorldID2Idx(6) >= 0) then --Táa V©n ®éng
		Include("\\script\\headers\\startserver\\toavandong.lua");
		init_toavandong()
	end
	if (SubWorldID2Idx(7) >= 0) then --TÇn L¨ng
		Include("\\script\\headers\\startserver\\tanlang.lua");
		init_tanlang()
	end
	if (SubWorldID2Idx(8) >= 0) then --L¨ng TÇn Thñy Hoµng
		Include("\\script\\headers\\startserver\\langtth.lua");
		init_langtth()
	end
	if (SubWorldID2Idx(206) >= 0) then --TÇn L¨ng 2
		Include("\\script\\headers\\startserver\\tanlang2.lua");
		init_tanlang2()
	end
	if (SubWorldID2Idx(207) >= 0) then --TÇn L¨ng 3
		Include("\\script\\headers\\startserver\\tanlang3.lua");
		init_tanlang3()
	end
	if (SubWorldID2Idx(70) >= 0) then --Vò L¨ng s¬n
		Include("\\script\\headers\\startserver\\vulangson.lua");
		init_vulangson()
	end
	if (SubWorldID2Idx(71) >= 0) then --B¹ch Thñy ®éng
		Include("\\script\\headers\\startserver\\bachthuydong.lua");
		init_bachthuydong()
	end
	if (SubWorldID2Idx(72) >= 0) then --§¹i Tï ®éng
		Include("\\script\\headers\\startserver\\daitudong.lua");
		init_daitudong()
	end
	if (SubWorldID2Idx(73) >= 0) then --Phôc L­u ®éng
		Include("\\script\\headers\\startserver\\phucluudong.lua")
		init_pldong()
	end

	if (SubWorldID2Idx(74) >= 0) then --Miªu LÜnh
		Include("\\script\\headers\\startserver\\mieulinh.lua");
		init_mieulinh()
	end
	if (SubWorldID2Idx(76) >= 0) then --S¬n B¶o ®éng
		Include("\\script\\headers\\startserver\\sonbaodong.lua")
		init_sonbaodong()
	end
	if (SubWorldID2Idx(77) >= 0) then --YÕn Tö ®éng
		Include("\\script\\headers\\startserver\\yentudong.lua")
		init_yentudong()
	end
	if (SubWorldID2Idx(201) >= 0) then --B¨ng Hµ ®éng
		Include("\\script\\headers\\startserver\\banghadong.lua")
		init_banghadong()
	end
	if (SubWorldID2Idx(333) >= 0) then --Hoa S¬n ph¸i
		Include("\\script\\headers\\startserver\\hoasonphai.lua")
		init_hoasonphai()
	end

	if (SubWorldID2Idx(37) >= 0) then --BiÖn Kinh
		Include("\\script\\headers\\startserver\\bienkinh.lua");
		init_bienkinh()
	end
	if (SubWorldID2Idx(100) >= 0) then --Chu Tiªn trÊn
		Include("\\script\\headers\\startserver\\chutien.lua");
		init_chutien()
	end
	if (SubWorldID2Idx(121) >= 0) then --Long M«n trÊn
		Include("\\script\\headers\\startserver\\longmon.lua");
		init_longmon()
	end

	if (SubWorldID2Idx(322) >= 0 --Tr­êng B¹ch s¬n B¾c
			or SubWorldID2Idx(923) >= 0 --§Þa MÉu S¬n
			or SubWorldID2Idx(924) >= 0) --UyÓn Phông S¬n
	then
		Include("\\script\\headers\\startserver\\tbsonbac.lua");
		if (SubWorldID2Idx(322) >= 0) then
			init_truongbachbac()
		end
		if (SubWorldID2Idx(923) >= 0) then
			init_diamauson()
		end
		if (SubWorldID2Idx(924) >= 0) then
			init_uyenphungson()
		end
	end

	if (SubWorldID2Idx(38) >= 0) then --ThiÕt th¸p tÇng 1
		Include("\\script\\headers\\startserver\\thietthaptang1.lua")
		init_thietthap1()
	end
	if (SubWorldID2Idx(39) >= 0) then --ThiÕt th¸p tÇng 2
		Include("\\script\\headers\\startserver\\thietthaptang2.lua")
		init_thietthap2()
	end
	if (SubWorldID2Idx(40) >= 0) then --ThiÕt th¸p tÇng 3
		Include("\\script\\headers\\startserver\\thietthaptang3.lua")
		init_thietthap3()
	end
	if (SubWorldID2Idx(45) >= 0) then --Thiªn NhÉn gi¸o
		Include("\\script\\headers\\startserver\\thiennhan.lua")
		init_thiennhan()
	end
	if (SubWorldID2Idx(46) >= 0) then --Thiªn NhÉn Gi¸o tÇng 1
		Include("\\script\\headers\\startserver\\thiennhan1.lua")
		init_thiennhan1()
	end
	if (SubWorldID2Idx(47) >= 0) then --Thiªn NhÉn Gi¸o tÇng 2
		Include("\\script\\headers\\startserver\\thiennhan2.lua")
		init_thiennhan2()
	end
	if (SubWorldID2Idx(48) >= 0) then --Thiªn NhÉn Gi¸o tÇng 2
		Include("\\script\\headers\\startserver\\thiennhan2_2.lua")
		init_thiennhan2_2()
	end
	if (SubWorldID2Idx(49) >= 0) then --Thiªn NhÉn Gi¸o tÇng 3
		Include("\\script\\headers\\startserver\\thiennhan3.lua")
		init_thiennhan3()
	end
	if (SubWorldID2Idx(50) >= 0) then --ThÊt S¸t ®éng
		Include("\\script\\headers\\startserver\\thatsatdong.lua")
		init_thatsatdong()
	end
	if (SubWorldID2Idx(51) >= 0) then --Th¸nh ®éng tÇng 1
		Include("\\script\\headers\\startserver\\thanhdong1.lua")
		init_thanhdong1()
	end
	if (SubWorldID2Idx(52) >= 0) then --Th¸nh ®éng tÇng 2
		Include("\\script\\headers\\startserver\\thanhdong2.lua")
		init_thanhdong2()
	end
	if (SubWorldID2Idx(131) >= 0) then --C«n L«n Ph¸i
		Include("\\script\\headers\\startserver\\conlonphai.lua")
		init_conlonphai()
	end
	if (SubWorldID2Idx(132) >= 0) then --B¨ng HuyÖt ®éng
		Include("\\script\\headers\\startserver\\banghuyet.lua")
		init_banghuyet()
	end
	if (SubWorldID2Idx(135) >= 0) then --KiÕn TÝnh Phong s¬n ®éng
		Include("\\script\\headers\\startserver\\kientinh.lua")
		init_kientinhpsd()
	end
	if (SubWorldID2Idx(136) >= 0) then --Kho¸i Ho¹t L©m
		Include("\\script\\headers\\startserver\\khoaihoatlam.lua")
		init_khoaihoatlam()
	end
	if (SubWorldID2Idx(140) >= 0) then --D­îc V­¬ng Cèc
		Include("\\script\\headers\\startserver\\duocvuongcoc.lua")
		init_duocvuongcoc()
	end
	if (SubWorldID2Idx(141) >= 0) then --D­îc V­¬ng ®éng tÇng 1
		Include("\\script\\headers\\startserver\\duocvuong1.lua")
		init_duocvuongdong1()
	end
	if (SubWorldID2Idx(142) >= 0) then --D­îc V­¬ng ®éng tÇng 2
		Include("\\script\\headers\\startserver\\duocvuong2.lua")
		init_duocvuongdong2()
	end
	if (SubWorldID2Idx(143) >= 0) then --D­îc V­¬ng ®éng tÇng 3
		Include("\\script\\headers\\startserver\\duocvuong3.lua")
		init_duocvuongdong3()
	end
	if (SubWorldID2Idx(144) >= 0) then --D­îc V­¬ng ®éng tÇng 4
		Include("\\script\\headers\\startserver\\duocvuong4.lua")
		init_duocvuongdong4()
	end
	if (SubWorldID2Idx(204) >= 0) then --Phi Thiªn ®éng
		Include("\\script\\headers\\startserver\\phithiendong.lua")
		init_phithiendong()
	end
	if (SubWorldID2Idx(137) >= 0 --Thiªn Vi ®iÖn
			or SubWorldID2Idx(138) >= 0 --ChÝnh ®iÖn
			or SubWorldID2Idx(139) >= 0) --Tö Vi ®iÖn
	then
		Include("\\script\\headers\\startserver\\conlondien.lua");
		if (SubWorldID2Idx(137) >= 0) then
			init_conlondien(137)
		end
		if (SubWorldID2Idx(138) >= 0) then
			init_conlondien(138)
		end
		if (SubWorldID2Idx(139) >= 0) then
			init_conlondien(139)
		end
	end
	--if( SubWorldID2Idx(133) >= 0) then --Phßng §Ö tö(ch­a sö dông)
	--end
	--if( SubWorldID2Idx(134) >= 0) then --Phßng §Ö tö(ch­a sö dông)
	--end
	if (SubWorldID2Idx(80) >= 0) then --D­¬ng Ch©u
		Include("\\script\\headers\\startserver\\duongchau.lua")
		init_duongchau()
	end
	if (SubWorldID2Idx(101) >= 0) then --§¹o H­¬ng th«n
		Include("\\script\\headers\\startserver\\daohuong.lua");
		init_daohuong()
	end
	if (SubWorldID2Idx(93) >= 0) then --TiÕn Cóc ®éng
		Include("\\script\\headers\\startserver\\tiencucdong.lua")
		init_tiencucdong()
	end
	if (SubWorldID2Idx(124) >= 0) then --C¸n Viªn ®éng
		Include("\\script\\headers\\startserver\\canviendong.lua")
		init_canviendong()
	end
	if (SubWorldID2Idx(41) >= 0) then --Phôc Ng­u S¬n T©y
		Include("\\script\\headers\\startserver\\phucnguutay.lua")
		init_pnst()
	end
	if (SubWorldID2Idx(90) >= 0) then --Phôc Ng­u S¬n §«ng
		Include("\\script\\headers\\startserver\\phucnguudong.lua")
		init_pnsd()
	end
	if (SubWorldID2Idx(42) >= 0) then --Thiªn T©m ®éng
		Include("\\script\\headers\\startserver\\thientamdong.lua")
		init_thientamdong()
	end
	if (SubWorldID2Idx(43) >= 0) then --KiÕm C¸c Trung Nguyªn
		Include("\\script\\headers\\startserver\\kctrungnguyen.lua")
		init_kctrungnguyen()
	end
	if (SubWorldID2Idx(91) >= 0) then --Mª cung Kª Qu¸n ®éng
		Include("\\script\\headers\\startserver\\kequandong.lua")
		init_mecungkqd()
	end
	if (SubWorldID2Idx(92) >= 0) then --Thôc C­¬ng s¬n
		Include("\\script\\headers\\startserver\\thuccuongson.lua")
		init_thuccuongson()
	end
	if (SubWorldID2Idx(94) >= 0) then --Linh Cèc ®éng
		Include("\\script\\headers\\startserver\\linhcocdong.lua")
		init_linhcoc()
	end
	if (SubWorldID2Idx(103) >= 0) then --ThiÕu L©m Ph¸i
		Include("\\script\\headers\\startserver\\thieulamphai.lua")
		init_thieulam()
	end
	if (SubWorldID2Idx(111) >= 0) then --Méc Nh©n H¹ng
		Include("\\script\\headers\\startserver\\mocnhanhang.lua")
		init_mocnhanhang()
	end
	if (SubWorldID2Idx(113) >= 0) then --MËt thÊt ThiÕu L©m
		Include("\\script\\headers\\startserver\\matthat_tl.lua")
		init_matthattl()
	end
	if (SubWorldID2Idx(114) >= 0) then --108 La H¸n trËn
		Include("\\script\\headers\\startserver\\108lahantran.lua")
		init_108lht()
	end
	if (SubWorldID2Idx(205) >= 0) then --D­¬ng Trung ®éng
		Include("\\script\\headers\\startserver\\duongtrungdong.lua")
		init_duongtrungdong()
	end
	if (SubWorldID2Idx(122) >= 0) then --Hoµng Hµ Nguyªn §Çu
		Include("\\script\\headers\\startserver\\hoanghand.lua")
		init_hoanghand()
	end
	if (SubWorldID2Idx(123) >= 0) then --L·o Hæ ®éng
		Include("\\script\\headers\\startserver\\laohodong.lua")
		init_laoho()
	end
	if (SubWorldID2Idx(200) >= 0) then --Cæ D­¬ng ®éng
		Include("\\script\\headers\\startserver\\coduongdong.lua")
		init_coduongdong()
	end
	if (SubWorldID2Idx(319) >= 0) then --L©m Du Quan
		Include("\\script\\headers\\startserver\\lamduquan.lua")
		init_ldq()
	end
	if (SubWorldID2Idx(1031) >= 0) then --§«ng Du Quan
		Include("\\script\\headers\\startserver\\dongduquan.lua")
		init_ddq()
	end
	if (SubWorldID2Idx(1032) >= 0) then --T©y Du Quan
		Include("\\script\\headers\\startserver\\tayduquan.lua")
		init_tdq()
	end
	if (SubWorldID2Idx(1033) >= 0) then --Nam Du Quan
		Include("\\script\\headers\\startserver\\namduquan.lua")
		init_ndq()
	end
	if (SubWorldID2Idx(1034) >= 0) then --B¾c Du Quan
		Include("\\script\\headers\\startserver\\bacduquan.lua")
		init_bdq()
	end
	if (SubWorldID2Idx(145) >= 0) then --TuyÕt B¸o ®éng tÇng 1
		Include("\\script\\headers\\startserver\\tbdtang1.lua")
		init_tbdtang1()
	end
	if (SubWorldID2Idx(146) >= 0) then --TuyÕt B¸o ®éng tÇng 2
		Include("\\script\\headers\\startserver\\tbdtang2.lua")
		init_tbdtang2()
	end
	if (SubWorldID2Idx(147) >= 0) then --TuyÕt B¸o ®éng tÇng 3
		Include("\\script\\headers\\startserver\\tbdtang3.lua")
		init_tbdtang3()
	end
	if (SubWorldID2Idx(148) >= 0) then --TuyÕt B¸o ®éng tÇng 4
		Include("\\script\\headers\\startserver\\tbdtang4.lua")
		init_tbdtang4()
	end
	if (SubWorldID2Idx(149) >= 0) then --TuyÕt B¸o ®éng tÇng 5
		Include("\\script\\headers\\startserver\\tbdtang5.lua")
		init_tbdtang5()
	end
	if (SubWorldID2Idx(150) >= 0) then --TuyÕt B¸o ®éng tÇng 6
		Include("\\script\\headers\\startserver\\tbdtang6.lua")
		init_tbdtang6()
	end
	if (SubWorldID2Idx(151) >= 0) then --TuyÕt B¸o ®éng tÇng 7
		Include("\\script\\headers\\startserver\\tbdtang7.lua")
		init_tbdtang7()
	end
	if (SubWorldID2Idx(152) >= 0) then --TuyÕt B¸o ®éng tÇng 8
		Include("\\script\\headers\\startserver\\tbdtang8.lua")
		init_tbdtang8()
	end
	if (SubWorldID2Idx(102) >= 0) then --Th¸nh ®éng tÇng 2
		Include("\\script\\headers\\startserver\\thanhdong2hide.lua")
		init_thanhdong2hide()
	end
	if (SubWorldID2Idx(104) >= 0 or --Tµng Kinh C¸c
			SubWorldID2Idx(105) >= 0 or --§¹t Ma §­êng
			SubWorldID2Idx(106) >= 0 or --§¹i Hïng b¶o ®iÖn
			SubWorldID2Idx(109) >= 0 or --Ph­¬ng tr­îng ThiÒn phßng
			SubWorldID2Idx(110) >= 0 or --La H¸n §­êng
			SubWorldID2Idx(112) >= 0) then --Thiªn PhËt ®iÖn
		Include("\\script\\headers\\startserver\\thieulamphong.lua");
		if (SubWorldID2Idx(104) >= 0) then
			init_tangkinhcac()
		end
		if (SubWorldID2Idx(105) >= 0) then
			init_datmaduong()
		end
		if (SubWorldID2Idx(106) >= 0) then
			init_dhbaodien()
		end
		if (SubWorldID2Idx(109) >= 0) then
			init_ptthienphong()
		end
		if (SubWorldID2Idx(110) >= 0) then
			init_lahanduong()
		end
		if (SubWorldID2Idx(112) >= 0) then
			init_thienphatdien()
		end
	end
	--if( SubWorldID2Idx(107) >= 0) then --ThiÕu L©m §Ö tö phßng(ch­a sö dông)
	--end
	--if( SubWorldID2Idx(108) >= 0) then --ThiÕu L©m §Ö tö phßng(ch­a sö dông)
	--end

	if (SubWorldID2Idx(11) >= 0) then --Thµnh §«
		Include("\\script\\headers\\startserver\\thanhdo.lua");
		init_thanhdo()
	end
	if (SubWorldID2Idx(20) >= 0) then --Giang T©n Th«n
		Include("\\script\\headers\\startserver\\giangtan.lua");
		init_giangtan()
	end

	if (SubWorldID2Idx(340) >= 0 --M¹c Cao QuËt
			or SubWorldID2Idx(917) >= 0 --TÝch HuyÕt Cèc
			or SubWorldID2Idx(918) >= 0) --¸c Nh©n Cèc
	then
		Include("\\script\\headers\\startserver\\maccaoquat.lua")
		if (SubWorldID2Idx(340) >= 0) then
			init_maccaoquat()
		end
		if (SubWorldID2Idx(917) >= 0) then
			init_tichhuyetcoc()
		end
		if (SubWorldID2Idx(918) >= 0) then
			init_acnhancoc()
		end
	end

	if (SubWorldID2Idx(21) >= 0) then --Thanh Thµnh s¬n
		Include("\\script\\headers\\startserver\\thanhthanhson.lua")
		init_thanhthanhson()
	end
	if (SubWorldID2Idx(12) >= 0) then --§Þa ®¹o hËu viÖn TÝn T­íng tù
		Include("\\script\\headers\\startserver\\diadaottt.lua")
		init_diadaottt()
	end
	if (SubWorldID2Idx(13) >= 0) then --Nga My ph¸i
		Include("\\script\\headers\\startserver\\ngamyphai.lua")
		init_ngamyphai()
	end
	if (SubWorldID2Idx(15) >= 0 --Gi¶ng Kinh §­êng
			or SubWorldID2Idx(16) >= 0 --TiÒn ®iÖn
			or SubWorldID2Idx(17) >= 0 --ChÝnh ®iÖn
			or SubWorldID2Idx(18) >= 0) --T¶ Thiªn ®iÖn
	then
		Include("\\script\\headers\\startserver\\ngamydien.lua");
		if (SubWorldID2Idx(15) >= 0) then
			init_ngamydien(15)
		end
		if (SubWorldID2Idx(16) >= 0) then
			init_ngamydien(16)
		end
		if (SubWorldID2Idx(17) >= 0) then
			init_ngamydien(17)
		end
		if (SubWorldID2Idx(18) >= 0) then
			init_ngamydien(18)
		end
	end

	if (SubWorldID2Idx(14) >= 0) then --M·nh Hæ ®éng
		Include("\\script\\headers\\startserver\\manhhodong.lua")
		init_manhhodong()
	end
	if (SubWorldID2Idx(19) >= 0) then --KiÕm C¸c T©y Nam
		Include("\\script\\headers\\startserver\\kiemcactaynam.lua")
		init_kiemcactaynam()
	end
	if (SubWorldID2Idx(10) >= 0) then --Nh¹n Th¹ch ®éng
		Include("\\script\\headers\\startserver\\nhanthachdong.lua")
		init_nhanthachdong()
	end
	if (SubWorldID2Idx(22) >= 0) then --B¹ch V©n ®éng
		Include("\\script\\headers\\startserver\\bachvandong.lua")
		init_bachvandong()
	end
	if (SubWorldID2Idx(23) >= 0) then --ThÇn Tiªn ®éng
		Include("\\script\\headers\\startserver\\thantiendong.lua")
		init_thantiendong()
	end
	if (SubWorldID2Idx(24) >= 0) then --H­ëng Thñy ®éng
		Include("\\script\\headers\\startserver\\huongthuydong.lua")
		init_huongthuy()
	end

	if (SubWorldID2Idx(25) >= 0) then --§­êng M«n
		Include("\\script\\headers\\startserver\\duongmon.lua")
		init_duongmon()
	end
	if (SubWorldID2Idx(29) >= 0 --8 phßng ®­êng m«n
			or SubWorldID2Idx(30) >= 0
			or SubWorldID2Idx(31) >= 0
			or SubWorldID2Idx(32) >= 0
			or SubWorldID2Idx(33) >= 0
			or SubWorldID2Idx(34) >= 0
			or SubWorldID2Idx(35) >= 0
			or SubWorldID2Idx(36) >= 0)
	then
		Include("\\script\\headers\\startserver\\dmonphong.lua");
		if (SubWorldID2Idx(29) >= 0) then
			init_phongduongmon(29)
		end
		if (SubWorldID2Idx(30) >= 0) then
			init_phongduongmon(30)
		end
		if (SubWorldID2Idx(31) >= 0) then
			init_phongduongmon(31)
		end
		if (SubWorldID2Idx(32) >= 0) then
			init_phongduongmon(32)
		end
		if (SubWorldID2Idx(33) >= 0) then
			init_phongduongmon(33)
		end
		if (SubWorldID2Idx(34) >= 0) then
			init_phongduongmon(34)
		end
		if (SubWorldID2Idx(35) >= 0) then
			init_phongduongmon(35)
		end
		if (SubWorldID2Idx(36) >= 0) then
			init_phongduongmon(36)
		end
	end

	if (SubWorldID2Idx(26) >= 0) then --Tróc T¬ ®éng tÇng 1
		Include("\\script\\headers\\startserver\\tructodong1.lua")
		init_tructodong1()
	end
	if (SubWorldID2Idx(27) >= 0) then --Tróc T¬ ®éng tÇng 2
		Include("\\script\\headers\\startserver\\tructodong2.lua")
		init_tructodong2()
	end
	if (SubWorldID2Idx(28) >= 0) then --Tróc T¬ ®éng tÇng 3
		Include("\\script\\headers\\startserver\\tructodong3.lua")
		init_tructodong3()
	end

	if (SubWorldID2Idx(9) >= 0) then --Tr­êng Giang Nguyªn §Çu
		Include("\\script\\headers\\startserver\\truonggiangnd.lua")
		init_truonggiang()
	end
	if (SubWorldID2Idx(202) >= 0) then --Phï Dung ®éng
		Include("\\script\\headers\\startserver\\phudungdong.lua")
		init_phudung()
	end

	if (SubWorldID2Idx(162) >= 0) then --§¹i Lý phñ
		Include("\\script\\headers\\startserver\\daily.lua")
		init_daily()
	end
	if (SubWorldID2Idx(153) >= 0) then --Th¹ch Cæ trÊn
		Include("\\script\\headers\\startserver\\thachco.lua");
		init_thachco()
	end
	if (SubWorldID2Idx(174) >= 0) then --Long TuyÒn th«n
		Include("\\script\\headers\\startserver\\longtuyen.lua");
		init_longtuyen()
	end
	if (SubWorldID2Idx(154) >= 0) then --Thóy Yªn M«n
		Include("\\script\\headers\\startserver\\thuyyenmon.lua")
		init_thuyyenmon()
	end
	if (SubWorldID2Idx(155) >= 0 --B¸ch Hoa ®×nh
			or SubWorldID2Idx(160) >= 0 --Thñ Ngäc s¶nh
			or SubWorldID2Idx(161) >= 0) --Thóy Yªn LÇu
	then
		Include("\\script\\headers\\startserver\\thuyyenlau.lua");
		if (SubWorldID2Idx(155) >= 0) then
			init_thuyyenlau(155)
		end
		if (SubWorldID2Idx(160) >= 0) then
			init_thuyyenlau(160)
		end
		if (SubWorldID2Idx(161) >= 0) then
			init_thuyyenlau(161)
		end
	end
	--if( SubWorldID2Idx(156) >= 0) then --phßng §Ö tö (kh«ng sö dông)
	--end
	--if( SubWorldID2Idx(157) >= 0) then --phßng §Ö tö (kh«ng sö dông)
	--end
	--if( SubWorldID2Idx(159) >= 0) then --M«n lÇu (kh«ng sö dông)
	--end

	if (SubWorldID2Idx(158) >= 0) then --Mª cung cÊm ®Þa
		Include("\\script\\headers\\startserver\\mecungcd.lua")
		init_mecungcd()
	end
	if (SubWorldID2Idx(163) >= 0) then --¸c b¸ ®Þa ®¹o
		Include("\\script\\headers\\startserver\\acbadiadao.lua")
		init_abdd()
	end
	if (SubWorldID2Idx(164) >= 0) then --Thiªn TÇm th¸p tÇng 1
		Include("\\script\\headers\\startserver\\thientamthap1.lua")
		init_thientamthap1()
	end
	if (SubWorldID2Idx(165) >= 0) then --Thiªn TÇm th¸p tÇng 2
		Include("\\script\\headers\\startserver\\thientamthap2.lua")
		init_thientamthap2()
	end
	if (SubWorldID2Idx(166) >= 0) then --Thiªn TÇm th¸p tÇng 3
		Include("\\script\\headers\\startserver\\thientamthap3.lua")
		init_thientamthap3()
	end
	if (SubWorldID2Idx(167) >= 0) then --§iÓm Th­¬ng s¬n
		Include("\\script\\headers\\startserver\\diemthuongson.lua")
		init_diemthuongson()
	end
	if (SubWorldID2Idx(168) >= 0) then --Phông Nh·n ®éng
		Include("\\script\\headers\\startserver\\phungnhandong.lua")
		init_phungnhan()
	end
	if (SubWorldID2Idx(169) >= 0) then --Long Nh·n ®éng
		Include("\\script\\headers\\startserver\\longnhandong.lua")
		init_longnhan()
	end
	if (SubWorldID2Idx(170) >= 0) then --Thæ PhØ ®éng
		Include("\\script\\headers\\startserver\\thophidong.lua")
		init_thophidong()
	end

	if (SubWorldID2Idx(171) >= 0) then --§iÓm Th­¬ng ®éng tÇng 1
		Include("\\script\\headers\\startserver\\diemthuong1.lua")
		init_diemthuongdong1()
	end
	if (SubWorldID2Idx(172) >= 0) then --§iÓm Th­¬ng ®éng tÇng 2
		Include("\\script\\headers\\startserver\\diemthuong2.lua")
		init_diemthuongdong2()
	end
	if (SubWorldID2Idx(173) >= 0) then --§iÓm Th­¬ng ®éng tÇng 3
		Include("\\script\\headers\\startserver\\diemthuong3.lua")
		init_diemthuongdong3()
	end
	if (SubWorldID2Idx(203) >= 0) then --V« Danh ®éng
		Include("\\script\\headers\\startserver\\vodanhdong.lua")
		init_vodanhdong()
	end
	if (SubWorldID2Idx(179) >= 0) then --La Tiªu s¬n
		Include("\\script\\headers\\startserver\\latieuson.lua")
		init_latieu()
	end
	if (SubWorldID2Idx(180) >= 0) then --Long Cung ®éng
		Include("\\script\\headers\\startserver\\longcung.lua")
		init_longcung()
	end
	if (SubWorldID2Idx(181) >= 0) then --L­ìng Thñy ®éng
		Include("\\script\\headers\\startserver\\luongthuy.lua")
		init_luongthuy()
	end
	if (SubWorldID2Idx(1035) >= 0) then --L­ìng Thñy ®«ng
		Include("\\script\\headers\\startserver\\luongthuydong.lua")
		init_luongthuydong()
	end
	if (SubWorldID2Idx(1036) >= 0) then --L­ìng Thñy T©y
		Include("\\script\\headers\\startserver\\luongthuytay.lua")
		init_luongthuytay()
	end
	if (SubWorldID2Idx(1037) >= 0) then --L­ìng Thñy Nam
		Include("\\script\\headers\\startserver\\luongthuynam.lua")
		init_luongthuynam()
	end
	if (SubWorldID2Idx(1038) >= 0) then --L­ìng Thñy B¾c
		Include("\\script\\headers\\startserver\\luongthuybac.lua")
		init_luongthuybac()
	end
	if (SubWorldID2Idx(182) >= 0) then --NghiÖt Long ®éng
		Include("\\script\\headers\\startserver\\nghietlong.lua")
		init_nghietlong()
	end

	if (SubWorldID2Idx(193) >= 0) then --Vò Di s¬n
		Include("\\script\\headers\\startserver\\vudison.lua")
		init_vudison()
	end
	if (SubWorldID2Idx(194) >= 0) then --Ngäc Hoa ®éng
		Include("\\script\\headers\\startserver\\ngochoadong.lua")
		init_ngochoadong()
	end
	if (SubWorldID2Idx(195) >= 0) then --Nh¹n §·ng s¬n
		Include("\\script\\headers\\startserver\\nhandangson.lua")
		init_nhandangson()
	end
	if (SubWorldID2Idx(196) >= 0) then --D­¬ng Gi¸c ®éng
		Include("\\script\\headers\\startserver\\duongiacdong.lua")
		init_duongiacdong()
	end
	if (SubWorldID2Idx(198) >= 0) then --Thanh khª ®éng
		Include("\\script\\headers\\startserver\\thanhkhedong.lua")
		init_thanhkhedong()
	end
	if (SubWorldID2Idx(332) >= 0) then --Thiªn Long Tù
		Include("\\script\\headers\\startserver\\thienlongtu.lua")
		init_thienlongtu()
	end
	if (SubWorldID2Idx(231) >= 0) then --N¬i ë Th­¬ng L­¬ng kh¸ch
		Include("\\script\\headers\\startserver\\thuongluong.lua")
		init_thuongluong()
	end

	if (SubWorldID2Idx(176) >= 0) then --L©m An
		Include("\\script\\headers\\startserver\\laman.lua")
		init_laman()
	end
	if (SubWorldID2Idx(224) >= 0 --Sa m¹c ®Þa biÓu
			or SubWorldID2Idx(919) >= 0 --Thùc Cèt Nhai
			or SubWorldID2Idx(920) >= 0 --H¾c Méc Nhai
		) then
		Include("\\script\\headers\\startserver\\smdb.lua")
		if (SubWorldID2Idx(224) >= 0) then
			init_smdiabieu()
		end
		if (SubWorldID2Idx(919) >= 0) then
			init_thuccotnhai()
		end
		if (SubWorldID2Idx(920) >= 0) then
			init_hacmocnhai()
		end
	end

	if (SubWorldID2Idx(225) >= 0) then --Sa M¹c 1
		Include("\\script\\headers\\startserver\\samac1.lua")
		init_samac1()
	end
	if (SubWorldID2Idx(226) >= 0 or SubWorldID2Idx(875) >= 0) then
		Include("\\script\\headers\\startserver\\samac2.lua")
		if (SubWorldID2Idx(226) >= 0) then --Sa M¹c 2
			init_samac2()
		end
		if (SubWorldID2Idx(875) >= 0) then --H¾c Sa ®éng
			init_hacsadong()
		end
	end
	if (SubWorldID2Idx(227) >= 0) then --Sa M¹c 3
		Include("\\script\\headers\\startserver\\samac3.lua")
		init_samac3()
	end

	if (SubWorldID2Idx(177) >= 0) then --Ngù Hoa viªn
		Include("\\script\\headers\\startserver\\nguhoavien.lua")
		init_nguhoavien()
	end
	if (SubWorldID2Idx(178) >= 0) then --S¬n ®éng Ngù Hoa viªn
		Include("\\script\\headers\\startserver\\sondongnhv.lua")
		init_sondongnhv()
	end
	if (SubWorldID2Idx(183) >= 0) then --Ngò §éc Gi¸o
		Include("\\script\\headers\\startserver\\ngudocgiao.lua")
		init_ngudocgiao()
	end
	if (SubWorldID2Idx(184) >= 0 --XÝch YÕt tr¹i
			or SubWorldID2Idx(185) >= 0 --Kim Xµ tr¹i
			or SubWorldID2Idx(186) >= 0 --MÆc Thï tr¹i
			or SubWorldID2Idx(187) >= 0 --Thanh Ng« tr¹i
			or SubWorldID2Idx(188) >= 0 --Ng©n ThiÒm tr¹i
			or SubWorldID2Idx(189) >= 0) --Tæng tr¹i
	then
		Include("\\script\\headers\\startserver\\ngudoctrai.lua");
		if (SubWorldID2Idx(184) >= 0) then
			init_ngudoctrai(184)
		end
		if (SubWorldID2Idx(185) >= 0) then
			init_ngudoctrai(185)
		end
		if (SubWorldID2Idx(186) >= 0) then
			init_ngudoctrai(186)
		end
		if (SubWorldID2Idx(187) >= 0) then
			init_ngudoctrai(187)
		end
		if (SubWorldID2Idx(188) >= 0) then
			init_ngudoctrai(188)
		end
		if (SubWorldID2Idx(189) >= 0) then
			init_ngudoctrai(189)
		end
	end
	if (SubWorldID2Idx(190) >= 0) then --Mª cung nhËp m«n
		Include("\\script\\headers\\startserver\\mecungnm.lua")
		init_mecungnm()
	end
	if (SubWorldID2Idx(54) >= 0) then --Nam Nh¹c trÊn
		Include("\\script\\headers\\startserver\\namnhactran.lua")
		init_namnhac()
	end
	if (SubWorldID2Idx(55) >= 0) then --§µo Hoa Nguyªn
		Include("\\script\\headers\\startserver\\daohoanguyen.lua")
		init_daohoanguyen()
	end
	if (SubWorldID2Idx(56) >= 0 --Hoµnh S¬n Ph¸i
			or SubWorldID2Idx(57) >= 0 --Hoµnh S¬n ®¹i ®×nh
			or SubWorldID2Idx(58) >= 0) --§éc C« KiÕm Ngäa thÊt
	then
		Include("\\script\\headers\\startserver\\hoanhsonphai.lua")
		if (SubWorldID2Idx(56) >= 0) then
			init_hoanhson()
		end
		if (SubWorldID2Idx(57) >= 0) then
			init_hoanhsondd()
		end
		if (SubWorldID2Idx(58) >= 0) then
			init_dckngoathat()
		end
	end

	if (SubWorldID2Idx(59) >= 0 --Thiªn V­¬ng Bang
			or SubWorldID2Idx(60) >= 0 --TiÒn ®iÖn
			or SubWorldID2Idx(61) >= 0 --Thiªn V­¬ng §¹i ®iÖn
			or SubWorldID2Idx(62) >= 0) --TÈm cung
	then
		Include("\\script\\headers\\startserver\\thienvuong.lua")
		if (SubWorldID2Idx(59) >= 0) then --Thiªn V­¬ng Bang
			init_thienvuong()
		end
		if (SubWorldID2Idx(60) >= 0) then
			init_tvbdien(60)
		end
		if (SubWorldID2Idx(61) >= 0) then
			init_tvbdien(61)
		end
		if (SubWorldID2Idx(62) >= 0) then
			init_tvbdien(62)
		end
	end

	if (SubWorldID2Idx(65) >= 0) then --Thiªn V­¬ng ®¶o s¬n ®éng
		Include("\\script\\headers\\startserver\\tvdsondong.lua")
		init_tvdsondong()
	end
	if (SubWorldID2Idx(66) >= 0) then --§¸y §éng §×nh hå tÇng 1
		Include("\\script\\headers\\startserver\\dongdinhho1.lua")
		init_daydongdh1()
	end
	if (SubWorldID2Idx(67) >= 0) then --§¸y §éng §×nh hå tÇng 2
		Include("\\script\\headers\\startserver\\dongdinhho2.lua")
		init_daydongdh2()
	end
	if (SubWorldID2Idx(68) >= 0) then --Thanh Loa ®¶o
		Include("\\script\\headers\\startserver\\thanhloadao.lua")
		init_thanhloadao()
	end
	if (SubWorldID2Idx(69) >= 0) then --Thanh Loa ®¶o s¬n ®éng
		Include("\\script\\headers\\startserver\\tldsondong.lua")
		init_tldsondong()
	end
	if (SubWorldID2Idx(175) >= 0) then --T©y S¬n th«n
		Include("\\script\\headers\\startserver\\taysonthon.lua")
		init_taysonthon()
	end
	if (SubWorldID2Idx(341) >= 0) then --M¹c B¾c Th¶o Nguyªn
		Include("\\script\\headers\\startserver\\mbthaonguyen.lua")
		init_macbactn()
	end
	if (SubWorldID2Idx(342) >= 0) then --Vi s¬n ®¶o
		Include("\\script\\headers\\startserver\\visondao.lua")
		init_visondao()
	end

	if (SubWorldID2Idx(1039) >= 0) then
		Include("\\script\\headers\\startserver\\chientruonghh.lua")
		init_chientruonghh(1039)
	end

	if (SubWorldID2Idx(1040) >= 0) then
		Include("\\script\\headers\\startserver\\chientruonghh.lua")
		init_chientruonghh(1040)
	end

	if (SubWorldID2Idx(20) >= 0) then
		AddNpc(391, 1, 20, 113466, 198705, "\\script\\npcs\\common\\bank.lua", 6, 70) --Chñ TiÒn trang
	end

	if (SubWorldID2Idx(101) >= 0) then
		AddNpc(391, 1, 101, 54032, 100320, "\\script\\npcs\\common\\bank.lua", 6, 70) --Chñ TiÒn trang
	end

	if (SubWorldID2Idx(174) >= 0) then
		AddNpc(391, 1, 174, 51930, 101960, "\\script\\npcs\\common\\bank.lua", 6, 70) --Chñ TiÒn trang
	end

	if (SubWorldID2Idx(53) >= 0) then
		AddNpc(391, 1, 53, 52238, 101545, "\\script\\npcs\\common\\bank.lua", 6, 70) --Chñ TiÒn trang
	end


	--new map
	--if( SubWorldID2Idx(1008) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1008.lua")
	--init_1008()
	--end
	--if( SubWorldID2Idx(1009) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1009.lua")
	--init_1009()
	--end
	--if( SubWorldID2Idx(1010) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1010.lua")
	--init_1010()
	--end
	--if( SubWorldID2Idx(1011) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1011.lua")
	--init_1011()
	--end
	--if( SubWorldID2Idx(1012) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1012.lua")
	--init_1012()
	--end
	--if( SubWorldID2Idx(1013) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1013.lua")
	--init_1013()
	--end
	--if( SubWorldID2Idx(1014) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1014.lua")
	--init_1014()
	--end
	--if( SubWorldID2Idx(1015) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1015.lua")
	--init_1015()
	--end
	--if( SubWorldID2Idx(1016) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1016.lua")
	--init_1016()
	--end
	--if( SubWorldID2Idx(1017) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1017.lua")
	--init_1017()
	--end
	--if( SubWorldID2Idx(1018) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1018.lua")
	--init_1018()
	--end
	--if( SubWorldID2Idx(1019) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1019.lua")
	--init_1019()
	--end
	--if( SubWorldID2Idx(1020) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1020.lua")
	--init_1020()
	--end
	--if( SubWorldID2Idx(1021) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1020.lua")
	--init_1020()
	--end
	--if( SubWorldID2Idx(1022) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1022.lua")
	--init_1022()
	--end
	--if( SubWorldID2Idx(1023) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1023.lua")
	--init_1023()
	--end
	--if( SubWorldID2Idx(1024) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1024.lua")
	--init_1024()
	--end
	--if( SubWorldID2Idx(1025) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1025.lua")
	--init_1025()
	--end
	--if( SubWorldID2Idx(1026) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1026.lua")
	--init_1026()
	--end
	--if( SubWorldID2Idx(1027) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1027.lua")
	--init_1027()
	--end
	--if( SubWorldID2Idx(1028) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1028.lua")
	--init_1028()
	--end
	--if( SubWorldID2Idx(1029) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1029.lua")
	--init_1029()
	--end
	--if( SubWorldID2Idx(1030) >= 0) then
	--Include("\\script\\headers\\startserver\\newmap\\1030.lua")
	--init_1030()
	--end


	--if( SubWorldID2Idx(63) >= 0) then --Phßng ®Ö tö 1(kh«ng sö dông)
	--end
	--if( SubWorldID2Idx(64) >= 0) then --Phßng ®Ö tö 2(kh«ng sö dông)
	--end

	--if( SubWorldID2Idx(191) >= 0) then --phßng §Ö tö(kh«ng sö dông)
	--end
	--if( SubWorldID2Idx(192) >= 0) then --phßng §Ö tö(kh«ng sö dông)
	--end
	for i = 520, 526 do --Minh NguyÖt trÊn
		if (SubWorldID2Idx(i) >= 0) then
			Include("\\script\\headers\\startserver\\minhnguyet.lua")
			init_minhnguyettran(i)
		end
	end

	Include("\\script\\headers\\startserver\\taytuy.lua");
	for i = 242, 248 do --TÈy Tñy ®¶o
		if (SubWorldID2Idx(i) >= 0) then
			init_taytuydao(i)
		end
	end

	Include("\\script\\headers\\startserver\\taytuysd.lua");
	for i = 249, 318 do --TÈy Tñy ®¶o s¬n ®éng
		if (SubWorldID2Idx(i) >= 0) then
			init_taytuysd(i)
		end
	end

	Include("\\script\\headers\\startserver\\aclangcoc.lua");
	for i = 950, 956 do --¸c Lang Cèc
		if (SubWorldID2Idx(i) >= 0) then
			init_aclangcoc(i)
		end
	end

	--boss s¸t thñ
	--killerboss_addnpc(80)
	--killerboss_addnpc(90)
	--c¸c map tÝnh n¨ng kh¸c
	g_initExpandMap()
	add_eventnpc()
	--add_citywarnpc()
	--if(SvNumber == 5) then
	--	readd_tongtree()
	--end
end;

--hµm nµy khi cÇn më thªm map míi
function OpenNewMap(nMap)
	--if(nMap == 162) then
	--Include("\\script\\headers\\startserver\\daily.lua")
	--init_daily()	
	--end
end;

function readd_tongtree()
	local count = GetIniInt(defTFILETREE, "Data", "Count");
	if (count <= 0) then
		return
	end
	for i = 1, count do
		local nTongID = GetIniInt(defTFILETREE, i, "TongID");
		if (nTongID ~= 0) then
			local nStep = GetIniInt(defTFILETREE, i, "Step");
			local nPoint = GetIniInt(defTFILETREE, i, "Point");
			local nRemain = GetIniInt(defTFILETREE, i, "Remain");
			local szTName = GetIniStr(defTFILETREE, i, "TName");
			local w = GetIniInt(defTFILETREE, i, "Map");
			local x = GetIniInt(defTFILETREE, i, "PosX");
			local y = GetIniInt(defTFILETREE, i, "PosY");
			if (nStep >= 4) then
				if (nPoint <= 0 or nRemain < 1080) then
					DelIniSec(defTFILETREE, i, 1)
				else
					local npcid = AddNpc(tbNPCIDSTEP[nStep], 1, w, x, y, defTSCRIPTTREE, 5,
						"[" .. szTName .. "]Thiªn TuÕ tr­ëng thµnh");
					SetNpcSeries(npcid, 5);
					SetBoss(npcid, 2);
					SetAIMode(npcid, 0)
					SetLife(npcid, 5000000, 1);
					SetNpcAntiFatally(npcid, 100); --chèng chÝ tö
					NpcAddMagicA(npcid, 199, 5000000) --triÖt tiªu s¸t th­¬ng
					SetNpcTask(npcid, 4, nPoint) --®iÓm nhËn th­ëng
					SetNpcTask(npcid, 5, defTREEDMGPOINT) -- ®iÓm dmg
					local Series = GetNpcSeries(npcid) + 1;
					if (Series == 1) then  --kim
						RecvScriptSkill(npcid, 537);
					elseif (Series == 2) then --méc
						RecvScriptSkill(npcid, 534);
					elseif (Series == 3) then --thñy
						RecvScriptSkill(npcid, 538);
					elseif (Series == 4) then --háa
						RecvScriptSkill(npcid, 536);
					else                   --thæ
						RecvScriptSkill(npcid, 535);
					end
					SetAIMode(npcid, 100)            --kiÓu ch¹y script
					SetNpcLifeTime(npcid, nRemain)   --time cßn l¹i
					SetNpcTask(npcid, 0, nStep)      --step giai ®o¹n
					SetNpcTask(npcid, 1, i)          --sè thø tù trong file ini
					SetNpcTask(npcid, 2, GetCurrentTime() + 2 * 18) --loop 2s
					SetNpcTask(npcid, 3, 0)          --®¸nh dÊu ®· xãa
				end
			else
				if (nRemain < 1080) then
					nRemain = 1080
				end
				local npcid = AddNpc(tbNPCIDSTEP[nStep], 1, w, x, y, defTSCRIPTTREE, 6,
					"[" .. szTName .. "]giai ®o¹n " .. (nStep + 1) .. " Thiªn TuÕ");
				SetAIMode(npcid, 100)               --kiÓu ch¹y script
				SetNpcLifeTime(npcid, nRemain)      --time cßn l¹i
				SetNpcTask(npcid, 0, nStep)         --step giai ®o¹n
				SetNpcTask(npcid, 1, i)             --sè thø tù trong file ini
				SetNpcTask(npcid, 2, GetCurrentTime() + 2 * 18) --loop 2s
				SetNpcTask(npcid, 3, 0)             --®¸nh dÊu ®· xãa
			end
		end
	end
end;
