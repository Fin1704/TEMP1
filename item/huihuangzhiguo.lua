--Qu¶ huy hoµng
-- 23/9/2020
Include("\\script\\lockprogram.lua");
Include("\\script\\headers\\basesetting.lua");
Include("\\script\\headers\\tasklist.lua");
Include("\\script\\missions\\great_night\\header.lua");
Include("\\script\\headers\\moc_cap_nhat_kinh_nghiem_server1.lua");
Include("\\script\\event\\alphatest\\funct.lua");
Include("\\script\\event\\30042026\\header.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
-- Include("\\script\\event\\trungthu\\helper.lua"); -- event Trung Thu (off - goi qua ExeScript ben duoi)


function main(nItemIdx)
	if (DISABLEPROG_RACE > 0) then --khãa ®ua top
		Talk(1, "", 1431)
		return
	end
	EatFru(nItemIdx)



	--if(ENABLE_EVENT_OP == 1) then
	--	AddRandSeed(0)
	--end
end

function EatFru(nItemIdx)
	if (tbFruitInfo[normalfruit_level] == nil) then
		return
	end

	local nPlayerLevel = GetLevel();
	if (nPlayerLevel < tbFruitInfo[normalfruit_level][3][1] or nPlayerLevel > tbFruitInfo[normalfruit_level][3][2]) then
		local szCanNotMsg = "B¹n kh«ng thÓ ¨n. " .. tbFruitInfo[normalfruit_level][1] .. " chØ dµnh cho cÊp tõ ";
		if (tbFruitInfo[normalfruit_level][3][2] == 200) then
			szCanNotMsg = szCanNotMsg .. tbFruitInfo[normalfruit_level][3][1] .. " trë lªn";
		else
			szCanNotMsg = szCanNotMsg ..
			tbFruitInfo[normalfruit_level][3][1] .. " ®Õn " .. tbFruitInfo[normalfruit_level][3][2];
		end
		Msg2Player(szCanNotMsg)
		return
	end
	local szTaskTB = tbFruitInfo[normalfruit_level][6]

	local nTaskVal = GetTask(TASKCLEARDAY_17)
	local nQHHNum = Get1Cell(nTaskVal, szTaskTB[1]); --sè lÇn ®· c¾n QHH trong ngµya
	local nMaxNum = szTaskTB[2];
	if (GetLevel() < 82) then
		nMaxNum = 2
	end
	if (nQHHNum >= nMaxNum) then --trong ngµy ®· ¨n ®ñ sè lÇn
		local szFruitNumber = nMaxNum .. " qu¶ Huy Hoµng";
		Msg2Player(1335, "", szFruitNumber)
		return
	end

	--30 in dy



	SetTask(TASKCLEARDAY_17, Set1Cell(nTaskVal, szTaskTB[1], nQHHNum + 1))

	local nAddExp = tbFruitInfo[normalfruit_level][5];
	if (normalfruit_level == 1) then
		nAddExp = ChonKinhNghiemTheoMocServer1(2000000, 6000000);
	elseif (normalfruit_level == 3) then
		nAddExp = ChonKinhNghiemTheoMocServer1(5000000, 15000000);
	end
	local nCurExp = GetExp();
	if (nCurExp ~= nil) then
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

	if normalfruit_level == 3 then
		-- Duc_GiveKeoCam(10);

		-- Duc_GiveBongHong(10);
		-- Duc_GiveThiep(10,10);

		-- -- event Trung thu (goi qua ExeScript de khong include helper)
		-- local idscprit = FileName2Id("\\script\\event\\trungthu\\helper.lua");
		-- ExeScript(idscprit,0,"DucTT_GiveHatSen",10);---- Npc sù kiÖn trung thu


		local idscprit = FileName2Id("\\script\\event\\quockhanh0209\\helper.lua");
		ExeScript(idscprit, 0, "QKHelper_Add", 4);
	end

	RemoveItem(nItemIdx, 1)
	WriteLog("an_hh_20_04_96.txt", format("acc<%s> role<%s> an qua hh", GetAccount(), GetName()))

	--if(ENABLE_EVENT_3004 == 1) then
	--	RemoveItem(nItemIdx,1)
	--	itemidx = AddItemTemp(0,6,3,4985,0,5,50)
	--	SetItemDate(itemidx,EVENT_3004_ENDDATE[1],EVENT_3004_ENDDATE[2],EVENT_3004_ENDDATE[3],EVENT_3004_ENDDATE[4],EVENT_3004_ENDDATE[4])
	--	LockItem(itemidx)
	--	AddItemIdx(itemidx);
	--end
end
