local games = {
    [4442272183] = 'Blox Fruits'
}

if (game.PlaceId and games[game.PlaceId]) then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end