--PhÇn th­ëng giÕt Boss Hoµng Kim
-- 31/1/2021
Include("\\script\\lockprogram.lua");
Include("\\script\\awards\\awardfunc.lua")
Include("\\script\\headers\\math.lua")
Include("\\script\\headers\\moc_cap_nhat_kinh_nghiem_server1.lua");
Include("\\script\\headers\\bluedrop.lua")
Include("\\script\\headers\\npclevels.lua")
Include("\\script\\headers\\goldmap.lua")
Include("\\script\\programs\\maskmagic.lua");
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
Include("\\script\\event\\quockhanh0209\\helper.lua"); -- event Quoc Khanh

DefBos_Link = "goldboss\\small.ini"
DefBos_bigLink = "goldboss\\big.ini"

function KinhNghiemBossHoangKimTieuKetThuc()
	return ChonKinhNghiemTheoMocVaTiLeServer1(4000000, 12000000, GB_EXPRATE)
end

function KinhNghiemBossHoangKimTieuDungCanh()
	return ChonKinhNghiemTheoMocVaTiLeServer1(3000000, 9000000, GB_EXPRATE)
end

function KinhNghiemBossHoangKimDaiKetThuc()
	return ChonKinhNghiemTheoMocVaTiLeServer1(5000000, 15000000, GB_EXPRATE)
end

function KinhNghiemBossHoangKimDaiDungCanh()
	return ChonKinhNghiemTheoMocVaTiLeServer1(4000000, 12000000, GB_EXPRATE)
end

GB_EXPSMALL = KinhNghiemBossHoangKimTieuKetThuc()
GB_EXPSMALLNEAR = KinhNghiemBossHoangKimTieuDungCanh()

GB_EXPBIG = KinhNghiemBossHoangKimDaiKetThuc()
GB_EXPBIGNEAR = KinhNghiemBossHoangKimDaiDungCanh()

GB_EXPSUPER = floor(25000000 * GB_EXPRATE)
GB_EXPSUPERNEAR = floor(8000000 * GB_EXPRATE)

tbGBsureItem_Small = { --list ch¾c ch¾n rít
	--{{0,4,{238,240},0,0,5,0,0},0},--Thñy tinh
	--{{0,6,1,12,0,5,0,0},0},--Bµn Nh­îc T©m Kinh
	--{{0,6,1,23,0,5,0,0},0},--ThiÕt La H¸n
	--{{0,6,1,124,0,5,0,0},0},--Phóc Duyªn Lé (§¹i)
	--{{0,6,1,124,0,5,0,0},0},--Phóc Duyªn Lé (§¹i)
};

tbGBrandItem_Small = { --list rít ngÉu nhiªn
	--Param1: Tû lÖ r¬i vµo
	--Item: {{tableItemparam},dateminute},sèl­îng,®·rít		tableItemparam= type,genre,detail,particular,level,series,luck,magic
	{ 8000, { nil, nil },            nil, 0 }, --§å xanh
	{ 360,  { { 0, 6, 1, 15, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Phi Phong
	--{100,{{0,6,1,26,0,5,0,0},0},1,0},--Vâ L©m MËt TÞch
	--{100,{{0,6,1,22,0,5,0,0},0},1,0},--TÈy Tñy Kinh
	--{1200,{{0,6,1,124,0,5,0,0},0},3,0},--Phóc Duyªn Lé (§¹i)
	{ 360,  { { 0, 6, 1, 71, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Tiªn Th¶o Lé
	--{360,{{0,6,1,72,0,5,0,0},0},1,0},--Thiªn s¬n B¶o Lé
	{ 360,  { { 0, 6, 1, 73, 0, 5, 0, 0 }, 0 }, 2, 0 }, --B¸ch Qu¶ Lé
	--{1200,{{0,6,1,18,0,5,0,0},0},2,0},--T©m T©m T­¬ng ¸nh phï
	--{600,{{0,6,2,1182,0,5,0,0},0},1,0},--B¹ch C©u Hoµn x3 kü n¨ng
	--{240,{{0,4,353,0,0,5,0,0},0},1,0},--Tinh Hång B¶o Th¹ch
	{ 240,  { { 0, 4, 240, 0, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Thñy tinh
	{ 240,  { { 0, 4, 238, 0, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Thñy tinh
	{ 240,  { { 0, 4, 239, 0, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Thñy tinh
	{ 600,  { { 0, 6, 1, 23, 0, 5, 0, 0 }, 0 }, 1, 0 }, --ThiÕt La H¸n
	{ 600,  { { 0, 6, 1, 12, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Bµn Nh­îc T©m Kinh
	--	{950,{{0,6,0,3,0,5,0,0},0},3,0},--§¹i Lùc hoµn
	--{360,{{0,6,1,125,0,5,0,0},0},1,0},--QuÕ Hoa Töu
	--{8,{{2,0,163,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.anbang_chuyen},--An Bang chuyÒn 19
	--{720,{{0,6,1,{117,121},0,5,0,0},0},2,0},--thuèc néi c«ng
	--{16,{{2,0,{164,166},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.anbang_nhanboi},--An Bang
	--{780,{{0,6,0,{1,10},0,5,0,0},0},2,0},--thuèc ngo¹i c«ng
	--{32,{{2,0,{158,159},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_aonon},--§Þnh Quèc ¸o nãn
	--{400,{{0,6,1,2620,0,5,0,0},0},2,0},--X¸ Lîi Kim §¬n
	--{40,{{2,0,{160,162},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_taydaigiay},--§Þnh Quèc
	--{720,{{0,6,1,13,0,5,0,0},0},1,0},--§¹i Hång Bao
	--{300,nil,1,0},--®å riªng theo id, param3: lo¹i rít (lo¹i 1 bÝ kÝp)
	--{12,{{2,0,203,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.honganh_chuyen},--Hång ¶nh chuyÒn 28
	--{950,{{0,6,0,6,0,5,0,0},0},3,0},--Phi Tèc hoµn
	--{20,{{2,0,{204,206},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.honganh_nhanboi},--Hång ¶nh
	--{720,{{0,6,2,124,0,5,0,0},0},1,0},--danh väng lé §¹i
	--{36,{{2,0,185,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.hiepcot_ao},--HiÖp Cèt ¸o
	--{240,{{2,0,{186,187},0,0,0,15,0},0},1,0},--HiÖp Cèt
	--{240,{{2,0,{190,191},0,0,0,15,0},0},1,0},--Nhu T×nh
	--{30,{{2,0,188,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.hiepcot_boi},--HiÖp Cèt béi
	--{30,{{2,0,192,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.nhutinh_boi},--Nhu T×nh béi
	--{8,{{2,0,189,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.nhutinh_ao},--Nhu T×nh ¸o
	--{160,{{0,6,1,2739,0,5,0,0},0},1,0},--cµn kh«n phÝch lÞch ®¬n
};

tbGBrandItemSvip_Small = {
	{ 0, 6, 1, 26, 0, 5, 0, 0 }, --Vâ L©m MËt TÞch
	{ 0, 6, 1, 22, 0, 5, 0, 0 }, --TÈy Tñy Kinh
};

tbGBrandItemSvip_Small_2 = {
	-- {0,6,1,26,0,5,0,0},--Vâ L©m MËt TÞch
	-- {0,6,1,22,0,5,0,0},--TÈy Tñy Kinh
};

tbGBsureItem_Big = { --list ch¾c ch¾n rít
	-- {{0,4,{238,240},0,0,5,0,0},0},--Thñy tinh
	-- {{0,4,{238,240},0,0,5,0,0},0},--Thñy tinh
	-- {{0,4,353,0,0,5,0,0},0},--Tinh Hång B¶o Th¹ch
	-- {{0,6,1,12,0,5,0,0},0},--Bµn Nh­îc T©m Kinh
	-- {{0,6,1,12,0,5,0,0},0},--Bµn Nh­îc T©m Kinh
	-- {{0,6,1,23,0,5,0,0},0},--ThiÕt La H¸n
	-- {{0,6,1,23,0,5,0,0},0},--ThiÕt La H¸n
	-- {{0,6,1,124,0,5,0,0},0},--Phóc Duyªn Lé (§¹i)
	-- {{0,6,1,124,0,5,0,0},0},--Phóc Duyªn Lé (§¹i)
	-- {{0,6,1,124,0,5,0,0},0},--Phóc Duyªn Lé (§¹i)
	-- {{0,6,1,18,0,5,0,0},0},--T©m T©m T­¬ng ¸nh phï
	{ { 0, 6, 1, 1665, 0, 5, 0, 0 }, 0 }, -- Le Bao Thiet La Han
};

tbGBrandItem_Big = { --list rít ngÉu nhiªn
	-- {6000,{nil,nil},nil,0},--§å xanh
	-- {360,{{0,6,1,15,0,5,0,0},0},1,0},--Phi Phong
	-- {100,{{0,6,1,26,0,5,0,0},0},1,0},--Vâ L©m MËt TÞch
	-- {100,{{0,6,1,22,0,5,0,0},0},1,0},--TÈy Tñy Kinh
	-- {1200,{{0,6,1,124,0,5,0,0},0},3,0},--Phóc Duyªn Lé (§¹i)
	-- {360,{{0,6,1,71,0,5,0,0},0},1,0},--Tiªn Th¶o Lé
	-- {360,{{0,6,1,72,0,5,0,0},0},1,0},--Thiªn s¬n B¶o Lé
	-- {360,{{0,6,1,73,0,5,0,0},0},2,0},--B¸ch Qu¶ Lé
	-- {1200,{{0,6,1,18,0,5,0,0},0},2,0},--T©m T©m T­¬ng ¸nh phï
	-- {600,{{0,6,2,1182,0,5,0,0},0},1,0},--B¹ch C©u Hoµn x3 kü n¨ng
	-- {240,{{0,4,353,0,0,5,0,0},0},1,0},--Tinh Hång B¶o Th¹ch
	-- {240,{{0,4,240,0,0,5,0,0},0},1,0},--Thñy tinh
	-- {240,{{0,4,238,0,0,5,0,0},0},1,0},--Thñy tinh
	-- {240,{{0,4,239,0,0,5,0,0},0},1,0},--Thñy tinh
	-- {600,{{0,6,1,23,0,5,0,0},0},1,0},--ThiÕt La H¸n
	-- {600,{{0,6,1,12,0,5,0,0},0},1,0},--Bµn Nh­îc T©m Kinh
	-- {950,{{0,6,0,3,0,5,0,0},0},3,0},--§¹i Lùc hoµn
	-- {360,{{0,6,1,125,0,5,0,0},0},1,0},--QuÕ Hoa Töu
	----{8,{{2,0,163,0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.anbang_chuyen},--An Bang chuyÒn 19
	-- {720,{{0,6,1,{117,121},0,5,0,0},0},2,0},--thuèc néi c«ng
	----{16,{{2,0,{164,166},0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.anbang_nhanboi},--An Bang
	-- {780,{{0,6,0,{1,10},0,5,0,0},0},2,0},--thuèc ngo¹i c«ng
	----{32,{{2,0,{158,159},0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_aonon},--§Þnh Quèc ¸o nãn
	-- {400,{{0,6,1,2620,0,5,0,0},0},2,0},--X¸ Lîi Kim §¬n
	----{40,{{2,0,{160,162},0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_taydaigiay},--§Þnh Quèc
	-- {720,{{0,6,1,13,0,5,0,0},0},1,0},--§¹i Hång Bao
	-- {950,nil,1,0},--®å riªng theo id, param3: lo¹i rít (lo¹i 1 bÝ kÝp)
	----{12,{{2,0,203,0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.honganh_chuyen},--Hång ¶nh chuyÒn 28
	-- {200,{{0,6,0,6,0,5,0,0},0},3,0},--Phi Tèc hoµn
	----{20,{{2,0,{204,206},0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.honganh_nhanboi},--Hång ¶nh
	-- {720,{{0,6,2,124,0,5,0,0},0},1,0},--danh väng lé §¹i
	----{36,{{2,0,185,0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.hiepcot_ao},--HiÖp Cèt ¸o
	----{240,{{2,0,{186,187},0,0,0,20,0},0},1,0},--HiÖp Cèt
	----{240,{{2,0,{190,191},0,0,0,20,0},0},1,0},--Nhu T×nh
	----{30,{{2,0,188,0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.hiepcot_boi},--HiÖp Cèt béi
	----{30,{{2,0,192,0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.nhutinh_boi},--Nhu T×nh béi
	----{8,{{2,0,189,0,0,0,20,0},0},1,0,ENABLE_GOLDDROP.nhutinh_ao},--Nhu T×nh ¸o
	----{160,{{0,6,1,2739,0,5,0,0},0},2,0},--cµn kh«n phÝch lÞch ®¬n



	--Param1: Tû lÖ r¬i vµo
	--Item: {{tableItemparam},dateminute},sèl­îng,®·rít		tableItemparam= type,genre,detail,particular,level,series,luck,magic
	{ 8000, { nil, nil },            nil, 0 }, --§å xanh
	{ 360,  { { 0, 6, 1, 15, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Phi Phong
	--{100,{{0,6,1,26,0,5,0,0},0},1,0},--Vâ L©m MËt TÞch
	--{100,{{0,6,1,22,0,5,0,0},0},1,0},--TÈy Tñy Kinh
	--{1200,{{0,6,1,124,0,5,0,0},0},3,0},--Phóc Duyªn Lé (§¹i)
	{ 360,  { { 0, 6, 1, 71, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Tiªn Th¶o Lé
	--{360,{{0,6,1,72,0,5,0,0},0},1,0},--Thiªn s¬n B¶o Lé
	{ 360,  { { 0, 6, 1, 73, 0, 5, 0, 0 }, 0 }, 2, 0 }, --B¸ch Qu¶ Lé
	--{1200,{{0,6,1,18,0,5,0,0},0},2,0},--T©m T©m T­¬ng ¸nh phï
	--{600,{{0,6,2,1182,0,5,0,0},0},1,0},--B¹ch C©u Hoµn x3 kü n¨ng
	--{240,{{0,4,353,0,0,5,0,0},0},1,0},--Tinh Hång B¶o Th¹ch
	{ 240,  { { 0, 4, 240, 0, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Thñy tinh
	{ 240,  { { 0, 4, 238, 0, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Thñy tinh
	{ 240,  { { 0, 4, 239, 0, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Thñy tinh
	{ 600,  { { 0, 6, 1, 23, 0, 5, 0, 0 }, 0 }, 1, 0 }, --ThiÕt La H¸n
	{ 600,  { { 0, 6, 1, 12, 0, 5, 0, 0 }, 0 }, 1, 0 }, --Bµn Nh­îc T©m Kinh
	-- {100,{{0,6,1,1384,0,5,0,0},0},1,0},--B¸ch B¶o R­¬ng
	--	{950,{{0,6,0,3,0,5,0,0},0},3,0},--§¹i Lùc hoµn
	--{360,{{0,6,1,125,0,5,0,0},0},1,0},--QuÕ Hoa Töu
	--{8,{{2,0,163,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.anbang_chuyen},--An Bang chuyÒn 19
	--{720,{{0,6,1,{117,121},0,5,0,0},0},2,0},--thuèc néi c«ng
	--{16,{{2,0,{164,166},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.anbang_nhanboi},--An Bang
	--{780,{{0,6,0,{1,10},0,5,0,0},0},2,0},--thuèc ngo¹i c«ng
	--{32,{{2,0,{158,159},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_aonon},--§Þnh Quèc ¸o nãn
	--{400,{{0,6,1,2620,0,5,0,0},0},2,0},--X¸ Lîi Kim §¬n
	--{40,{{2,0,{160,162},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_taydaigiay},--§Þnh Quèc
	--{720,{{0,6,1,13,0,5,0,0},0},1,0},--§¹i Hång Bao
	--{300,nil,1,0},--®å riªng theo id, param3: lo¹i rít (lo¹i 1 bÝ kÝp)
	--{12,{{2,0,203,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.honganh_chuyen},--Hång ¶nh chuyÒn 28
	--{950,{{0,6,0,6,0,5,0,0},0},3,0},--Phi Tèc hoµn
	--{20,{{2,0,{204,206},0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.honganh_nhanboi},--Hång ¶nh
	--{720,{{0,6,2,124,0,5,0,0},0},1,0},--danh väng lé §¹i
	--{36,{{2,0,185,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.hiepcot_ao},--HiÖp Cèt ¸o
	--{240,{{2,0,{186,187},0,0,0,15,0},0},1,0},--HiÖp Cèt
	--{240,{{2,0,{190,191},0,0,0,15,0},0},1,0},--Nhu T×nh
	--{30,{{2,0,188,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.hiepcot_boi},--HiÖp Cèt béi
	--{30,{{2,0,192,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.nhutinh_boi},--Nhu T×nh béi
	--{8,{{2,0,189,0,0,0,15,0},0},1,0,ENABLE_GOLDDROP.nhutinh_ao},--Nhu T×nh ¸o
	--{160,{{0,6,1,2739,0,5,0,0},0},1,0},--cµn kh«n phÝch lÞch ®¬n


};

tbGBrandItemSvip_Big = {
	{ 0, 6, 1, 26, 0, 5, 0, 0 }, --Vâ L©m MËt TÞch
	{ 0, 6, 1, 22, 0, 5, 0, 0 }, --TÈy Tñy Kinh
};
tbGBrandItemSvip_Big2 = {
	{ 0, 6, 1, 1384, 0, 5, 0, 0 }, --B¸ch B¶o R­¬ng
};


tbGBsureItem_Super = {          --list ch¾c ch¾n rít
	{ { 0, 4, { 238, 240 }, 0, 0, 5, 0, 0 }, 0 }, --Thñy tinh
	{ { 0, 4, { 238, 240 }, 0, 0, 5, 0, 0 }, 0 }, --Thñy tinh
	{ { 0, 4, { 238, 240 }, 0, 0, 5, 0, 0 }, 0 }, --Thñy tinh
	{ { 0, 4, 353, 0, 0, 5, 0, 0 }, 0 }, --Tinh Hång B¶o Th¹ch
	{ { 0, 4, 353, 0, 0, 5, 0, 0 }, 0 }, --Tinh Hång B¶o Th¹ch
	{ { 0, 6, 1, 12, 0, 5, 0, 0 }, 0 }, --Bµn Nh­îc T©m Kinh
	{ { 0, 6, 1, 12, 0, 5, 0, 0 }, 0 }, --Bµn Nh­îc T©m Kinh
	{ { 0, 6, 1, 23, 0, 5, 0, 0 }, 0 }, --ThiÕt La H¸n
	{ { 0, 6, 1, 23, 0, 5, 0, 0 }, 0 }, --ThiÕt La H¸n
	{ { 0, 6, 1, 124, 0, 5, 0, 0 }, 0 }, --Phóc Duyªn Lé (§¹i)
	{ { 0, 6, 1, 124, 0, 5, 0, 0 }, 0 }, --Phóc Duyªn Lé (§¹i)
	{ { 0, 6, 1, 124, 0, 5, 0, 0 }, 0 }, --Phóc Duyªn Lé (§¹i)
	{ { 0, 6, 1, 124, 0, 5, 0, 0 }, 0 }, --Phóc Duyªn Lé (§¹i)
	{ { 0, 6, 1, 439, 0, 5, 0, 0 }, 7 }, --T©m T©m T­¬ng ¸nh phï (v« h¹n)
	{ { 0, 6, 1, 26, 0, 5, 0, 0 }, 0 }, --Vâ L©m MËt TÞch
	{ { 0, 6, 1, 22, 0, 5, 0, 0 }, 0 }, --TÈy Tñy Kinh
};

tbGBrandItem_Super = {                                          --list rít ngÉu nhiªn
	{ 2000, { nil, nil },                       nil, 0 },       --§å xanh
	{ 360,  { { 0, 6, 1, 15, 0, 5, 0, 0 }, 0 }, 1,   0 },       --Phi Phong
	{ 100,  { { 0, 6, 1, 26, 0, 5, 0, 0 }, 0 }, 1,   0 },       --Vâ L©m MËt TÞch
	{ 100,  { { 0, 6, 1, 22, 0, 5, 0, 0 }, 0 }, 1,   0 },       --TÈy Tñy Kinh
	{ 1200, { { 0, 6, 1, 124, 0, 5, 0, 0 }, 0 }, 3,  0 },       --Phóc Duyªn Lé (§¹i)
	{ 360,  { { 0, 6, 1, 71, 0, 5, 0, 0 }, 0 }, 1,   0 },       --Tiªn Th¶o Lé
	{ 360,  { { 0, 6, 1, 72, 0, 5, 0, 0 }, 0 }, 1,   0 },       --Thiªn s¬n B¶o Lé
	{ 360,  { { 0, 6, 1, 73, 0, 5, 0, 0 }, 0 }, 2,   0 },       --B¸ch Qu¶ Lé
	{ 1200, { { 0, 6, 1, 18, 0, 5, 0, 0 }, 0 }, 2,   0 },       --T©m T©m T­¬ng ¸nh phï
	{ 600,  { { 0, 6, 2, 1182, 0, 5, 0, 0 }, 0 }, 1, 0 },       --B¹ch C©u Hoµn x3 kü n¨ng
	{ 240,  { { 0, 4, 353, 0, 0, 5, 0, 0 }, 0 }, 1,  0 },       --Tinh Hång B¶o Th¹ch
	{ 240,  { { 0, 4, 240, 0, 0, 5, 0, 0 }, 0 }, 1,  0 },       --Thñy tinh
	{ 240,  { { 0, 4, 238, 0, 0, 5, 0, 0 }, 0 }, 1,  0 },       --Thñy tinh
	{ 240,  { { 0, 4, 239, 0, 0, 5, 0, 0 }, 0 }, 1,  0 },       --Thñy tinh
	{ 600,  { { 0, 6, 1, 23, 0, 5, 0, 0 }, 0 }, 1,   0 },       --ThiÕt La H¸n
	{ 600,  { { 0, 6, 1, 12, 0, 5, 0, 0 }, 0 }, 1,   0 },       --Bµn Nh­îc T©m Kinh
	{ 950,  { { 0, 6, 0, 3, 0, 5, 0, 0 }, 0 },  3,   0 },       --§¹i Lùc hoµn
	{ 360,  { { 0, 6, 1, 125, 0, 5, 0, 0 }, 0 }, 1,  0 },       --QuÕ Hoa Töu
	--{12,{{2,0,163,0,0,0,30,0},0},1,0,ENABLE_GOLDDROP.anbang_chuyen},--An Bang chuyÒn
	{ 720,  { { 0, 6, 1, { 117, 121 }, 0, 5, 0, 0 }, 0 }, 2, 0 }, --thuèc néi c«ng
	--{24,{{2,0,{164,166},0,0,0,30,0},0},1,0,ENABLE_GOLDDROP.anbang_nhanboi},--An Bang
	{ 780,  { { 0, 6, 0, { 1, 10 }, 0, 5, 0, 0 }, 0 }, 2, 0 },  --thuèc ngo¹i c«ng
	--{48,{{2,0,{158,159},0,0,0,30,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_aonon},--§Þnh Quèc ¸o nãn
	{ 400,  { { 0, 6, 1, 2620, 0, 5, 0, 0 }, 0 }, 2, 0 },       --X¸ Lîi Kim §¬n
	--{60,{{2,0,{160,162},0,0,0,30,0},0},1,0,ENABLE_GOLDDROP.dinhquoc_taydaigiay},--§Þnh Quèc
	{ 720,  { { 0, 6, 1, 13, 0, 5, 0, 0 }, 0 }, 1,   0 },       --§¹i Hång Bao
	{ 180,  { { 0, 6, 1, { 27, 28 }, 0, 5, 0, 0 }, 0 }, 1, 0 }, --bÝ kÝp
	{ 200,  { { 0, 6, 1, { 33, 43 }, 0, 5, 0, 0 }, 0 }, 1, 0 }, --bÝ kÝp
	{ 200,  { { 0, 6, 1, { 45, 59 }, 0, 5, 0, 0 }, 0 }, 1, 0 }, --bÝ kÝp
	--{18,{{2,0,203,0,0,0,30,0},0},1,0,ENABLE_GOLDDROP.honganh_chuyen},--Hång ¶nh chuyÒn
	{ 950,  { { 0, 6, 0, 6, 0, 5, 0, 0 }, 0 },  3,   0 },       --Phi Tèc hoµn
	--{30,{{2,0,{204,206},0,0,0,30,0},0},1,0,ENABLE_GOLDDROP.honganh_nhanboi},--Hång ¶nh
	{ 720,  { { 0, 6, 2, 124, 0, 5, 0, 0 }, 0 }, 1,  0 },       --danh väng lé §¹i
	{ 54,   { { 2, 0, 185, 0, 0, 0, 30, 0 }, 0 }, 1, 0, ENABLE_GOLDDROP.hiepcot_ao }, --HiÖp Cèt ¸o
	{ 288,  { { 2, 0, { 186, 187 }, 0, 0, 0, 30, 0 }, 0 }, 1, 0 }, --HiÖp Cèt
	{ 288,  { { 2, 0, { 190, 191 }, 0, 0, 0, 30, 0 }, 0 }, 1, 0 }, --Nhu T×nh
	{ 45,   { { 2, 0, 188, 0, 0, 0, 30, 0 }, 0 }, 1, 0, ENABLE_GOLDDROP.hiepcot_boi }, --HiÖp Cèt béi
	{ 45,   { { 2, 0, 192, 0, 0, 0, 30, 0 }, 0 }, 1, 0, ENABLE_GOLDDROP.nhutinh_boi }, --Nhu T×nh béi
	{ 12,   { { 2, 0, 189, 0, 0, 0, 30, 0 }, 0 }, 1, 0, ENABLE_GOLDDROP.nhutinh_ao }, --Nhu T×nh ¸o
	{ 160,  { { 0, 6, 1, 2739, 0, 5, 0, 0 }, 0 }, 3, 0 },       --cµn kh«n phÝch lÞch ®¬n
};

tbGBAryPriDropIdSmall = {
	[1] = {
		[1] = { 1, 2, 14, 15 }, --id m¶ng tbGBPriITEM
	},              --"LiÔu Thanh Thanh"
	[2] = {
		[1] = { 12, 13, 28 },
	}, --"DiÖu Nh­"
	[3] = {
		[1] = { 3, 4 },
	}, --"Tr­¬ng T«ng ChÝnh"
	[4] = {
		[1] = { 16, 17, 18 },
	}, --"T©y V­¬ng Tµ §éc"
	[5] = {
		[1] = { 10, 11 },
	}, --"Do·n Thanh V©n"
	[6] = {
		[1] = { 23, 24 },
	}, --"H¾c Y S¸t Thñ"
	[7] = {
		[1] = { 7, 8, 9 },
	}, --"Ng¹o Thiªn T­íng Qu©n"
	[8] = {
		[1] = { 5, 6, 22 },
	}, --"ThËp Ph­¬ng C©u DiÖt"
	[9] = {
		[1] = { 19, 20, 21 },
	}, --"Thanh Y Tö"
	[10] = {
		[1] = { 25, 26, 27 },
	}, --"TÞnh Th«ng"
};

tbGBAryPriDropIdBig = {
	[1] = {
		[1] = { 7, 8, 9 },
	}, --V­¬ng T¸
	[2] = {
		[1] = { 25, 26, 27 },
	}, --HuyÒn Gi¸c §¹i S­
	[3] = {
		[1] = { 1, 2, 14, 15 },
	}, --§­êng BÊt NhiÔm
	[4] = {
		[1] = { 16, 17, 18 },
	}, --B¹ch Doanh Doanh
	[5] = {
		[1] = { 12, 13, 28 },
	}, --Thanh TuyÖt S­ Th¸i
	[6] = {
		[1] = { 10, 11 },
	}, --Yªn HiÓu Tr¸i
	[7] = {
		[1] = { 23, 24 },
	}, --Hµ Nh©n Ng·
	[8] = {
		[1] = { 3, 4 },
	}, --§¬n T­ Nam
	[9] = {
		[1] = { 19, 20, 21 },
	}, --TuyÒn C¬ Tö
	[10] = {
		[1] = { 5, 6, 22 },
	}, --§oan Méc DuÖ
	[11] = {
		[1] = { 16, 17, 18 },
	}, --Lam Y Y
	[12] = {
		[1] = { 10, 11 },
	}, --Chung Linh Tó
	[13] = {
		[1] = { 23, 24 },
	}, --M¹nh Th­¬ng L­¬ng
	[14] = {
		[1] = { 25, 26, 27 },
	}, --HuyÒn Nan §¹i S­
	[15] = {
		[1] = { 19, 20, 21 },
	}, --Thanh Liªn Tö
	[16] = {
		[1] = { 1, 2, 14, 15 },
	}, --§­êng Phi YÕn
	[17] = {
		[1] = { 3, 4 },
	}, --Tõ §¹i Nh¹c
	[18] = {
		[1] = { 7, 8, 9 },
	}, --Cæ B¸ch
	[19] = {
		[1] = { 3, 4 },
	}, --§¹o Thanh Ch©n Nh©n
	[20] = {
		[1] = { 5, 6, 22 },
	}, --Gia LuËt TÞ Ly
	[21] = {
		[1] = { 5, 6, 22 },
	}, --Hoµn Nhan TuyÕt Y
	[22] = {
		[1] = { 12, 13, 28 },
	}, --Hµ Linh Phiªu
	[23] = {
		[1] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28 },
	}, --Hµn M«ng
};

tbGBPriITEM = {
	[1] = { { 0, 6, 1, 27, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[2] = { { 0, 6, 1, 28, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[3] = { { 0, 6, 1, 33, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[4] = { { 0, 6, 1, 34, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	--[5]=		{{0, 6, 1, 35, 0, 5, 0, 0},0},--bÝ kÝp
	[5] = { { 0, 6, 1, 59, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[6] = { { 0, 6, 1, 36, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[7] = { { 0, 6, 1, 37, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[8] = { { 0, 6, 1, 38, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[9] = { { 0, 6, 1, 39, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[10] = { { 0, 6, 1, 40, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[11] = { { 0, 6, 1, 41, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[12] = { { 0, 6, 1, 42, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[13] = { { 0, 6, 1, 43, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[14] = { { 0, 6, 1, 45, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[15] = { { 0, 6, 1, 46, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[16] = { { 0, 6, 1, 47, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[17] = { { 0, 6, 1, 48, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[18] = { { 0, 6, 1, 49, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[19] = { { 0, 6, 1, 50, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[20] = { { 0, 6, 1, 51, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[21] = { { 0, 6, 1, 52, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[22] = { { 0, 6, 1, 53, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[23] = { { 0, 6, 1, 54, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[24] = { { 0, 6, 1, 55, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[25] = { { 0, 6, 1, 56, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[26] = { { 0, 6, 1, 57, 0, 5, 0, 0 }, 0 }, --bÝ kÝp
	[27] = { { 0, 6, 1, 58, 0, 5, 0, 0 }, 0 }, --bÝ kÝp

};

function g_GoldBossDrop(nNpcIdx, nType, bPriCall, nTypeBoss)
	local tbsureItem, tbrandItem, tbPriDrop, nAddLucky, tbRandVip;
	if (nType == 1 or nType == 5) then --tiÓu HK
		if nTypeBoss and nTypeBoss > 0 then --- lb boss tõ item gäi ra
			tbsureItem = tbGBsureItem_Small; --rít ®å ch¾c ch¾n
			tbrandItem = tbGBrandItem_Small;
			tbPriDrop  = tbGBAryPriDropIdSmall;
			tbRandVip  = tbGBrandItemSvip_Small_2
		else                        --- mÆc ®Þnh
			tbsureItem = tbGBsureItem_Small; --rít ®å ch¾c ch¾n
			tbrandItem = tbGBrandItem_Small;
			tbPriDrop  = tbGBAryPriDropIdSmall;
			tbRandVip  = tbGBrandItemSvip_Small
		end

		-- Event Vu Lan
		-- Duc_GiveThiep(100, 100);
		-- event Trung thu
		-- DucTT_GiveLongDen(100, 100);
		QK_GiveVongHoaCaNhan(100);

		nAddLucky = 60;
		--if(bPriCall == 0) then	--rít thÝ gi¶ chi Ên
		--	local moreidx = AddItemTemp(0,6,2,1094,0,5,0)
		--	SetItemDate(moreidx,10,0)
		--	DropItemIdx(nNpcIdx,moreidx)
		--	moreidx = AddItemTemp(0,6,1,2818,0,5,5)
		--	DropItemIdx(nNpcIdx,moreidx)
		--end
		--if(random(100) < 30) then
		--	local moreidx = gGenMagicMaskStone(random(6));
		--	DropItemIdx(nNpcIdx,moreidx)
		--end
	elseif (nType == 2 or nType == 6) then --®¹i HK
		tbsureItem = tbGBsureItem_Big; --rít ®å ch¾c ch¾n
		tbrandItem = tbGBrandItem_Big;
		tbPriDrop = tbGBAryPriDropIdBig;

		-- Event Vu Lan
		-- Duc_GiveThiep(200, 200);
		-- event Trung thu
		-- DucTT_GiveLongDen(200, 200);
		QK_GiveVongHoaCaNhan(200);

		nAddLucky = 75;
		-- if(bPriCall == 0) then	--rít thÝ gi¶ chi Ên
		-- local moreidx = AddItemTemp(0,6,2,1094,0,5,2)
		-- SetItemDate(moreidx,10,0)
		-- DropItemIdx(nNpcIdx,moreidx)
		-- moreidx = AddItemTemp(0,6,1,2818,0,5,10)	--kiÕm hiÖp lÖnh
		-- DropItemIdx(nNpcIdx,moreidx)
		-- moreidx = gGenMagicMaskStone();
		-- DropItemIdx(nNpcIdx,moreidx)
		-- if(random(100) < 13) then
		-- moreidx = AddItemTemp(0,6,random(9),3390,0,5,0)	--®å phæ hm
		-- DropItemIdx(nNpcIdx,moreidx)
		-- end
		-- else
		-- local moreidx = 0;
		-- local morerand = random(100);
		-- if(morerand < 50) then
		-- moreidx = gGenMagicMaskStone();
		-- DropItemIdx(nNpcIdx,moreidx)
		-- elseif(morerand == 99) then
		-- moreidx = AddItemTemp(0,6,random(9),3390,0,5,0)	--®å phæ hm
		-- DropItemIdx(nNpcIdx,moreidx)
		-- end
		-- end
	else                           --siªu HK
		tbsureItem = tbGBsureItem_Super; --rít ®å ch¾c ch¾n
		tbrandItem = tbGBrandItem_Super;
		tbPriDrop = tbGBAryPriDropIdBig;
		nAddLucky = 100;
		local moreidx = gGenMagicMaskStone(random(7, 10));
		DropItemIdx(nNpcIdx, moreidx)
		moreidx = gGenMagicMaskStone(random(7, 10));
		DropItemIdx(nNpcIdx, moreidx)
		if (bPriCall == 0) then --rít thÝ gi¶ chi Ên
			moreidx = AddItemTemp(0, 6, 2, 1094, 0, 5, 3)
			SetItemDate(moreidx, 10, 0)
			DropItemIdx(nNpcIdx, moreidx)
			moreidx = AddItemTemp(0, 6, 1, 2818, 0, 5, 20) --kiÕm hiÖp lÖnh
			DropItemIdx(nNpcIdx, moreidx)
		end
		moreidx = AddItemTemp(0, 6, random(9), 3390, 0, 5, 0) --®å phæ hm
		DropItemIdx(nNpcIdx, moreidx)
	end
	local idx = 0;
	for i = 1, getn(tbsureItem) do
		local detail, particular = 0, 0;
		if (type(tbsureItem[i][1][3]) == "number") then
			detail = tbsureItem[i][1][3];
		else
			detail = random(tbsureItem[i][1][3][1], tbsureItem[i][1][3][2]);
		end
		if (type(tbsureItem[i][1][4]) == "number") then
			particular = tbsureItem[i][1][4];
		else
			particular = random(tbsureItem[i][1][4][1], tbsureItem[i][1][4][2]);
		end

		idx = AddItemTemp(tbsureItem[i][1][1],
			tbsureItem[i][1][2],
			detail,
			particular,
			tbsureItem[i][1][5],
			tbsureItem[i][1][6],
			tbsureItem[i][1][7],
			tbsureItem[i][1][8]);
		if (tbsureItem[i][2] > 0) then --cã H¹n sö dông
			SetItemDate(idx, tbsureItem[i][2], 0)
		end
		DropItemIdx(nNpcIdx, idx)
	end
	--rít ®å ngÉu nhiªn-------------------------
	for i = 1, getn(tbrandItem) do --reset item ®· rít råi hay ch­a
		tbrandItem[i][4] = 0;
	end
	local series = GetNpcSeries(nNpcIdx);
	local nLucky = GetLucky();
	local nDropNum = 14;
	--if(GetTeamSize() > 2) then
	--	nDropNum = nDropNum + 2;
	--end
	local randnumber = 25000 - nLucky * 4;
	if (nType == 3) then --siªu boss
		randnumber = 20000 - nLucky * 4;
	end
	nLucky = nLucky + nAddLucky;
	for i = 1, nDropNum do
		local nRand = random(randnumber)
		local index = g_GetOdds_Award(tbrandItem, nRand);
		if (index == 0) then --ko lÊy ®c item ®Æc biÖt => chuyÓn ®å xanh
			index = 1;
		end
		if (tbrandItem[index][4] ~= 0) then --item ®Æc biÖt ®· rít råi, ko rít n÷a
			index = 1;
		end
		if ((bPriCall > 0) and (nType <= 2) and (index == 19 or index == 28)) then --boss gäi ra ko rít ChuyÒn AB vµ HA
			index = 1;
		end
		local arrItem = tbrandItem[index][2];
		if (arrItem == nil and nType < 5) then -- rít riªng theo id
			tbrandItem[index][4] = 1;   --®¸nh dÊu item ®· rít råi
			local nAryIdx = GetNpcTask(nNpcIdx, 1);
			local nKind = tbrandItem[index][3];
			if ((not tbPriDrop[nAryIdx]) or (not tbPriDrop[nAryIdx][nKind])) then
				return
			end
			local randidx = g_RandArray(tbPriDrop[nAryIdx][nKind]);
			if not tbGBPriITEM[randidx] then
				return
			end
			idx = AddItemTemp(tbGBPriITEM[randidx][1][1],
				tbGBPriITEM[randidx][1][2],
				tbGBPriITEM[randidx][1][3],
				tbGBPriITEM[randidx][1][4],
				tbGBPriITEM[randidx][1][5],
				tbGBPriITEM[randidx][1][6],
				tbGBPriITEM[randidx][1][7],
				tbGBPriITEM[randidx][1][8]);
			if (tbGBPriITEM[randidx][2] > 0) then --h¹n sö dông
				SetItemDate(idx, tbGBPriITEM[randidx][2], 0)
			end
			DropItemIdx(nNpcIdx, idx)
		elseif (arrItem[1] == nil) then --®å xanh
			if nType == 2 then   --- boss dai he thong  thi level = 10(Param3 = 12)
				generate_blueitem(nNpcIdx, random(7, 10), 12, series, nLucky, 1, 1, 1, 1, 1, 1, 1)
			else
				generate_blueitem(nNpcIdx, random(7, 10), 9, series, nLucky, 1, 1, 1, 1, 1, 1, 1)
			end
		else
			tbrandItem[index][4] = 1;                                 --®¸nh dÊu item ®· rít råi
			if ((not tbrandItem[index][5]) or (tbrandItem[index][5] == 1)) then --®å ®Æc biÖt enable = 1 míi rít
				local detail, particular = 0, 0;
				for j = 1, tbrandItem[index][3] do                    --add sè l­îng
					if (type(arrItem[1][3]) == "number") then
						detail = arrItem[1][3];
					else
						detail = random(arrItem[1][3][1], arrItem[1][3][2]);
					end
					if (type(arrItem[1][4]) == "number") then
						particular = arrItem[1][4];
					else
						particular = random(arrItem[1][4][1], arrItem[1][4][2]);
					end
					idx = AddItemTemp(arrItem[1][1],
						arrItem[1][2],
						detail,
						particular,
						arrItem[1][5],
						arrItem[1][6],
						arrItem[1][7],
						arrItem[1][8]);
					if (arrItem[2] > 0) then --cã H¹n sö dông
						SetItemDate(idx, arrItem[2], 0)
					end
					DropItemIdx(nNpcIdx, idx)
				end
			end
		end
	end
	---------------------------------------
	--Rand VIP

	local nHorseRand = random(1, 20)
	if (nHorseRand == 1) then
		if (random(1, 2) == 1) then
			idx = AddItemTemp(0, 0, 10, 5, 3, 0, 0, 0) -- tuyet anh
			SetItemDate(idx, 15, 0)
			DropItemIdx(nNpcIdx, idx)
		else
			idx = AddItemTemp(0, 0, 10, 5, 4, 0, 0, 0) -- dich lo
			SetItemDate(idx, 15, 0)
			DropItemIdx(nNpcIdx, idx)
		end
	end

	-- if(nType < 5) then --
	if (nType == 1) then --- boss tieu
		local nPBossNum = GetIniInt(DefBos_Link, "Random", "BossNum");
		local nBossNext = GetIniInt(DefBos_Link, "Random", "DropNext");
		--nPBossNum = nPBossNum + 1
		if (nPBossNum == nBossNext) then --drop item vip
			local randidx = random(1, 2);
			idx = AddItemTemp(tbGBrandItemSvip_Small[randidx][1],
				tbGBrandItemSvip_Small[randidx][2],
				tbGBrandItemSvip_Small[randidx][3],
				tbGBrandItemSvip_Small[randidx][4],
				tbGBrandItemSvip_Small[randidx][5],
				tbGBrandItemSvip_Small[randidx][6],
				tbGBrandItemSvip_Small[randidx][7],
				tbGBrandItemSvip_Small[randidx][8]);
			DropItemIdx(nNpcIdx, idx)

			SetIniInt(DefBos_Link, "Random", "DropNext", nBossNext + (8 + random(2, 4)), 1)
		end
		SetIniInt(DefBos_Link, "Random", "BossNum", nPBossNum + 1, 1)
	end

	if (nType == 2) then --- boss dai
		local nPBossNum = GetIniInt(DefBos_bigLink, "Random", "BossNum");
		local nBossNext = GetIniInt(DefBos_bigLink, "Random", "DropNext");
		local nBossNext2 = GetIniInt(DefBos_bigLink, "Random", "DropNext2");
		--nPBossNum = nPBossNum + 1

		--- co the 1 luc roi 2 vat pham
		if (nPBossNum == nBossNext) then --drop item vip
			local randidx = random(1, getn(tbGBrandItemSvip_Big));
			idx = AddItemTemp(tbGBrandItemSvip_Big[randidx][1],
				tbGBrandItemSvip_Big[randidx][2],
				tbGBrandItemSvip_Big[randidx][3],
				tbGBrandItemSvip_Big[randidx][4],
				tbGBrandItemSvip_Big[randidx][5],
				tbGBrandItemSvip_Big[randidx][6],
				tbGBrandItemSvip_Big[randidx][7],
				tbGBrandItemSvip_Big[randidx][8]);
			DropItemIdx(nNpcIdx, idx)

			SetIniInt(DefBos_bigLink, "Random", "DropNext", nBossNext + (8 + random(2, 4)), 1) -- 10 den 12 roi 1 cuon
		end
		if (nPBossNum == nBossNext2) then                                       --drop item vip
			local randidx = random(1, getn(tbGBrandItemSvip_Big2));
			idx = AddItemTemp(tbGBrandItemSvip_Big2[randidx][1],
				tbGBrandItemSvip_Big2[randidx][2],
				tbGBrandItemSvip_Big2[randidx][3],
				tbGBrandItemSvip_Big2[randidx][4],
				tbGBrandItemSvip_Big2[randidx][5],
				tbGBrandItemSvip_Big2[randidx][6],
				tbGBrandItemSvip_Big2[randidx][7],
				tbGBrandItemSvip_Big2[randidx][8]);
			DropItemIdx(nNpcIdx, idx)
			SetIniInt(DefBos_bigLink, "Random", "DropNext2", nBossNext2 + (4 + random(2, 4)), 1) -- 6 den 8 roi 1 cuon
		end


		SetIniInt(DefBos_bigLink, "Random", "BossNum", nPBossNum + 1, 1)
	end

	if (ENABLE_TESTGAME > 0) then --®ang test
		local randlv = 2;
		if (nType == 1) then  --tiÓu HK
			if (g_RandPercent(60) == 0) then
				return
			end
			randlv = 1;
		end

		local nDetailType = g_RandArray({ 0, 1, 3 }); --vò khÝ 0,1 + nhÉn 3
		if (nDetailType == 3) then          --nhÉn
			randlv = 1;
		end
		local nParticular = random(0, DROP_ItemDetail[nDetailType + 1]);
		idx = AddItemTemp(0, 0, nDetailType, nParticular, 10, series, nLucky, 10);
		local nVisibleRow = 0;
		for i = 0, 2 do
			local row = i * 2 + 1;
			local nMagic, value0, value2 = GetItemMagic(idx, row);
			if (nMagic <= 0) then
				break
			end
			nVisibleRow = nVisibleRow + 1;
		end
		if (nVisibleRow == 0) then
			DropItemIdx(nNpcIdx, idx)
			return
		end
		nVisibleRow = random(nVisibleRow) * 2 - 1;
		if (randlv == 2 and g_RandPercent(25) == 0) then
			randlv = 1;
		end
		SetItemMagic(idx, nVisibleRow, 139, randlv, 0)
		SetItemValue(idx, 3, 1)
		DropItemIdx(nNpcIdx, idx)

		if (nType == 3) then --siªu boss
			idx = AddItemTemp(2, 0, random(140, 141), 0, 0, 0, 50)
			SetItemValue(idx, 3, 1)
			DropItemIdx(nNpcIdx, idx)
		end
		return
	end
	--®· open : cÊp ph¸t th­ëng tïy chän
	if (nType == 3) then --siªu boss
		local curid = SQLCommandV("SELECT Value1 FROM Event WHERE (Name = 'SBOSS')");
		SQLCommand("UPDATE Event SET Value1 = 0 WHERE (Name = 'SBOSS')");
		if (curid <= 0) then --rít ngÉu nhiªn
			local nTotalRate = 0;
			for i = 1, getn(tbSureSuperDrop) do
				nTotalRate = nTotalRate + tbSureSuperDrop[i][3];
			end
			local nSRand = random(nTotalRate);
			curid = 1;
			nTotalRate = 0;
			for i = 1, getn(tbSureSuperDrop) do
				nTotalRate = nTotalRate + tbSureSuperDrop[i][3];
				if (nSRand <= nTotalRate) then
					curid = i
					break
				end
			end
		end
		if (not tbSureSuperDrop[curid]) then
			curid = 1
		end
		if (tbSureSuperDrop[curid][2] == nil) then --®å phæ
			local nDpIdx = SQLCommandV("SELECT Value2 FROM Event WHERE (Name = 'SBOSS')");
			local nAryDp = 0;
			if (nDpIdx > 0) then
				SQLCommand("UPDATE Event SET Value2 = 0 WHERE (Name = 'SBOSS')");
				for i = 1, getn(tbAtlasCloneId) do
					if (tbAtlasCloneId[i][1] == nDpIdx) then
						nAryDp = i
						break
					end
				end
			end
			if (nAryDp == 0) then --ngÉu nhiªn ®å phæ
				local tbSelTab = {};
				for i = 1, getn(tbAtlasCloneId) do
					if (SQLCommandV("SELECT Value1 FROM Event WHERE (Name = 'DP" .. tbAtlasCloneId[i][1] .. "')") < (tbAtlasCloneId[i][3] - 1)) then
						tinsert(tbSelTab, tbAtlasCloneId[i][1])
					end
				end
				if (getn(tbSelTab) > 0) then
					nDpIdx = tbSelTab[random(getn(tbSelTab))];
					SQLCommand("UPDATE Event SET Value1 = Value1+1 WHERE (Name = 'DP" .. nDpIdx .. "')");
				else
					nAryDp = random(getn(tbAtlasCloneId));
					nDpIdx = tbAtlasCloneId[nAryDp][1];
					if (SQLCommandV("SELECT Value1 FROM Event WHERE (Name = 'DP" .. nDpIdx .. "')") >= tbAtlasCloneId[nAryDp][3]) then
						SQLCommand("UPDATE Event SET Value1 = 1,Value2 = Value2+1 WHERE (Name = 'DP" .. nDpIdx .. "')");
					else
						SQLCommand("UPDATE Event SET Value1 = Value1+1 WHERE (Name = 'DP" .. nDpIdx .. "')");
					end
				end
			else --chØ ®Þnh ®å phæ
				if (SQLCommandV("SELECT Value1 FROM Event WHERE (Name = 'DP" .. nDpIdx .. "')") >= tbAtlasCloneId[nAryDp][3]) then
					SQLCommand("UPDATE Event SET Value1 = 1,Value2 = Value2+1 WHERE (Name = 'DP" .. nDpIdx .. "')");
				else
					SQLCommand("UPDATE Event SET Value1 = Value1+1 WHERE (Name = 'DP" .. nDpIdx .. "')");
				end
			end
			idx = DropItem(nNpcIdx, 0, 6, 1, nDpIdx, 0, 5, 0, 0)
		elseif (tbSureSuperDrop[curid][1] == 0) then --vËt phÈm nµo ®ã
			idx = DropItem(nNpcIdx, tbSureSuperDrop[curid][1],
				tbSureSuperDrop[curid][2],
				tbSureSuperDrop[curid][3],
				tbSureSuperDrop[curid][4],
				tbSureSuperDrop[curid][5],
				tbSureSuperDrop[curid][6],
				tbSureSuperDrop[curid][7],
				tbSureSuperDrop[curid][8])
		else --if(tbSureSuperDrop[curid][1] == 2) then	--hk
			idx = AddItemTemp(2, 0, tbSureSuperDrop[curid][2], 0, 0, 0, 30)
			SetItemValue(idx, 3, 4)
			DropItemIdx(nNpcIdx, idx)
		end
		WriteLog("drop_sboss_" .. GetServerIdx() .. ".txt", format("item<%s>", GetItemName(idx)))
	end
end;

tbSureSuperDrop =
{
	[1] = { 0, nil, 4000 }, --®å phæ hk
	[2] = { 2, 163, 100 }, --ab chuyÒn
	[3] = { 2, 164, 1000 }, --ab
	[4] = { 2, 165, 1000 }, --ab
	[5] = { 2, 166, 1000 }, --ab
	[6] = { 2, 402, 1500 }, --cp-dq ¸o
	[7] = { 2, 403, 1000 }, --cp-dq nãn
	[8] = { 2, 404, 1500 }, --cp-dq
	[9] = { 2, 405, 1500 }, --cp-dq
	[10] = { 2, 406, 1500 }, --cp-dq
	[11] = { 2, 407, 50 }, --cp-ab chuyÒn
	[12] = { 2, 408, 500 }, --cp-ab cóc hoa
	[13] = { 2, 409, 500 }, --cp-ab béi
	[14] = { 2, 410, 500 }, --cp-ab kª huyÕt
	[15] = { 2, 209, 25 }, --hmab chuyÒn
	[16] = { 2, 210, 250 }, --hmab cóc hoa
	[17] = { 2, 211, 250 }, --hmab béi
	[18] = { 2, 212, 250 }, --hmab kª huyÕt
	[19] = { 2, 203, 100 }, --ha chuyÒn th­êng
	[20] = { 2, 204, 1000 }, --ha th­êng
	[21] = { 2, 205, 1000 }, --ha th­êng
	[22] = { 2, 206, 1000 }, --ha th­êng
	[23] = { 2, 433, 50 }, --hm-ha chuyÒn
	[24] = { 2, 434, 500 }, --hm-ha
	[25] = { 2, 435, 500 }, --hm-ha
	[26] = { 2, 436, 500 }, --hm-ha
	[27] = { 2, 199, 4 }, --kimquang béi
	[28] = { 2, 200, 4 }, --kimquang giµy
	[29] = { 2, 193, 4 }, --kimquang nãn
	[30] = { 2, 194, 4 }, --kimquang ¸o
	[31] = { 2, 197, 4 }, --kimquang ®ai
	[32] = { 2, 198, 4 }, --kimquang tay
	[33] = { 2, 195, 2 }, --kimquang chuyÒn
	[34] = { 2, 196, 1 }, --kimquang nhÉn1
	[35] = { 2, 201, 1 }, --kimquang nhÉn2
	[36] = { 2, 202, 0 }, --kimquang kÝch
};

--ExeGlobal(GBID_ReloadScriptAllSV, 0, 0,"\\script\\missions\\goldboss\\small.lua")
-- 1  "LiÔu Thanh Thanh"
-- 2  "DiÖu Nh­"
-- 3  "Tr­¬ng T«ng ChÝnh"
-- 4  "T©y V­¬ng Tµ §éc"
-- 5  "Do·n Thanh V©n"
-- 6  "H¾c Y S¸t Thñ"
-- 7  "Ng¹o Thiªn T­íng Qu©n"
-- 8  "ThËp Ph­¬ng C©u DiÖt"
-- 9  "Thanh Y Tö"
-- 10 "TÞnh Th«ng"
---------------------------
------id cua boss dai------------- [x];
--ExeGlobal(GBID_ReloadScriptAllSV, 0, 0,"\\script\\missions\\goldboss\\big.lua")
--[1]	= {n_series = 0, 	n_npcid = 739,
--	sz_name = "V­¬ng T¸"},
--[2]	= {n_series = 0, 	n_npcid = 740,
--	sz_name = "HuyÒn Gi¸c §¹i S­"},
--[3]	= {n_series = 1, 	n_npcid = 741,
--	sz_name = "§­êng BÊt NhiÔm"},
--[4]	= {n_series = 1, 	n_npcid = 742,
--	sz_name = "B¹ch Doanh Doanh"},
--[5]	= {n_series = 2, 	n_npcid = 743,
--	sz_name = "Thanh TuyÖt S­ Th¸i"},
--[6]	= {n_series = 2, 	n_npcid = 744,
--	sz_name = "Yªn HiÓu Tr¸i"},
--[7]	= {n_series = 3, 	n_npcid = 745,
--	sz_name = "Hµ Nh©n Ng·"},
--[8]	= {n_series = 4, 	n_npcid = 746,
--	sz_name = "§¬n T­ Nam"},
--[9]	= {n_series = 4, 	n_npcid = 747,
--	sz_name = "TuyÒn C¬ Tö"},
--[10]	= {n_series = 3, 	n_npcid = 565,
--	sz_name = "§oan Méc DuÖ"},
--[11]	= {n_series = 1, 	n_npcid = 582,
--	sz_name = "Lam Y Y"},
--[12]	= {n_series = 2, 	n_npcid = 567,
--	sz_name = "Chung Linh Tó"},
--[13]	= {n_series = 3, 	n_npcid = 583,
--	sz_name = "M¹nh Th­¬ng L­¬ng"},
--[14]	= {n_series = 0, 	n_npcid = 1365,
--	sz_name = "HuyÒn Nan §¹i S­"},
--[15]	= {n_series = 4, 	n_npcid = 1368,
--	sz_name = "Thanh Liªn Tö"},
--[16]	= {n_series = 1, 	n_npcid = 1366,
--	sz_name = "§­êng Phi YÕn"},
--[17]	= {n_series = 4, 	n_npcid = 1367,
--	sz_name = "Tõ §¹i Nh¹c"},
--[18]	= {n_series = 0, 	n_npcid = 566,
--	n_mapary = {15,17,19,70,3,5,20,22,29,41,42,55,56},--réng
--	sz_name = "Cæ B¸ch"},
--[19]	= {n_series = 4, 	n_npcid = 562,
--	sz_name = "§¹o Thanh Ch©n Nh©n"},
--[20]	= {n_series = 3, 	n_npcid = 563,
--	sz_name = "Gia LuËt TÞ Ly"},
--[21]	= {n_series = 3, 	n_npcid = 564,
--	sz_name = "Hoµn Nhan TuyÕt Y"},
--[22]	= {n_series = 2, 	n_npcid = 568,
--	sz_name = "Hµ Linh Phiªu"},
