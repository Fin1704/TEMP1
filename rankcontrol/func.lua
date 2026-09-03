Include("\\script\\rankcontrol\\header.lua")
Include("\\script\\trainoff\\head.lua")
function RankCheck(szKey)

end

-- function GetAllRank()
-- local tb = {}	
-- local szPatch = format("%s%s.ini",def_rank_data,GetAccount())
-- for i = 1,getn(TBRankKey) do
-- local nRankTime = GetIniStr(szPatch, TBRankKey[i][2], "TimeEnd") or ""
-- if(nRankTime ~= "") then
-- if IsExpire(nRankTime) == 1 then
-- local nTime = GetRemainMinutes(nRankTime)
-- tinsert(tb,format("%s [HSD: %s]/#SetCRTRank(%d,%d)",TBRankKey[i][1],nRankTime,TBRankKey[i][3],nTime))
-- end

-- end
-- end
-- tinsert(tb,"Kt thc i thoi/no")
-- Say("Kch hot danh hiu",getn(tb),tb)
-- end

function GetAllRank()
	local tb = {}
	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())
	for i = 1, getn(TBRankKey) do
		local nRankTime = GetIniStr(szPatch, TBRankKey[i][2], "TimeEnd") or ""
		if (nRankTime ~= "") then
			if IsExpire(nRankTime) == 1 then
				local nTime = GetRemainMinutes(nRankTime)
				local nLevel = tonumber(GetIniStr(szPatch, TBRankKey[i][2], "Level")) or 20
				tinsert(tb,
					format("%s [HSD: %s]/#SetCRTRank(%d,%d,%d)", TBRankKey[i][1], nRankTime, TBRankKey[i][3], nTime,
						nLevel))
			end
		end
	end
	tinsert(tb, "Kt thc i thoi/no")
	Say("Kch hot danh hiu", getn(tb), tb)
end

-- function SetCRTRank(nSkillID,nTime)
-- AddSkillState(nSkillID, 20, 1,3240000);
--print("SkillInfo",nSkillID, 20, 1,32400)
-- end

function SetCRTRank(nSkillID, nTime, nLevel)
	nLevel = nLevel or 20 --- giu logic cu. Ko co param thu3  la level 20
	-- AddSkillState(nSkillID, nLevel, 1,3240000);
	AddSkillState(nSkillID, nLevel, 1, nTime * 60 * 18);
end

--
function ActiveFullRank()
	for i = 1, getn(TBRankKey) do
		CheckAndLoadCtrRank(i)
	end
end

function CheckAndLoadCtrRank(nRankID)
	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())
	local nRankTime = GetIniStr(szPatch, TBRankKey[nRankID][2], "TimeEnd") or ""
	--print(nRankID,nRankTime)
	if nRankTime ~= "" then
		if IsExpire(nRankTime) == 1 then
			local nTime = GetRemainMinutes(nRankTime)
			local nLevel = tonumber(GetIniStr(szPatch, TBRankKey[nRankID][2], "Level")) or
				20 --- giu logic cu. Ko co param thu3  la level 20
			local nSkillID = TBRankKey[nRankID][3];
			if (nRankID == 1) then
				local nHide = tonumber(GetIniStr(szPatch, TBRankKey[nRankID][2], "HideAura")) or 0;
				if (nHide == 1) then
					-- ?n vòng sáng 1693, dùng 2 skill g?c có s?n (976: 500 máu, 978: 5% kháng)
					AddSkillState(1693, 1, 1, 1);
					AddSkillState(976, 5, 1, nTime * 60 * 18);
					AddSkillState(978, 5, 1, nTime * 60 * 18);
					return
				else
					-- T?t 2 skill ?n, b?t l?i vòng sáng 1693
					AddSkillState(976, 1, 1, 1);
					AddSkillState(978, 1, 1, 1);
					nSkillID = 1693;
				end
			end
			SetCRTRank(nSkillID, nTime, nLevel)
		end
	end
end

-- function AddCRTRankBystr(nRankID,szTime)
-- if(nRankID > getn(TBRankKey)) then
-- Talk(1,"",format("Error Key Rank Error: %d",nRankID))
-- return
-- end
-- local szPatch = format("%s%s.ini",def_rank_data,GetAccount())

-- local szKeySave = TBRankKey[nRankID][2]

-- SetIniStr(szPatch,szKeySave, "TimeEnd",szTime, 1)

-- CheckAndLoadCtrRank(nRankID)
-- end

function AddCRTRankBystr(nRankID, szTime, nLevel)
	if (nRankID > getn(TBRankKey)) then
		Talk(1, "", format("Error Key Rank Error: %d", nRankID))
		return
	end

	nLevel = nLevel or 20; --- giu logic cu. Ko co param thu3  la level 20

	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())

	local szKeySave = TBRankKey[nRankID][2]

	SetIniStr(szPatch, szKeySave, "TimeEnd", szTime, 1)
	SetIniStr(szPatch, szKeySave, "Level", nLevel, 1)

	CheckAndLoadCtrRank(nRankID)
end

-- function AddCRTRank(nRankID,szTime)
-- if(nRankID > getn(TBRankKey)) then
-- Talk(1,"",format("Error Key Rank Error: %d",nRankID))
-- return
-- end
-- local szPatch = format("%s%s.ini",def_rank_data,GetAccount())

-- local szKeySave = TBRankKey[nRankID][2]

-- SetIniStr(szPatch,szKeySave, "TimeEnd",AddMinutesStr(szTime), 1)

-- CheckAndLoadCtrRank(nRankID)

-- print("RankTime:",AddMinutesStr(szTime),szKeySave,szPatch)
-- end


function AddCRTRank(nRankID, szTime, nLevel)
	if (nRankID > getn(TBRankKey)) then
		Talk(1, "", format("Error Key Rank Error: %d", nRankID))
		return
	end

	nLevel = nLevel or 20; --- giu logic cu. Ko co param thu3  la level 20

	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())

	local szKeySave = TBRankKey[nRankID][2]

	SetIniStr(szPatch, szKeySave, "TimeEnd", AddMinutesStr(szTime), 1)
	SetIniStr(szPatch, szKeySave, "Level", nLevel, 1)

	CheckAndLoadCtrRank(nRankID);
end

function IsCRTRankActive(nRankID)
	if (nRankID == nil or nRankID <= 0 or nRankID > getn(TBRankKey)) then
		return 0;
	end
	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())
	local szKeySave = TBRankKey[nRankID][2]
	local nRankTime = GetIniStr(szPatch, szKeySave, "TimeEnd") or ""
	if (nRankTime ~= "" and IsExpire(nRankTime) == 1) then
		return 1;
	end
	return 0;
end

function DelCRTRank(nRankID)
	if (nRankID == nil or nRankID <= 0 or nRankID > getn(TBRankKey)) then
		return 0;
	end
	local nDangCo = IsCRTRankActive(nRankID);
	local szPatch = format("%s%s.ini", def_rank_data, GetAccount())
	local szKeySave = TBRankKey[nRankID][2]
	SetIniStr(szPatch, szKeySave, "TimeEnd", "", 1)
	SetIniStr(szPatch, szKeySave, "Level", 0, 1)
	if (nDangCo == 1) then
		SetCRTRank(TBRankKey[nRankID][3], 1 / 60, 1)
		return 1;
	end
	return 0;
end

function no()

end
