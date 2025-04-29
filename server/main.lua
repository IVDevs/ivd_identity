-- MYSQL LOGIN --
Database.Connect(0, "mysqlx://user:password@host:port/database")

Events.Subscribe("ivd_identity:setIdentity", function(RocstarID, firstname, lastname, dateofbirth, sex, height)
    Database.ExecuteAsync("UPDATE players SET firstname=?, lastname=?, dateofbirth=?, sex=?, height=? WHERE RockstarID=?", { firstname, lastname, dateofbirth, sex, height, RocstarID }, function(affectedRows)
        --Do some here when updated
    end)
end, true)