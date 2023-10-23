local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Boss Fight Hub",
   LoadingTitle = "Boss Fight Hub Loading",
   LoadingSubtitle = "By Crimson",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "RobHub"
   },
   Discord = {
      Enabled = true,
      Invite = "H3M8x54QjN", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Boss Fight Hub (Rob)",
      Subtitle = "Key System",
      Note = "Key is 'Rob' ",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Rob"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local PlayerTab = Window:CreateTab("Player", 4483362458)

local Button = MainTab:CreateButton({
   Name = "Auto Bob Slap",
   Callback = function()
      while task.wait(0.1) do local Event = game:GetService("Workspace").bobBoss.DamageEvent Event:FireServer() end
   end,
})

local Button2 = MainTab:CreateButton({
   Name = "Auto Click Tycoon",
   Callback = function()
      while task.wait() do
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Click" and v:FindFirstChild("ClickDetector") then
               fireclickdetector(v.ClickDetector)
            end
        end
     end
  end,
})

local Button3 = MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local WalkSpeedSlider = PlayerTab:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 250},
   Increment = 10,
   Suffix = "WalkSpeed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local bypass;
     bypass = hookmetamethod(game, "__namecall", function(method, ...) 
   if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
      return
   elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
      return
   elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
      return
end
   return bypass(method, ...)
end)

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local JumpPowerSlider = PlayerTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 250},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 10,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})
