-- MYSQL LOGIN --
MySQL.Connect("IP", 33060, "DATABASE", "PASSWORD", "DATABASE")

Events.Subscribe("ivd_identity:setIdentity", function(RocstarID, firstname, lastname, dateofbirth, sex, height)
    MySQL.Execute("UPDATE players SET firstname=?, lastname=?, dateofbirth=?, sex=?, height=? WHERE RockstarID=?", { firstname, lastname, dateofbirth, sex, height, RocstarID }, function(affectedRows)
        --Do some here when updated
    end)
end, true)