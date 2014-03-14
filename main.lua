function Initialize(Plugin)
    Plugin:SetName("Lightning");
    Plugin:SetVersion(1);
	
	local PluginManager = cRoot:Get():GetPluginManager();
    PluginManager:BindCommand("/lightning", 	"lightning.use", 	HandleLightningCommand, 	 " - Create Lightnings");
	
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_RIGHT_CLICK, OnPlayerRightClick)
	
    LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion());
    return true;
end

function GetBlockXYZFromTrace(Player)
	local World = Player:GetWorld()
	local Tracer = cTracer(World)

	local EyePos = Vector3f(Player:GetEyePosition().x, Player:GetEyePosition().y, Player:GetEyePosition().z)
	local EyeVector = Vector3f(Player:GetLookVector().x, Player:GetLookVector().y, Player:GetLookVector().z)
	Tracer:Trace(EyePos , EyeVector, 50)
	return Tracer.BlockHitPosition.x, Tracer.BlockHitPosition.y, Tracer.BlockHitPosition.z
end