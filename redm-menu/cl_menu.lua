local _IsDataIdValid = IsDataIdValid
function IsDataIdValid(...)
    local b = _IsDataIdValid(...)
    return b and b ~= 0
end

local DynamicCatalogItems = nil
local DynamicCatalogItemsArray = nil
local CatalogItemInspection = nil

function MakeMenu()
    -- func_437
    SetScriptGfxDrawOrder(4)
    if DynamicCatalogItems and IsDataIdValid(DynamicCatalogItems) then
        RemoveDataEntry(DynamicCatalogItems)
    end
    DynamicCatalogItems = AddDataContainerFromPath("", "DynamicCatalogItems")
    if DynamicCatalogItemsArray == nil or not IsDataIdValid(DynamicCatalogItemsArray) then
        DynamicCatalogItemsArray = AddUiItemList(DynamicCatalogItems, "DynamicCatalogItemsArray")
    end
    -- func_779
    CatalogItemInspection = AddDataContainer(DynamicCatalogItems, "CatalogItemInspection");
	AddDataBool(CatalogItemInspection, "isVisible", false);
	AddDataHash(CatalogItemInspection, "itemLabel", 0);
	AddDataString(CatalogItemInspection, "itemDescription", "");
	AddDataString(CatalogItemInspection, "purchaseLabel", "");
	AddDataInt(CatalogItemInspection, "purchasePrice", 0);
	AddDataBool(CatalogItemInspection, "ammoVisible", false);
	AddDataInt(CatalogItemInspection, "ammoCurrent", 0);
	AddDataInt(CatalogItemInspection, "ammoMax", 0);
	AddDataString(CatalogItemInspection, "ammoTextureDictionary", "");
	AddDataString(CatalogItemInspection, "ammoTexture", "");
	-- CatalogItemInspection.f_1 = N_0x9d21b185abc2dbc4(CatalogItemInspection, "effects", 0, 0);
	-- CatalogItemInspection.f_2 = N_0x9d21b185abc2dbc5(CatalogItemInspection, "stats", 0, -1);
	-- CatalogItemInspection.f_3 = N_0x9d21b185abc2dbc5(CatalogItemInspection, "compareStats", 0, -1);
	AddDataHash(CatalogItemInspection, "CompareLabel", 0);
	AddDataBool(CatalogItemInspection, "NextItem", false);
	AddDataBool(CatalogItemInspection, "PreviousItem", false);
end

function func_807(menu, )
