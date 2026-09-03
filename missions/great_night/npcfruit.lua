--Qu¶ Huy Hoµng, Qu¶ Hoµng Kim
Include("\\script\\headers\\tasklist.lua");
Include("\\script\\missions\\great_night\\header.lua");
Include("\\script\\event\\dropper.lua");
Include("\\script\\lockprogram.lua");
-- Include("\\script\\event\\01062026\\helper.lua"); -- event 01/06/2026
-- Include("\\script\\event\\vulan\\helper.lua"); -- event Vu Lan
-- Include("\\script\\event\\trungthu\\helper.lua"); -- event Trung Thu (off - goi qua ExeScript ben duoi)

function main(nNpcIdx)
	if (GetPKFlag() == 0) then
		SetPKFlag(1, -1)
	end
	--Process("§ang lÊy d÷ liÖu",10*18,"_Main("..nNpcIdx..")")
	--donepickfruit(nNpcIdx)
	Process("§ang h¸i qu¶...", 10 * 18, "#donepickfruit(" .. nNpcIdx .. ")")
	--_Main(nNpcIdx)
end

function donepickfruit(nNpcIdx)
	if (IsMission(M_GREATNIGHT) == 0) then
		return
	end
	if (CalcFreeItemCell() < 1) then
		Talk(1, "", "CÇn Ýt nhÊt mét « trèng trong hµnh trang míi cã thÓ nhÆt qu¶.")
		return
	end
	if (GetCamp() == 0 or GetFactionNum() < 0) then
		Msg2Player(1321)
		return
	end
	local nLevel = GetNpcTask(nNpcIdx, 0);
	local isgone = GetNpcTask(nNpcIdx, 1);
	if (isgone > 0 or (nLevel < 1) or (nLevel > 4) or (0 == GetFightState()) or (GetLife(GetNpcIdx()) <= 0)) then
		Msg2Player(1322)
		return
	end

	local PLevel = GetLevel();
	if (PLevel < tbFruitInfo[nLevel][3][1] or PLevel > tbFruitInfo[nLevel][3][2]) then
		if (tbFruitInfo[nLevel][3][2] == 200) then
			Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp " .. tbFruitInfo[nLevel][3][1] .. " trë lªn míi cã thÓ h¸i!")
		else
			Msg2Player("Lo¹i qu¶ nµy tõ cÊp " ..
				tbFruitInfo[nLevel][3][1] .. " ®Õn cÊp " .. tbFruitInfo[nLevel][3][2] .. " míi cã thÓ h¸i!")
		end
		return
	end
	local nTaskVal = GetTask(TASKCLEARDAY_1)
	local nQHHNum = Get1Cell(nTaskVal, 1); --sè lÇn ®· lôm QHH trong ngµy
	local nQHKNum = Get1Cell(nTaskVal, 2); --sè lÇn ®· lôm QHK trong ngµy
	if (nLevel == 4) then               --QHK
		if (nQHKNum >= MAX_PICKGOLDFR_COUNT) then
			Msg2Player(1323, "", MAX_PICKGOLDFR_COUNT)
			return
		end
	else
		if (nQHHNum >= MAX_PICKFRUIT_COUNT) then
			Msg2Player(1324, "", MAX_PICKFRUIT_COUNT)
			return
		end
	end
	local nFruitID = GetNpcID(nNpcIdx);
	local nTime = GetCurrentTime();
	--if(GetTaskTemp(TEMP_FRUITIDX) == nFruitID) then	--®óng qu¶ player chän tr­íc
	--local nPlayerTime = GetTaskTemp(TEMP_FRUITCURTIME)
	--if (nTime >= nPlayerTime) then
	local idx = AddItemTemp(0, 6, 1, 904 + nLevel - 1, 0, 5, 0)
	SetItemDate(idx, 7, 0)
	AddItemIdx(idx)
	SetTaskTemp(TEMP_FRUITIDX, 0)
	SetTaskTemp(TEMP_FRUITCURTIME, 0)
	if (nLevel == 4) then
		SetTask(TASKCLEARDAY_1, Set1Cell(nTaskVal, 2, nQHKNum + 1))
	else
		SetTask(TASKCLEARDAY_1, Set1Cell(nTaskVal, 1, nQHHNum + 1))
	end
	SetNpcTask(nNpcIdx, 1, 1); --®¸nh dÊu ®· xãa
	DelNpc(nNpcIdx)
	DelMSNpc(M_GREATNIGHT, nNpcIdx)
	Msg2Player("B¹n nhËn ®­îc 1 " .. tbFruitInfo[nLevel][1]);


	local nTongID = GetTongID();
	if (nTongID ~= 0) then
		Msg2Tong(nTongID, "Nh©n vËt <" .. GetName() .. "> nhÆt thµnh c«ng " .. GetItemName(idx) .. ".")
		Msg2SubWorld("Nh©n vËt <color=yellow><" ..
			GetName() ..
			"><color> bang <color=green>[" ..
			GetTongName() .. "]<color> nhÆt thµnh c«ng <color=cyan>" .. GetItemName(idx) .. "<color>.");
	else
		Msg2SubWorld("Nh©n vËt <color=yellow><" ..
			GetName() ..
			"><color> <color=green>v« hÖ<color> nhÆt thµnh c«ng <color=cyan>" .. GetItemName(idx) .. "<color>.");
	end
	if (nLevel == 4) then
		give_event_qhk()
	else
		if (nLevel == 3) then
			-- event 01/06/2026 (th­ëng khi nhat qua)
			-- Duc_GiveKeoCam(10);
			-- Duc_GiveThiep(20, 20);				

			-- event Trung thu (goi qua ExeScript de khong include helper)
			local idscprit = FileName2Id("\\script\\event\\trungthu\\helper.lua");
			-- ExeScript(idscprit,0,"DucTT_GiveHatSen",10);---- Npc sù kiÖn trung thu
			ExeScript(idscprit, 0, "DucTT_GiveLongDen", 20, 20); ---- Npc sù kiÖn trung thu

			local qkidscprit = FileName2Id("\\script\\event\\quockhanh0209\\helper.lua");
			ExeScript(qkidscprit, 0, "QK_GiveVongHoaCaNhan", 20);
			----- kÕt thóc -----
		end
		give_event_qhh()
	end
	--else
	--	Msg2Player(1326, "", (floor((nPlayerTime-nTime)/18)+1))
	--end
	--else	--chän qu¶ míi
	----	SetTaskTemp(TEMP_FRUITIDX, nFruitID)
	--	SetTaskTemp(TEMP_FRUITCURTIME, nTime+10*18)
	--	Msg2Player(1325)
	--end
end;
