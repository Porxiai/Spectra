<------------ REPLACE ENTIRE example.lua WITH THIS ------------>
-- Spectra UI Example - Complete Usage
-- This is your MAIN SCRIPT that users will execute

local Spectra = loadstring(game:HttpGet("https://raw.githubusercontent.com/Porxiai/Spectra/main/spectra.lua"))()

-- Wait for initialization
repeat task.wait() until Spectra and Spectra._VERSION

-- Create main window
local Window = Spectra:CreateWindow({
    Name = "Spectra UI",
    Size = UDim2.new(0, 600, 0, 400),
    Theme = "PurpleBlack"
})

-- Create tabs
local HomeTab = Window:AddTab({Name = "Home", Icon = "Home"})
local CombatTab = Window:AddTab({Name = "Combat", Icon = "Target"})
local VisualsTab = Window:AddTab({Name = "Visuals", Icon = "Eye"})

-- Home Tab
local WelcomeSection = HomeTab:AddSection({Name = "Welcome"})
WelcomeSection:AddLabel({Text = "Spectra UI Loaded!", TextSize = 18})

WelcomeSection:AddButton({
    Name = "Test Button",
    Callback = function()
        Spectra:Notify("Button clicked!", 3, "Success")
    end
})

-- Combat Tab
local AimbotSection = CombatTab:AddSection({Name = "Aimbot"})

AimbotSection:AddToggle({
    Name = "Enable Aimbot",
    Default = false,
    Callback = function(state)
        Spectra:Notify("Aimbot: " .. (state and "ON" or "OFF"), 2)
    end
})

AimbotSection:AddSlider({
    Name = "Aimbot FOV",
    Min = 1,
    Max = 360,
    Default = 90,
    Suffix = "°",
    Callback = function(value)
        print("FOV set to:", value)
    end
})

-- Visuals Tab
local ESPSection = VisualsTab:AddSection({Name = "ESP"})

ESPSection:AddToggle({
    Name = "Enable ESP",
    Default = false,
    Callback = function(state)
        Spectra:Notify("ESP: " .. (state and "ON" or "OFF"), 2)
    end
})

-- Security status display
local SecuritySection = HomeTab:AddSection({Name = "Security"})
local securityStatus = Spectra:GetSecurityStatus()

SecuritySection:AddLabel({Text = "Threats Blocked: " .. securityStatus.ThreatsDetected})
SecuritySection:AddLabel({Text = "Protection: " .. securityStatus.SecurityLevel})

-- User info
local UserSection = HomeTab:AddSection({Name = "User Info"})
local userTier = Spectra:GetUserTier()

UserSection:AddLabel({Text = "Tier: " .. userTier})
UserSection:AddLabel({Text = "Permissions: Active"})

-- Notify user
Spectra:Notify("Spectra UI v" .. Spectra._VERSION .. " Loaded!", 5, "Success")
<------------ END OF PASTE ------------>
