local Players = game:GetService("Players")

-- ✅ Your KeyGuardian API credentials
local public_token = "c0bf4b311d4c4ea7931b19c484e7d95c"
local private_token = "c87038d332f240928a80e13cd8096f9e"

-- ✅ True/false data from your KeyGuardian dashboard
local trueData = "1940a30997f74f7e9b83126b904110c4"
local falseData = "096a94ac75564f44927765ba8012216e"

-- ✅ Pull the key from global variable
local key = rawget(getfenv(), "script_key") or rawget(_G, "script_key")

-- ❌ If no key was set
if not key or type(key) ~= "string" then
	local player = Players.LocalPlayer or Players:GetPlayers()[1]
	if player then
		player:Kick("No key provided. Please set 'script_key' before loading.")
	end
	return
end

-- ✅ Validate key using KeyGuardian API
local url = "https://api.keyguardian.org/v1/validate?public_token=" .. public_token .. "&private_token=" .. private_token .. "&key=" .. key

local success, response = pcall(function()
	return game:HttpGet(url)
end)

if not success then
	warn("Failed to contact KeyGuardian API.")
	local player = Players.LocalPlayer or Players:GetPlayers()[1]
	if player then
		player:Kick("Failed to contact key server.")
	end
	return
end

if response == trueData then
	print("✅ Key is valid.")
	loadstring(game:HttpGet("https://your-real-script-url.com/script.lua"))()
else
	local player = Players.LocalPlayer or Players:GetPlayers()[1]
	if player then
		player:Kick("Invalid key.")
	end
end
