--D· TÈu
-- 21/6/2019
Include("\\script\\lockprogram.lua");
if (not INCLUDED_TASKLISTMATH) then
	Include("\\script\\headers\\tasklist.lua");
	Include("\\script\\headers\\math.lua");
	INCLUDED_TASKLISTMATH = 1;
end
Include("\\script\\missions\\dailytasklink\\head.lua");
Include("\\script\\programs\\perfectmagic.lua");

DLT_NEED_FREE_CELL = 5;
function DLT_CheckFreeCell()
	if (CalcFreeItemCell() < DLT_NEED_FREE_CELL) then
		Say("CÇn Ýt nhÊt " .. DLT_NEED_FREE_CELL .. " « trèng trong hµnh trang.", 0)
		return 0
	end
	return 1
end

function main(nNpcIdx)
	if (DISABLEPROG_RACE > 0) then --khãa ®ua top
		Talk(1, "", 1431)
		return
	end
	if (ENABLE_DAILYTASK == 0) then
		Talk(1, "", 1318)
		return
	end
	if (GetLevel() < 40) then
		Talk(1, "",
			"B¹n trÎ h·y ch¨m chØ luyÖn tËp. Khi ®¹t cÊp 40 ®Õn ®©y, ta sÏ cho ng­¬i vµi kh¶o nghiÖm víi phÇn th­ëng rÊt lín.")
		return
	end
	DLT_Enter(nNpcIdx)
end;

function DLT_Enter(nNpcIdx)
	local nSettingsIdx = GetNpcSetIdx(nNpcIdx);
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	if (state == 0) then --lÇn ®Çu gÆp
		local nOption = Set5Cell(3, 1, nSettingsIdx)
		SayNew(1661, nOption,
			"§­îc th«i! Ta kh«ng tin cã nhiÖm vô nµo lµm khã ®­îc ta/#DLT_Confirm(" .. nNpcIdx .. ")",
			"Ta muèn biÕt kh¶o nghiÖm cña ng­¬i nãi cã néi dung ra sao/#DLT_Info(" .. nNpcIdx .. ")",
			"Ta bËn råi, kh«ng r¶nh ngåi t¸n gÉu víi «ng/DLT_Exit", GetName())
		return
	elseif (state == 1) then --®· nhËn nhiÖm vô
		local tasktype = Get1Cell(nTaskVal, 2);
		local rowid = Get3Cell(nTaskVal, 3);
		DLT_TalkCurrentTask(nNpcIdx, tasktype, rowid)
	elseif (state == 2) then --®· hoµn thµnh, chê nhËn th­ëng
		DLT_ShowCurPrize()
	elseif (state == 3) then --®· nhËn th­ëng råi -> nv míi
		--check th­ëng mèc ®Æc biÖt (5000 trë lªn (nil))
		local totalnum = g_GetTaskCell(6, TASKBIGQUEST_2, 1)
		local nMark = g_GetTaskCell(3, TASKBIGQUEST_3, 1)
		local nAryIdx = 0
		for i = 1, getn(DLTtbLinkAward) do
			if (totalnum == DLTtbLinkAward[i][1]) then
				nAryIdx = i
				break
			end
		end
		if ((nAryIdx ~= 0) and (DLTtbLinkAward[nAryIdx][2] == nil) and (nMark < nAryIdx)) then
			if (DLTtbLinkAward[nAryIdx][11]) then
				DLT_givespecialprize(DLTtbLinkAward[nAryIdx][11], nAryIdx, nSettingsIdx)
				return
			end
		end
		----------------------------------
		nTaskVal = GetTask(TASKCLEARDAY_3);
		local nDoneTimes = Get2Cell(nTaskVal, 2);
		local maxtask = Get1Cell(nTaskVal, 9) * 10 + MAX_TASKLINK_ADAY;
		if (nDoneTimes >= maxtask) then
			Say(1671, 0, maxtask);
			return
		end
		local nOption = Set5Cell(2, 1, nSettingsIdx)
		SayNew(
			"VÞ ®¹i hiÖp ®· hoµn thµnh <color=yellow>" ..
			nDoneTimes ..
			"<color=white> nhiÖm vô. Ngµy h«m nay cã thÓ thùc hiÖn l¹i <color=yellow>" ..
			(maxtask - nDoneTimes) .. "<color=white> lÇn, ng­¬i cã muèn lµm n÷a kh«ng?",
			nOption,
			"§­¬ng nhiªn, mau cho ta biÕt nhiÖm vô tiÕp theo lµ g×/#DLT_Confirm(" .. nNpcIdx .. ")",
			"§Ó ta nghØ ng¬i mét l¸t ®·! Ta bËn råi/no");
	end
end;

function DLT_Confirm(nNpcIdx)            --nhËn nhiÖm vô
	local tasktype, rowid = dlt_GenQuest(); --t¹o nhiÖm vô
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	nTaskVal = Set1Cell(nTaskVal, 1, 1);
	nTaskVal = Set1Cell(nTaskVal, 2, tasktype);
	nTaskVal = Set3Cell(nTaskVal, 3, rowid);
	SetTask(TASKBIGQUEST_1, nTaskVal);
	g_SetTaskCell(2, TASKCLEARDAY_3, 2, g_GetTaskCell(2, TASKCLEARDAY_3, 2) + 1); --t¨ng sè lÇn nhËn nv trong ngµy
	dlt_newtaskguide(tasktype, rowid, 0);
	--t¹o xong show ra
	DLT_TalkCurrentTask(nNpcIdx, tasktype, rowid)
end;

function DLT_TalkCurrentTask(nNpcIdx, tasktype, rowid)
	local nSettingsIdx = GetNpcSetIdx(nNpcIdx);
	local curtasknum = g_GetTaskCell(6, TASKBIGQUEST_2, 1) + 1;
	local szInfo = "§©y lµ nhiÖm vô thø <color=green>" .. curtasknum ..
	"<color>:<enter>" .. dlt_gettaskinfo(tasktype, rowid);
	local nOption = Set5Cell(5, 1, nSettingsIdx);
	SayNew(szInfo, nOption,
		"BiÕt råi, ®Ó ta hoµn thµnh nhiÖm vô xong míi l¹i t×m ng­¬i/no",
		"Ta ®· hoµn thµnh nhiÖm vô lÇn nµy, xin h·y kiÓm tra l¹i!/#DLT_Done(" .. nNpcIdx .. ")",
		"LËp tøc hoµn thµnh nhiÖm vô/#DLT_DoneNow(" .. nNpcIdx .. ")",
		"NhiÖm vô lÇn nµy khã qu¸! Ta muèn hñy bá kh«ng lµm n÷a!/#DLT_Cancel(" .. nNpcIdx .. ")",
		"Ta muèn biÕt kh¶o nghiÖm cña ng­¬i nãi cã néi dung ra sao/#DLT_Info(" .. nNpcIdx .. ")")
end;

function DLT_DoneNow(nNpcIdx)
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	if (state ~= 1) then
		return
	end
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	local taskvalue = 0;
	if (tasktype == 2) then
		taskvalue = tbDLT_FindGoods[rowid][10] + tbDLT_FindGoods[rowid][11];
	elseif (tasktype == 3) then
		taskvalue = tbDLT_ShowGoods[rowid][5] + tbDLT_ShowGoods[rowid][6];
	elseif (tasktype == 4) then
		taskvalue = tbDLT_FindMaps[rowid][4] + tbDLT_FindMaps[rowid][5];
	elseif (tasktype == 5) then
		taskvalue = tbDLT_UpGrade[rowid][3] + tbDLT_UpGrade[rowid][4];
	elseif (tasktype == 6) then
		taskvalue = tbDLT_WorldMaps[rowid][2] + tbDLT_WorldMaps[rowid][3];
	end
	local needstone = 1;
	if (taskvalue >= 5000000 and taskvalue < 7500000) then --®©y lµ nv cã cÊp ®é phÇn th­ëng cao
		needstone = 2;
	elseif (taskvalue >= 7500000 and taskvalue < 10000000) then
		needstone = 3;
	elseif (taskvalue >= 10000000) then
		needstone = 4;
	end
	if (taskvalue >= 2000000) then --®©y lµ nv cã cÊp ®é phÇn th­ëng cao
		Say(1682, 2,
			"Sö dông " .. needstone .. " viªn Tinh Hång B¶o Th¹ch/#DLT_OKDone(2," .. needstone .. ")",
			"§Ó ta suy nghÜ l¹i ®·/no");
	else --nv b×nh th­êng nhá
		Say(1682, 3,
			"Sö dông L·o TÈu Phôc mÖnh th­/#DLT_OKDone(1,0)",
			"Sö dông " .. needstone .. " viªn Tinh Hång B¶o Th¹ch/#DLT_OKDone(2," .. needstone .. ")",
			"§Ó ta suy nghÜ l¹i ®·/no");
	end
end;

function DLT_OKDone(nType, needstone)
	if (g_GetTaskCell(1, TASKBIGQUEST_1, 1) ~= 1) then
		return
	end
	if (nType == 1) then
		if (GetItemCount(1326) < 1) then
			Say("B¹n trÎ ®· quªn mang theo L·o TÈu Phôc MÖnh th­ råi!", 0)
			return
		end
		if (DLT_CheckFreeCell() == 0) then
			return
		end
		DLT_statedonetask()
		DelItem(1326)
	else
		if (GetItemCount(353) < needstone) then
			Say("B¹n trÎ kh«ng cã ®ñ " .. needstone .. " viªn Tinh Hång B¶o Th¹ch råi!", 0)
			return
		end
		if (DLT_CheckFreeCell() == 0) then
			return
		end
		DLT_statedonetask()
		DelItem(353, 4, needstone)
	end
end;

function DLT_statedonetask()
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	nTaskVal = Set1Cell(nTaskVal, 1, 2); --state hoµn thµnh
	nTaskVal = Set1Cell(nTaskVal, 2, 0);
	nTaskVal = Set3Cell(nTaskVal, 3, 0);
	SetTask(TASKBIGQUEST_1, nTaskVal);
	local curtasknum = g_GetTaskCell(6, TASKBIGQUEST_2, 1) + 1;
	g_SetTaskCell(6, TASKBIGQUEST_2, 1, curtasknum); --t¨ng tæng sè lÇn hoµn thµnh
	local tbprize = dlt_genprize(tasktype, rowid, curtasknum);
	local strTab = {};
	for i = 1, 3 do
		local uiType = tbDLT_PriceType[tbprize[i][1]][1]
		if (tbprize[i][1] == tltprizetype_money) then
			tinsert(strTab,
				"Ng©n l­îng " .. GetTask(TASK_DLTPRIZEMONEY) .. "/" .. uiType .. "/#DLT_giveaward(" .. tbprize[i][1] ..
				")")
		elseif (tbprize[i][1] == tltprizetype_exp) then
			tinsert(strTab,
				"Kinh nghiÖm " .. GetTask(TASK_DLTPRIZEEXP) .. "/" .. uiType .. "/#DLT_giveaward(" .. tbprize[i][1] ..
				")")
		elseif (tbprize[i][1] == tltprizetype_randexp or tbprize[i][1] == tltprizetype_randmoney
				or tbprize[i][1] == tltprizetype_randscriptitem) then
			tinsert(strTab, "PhÇn th­ëng ngÉu nhiªn/" .. uiType .. "/#DLT_giveaward(" .. tbprize[i][1] .. ")")
		elseif (tbprize[i][1] == tltprizetype_canceltask) then
			tinsert(strTab, "NhËn mét c¬ héi hñy bá nhiÖm vô/" .. uiType .. "/#DLT_giveaward(" .. tbprize[i][1] .. ")")
		else
			tinsert(strTab, DLTtbBasicAward[tbprize[i][2]][12] .. "/" .. uiType .. "/#DLT_giveaward(" ..
			tbprize[i][1] .. ")")
		end
	end
	dlt_newtaskguide(tasktype, rowid, 1)
	ShowPrize(1673, strTab)
end;

function DLT_Cancel(nNpcIdx)
	local myTaskCancel = g_GetTaskCell(1, TASKBIGQUEST_1, 3)
	if (myTaskCancel == 0) then
		Say(1674, 3,
			"§óng, ta kh«ng muèn lµm nhiÖm vô quû qu¸i nµy ®©u/#DLT_NormalCancel(" .. nNpcIdx .. ")",
			"Ta muèn sö dông 100 m¶nh S¬n Hµ X· T¾c ®Ó hñy bá nhiÖm vô lÇn nµy/#DLT_SHXTCancel(" .. nNpcIdx .. ")",
			"Uhm! §Ó ta suy nghÜ l¹i ®·/no");
	else
		Say(1675, 2,
			"§óng, ta kh«ng muèn lµm nhiÖm vô quû qu¸i nµy ®©u/#DLTTask_Cancel(" .. nNpcIdx .. ",1)",
			"Uhm! §Ó ta suy nghÜ l¹i ®·/no", myTaskCancel);
	end
end;

DLTCANCELbySHXTNUM = 12
function DLT_SHXTCancel(nNpcIdx)
	local nCancelTimes = g_GetTaskCell(2, TASKCLEARDAY_3, 3);
	if (nCancelTimes >= DLTCANCELbySHXTNUM) then --hñy nhiÒu lÇn qu¸ (trong ngµy)
		Give(1685, "/#DLTCancelItem(" .. nNpcIdx .. ",2)", "/no")
	else
		DLTTask_Cancel(nNpcIdx, 2)
	end
end;

function DLT_NormalCancel(nNpcIdx)
	local nCancelTimes = g_GetTaskCell(1, TASKBIGQUEST_3, 4);
	if (nCancelTimes >= 9) then --hñy nhiÒu lÇn qu¸
		Give(1680, "/#DLTCancelItem(" .. nNpcIdx .. ",1)", "/no")
	else
		Say(1679, 2,
			"§õng l«i th«i n÷a! Ta kh«ng muèn lµm nhiÖm vô quû qu¸i nµy ®©u/#DLTTask_Cancel(" .. nNpcIdx .. ",1)",
			"Th«i ®Ó ta suy nghÜ l¹i ®·!/no");
	end
end;

function DLTCancelItem(nNpcIdx, nType)
	if (g_GetTaskCell(1, TASKBIGQUEST_1, 1) ~= 1) then
		return
	end
	local itemidx, count = 0, 0;
	for i = 0, 5 do
		for j = 0, 3 do
			local nIdx, t, g, d, p, l, s, r = GetItemParam(pos_compound, i, j)
			if (nIdx > 0) then
				if (t == 0 and g == 4 and (d == 238 or d == 239 or d == 240)) then
					itemidx = nIdx;
				end
				count = count + 1;
			end
			if (count > 1) then
				Say(1681, 0)
				return
			end
		end
	end
	if (itemidx == 0 or count == 0) then
		Say(1681, 0)
		return
	end
	RemoveItem(itemidx, 1)
	DLTTask_Cancel(nNpcIdx, nType)
end;

function DLTTask_Cancel(nNpcIdx, nType)
	local nTaskVal = GetTask(TASKBIGQUEST_1)
	if (Get1Cell(nTaskVal, 1) ~= 1) then
		return
	end
	local nTaskClear = GetTask(TASKCLEARDAY_3)
	if (nType == 2) then --hñy b»ng SHXT
		local nCancelSHXT = Get2Cell(nTaskClear, 3);
		if (nCancelSHXT < DLTCANCELbySHXTNUM) then
			local myMapNum = GetTask(TASKVALUE_ATLAT_PIECE)
			if (myMapNum >= 100) then
				myMapNum = myMapNum - 100;
				SetTask(TASKVALUE_ATLAT_PIECE, myMapNum);
				nTaskClear = Set2Cell(nTaskClear, 3, nCancelSHXT + 1);
				Msg2Player(1678, "", myMapNum);
			else
				Say(1676, 0);
				return
			end
		end
	else
		local myTaskCancel = Get1Cell(nTaskVal, 3)
		if (myTaskCancel == 0) then --lµm l¹i tõ ®Çu
			Msg2Player(1677);
			local nCurTaskNum = g_GetTaskCell(6, TASKBIGQUEST_2, 1);
			g_SetTaskCell(6, TASKBIGQUEST_2, 1, 0);
			myTaskCancel = GetTask(TASKBIGQUEST_3);
			local myCancelTimes = Get1Cell(myTaskCancel, 4);
			if (myCancelTimes < 9) then
				SetTask(TASKBIGQUEST_3, Set1Cell(myTaskCancel, 4, myCancelTimes + 1))
			end
			WriteLog(GetAccount(), format("DT cancel <%s> num<%d>\n", GetName(), nCurTaskNum), 1) --ghi theo acc
		else                                                                          --hñy b»ng c¬ héi
			nTaskVal = Set1Cell(nTaskVal, 3, myTaskCancel - 1)
		end
	end
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);

	nTaskVal = Set1Cell(nTaskVal, 1, 3) --®· nhËn th­ëng, chê nv míi
	SetTask(TASKBIGQUEST_1, nTaskVal)

	--- Hñy nhiÖm lµ ph¶i mÊt nhiÖm vô ®ã trong ngµy
	-- local doneTimes = Get2Cell(nTaskClear,2)
	-- if(doneTimes > 0) then
	-- SetTask(TASKCLEARDAY_3, Set2Cell(nTaskClear,2,doneTimes-1)); --gi¶m l¹i 1 lÇn lµm nv trong ngµy
	-- end

	---- §¸nh dÊu ngµy h«m nay ®· hñy nv
	local nTaskCancel = GetTask(TASKCLEARDAY_15);
	SetTask(TASKCLEARDAY_15, SetBit(nTaskCancel, 1, 1));

	dlt_canceltaskguide(tasktype, rowid); --xãa guide
	DLT_Enter(nNpcIdx)
end;

function DLT_Done(nNpcIdx)
	if (DLT_CheckFreeCell() == 0) then
		return
	end
	local tasktype = g_GetTaskCell(1, TASKBIGQUEST_1, 2);
	if (tasktype == 1) then
		Give(1667, "/#DLT_Accept_01(" .. nNpcIdx .. ")", "/no")
	elseif (tasktype == 2) then
		Give(1667, "/#DLT_Accept_02(" .. nNpcIdx .. ")", "/no")
	elseif (tasktype == 3) then
		Give(1667, "/#DLT_Accept_03(" .. nNpcIdx .. ")", "/no")
	elseif (tasktype == 4) then
		DLT_Accept_04(nNpcIdx)
	elseif (tasktype == 5) then
		DLT_Accept_05(nNpcIdx)
	elseif (tasktype == 6) then
		DLT_Accept_06(nNpcIdx)
	end
end;

function DLT_Accept_01(nNpcIdx)
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	if (state ~= 1 or tasktype ~= 1) then
		return
	end

	local nItemIdx, tt, gg, dd, pp, ll, ss, rr, count = 0, 0, 0, 0, 0, 0, 0, 0, 0;
	for i = 0, 5 do
		for j = 0, 3 do
			local nIdx, t, g, d, p, l, s, r = GetItemParam(pos_compound, i, j)
			if (nIdx > 0) then
				nItemIdx, tt, gg, dd, pp, ll, ss, rr = nIdx, t, g, d, p, l, s, r;
				count = count + 1;
			end
			if (count > 1) then
				Say(1668, 0)
				return
			end
		end
	end
	if (nItemIdx == 0 or count == 0) then
		Say(1669, 0)
		return
	end
	if (tt ~= 0
			or gg ~= tbDLT_BuyGoods[rowid][1]
			or dd ~= tbDLT_BuyGoods[rowid][2]
			or pp ~= tbDLT_BuyGoods[rowid][3]
			or ll ~= tbDLT_BuyGoods[rowid][4]
			or ss ~= tbDLT_BuyGoods[rowid][5]) then
		Say(1670, 0)
		return
	end

	DLT_statedonetask()
	RemoveItem(nItemIdx, 1)
end;

function DLT_Accept_02(nNpcIdx)
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	if (state ~= 1 or tasktype ~= 2) then
		return
	end
	if (tbDLT_FindGoods[rowid][33]) then --cã check sè l­îng
		DLT_Accept_02Ex(rowid, tbDLT_FindGoods[rowid][33])
		return
	end
	local nItemIdx, tt, gg, dd, pp, ll, ss, rr, count = 0, 0, 0, 0, 0, 0, 0, 0, 0;
	for i = 0, 5 do
		for j = 0, 3 do
			local nIdx, t, g, d, p, l, s, r = GetItemParam(pos_compound, i, j)
			if (nIdx > 0) then
				nItemIdx, tt, gg, dd, pp, ll, ss, rr = nIdx, t, g, d, p, l, s, r;
				count = count + GetItemStack(nIdx);
			end
			if (count > 1) then
				Say(1668, 0)
				return
			end
		end
	end
	if (nItemIdx == 0 or count == 0) then
		Say(1669, 0)
		return
	end
	if (tt ~= 0
			or gg ~= tbDLT_FindGoods[rowid][1]
			or dd ~= tbDLT_FindGoods[rowid][2]
			or pp ~= tbDLT_FindGoods[rowid][3]
		) then
		Say(1670, 0)
		return
	end
	if ((tbDLT_FindGoods[rowid][4] ~= nil and ll ~= tbDLT_FindGoods[rowid][4])
			or (tbDLT_FindGoods[rowid][5] ~= nil and ss ~= tbDLT_FindGoods[rowid][5])
		) then
		Say(1670, 0)
		return
	end
	if (tbDLT_FindGoods[rowid][6]) then
		local nMARow, nValue = g_FindItemMagic(nItemIdx, tbDLT_FindGoods[rowid][6]);
		if ((nMARow == 0) or (nValue < tbDLT_FindGoods[rowid][8]) or (nValue > tbDLT_FindGoods[rowid][9])) then
			Say(1670, 0)
			return
		end
	end
	DLT_statedonetask()
	RemoveItem(nItemIdx, 1)
end;

function DLT_Accept_02Ex(rowid, needcount)
	for i = 0, 5 do
		for j = 0, 3 do
			local nIdx, t, g, d, p, l, s, r = GetItemParam(pos_compound, i, j)
			if (nIdx > 0) then
				if (t ~= 0
						or g ~= tbDLT_FindGoods[rowid][1]
						or d ~= tbDLT_FindGoods[rowid][2]
						or p ~= tbDLT_FindGoods[rowid][3]) then
					Say(1669, 0)
					return
				end
			end
		end
	end
	local questcount = GetItemCount(tbDLT_FindGoods[rowid][2],
		tbDLT_FindGoods[rowid][1],
		tbDLT_FindGoods[rowid][3], 0, pos_compound);
	if (questcount == 0) then
		Say(1669, 0)
		return
	end
	if (questcount > needcount) then
		Say(1668, 0)
		return
	end
	if (questcount ~= needcount) then
		Say(1670, 0)
		return
	end
	DLT_statedonetask()
	DelRoomItem(room_compound)
end;

function DLT_Accept_03(nNpcIdx)
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	if (state ~= 1 or tasktype ~= 3) then
		return
	end

	local nItemIdx, tt, gg, dd, pp, ll, ss, rr, count = 0, 0, 0, 0, 0, 0, 0, 0, 0;
	for i = 0, 5 do
		for j = 0, 3 do
			local nIdx, t, g, d, p, l, s, r = GetItemParam(pos_compound, i, j)
			if (nIdx > 0) then
				nItemIdx, tt, gg, dd, pp, ll, ss, rr = nIdx, t, g, d, p, l, s, r;
				count = count + 1;
			end
			if (count > 1) then
				Say(1668, 0)
				return
			end
		end
	end
	if (nItemIdx == 0 or count == 0) then
		Say(1669, 0)
		return
	end
	if (gg ~= 0) then
		Say(1670, 0)
		return
	end
	local nMARow, nValue = g_FindItemMagic(nItemIdx, tbDLT_ShowGoods[rowid][1]);
	if ((nMARow == 0) or (nValue < tbDLT_ShowGoods[rowid][3]) or (nValue > tbDLT_ShowGoods[rowid][4])) then
		Say(1670, 0)
		return
	end
	DLT_statedonetask()
end;

function DLT_Accept_04(nNpcIdx)
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	if (state ~= 1 or tasktype ~= 4) then
		return
	end
	local getnum = GetTask(TASK_DLTPRIZEEXP)
	if (getnum < tbDLT_FindMaps[rowid][2]) then
		Say(1670, 0)
		return
	end
	DLT_statedonetask()
end;

function DLT_Accept_05(nNpcIdx)
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	if (state ~= 1 or tasktype ~= 5) then
		return
	end
	local savelevel = Get3Cell(nTaskVal, 2);
	local detailtype = tbDLT_UpGrade[rowid][1];
	local getnum = GetTask64(TASK_DLTPRIZEEXP); --møc ®iÓm cò
	if (detailtype == 1) then
		local curlevel = GetLevel();
		if (savelevel > curlevel) then --®· trïng sinh sau khi nhËn nv
			DLT_statedonetask() --> tù ®éng hoµn thµnh
			return
		end
		local curExp = GetExp();
		if (savelevel == curlevel) then
			getnum = curExp - getnum;
		else
			getnum = GetLevelExp(savelevel) - getnum + curExp; --møc kn cßn l¹i cña savelv + kn hiÖn t¹i cña cÊp nµy
			for i = savelevel + 1, curlevel - 1 do    --céng tiÕp kn cña c¸c cÊp gi÷a 2 cÊp nÕu cã
				getnum = getnum + GetLevelExp(i)
			end
		end
	elseif (detailtype == 2) then
		getnum = GetRepute() - getnum;
	elseif (detailtype == 3) then
		getnum = GetGrace() - getnum;
	elseif (detailtype == 4) then
		getnum = GetSJPoint() - getnum;
	else
		getnum = 0;
	end
	if (getnum < tbDLT_UpGrade[rowid][2]) then
		Say(1687, 0, (tbDLT_UpGrade[rowid][2] - getnum))
		return
	end
	DLT_statedonetask()
end;

function DLT_Accept_06(nNpcIdx)
	local nTaskVal = GetTask(TASKBIGQUEST_1);
	local state = Get1Cell(nTaskVal, 1);
	local tasktype = Get1Cell(nTaskVal, 2);
	local rowid = Get3Cell(nTaskVal, 3);
	if (state ~= 1 or tasktype ~= 6) then
		return
	end
	-- local getnum = GetTask(TASKVALUE_ATLAT_PIECE) - GetTask(TASK_DLTPRIZEEXP);
	local getnum = GetTask(TASKVALUE_ATLAT_PIECE);
	if (getnum < tbDLT_WorldMaps[rowid][1]) then
		Say(1687, 0, (tbDLT_WorldMaps[rowid][1] - getnum))
		return
	end
	-- trõ sè m¶nh s¬n x· t¾c ®ang cã ra
	local nSub = getnum - tbDLT_WorldMaps[rowid][1];
	SetTask(TASKVALUE_ATLAT_PIECE, nSub);
	Msg2Player("Sè l­îng m¶nh S¬n Hµ X· T¾c cña ®¹i hiÖp gi¶m <color=red>" ..
	tbDLT_WorldMaps[rowid][1] .. "<color> cßn <color=green>" .. nSub .. "<color> m¶nh");
	DLT_statedonetask()
end;

function DLT_ShowCurPrize()
	local nTaskVal = GetTask(TASKBIGQUEST_2)
	local item = g_GetTaskCell(3, TASKBIGQUEST_1, 2);
	local strTab = {};
	for i = 1, 3 do
		local prizetype = Get1Cell(nTaskVal, i + 6) --« 7 8 9
		local uiType = tbDLT_PriceType[prizetype][1]
		if (prizetype == tltprizetype_money) then
			tinsert(strTab, "Ng©n l­îng " .. GetTask(TASK_DLTPRIZEMONEY) ..
			"/" .. uiType .. "/#DLT_giveaward(" .. prizetype .. ")")
		elseif (prizetype == tltprizetype_exp) then
			tinsert(strTab, "Kinh nghiÖm " .. GetTask(TASK_DLTPRIZEEXP) ..
			"/" .. uiType .. "/#DLT_giveaward(" .. prizetype .. ")")
		elseif (prizetype == tltprizetype_randexp or prizetype == tltprizetype_randmoney
				or prizetype == tltprizetype_randscriptitem) then
			tinsert(strTab, "PhÇn th­ëng ngÉu nhiªn/" .. uiType .. "/#DLT_giveaward(" .. prizetype .. ")")
		elseif (prizetype == tltprizetype_canceltask) then
			tinsert(strTab, "NhËn mét c¬ héi hñy bá nhiÖm vô/" .. uiType .. "/#DLT_giveaward(" .. prizetype .. ")")
		else
			tinsert(strTab, DLTtbBasicAward[item][12] .. "/" .. uiType .. "/#DLT_giveaward(" .. prizetype .. ")")
		end
	end
	ShowPrize(1673, strTab)
end;

function DLT_giveaward(prizetype)
	if (g_GetTaskCell(1, TASKBIGQUEST_1, 1) ~= 2) then
		return
	end
	if (DLT_CheckFreeCell() == 0) then
		return
	end
	local bMatched = 0;
	local nTaskVal = GetTask(TASKBIGQUEST_2)
	for i = 1, 3 do
		if (prizetype == Get1Cell(nTaskVal, i + 6)) then --« 7 8 9
			bMatched = i
			break
		end
	end
	if (bMatched == 0) then --kh«ng khíp khi nhËn th­ëng
		return
	end
	if (prizetype == tltprizetype_money or prizetype == tltprizetype_randmoney) then --tiÒn
		local nAward = GetTask(TASK_DLTPRIZEMONEY)
		if (prizetype == tltprizetype_randmoney) then
			if (g_RandPercent(60) == 1) then
				nAward = nAward + floor((nAward * 8) / 100);
			else
				nAward = nAward - floor((nAward * 5) / 100);
			end
		end
		Earn(nAward)
		Msg2Player("Hoµn thµnh nhiÖm vô nhËn ®­îc <color=green>" .. nAward .. "<color=white> ng©n l­îng");
	elseif (prizetype == tltprizetype_exp or prizetype == tltprizetype_randexp) then --kn
		local nAward = GetTask(TASK_DLTPRIZEEXP)
		if (prizetype == tltprizetype_randexp) then
			if (g_RandPercent(60) == 1) then
				nAward = nAward + floor((nAward * 8) / 100);
			else
				nAward = nAward - floor((nAward * 5) / 100);
			end
		end
		--céng dån kinh nghiÖm
		local nCurExp = GetExp();
		if (nCurExp ~= nil) then
			local nAddExp = nAward;
			local nNextExp = GetExpNext();
			if (nNextExp > 0) then
				local nReNeedExp = nNextExp - nCurExp; --phÇn kinh nghiÖm cÇn ®Ó lªn cÊp
				while (nAddExp > 0 and nReNeedExp > 0) do
					AddOwnExp(nAddExp);
					nAddExp = nAddExp - nReNeedExp;
					nReNeedExp = GetExpNext();
				end
			end
		end
		Msg2Player("Hoµn thµnh nhiÖm vô nhËn ®­îc <color=green>" .. nAward .. "<color=white> ®iÓm kinh nghiÖm");
	elseif (prizetype == tltprizetype_canceltask) then
		local nCancel = g_GetTaskCell(1, TASKBIGQUEST_1, 3); --sè lÇn hñy bá nv
		if (nCancel < 9) then
			g_SetTaskCell(1, TASKBIGQUEST_1, 3, nCancel + 1)
		end
		Msg2Player("B¹n nhËn ®­îc <color=green>Mét c¬ héi hñy bá nhiÖm vô");
	elseif (prizetype == tltprizetype_randscriptitem or prizetype == tltprizetype_scriptitem
			or prizetype == tltprizetype_golditem or prizetype == tltprizetype_purpleitem
			or prizetype == tltprizetype_stone) then --vËt phÈm
		if (DLT_CheckFreeCell() == 0) then
			return
		end
		local item = g_GetTaskCell(3, TASKBIGQUEST_1, 2);
		local idx = AddItemTemp(DLTtbBasicAward[item][1],
			DLTtbBasicAward[item][2],
			DLTtbBasicAward[item][3],
			DLTtbBasicAward[item][4],
			DLTtbBasicAward[item][5],
			DLTtbBasicAward[item][6],
			DLTtbBasicAward[item][7],
			DLTtbBasicAward[item][8]);
		if (idx > 0) then
			if (DLTtbBasicAward[item][9] > 0) then
				SetItemDate(idx, DLTtbBasicAward[item][9], 0)
			end
			AddItemIdx(idx)
			if (DLTtbBasicAward[item][1] == 2) then
				AddGlobalCountNews("Ng­êi ch¬i " .. GetName() ..
				" Hoµn thµnh nhiÖm vô D· TÈu nhËn ®­îc Trang BÞ Hoµng Kim", 1, 1)
			end
			Msg2Player("Hoµn thµnh nhiÖm vô nhËn ®­îc phÇn th­ëng <color=green>" .. GetItemName(idx))
		end
	end
	g_SetTaskCell(1, TASKBIGQUEST_1, 1, 3);
	local curtasknum = g_GetTaskCell(6, TASKBIGQUEST_2, 1);
	dlt_giveprizelink(curtasknum); --th­ëng theo mèc tæng nv
	--loop 5 nv d· tÈu
	local nTaskClear = GetTask(TASKCLEARDAY_3);
	local dayTimes = Get2Cell(nTaskClear, 2); --sè lÇn lµm trong ngµy

	--- Edit: Duc Huynh
	local nIsCancel = GetBit(GetTask(TASKCLEARDAY_15), 1); --- ch­a hñy nv d· tÈu míi dc nhËn th­ëng
	-- if(GetLevel() >= 40 and dayTimes >= MAX_TASKLINK_ADAY and nIsCancel <=0 ) then	--th­ëng trong ngµy mçi 25nv
	if (dayTimes >= MAX_TASKLINK_ADAY and nIsCancel <= 0) then --th­ëng trong ngµy mçi 25nv
		local recvcell = Get1Cell(nTaskClear, 2);          --- kiÓm tra ®¶m b¶o chØ nhËn 1 lÇn
		if recvcell <= 0 then
			SetTask(TASKCLEARDAY_3, Set1Cell(nTaskClear, 2, recvcell + 1));
			g_DLTGivePrizeLoop();
		end
	end

	-- event 01/06/2026 (th­ëng 1 nv)
	-- Duc_GiveKeoCam(1);
	-- Duc_GiveThiep(1, 1);

	-- local idscprit = FileName2Id("\\script\\event\\01062026\\helper.lua");
	-- ExeScript(idscprit,0,"Duc_GiveKeoCam",1);---- Npc sù kiÖn 0106
	-- ExeScript(idscprit,0,"Duc_GiveThiep",1,1);---- Npc sù kiÖn 0106


	-- local idscprit = FileName2Id("\\script\\event\\vulan\\helper.lua");
	-- ExeScript(idscprit,0,"Duc_GiveBongHong",1);---- even vu lan
	-- ExeScript(idscprit,0,"Duc_GiveThiep",1,1);---- even vu lan

	-- local idscprit = FileName2Id("\\script\\event\\trungthu\\helper.lua");
	-- ExeScript(idscprit,0,"DucTT_GiveHatSen",1);---- Npc sù kiÖn trung thu
	-- ExeScript(idscprit,0,"DucTT_GiveLongDen",1,1);---- Npc sù kiÖn trung thu

	local idscprit = FileName2Id("\\script\\event\\quockhanh0209\\helper.lua");
	ExeScript(idscprit, 0, "QK_GiveVongHoaCaNhan", 1);
	----- kÕt thóc -----


	--if(ENABLE_EVENT_3004 == 1) then
	--	if(CalcFreeItemCell() < 1) then
	--		Talk(1,"","B¹n kh«ng ®ñ « trèng nªn sÏ mÊt phÇn th­ëng sù kiÖn.")
	--		return
	--	end

	--	local idx = AddItemTemp(0,6,3,4985,0,5,1)
	--	LockItem(idx)
	--	SetItemDate(idx,EVENT_3004_ENDDATE[1],EVENT_3004_ENDDATE[2],EVENT_3004_ENDDATE[3],EVENT_3004_ENDDATE[4],EVENT_3004_ENDDATE[5])
	--	AddItemIdx(idx);
	--	Msg2Player("NhËn ®­îc 1 c¸i hu©n ch­¬ng chiÕn c«ng")
	--end
	----- kÕt thóc -----

	-- if(GetLevel() >= 60 and dayTimes >= 5) then	--th­ëng trong ngµy mçi 5nv
	-- local nMoreTimes = Get1Cell(nTaskClear,9)
	-- local nGetPrize = mod(dayTimes,5)
	-- local recvcell = Get1Cell(nTaskClear,2)
	-- if((nGetPrize == 0) and (recvcell == (dayTimes/5-1))) then
	-- SetTask(TASKCLEARDAY_3,Set1Cell(nTaskClear,2,recvcell+1))
	-- g_DLTGivePrizeLoop(dayTimes,nMoreTimes)
	-- end
	-- end
end;

function DLT_Info(nNpcIdx)
	Talk(4, "#DLT_Enter(" .. nNpcIdx .. ")", 1663, 1664, 1665, 1666)
end;

function DLT_Exit()
	if (GetSex() == 0) then
		Say(1662, 0, "®¹i hiÖp")
	else
		Say(1662, 0, "n÷ hiÖp")
	end
end;

--mèc th­ëng ®Æc biÖt ®å hkmp >>
function DLT_givespecialprize(pricetype, arymark, nSettingsIdx)
	if (pricetype == 1) then
		local nOption = Set5Cell(2, 1, nSettingsIdx)
		SayNew(
			GetName() ..
			" - VÞ ®©y ®· hoµn thµnh chuçi kh¶o nghiÖm " ..
			DLTtbLinkAward[arymark][1] ..
			" nhiÖm vô, xøng ®¸ng nhËn ®­îc phÇn th­ëng vinh dù <color=red>1 Trang bÞ Hoµng Kim m«n ph¸i<color=white>. §· s½n sµng lùa chän ch­a?",
			nOption,
			"B¾t ®Çu nhËn th­ëng/#DLT_HKMPprize(" .. arymark .. ")",
			"§Ó ta c©n nh¾c l¹i/no")
	elseif (pricetype == 2) then
		local nOption = Set5Cell(3, 1, nSettingsIdx)
		SayNew(
			"VÞ anh hïng ®· hoµn thµnh chuçi kh¶o nghiÖm " ..
			DLTtbLinkAward[arymark][1] ..
			" nhiÖm vô, vinh quang mµ ai còng mong cÇu, nhËn ®­îc <color=red>1 V« Danh tù chän<color=white>. H·y lùa chän:",
			nOption,
			"V« Danh ChØ Hoµn/#DLT_VDprize(" .. arymark .. ",1)",
			"V« Danh Giíi ChØ/#DLT_VDprize(" .. arymark .. ",2)",
			"§Ó ta suy nghÜ ®·/no")
	elseif (pricetype == 3) then
		local nOption = Set5Cell(2, 1, nSettingsIdx)
		local taskval = GetTask(TASKBIT_GETPRIZE)
		if (GetBit(taskval, 24) == 0) then
			SayNew(
				GetName() ..
				" - VÞ ®©y ®· hoµn thµnh chuçi kh¶o nghiÖm " ..
				DLTtbLinkAward[arymark][1] .. " nhiÖm vô, xøng ®¸ng nhËn ®­îc phÇn th­ëng vinh dù. " ..
				"Tr­íc tiªn h·y nhËn <color=yellow>1 Hoµng Kim B¶o R­¬ng<color=white>.\nSau ®ã ng­¬i sÏ cã mét c¬ héi ®Ó n©ng cÊp:\n<color=metal>1 Trang bÞ [Hoµn Mü] Hoµng Kim m«n ph¸i<color=white> trë thµnh\n<color=white>Trang bÞ B¹ch Kim [cÊp 11]",
				nOption,
				"NhËn Hoµng Kim B¶o R­¬ng/DLT_18Kprize1",
				"Ta sÏ nhËn sau/")
		else
			nOption = Set5Cell(3, 1, nSettingsIdx)
			SayNew(
				GetName() ..
				" - VÞ ®©y ®· hoµn thµnh chuçi kh¶o nghiÖm " ..
				DLTtbLinkAward[arymark][1] .. " nhiÖm vô, ®· nhËn 1 Hoµng Kim B¶o R­¬ng råi.\n" ..
				"Giê ®©y lµ c¬ héi n©ng cÊp <color=metal>1 Trang bÞ [Hoµn Mü] Hoµng Kim m«n ph¸i<color=white> trë thµnh <color=white>Trang bÞ B¹ch Kim [cÊp 11]<color=white>. H·y tham kh¶o thuéc tÝnh d­íi ®©y kü l­ìng tr­íc khi x¸c ®Þnh chän trang bÞ ®Ó n©ng cÊp.",
				nOption,
				"B¾t ®Çu n©ng cÊp trang bÞ B¹ch Kim cÊp 11/#DLT_18KStart(" .. arymark .. ")",
				"Tham kh¶o thuéc tÝnh ma ph¸p sau khi hoµn thµnh/#DLT_18KPreview(0)",
				"§Ó ta c©n nh¾c l¹i/")
		end
	end
end;

function DLT_18KStart(arymark)
	Give(
	"N©ng cÊp B¹ch Kim [cÊp 11]\n§Æt vµo duy nhÊt 1 trang bÞ [Hoµn Mü] Hoµng Kim m«n ph¸i. Sau khi x¸c nhËn, ta sÏ dïng bÝ thuËt ®Ó biÕn ®æi thµnh trang bÞ B¹ch Kim Hoµn Mü.",
		"/#DLT_18KUp(" .. arymark .. ")", "/")
end;

function DLT_18KUp(arymark)
	local nOldIdx, t, g, d, p, l, s, r = 0, 0, 0, 0, 0, 0, 0, 0; --trang bÞ HM HKMP
	local count = 0;
	for i = 0, 5 do
		for j = 0, 3 do
			local nIdx, ct, cg, cd, cp, cl, cs, cr = GetItemParam(pos_compound, i, j)
			if (nIdx > 0) then
				count = count + 1;
				if (count > 1) then
					Say(
					"Ta ®· nãi râ ng­¬i chØ cÇn ®Æt vµo duy nhÊt 1 Trang bÞ Hoµn Mü Hoµng Kim m«n ph¸i th«i. Sao l¹i ®Æt lung tung?",
						2, "§Æt l¹i/#DLT_18KStart(" .. arymark .. ")", "Rêi khái/")
					return
				end
				nOldIdx, t, g, d, p, l, s, r = nIdx, ct, cg, cd, cp, cl, cs, cr;
			end
		end
	end
	if (count == 0) then
		Say("Ta kh«ng thÊy trang bÞ nµo ®Ó n©ng cÊp c¶?! L·o hoa m¾t ch¨ng?", 2, "§Æt l¹i/#DLT_18KStart(" .. arymark ..
		")", "Rêi khái/")
		return
	end
	if (t ~= 2 or r < 3241 or r > 3380) then
		Say("§©y kh«ng ph¶i Trang bÞ [Hoµn Mü] Hoµng Kim m«n ph¸i! Ng­¬i l¹i trªu l·o giµ nµy råi?!", 2,
			"§Æt l¹i/#DLT_18KStart(" .. arymark .. ")", "Rêi khái/")
		return
	end
	local nEqdetail, row = 0, (r - 3239);
	for i = 1, getn(tbPERFECTMAGIC) do
		if (row == tbPERFECTMAGIC[i][1]) then
			nEqdetail = i;
			break
		end
	end
	if (nEqdetail == 0) then
		Say("RÊt tiÕc! Trang bÞ nµy kh«ng thÓ n©ng cÊp thµnh trang bÞ B¹ch Kim.", 2,
			"§Æt l¹i/#DLT_18KStart(" .. arymark .. ")", "Rêi khái/")
		return
	end
	local lock, minute = GetItemLock(nOldIdx);
	if (lock > 0 or minute > 0) then
		Say("Trang bÞ ®· khãa kh«ng thÓ thùc hiÖn n©ng cÊp.", 2, "§Æt l¹i/#DLT_18KStart(" .. arymark .. ")", "Rêi khái/")
		return
	end
	local nNewIdx = AddItemTemp(3, 0, r - 2, 0, 11, 0, 0, 0)
	if (nNewIdx == 0) then
		Say("T¹m thêi ta ch­a thÓ thùc hiÖn n©ng cÊp. Ng­¬i h·y trë l¹i sau.")
		return
	end
	local msktype, msktypef, msklv, mskdt = GetItemMask(nOldIdx);
	if (msktype > 0) then
		local curplayer = PlayerIndex;
		PlayerIndex = 0;
		SetItemMaskEx(nNewIdx, msktype, msktypef, msklv, mskdt);
		PlayerIndex = curplayer;
	end
	for i = 1, 6 do
		local mtype, value1, value2 = GetItemMagic(nOldIdx, i)
		if (mtype <= 0) then
			break
		end
		SetItemMagic(nNewIdx, i, mtype, value1, value2)
	end
	local stype1, v1, v2, stype2, v12, v22 = GetItemSmelt(nOldIdx);
	SetItemSmelt(nNewIdx, stype1, v1, v2, stype2, v12, v22)
	SetItemValue(nNewIdx, 4, 8)
	gGenPlatinaMagic(11, nNewIdx, r - 2, 10)
	AddItemIdx(nNewIdx)
	g_SetTaskCell(3, TASKBIGQUEST_3, 1, arymark)
	RemoveItem(nOldIdx, 1)
	local name = GetName();
	local iname = GetItemName(nNewIdx);
	Msg2Player("Chóc mõng! B¹n nhËn ®­îc <color=white>Trang BÞ B¹ch Kim [cÊp 11] " .. iname)
	AddGlobalNews("<color=cyan>" ..
	name .. "<color=white> hoµn thµnh 18.000 nhiÖm vô D· TÈu cã ®­îc <color=white>[B¹ch Kim] " .. iname)
	WriteLog("DLT18000prize_" .. GetServerIdx() .. ".txt",
		format("acc<%s> role<%s> lan2 <BK><%s>", GetAccount(), name, iname))
end;

defMAX_ITEM_APAGE = 10
defSTRSayPFView =
"Trang bÞ Hoµn Mü Sau khi thµnh B¹ch Kim cÊp 11 sÏ <color=pink>gi÷ nguyªn thuéc tÝnh<color=white>, ®ång thêi t¹o thªm <color=white>2 dßng thuéc tÝnh míi<color=white>, h·y chän trang bÞ mµ ng­¬i muèn xem 2 thuéc tÝnh nµy:"
function DLT_18KPreview(nPage)
	local nTotal = getn(tbPERFECTMAGIC);
	if (nTotal == 0) then
		Say("HiÖn thêi kh«ng cã th«ng tin trang bÞ B¹ch Kim")
		return
	end
	local tpage = nPage;
	local nBegin = tpage * defMAX_ITEM_APAGE + 1;
	if (nBegin > nTotal) then
		tpage = 0
		nBegin = tpage * defMAX_ITEM_APAGE + 1;
	end
	local nEnd = nBegin + defMAX_ITEM_APAGE - 1;
	if (nEnd > nTotal) then
		nEnd = nTotal
	end
	local tbSay = {};
	for i = nBegin, nEnd do
		tinsert(tbSay, i .. ". " .. tbPERFECTMAGIC[i][2] .. "/#DLT_18KViewDetail(" .. i .. "," .. nPage .. ")")
	end
	if (nEnd < nTotal) then
		tinsert(tbSay, "Trang kÕ/#DLT_18KPreview(" .. (tpage + 1) .. ")")
	end
	if (nBegin > defMAX_ITEM_APAGE) then
		tinsert(tbSay, "Trang tr­íc/#DLT_18KPreview(" .. (tpage - 1) .. ")")
	end
	tinsert(tbSay, "Rêi khái/")
	Say(defSTRSayPFView, getn(tbSay), tbSay)
end;

function DLT_18KViewDetail(nItemId, curpage)
	if (not tbPERFECTMAGIC[nItemId]) then
		Say("HiÖn thêi kh«ng cã th«ng tin trang bÞ B¹ch Kim")
		return
	end
	local szSay = "Trang bÞ B¹ch Kim <color=white>[Hoµn Mü] " ..
	tbPERFECTMAGIC[nItemId][2] .. "[cÊp 11]<color=white> t¨ng thªm 2 dßng thuéc tÝnh:";
	local maid = 0;
	for i = 1, getn(tbPFMADESC) do
		if (tbPERFECTMAGIC[nItemId][17] == tbPFMADESC[i][1]) then
			maid = i;
			break
		end
	end
	if (maid == 0) then
		Say("HiÖn thêi kh«ng cã th«ng tin trang bÞ B¹ch Kim")
		return
	end
	szSay = szSay ..
	"\n<color=metal>Dßng thø 1<color=white>: " ..
	tbPFMADESC[maid][2] ..
	" tõ " .. tbPERFECTMAGIC[nItemId][18] .. " ®Õn " .. tbPERFECTMAGIC[nItemId][19] .. " " .. tbPFMADESC[maid][3];

	maid = 0;
	for i = 1, getn(tbPFMADESC) do
		if (tbPERFECTMAGIC[nItemId][20] == tbPFMADESC[i][1]) then
			maid = i;
			break
		end
	end
	if (maid == 0) then
		Say("HiÖn thêi kh«ng cã th«ng tin trang bÞ B¹ch Kim")
		return
	end
	szSay = szSay ..
	"\n<color=metal>Dßng thø 2<color=white>: " ..
	tbPFMADESC[maid][2] ..
	" tõ " .. tbPERFECTMAGIC[nItemId][21] .. " ®Õn " .. tbPERFECTMAGIC[nItemId][22] .. " " .. tbPFMADESC[maid][3];

	Say(szSay, 2,
		"Trë l¹i xem trang bÞ kh¸c/#DLT_18KPreview(" .. curpage .. ")",
		"Ta ®· hiÓu råi/")
end;

function DLT_18Kprize1()
	if (CalcFreeItemCell() < 1) then
		Say(
		"PhÇn th­ëng rÊt quý, c¸c h¹ s¾p xÕp hµnh trang trèng l¹i ®i. R¬i ra ngoµi ta kh«ng chÞu tr¸ch nhiÖm ®©u nhÐ!")
		return
	end
	SetTask(TASKBIT_GETPRIZE, SetBit(GetTask(TASKBIT_GETPRIZE), 24, 1))
	AddItem(6, 1, 2876, 0, 5, 0)
	local name = GetName()
	AddGlobalCountNews(
	"Hoµn thµnh 18.000 nhiÖm vô D· TÈu. <color=green>" ..
	name .. "<color=white> nhËn ®­îc <color=orange>Hoµng Kim B¶o R­¬ng", 1, 1)
	WriteLog("DLT18000prize_" .. GetServerIdx() .. ".txt", format("acc<%s> role<%s> lan1 <hkbr>", GetAccount(), name))
end;

function DLT_HKMPprize(arymark)
	local nFact = GetFactionNum()
	if (nFact < 0) then
		Talk(1, "", "Ta thùc sù kh«ng nhËn ra ng­¬i thuéc m«n ph¸i nµo ®Ó trao phÇn th­ëng")
		return
	end
	DLT_selHKMP(arymark, nFact)

	--SayNew("Trang bÞ Hoµng Kim m«n ph¸i gåm cã thËp ®¹i ph¸i trang bÞ. B¾t ®Çu chän ph¸i ®i:",11,
	--"ThiÕu L©m/#DLT_selHKMP("..arymark..",0)",
	--"Thiªn v­¬ng/#DLT_selHKMP("..arymark..",1)",
	--"§­êng m«n/#DLT_selHKMP("..arymark..",2)",
	--"Ngò ®éc/#DLT_selHKMP("..arymark..",3)",
	--"Nga My/#DLT_selHKMP("..arymark..",4)",
	--"Thóy Yªn/#DLT_selHKMP("..arymark..",5)",
	--"C¸i Bang/#DLT_selHKMP("..arymark..",6)",
	--"Thiªn NhÉn/#DLT_selHKMP("..arymark..",7)",
	--"Vâ §ang/#DLT_selHKMP("..arymark..",8)",
	--"C«n L«n/#DLT_selHKMP("..arymark..",9)",
	--"Ta c©n nh¾c l¹i ®·/no")
end;

function DLT_selHKMP(arymark, sel)
	if (not tbBaseHKMPItem[sel]) then
		return
	end
	local tbSay = {};
	for i = 1, getn(tbBaseHKMPItem[sel]) do
		tinsert(tbSay, tbBaseHKMPItem[sel][i].name .. "/#DLT_selHKMPbr(" .. arymark .. "," .. sel .. "," .. i .. ")")
	end
	tinsert(tbSay, "Ta c©n nh¾c l¹i ®·/no")
	SayNew("Bé trang bÞ " .. tbFactName[sel] .. " bao gåm c¸c ®­êng vâ c«ng sau, h·y chän ®i:", getn(tbSay), tbSay)
end;

function DLT_selHKMPbr(arymark, sel, branch)
	if (not tbBaseHKMPItem[sel] or not tbBaseHKMPItem[sel][branch]) then
		return
	end
	local tbSay = {};
	for i = 1, getn(tbBaseHKMPItem[sel][branch].item) do
		tinsert(tbSay,
			tbBaseHKMPItem[sel][branch].item[i][2] .. "/#DLT_dselHKMP(" .. arymark .. "," ..
			sel .. "," .. branch .. "," .. i .. ")")
	end
	tinsert(tbSay, "Ta c©n nh¾c l¹i ®·/no")
	SayNew(
	"Bé trang bÞ " ..
	tbFactName[sel] ..
	" [" .. tbBaseHKMPItem[sel][branch].name .. "] bao gåm c¸c trang bÞ sau, h·y lùa chän ®óng thø ng­¬i muèn:",
		getn(tbSay), tbSay)
end;

function DLT_dselHKMP(arymark, sel, branch, inum)
	if (not DLTtbLinkAward[arymark] or not tbBaseHKMPItem[sel] or not tbBaseHKMPItem[sel][branch] or not tbBaseHKMPItem[sel][branch].item[inum]) then
		return
	end
	if (HaveSpace(1, 1) == 0) then
		Say("PhÇn th­ëng lÇn nµy rÊt quý gi¸, ng­¬i h·y s¾p xÕp hµnh trang 8 « trèng (2x4) ®Ó nhËn!", 0)
		return
	end
	g_SetTaskCell(3, TASKBIGQUEST_3, 1, arymark)
	AddItemG(tbBaseHKMPItem[sel][branch].item[inum][1], 30);
	AddGlobalNews("<color=green>" ..
	GetName() ..
	"<color=white> hoµn thµnh " ..
	DLTtbLinkAward[arymark][1] ..
	" nhiÖm vô D· TÈu nhËn ®­îc phÇn th­ëng tèi cao <color=orange>" .. tbBaseHKMPItem[sel][branch].item[inum][2])
	WriteLog("DLT5000prize_" .. GetServerIdx() .. ".txt",
		format("acc<%s> role<%s> item<%s>", GetAccount(), GetName(), tbBaseHKMPItem[sel][branch].item[inum][2]))
end;

function DLT_VDprize(arymark, sel)
	if (not DLTtbLinkAward[arymark]) then
		return
	end
	if (HaveSpace(1, 1) == 0) then
		Say("PhÇn th­ëng lÇn nµy rÊt quý gi¸, ng­¬i h·y s¾p xÕp hµnh trang ®Ó nhËn!", 0)
		return
	end
	g_SetTaskCell(3, TASKBIGQUEST_3, 1, arymark)
	local idx = 0;
	if (sel == 1) then
		idx = AddItemG(140, 0)
	else
		idx = AddItemG(141, 0)
	end
	local name = GetName();
	local iname = GetItemName(idx);
	AddGlobalNews("<color=green>" ..
	name ..
	"<color=white> hoµn thµnh " ..
	DLTtbLinkAward[arymark][1] .. " nhiÖm vô D· TÈu nhËn ®­îc phÇn th­ëng tèi cao <color=orange>" .. iname)
	WriteLog("DLT10000prize_" .. GetServerIdx() .. ".txt", format("acc<%s> role<%s> item<%s>", GetAccount(), name, iname))
end;

tbFactName = {
	[0] = "ThiÕu L©m Ph¸i",
	[1] = "Thiªn V­¬ng Bang",
	[2] = "§­êng M«n",
	[3] = "Ngò §éc Gi¸o",
	[4] = "Nga Mi Ph¸i",
	[5] = "Thóy Yªn M«n",
	[6] = "C¸i Bang",
	[7] = "Thiªn NhÉn Gi¸o",
	[8] = "Vâ §ang Ph¸i",
	[9] = "C«n L«n Ph¸i",
	[10] = "Hoa S¬n Ph¸i",
};

tbBaseHKMPItem = {
	[0] = {
		[1] = {
			name = "QuyÒn Ph¸p",
			item = {
				{ 0, "Méng Long ChÝnh Hång T¨ng M·o" },
				{ 1, "Méng Long Kim Ti ChÝnh Hång Cµ Sa" },
				{ 2, "Méng Long HuyÒn Ti Ph¸t ®¸i" },
				{ 3, "Méng Long PhËt Ph¸p HuyÒn Béi" },
				{ 4, "Méng Long §¹t Ma T¨ng hµi" },
			}
		},
		[2] = {
			name = "C«n Ph¸p",
			item = {
				{ 5, "Phôc Ma Tö Kim C«n" },
				{ 6, "Phôc Ma HuyÒn Hoµng Cµ Sa" },
				{ 7, "Phôc Ma ¤ Kim NhuyÔn §iÒu" },
				{ 8, "Phôc Ma PhËt T©m NhuyÔn KhÊu" },
				{ 9, "Phôc Ma Phæ §é T¨ng hµi" },
			}
		},
		[3] = {
			name = "§ao Ph¸p",
			item = {
				{ 10, "Tø Kh«ng Gi¸ng Ma Giíi ®ao" },
				{ 11, "Tø Kh«ng Tö Kim Cµ Sa" },
				{ 12, "Tø Kh«ng Hé ph¸p Yªu ®¸i" },
				{ 13, "Tø Kh«ng NhuyÔn B× Hé UyÓn" },
				{ 14, "Tø Kh«ng Giíi LuËt Ph¸p giíi" },
			}
		}
	},

	[1] = {
		[1] = {
			name = "Chïy Ph¸p",
			item = {
				{ 15, "H¸m Thiªn Kim Hoµn §¹i Nh·n ThÇn Chïy" },
				{ 16, "H¸m Thiªn Vò ThÇn T­¬ng Kim Gi¸p" },
				{ 17, "H¸m Thiªn Uy Vò Thóc yªu ®¸i" },
				{ 18, "H¸m Thiªn Hæ ®Çu KhÈn Thóc UyÓn" },
				{ 19, "H¸m Thiªn Thõa Long ChiÕn Ngoa" },
			}
		},
		[2] = {
			name = "Th­¬ng Ph¸p",
			item = {
				{ 20, "KÕ NghiÖp B«n L«i Toµn Long th­¬ng" },
				{ 21, "KÕ NghiÖp HuyÒn Vò Hoµng Kim Kh¶i" },
				{ 22, "KÕ NghiÖp B¹ch Hæ V« Song khÊu" },
				{ 23, "KÕ NghiÖp Háa V©n Kú L©n Thñ " },
				{ 24, "KÕ NghiÖp Chu T­íc L¨ng V©n Ngoa" },
			}
		},
		[3] = {
			name = "§ao Ph¸p",
			item = {
				{ 25, "Ngù Long L­îng Ng©n B¶o ®ao" },
				{ 26, "Ngù Long ChiÕn ThÇn Phi Qu¶i gi¸p" },
				{ 27, "Ngù Long Thiªn M«n Thóc Yªu hoµn" },
				{ 28, "Ngù Long TÊn Phong Hé UyÓn" },
				{ 29, "Ngù Long TuyÖt MÖnh ChØ hoµn" },
			}
		}
	},

	[2] = {
		[1] = {
			name = "Phi §ao",
			item = {
				{ 70, "B¨ng Hµn §¬n ChØ Phi §ao" },
				{ 71, "B¨ng Hµn HuyÒn Y Thóc Gi¸p" },
				{ 72, "B¨ng Hµn T©m TiÔn Yªu KhÊu" },
				{ 73, "B¨ng Hµn HuyÒn Thiªn B¨ng Háa Béi" },
				{ 74, "B¨ng Hµn NguyÖt ¶nh Ngoa" },
			}
		},
		[2] = {
			name = "Tô TiÔn",
			item = {
				{ 75, "Thiªn Quang Hoa Vò M¹n Thiªn" },
				{ 76, "Thiªn Quang §Þnh T©m Ng­ng ThÇn Phï " },
				{ 77, "Thiªn Quang S©m La Thóc §¸i" },
				{ 78, "Thiªn Quang Song B¹o Hµn ThiÕt Tr¹c" },
				{ 79, "Thiªn Quang Thóc Thiªn Ph­îc §Þa Hoµn" },
			}
		},
		[3] = {
			name = "Phi Tiªu",
			item = {
				{ 80, "S©m Hoang Phi Tinh §o¹t Hån" },
				{ 81, "S©m Hoang Kim TiÒn Liªn Hoµn Gi¸p" },
				{ 82, "S©m Hoang Hån Gi¶o Yªu Thóc" },
				{ 83, "S©m Hoang HuyÒn ThiÕt T­¬ng Ngäc Béi" },
				{ 84, "S©m Hoang Tinh VÉn Phi Lý " },
			}
		},
		[4] = {
			name = "C¹m BÉy",
			item = {
				{ 85, "§Þa Ph¸ch Ngò hµnh Liªn Hoµn Qu¸n" },
				{ 86, "§Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn" },
				{ 87, "§Þa Ph¸ch TÝch LÞch L«i Háa Giíi" },
				{ 88, "§Þa Ph¸ch KhÊu T©m tr¹c" },
				{ 89, "§Þa Ph¸ch §Þa Hµnh Thiªn Lý Ngoa" },
			}
		}
	},

	[3] = {
		[1] = {
			name = "Ch­ëng Ph¸p",
			item = {
				{ 55, "U Lung Kim Xµ Ph¸t ®¸i" },
				{ 56, "U Lung XÝch YÕt MËt trang" },
				{ 57, "U Lung Thanh Ng« TriÒn yªu" },
				{ 58, "U Lung Ng©n ThÒm Hé UyÓn" },
				{ 59, "U Lung MÆc Thï NhuyÔn Lý " },
			}
		},
		[2] = {
			name = "§ao Ph¸p",
			item = {
				{ 60, "Minh ¶o Tµ S¸t §éc NhËn" },
				{ 61, "Minh ¶o U §éc ¸m Y" },
				{ 62, "Minh ¶o §éc YÕt ChØ Hoµn" },
				{ 63, "Minh ¶o Hñ Cèt Hé uyÓn" },
				{ 64, "Minh ¶o Song Hoµn Xµ Hµi" },
			}
		},
		[3] = {
			name = "Bïa Chó",
			item = {
				{ 65, "Chó Ph­îc Ph¸ gi¸p ®Çu hoµn" },
				{ 66, "Chó Ph­îc DiÖt L«i C¶nh Phï " },
				{ 67, "Chó Ph­îc U ¶o ChØ Hoµn" },
				{ 68, "Chó Ph­îc Xuyªn T©m §éc UyÓn" },
				{ 69, "Chó Ph­îc B¨ng Háa Thùc Cèt Ngoa" },
			}
		}
	},

	[4] = {
		[1] = {
			name = "KiÕm Ph¸p",
			item = {
				{ 30, "V« Gian û Thiªn KiÕm" },
				{ 31, "V« Gian Thanh Phong Truy Y" },
				{ 32, "V« Gian PhÊt V©n Ti ®¸i" },
				{ 33, "V« Gian CÇm VËn Hé UyÓn" },
				{ 34, "V« Gian B¹ch Ngäc Bµn ChØ " },
			}
		},
		[2] = {
			name = "Ch­ëng Ph¸p",
			item = {
				{ 35, "V« Ma Ma Ni qu¸n" },
				{ 36, "V« Ma Tö Kh©m Cµ Sa" },
				{ 37, "V« Ma B¨ng Tinh ChØ Hoµn" },
				{ 38, "V« Ma TÈy T­îng Ngäc KhÊu " },
				{ 39, "V« Ma Hång Truy NhuyÔn Th¸p hµi" },
			}
		},
		[3] = {
			name = "Hç Trî",
			item = {
				{ 40, "V« TrÇn Ngäc N÷ Tè T©m qu¸n" },
				{ 41, "V« TrÇn Thanh T©m H­íng ThiÖn Ch©u" },
				{ 42, "V« TrÇn Tõ Bi Ngäc Ban ChØ " },
				{ 43, "V« TrÇn PhËt T©m Tõ H÷u Yªu Phèi" },
				{ 44, "V« TrÇn PhËt Quang ChØ Hoµn" },
			}
		}
	},

	[5] = {
		[1] = {
			name = "§¬n §ao",
			item = {
				{ 45, "Tª Hoµng Phông Nghi ®ao" },
				{ 46, "Tª Hoµng TuÖ T©m Khinh Sa Y" },
				{ 47, "Tª Hoµng Phong TuyÕt B¹ch V©n Thóc §¸i" },
				{ 48, "Tª Hoµng B¨ng Tung CÈm uyÓn" },
				{ 49, "Tª Hoµng Thóy Ngäc ChØ Hoµn" },
			}
		},
		[2] = {
			name = "Song §ao (ch­ëng)",
			item = {
				{ 50, "BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao" },
				{ 51, "BÝch H¶i Hoµn Ch©u Vò Liªn" },
				{ 52, "BÝch H¶i Hång Linh Kim Ti ®¸i" },
				{ 53, "BÝch H¶i Hång L¨ng Ba" },
				{ 54, "BÝch H¶i Khiªn TÕ ChØ hoµn" },
			}
		}
	},

	[6] = {
		[1] = {
			name = "Ch­ëng Ph¸p",
			item = {
				{ 90, "§ång Cõu Phi Long §Çu hoµn" },
				{ 91, "§ång Cõu Gi¸ng Long C¸i Y" },
				{ 92, "§ång Cõu TiÒm Long Yªu §¸i" },
				{ 93, "§ång Cõu Kh¸ng Long Hé UyÓn" },
				{ 94, "§ång Cõu KiÕn Long Ban ChØ " },
			}
		},
		[2] = {
			name = "Bæng Ph¸p",
			item = {
				{ 95, "§Þch Kh¸i Lôc Ngäc Tr­îng" },
				{ 96, "§Þch Kh¸i Cöu §¹i C¸i Y" },
				{ 97, "§Þch Kh¸i TriÒn M·ng yªu ®¸i" },
				{ 98, "§Þch Kh¸i CÈu TÝch B× Hé uyÓn" },
				{ 99, "§Þch Kh¸i Th¶o Gian Th¹ch giíi" },
			}
		}
	},

	[7] = {
		[1] = {
			name = "M©u Ph¸p",
			item = {
				{ 100, "Ma S¸t Quû Cèc U Minh Th­¬ng" },
				{ 101, "Ma S¸t Tµn D­¬ng ¶nh HuyÕt Gi¸p" },
				{ 102, "Ma S¸t XÝch Ký Táa Yªu KhÊu" },
				{ 103, "Ma S¸t Cö Háa Liªu Thiªn uyÓn" },
				{ 104, "Ma S¸t V©n Long Thæ Ch©u giíi" },
			}
		},
		[2] = {
			name = "§ao Ph¸p (ch­ëng)",
			item = {
				{ 110, "Ma ThÞ LiÖt DiÖm Qu¸n MiÖn" },
				{ 111, "Ma ThÞ LÖ Ma PhÖ T©m Liªn" },
				{ 112, "Ma ThÞ NghiÖp Háa U Minh Giíi" },
				{ 113, "Ma ThÞ HuyÕt Ngäc ThÊt S¸t Béi" },
				{ 114, "Ma ThÞ S¬n H¶i Phi Hång Lý " },
			}
		},
		[3] = {
			name = "Bïa Chó",
			item = {
				{ 105, "Ma Hoµng Kim Gi¸p Kh«i" },
				{ 106, "Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn" },
				{ 107, "Ma Hoµng Khª Cèc Thóc yªu ®¸i" },
				{ 108, "Ma Hoµng HuyÕt Y Thó Tr¹c" },
				{ 109, "Ma Hoµng §¨ng §¹p Ngoa" },
			}
		}
	},

	[8] = {
		[1] = {
			name = "KhÝ T«ng (ch­ëng)",
			item = {
				{ 115, "L¨ng Nh¹c Th¸i Cùc KiÕm" },
				{ 116, "L¨ng Nh¹c V« Ng· ®¹o bµo" },
				{ 117, "L¨ng Nh¹c Né L«i Giíi" },
				{ 118, "L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi" },
				{ 119, "L¨ng Nh¹c Thiªn §Þa HuyÒn Hoµng giíi" },
			}
		},
		[2] = {
			name = "KiÕm T«ng",
			item = {
				{ 120, "CËp Phong Ch©n Vò KiÕm" },
				{ 121, "CËp Phong Tam Thanh Phï " },
				{ 122, "CËp Phong HuyÒn Ti Tam §o¹n cÈm" },
				{ 123, "CËp Phong Thóy Ngäc HuyÒn Hoµng Béi" },
				{ 124, "CËp Phong Thanh Tïng Ph¸p giíi" },
			}
		}
	},

	[9] = {
		[1] = {
			name = "§ao Ph¸p",
			item = {
				{ 125, "S­¬ng Tinh Thiªn Niªn Hµn ThiÕt" },
				{ 126, "S­¬ng Tinh Ng¹o S­¬ng ®¹o bµo" },
				{ 127, "S­¬ng Tinh Thanh Phong Lò ®¸i" },
				{ 128, "S­¬ng Tinh Thiªn Thanh B¨ng Tinh thñ " },
				{ 129, "S­¬ng Tinh Phong B¹o chØ hoµn" },
			}
		},
		[2] = {
			name = "KiÕm Ph¸p (ch­ëng)",
			item = {
				{ 130, "L«i Khung Hµn Tung B¨ng B¹ch Qu¸n" },
				{ 131, "L«i Khung Thiªn §Þa Hé phï " },
				{ 132, "L«i Khung Phong L«i Thanh CÈm ®¸i" },
				{ 133, "L«i Khung Linh Ngäc UÈn L«i" },
				{ 134, "L«i Khung Cöu Thiªn DÉn L«i giíi" },
			}
		},
		[3] = {
			name = "Bïa Chó",
			item = {
				{ 135, "Vô ¶o B¾c Minh §¹o qu¸n" },
				{ 136, "Vô ¶o Ki B¸n phï chó " },
				{ 137, "Vô ¶o Thóc T©m chØ hoµn" },
				{ 138, "Vô ¶o Thanh ¶nh HuyÒn Ngäc Béi" },
				{ 139, "Vô ¶o Tung Phong TuyÕt ¶nh ngoa" }
			}
		}
	}
};

function no()
end;
