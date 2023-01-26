local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local DataModule = require(ServerStorage:WaitForChild("DataModule"))
DataModule.init()

local DataStores = {
	ExampleDataStore5 = {
		Playtime = 10,
		HalloweenCandies = 0
	},
	ExampleDataStore6 = {
		Event = "HalloweenEvent",
		Banned = true,
		Items = {
			4343758,  -- ColdFyre Armor
			28521575  -- Slime Shield
		},
		Powers = {
			WalkSpeed = 100,
			JumpPower = 2000
		}
	}
}

Players.PlayerAdded:Connect(function(player)
	for dataStore, data in pairs(DataStores) do
		DataModule.loadDataAsync(dataStore, player, data)
	end
end)

--Players.PlayerAdded:Connect(onPlayerAdded(player, DataStores))

Players.PlayerRemoving:Connect(function(player)
	DataModule.saveDataAsync(player)
end)

--[[
local playTime = DataModule.retrieveData(player.UserId, "Playtime")
print(playTime) -- Output: 10

local updatedPlayTime = DataModule.updateData(player.UserId, "Playtime", 20)
print(updatedPlayTime) -- Output: 20

local newEvent = DataModule.setData(player.UserId, "ExampleDataStore1", "NewEvent", "true")
print(newEvent) -- Output: "true"

local deletedData = DataModule.deleteData(player.UserId, "ExampleDataStore1")
print(deletedData) -- Output: true
]]


--Make the function when player is leaving with updateAsyn, a function to force update using setAsync and bindtoclose
--Set callbacks funtions on client and server
-- Agregar un set Enabled bc data can take a while to load, change in DataManager to playerKey to pass just a key instead player