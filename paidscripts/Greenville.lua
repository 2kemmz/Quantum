-- Try both _G and global variable, with fallback
local user_key = _G.script_key or script_key or nil

if not user_key then
    warn("❌ No key found! Please define 'script_key' before running the loader.")
    local player = game:GetService("Players").LocalPlayer or game.Players:GetPlayers()[1]
    if player then
        player:Kick("No key provided. Please define 'script_key' in your loader.")
    end
    return
end

local url = string.format(
    "https://api.keyguardian.org/v1/validate?public_token=%s&private_token=%s&key=%s",
    public_token,
    private_token,
    user_key
)
