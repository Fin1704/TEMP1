Include("\\script\\event\\quockhanh0209\\helper.lua")
Include("\\script\\event\\quockhanh0209\\buy.lua")
Include("\\script\\event\\quockhanh0209\\crafting.lua")

QK_tbMenu_Main = {
	[1] = {
		"GhÐp Bé Qu©n Trang", "QK_ShowCraftDialog",
		{
			{ "GhÐp Qu©n Trang ChiÕn Th¾ng", format("#QK_ShowCraftDialog(%d)", QK_Enum_EventItem.QuanTrangChienThang) },
			{ "GhÐp Qu©n Trang ChiÕn C«ng",  format("#QK_ShowCraftDialog(%d)", QK_Enum_EventItem.QuanTrangChienCong) },
			{ "GhÐp Qu©n Trang Anh Dòng",    format("#QK_ShowCraftDialog(%d)", QK_Enum_EventItem.QuanTrangAnhDung) },
			{ "§ãng",                        "Exit" }
		}
	},
	[2] = {
		"Mua Bé Qu©n Trang", "#QK_ShowEventBuyDialog(-2)",
		{
			{ "Mua Qu©n Trang ChiÕn C«ng (v¹n + tÝch luü)", format("#QK_ShowEventBuyDialog(%d)", QK_Enum_EventItem.QuanTrangChienCong) },
			{ "Mua Qu©n Trang Anh Dòng (xu + tÝch luü)",    format("#QK_ShowEventBuyDialog(%d)", QK_Enum_EventItem.QuanTrangAnhDung) },
			{ "§ãng",                                       "Exit" }
		}
	},
	[3] = {
		"Mua Nguyªn LiÖu", "#QK_ShowEventBuyDialog(-3)",
		{
			{ "1000 nguyªn liÖu ngÉu nhiªn (xu)",       format("#QK_ShowEventBuyDialog(%d)", QK_Enum_EventItem.Package1000NgauNhien) },
			{ "100 Ng«i Sao ChiÕn ThÀng (xu)",          format("#QK_ShowEventBuyDialog(%d)", QK_Enum_EventItem.NgoiSaoChienThang) },
			{ "1 Ng«i Sao ChiÕn C«ng (v¹n + tÝch luü)", format("#QK_ShowEventBuyDialog(%d)", QK_Enum_EventItem.NgoiSaoChienCong) },
			{ "1 Ng«i Sao Anh Dòng (xu + tÝch luü)",    format("#QK_ShowEventBuyDialog(%d)", QK_Enum_EventItem.NgoiSaoAnhDung) },
			{ "§ãng",                                   "Exit" }
		}
	},

	[4] = { "NhËn Vßng S¸ng Event", "QK_NhanVongSang" },
	[5] = { "BËt T¾t Vßng S¸ng Event", "QK_MenuBatTatVongSang" },
	[6] = { "NhËn th­­ëng mèc Max Event", "QK_NhanMaxEvent" },
	[7] = { "KÕt thóc ®èi tho¹i", "Exit" },
};
function Exit()

end

function main(nNpcIdx)
	local ntype = GetNpcTask(nNpcIdx, 0);
	if ntype == 1 then -- main event
		if (QKLib_isEnd()) then
			Talk(1, "", QKLib_getMsg().End);
			return
		end
		local tBtn = {};
		for i = 1, getn(QK_tbMenu_Main) do
			tinsert(tBtn, QK_tbMenu_Main[i][1] .. "/" .. QK_tbMenu_Main[i][2]);
		end
		local nChienThang, MaxCT = QK_GetUseCount(1);
		local nChienCong, MaxCC  = QK_GetUseCount(2);
		local nAnhDung, MaxAD    = QK_GetUseCount(3);
		local tbEnd              = QKLib_getTime().End
		if (tbEnd.h == nil) then tbEnd.h = 0 end
		if (tbEnd.M == nil) then tbEnd.M = 0 end
		SayNew(
			"Ta phô tr¸ch Sù KiÖn Quèc Kh¸nh 2-9, c¸c vËt phÈm sù kiÖn xuÊt hiÖn khÀp giang hå:\n+ Qu©n Trang ChiÕn ThÀng ( <color=green>" ..
			nChienThang ..
			"<color>/<color=red>" ..
			MaxCT ..
			"<color> ).\n+ Qu©n Trang ChiÕn C«ng ( <color=green>" ..
			nChienCong ..
			"<color>/<color=red>" ..
			MaxCC ..
			"<color> ).\n+ Qu©n Trang Anh Dòng ( <color=green>" ..
			nAnhDung ..
			"<color>/<color=red>" ..
			MaxAD ..
			"<color> ).\nThëi gian kÕt thóc sù kiÖn: <color=red>" ..
			tbEnd.h .. " gië " .. tbEnd.M .. " phót  " .. tbEnd.d .. " - " .. tbEnd.m .. " - " .. tbEnd.y .. "<color>",
			getn(tBtn), tBtn);
	elseif ntype == 2 then
		QKKN_Main();
	end
end

function QK_ShowCraftDialog(nIndex)
	if nIndex == 0 then
		local tBtn = {};
		for i = 1, getn(QK_tbMenu_Main[1][3]) do
			print(QK_tbMenu_Main[1][3][i][1])
			tinsert(tBtn, QK_tbMenu_Main[1][3][i][1] .. "/" .. QK_tbMenu_Main[1][3][i][2]);
		end
		SayNew(
			"Chän lo¹i Qu©n Trang muèn ghÐp:",
			getn(tBtn),
			tBtn
		);
	else
		local tRecipe = QKLib_get(nIndex, QK_Enum_Filter.RECIPE);
		if (not tRecipe) then return end

		local outItem = QK_getMat(nIndex);
		local outName = outItem and outItem.Name or "Qu©n Trang";
		local szText = "Nguyªn liÖu ghÐp <color=yellow>" .. outName .. "<color>:";
		for i = 1, getn(tRecipe) do
			local tMat = QK_getMat(tRecipe[i].Item)
			local tMatNeed = tRecipe[i].Need or 1
			if tMat then
				local nHave = GetItemCount(tMat.d, tMat.g, tMat.p);
				local szColor;
				if (nHave >= tMatNeed) then szColor = "<color=green>"; else szColor = "<color=red>"; end
				szText = szText .. "\n" .. szColor .. tMat.Name .. ": " .. nHave .. " / " .. tMatNeed .. "<color>";
			end
		end
		local nMax = QK_CalcMaxCraft(nIndex);
		szText = szText .. "\n<color=yellow>=> Cã thÓ ghÐp: " .. nMax .. " vËt phÈm<color>";

		local tBtn = {};
		tinsert(tBtn, "GhÐp tèi ®a (" .. nMax .. ")/#QK_DoCraft(" .. nIndex .. ")");
		tinsert(tBtn, "NhËp sè l­îng ghÐp/#QK_AskCraft(" .. nIndex .. ")");
		tinsert(tBtn, "Kh«ng ghÐp/Exit");
		SayNew(szText, getn(tBtn), tBtn);
	end
end

---@param nIndex any
---@param count number 1 package cho bao nhieu cai
function QK_ShowEventBuyDialog(nIndex)
	if nIndex < 0 then
		local menuIdx = nIndex * (-1)
		local subItems = QK_tbMenu_Main[menuIdx] and QK_tbMenu_Main[menuIdx][3] or {}
		local tBtn = {};
		for i = 1, getn(subItems) do
			tinsert(tBtn, subItems[i][1] .. "/" .. subItems[i][2]);
		end
		SayNew(
			"Chän gãi vËt phÈm muèn mua:",
			getn(tBtn),
			tBtn
		);
		return
	end
	local packageSale = QKLib_getPackageSale(nIndex)
	if (not packageSale) then return end
	if packageSale.Count > 1 or packageSale.IsOpen == 1 then
		QK_InputBuyEventItem(nIndex, 1)
		return
	end
	local nStr = "<color=yellow>%s<color>\nGi¸: <color=green>%d c¸i = "
	if packageSale.Xu then
		nStr = nStr .. packageSale.Xu .. " xu "
	end
	if packageSale.Van then
		nStr = nStr .. packageSale.Van .. " v¹n "
	end
	if packageSale.TichLuy then
		nStr = nStr .. packageSale.TichLuy .. " tÝch luü "
	end
	local nstr = format(
		nStr .. "<color>",
		packageSale.Name,
		packageSale.Count or 0
	)
	local nStr1 = "NhËp sè l­îng (1 = " .. (packageSale.Count or 1) .. " vËt phÈm)"
	SayNew(nstr, 2,
		{ nStr1 .. "/#QK_InputBuyEventItem(" .. nIndex .. "," .. (packageSale.Count or 1) .. ")",
			"Kh«ng mua/Exit" });
end
