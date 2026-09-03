--
--®ãng më nh÷ng tÝnh n¨ng
REQ_CLIENT_VERSION		= 103		--yªu cÇu phiªn b¶n míi nhÊt
DISABLEPROG_RACE		= 0		--khãa khi ®ua top = 1; më ra hÕt = 0	(nh÷ng thø liªn quan kinh nghiÖm)

ENABLE_GOLD_TASK		= 0 --®ãng nhiem vu hoµng kim
PREPARE_TORACE			= 0		--giai ®o¹n chuÈn bÞ ®ua top = 1; chØ t¸c dông khi më sv; sau khi b¾t ®Çu ®ua top th× set l¹i = 0

ENABLE_TESTGAME			= 0			--®ang test = 1; chÝnh thøc open = 0
EN_SUPPORT_NEWBIE		= 0		--hç trî level hoÆc c¸i g× ®ã cho ng­êi míi t¹o khi vµo game = 1 (®· open)

EN_SUPPORT_LEVEL		= 0		--hç trî d­íi level nµy møc kn tÝnh n¨ng x EN_SUPPORT_LVEXP, = 0 th× kh«ng hç trî
EN_SUPPORT_LVEXP		= 0		--hç trî d­íi level EN_SUPPORT_LEVEL tØ lÖ x kn nµy

ENABLE_LUCKYTURN		= 0		-- = 1: më vßng quay 0: ®ãng l¹i
ENABLE_TREASURE			= 0		-- = 1: më lùa chän hoµn mü 0: ®ãng l¹i

ENABLE_BOTTLEGAME		= 0		-- = 1: më bÇu cua 0: ®ãng l¹i

ENABLE_KILLER			= 0		--më Boss S¸t thñ = 1
ENABLE_DAILYTASK		= 1		--më d· tÈu = 1

ENABLE_EDITTASK			= 1		--më ®iÒu chØnh task khi ®¨ng nhËp = 1

ENABLE_GETPRIZE			= 0		--cho nhËn th­ëng ®ua top = 1; t¾t = 0

TTL_DAILY_LIMIT			= 0		--giíi h¹n sè giê sö dông Tiªn th¶o lé trong ngµy

PLOW_DAILY_LIMIT		= 0		--giíi h¹n sè giê sö dông NÕn Lung Linh trong ngµy

ENABLE_SELL120SKILL		= 0		--cho ®æi s¸ch kü n¨ng 120 = 1; t¾t = 0

ENABLE_SKILLMAP			= 1		--cho ®i ¸c lang cèc = 1; t¾t = 0

ENABLE_CHANGENAME		= 1		--cho ®æi tªn

ENABLE_MSGTBK			= 0		--®ãng më TÝn Sø

ENABLE_LEAGUE			= 1		-- 1: dang liªn ®Êu; 0: nghØ ng¬i l·nh th­ëng h¹ng

ENABLE_WESTISLAND		= 0		--®ãng më Vi s¬n ®¶o (T©y s¬n ®¶o)

ENABLE_SHIPPING			= 0		--®ãng më long m«n tiªu côc vËn tiªu

ENABLE_TSHIPMENT		= 0		--®ãng më vËn tiªu bang

ENABLE_FISHING			= 0		--®ãng më c©u c¸

ENABLE_TGTASK			= 1		--®ãng më nhiÖm vô môc tiªu bang héi

ENABLE_DROPEVENT		= 0		--t¾t më rít event qu¸i vµ tÝnh n¨ng

ENABLE_EVENT_3004		= 1 	-- su kien 30/4 moi

ENABLE_CITYWAR			= 0		--t¾t më ctc

ENABLE_MUSEUM			= 1		--t¾t më viªm ®Õ 

ENABLE_KINGWAR			= 0		--t¾t më thiªn tö chiÕn

ENABLE_HSBATTLE			= 0		--t¾t më hoa s¬n luËn kiÕm

ENABLE_MIDPROGRAM		= 0		--t¾t më ra vËt phÈm tÝnh n¨ng ®æi xu

ENABLE_TRAINFTASK		= 0		--t¾t më thÝ luyÖn nhiÖm vô m«n ph¸i
ENABLE_STARTFTASK		= 0		--chÝnh thøc b¾t ®Çu lµm nv

ENABLE_BOATRACE			= 0		--më ®ua thuyÒn
ENDBLE_NEWPOINT 		= 0 	--tinh luc
ENABLE_TEST_GIFT 		= 0
ENABLE_EVENT_OP 		= 0

ENABLE_EVENT_0106		= 1 -- su kien 01/06 moi

ENABLE_EVENT_VULAN		= 0 -- su kien VU LAN (thay bang Quoc Khanh)

ENABLE_EVENT_TRUNGTHU	= 0 -- su kien TRUNG THU DOAN VIEN (dung GDP Quoc Khanh)
ENABLE_EVENT_QUOCKHANH	= 1 -- su kien QUOC KHANH 02/09

ENABLE_GOLDDROP={	--list cho kh¶ n¨ng rít = 1
	dinhquoc_taydaigiay=1,
	dinhquoc_aonon=1,
	anbang_chuyen=1,
	anbang_nhanboi=1,
	honganh_chuyen=1,
	honganh_nhanboi=1,
	hiepcot_ao=1,
	hiepcot_boi=1,
	nhutinh_boi=1,
	nhutinh_ao=1,
}

function g_CheckCurVersion(nVersion)
	if(GetClientVersion() < nVersion) then
		SayNew("TÝnh n¨ng ®ßi hái ph¶i cËp nhËt lªn <color=green>phiªn b¶n míi nhÊt<color> ®Ó hiÓn thÞ vËt phÈm, kü n¨ng, b¶n ®å vµ th«ng tin chÝnh x¸c. C¸ch cËp nhËt:<enter><enter>"..
		" - T¾t cöa sæ game, ch¹y lai game<enter><enter>"..
		"NÕu gÆp khã kh¨n kh«ng cËp nhËt lªn phiªn b¶n míi ®­îc. Liªn l¹c ngay víi GM sÏ ®­îc hç trî ngay lËp tøc qua:"..
		--"     <color=metal>vennguyenkyuc.vn<color><enter>"..
		--"<color=metal>facebook.com/groups/...<color>"..
		"            <color=metal>facebook.com/...")
		return 0
	end
	return 1
end;
