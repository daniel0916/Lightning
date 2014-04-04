function OnPlayerRightClick(Player, BlockX, BlockY, BlockZ, BlockFace, CursorX, CursorY, CursorZ)
	if Player:GetEquippedItem().m_ItemType == E_ITEM_BLAZE_ROD then
		if Player:HasPermission("lightning.click") then
			Player:GetWorld():CastThunderbolt(GetBlockXYZFromTrace(Player))
		end
	end
end