local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()

local trueData = "43c88ab35a86460792a98d13ca3e865d"
local falseData = "674b33fe1cb741fb88f887ea7dd56770"

KeyGuardLibrary.Set({
	publicToken = "c0bf4b311d4c4ea7931b19c484e7d95c",
	privateToken = "c87038d332f240928a80e13cd8096f9e",
	trueData = trueData,
	falseData = falseData,
})

-- Check if script_key exists in the environment
local key = getfenv()[“script_key”] or "invalid_key"

local response = KeyGuardLibrary.validateDefaultKey(key)
print("Validation result:", response)

if response == trueData then
	print("Key is valid")
	print("suck my big dih")
else
	print("Key is invalid")
end
