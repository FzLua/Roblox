local games = {
    [994732206] = 'Blox Fruits'
}

if (game.GameId and games[game.GameId]) then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FzLua/Roblox/main/Scripts/Loader/'..string.gsub(games[game.GameId], ' ', '%20')..'/run.lua'))()
end