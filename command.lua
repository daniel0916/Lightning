function HandleLightningCommand(Split, Player)
	if #Split > 2 then
		Player:SendMessage(cChatColor.Rose .. "Too many arguments.")
		Player:SendMessage(cChatColor.Rose .. "Use /lightning or /lightning <PlayerName>")
		return true
	end
	
	if #Split == 1 then
		Player:GetWorld():CastThunderbolt(GetBlockXYZFromTrace(Player))
	elseif #Split == 2 then
		if not Player:GetWorld():DoWithPlayer(Split[2],
			function(a_Player)
				a_Player:GetWorld():CastThunderbolt(a_Player:GetPosX(), a_Player:GetPosY(), a_Player:GetPosZ())
			end
		) then
			Player:SendMessage(cChatColor.Rose .. "Player couldn't be found.")
			return true
		end
	end
	
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