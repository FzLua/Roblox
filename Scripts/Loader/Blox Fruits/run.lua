loadstring(game:HttpGet('https://raw.githubusercontent.com/FzLua/Roblox/main/Scripts/Loader/main.lua'))()

-- // --

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

local toggleStates = {
    ['Local Player'] = {
        ['Auto UnSit'] = false;
    };
}

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
                default = false;
                callback = function(state)
                    toggleStates['Local Player']['Auto UnSit'] = state

                    return true
                end;
            };

            {
                type = 'section';
                name = 'Remote Events';
            };
            {
                type = 'dropdown';
                name = 'Change Aura Color';
                options = {'Remove', 'Orange Soda', 'Bright Yellow', 'Yellow Sunshine', 'Slimy Green', 'Green Lizard', 'Blue Jeans', 'Plump Purple', 'Fiery Rose', 'Heat Wave', 'Absolute Zero', 'Snow White', 'Pure Red', 'Winter Sky', 'Rainbow Saviour', 'Aquamarine', 'Light Pink'};
                multi = false;
                callback = function(auraSelected)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', auraSelected)
                end;
            };
            {
                type = 'button';
                name = 'Remove';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', '')
                end;
            };
            {
                type = 'button';
                name = '#001 Orange Soda';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Orange Soda')
                end;
            };
            {
                type = 'button';
                name = '#002 Bright Yellow';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Bright Yellow')
                end;
            };
            {
                type = 'button';
                name = '#003 Yellow Sunshine';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Yellow Sunshine')
                end;
            };
            {
                type = 'button';
                name = '#004 Slimy Green';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Slimy Green')
                end;
            };
            {
                type = 'button';
                name = '#005 Green Lizard';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Green Lizard')
                end;
            };
            {
                type = 'button';
                name = '#006 Blue Jeans';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Blue Jeans')
                end;
            };
            {
                type = 'button';
                name = '#007 Plump Purple';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Plump Purple')
                end;
            };
            {
                type = 'button';
                name = '#008 Fiery Rose';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Fiery Rose')
                end;
            };
            {
                type = 'button';
                name = '#009 Heat Wave';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Heat Wave')
                end;
            };
            {
                type = 'button';
                name = '#010 Absolute Zero';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Absolute Zero')
                end;
            };
            {
                type = 'button';
                name = '#011 Snow White';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Snow White')
                end;
            };
            {
                type = 'button';
                name = '#012 Pure Red';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Pure Red')
                end;
            };
            {
                type = 'button';
                name = '#013 Winter Sky';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Winter Sky')
                end;
            };
            {
                type = 'button';
                name = '#014 Rainbow Saviour';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Rainbow Saviour')
                end;
            };
            {
                type = 'button';
                name = '#015 Aquamarine';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Aquamarine')
                end;
            };
            {
                type = 'button';
                name = '#016 Light Pink';
                description = 'Run';
                callback = function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer('activateColor', 'Light Pink')
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

while (_G.fzLoader and _G.fzLoader.whileUnlock == nil and wait() or (_G.fzLoader.whileUnlock and wait())) do
    local pos = localPlayer.Character.HumanoidRootPart.Position

    if (toggleStates['Local Player']['Auto UnSit']) then
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
