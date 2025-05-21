local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPlayers()[1]

local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()

KeyGuardLibrary.Set({
    publicToken = "c0bf4b311d4c4ea7931b19c484e7d95c",
    privateToken = "c87038d332f240928a80e13cd8096f9e",
    trueData = "1940a30997f74f7e9b83126b904110c4",
    falseData = "096a94ac75564f44927765ba8012216e",
})

local key = rawget(getfenv(), "script_key") or _G.script_key

if not key then
    if player then
        player:Kick("Please set script_key before running!")
    end
    return
end

local response = KeyGuardLibrary.validateDefaultKey(key)

if response == "1940a30997f74f7e9b83126b904110c4" then
    loadstring(game:HttpGet("https://gist.githubusercontent.com/clipsbyj/41e6927054312f768969d33a8aa3ad00/raw/20bac85b49bcbd918e1468ddfe319da855f1657c/Greenville.lua"))()
else
    if player then
        player:Kick("Invalid Key.")
    end
end
