loadstring(game:HttpGet('https://raw.githubusercontent.com/FzLua/Roblox/main/Scripts/Loader/main.lua?token=GHSAT0AAAAAACIZAKZMPTHEM5C3LIGW3B4WZJHU3UA'))()

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
        name = 'Local Player';
        icon = 7743871002;

        options = {
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
        };
    };

    {
        name = 'Scripts (Key)';
        icon = 7733992528;

        options = {
            {
                type = 'section';
                name = 'Tsuo Scripts';
            };
            {
                type = 'button';
                name = 'Hub';
                description = 'Run';
                callback = function()
                    return runScript('Tsuo Hub', function()
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/Tsuoscripts'))()
                    end)
                end;
            };
        };
    };
    
    {
        name = 'Scripts (Keyless)';
        icon = 7743875263;

        options = {
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
                            ["StartFarmChest"] = true,
                            ["Team"] = "Marines",
                            ["TimeReset"] = 5, -- No Edit
                            ["White Screen"] = false,
                            ["Stop The God's Chalice"] = true,
                            ["Stop The Fist of Darkness"] = true,
                            ["HopServer"] = {
                                ["Enable"] = true,
                                ["BypassServer"] = true,
                                ["Region"] = "United States"
                            },
                            ["Server Discord"] = "https://discord.gg/mFzWdBUn45"
                        }
                        repeat wait() until game:IsLoaded()

                        loadstring(game:HttpGet('https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/Chest-Farm.lua'))()
                    end)
                end;
            };

            {
                type = 'section';
                name = 'Thunder Z';
            };
            {
                type = 'button';
                name = 'Auto Farm Chest';
                description = 'Run';
                callback = function()
                    return runScript('Thunder Z - Auto Farm Chest', function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Main/Chest/AllDevice.lua"))()
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

while wait() do
    local pos = localPlayer.Character.HumanoidRootPart.Position

    if (toggleStates['Local Player']['Auto UnSit']) then
        if (localPlayer.Character.Humanoid.Sit) then
            localPlayer.Character.Humanoid.Sit = false
            print('Player UnSit')
            if (localPlayer.character:FindFirstChild("HumanoidRootPart")) then
                wait(0.05)
                localPlayer.Character.Humanoid.Sit = true
                wait(0.05)
                localPlayer.Character.Humanoid.Sit = false
                wait(0.05)
                localPlayer.character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(Vector3.new(pos.x, pos.y + 10, pos.z))
    
                print('Player Teleported UP')
            end
        end
    end
end