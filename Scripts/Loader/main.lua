if (_G.fzLoader) then
    return
end

_G.fzLoader = {}

--Documentation url: https://docs.sirius.menu/community/arrayfield

print(os.date('%m/%d/%Y %H:%M:%S'))

getgenv().SecureMode = true

_G.fzLoader.lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
_G.fzLoader.window = _G.fzLoader.lib:CreateWindow({
    Name = 'FZ Loader V1';
    LoadingTitle = 'FZ Loader';
    LoadingSubtitle = 'Thanks ArrayField';
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = 'FzLoader'
    },
    Discord = {
        Enabled = false,
        Invite = 'noinvitelink', -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = '',
        Subtitle = '',
        Note = '',
        FileName = 'key', -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
        Actions = {
            [1] = {
                Text = 'Click here to copy the key link <--',
                OnPress = function()
                    print('Pressed')
                end,
            }
        },
        Key = {''} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ('hello','key22')
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
                            Flag = tabV.name..'-'..optionV.name;
                            Callback = (optionV.callback or function() end)
                        })

                        if (optionV.default) then
                            optionV.callback(true)
                        end
                    end
                end
            end
        end
    end
end