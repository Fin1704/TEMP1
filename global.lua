-- 12/07/2019
--Ch¹y script ®Õn tÊt c¶ server
--File kh«ng thÓ ®æi tªn     
--ExeGlobal(rowid,nValue1,nValue2,szString)
Include("\\script\\headers\\tasklist.lua");
Include("\\script\\headers\\globallist.lua");
Include("\\script\\tong\\tongheadmini.lua");
Include("\\script\\missions\\battle\\battlehead.lua");
Include("\\script\\missions\\kingwar\\header.lua");
Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
Include("\\script\\event\\trungthu\\helper.lua"); -- event Trung Thu
Include("\\script\\event\\quockhanh0209\\helper.lua"); -- event Quoc Khanh


defGLBSCRIPTID = FileName2Id("\\script\\global.lua");

function Execute(nIdx, nValue1, nValue2, szString)	--hµm kh«ng thÓ ®æi tªn, ch¹y ë mçi server
	if(FUNC_ALLSERVER_TAB[nIdx] ~= nil) then
		FUNC_ALLSERVER_TAB[nIdx](nValue1, nValue2, szString)
	end
end;

FUNC_ALLSERVER_TAB={

[GBID_BanChat]=function (nValue1, nValue2, szString)	--khãa nãi
	local nPlayerIdx = FindPlayer(nValue1)
	if(nPlayerIdx > 0) then
		PlayerIndex = nPlayerIdx;
		SetChatFlag(nValue2)
	end
end,

[GBID_SaveInfo]=function (nValue1, nValue2, szString)	--check save info
	local nPlayerIdx = FindPlayer(nValue1)
	if(nPlayerIdx > 0) then
		PlayerIndex = nPlayerIdx;
		WriteRole()
	end
end,

[GBID_Info2AllServer]=function (nValue1, nValue2, szString)	--th«ng b¸o; nValue2 > 0: cËp nhËt sù kiÖn
	if(nValue1 > 0) then	--chat = sè id; szString: chuçi thay thÕ #s
		Msg2SubWorld(nValue1,"",szString,nValue2)
	else
		Msg2SubWorld(szString,"","",nValue2)
	end
end,

[GBID_ReloadScriptAllSV]=function (nValue1, nValue2, szString)	--reload script tÊt c¶ server
	ReLoadFile(szString)
end,

[GBID_ExeFuncAllSV]=function (nValue1, nValue2, szString)	--ch¹y 1 hµm nµo ®ã ë tÊt c¶ server (scriptid,0, hµm())
	local szFunc = "";
	local tbTabParam = {nil,nil,nil,nil,nil,nil,nil,nil};	--truyÒn tèi ®a 8 th«ng sè
	local nLen = strlen(szString);
	local pos = 0;
	for i=1,nLen do
		if(strbyte(szString,i) == 40) then	--dÊu '('
		pos = i
		break end
	end
	if(pos > 1) then
		szFunc = strsub(szString,1,pos-1)	--tªn hµm
	else return end
	if(pos+1 > nLen) then
	return end
	
	local buffstr = strsub(szString,pos+1)
	if(strbyte(buffstr,1) == 41) then	--dÊu ')'
		ExeScript(nValue1, 0, szFunc);
	else
		for k=1,8 do
		pos = 0
		nLen = strlen(buffstr);
		for i=1,nLen do
			if(strbyte(buffstr,i) == 44 or strbyte(buffstr,i) == 41) then	--',' hoÆc ')'
			pos = i
			break end
		end
		if(pos > 1) then
			local str = strsub(buffstr,1,pos-1)
			local newpos = 0
			local newlen = strlen(str)
			for j=1,newlen do
				if(strbyte(str,j) ~= 32) then
					newpos = j;
					break
				end
			end
			if(newpos > 1) then	--bá bít space phÝa tr­íc
				str = strsub(str,newpos)
			end
			if((strbyte(str,1) >= 48 and strbyte(str,1) <= 57) or strbyte(str,1) == 45) then	--is number
				tbTabParam[k] = tonumber(str)
				if not tbTabParam[k] then return end
			else
				tbTabParam[k] = str
			end
		else return end
		buffstr = strsub(buffstr,pos)
		if(strbyte(buffstr,1) == 41) then	--dÊu ')'
			ExeScript(nValue1, 0, szFunc,
			tbTabParam[1],tbTabParam[2],tbTabParam[3],tbTabParam[4],tbTabParam[5],tbTabParam[6],tbTabParam[7],tbTabParam[8]);
		return end
		if(pos+1 >= nLen) then
		return end
		buffstr = strsub(buffstr,2)
		end
	end
end,

[GBID_ResetPlayerPerDay]=function (nValue1, nValue2, szString)	--reset task mçi ngµy
	local Y,M,D,H,Mn,S = GetDate();
	local nIdx = GetNextPlayer(0);
	while nIdx > 0 do
		PlayerIndex = nIdx;
		local nTask = GetTask(TASKVALUE_DATE)
		local nV4 = GetByte(nTask,4)	--ngµy khÝ doanh
		nTask = SetByte(nTask,1,D)
		nTask = SetByte(nTask,2,M)
		nTask = SetByte(nTask,3,Y-2000)
		if(nV4 > 0) then nV4 = nV4-1 end
		nTask = SetByte(nTask,4,nV4)
		SetTask(TASKVALUE_DATE,nTask)
		SetTask(TASKVALUE_PLAYMINUTE,0)
		SetTask(TASKCLEARDAY_1,0)
		SetTask(TASKCLEARDAY_2,0)
		SetTask(TASKCLEARDAY_3,0)
		SetTask(TASKCLEARDAY_4,0)
		SetTask(TASKCLEARDAY_5,0)
		SetTask(TASKCLEARDAY_6,0)
		SetTask(TASKCLEARDAY_7,0)
		SetTask(TASKCLEARDAY_8,0)
		SetTask(TASKCLEARDAY_9,0)
		SetTask(TASKCLEARDAY_10,0)
		SetTask(TASKCLEARDAY_11,0)
		SetTask(TASKCLEARDAY_12,0)
		SetTask(TASKCLEARDAY_13,0)
		SetTask(TASKCLEARDAY_14,0)
		SetTask(TASKCLEARDAY_15,0)
		SetTask(TASKCLEARDAY_16,0)
		SetTask(TASKVALUE_EXP_DAY,0)
		SetTask(TASKVALUE_LIMITITEM_SP,0)
		SetTask(TASKCLEARDAY_17,0)
		--- event thieu nhi
		SetTask(TASK2_CLEAR_EVENT0106, Set4Cell(GetTask(TASK2_CLEAR_EVENT0106), 2, 0)); -- reset nap thieu bang hoi event thieu nhi 
		Duc_ResetEventThieuNhi(); --- Het h¹n event 0106 th× reset 
		---------------------
		--- event quoc khanh
		QK_ResetDaily();
		QK_ResetEvent();
		------------------
		
		nIdx = GetNextPlayer(nIdx)
	end
	if(GetServerIdx() == 0) then	--chØ cã duy nhÊt 1 server ®Çu tiªn
		ClearFile("timechallenge.ini")	--xãa tr¾ng file nµy
	end
end,

[GBID_BringToPrison]=function (nValue1, nValue2, szString)	--GM nhèt tï trong 'nValue2 phót'
	local nPlayerIdx = FindPlayer(nValue1)
	if(nPlayerIdx > 0) then
		PlayerIndex = nPlayerIdx;
		local w,x,y = GetWorldPos();
		if(w == 208) then
			return
		end
		if(NewWorld(208,1785,3062) > 0) then
			Msg2Player("B¹n ®· vi ph¹m quy ®Þnh. T¹m giam vµo ®¹i lao "..nValue2.." phót")
			StopTimer();--nÕu cã timer kh¸c cÇn save l¹i ë ®©y
			SetTimer(nValue2*60*18, TIMERID_PRISON)
			local nTaskVal = GetTask(TASKQUEST01);
			nTaskVal = Set1Cell(nTaskVal,4,0);	--set « sè 4 cña TASKQUEST01 = 0 (bÞ gm nhèt)
			nTaskVal = Set1Cell(nTaskVal,5,0);	--vÒ biÖn kinh
			SetTask(TASKQUEST01, nTaskVal);
			SetFightState(0)
			SetLogoutRV(0)
			SetCreateTeam(0)
		end
	end
end,

[GBID_ExeFuncOneSV]=function (nValue1, nValue2, szString)	--ch¹y 1 hµm nµo ®ã ë 1 server (scriptid,serveridx, hµm())
	if(nValue2 ~= GetServerIdx()) then
		return
	end
	local szFunc = "";
	local tbTabParam = {nil,nil,nil,nil,nil,nil,nil,nil};	--truyÒn tèi ®a 8 th«ng sè
	local nLen = strlen(szString);
	local pos = 0;
	for i=1,nLen do
		if(strbyte(szString,i) == 40) then	--dÊu '('
		pos = i
		break end
	end
	if(pos > 1) then
		szFunc = strsub(szString,1,pos-1)	--tªn hµm
	else return end
	if(pos+1 > nLen) then
	return end
	
	local buffstr = strsub(szString,pos+1)
	if(strbyte(buffstr,1) == 41) then	--dÊu ')'
		ExeScript(nValue1, 0, szFunc);
	else
		for k=1,8 do
		pos = 0
		nLen = strlen(buffstr);
		for i=1,nLen do
			if(strbyte(buffstr,i) == 44 or strbyte(buffstr,i) == 41) then	--',' hoÆc ')'
			pos = i
			break end
		end
		if(pos > 1) then
			local str = strsub(buffstr,1,pos-1)
			local newpos = 0
			local newlen = strlen(str)
			for j=1,newlen do
				if(strbyte(str,j) ~= 32) then
					newpos = j;
					break
				end
			end
			if(newpos > 1) then	--bá bít space phÝa tr­íc
				str = strsub(str,newpos)
			end
			if((strbyte(str,1) >= 48 and strbyte(str,1) <= 57) or strbyte(str,1) == 45) then	--is number
				tbTabParam[k] = tonumber(str)
				if not tbTabParam[k] then return end
			else
				tbTabParam[k] = str
			end
		else return end
		buffstr = strsub(buffstr,pos)
		if(strbyte(buffstr,1) == 41) then	--dÊu ')'
			ExeScript(nValue1, 0, szFunc,
			tbTabParam[1],tbTabParam[2],tbTabParam[3],tbTabParam[4],tbTabParam[5],tbTabParam[6],tbTabParam[7],tbTabParam[8]);
		return end
		if(pos+1 >= nLen) then
		return end
		buffstr = strsub(buffstr,2)
		end
	end
end,
};
--hµm ®Èy rêi m¹ng cña quèc chñ (tªn mÆc ®Þnh)
function NationalMasterKick(dwPID)
	local w,x,y = GetWorldPos();
	if(w < 378 or w > 386) then	--map tèng kim
		MsgSystem("Chøc n¨ng nµy chØ ®­îc sö dông trong Thiªn Tö ChiÕn")
		return
	end
	if(IsMission(BTLMSID) == 0) then
		MsgSystem("Chøc n¨ng nµy chØ ®­îc sö dông trong Thiªn Tö ChiÕn")
		return
	end
	if(GetMissionV(BTLMSV_RULEID) ~= BTLRULEID_KINDWAR) then
		MsgSystem("Chøc n¨ng nµy chØ ®­îc sö dông trong Thiªn Tö ChiÕn")
		return
	end
	local nbtLevel = GetMissionV(BTLMSV_LEVEL)	--s¬ trung cao
	local nMCamp = GetCurCamp();
	local nTongID = Number2d(GetTongID());
	if((nTongID ~= GetIniInt(defFILEKW,defKWNATIONSEC,"TCampID"..nMCamp)) or
	(TGetFigure() ~= enumTONG_FIGURE_MASTER)) then
		MsgSystem("ChØ quèc chñ míi cã quyÒn sö dông chøc n¨ng nµy")
		return
	end
	local nPlayer = FindPlayer(dwPID);
	if(nPlayer > 0) then
		local mypidx = PlayerIndex;
		local myname = GetName();
		PlayerIndex = nPlayer;
		local kickname = GetName();
		w,x,y = GetWorldPos();
		if(w < 378 or w > 386) then
			PlayerIndex = mypidx;
			MsgSystem("[<color=yellow>"..kickname.."<color>] hiÖn kh«ng cã trong Thiªn Tö ChiÕn")
			return
		end
		local nDIdx = GetMSDataIdx();
		if(nDIdx == 0) then
			PlayerIndex = mypidx;
			MsgSystem("[<color=yellow>"..kickname.."<color>] hiÖn kh«ng cã trong Thiªn Tö ChiÕn")
			return
		end
		if(IsGM() > 0) then
			PlayerIndex = mypidx;
			MsgSystem("B¹n kh«ng cã quyÒn ®Èy ng­êi nµy rêi khái Thiªn Tö ChiÕn")
			return
		end
		local nCamp = GetCurCamp();
		if(nMCamp ~= nCamp) then
			PlayerIndex = mypidx;
			MsgSystem("B¹n kh«ng cã quyÒn ®Èy ng­êi phe kh¸c rêi khái Thiªn Tö ChiÕn")
			return
		end
		SetPMParam(BTLMSID,nDIdx,BTLPM_BANED,1)
		StopTimer()
		SetDeathScript(0)
		SetPunish(0)
		SetPKFlag(0,0)
		SetLogoutRV(0)
		SetCreateTeam(1)
		ClearState()
		SubChannel(0,nCamp)	--phô thuéc subworld ®ang ®øng, unsubscribe
		NewWorld(BTLtbSIGNOUTPOS[nbtLevel][1],
		random(BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][1],BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][2]),
		random(BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][3],BTLtbSIGNOUTPOS[nbtLevel][2][nCamp][4]));
		SetFightState(0)
		SetCurCamp(GetCamp())
		SetRevPos(nCamp)	--®Þa ®iÓm håi sinh phô thuéc subworld ®ang ®øng cña player
		SetRankEx(Get4Cell(GetTask(TASKVALUE_XRANK),1))	--phôc håi danh hiÖu cò
		MsgSystem("Quèc chñ [<color=yellow>"..myname.."<color>] ®Èy ng­¬i rêi khái Thiªn Tö ChiÕn")
		
		PlayerIndex = mypidx;
		MsgSystem("B¹n ®Èy [<color=yellow>"..kickname.."<color>] rêi khái Thiªn Tö ChiÕn")
	return end
	MsgSystem("Ng­êi nµy hiÖn kh«ng cã trong Thiªn Tö ChiÕn")
end;
