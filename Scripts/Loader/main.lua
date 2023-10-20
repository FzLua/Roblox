if (_G.fzLoader) then
    _G.fzLoader.lib:Destroy()
end

_G.fzLoader = {}

--Documentation url: https://docs.sirius.menu/community/arrayfield

-- print(os.date('%m/%d/%Y %H:%M:%S'))

getgenv().SecureMode = true

_G.fzLoader.lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/FzLua/Roblox/main/Scripts/Loader/library.lua'))()
_G.fzLoader.window = _G.fzLoader.lib:CreateWindow({
    Name = 'FZ Loader V1';
    LoadingTitle = 'FZ Loader';
    LoadingSubtitle = 'Thanks ArrayField';
    ConfigurationSaving = {
        Enabled = false;
        FolderName = nil; -- Create a custom folder for your hub/game
        FileName = 'FzLoader'
    };
    Discord = {
        Enabled = false;
        Invite = 'noinvitelink';
        RememberJoins = false
    };
    KeySystem = false;
    KeySettings = {
        Title = '';
        Subtitle = '';
        Note = '';
        FileName = 'key';
        SaveKey = true;
        GrabKeyFromSite = false;
        Actions = {};
        Key = {''}
    }
})

_G.fzLoader.load = function(table)
    if (table) then
        if (_G.fzLoader.cache) then
            return
        end

        _G.fzLoader.cache = {}

        if (not _G.fzLoader.cache.tab) then
            _G.fzLoader.cache.tab = {}
        end

        if (not _G.fzLoader.cache.options) then
            _G.fzLoader.cache.options = {}
        end

        for tabI, tabV in ipairs(table) do
            _G.fzLoader.cache.tab[tabV.name] = _G.fzLoader.window:CreateTab(tabV.name, tabV.icon)

            if (tabV.options) then
                if (not _G.fzLoader.cache.options[tabV.name]) then
                    _G.fzLoader.cache.options[tabV.name] = {}
                end

                for optionI, optionV in ipairs(tabV.options) do
                    if (optionV.type == 'section') then
                        _G.fzLoader.cache.options[tabV.name][optionV.identifier or optionI] = _G.fzLoader.cache.tab[tabV.name]:CreateSection(optionV.name, true)
                    elseif (optionV.type == 'button') then
                        _G.fzLoader.cache.options[tabV.name][optionV.identifier or optionI] = _G.fzLoader.cache.tab[tabV.name]:CreateButton({
                            Name = optionV.name;
                            Interact = optionV.description;
                            Callback = (optionV.callback or function() end)
                        })
                    elseif (optionV.type == 'toggle') then
                        _G.fzLoader.cache.options[tabV.name][optionV.identifier or optionI] = _G.fzLoader.cache.tab[tabV.name]:CreateToggle({
                            Name = optionV.name;
                            CurrentValue = optionV.default;
                            Flag = (optionV.identifier or tabV.name..'-'..optionV.name);
                            Callback = (optionV.callback or function() end)
                        })

                        if (optionV.default) then
                            optionV.callback(true)
                        end
                    elseif (optionV.type == 'dropdown') then
                        _G.fzLoader.cache.options[tabV.name][optionV.identifier or optionI] = _G.fzLoader.cache.tab[tabV.name]:CreateDropdown({
                            Name = optionV.name;
                            Options = optionV.options;
                            CurrentOption = optionV.options[1];
                            MultiSelection = optionV.multi;
                            Flag = (optionV.identifier or tabV.name..'-'..optionV.name);
                            Callback = (optionV.callback or function() end)
                        })
                    end
                end
            end
        end

        _G.fzLoader.whileUnlock = true
    end
end