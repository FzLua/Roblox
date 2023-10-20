loadstring(game:HttpGet('https://raw.githubusercontent.com/FzLua/Roblox/main/Scripts/Loader/main.lua'))()

-- // --

local allSeas = {
    [2753915549] = 1;
    [4442272183] = 2;
    [7449423635] = 3
};

local sea = allSeas[game.PlaceId]

local disponibleSeasToTP = {}
for i, v in pairs(allSeas) do
    if (i ~= game.PlaceId) then
        table.insert(disponibleSeasToTP, 'Sea '..v)
    end
end

-- // --

_G.fzLoader.load({
    {
        name = 'Own Functions';
        icon = 7743871002;

        options = {
            {
                type = 'section';
                name = 'Help Functions';
            };
            {
                type = 'toggle';
                name = 'Auto UnSit (Recommended to Auto Farm Chest)';
                identifier = 'Auto UnSit';
                info = {title = 'Auto UnSit', description = 'Auto UnSit is a function that will make you get up from the chair automatically.'};
                default = false;
                callback = function(state)
                    return true
                end;
            };

            {
                type = 'section';
                name = 'Remote Events';
            };
            {
                type = 'dropdown';
                name = 'Change Sea';
                identifier = 'Change Sea';
                info = {title = 'Change Sea', description = 'Change Sea is a function that will change the world to the sea (You need to have the Sea unlocked).'};
                options = disponibleSeasToTP;
                multi = false;
                callback = function(seaSelected)
                    local seaSelected = string.gsub(seaSelected, 'Sea ', '')
                    local seaSelected = tonumber(seaSelected)

                    local eventNames = {
                        [1] = 'TravelMain';
                        [2] = 'TravelDressrosa';
                        [3] = 'TravelZou'
                    }

                    if (eventNames[seaSelected]) then
                        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(eventNames[seaSelected])
                    end
                end;
            };
            {
                type = 'dropdown';
                name = 'Change Aura Color';
                identifier = 'Change Aura Color';
                info = {title = 'Change Aura Color', description = 'Change Aura Color is a function that will change the color of your aura (You need to have the aura).'};
                options = {'Remove', '#001 Orange Soda', '#002 Bright Yellow', '#003 Yellow Sunshine', '#004 Slimy Green', '#005 Green Lizard', '#006 Blue Jeans', '#007 Plump Purple', '#008 Fiery Rose', '#009 Heat Wave', '#010 Absolute Zero', '#011 Snow White', '#012 Pure Red', '#013 Winter Sky', '#014 Rainbow Saviour', '#015 Aquamarine', '#016 Light Pink'};
                multi = false;
                callback = function(auraSelected)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', string.gsub(auraSelected, '#%x%x%x ', ''))
                end;
            };
        };
    };

    {
        name = 'Scripts (Key)';
        icon = 7733992528;

        options = {
            {
                type = 'section';
                name = 'Easy Key Level';
            };



            {
                type = 'section';
                name = 'Medium Key Level';
            };

            {
                type = 'section';
                name = 'Tsuo Scripts';
            };
            {
                type = 'button';
                name = 'Hub (Good for Raid and Farm)';
                info = {title = 'Tsuo Hub', description = 'Tsuo Hub is one of the best Blox Fruits scripts.\n\nIts best functions are to do Raids and Farm chests, among others.'};
                description = 'Run';
                callback = function()
                    return runScript('Tsuo Hub', function()
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/Tsuoscripts'))()
                    end)
                end;
            };

            {
                type = 'section';
                name = 'Hard Key Level';
            };


            
        };
    };
    
    {
        name = 'Scripts (Keyless)';
        icon = 7743875263;

        options = {
            {
                type = 'section';
                name = 'Thunder Z';
            };
            {
                type = 'button';
                name = 'Auto Farm Chest (Best farm)';
                description = 'Run';
                callback = function()
                    return runScript('Thunder Z - Auto Farm Chest', function()
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Main/Chest/AllDevice.lua'))()
                    end)
                end;
            };

            {
                type = 'section';
                name = 'GLord';
            };
            {
                type = 'button';
                name = 'Loader (Best Auto-Shop)';
                description = 'Run';
                callback = function()
                    return runScript('GLord', function()
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/GGhostVN/GhostLord/main/Main'))()
                    end)
                end;
            };

            {
                type = 'section';
                name = 'MTriet';
            };
            {
                type = 'button';
                name = 'Hub';
                description = 'Run';
                callback = function()
                    return runScript('MTriet Hub', function()
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/MTriet-Hub.lua'))()
                    end)
                end;
            };
            {
                type = 'button';
                name = 'Auto Farm Chest';
                description = 'Run';
                callback = function()
                    return runScript('MTriet Hub - Auto Farm Chest', function()
                        getgenv().Config = {
                            ['StartFarmChest'] = true,
                            ['Team'] = 'Marines',
                            ['TimeReset'] = 5, -- No Edit
                            ['White Screen'] = false,
                            ['Stop The God\'s Chalice'] = true,
                            ['Stop The Fist of Darkness'] = true,
                            ['HopServer'] = {
                                ['Enable'] = true,
                                ['BypassServer'] = true,
                                ['Region'] = 'United States'
                            },
                            ['Server Discord'] = 'https://discord.gg/mFzWdBUn45'
                        }
                        repeat wait() until game:IsLoaded()

                        loadstring(game:HttpGet('https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/Chest-Farm.lua'))()
                    end)
                end;
            };
        };
    };

    {
        name = 'Informations';
        icon = 7733964719;

        options = {
            {
                type = 'section';
                name = 'Created by vz#5596 (@vzscr)'
            };
            {
                type = 'section';
                name = 'Library: ArrayField'
            };
            {
                type = 'section';
                name = 'Running: Blox Fruits';
            };
        };
    };
})

-- // --

local localPlayer = game.Players.LocalPlayer

local executingScript;

function runScript(name, callback)
    if (executingScript) then
        return
    end

    executingScript = true

    _G.fzLoader.lib:Notify({
        Title = 'Load Script';
        Content = 'Carregando o script "'..name..'".';
        Duration = 3;
        Image = 7734051052
    })
    wait(0.5)

    _G.fzLoader.lib:Notify({
        Title = 'Load Script';
        Content = 'Script carregado!\n\nExecutando...';
        Duration = 5;
        Image = 7734037784
    })
    wait(0.5)

    callback()
    wait(1)
    
    _G.fzLoader.lib:Notify({
        Title = 'Load Script';
        Content = 'Script Executado com sucesso.';
        Duration = 5;
        Image = 7733715400
    })
    executingScript = nil

    return true
end

-- // --

function whileStart()
    while (wait()) do
        if (not _G.fzLoader or not _G.fzLoader.whileUnlock) then
            break
        end
        
        local pos = localPlayer.Character.HumanoidRootPart.Position
        
        if (_G.fzLoader.cache.options['Own Functions']['Auto UnSit']:Get()) then
            if (localPlayer.Character.Humanoid.Sit) then
                localPlayer.Character.Humanoid.Sit = false

                if (localPlayer.character:FindFirstChild('HumanoidRootPart')) then
                    wait(0.05)
                    localPlayer.Character.Humanoid.Sit = true

                    wait(0.05)
                    localPlayer.Character.Humanoid.Sit = false

                    wait(0.05)
                    localPlayer.character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(Vector3.new(pos.x, pos.y + 10, pos.z))
                end
            end
        end
    end
end

while (wait(1)) do
    if (_G.fzLoader and _G.fzLoader.whileUnlock ~= nil) then
        whileStart()
    end
end