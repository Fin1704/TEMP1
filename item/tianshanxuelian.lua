Include("\\script\\headers\\sumexp.lua");

local strPath = "Duc_Tstl.ini";
-- local strSection = "ThienSonTuyetLien";
local strSection = "ThienSonTuyetLien_5";

--thi™n s¨n tuy’t li™n
function main(idx)
	local nIdx,t,g,d,p,l,s,r = GetItemProp(idx);
	
	if(t == 0 and g == 6 and d == 1 and p == 1431) then
	Say("LÀp t¯c th®ng c p 70 (n’u Æπi hi÷p d≠Ìi c p 70). NhÀn ngay 200.000.000 Æi”m kinh nghi÷m n’u Æπi hi÷p c p 70 trÎ l™n. Ng≠¨i muËn sˆ dÙng kh´ng?",2,
	"Sˆ dÙng ngay/#now_lvup("..idx..")",
	"Ch≠a c«n/")
	else
	Say("LÀp t¯c th®ng c p 60 (n’u Æπi hi÷p d≠Ìi c p 60). Ng≠¨i muËn sˆ dÙng kh´ng?",2,
	"Sˆ dÙng ngay/#now_lvup("..idx..")",
	"Ch≠a c«n/")
	end
end

function now_lvup(idx)
	if(IsMyItem(idx) == 0) then
		Msg2Player("Thi™n S¨n Tuy’t Li™n Æ∑ m t")
	return end
	local nIdx,t,g,d,p,l,s,r = GetItemProp(idx);
	if(t == 0 and g == 6 and d == 1 and p == 1431) then
		if(GetTransLife() > 0) then
			Msg2Player("Nh©n vÀt Æ∑ trÔng sinh kh´ng th” sˆ dÙng Thi™n S¨n Tuy’t Li™n")
			return
		end
		
		local acc = GetAccount();
		local nUse  = GetIniInt(%strPath, %strSection , acc);
		-- if nUse and nUse > 0 then
		if nUse and nUse >= 1 then
			Msg2Player("MÁi mÔa s˘ ki÷n chÿ c„ th” sˆ dÙng 1 l«n duy nh t "..GetItemName(idx).."");
			return
		end
		local nLevel = GetLevel();
		if(nLevel < 70) then
			SetLevel(70);
			SetIniInt(%strPath, %strSection, acc, nUse+1, 1);
			RemoveItem(idx,1,1)
			Msg2Player("ßπi hi÷p Æ≠Óc th®ng l™n Æºng c p 70.");
			WriteLog("ThienSonTuyetLien_"..date("%Y-%m-%d")..".txt", format("acc<%s> role<%s> use<%d --> %d>",acc,GetName(),nLevel,GetLevel()));
			return
		end
		
		AddSumpExp(200000000);
		SetIniInt(%strPath, %strSection, acc, nUse+1, 1);
		RemoveItem(idx,1,1);
		Msg2Player("ChÛc mıng Æπi hi÷p nhÀn Æ≠Óc 200.000.000 Æi”m kinh nghi÷m");
		WriteLog("ThienSonTuyetLien_"..date("%Y-%m-%d")..".txt", format("acc<%s> role<%s>",acc,GetName()));
		return
	elseif(t == 0 and g == 6 and d == 2 and p == 1431) then
		local nUseLevel = 60;
		if GetLevel() >= nUseLevel then
			Msg2Player("VÀt ph»m nµy chÿ dµnh cho nh©n vÀt c„ Æºng c p th p h¨n 60.")
			return
		end
		SetLevel(nUseLevel);
		RemoveItem(idx,1,1);
		Msg2Player("ChÛc mıng Æπi hi÷p th®ng l™n Æºng c p "..nUseLevel.."");
		WriteLog("TieuThienSonTuyetLien_"..date("%Y-%m-%d")..".txt", format("acc<%s> role<%s>",acc,GetName()));
	end
end;
