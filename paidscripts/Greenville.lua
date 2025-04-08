-- KeyAuth Config
local APP_NAME = "Quantum"
local OWNER_ID = "US88FlTBzn"
local VERSION = "1.0"

local key = getgenv().script_key
if not key then
    return warn("You must define 'script_key' before loading the script.")
end

local req = syn and syn.request or http_request or request or fluxus and fluxus.request
local HttpService = game:GetService("HttpService")

local res = req({
    Url = "https://keyauth.win/api/1.0/",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode({
        type = "license",
        key = key,
        name = APP_NAME,
        ownerid = OWNER_ID,
        version = VERSION
    })
})

local data = HttpService:JSONDecode(res.Body)

if data.success then
    loadstring(game:HttpGet("https://github.com/2kemmz/LUAScripts/blob/main/freescripts/Ragblood.lua"))()
else
    warn("Invalid key: " .. data.message)
end
