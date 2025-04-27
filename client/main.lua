local IdentityGui

Events.Subscribe("ivd_identity:showRegisterIdentity", function(t)
    local w, h = Game.GetScreenResolution() --Found some issues with this. Soon will be fixed :)
    IdentityGui = WebUI.Create("file://ivd_identity/html/index.html", 1920, 1080, true)
    WebUI.SetFocus(IdentityGui)
end, true)

Events.Subscribe("ivd_identity:notNewPlayer", function(t)
    WebUI.Destroy(IdentityGui)
    WebUI.SetFocus(-1)
end, true)

Events.Subscribe("ivd_identity:register", function(firstname, lastname, dateofbirth, sex, height)
    local reason = ""
    -- Validate name fields
    reason = verifyName(firstname)
    if reason == "" then
        reason = verifyName(lastname)
    end

    -- Validate date of birth
    if reason == "" and dateofbirth == "invalid" then
        reason = "Invalid date of birth!"
    end

    -- Validate height
    local heightNum = tonumber(height)
    if reason == "" then
        if not heightNum or heightNum < 140 or heightNum > 200 then
            reason = "Unacceptable player height!"
        end
    end

    if reason == "" then
        local RocstarID = Player.GetRockstarID()
        WebUI.Destroy(IdentityGui)
        WebUI.SetFocus(-1)
        Events.CallRemote("ivd_identity:setIdentity", { RocstarID, firstname, lastname, dateofbirth, sex, height })
    else
        Chat.AddMessage(reason)
    end
end, true)

function verifyName(name)
	-- Don't allow short user names
	local nameLength = string.len(name)
	if nameLength > 25 or nameLength < 2 then
		return 'Your player name is either too short or too long.'
	end
	
	-- Don't allow special characters (doesn't always work)
	local count = 0
	for i in name:gmatch('[abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 -]') do
		count = count + 1
	end
	if count ~= nameLength then
		return 'Your player name contains special characters that are not allowed on this server.'
	end
	
	local spacesInName    = 0
	local spacesWithUpper = 0
	for word in string.gmatch(name, '%S+') do
	
		if string.match(word, '%u') then
			spacesWithUpper = spacesWithUpper + 1
		end
	
		spacesInName = spacesInName + 1
	end
	
	if spacesInName > 2 then
		return 'Your name contains more than two spaces'
	end
	
	if spacesWithUpper ~= spacesInName then
		return 'your name must start with a capital letter.'
	end
	
	return ''
end