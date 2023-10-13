local games = {
    [994732206] = 'Blox%20Fruits'
}

if (game.GameId and games[game.GameId]) then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FzLua/Roblox/main/Scripts/Loader/'..games[game.GameId]..'/run.lua?token=GHSAT0AAAAAACIZAKZMTX7357DPN3GUHDLYZJHKW7Q'))()
end