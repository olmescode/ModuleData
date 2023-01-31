print("Required ModuleData")
local RunService = game:GetService("RunService")

local CachedData = require(script.Components.CachedData)
local onPlayerAdded = require(script.Components.onPlayerAdded)
local onPlayerRemoved = require(script.Components.onPlayerRemoved)
local onBindToClose = require(script.Components.onBindToClose)
local retrieveData = require(script.Api.retrieveData)
local updateData = require(script.Api.updateData)
local setData = require(script.Api.setData)
local deleteData = require(script.Api.deleteData)
local callbacks = require(script.callbacks)

local DataModule = {
	-- CRUD (create, read, update, and delete)
	-- Server APIs
	loadDataAsync = onPlayerAdded(CachedData), 
	saveDataAsync = onPlayerRemoved(CachedData),
	onBindToClose = onBindToClose(CachedData),
	
	-- Client APIs
	
	-- Server and client APIs
	retrieveData = retrieveData(CachedData),
	updateData = updateData(CachedData),
	satData = setData(CachedData),
	deleteData = deleteData(CachedData),
	
	-- Callbacks
	onUpdateData = callbacks.updateDataCallback.setCallback,
	onSetData = callbacks.setDataCallback.setCallback,
	onDeleteData = callbacks.deleteDataCallvack.setCallback,
	
	onUpdate = callbacks.addCallback
	
}

function DataModule.init()
	assert(RunService:IsServer(), "DataModule must be called on server")
	
	CachedData.init()
end

DataModule.init()

return DataModule
