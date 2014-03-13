function HandleLightningCommand(Split, Player)
	Player:GetWorld():CastThunderbolt(GetBlockXYZFromTrace(Player))
	
	Player:SendMessage(cChatColor.Blue .. "Lightning created!")
	return true
end

function GetBlockXYZFromTrace(Player)
	local World = Player:GetWorld()
	local Tracer = cTracer(World)

	local EyePos = Vector3f(Player:GetEyePosition().x, Player:GetEyePosition().y, Player:GetEyePosition().z)
	local EyeVector = Vector3f(Player:GetLookVector().x, Player:GetLookVector().y, Player:GetLookVector().z)
	Tracer:Trace(EyePos , EyeVector, 50)
	return Tracer.BlockHitPosition.x, Tracer.BlockHitPosition.y, Tracer.BlockHitPosition.z
end