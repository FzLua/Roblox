for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
	pcall(function()
    	if (string.find(v.Name, 'Fruit')) then
    		print(v:FindFirstChild('Fruit').TextureID)
    	end
    end)
end