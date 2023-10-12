local games = {
    [4442272183] = 'Blox%20Fruits'
}

if (game.PlaceId and games[game.PlaceId]) then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FzLua/Roblox/main/Scripts/Loader/'..games[game.PlaceId]..'/run.lua?token=GHSAT0AAAAAACIZAKZMTX7357DPN3GUHDLYZJHKW7Q'))()
end