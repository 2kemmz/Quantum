local HttpService = game:GetService("HttpService")

local public_token = "c0bf4b311d4c4ea7931b19c484e7d95c"
local private_token = "c87038d332f240928a80e13cd8096f9e"

local trueData = "1940a30997f74f7e9b83126b904110c4"
local falseData = "096a94ac75564f44927765ba8012216e"

local url = string.format(
    "https://api.keyguardian.org/v1/validate?public_token=%s&private_token=%s&key=%s",
    public_token,
    private_token,
    script_key
)

local success, result = pcall(function()
    return game:HttpGet(url)
end)

if success and result == trueData then
    print("✅ Key is valid, loading script...")


    loadstring(game:HttpGet("WORKED", true))()

else
    local player = Players.LocalPlayer or Players:GetPlayers()[1]
    if player then
        player:Kick("Invalid Key")
    end
end
