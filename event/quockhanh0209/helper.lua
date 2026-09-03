Include("\\script\\lockprogram.lua")
Include("\\script\\headers\\tasklist.lua")
Include("\\script\\awards\\stackaw.lua")
Include("\\script\\event\\quockhanh0209\\header.lua")
Include("\\script\\event\\quockhanh0209\\sifu_file.lua")
-- Logic Quoc Khanh 02/09.

QK_MSG_END = QKLib_getMsg().End
QK_MSG_KN_END = QKLib_getMsg().EndedKN

function QK_IsEndAt(t)
	local nNow = TimeMinute()
	return nNow >= Date2Min(t.y, t.m, t.d, t.h or 0, t.M or 0)
end

function QKLib_isEnd()
	if (ENABLE_EVENT_QUOCKHANH ~= 1) then return 1 end
	if (QK_IsEndAt(QKLib_getTime().Start)) then
		if (not QK_IsEndAt(QKLib_getTime().End)) then return nil end
	end
	return 1
end

function QK_IsEndKhaoNghiem()
	if (QKLib_isEnd()) then return 1 end
	if (QK_IsEndAt(QKLib_getTime().KN_End)) then return 1 end
	return nil
end

---@return number, number
function QK_GetUseCount(nBox)
	local b = QKLib_get(nBox, QK_Enum_Filter.EVENTBOX)
	if (b == nil) then return 0 end
	local v = GetTask(b.Task)
	if (v == nil) then v = 0 end
	return Get4Cell(v, b.Cell), b.MaxUse
end

function QK_AddUseCount(nBox)
	local b = QKLib_get(nBox, QK_Enum_Filter.EVENTBOX)
	if (b == nil) then return 0 end
	local v = GetTask(b.Task)
	if (v == nil) then v = 0 end
	local n = Get4Cell(v, b.Cell) + 1
	if (n > b.MaxUse) then n = b.MaxUse end
	SetTask(b.Task, Set4Cell(v, b.Cell, n))
	return n, b.MaxUse
end

function QK_GetFlag(t)
	local v = GetTask(t.Task)
	if (v == nil) then v = 0 end
	return Get1Cell(v, t.Cell)
end

function QK_SetFlag(t)
	local v = GetTask(t.Task)
	if (v == nil) then v = 0 end
	SetTask(t.Task, Set1Cell(v, t.Cell, 1))
end

function QK_GetVongSang() return QK_GetFlag(QK_GetRewardVongSang()) end

function QK_SetVongSang() QK_SetFlag(QK_GetRewardVongSang()) end

function QK_GetMaxEvent() return QK_GetFlag(QK_GetRewardMaxEvent()) end

function QK_SetMaxEvent() QK_SetFlag(QK_GetRewardMaxEvent()) end

function QK_GetDateAddDays(nAdd, nHour, nMin)
	if (nHour == nil) then nHour = 12 end
	if (nMin == nil) then nMin = 0 end
	local nY, nM, nD = GetDate()
	local tDim = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
	if (mod(nY, 4) == 0 and mod(nY, 100) ~= 0) or mod(nY, 400) == 0 then tDim[2] = 29 end
	nD = nD + nAdd
	while (nD > tDim[nM]) do
		nD = nD - tDim[nM]
		nM = nM + 1
		if (nM > 12) then
			nM = 1; nY = nY + 1
			if (mod(nY, 4) == 0 and mod(nY, 100) ~= 0) or mod(nY, 400) == 0 then tDim[2] = 29 else tDim[2] = 28 end
		end
	end
	return { nY, nM, nD, nHour, nMin }
end

function QK_TimeToArray(t)
	return { t.y, t.m, t.d, t.h or 0, t.M or 0 }
end

function QK_GetExpiry(nDays)
	if type(nDays) == "table" then return nDays end
	if (nDays == -1) then return QK_TimeToArray(QKLib_getTime().KN_End) end
	if (nDays == -2) then return QK_TimeToArray(QKLib_getTime().End) end
	if (nDays ~= nil and nDays <= -3) then return QK_GetDateAddDays(-nDays) end
	if (nDays == 0 or nDays == nil) then return 0 end
	return nDays
end

function QK_GiveItem(spec, count, nDays, nLock)
	if (spec == nil or count == nil or count <= 0) then return nil end
	return Duc_AddStackMerge(spec.g, spec.d, spec.p, 0, 5, count, QK_GetExpiry(nDays), nLock)
end

function QK_GiveArraySpec(spec, nDays, nLock, nCountOverride)
	if (spec == nil) then return nil end
	local g, d, p, lv, series, count
	if (spec.g ~= nil) then
		g = spec.g; d = spec.d; p = spec.p; lv = 0; series = 5; count = spec.Count or 1
	else
		g = spec[2]; d = spec[3]; p = spec[4]; lv = spec[5] or 0; series = spec[6] or 5; count = spec[7] or 1
	end
	if (nCountOverride ~= nil) then count = nCountOverride end
	if (type(d) == "table") then d = random(d[1], d[2]) end
	if (type(p) == "table") then p = random(p[1], p[2]) end
	if (type(count) == "table") then count = random(count[1], count[2]) end
	if (g == nil or d == nil or p == nil or count == nil or count <= 0) then return nil end
	return Duc_AddStackMerge(g, d, p, lv, series, count, QK_GetExpiry(nDays), nLock)
end

function QKHelper_GiveReward(spec, nDays, nLock)
	if (spec == nil) then return nil end
	if (spec.g ~= nil) then return QK_GiveItem(spec, spec.Count or 1, nDays, nLock) end
	return QK_GiveArraySpec(spec, nDays, nLock)
end

function QK_RollWeighted(t)
	local total = 0
	for i = 1, getn(t) do total = total + (t[i].rate or t[i][1] or 0) end
	if (total <= 0) then return nil end
	local roll = random(1, total)
	local cur = 0
	for i = 1, getn(t) do
		cur = cur + (t[i].rate or t[i][1] or 0)
		if (roll <= cur) then return t[i] end
	end
	return t[getn(t)]
end

function QK_DropEvent(nNpcIdx, lv)
	if (QKLib_isEnd()) then return end
	local drop = QK_GetMaterialDropConfig()
	if (drop == nil) then return end
	local roll = QK_RollWeighted({ { Item = drop.Items[1], rate = drop.Rates[1] }, { Item = drop.Items[2], rate = drop.Rates[2] }, { Item = drop.Items[3], rate = drop.Rates[3] } })
	if (roll == nil) then return end
	local item = QK_getMat(roll.Item)
	local idx = AddItemTemp(0, item.g, item.d, item.p, 0, 5, 1, 0)
	if (idx ~= nil and idx > 0) then
		local e = QKLib_getTime().End
		SetItemDate(idx, e.y, e.m, e.d, e.h or 0, e.M or 0)
		DropItemIdx(nNpcIdx, idx)
	end
end

function QK_AddItem(key, count)
	if (QKLib_isEnd() or count == nil or count <= 0) then return nil end
	if (CalcFreeItemCell() < (1 + 1)) then
		Msg2Player("CÇn Ýt nhÊt <color=red>1 « trèng<color> ®Ó nhËn.")
		return nil
	end
	return QK_GiveItem(QK_getMat(key), count, 0, 0)
end

function QK_GiveVongHoaCaNhan(count)
	if (QKLib_isEnd() or count == nil or count <= 0) then return nil end
	local item = QK_GetVongHoaCaNhan()
	if (item == nil) then return nil end
	return QK_GiveItem(item, count, 0, 0)
end

function QKHelper_Add(hd)
	if (hd == 8) then return QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 1) end
	if (hd == QK_Enum_HD.LIEN_DAU_LOSE) then return QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 5) end
	if (hd == QK_Enum_HD.TONG_KIM) then
		return QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 10)
	end
	if (hd == QK_Enum_HD.PHONG_LANG_DO) then
		QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 10)
		return QK_GiveVongHoaCaNhan(20)
	end
	if (hd == QK_Enum_HD.DA_TAU) then
		QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 10)
		return QK_GiveVongHoaCaNhan(10)
	end
	if (hd == QK_Enum_HD.QUA_HUY_HOANG) then
		QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 10)
		return QK_GiveVongHoaCaNhan(10)
	end
	if (hd == QK_Enum_HD.LIEN_DAU_WIN) then
		QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 10)
		return QK_GiveVongHoaCaNhan(10)
	end
	if (hd == QK_Enum_HD.VA) then
		QK_AddItem(QK_Enum_EventItem.NgoiSaoChienThang, 10)
		return QK_GiveVongHoaCaNhan(20)
	end
	return nil
end

function QK_CalcMaxCraft(nBox)
	local r = QKLib_get(nBox, QK_Enum_Filter.RECIPE)
	if (r == nil) then return 0 end
	local n = 999999
	for i = 1, getn(r) do
		local item = QK_getMat(r[i].Item)
		local need = r[i].Need or 1
		local have = floor(GetItemCount(item.d, item.g, item.p) / need)
		if (have < n) then n = have end
	end
	return n
end

function QK_DoCraft(nBox, nNum)
	if (QKLib_isEnd()) then
		Talk(1, "", QK_MSG_END); return
	end
	local r = QKLib_get(nBox, QK_Enum_Filter.RECIPE)
	if (r == nil) then return end
	local max = QK_CalcMaxCraft(nBox)
	if (nNum == nil or nNum <= 0 or nNum > max) then nNum = max end
	if (nNum <= 0) then
		Talk(1, "", "Kh«ng ®ñ nguyªn liÖu ®Ó ghÐp."); return
	end
	if (CalcFreeItemCell() < 1) then
		Talk(1, "", "CÇn Ýt nhÊt 1 « trèng trong hµnh trang."); return
	end
	for i = 1, getn(r) do
		local item = QK_getMat(r[i].Item)
		DelItem(item.d, item.g, nNum * (r[i].Need or 1), item.p)
	end
	local out = QK_getMat(nBox)
	QK_GiveItem(out, nNum, 0, 0)
	Talk(1, "", "GhÐp thµnh c«ng <color=green>" .. nNum .. "<color> " .. out.Name .. ".")
end

function QK_AskCraft(nBox)
	if (nBox == 1) then GetString("QK_Craft1", "NhËp sè l­îng cÇn ghÐp") end
	if (nBox == 2) then GetString("QK_Craft2", "NhËp sè l­îng cÇn ghÐp") end
	if (nBox == 3) then GetString("QK_Craft3", "NhËp sè l­îng cÇn ghÐp") end
end

function QK_Craft1(num, name) QK_DoCraft(1, num) end

function QK_Craft2(num, name) QK_DoCraft(2, num) end

function QK_Craft3(num, name) QK_DoCraft(3, num) end

function QK_GetPhiVan8Counter()
	local nC = GetIniInt("event\\quockhanh0209\\counterPhiVan8.ini", "PhiVan8", "Counter")
	if (nC == nil) then nC = 0 end
	return nC
end

function QK_SetPhiVan8Counter(nVal)
	SetIniInt("event\\quockhanh0209\\counterPhiVan8.ini", "PhiVan8", "Counter", nVal, 1)
end

function QK_GiveQuanTrangReward(nBox)
	if (nBox == 1) then return nil end
	local reward = QK_GetReward(nBox)
	if (reward == nil) then return nil end
	if (reward.Sure ~= nil) then
		for i = 1, getn(reward.Sure) do
			local row = reward.Sure[i]
			QK_GiveArraySpec(row.Item, row.Days, row.Lock, row.Count)
		end
		return 1
	end
	if (nBox == 3) then
		local nPV8 = QK_GetPhiVan8Counter()
		if (nPV8 < 400) then
			nPV8 = nPV8 + 1
			QK_SetPhiVan8Counter(nPV8)
			if (nPV8 >= 400) then
				local item = { 0, 4, 1504, 1, 0, 5, 1, 0 }
				Msg2SubWorld("<color=yellow>Chóc mõng ®¹i hiÖp " ..
					GetName() .. " may mÀn nhËn ®­îc M¶nh Ngùa Phi V©n (8/8)!<color>")
				WriteLog(GetName() .. " nhËn M¶nh Ngùa Phi V©n (8/8)")
				return QK_GiveArraySpec(item, 0, 0)
			end
		end
	end
	local pool = reward.RewardKey or reward.Reward
	if (pool == nil) then return nil end
	local pick = QK_RollWeighted(pool)
	if (pick == nil or pick[2] == nil) then return nil end
	local spec = pick[2][1]
	local days = pick[2][2]
	local nCount = pick[4]
	return QK_GiveArraySpec(spec, days, pick[3], nCount)
end

function QK_GiveRandomReward(nBox)
	return QK_GiveQuanTrangReward(nBox)
end

function QK_GiveOnePoolReward(pool)
	if (pool == nil) then return nil end
	local pick = QK_RollWeighted(pool)
	if (pick == nil or pick.Spec == nil) then return nil end
	return QK_GiveArraySpec(pick.Spec, pick.Days, pick.Lock)
end

function QK_GiveMilestone(t, nBox)
	AddSumpExp(t.Exp)
	if (t.VongHoa ~= nil and t.VongHoa > 0) then
		QK_GiveItem(QK_GetVongHoaBang(), t.VongHoa, -1, 1)
		QK_GiveItem(QK_GetVongHoaCaNhan(), t.VongHoa, -1, 0)
	end
	if (t.Sure ~= nil) then
		for i = 1, getn(t.Sure) do
			local row = t.Sure[i]
			QK_GiveArraySpec(row.Item or row.Spec, row.Days, row.Lock, row.Count)
		end
	end
	if (t.RandomSets ~= nil) then
		for s = 1, getn(t.RandomSets) do
			local setPool = t.RandomSets[s]
			local pick = QK_RollWeighted(setPool)
			if (pick ~= nil) then
				QK_GiveArraySpec(pick.Item or pick.Spec, pick.Days, pick.Lock, pick.Count)
			end
		end
	end
	if (t.ExtraPool ~= nil) then
		local pick = QK_RollWeighted(t.ExtraPool)
		if (pick ~= nil) then
			QK_GiveArraySpec(pick.Item or pick.Spec, pick.Days, pick.Lock, pick.Count)
		end
	end
	QK_SetFlag(t)
end

function QK_CheckUseMilestone(nBox, nCount, max)
	if not max then max = 1000 end
	if (nCount < max) then return end
	if (nBox == QK_Enum_EventItem.QuanTrangChienCong) then
		local t = QK_GetReward1000(QK_Enum_EventItem.QuanTrangChienCong)
		if (QK_GetFlag(t) == 0) then
			QK_GiveMilestone(t, nBox); Msg2Player("§· ®¹t mèc " .. max .. " Qu©n Trang ChiÕn C«ng")
		end
	elseif (nBox == QK_Enum_EventItem.QuanTrangAnhDung) then
		local t = QK_GetReward1000(QK_Enum_EventItem.QuanTrangAnhDung)
		if (QK_GetFlag(t) == 0) then
			QK_GiveMilestone(t, nBox); Msg2Player("§· ®¹t mèc " .. max .. " Qu©n Trang Anh Dòng")
		end
	end
end

function QK_UseQuanTrang(idx, g, d, p)
	if (QKLib_isEnd()) then
		Talk(1, "", QK_MSG_END); return
	end
	local nBox, name = QK_GetItemByGDP(g, d, p)
	local b = QKLib_get(nBox, QK_Enum_Filter.EVENTBOX)
	if (b == nil) then return end
	if (b.NeedLevel > 0 and GetLevel() < b.NeedLevel) then
		Talk(1, "", "CÇn ®¹t cÊp " .. b.NeedLevel .. " ®Ó sö dông."); return
	end
	local cur, maxCur = QK_GetUseCount(nBox)
	if (cur >= b.MaxUse) then
		Talk(1, "", "§· dung tèi ®a " .. b.MaxUse .. " lÇn."); return
	end
	local needCell = 1
	if (nBox == 2) then
		needCell = 5
		if (cur >= maxCur - 1 and QK_GetFlag(QK_GetReward1000(QK_Enum_EventItem.QuanTrangChienCong)) == 0) then
			needCell = 7
		end
	elseif (nBox == 3) then
		needCell = 2
		if (cur >= maxCur - 1 and QK_GetFlag(QK_GetReward1000(QK_Enum_EventItem.QuanTrangAnhDung)) == 0) then
			local tR1 = QK_GetReward1000(QK_Enum_EventItem.QuanTrangAnhDung)
			needCell = (tR1 and tR1.BagNeed) or 25
		end
	end
	if (CalcFreeItemCell() < needCell) then
		Talk(1, "", "CÇn Ýt nhÊt " .. needCell .. " « hµnh trang ®Ó sö dông."); return
	end
	RemoveItem(idx, 1, 1)
	AddSumpExp(b.Exp)
	local n, maxNBox = QK_AddUseCount(nBox)
	QK_GiveRandomReward(nBox)
	QK_CheckUseMilestone(nBox, n, maxNBox)
	Msg2Player("§· dðng " .. name .. " (" .. n .. "/" .. b.MaxUse .. ").")
end

function QK_AllMax()
	local QTCT, MaxQTCT = QK_GetUseCount(1)
	local QTCC, MaxQTCC = QK_GetUseCount(2)
	local QTAD, MaxQTAD = QK_GetUseCount(3)
	return QTCT >= MaxQTCT and QTCC >= MaxQTCC and QTAD >= MaxQTAD
end

function QK_NhanVongSang()
	local t = QK_GetRewardVongSang()
	if (QKLib_isEnd()) then
		Talk(1, "", QK_MSG_END); return
	end
	if (QK_GetFlag(t) > 0) then
		Talk(1, "", "§· nhËn phÇn th­ìng nµy råi."); return
	end
	if (not QK_AllMax()) then
		Talk(1, "", "Ch­a ®¹t ®iÒu kiÖn (cÇn sö dông tèi ®a c¶ 3 lo¹i Qu©n Trang)."); return
	end
	local e = QKLib_getTime().End
	AddCRTRankBystr(t.Rank, format("%04d-%02d-%02d %02d:%02d:00", e.y, e.m, e.d, e.h or 0, e.M or 0), 1)
	QK_SetFlag(t)
	Talk(1, "", "NhËn Vßng S¸ng Quèc Kh¸nh thµnh c«ng.")
end

function QK_MenuBatTatVongSang()
	local t = QK_GetRewardVongSang()
	if (QK_GetFlag(t) == 0 and IsCRTRankActive(t.Rank) == 0) then
		Talk(1, "", "§¹i hiÖp ch­a nhËn Vßng S¸ng Sù KiÖn hoÆc Vßng S¸ng ®· hÕt h¹n."); return
	end
	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())
	local szKeySave = TBRankKey[t.Rank][2]
	local nHide = tonumber(GetIniStr(szPatch, szKeySave, "HideAura")) or 0
	local szStatus = (nHide == 1) and "<color=red>§ang TÀt<color>" or "<color=green>§ang BËt<color>"
	local tbOpt = {
		"BËt vßng s¸ng (HiÓn thÞ hiÖu øng)/#QK_SetBatTatVongSang(0)",
		"T¾t vßng s¸ng (¢n hiÖu øng, gi÷ thuéc tÝnh)/#QK_SetBatTatVongSang(1)",
		"KÕt thóc ®èi tho¹i/Exit"
	}
	SayNew("Tr¹ng th¸i vßng s¸ng hiÖn t¹i: " .. szStatus .. ".\n§¹i hiÖp muèn thay ®æi tr¹ng th¸i vßng s¸ng kh«ng?",
		getn(tbOpt), tbOpt)
end

function QK_SetBatTatVongSang(nHide)
	local t = QK_GetRewardVongSang()
	if (QK_GetFlag(t) == 0 and IsCRTRankActive(t.Rank) == 0) then
		Talk(1, "", "§¹i hiÖp ch­a nhËn Vßng S¸ng Sù KiÖn hoÆc Vßng S¸ng ®· hÕt h¹n."); return
	end
	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())
	local szKeySave = TBRankKey[t.Rank][2]
	SetIniStr(szPatch, szKeySave, "HideAura", nHide, 1)
	CheckAndLoadCtrRank(t.Rank)
	if (nHide == 1) then
		Talk(1, "", "§· <color=red>t¾t<color> hiÖu øng vßng s¸ng sù kiÖn.\n(Thuéc tÝnh hç trî vÉn ®­îc gi÷ nguyªn.)")
	else
		Talk(1, "", "§· <color=green>bËt<color> hiÖu øng vßng s¸ng sù kiÖn thµnh c«ng.")
	end
end

function QK_NhanMaxEvent()
	local t = QK_GetRewardMaxEvent()
	if (QKLib_isEnd()) then
		Talk(1, "", QK_MSG_END); return
	end
	if (QK_GetFlag(t) > 0) then
		Talk(1, "", "§· nhËn th­ìng Max Event."); return
	end
	if (not QK_AllMax()) then
		Talk(1, "", "CÇn ®¹t tèi ®a Qu©n Trang mçi lo¹i."); return
	end
	AddSumpExp(t.Exp)
	QK_SetFlag(t)
end

function QK_ResetDaily()
	local v = GetTask(TASK2_CLEAR_EVENTQUOCKHANH)
	if (v == nil) then v = 0 end
	v = Set4Cell(v, 2, 0)
	v = Set4Cell(v, 3, 0)
	SetTask(TASK2_CLEAR_EVENTQUOCKHANH, v)
end

function QK_ResetEvent()
	if (QK_IsEndAt(QKLib_getTime().End)) then
		SetTask(TASK1_CLEAR_EVENTQUOCKHANH, 0); SetTask(TASK2_CLEAR_EVENTQUOCKHANH, 0)
		SetTask(TASK3_CLEAR_EVENTQUOCKHANH, 0); SetTask(TASK4_CLEAR_EVENTQUOCKHANH, 0)
		return 1
	end
	return nil
end

function QK_DateToDays(d, m, y)
	local a = floor((14 - m) / 12); local yy = y + 4800 - a; local mm = m + 12 * a - 3
	return d + floor((153 * mm + 2) / 5) + 365 * yy + floor(yy / 4) - floor(yy / 100) + floor(yy / 400) - 32045
end

function QK_KNJoinDays()
	if (GetTongName() == "") then return -1 end
	local d, m, y = GetTongJoinDate(); local yy, mm, dd = GetDate()
	return QK_DateToDays(dd, mm, yy) - QK_DateToDays(d, m, y)
end

function QK_KNParse(v)
	if (v == nil or v == "") then return "", 0 end
	local x = strfind(v, "|", 1, 1); if (x == nil) then return v, 0 end
	local n = tonumber(strsub(v, x + 1)); if (n == nil) then n = 0 end
	return strsub(v, 1, x - 1), n
end

function QK_KNAddList(file, sec, key)
	QKSifu_UpdateList(file, sec, key)
end

function QK_KNDaily()
	local v = GetTask(TASK2_CLEAR_EVENTQUOCKHANH); if (v == nil) then v = 0 end
	return Get4Cell(v, 2)
end

function QK_KNAddDaily(n)
	local v = GetTask(TASK2_CLEAR_EVENTQUOCKHANH); if (v == nil) then v = 0 end
	SetTask(TASK2_CLEAR_EVENTQUOCKHANH, Set4Cell(v, 2, QK_KNDaily() + n))
end

function QK_GetChucPhucDaily()
	local v = GetTask(TASK2_CLEAR_EVENTQUOCKHANH)
	if (v == nil) then v = 0 end
	return Get4Cell(v, 3)
end

function QK_SetChucPhucDaily()
	local v = GetTask(TASK2_CLEAR_EVENTQUOCKHANH)
	if (v == nil) then v = 0 end
	SetTask(TASK2_CLEAR_EVENTQUOCKHANH, Set4Cell(v, 3, 1))
end

function QKKN_NopBang(n)
	if (QK_IsEndKhaoNghiem()) then
		Talk(1, "", QK_MSG_KN_END); return
	end
	if (n == nil or n < 1) then return end
	local c = QK_GetKhaoNghiem(); local id = GetTongID()
	if (id == nil or id <= 0) then
		Talk(1, "", "Ch­a gia nhËp bang héi."); return
	end
	if (QK_KNJoinDays() < c.JoinDay) then
		Talk(1, "", "CÇn vµo bang ®ñ " .. c.JoinDay .. " ngµy."); return
	end
	local left = c.GuildLimit - QK_KNDaily(); if (left <= 0) then
		Talk(1, "", "§· nép ®ñ giíi h¹n h«m nay."); return
	end
	if (n > left) then n = left end
	local item = QK_GetVongHoaBang()
	if (GetItemCount(item.d, item.g, item.p) < n) then
		Talk(1, "", "Kh«ng ®ñ Vßng Hoa [Bang]."); return
	end
	DelItem(item.d, item.g, n, item.p)
	local key = "" .. id;
	local old = QKSifu_Get_VongHoa(c.GuildFile, "GuildLadder", key)
	local name, total = QK_KNParse(old)
	if (name == "") then
		name = GetTongName();
		QK_KNAddList(c.GuildFile, "GuildLadder", key)
	end
	QKSifu_Set_VongHoa(c.GuildFile, "GuildLadder", key, name .. "|" .. (total + n))
	QK_KNAddDaily(n); AddSumpExp(n * c.GuildExp)
	Talk(1, "", "Nép thµnh c«ng " .. n .. " Vßng Hoa [Bang].")
end

function QKKN_NopCaNhan(n)
	if (QK_IsEndKhaoNghiem()) then
		Talk(1, "", QK_MSG_KN_END); return
	end
	if (n == nil or n < 1) then return end
	local c = QK_GetKhaoNghiem(); local item = QK_GetVongHoaCaNhan()
	if (GetItemCount(item.d, item.g, item.p) < n) then
		Talk(1, "", "Kh«ng ®ñ Vßng Hoa [C¸ Nh©n]."); return
	end
	DelItem(item.d, item.g, n, item.p)
	local key = GetAccount();
	local name, total = QK_KNParse(QKSifu_Get_VongHoa(c.PersonalFile, "PersonalLadder", key))
	if (name == "") then
		QK_KNAddList(c.PersonalFile, "PersonalLadder", key)
	end
	QKSifu_Set_VongHoa(c.PersonalFile, "PersonalLadder", key, GetName() .. "|" .. (total + n))
	Talk(1, "", "Nép thµnh c«ng " .. n .. " Vßng Hoa [C¸ Nh©n].")
end

function QKKN_NopAllBang() QKKN_NopBang(GetItemCount(2, 6, 5009)) end

function QKKN_NopAllCaNhan() QKKN_NopCaNhan(GetItemCount(1, 6, 5009)) end

function QK_KNCompare(a, b) return a[2] > b[2] end

function QKKN_ShowRank(file, sec, title)
	local list = QKSifu_Get_VongHoa(file, sec, "LIST"); local rows = {}
	if (list ~= nil and list ~= "") then
		local start = 1;
		local len = strlen(list)
		while (start <= len) do
			local p = strfind(list, ",", start, 1); local key
			if (p == nil) then
				key = strsub(list, start); start = len + 1
			else
				key = strsub(list, start, p - 1); start = p + 1
			end
			local name, n = QK_KNParse(QKSifu_Get_VongHoa(file, sec, key)); if (name ~= "") then
				tinsert(rows,
					{ name, n })
			end
		end
	end
	sort(rows, QK_KNCompare); local text = title
	for i = 1, getn(rows) do if (i <= 20) then text = text .. "\n" .. i .. ". " .. rows[i][1] .. ": " .. rows[i][2] end end
	if (getn(rows) == 0) then text = text .. "\nCh­a cã d÷ liÖu." end
	SayNew(text, 1, { "§ãng/Exit" })
end

function QKKN_ShowGuildRank()
	QKKN_ShowRank(QK_GetKhaoNghiem().GuildFile, "GuildLadder", "BXH Vßng Hoa [Bang]")
end

function QKKN_ShowPersonalRank()
	QKKN_ShowRank(QK_GetKhaoNghiem().PersonalFile, "PersonalLadder", "BXH Vßng Hoa [C¸ Nh©n]")
end

function QK_GetTop1Personal()
	local top1 = CacheOT:Get("DiemTop1KNQK")
	local nameTop1 = CacheOT:Get("NameTop1KNQK")
	if top1 and nameTop1 then
		return top1, nameTop1
	end
	local c = QK_GetKhaoNghiem()
	local list = QKSifu_Get_VongHoa(c.PersonalFile, "PersonalLadder", "LIST")
	local rows = {}
	if (list ~= nil and list ~= "") then
		local start = 1; local len = strlen(list)
		while (start <= len) do
			local p = strfind(list, ",", start, 1); local key
			if (p == nil) then
				key = strsub(list, start); start = len + 1
			else
				key = strsub(list, start, p - 1); start = p + 1
			end
			local val = QKSifu_Get_VongHoa(c.PersonalFile, "PersonalLadder", key)
			local name, n = QK_KNParse(val)
			if (name ~= "") then tinsert(rows, { name, n }) end
		end
	end
	sort(rows, QK_KNCompare)
	if (getn(rows) > 0 and rows[1] ~= nil and rows[1][1] ~= "") then
		CacheOT:Set("DiemTop1KNQK", rows[1][2], 1)
		CacheOT:Set("NameTop1KNQK", ows[1][1], 1)
		return rows[1][1], rows[1][2]
	end
	return "Ch­a X¸c §Þnh", 0
end

function QK_TuongKhaoNghiem_Main()
	local szTop1Name, nTop1Score = QK_GetTop1Personal()
	local szText = "<color=yellow>T­­îng Kh¶o NghiÖm - " .. szTop1Name .. "<color>\n\n"
		..
		"Vinh danh ®¹t <color=gold>TOP 1 §ua Top C¸ Nh©n<color> víi thµnh tÝch <color=green>" ..
		nTop1Score .. " Vßng Hoa<color>.\n"
		.. "Mçi ngµy toµn bé ng­­êi ch¬i ®Òu cã thÓ ®Õn Chóc Phóc ®Ó nhËn th­ëng may m¾n.\n"
		.. "Thêi h¹n Chóc Phóc: §Õn hÕt thëi gian Sù KiÖn."
	local tBtn = {
		"Chóc Phóc T­îng Kh¶o NghiÖm/QK_ChucPhucTuong",
		"Xem BXH C¸ Nh©n/QKKN_ShowPersonalRank",
		"Xem BXH Bang/QKKN_ShowGuildRank",
		"KÕt thóc ®èi tho¹i/Exit"
	}
	SayNew(szText, getn(tBtn), tBtn)
end

function QK_ChucPhucTuong()
	if (QKLib_isEnd()) then
		Talk(1, "", QK_MSG_END)
		return
	end
	if (not QK_IsEndKhaoNghiem()) then
		Talk(1, "", "Kh¶o NghiÖm ch­a kÕt thóc, ch­a thÓ chóc phóc.")
		return
	end
	if (QK_GetChucPhucDaily() > 0) then
		Talk(1, "", "H«m nay ®¹i hiÖp ®· Chóc Phóc T­îng Kh¶o NghiÖm råi, ngµy mai h·y quay l¹i nhÐ.")
		return
	end
	local szTop1Name = QK_GetTop1Personal()
	local nExpReward = 20000000
	AddSumpExp(nExpReward)
	QK_SetChucPhucDaily()
	Talk(1, "", "Chóc Phóc thµnh c«ng, nhËn ®­îc <color=green>" .. nExpReward .. " kinh nghiÖm<color>.")
end

function QKKN_Main()
	if (QKLib_isEnd()) then
		Talk(1, "", QK_MSG_END)
		return
	end
	if (QK_IsEndKhaoNghiem()) then
		QK_TuongKhaoNghiem_Main()
		return
	end
	local c = QK_GetKhaoNghiem(); local b = QK_KNDaily()
	local text = "Kh¶o NghiÖm Quèc Kh¸nh\nVßng Hoa [Bang] h«m nay: " .. b .. "/" .. c.GuildLimit
	SayNew(text, 5, {
		"Nép tÊt c¶ Vßng hoa [Bang]/QKKN_NopAllBang",
		"Nép tÊt c¶ Vßng hoa [C¸ Nh©n]/QKKN_NopAllCaNhan",
		"BXH Bang/QKKN_ShowGuildRank",
		"BXH C¸ Nh©n/QKKN_ShowPersonalRank",
		"Dong/Exit" })
end

G_QK_NPC_KHAONGHIEM_IDX = G_QK_NPC_KHAONGHIEM_IDX or nil
G_QK_IS_SPAWNED_TUONG = G_QK_IS_SPAWNED_TUONG or 0
G_QK_NPC_EVENT_LIST = G_QK_NPC_EVENT_LIST or {}
G_QK_EVENT_CLEANED = G_QK_EVENT_CLEANED or 0

function AddNpcEventQuocKhanh()
	if (QKLib_isEnd()) then return end
	local script = FileName2Id("\\script\\event\\quockhanh0209\\npc.lua")
	local maps = { { 53, 51841, 101744 }, { 37, 54703, 99738 }, { 162, 50815, 100424 }, { 80, 56190, 96667 }, { 176, 50434, 94375 }, { 1, 50781, 102118 }, { 11, 100440, 162133 }, { 78, 50745, 103082 } }
	for i = 1, getn(maps) do
		local x = maps[i]; local idx = AddNpc(736, 1, x[1], x[2], x[3], script, 6, "Sù kiÖn Quèc Kh¸nh 2-9"); SetNpcTask(
			idx, 0, 1)
		tinsert(G_QK_NPC_EVENT_LIST, idx)
	end
	if (QK_IsEndKhaoNghiem()) then
		local szTop1Name = QK_GetTop1Personal()
		local szNpcName = "Tuîng Kh¶o NghiÖm - " .. szTop1Name
		G_QK_NPC_KHAONGHIEM_IDX = AddNpc(2354, 1, 53, 51397, 102695, script, 6, szNpcName)
		SetNpcTask(G_QK_NPC_KHAONGHIEM_IDX, 0, 2)
		G_QK_IS_SPAWNED_TUONG = 1
	else
		G_QK_NPC_KHAONGHIEM_IDX = AddNpc(2354, 1, 53, 51397, 102695, script, 6, "Tuîng Kh¶o NghiÖm")
		SetNpcTask(G_QK_NPC_KHAONGHIEM_IDX, 0, 2)
		G_QK_IS_SPAWNED_TUONG = 0
	end
end

function QK_CheckAndSpawnTuong()
	if (QKLib_isEnd()) then
		if (G_QK_EVENT_CLEANED ~= 1) then
			if (G_QK_NPC_KHAONGHIEM_IDX and G_QK_NPC_KHAONGHIEM_IDX > 0) then
				DelNpc(G_QK_NPC_KHAONGHIEM_IDX)
				G_QK_NPC_KHAONGHIEM_IDX = nil
			end
			if (G_QK_NPC_EVENT_LIST) then
				for i = 1, getn(G_QK_NPC_EVENT_LIST) do
					if (G_QK_NPC_EVENT_LIST[i] and G_QK_NPC_EVENT_LIST[i] > 0) then
						DelNpc(G_QK_NPC_EVENT_LIST[i])
					end
				end
				G_QK_NPC_EVENT_LIST = {}
			end
			G_QK_EVENT_CLEANED = 1
		end
		return
	end
	if (QK_IsEndKhaoNghiem() and G_QK_IS_SPAWNED_TUONG == 0) then
		if (G_QK_NPC_KHAONGHIEM_IDX and G_QK_NPC_KHAONGHIEM_IDX > 0) then
			DelNpc(G_QK_NPC_KHAONGHIEM_IDX)
			G_QK_NPC_KHAONGHIEM_IDX = nil
		end
		local script = FileName2Id("\\script\\event\\quockhanh0209\\npc.lua")
		local szTop1Name, nScore = QK_GetTop1Personal()
		local szNpcName = "T­îng kh¶o nghiÖm - " .. szTop1Name
		G_QK_NPC_KHAONGHIEM_IDX = AddNpc(2354, 1, 53, 51397, 102695, script, 6, szNpcName)
		SetNpcTask(G_QK_NPC_KHAONGHIEM_IDX, 0, 2)
		G_QK_IS_SPAWNED_TUONG = 1
	end
end

function QK_OpenHopQua(idx, g, d, p)
	if (QKLib_isEnd()) then
		Talk(1, "", QK_MSG_END); return
	end
	if (CalcFreeItemCell() < 2) then
		Talk(1, "", "CÇn Ýt nhÊt <color=red>2 « trèng<color> trong hµnh trang ®Ó mì Hép quµ quèc kh¸nh.");
		return
	end
	local cfg = QK_GetHopQua()
	if (cfg == nil) then return end
	if (cfg.NeedLevel > 0 and GetLevel() < cfg.NeedLevel) then
		Talk(1, "",
			"§¼ng cÊp yªu cÇu ph¶i trªn " ..
			cfg.NeedLevel .. " míi cã thÓ mì <color=yellow>" .. GetItemName(idx) .. "<color>.");
		return
	end
	local nTaskId = cfg.Task
	local nCell = cfg.Cell
	local nMaxUse = cfg.MaxUse
	local nValue = GetTask(nTaskId)
	if (nValue == nil) then nValue = 0 end
	local curUse = Get1Cell(nValue, nCell)
	if (curUse >= nMaxUse) then
		Talk(1, "",
			"§¹i hiÖp ®· sö dông tèi ®a <color=red>" ..
			nMaxUse .. "<color> <color=yellow>" .. GetItemName(idx) .. "<color> råi.");
		return
	end
	local tRnd = cfg.Random
	local nPick
	if (random(100) <= (tRnd.HiRate or 0)) then
		nPick = random(1, tRnd.HiCount or 1)
	else
		nPick = random(1, getn(tRnd.Reward))
	end
	local tRow = tRnd.Reward[nPick]
	if (tRow == nil) then return end
	local desc = tRow[2][1]
	local days = tRow[2][2] or 0
	local lock = tRow[3] or 0
	RemoveItem(idx, 1, 1)
	SetTask(nTaskId, Set1Cell(nValue, nCell, curUse + 1))
	local nItemIdx = QKHelper_GiveReward(desc, days, lock)
	if (cfg.Exp and cfg.Exp > 0) then AddSumpExp(cfg.Exp) end
	local szName = (nItemIdx and nItemIdx > 0) and GetItemName(nItemIdx) or "vËt phÈm"
	Talk(1, "",
		"§¹i hiÖp mì hép quµ nhËn ®­îc <color=green>" .. szName .. "<color> vµ " .. (cfg.Exp or 0) .. " kinh nghiÖm.")
end
