local key = getgenv().script_key
if not key then
    return warn("❌ You must define 'script_key' before loading the script.")
end

local req = syn and syn.request or http_request or request or fluxus and fluxus.request
if not req then
    return warn("❌ Your executor does not support HTTP requests.")
end

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
        name = "Quantum",
        ownerid = "US88FITBZn",
        version = "1.0"
    })
})

local data = HttpService:JSONDecode(res.Body)

if data.success then
    print("✅ Welcome, " .. data.info.username)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/2kemmz/LUAScripts/main/freescripts/Ragblood.lua"))()
else
    warn("❌ Invalid key: " .. data.message)
end
