local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local LuaName = "Quantum Keysystem"

StarterGui:SetCore("SendNotification", {
	Title = LuaName,
	Text = "Intializing Authentication...",
	Duration = 5
})

local initialized = false
local sessionid = ""

Name = "Quantum" 
Ownerid = "US88FlTBzn" 
APPVersion = "1.0"    

local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=init&ver=' .. APPVersion)

if req == "KeyAuth_Invalid" then 
   print(" Error: Application not found.")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Application not found.",
	   Duration = 3
   })

   return false
end

local data = HttpService:JSONDecode(req)

if data.success == true then
   initialized = true
   sessionid = data.sessionid
elseif (data.message == "invalidver") then
   print(" Error: Wrong application version..")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Wrong application version..",
	   Duration = 3
   })

   return false
else
   print(" Error: " .. data.message)
   return false
end

print("\n\n Licensing... \n")
local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=license&key=' .. License ..'&ver=' .. APPVersion .. '&sessionid=' .. sessionid)
local data = HttpService:JSONDecode(req)


if data.success == false then 
    StarterGui:SetCore("SendNotification", {
	    Title = LuaName,
	    Text = " Error: " .. data.message,
	    Duration = 5
    })

    return false
end

StarterGui:SetCore("SendNotification", {
	Title = LuaName,
	Text = " Successfully Authorized :)",
	Duration = 5
})


loadstring(game:HttpGet("https://gist.githubusercontent.com/2kemmz/3388953a0020d3509a5138fc9d15f638/raw/00788025553e0f788aeb1ba197a4e584aedd656d/Greenville.lua"))()


print(' Logged In!')
print(' User Data')
print(' Username:' .. data.info.username)
print(' IP Address:' .. data.info.ip)
print(' Created at:' .. data.info.createdate)
print(' Last login at:' .. data.info.lastlogin)
