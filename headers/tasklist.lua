--danh s¸ch id task
--MrTuPham
--*************************SetTaskTemp 1->255
TEMP_INDEX = 1  --tÊt c¶ idx t¹m thêi
TEMP_FRUITIDX = 2  --id qu¶ HH
TEMP_FRUITCURTIME = 3  --thêi gian chän qu¶ HH
TEMP_LANTERNPTIME = 4  --mèc thêi gian tr¶ lêi c©u hái
TEMP_LASTDIETIME = 5  --mèc time chÕt (tèng kim)
TEMP_TEAM_INVITEDWPID_BG = 6  --ng­êi mêi vµo team 6->10 (tæng 5 xoay vßng)
TEMP_TEAM_JOINDWNPC_BG = 11    --ng­êi xin vµo team 11->15 (tæng 5 xoay vßng)
TEMP_PNEXT_ACTTIME  = 16  --thêi gian delay 1 hµnh ®éng g× ®ã (vÝ dô: lùa chän say)
TEMP_COUNTSOMETHING  = 17  --®Õm sè l­îng
TEMP_WEBSHOP    = 18    --gi¸
TEMP_MATEID    = 19    --id cña ng­êi muèn kÕt h«n
TEMP_RECOVER_MONEY = 20  --tiÒn phôc håi exchangeserver
TEMP_JUSTINTRAP    = 21    --võa ®¹p trap
TEMP_OFFEXP    = 22    --kinh nghiÖm off x1000
TEMP_TBKSELBOX    = 23    --r­¬ng thiªn b¶o khè cã thÓ më
TEMP_SHIPITEMTIME_1  = 24    --thêi gian kÕ t¨ng tèc Tiªu xa
TEMP_SHIPITEMTIME_2  = 25    --thêi gian kÕ håi m¸u Tiªu xa
TEMP_SHIPITEMTIME_3  = 26    --thêi gian kÕ triÖt s¸t Tiªu xa
TEMP_SHIPITEMTIME_4  = 27    --thêi gian kÕ teleport Tiªu xa
TEMP_SHIPITEMTIME_5  = 28    --thêi gian kÕ return Tiªu xa bang
TEMP_SHIPITEMTIME_6  = 29    --lÇn return Tiªu xa bang
TEMP_HASKINGSIGNET  = 30    --®ang gi÷ thiªn tö ngäc tØ
TEMP_EVENT1      = 31    --ghi sù kiÖn nµo ®ã
TEMP_EVENT2      = 32    --ghi sù kiÖn nµo ®ã

TEMP_AITASKBEGIN = 187    --lµm mèc ®Ó clear
TEMP_DEFTGNEXTTIME = 187    --thêi gian kÕ ®¸nh mÆc ®Þnh theo h­íng môc tiªu
TEMP_ALLYMOVETIME = 188    --thêi gian t×m ®ång minh ®Ó bÎ l¸i
TEMP_FINDWAYNUM = 189    --®· findway bao nhiªu lÇn
TEMP_MORETIME = 190    --thêi gian sö dông thªm
TEMP_NEXTTRAPTIME = 191    --thêi gian nghØ bÉy
TEMP_TRAPSKILL = 192    --lùa skill bÉy DM
TEMP_USETRAPTIME = 193    --thêi gian sö dông bÉy DM
TEMP_ENBUFFTIME = 194    --khung thêi gian buff nhÞp kÕ tiÕp
TEMP_NEXTENBUFF = 195  --skill sÏ buff nhÞp kÕ tiÕp
TEMP_NEARDIST = 196  --tiÕp cËn
TEMP_MOREACTTIME = 197  --thêi gian chuyÓn gi÷a luyÖn c«ng vµ ®i d¹o
TEMP_MORE_X  = 198  --täa ®é thªm bÎ l¸i khi di chuyÓn
TEMP_MORE_Y  = 199  --täa ®é thªm bÎ l¸i khi di chuyÓn


-----------------------------------------------------------
--phÇn nµy cho bot game tù ho¹t ®éng
-----------------------------------------------------------
TEMP_AIBEGIN = 200  --step id200 trë lªn: AI
TEMP_DESX = 201    --®Ých ®Õn x
TEMP_DESY = 202    --®Ých ®Õn y
TEMP_CURPOS = 203  --vÞ trÝ t×m ®­êng hiÖn t¹i ®· ®i ®c
TEMP_ACTTIME = 204  --thêi gian chuyÓn h×nh thøc
TEMP_AREAID = 205  --khu vùc ho¹t ®éng
TEMP_POSTTIME = 206  --thêi gian c¸ch post chat
TEMP_REPLINTV = 207  --thêi gian c¸ch b¬m m¸u
TEMP_MNREPLINTV = 208  --thêi gian c¸ch b¬m néi lùc
TEMP_USEPOTNUM = 209  --sè l­îng m¸u ®· sö dông
TEMP_CUREMEMY = 210  --dwID NPC ®ang ®¸nh
TEMP_NEXTACTTIME = 211  --thêi gian kÕ tiÕp sÏ cã hµnh ®éng kh¸c
TEMP_NEXTRUNTIME = 212  --thêi gian kÕ tiÕp sÏ check giËt vµ ch¹y
TEMP_NEXTKEEPTIME = 213  --thêi gian kÕ tiÕp check gi÷ vÞ trÝ
TEMP_OLDMY_X = 214    --vÞ trÝ tr­íc ®ã cña m×nh
TEMP_OLDMY_Y = 215    --vÞ trÝ tr­íc ®ã cña m×nh
TEMP_OLDEM_X = 216    --vÞ trÝ tr­íc ®ã cña ®Þch
TEMP_OLDEM_Y = 217    --vÞ trÝ tr­íc ®ã cña ®Þch
TEMP_LASTSKILL = 218    --save skill cuèi cïng ®¸nh tróng m×nh
TEMP_ISJUMP = 219      --khi ch¹y cã nh¶y kh«ng
TEMP_JUMPED = 220    --®· nh¶y råi hay ch­a
TEMP_NEXTCBTIME  = 221  --thêi gian kÕ tiÕp ®æi xa gÇn
TEMP_CBTYPE  = 222    --0:®¸nh xa; 1:tiÕp cËn
TEMP_CBNEARTYPE  = 223    --dµnh cho lo¹i tiÕp cËn; 0:®¸nh xa; 1:tiÕp cËn; chuyÓn ®æi qua l¹i theo thêi gian
TEMP_NEXTBUFFTIME = 224    --thêi gian kÕ buff skill ®Æc biÖt
TEMP_NEXTENEMYBUFF = 225    --thêi gian kÕ buff skill ®Æc biÖt cho ®Þch thñ
TEMP_HIDDEN = 226    -- ®· Èn xong
TEMP_NEXTPICKTIME = 227    -- thêi gian lôm ®å
TEMP_EXCHGTYPE = 228    -- out vµ reload ë 1 map kh¸c
TEMP_SUB1PARAM = 229    -- th«ng sè phô
TEMP_SUB2PARAM = 230    -- th«ng sè phô
TEMP_SUB3PARAM = 231    -- th«ng sè phô
TEMP_T2GOHOME = 232      --thêi gian ®Ó vÒ thµnh khi hÕt m¸u
TEMP_ORIGX = 233    --c¾m cäc x
TEMP_ORIGY = 234    --c¾m cäc y
TEMP_NEXTREPAIRTIME = 235    -- thêi gian söa ®å
TEMP_SUBCOUNT  = 236      -- th«ng sè phô
TEMP_GOTIME = 237    -- thêi gian ®i ®Õn 1 ®iÓm qu¸ l©u
TEMP_CHGGOTIME = 238    -- thêi gian chuyÓn h­íng di chuyÓn khi ch¹y
TEMP_LAGTIME = 239    -- thêi gian kÕ ®¸nh bÞ lag
TEMP_LOOPCHATTIME = 254  --thêi gian c¸ch nãi vu v¬
TEMP_CHATIDXFACE = 255  --<1>cã face? <2>face tr­íc sau <3>viÕt hoa <4>®· gen råi <5>bËt t¾t <789> mÆt c­êi thªm khi chat loop

--*************SetTask 1->255**************************
TASKVALUE_PRISON_RESTTIME    =1    --thêi gian cßn l¹i trong tï
TASKVALUE_ATLAT_PIECE      =2    --TÊm b¶n ®å SHXT
TASKVALUE_SAVEWAYPOINT_BEGIN  =3    --3cell <123><456><789> l­u ®Þa ®iÓm ®· ®Õn


TASKVALUE_GRACE           =4    --phóc duyªn
TASKVALUE_SONGJIN        =5    --tÝch lòy tèng kim
TASKVALUE_GLORY          =6    --vinh dù
TASKVALUE_REPUTE         =7    --danh väng
TASKVALUE_NEWPOINT         =8    --Xu khãa
TASKVALUE_OFFER           =9    --cèng hiÕn c¸ nh©n
TASKVALUE_PLAYMINUTE      =10    --phót online
TASKVALUE_OFF_MINUTE      =11    --phót ñy th¸c remain (th­êng)
TASKVALUE_XRANK          =12    --<1234> danh hiÖu vßng s¸ng
                      --<56789> cßn trèng
TASKVALUE_DATE           =13    --<3Byte>ngµy th¸ng n¨m login  <BYTE4>daydate khÝ doanh
TASKVALUE_STATE1          =14    --<1234>TSBL <56789>TTL x kn
TASKVALUE_STATE2          =15    --<1234>BQL <5678>QHT  <9>TTL level
TASKVALUE_STATE3          =16    --<12> tÈy tñy kinh
                      --<34>luyÖn level  <56789>x2 luyÖn skill
TASKVALUE_CRENDTIME        =17    --mèc thêi gian hÕt h¹n t¹o phßng t¸n gÉu (phót)
TASKVALUE_STATE4          =18    --<12345> timeskill PHSL+NL10 <6>level
                      --<78>®­êng skill hiÖn t¹i (AI)
                      --<9>phông nguyÖt qu¶ dung
TASKVALUE_KILLNUM        =19    --sè ng­êi ®· giÕt
TASKVALUE_KILLERN        = 20    --sè ng­êi ®· ®å s¸t
TASKVALUE_EQUIPPOINT        = 21    --®iÓm ®¸nh gi¸ trÞ sè trang bÞ trªn ng­êi
TASKBIGQUEST_1          = 22    --D· tÈu
                      --<1> tr¹ng th¸i nhiÖm vô; 0:ng­êi míi; 1:®· nhËn; 2: hoµn thµnh; 3:®· nhËn th­ëng
                      --<2> kiÓu nhiÖm vô
                      --<3> c¬ héi hñy bá nhiÖm vô
                      --<456> id dßng th­ëng item trong DLTtbBasicAward >< kiÓu nv ®å chÝ >< save cÊp
                      --<789> id hµng cña b¶ng nv
TASKBIGQUEST_2          = 23    --D· tÈu
                      --<123456> sè l­îng nv ®· lµm
                      --<7><8><9> kiÓu 3 « th­ëng
TASK_DLTPRIZEEXP          = 24    --th­ëng D· tÈu kinh nghiÖm >< lµm møc so s¸nh ®iÓm
TASK_DLTPRIZEMONEY        = 25    --th­ëng D· tÈu ng©n l­îng >< mapid t×m ®å chÝ
TASKBIGQUEST_3          = 26    --D· tÈu <123> ®· nhËn th­ëng khi ®¹t mèc (id DLTtbLinkAward)
                      --D· tÈu <4> sè lÇn hñy trë l¹i tõ ®Çu
                      --<56789>sè lÇn xoay thñy tinh
TASK_NEWPRATICE          = 27    --<1234>b¹ch cèt lÖnh (chôc gi©y)
                      --<5678>thiªn long lÖnh (chôc gi©y)
                      --<9>cèng nguyÖt phï dung
TASKVALUE_EX_OFFMINUTE      = 28    --phót ñy th¸c remain (®¹i)
TASKVALUE_FREE_OFFMINUTE    = 29    --phót ñy th¸c remain FREE
TASKVALUE_IDXNUMBER        = 30    --sè thø tù AI rolelist
TASKBIT_EDITTASK          = 31    --chØnh 1 sè task (32 lÇn chØnh)
                      --<1>reset TASK_EVENT01->TASK_EVENT05
                      --<2>reset TASK_EVENT01->TASK_EVENT07
                      --<3>reset TASK_EVENT01->TASK_EVENT07
                      --<4>reset TASK_EVENT01->TASK_EVENT07
                      
TASK_CHATLISTID          = 32    --<1234> save id c©u nãi vu v¬, lo¹i train
                      --<5678> save id c©u nãi vu v¬, lo¹i fight
                      --<9> cã lo¹i 2 ko
TASK_NEXTTIME_4          = 33    --thêi gian kÕ reset loop chat


TASK_EVENT01            = 34    --<1234>sl c¾n phong ph¸o
                      --<5678>sl c¾n ph¸o hoa
                      --<9> mèc ph¸o hoa
TASK_EVENT02            = 35    --<1>sl móa l©n
                      --<2>nhËn ¸o kho¸c tÕt
                      
TASKVALUE_STATE5          =36    --<1234>thiªn c¬ lÖnh gi©y
                      --<5>tÝn sø yªu bµi id thø tù
                      --<6>tÝn sø yªu bµi lv
                      --<789>tÝn sø yªu bµi 5 gi©y
TASK_MISSION01            =37    --<12345>d·y sè tÝn sø TBK
                      --<6> nhiÖm vô tÝn sø TBK
                      --<7> sè lÇn chÕt TBK
                      --<8> sl cøu thiÕu n÷
                      --<9> l­u svid pos quay trë vÒ thµnh tõ 1 b¶n ®å tÝnh n¨ng
TASKVALUE_MSGPOINT        =38    --§iÓm tÝn sø tÝch lòy
TASK_MISSION02            =39    --<1234>®iÓm tÝn sø ®· kiÕm trong nv hiÖn t¹i
                      --<56> nv sè con qu¸i VS§
                      --<7>®­a th­ nguån (1->7)
                      --<8>®­a th­ ®Ých (1->7)
                      --<9>BLH - TiÓu Ng­
TASK_NEXTTIME_5          = 40    --thêi gian kÕ danh hiÖu
TASK_EVENT03            = 41    --<1234> c¬m tr¾ng
                      --<5678> c¬m hÊp l¸ sen
                      --<9> mèc c¬m
TASK_EVENT04            = 42  --<1234> bia th­êng
                      --<5678> bia h¶o
                      --<9> mèc h¶o
TASK_EVENT05            = 43    --

TASK_NEXTTIME_6          = 44    --thêi gian kÕ ®­a th­
TASKQUEST04            = 45    --<1>VLT-Lç gia
                      --<2>VLT-Ng­u Ng­u
                      --<3>VLT-Lý Dù
                      --<4>CTT-L·o Chu
                      --<5>CTT-Doanh Doanh
                      --<6>CTT-Song Song
                      --<7>LMT-Th­îng Quan Thu
                      --<8>LMT-¨n mµy
                      --<9>LMT-heo rõng
TASKQUEST05            = 46    --<1>DHT-Hoa Hoa
                      --<2>DHT-T« Trung
                      --<3>DHT-TiÓu Lan
                      --<4>GTT-Hæ phô
                      --<5>GTT-ng« l·o gia
                      --<6>GTT-Hæ tö
                      --<7>LTT-t¹p hãa
                      --<8>LTT-bµnh phãng
                      --<9>LTT-Chung CÇm
TASK_NEXTTIME_7          = 47    --thêi gian kÕ lÊy thuèc tiÓu lan
TASK_NEXTTIME_8          = 48    --thêi gian kÕ lÊy ®ao bµnh phãng
TASKQUEST06            = 49    --<1>TCT-liÔu diÖp nhi
                      --<2>TCT-A Toµn A M·
                      --<3>TCT-A Kinh
                      --<456>id nv lÖnh bµi ngÉu nhiªn
                      --<78>sè l­îng ®· ®¸nh qu¸i nv lÖnh bµi ngÉu nhiªn
                      --<9>
TASKQUEST01            = 50  --<1>häc skill ¨n mµy
                    --<2>tÝn vËt m«n ph¸i
                    --<3>nhËn 1 skill 9x
                    --<4> =0: bÞ gm nhèt;  =1:ë tï;  =2:th¨m tï;  =3:s¹ch pk
                    --<5> n¬i vµo tï  =0: biÖn kinh;  =1: l©m an
                    --<6> cÊp boss s¸t thñ (=m¶ng)
                    --<789> häc khinh c«ng vâ s­
TASKCLEARDAY_1          = 51  --<1>sè lÇn nhÆt QHH
                    --<2>sè lÇn nhÆt QHK
                    --<3>sè lÇn c¾n QHH
                    --<4>sè lÇn c¾n QHK
                    --<56>sè lÇn tr¶ lêi hoa ®¨ng
                    --<78>sè lÇn boss s¸t thñ
                    --<9> sè lÇn thiÕt la h¸n trong ngµy
TASKQUEST02            = 52    --<123>id boss s¸t thñ
                      --<4>lo¹i tÈy tñy 1=all ; 2=tiÒm; 3=kü
                      --<56>vâ l©m mËt tÞch
                      --<7> Level lb nv ®Æc biÖt
                      --<8> id lb nv ®Æc biÖt
                      --<9> sè lÇn tÈy tñy free
TASKBIT_GETPRIZE          = 53    --32bit th­ëng
                        --<12345678> t©n thñ
                        --<9> t©n thñ m¸u TK
                        --<10> t©n thñ t¸i t¹o phsl nl
                        --<24> d· tÈu mèc 18k nhËn lÇn 1
                        --<25> quµ sinh nhËt lÇn 1
                        --<26> ®Òn bï 24/12
                        --<27>NhËn th­ëng xÕp h¹ng liªn ®Êu danh hiÖu

                        --<28>NhËn th­ëng xÕp h¹ng liªn ®Êu
                        --<29>chuyÓn ®­êng skill AI
                        --<30>§Òn bï 261 TTLDB
                        --<31>NhËn test lÇn ®Çu
                        --<32>AI ®· göi tiÒn bang
TASKCLEARDAY_2          = 54    --<123456>®æi tÝch lòy tk
                      --<7>sè lÇn nhËn diÖt thñy tÆc pld
                      --<8>sè lÇn nhËn thªm nv thñy tÆc
                      --<9>sè lÇn v­ît ¶i ntt
					  --<10> nÕn lung lunh
TASKBIT_YNQUEST          = 55    --32bit nhiÖm vô yes hoÆc no
                      --<1>nhËn nv diÖt thñy tÆc pld
                      --<2>nv diÖt thñy tÆc pld: ®¸nh qu¸i hoµn thµnh
                      --<3>diÖt thñy tÆc b»ng LÖnh Bµi thñy tÆc
                      --<4>nhËn h¸i thuèc
                      --<5>nhËn t×m kho¸ng ThiÕu L©m Trõng M¹t
                      --<6>®æi s¸ch 120
                      
TASKCLEARDAY_3          = 56    --<1>long huyÕt hoµn (t¨ng lÇn v­ît ¶i)
                      --<2> nhËn loop d· tÈu trong ngµy
                      --<34> sè lÇn lµm d· tÈu trong ngµy
                      --<56> sè lÇn hñy d· tÈu shxt trong ngµy
                      --<7> sè lÇn sö dông b¹ch cèt
                      --<8> sè lÇn sö dông thiªn long
                      --<9> sè lÇn thªm 10 nv d· tÈu
TASKCLEARDAY_4          = 57    --<12> sè lÇn trong ngµy vqmm
                      --<3> sè lÇn thªm 5nv boss s¸t thñ trong ngµy
                      --<4> sè lÇn lªn thuyÒn pld
                      --<5> võa kÕt h«n hoÆc ly h«n
                      --<6> luyÖn 120 npc ch­ëng m«n trong ngµy
                      --<78> sè giê xµi ttl trong ngµy
                      --<9> sè lÇn c¾n bch120
TASK_NEXTTIME_1          = 58    --thêi gian kÕ h¸i thuèc thµnh ®«
TASKQUEST03            = 59    --<12>ngµy h¸i thuèc
                      --<3>lÇn h¸i thuèc
                      --<4>AI kiÓu ch÷ ko dÊu loop chat
                      --<56>liªn kÕt vâ l©m
                      --<7>BLH - A Ph­¬ng
                      --<8>BLH - Cæ L·o Th¸i
                      --<9>AI sè lÇn check map luyÖn
TASK_NEXTTIME_2          = 60    --thêi gian kÕ thu thËp kho¸ng TL
TASK_NEXTTIME_3          = 61    --thêi gian kÕ liªn kÕt vâ l©m
TASK_FIVEDRAGON          = 62    --<12>chÝnh ph¸i chÝnh tuyÕn
                      --<34>trung lËp chÝnh tuyÕn
                      --<56>tµ ph¸i chÝnh tuyÕn
                      --<78>®¸nh nhÝm,khØ x¸m phô tuyÕn trung
                      --<9>hµng chôc ®Õm ®¸nh qu¸i phô tuyÕn tµ
TASK_BRANCH5DRAGON        = 63    --<12>chÝnh ph¸i phô tuyÕn
                      --<34>trung lËp phô tuyÕn
                      --<56>tµ ph¸i phô tuyÕn
                      --<78>®¸nh sãi xanh phô tuyÕn chÝnh
                      --<9>hµng ®¬n vÞ ®Õm ®¸nh qu¸i phô tuyÕn tµ
TASKCLEARDAY_5          = 64    --<12> c¾n ®¹i bæ thÇn ®an tiÓu
                      --<34> c¾n ®¹i bæ thÇn ®an ®¹i
                      --<5> võa chuyÓn ph¸i trong ngµy
                      --<6> th«ng b¸o chuyÓn ph¸i xong 
                      --<789>
TASKCLEARDAY_6          = 65    --<1> sè lÇn tÝn sø
                      --<2> xµi TBK lÖnh
                      --<3> Vi s¬n ®¶o
                      --<4> Trång h¹t hoa hång
                      --<56789> c¸c lo¹i ch©n kinh
TASKCLEARDAY_7          = 66    --<123> sè lÇn hÝt hoa hång
                      --<4>sè lÇn lµm míi sao * free
                      --<56>sè lÇn lµm míi = ho¸n tiªu chØ
                      --<7>sè lÇn nhËn tiªu random
                      --<8>sè lÇn nhËn tiªu cao cÊp
                      --<9> nhËn r­¬ng chÕt
TASKSHIPPER            = 67    --<1> vËn tiªu sao *
                      --<2> nhËn nhiÖm vô
                      --<3> lo¹i b¶n ®å 1,2,3
                      --<4> sè boss ®¸nh
                      --<56789>index Npc Tiªu Xa
TASKCLEARDAY_8          = 68    --<1> sè lÇn lôm ¸p tiªu ñy nhiÖm trang
                      --<2> sè lÇn trång h¹t may m¾n
                      --<3> sè lÇn trång h¹t thñy tinh
                      --<4> sè lÇn trång h¹t hoµng kim

                      --<5> sl h­ëng may m¾n
                      --<6> sl h­ëng thñy tinh
                      --<7> sl h­ëng hoµng kim
                      --<8> sl h­ëng triÖu ho¸n (tiÓu) dmg cao nhÊt
                      --<9> sl h­ëng triÖu ho¸n (tiÓu) ®øng gÇn
TASK_SKILLEXP_FISHING        = 69    --kinh nghiÖm c©u c¸ ®Ó lªn cÊp
TASKCLEARDAY_9          = 70    --<1> sl h­ëng triÖu ho¸n (®¹i) dmg cao nhÊt
                      --<2> sl h­ëng triÖu ho¸n (®¹i) ®øng gÇn
                      --<3> sl huëng triÖu ho¸n (siªu) dmg cao nhÊt
                      --<4> sl huëng triÖu ho¸n (siªu) ®øng gÇn
                      --<5> nhËn cèng hiÕn hµng ngµy tÕ töu
                      --<6> nhËn tu th©n hoµn
                      --<789> th¶ méc nh©n
TASK_EVENT06            = 71    --
TASK_EVENT07            = 72    --
TASKVALUE_STATE6          = 73    --<12345> check state t¸i t¹o td liªn ®Êu (gi©y)
                      --<6> check state t¸i t¹o td lv, add l¹i x5
                      --<78> tu th©n hoµn level
                      --<9> lo¹i th­ëng Xu c¸ nh©n CTC, vµ ®· nhËn hay ch­a
TASKCLEARDAY_10          = 74    --<1234> nhËn ®iÓm ph¸t cèng hiÕn tèi ®a mçi ngµy
                      --<56> sè lÇn nv ngÉu nhiªn lÖnh bµi
                      --<789> sè lÇn lËt thÎ trong ngµy
TASKVALUE_STATE7          = 75    --<12345> nh©n kn tu th©n hoµn (gi©y)
                      --<6> kiÓu th­ëng xu viªm ®Õ
                      --<78>
                      --<9> kiÓu vßng s¸ng hoµng ®Õ 0 ; thiªn tö 1
TASKCLEARDAY_11          = 76    --<12> sl mËt ®å nv tèi ®a mçi ngµy
                      --<34> sl ch¸o l¹p b¸t
                      --<56> sl phÝch lÞch ®¬n
                      --<7> sl dïng ctc lÔ bao
                      --<8> viªm ®Õ trong ngµy
                      --<9> sl giao nv lb ®Æc biÖt
TASKQUEST07            = 77    --<123> id task mËt ®å nhiÖm vô
                      --<456> sè l­îng yªu cÇu nv lb ®Æc biÖt
                      --<789> sè l­îng ®¹t ®c nv lb ®Æc biÖt
TASKTONGSHIPMENT          = 78    --<123456>id ver ¸p tiªu bang
                      --<78>phót hé tèng
                      --<9>nhËn th­ëng
TASKCLEARDAY_12          = 79    --<123> sl Khiªu chiÕn lÖnh nép
                      --<4> ®· chÕt trong viªm ®Õ
                      --<5> sè lÇn thµnh c«ng qua bê b¾c pld
                      --<6> sè lÇn giao tiªu c¸ nh©n trong ngµy
                      --<7> sè lÇn chat chóc mõng thiªn tö
                      --<8> sè lÇn thiªn tö cÊm chat trong ngµy
                      --<9> sl trång thiªn tuÕ
TASKCLEARDAY_13          = 80    --<12><34><56><78> sö dông r­¬ng VA,thñy tÆc,tÝn sø,viªm ®Õ
                      --<9> nhËn th­ëng nv t©n thñ hµng ngµy
TASK_NEXTTIME_9          = 81    --thêi gian kÕ vßng s¸ng hoµng ®Õ thiªn tö
TASKCLEARDAY_14          = 82    --<1>nhËn th­ëng thiªn tuÕ bang héi

TASKBIGQUEST_4          = 83    --nhiÖm vô m«n ph¸i
                      --<12> thiÕu l©m
                      --<34> thiªn v­¬ng
                      --<56> ®­êng m«n
                      --<78> ngò ®éc
                      --<9> hµng chôc tiªu dao
TASKBIGQUEST_5          = 84    --nhiÖm vô m«n ph¸i
                      --<12> nga my
                      --<34> thóy yªn
                      --<56> c¸i bang
                      --<78> thiªn nhÉn
                      --<9> hµng ®¬n vÞ tiªu dao
TASKBIGQUEST_6          = 85    --nhiÖm vô m«n ph¸i
                      --<12> vâ ®ang
                      --<34> c«n l«n
                      --<56> hoa s¬n
                      --<78> vò hån
TASKBIGQUEST_7          = 86    --<12>nhiÖm vô cÊp 150
                        --<789>sl c¬ héi toµn n¨ng
TASKVALUE_MERIDIAN1        =100  --<12345678>4m¹ch
TASKVALUE_MERIDIAN2        =101  --<12345678>4m¹ch
TASKVALUE_MERPOINT        =102  --ch©n nguyªn
TASKVALUE_LUCKY_VIP        =103  --<12>vip
                      --<34>luckresult
                      --<56789>sè lÇn quay luck
TASKVALUE_1TREASURE        =104  --lùa chän lËt thÎ<12><34><56><78>sè 4 « ®· chän
                      --<9>sè l­îng 999 lÇn treasure
TASKVALUE_2TREASURE         =105  --lùa chän lËt thÎ
                      --<1><2><3><4>kÕt qu¶ 4 «
                      --<56>sè lÇn nhËn th­ëng luck
                      --<789>sè lÇn treasure hiÖn t¹i, qua 999 sÏ chuyÓn qua « 9 1TREASURE
TASKVALUE_BLACKMERPOINT    =106  --huyÒn nguyªn
TASKVALUE_MERIDIAN3        =107  --<12345678>m¹ch new
                      --<9> sè thø tù r­¬ng ®· chän trong 3 r­¬ng mysbox
TASKVALUE_MYSBOX        =108  --<123><456><789>index trong file
TASKVALUE_ALMIGHTYPOINT    =109  -- ®iÓm toµn n¨ng
TASKVALUE_EXP_DAY      		= 110
TASKVALUE_GIFT_CODE    		= 111 --gift code <32bit> true/false
TASKVALUE_LIMITITEM_BATTLE    = 112
TASKVALUE_OPENTEST_VALUE    = 113
TASKVALUE_TASK_TUT        = 114
TASKCLEARDAY_15          = 115    --32bit true false
					   --<1> nhËn th­ëng h»ng ngµy nhiÖm vô d· tÈu
					   --<2> mçi ngµy ®­îc c¾n 1 viªn kinh nghiÖm d· tÈu
					   --<3> nhËn ®Òn bï viªn exp d· tÈu
					   --<4> cho nh÷ng th»ng ¨n trªn 50 nv d· tÈu ¨n thªm 1 viªn
					   --<5><6> viªn tèng kim thua 1 ngµy 2 viªn
					   --<7><8> viªn tèng kim th¾ng 1 ngµy 2 viªn
					   --<9> viªn tèng kim	 1 ngµy 1 viªn
					   --<10> nÕn b×nh an
					   --<11> nÕn h¹nh phóc
					   --<12> viªn kinh nghiÖm PLD
					   --<13> Trong Khai Hoan
TASKVALUE_NEWITEM		= 116
TASKCLEARDAY_16 		= 117 -- thiÕt la h¸n
TASKVALUE_ITEMPOINT		= 118
						--- <1 - > 4> cel vËt phÈm Ph¸o 30 - 04[TiÒm N¨ng]
						--- <5 - > 8>cel vËt phÈm Ph¸o 30 - 04[Ky N¨ng]
TASKVALUE_STATE8        =119 --
TASKCLEARDAY_17 		= 120 -- <1> QUA HUY HOANG TIEU

TASK1_CLEAR_EVENT0106 = 121 -- cell  (hÕt event clear)
										-- Get4Cell 1 «(1-4): hép kÑo tr¸i c©y 
										-- Get4Cell 1 o(5-8): hép kÑo ngät ngµo
										-- Get1Cell 1 o(9) : check mèc event 
TASK2_CLEAR_EVENT0106 = 122 -- cell		(hÕt event clear)
										-- Get4Cell 1 «(1-4): hép kÑo thanh m¸t
										-- Get4Cell 1 o(5-8): L­uu Nap Thiep Bang
										-- Get1Cell 1 o(9) : check mèc event 
TASKVALUE_SKILLPOINT = 123 -- cell (Task luu vËt phÈm tiÒm n¨ng kü n¨ng)				
										-- Get1Cell 1o (1): 	(KÑo kü n¨ng)
										-- Get1Cell 1o (2):   (KÑo tiÕm n¨ng)	
										-- Get2Cell 2o (34)  (TrÊn ph¸i linh ®¬n)
										-- Get2Cell 2o (56)  (TrÊn ph¸i linh d­îc)
										-- Get1Cell 1o (7): 	(§Ìn hoa ®¨ng [tiÒm n¨ng])
										-- Get1Cell 1o (8):   (§Ìn hoa ®¨ng [kü n¨ng])	
										-- Get1Cell 1o (9):   (B¸nh trung thu [tiÒm n¨ng])
										
TASK1_CLEAR_EVENTVULAN = 124 -- cell  (hÕt event clear)
										-- Get4Cell 1 «(1-4): Hoa §¨ng B¸o HiÕu
										-- Get4Cell 1 o(5-8): M©m LÔ Vu Lan
										-- Get1Cell 1 o(9) : check mèc event 
TASK2_CLEAR_EVENTVULAN = 125 -- cell		(hÕt event clear)
										-- Get4Cell 1 «(1-4): Ngäc Béi T©m HiÕu
										-- Get4Cell 1 o(5-8): L­uu Nap Thiep Bang
										-- Get1Cell 1 o(9) : check mèc event 
TASK3_CLEAR_EVENTVULAN = 126 -- cell		(hÕt event clear)			
										-- Get3Cell 1 o(1) : Giíi h¹n hép quµ vu lan h»ng ngµy
										-- Get3Cell 1 o(2) : Giíi h¹n hép quµ vu lan h»ng ngµy
										-- Get3Cell 1 o(3) : Giíi h¹n hép quµ vu lan h»ng ngµy
TASK4_CLEAR_EVENTVULAN = 127; -- cell  (hÕt event clear)	
										-- Get1Cell o(1) : L­u sè lÇn sö dông hép quµ vu lan
										-- Get1Cell o(2) : Gia han Vong Sang Event
										
TASKVALUE_EXPCHANDON = 128 -- cell (L­u ®iÓm kinh nghiÖm ch©n ®¬n)		
										-- Get4Cell 1 o(1) : kinh nghiÖm
										-- Get4Cell 1 o(2) : th¸ng n¨m
									
TASK1_CLEAR_EVENTTRUNGTHU = 129 -- cell  (hÕt event clear)
										-- Get4Cell 1 «(1-4): B¸nh Trung Thu Väng NguyÖt
										-- Get4Cell 1 «(5-8): B¸nh Trung Thu KiÕn NguyÖt
										-- Get1Cell 1 «(9) : check mèc event 
TASK2_CLEAR_EVENTTRUNGTHU = 130 -- cell		(hÕt event clear)
										-- Get4Cell 1 «(1-4): B¸nh Trung Thu Th­ëng NguyÖt
										-- Get4Cell 1 «(5-8): L­u nép Lång §Ìn [Bang] trong ngµy
										-- Get1Cell 1 «(9) : check mèc event 2
TASK3_CLEAR_EVENTTRUNGTHU = 131 -- cell		(hÕt event clear)
										-- Get3Cell 1 «(1) : Giíi h¹n b¸nh trung thu hµng ngµy
										-- Get3Cell 1 «(2) : Giíi h¹n b¸nh trung thu hµng ngµy
										-- Get3Cell 1 «(3) : Giíi h¹n b¸nh trung thu hµng ngµy
TASK4_CLEAR_EVENTTRUNGTHU = 132; -- cell  (hÕt event clear)
										-- Get1Cell «(1) : L­u sè lÇn sö dông hép quµ trung thu
										-- Get1Cell «(2) : Flag ®· RESET mèc 1000 B¸nh Th­ëng NguyÖt (¨n max lÇn 2)
										
TASKVALUE_SKILLPOINT2 = 133 -- cell (Task l­u vËt phÈm tiÒm n¨ng kü n¨ng)
										-- Get1Cell «(1) : sè lÇn ¨n B¸nh trung thu [kü n¨ng]
										-- cßn trèng Get1Cell «(2)
										-- Get2Cell «(2) cã nghÜa lµ « 3 4 : sè lÇn dïng TÈy Tñy Kinh - quyÓn 2
										-- Get2Cell «(3) cã nghÜa lµ « 5 6 : sè lÇn dïng Vâ L©m MËt TÞch - quyÓn 2
										
TASK1_CLEAR_EVENTQUOCKHANH = 134 -- Get4Cell: Quan Trang Chien Thang / Chien Cong
TASK2_CLEAR_EVENTQUOCKHANH = 135 -- Get4Cell: Quan Trang Anh Dung / Vong Hoa Bang nop trong ngay
TASK3_CLEAR_EVENTQUOCKHANH = 136 -- Get1Cell: moc Chien Cong / Anh Dung / Vong Sang / Max Event
TASK4_CLEAR_EVENTQUOCKHANH = 137 -- du phong reset va mo rong

------------TimerId List------------------------------------
TIMERID_PRISON    = 1        --id trong tï
TIMERTIME_PRISON    = 120*60*18    --thêi gian gi¶m 1 PK (2 tiÕng)
TIMERID_BTLREST    = 2        --id tèng kim
TIMERTIME_BTLOUTFORCE  = 60*18    --60s ®Èy ra chiÕn tr­êng
TIMERID_NEWPRACT  = 3        --luyÖn b¶n ®å cao cÊp
TIMERID_TOFIGHT  = 4        --bËt chiÕn ®Êu (viªm ®Õ)
TIMERID_LACOCHIENTHANG  = 5        --h­ëng thô kinh nghiÖm vËt phÈm L¸ Cê ChiÕn Th¾ng