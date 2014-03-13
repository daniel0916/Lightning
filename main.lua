function Initialize(Plugin)
    Plugin:SetName("Lightning");
    Plugin:SetVersion(1);
	
	local PluginManager = cRoot:Get():GetPluginManager();
    PluginManager:BindCommand("/lightning", 	"lightning.use", 	HandleLightningCommand, 	 " - Create Lightnings");
	
    LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion());
    return true;
end