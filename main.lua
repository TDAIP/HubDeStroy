-- VenKey - Modern KeyLess Script Hub (Premium UI Upgrade)
-- Advanced Glass Morphism UI with Enhanced Features

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VenKeyPremium"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Background Blur Effect
local blurFrame = Instance.new("Frame", screenGui)
blurFrame.Name = "BlurBackground"
blurFrame.Size = UDim2.new(1, 0, 1, 0)
blurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
blurFrame.BackgroundTransparency = 0.3
blurFrame.ZIndex = 1

-- Main Container with Enhanced Glass Morphism
local mainContainer = Instance.new("Frame", screenGui)
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0, 0, 0, 0)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
mainContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainContainer.BackgroundTransparency = 0.15  -- Enhanced transparency
mainContainer.ClipsDescendants = true
mainContainer.ZIndex = 2

-- Enhanced Glass Effect Corner
local containerCorner = Instance.new("UICorner", mainContainer)
containerCorner.CornerRadius = UDim.new(0, 24)

-- Premium Glass Border with Gradient Effect
local containerStroke = Instance.new("UIStroke", mainContainer)
containerStroke.Color = Color3.fromRGB(255, 255, 255)
containerStroke.Thickness = 2
containerStroke.Transparency = 0.2

-- Gradient Background Effect
local gradient = Instance.new("UIGradient", mainContainer)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(240, 248, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
gradient.Rotation = 45

-- Header Section with Enhanced Design
local headerFrame = Instance.new("Frame", mainContainer)
headerFrame.Size = UDim2.new(1, 0, 0, 60)
headerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
headerFrame.BackgroundTransparency = 0.8
headerFrame.ZIndex = 3

local headerCorner = Instance.new("UICorner", headerFrame)
headerCorner.CornerRadius = UDim.new(0, 24)

-- Logo/Icon
local logoFrame = Instance.new("Frame", headerFrame)
logoFrame.Size = UDim2.new(0, 40, 0, 40)
logoFrame.Position = UDim2.new(0, 15, 0, 10)
logoFrame.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
logoFrame.BackgroundTransparency = 0.1

local logoCorner = Instance.new("UICorner", logoFrame)
logoCorner.CornerRadius = UDim.new(0, 20)

local logoGradient = Instance.new("UIGradient", logoFrame)
logoGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 170, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 130, 255))
}
logoGradient.Rotation = 45

local logoText = Instance.new("TextLabel", logoFrame)
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.Font = Enum.Font.GothamBold
logoText.Text = "V"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.TextSize = 20
logoText.BackgroundTransparency = 1

-- Enhanced Title with Animation
local titleLabel = Instance.new("TextLabel", headerFrame)
titleLabel.Size = UDim2.new(1, -120, 0, 28)
titleLabel.Position = UDim2.new(0, 65, 0, 8)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "VenKey Premium"
titleLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
titleLabel.TextSize = 22
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1

-- Animated Subtitle
local subtitleLabel = Instance.new("TextLabel", headerFrame)
subtitleLabel.Size = UDim2.new(1, -120, 0, 18)
subtitleLabel.Position = UDim2.new(0, 65, 0, 32)
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.Text = "KeyLess Script Hub • Premium Edition"
subtitleLabel.TextColor3 = Color3.fromRGB(70, 70, 70)
subtitleLabel.TextSize = 12
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.BackgroundTransparency = 1

-- Status Indicator
local statusIndicator = Instance.new("Frame", headerFrame)
statusIndicator.Size = UDim2.new(0, 8, 0, 8)
statusIndicator.Position = UDim2.new(1, -80, 0, 15)
statusIndicator.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
statusIndicator.BorderSizePixel = 0

local statusCorner = Instance.new("UICorner", statusIndicator)
statusCorner.CornerRadius = UDim.new(0, 4)

local statusLabel = Instance.new("TextLabel", headerFrame)
statusLabel.Size = UDim2.new(0, 60, 0, 16)
statusLabel.Position = UDim2.new(1, -70, 0, 12)
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.Text = "Online"
statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
statusLabel.TextSize = 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.BackgroundTransparency = 1

-- Enhanced Close Button with Hover Effects
local closeButton = Instance.new("TextButton", headerFrame)
closeButton.Size = UDim2.new(0, 32, 0, 32)
closeButton.Position = UDim2.new(1, -42, 0, 14)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
closeButton.BackgroundTransparency = 0.8
closeButton.Text = "×"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.AutoButtonColor = false

local closeCorner = Instance.new("UICorner", closeButton)
closeCorner.CornerRadius = UDim.new(0, 16)

-- Animated Divider
local divider = Instance.new("Frame", mainContainer)
divider.Size = UDim2.new(1, -40, 0, 2)
divider.Position = UDim2.new(0, 20, 0, 60)
divider.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
divider.BackgroundTransparency = 0.7
divider.BorderSizePixel = 0

local dividerCorner = Instance.new("UICorner", divider)
dividerCorner.CornerRadius = UDim.new(0, 1)

-- Enhanced Tab Navigation
local tabFrame = Instance.new("Frame", mainContainer)
tabFrame.Size = UDim2.new(1, 0, 0, 50)
tabFrame.Position = UDim2.new(0, 0, 0, 70)
tabFrame.BackgroundTransparency = 1

local function createPremiumTab(name, position, isActive, icon)
    local tab = Instance.new("TextButton", tabFrame)
    tab.Name = name .. "Tab"
    tab.Size = UDim2.new(0, 110, 0, 35)
    tab.Position = position
    tab.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    tab.BackgroundTransparency = isActive and 0.2 or 0.8
    tab.Font = Enum.Font.GothamMedium
    tab.Text = ""
    tab.AutoButtonColor = false
    
    local tabCorner = Instance.new("UICorner", tab)
    tabCorner.CornerRadius = UDim.new(0, 18)
    
    local tabGradient = Instance.new("UIGradient", tab)
    tabGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 170, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 130, 255))
    }
    tabGradient.Rotation = 45
    
    -- Tab Icon
    local tabIcon = Instance.new("TextLabel", tab)
    tabIcon.Size = UDim2.new(0, 20, 0, 20)
    tabIcon.Position = UDim2.new(0, 8, 0, 7)
    tabIcon.Font = Enum.Font.GothamBold
    tabIcon.Text = icon
    tabIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabIcon.TextSize = 14
    tabIcon.BackgroundTransparency = 1
    
    -- Tab Text
    local tabText = Instance.new("TextLabel", tab)
    tabText.Size = UDim2.new(1, -35, 1, 0)
    tabText.Position = UDim2.new(0, 30, 0, 0)
    tabText.Font = Enum.Font.GothamMedium
    tabText.Text = name
    tabText.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabText.TextSize = 12
    tabText.TextXAlignment = Enum.TextXAlignment.Left
    tabText.BackgroundTransparency = 1
    
    return tab
end

local scriptsTab = createPremiumTab("Scripts", UDim2.new(0, 15, 0, 8), true, "📜")
local executorTab = createPremiumTab("Executor", UDim2.new(0, 135, 0, 8), false, "⚡")
local settingsTab = createPremiumTab("Settings", UDim2.new(0, 255, 0, 8), false, "⚙️")
local aboutTab = createPremiumTab("About", UDim2.new(0, 375, 0, 8), false, "ℹ️")

-- Enhanced Content Container
local contentContainer = Instance.new("Frame", mainContainer)
contentContainer.Size = UDim2.new(1, -40, 1, -140)
contentContainer.Position = UDim2.new(0, 20, 0, 130)
contentContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
contentContainer.BackgroundTransparency = 0.9
contentContainer.ClipsDescendants = true

local contentCorner = Instance.new("UICorner", contentContainer)
contentCorner.CornerRadius = UDim.new(0, 16)

-- Scripts Content with Enhanced Scrolling
local scriptsContent = Instance.new("ScrollingFrame", contentContainer)
scriptsContent.Name = "ScriptsContent"
scriptsContent.Size = UDim2.new(1, -10, 1, -10)
scriptsContent.Position = UDim2.new(0, 5, 0, 5)
scriptsContent.BackgroundTransparency = 1
scriptsContent.ScrollBarThickness = 4
scriptsContent.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
scriptsContent.ScrollBarImageTransparency = 0.5
scriptsContent.ScrollingDirection = Enum.ScrollingDirection.Y
scriptsContent.CanvasSize = UDim2.new(0, 0, 0, 0)
scriptsContent.Visible = true

-- Enhanced Executor Content
local executorContent = Instance.new("Frame", contentContainer)
executorContent.Name = "ExecutorContent"
executorContent.Size = UDim2.new(1, -10, 1, -10)
executorContent.Position = UDim2.new(0, 5, 0, 5)
executorContent.BackgroundTransparency = 1
executorContent.Visible = false

-- Premium Executor TextBox
local executorBox = Instance.new("TextBox", executorContent)
executorBox.Size = UDim2.new(1, 0, 1, -50)
executorBox.Position = UDim2.new(0, 0, 0, 0)
executorBox.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
executorBox.BackgroundTransparency = 0.1
executorBox.Font = Enum.Font.Code
executorBox.Text = "-- VenKey Premium Executor\n-- Advanced Lua Script Environment\n\nprint('Welcome to VenKey Premium!')\nprint('Execute your scripts with confidence')"
executorBox.TextColor3 = Color3.fromRGB(220, 220, 220)
executorBox.TextSize = 13
executorBox.TextXAlignment = Enum.TextXAlignment.Left
executorBox.TextYAlignment = Enum.TextYAlignment.Top
executorBox.MultiLine = true
executorBox.ClearTextOnFocus = false
executorBox.TextWrapped = true

local executorCorner = Instance.new("UICorner", executorBox)
executorCorner.CornerRadius = UDim.new(0, 12)

local executorStroke = Instance.new("UIStroke", executorBox)
executorStroke.Color = Color3.fromRGB(100, 150, 255)
executorStroke.Thickness = 1.5
executorStroke.Transparency = 0.6

-- Enhanced Execute Button
local executeScriptBtn = Instance.new("TextButton", executorContent)
executeScriptBtn.Size = UDim2.new(0, 120, 0, 35)
executeScriptBtn.Position = UDim2.new(1, -125, 1, -40)
executeScriptBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
executeScriptBtn.BackgroundTransparency = 0.1
executeScriptBtn.Font = Enum.Font.GothamBold
executeScriptBtn.Text = "⚡ Execute"
executeScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
executeScriptBtn.TextSize = 13
executeScriptBtn.AutoButtonColor = false

local executeScriptCorner = Instance.new("UICorner", executeScriptBtn)
executeScriptCorner.CornerRadius = UDim.new(0, 18)

local executeGradient = Instance.new("UIGradient", executeScriptBtn)
executeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 220, 120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 180, 80))
}
executeGradient.Rotation = 45

-- Enhanced Clear Button
local clearScriptBtn = Instance.new("TextButton", executorContent)
clearScriptBtn.Size = UDim2.new(0, 100, 0, 35)
clearScriptBtn.Position = UDim2.new(1, -235, 1, -40)
clearScriptBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 150)
clearScriptBtn.BackgroundTransparency = 0.1
clearScriptBtn.Font = Enum.Font.GothamBold
clearScriptBtn.Text = "🗑️ Clear"
clearScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearScriptBtn.TextSize = 13
clearScriptBtn.AutoButtonColor = false

local clearScriptCorner = Instance.new("UICorner", clearScriptBtn)
clearScriptCorner.CornerRadius = UDim.new(0, 18)

local clearGradient = Instance.new("UIGradient", clearScriptBtn)
clearGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 130, 130))
}
clearGradient.Rotation = 45

-- Settings Content
local settingsContent = Instance.new("Frame", contentContainer)
settingsContent.Name = "SettingsContent"
settingsContent.Size = UDim2.new(1, -10, 1, -10)
settingsContent.Position = UDim2.new(0, 5, 0, 5)
settingsContent.BackgroundTransparency = 1
settingsContent.Visible = false

-- About Content
local aboutContent = Instance.new("Frame", contentContainer)
aboutContent.Name = "AboutContent"
aboutContent.Size = UDim2.new(1, -10, 1, -10)
aboutContent.Position = UDim2.new(0, 5, 0, 5)
aboutContent.BackgroundTransparency = 1
aboutContent.Visible = false

-- Enhanced About Text
local aboutText = Instance.new("TextLabel", aboutContent)
aboutText.Size = UDim2.new(1, 0, 1, 0)
aboutText.Font = Enum.Font.Gotham
aboutText.Text = "🚀 VenKey Premium - KeyLess Script Hub\n\n✨ Premium Features:\n🔓 Advanced key bypass technology\n⚡ Lightning-fast script execution\n🎨 Premium glass morphism design\n🛡️ Enhanced security protocols\n💻 Professional script executor\n📱 Optimized responsive layout\n🌟 Premium user experience\n\n🔧 Technical Specifications:\n• Modern Lua execution engine\n• Advanced UI animations\n• Secure script loading\n• Cross-platform compatibility\n\n📊 Version: 4.0 Premium Edition\n👨‍💻 Created by VTriP Syntary\n🌐 Premium KeyLess Technology"
aboutText.TextColor3 = Color3.fromRGB(60, 60, 60)
aboutText.TextSize = 13
aboutText.TextYAlignment = Enum.TextYAlignment.Top
aboutText.BackgroundTransparency = 1
aboutText.TextWrapped = true

-- Enhanced Settings
local function createSettingCard(title, description, yPos, hasToggle)
    local settingCard = Instance.new("Frame", settingsContent)
    settingCard.Size = UDim2.new(1, 0, 0, 60)
    settingCard.Position = UDim2.new(0, 0, 0, yPos)
    settingCard.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    settingCard.BackgroundTransparency = 0.3
    
    local cardCorner = Instance.new("UICorner", settingCard)
    cardCorner.CornerRadius = UDim.new(0, 12)
    
    local cardStroke = Instance.new("UIStroke", settingCard)
    cardStroke.Color = Color3.fromRGB(200, 200, 200)
    cardStroke.Thickness = 1
    cardStroke.Transparency = 0.5
    
    local titleLabel = Instance.new("TextLabel", settingCard)
    titleLabel.Size = UDim2.new(1, -70, 0, 20)
    titleLabel.Position = UDim2.new(0, 15, 0, 10)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(40, 40, 40)
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.BackgroundTransparency = 1
    
    local descLabel = Instance.new("TextLabel", settingCard)
    descLabel.Size = UDim2.new(1, -70, 0, 16)
    descLabel.Position = UDim2.new(0, 15, 0, 30)
    descLabel.Font = Enum.Font.Gotham
    descLabel.Text = description
    descLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
    descLabel.TextSize = 11
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.BackgroundTransparency = 1
    
    if hasToggle then
        local toggle = Instance.new("TextButton", settingCard)
        toggle.Size = UDim2.new(0, 50, 0, 25)
        toggle.Position = UDim2.new(1, -60, 0, 17)
        toggle.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        toggle.BackgroundTransparency = 0.2
        toggle.Text = "ON"
        toggle.Font = Enum.Font.GothamBold
        toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggle.TextSize = 10
        toggle.AutoButtonColor = false
        
        local toggleCorner = Instance.new("UICorner", toggle)
        toggleCorner.CornerRadius = UDim.new(0, 12)
    end
end

createSettingCard("Auto Execute", "Automatically execute scripts on load", 10, true)
createSettingCard("Safe Mode", "Enhanced security for script execution", 80, true)
createSettingCard("Notifications", "Show execution status notifications", 150, true)

-- Enhanced Script Card Creation
local scriptCount = 0
local function createPremiumScriptCard(scriptName, description, scriptUrl, iconId, category)
    local card = Instance.new("Frame", scriptsContent)
    card.Size = UDim2.new(1, 0, 0, 85)
    card.Position = UDim2.new(0, 0, 0, scriptCount * 95)
    card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    card.BackgroundTransparency = 0.1
    
    local cardCorner = Instance.new("UICorner", card)
    cardCorner.CornerRadius = UDim.new(0, 16)
    
    local cardStroke = Instance.new("UIStroke", card)
    cardStroke.Color = Color3.fromRGB(100, 150, 255)
    cardStroke.Thickness = 1.5
    cardStroke.Transparency = 0.7
    
    local cardGradient = Instance.new("UIGradient", card)
    cardGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(248, 250, 255))
    }
    cardGradient.Rotation = 45
    
    -- Enhanced Icon Background
    local iconBg = Instance.new("Frame", card)
    iconBg.Size = UDim2.new(0, 60, 0, 60)
    iconBg.Position = UDim2.new(0, 12, 0, 12)
    iconBg.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    iconBg.BackgroundTransparency = 0.1
    
    local iconBgCorner = Instance.new("UICorner", iconBg)
    iconBgCorner.CornerRadius = UDim.new(0, 16)
    
    local iconGradient = Instance.new("UIGradient", iconBg)
    iconGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 170, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 130, 255))
    }
    iconGradient.Rotation = 45
    
    local icon = Instance.new("ImageLabel", iconBg)
    icon.Size = UDim2.new(0, 35, 0, 35)
    icon.Position = UDim2.new(0.5, -17, 0.5, -17)
    icon.Image = iconId or "rbxassetid://4483345998"
    icon.BackgroundTransparency = 1
    icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    
    -- Category Badge
    local categoryBadge = Instance.new("TextLabel", card)
    categoryBadge.Size = UDim2.new(0, 60, 0, 18)
    categoryBadge.Position = UDim2.new(0, 85, 0, 8)
    categoryBadge.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
    categoryBadge.BackgroundTransparency = 0.2
    categoryBadge.Font = Enum.Font.GothamBold
    categoryBadge.Text = category or "SCRIPT"
    categoryBadge.TextColor3 = Color3.fromRGB(150, 100, 0)
    categoryBadge.TextSize = 8
    categoryBadge.BorderSizePixel = 0
    
    local badgeCorner = Instance.new("UICorner", categoryBadge)
    badgeCorner.CornerRadius = UDim.new(0, 9)
    
    -- Enhanced Script Name
    local nameLabel = Instance.new("TextLabel", card)
    nameLabel.Size = UDim2.new(1, -200, 0, 24)
    nameLabel.Position = UDim2.new(0, 85, 0, 28)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = scriptName
    nameLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
    nameLabel.TextSize = 16
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.BackgroundTransparency = 1
    
    -- Enhanced Description
    local descLabel = Instance.new("TextLabel", card)
    descLabel.Size = UDim2.new(1, -200, 0, 20)
    descLabel.Position = UDim2.new(0, 85, 0, 50)
    descLabel.Font = Enum.Font.Gotham
    descLabel.Text = description
    descLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
    descLabel.TextSize = 12
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.BackgroundTransparency = 1
    
    -- Premium Execute Button
    local executeBtn = Instance.new("TextButton", card)
    executeBtn.Size = UDim2.new(0, 90, 0, 32)
    executeBtn.Position = UDim2.new(1, -100, 0, 26)
    executeBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    executeBtn.BackgroundTransparency = 0.1
    executeBtn.Font = Enum.Font.GothamBold
    executeBtn.Text = "⚡ Execute"
    executeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeBtn.TextSize = 12
    executeBtn.AutoButtonColor = false
    
    local btnCorner = Instance.new("UICorner", executeBtn)
    btnCorner.CornerRadius = UDim.new(0, 16)
    
    local btnGradient = Instance.new("UIGradient", executeBtn)
    btnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 220, 120)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 180, 80))
    }
    btnGradient.Rotation = 45
    
    -- Enhanced Execute Function
    executeBtn.MouseButton1Click:Connect(function()
        -- Premium button animation
        local pressInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        TweenService:Create(executeBtn, pressInfo, {
            Size = UDim2.new(0, 85, 0, 30),
            BackgroundTransparency = 0.3
        }):Play()
        
        wait(0.1)
        
        TweenService:Create(executeBtn, pressInfo, {
            Size = UDim2.new(0, 90, 0, 32),
            BackgroundTransparency = 0.1
        }):Play()
        
        -- Execute script
        if scriptName == "SpeedHub X" then
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://github.com/TDAIP/HubDeStroy/raw/refs/heads/main/Grow%20a%20Garden.lua%20(2).txt", true))()
            end)
            
            if success then
                print("✅ [VenKey Premium] Successfully executed:", scriptName)
                executeBtn.Text = "✅ Done"
                wait(2)
                executeBtn.Text = "⚡ Execute"
            else
                warn("❌ [VenKey Premium] Failed to execute:", scriptName)
                executeBtn.Text = "❌ Error"
                wait(2)
                executeBtn.Text = "⚡ Execute"
            end
        else
            local success, result = pcall(function()
                local scriptCode = game:HttpGet(scriptUrl)
                return loadstring(scriptCode)
            end)
            
            if success and result then
                pcall(result)
                print("✅ [VenKey Premium] Successfully executed:", scriptName)
                executeBtn.Text = "✅ Done"
                wait(2)
                executeBtn.Text = "⚡ Execute"
            else
                warn("❌ [VenKey Premium] Failed to execute:", scriptName)
                executeBtn.Text = "❌ Error"
                wait(2)
                executeBtn.Text = "⚡ Execute"
            end
        end
    end)
    
    -- Hover Effects
    executeBtn.MouseEnter:Connect(function()
        TweenService:Create(executeBtn, TweenInfo.new(0.2), {
            Size = UDim2.new(0, 95, 0, 35)
        }):Play()
    end)
    
    executeBtn.MouseLeave:Connect(function()
        TweenService:Create(executeBtn, TweenInfo.new(0.2), {
            Size = UDim2.new(0, 90, 0, 32)
        }):Play()
    end)
    
    scriptCount = scriptCount + 1
    scriptsContent.CanvasSize = UDim2.new(0, 0, 0, scriptCount * 95 + 20)
end

-- Add Premium Scripts
createPremiumScriptCard("SpeedHub X", "Universal script hub with premium keyless access", "https://github.com/TDAIP/HubDeStroy/raw/refs/heads/main/Grow%20a%20Garden.lua%20(2).txt", "rbxassetid://136890595976124", "HUB")

-- Enhanced Executor Functions
executeScriptBtn.MouseButton1Click:Connect(function()
    local code = executorBox.Text
    if code and code ~= "" then
        executeScriptBtn.Text = "⚡ Running..."
        
        local success, result = pcall(function()
            return loadstring(code)
        end)
        
        if success and result then
            pcall(result)
            print("✅ [VenKey Premium Executor] Script executed successfully")
            executeScriptBtn.Text = "✅ Success"
        else
            warn("❌ [VenKey Premium Executor] Script execution failed")
            executeScriptBtn.Text = "❌ Failed"
        end
        
        wait(2)
        executeScriptBtn.Text = "⚡ Execute"
    end
end)

clearScriptBtn.MouseButton1Click:Connect(function()
    executorBox.Text = "-- VenKey Premium Executor\n-- Advanced Lua Script Environment\n\nprint('Welcome to VenKey Premium!')\nprint('Execute your scripts with confidence')"
end)

-- Enhanced Tab Switching with Animations
local function switchTab(tabName)
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    -- Hide all content with fade
    local fadeOut = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(scriptsContent, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(executorContent, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(settingsContent, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(aboutContent, fadeOut, {BackgroundTransparency = 1}):Play()
    
    wait(0.2)
    
    scriptsContent.Visible = false
    executorContent.Visible = false
    settingsContent.Visible = false
    aboutContent.Visible = false
    
    -- Reset all tabs
    TweenService:Create(scriptsTab, tweenInfo, {BackgroundTransparency = 0.8}):Play()
    TweenService:Create(executorTab, tweenInfo, {BackgroundTransparency = 0.8}):Play()
    TweenService:Create(settingsTab, tweenInfo, {BackgroundTransparency = 0.8}):Play()
    TweenService:Create(aboutTab, tweenInfo, {BackgroundTransparency = 0.8}):Play()
    
    -- Show selected content with fade in
    local fadeIn = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if tabName == "Scripts" then
        scriptsContent.Visible = true
        TweenService:Create(scriptsTab, tweenInfo, {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(scriptsContent, fadeIn, {BackgroundTransparency = 1}):Play()
    elseif tabName == "Executor" then
        executorContent.Visible = true
        TweenService:Create(executorTab, tweenInfo, {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(executorContent, fadeIn, {BackgroundTransparency = 1}):Play()
    elseif tabName == "Settings" then
        settingsContent.Visible = true
        TweenService:Create(settingsTab, tweenInfo, {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(settingsContent, fadeIn, {BackgroundTransparency = 1}):Play()
    elseif tabName == "About" then
        aboutContent.Visible = true
        TweenService:Create(aboutTab, tweenInfo, {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(aboutContent, fadeIn, {BackgroundTransparency = 1}):Play()
    end
end

-- Connect Enhanced Tab Events
scriptsTab.MouseButton1Click:Connect(function() switchTab("Scripts") end)
executorTab.MouseButton1Click:Connect(function() switchTab("Executor") end)
settingsTab.MouseButton1Click:Connect(function() switchTab("Settings") end)
aboutTab.MouseButton1Click:Connect(function() switchTab("About") end)

-- Enhanced Close Button with Animation
closeButton.MouseButton1Click:Connect(function()
    local closeInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    
    TweenService:Create(blurFrame, closeInfo, {
        BackgroundTransparency = 1
    }):Play()
    
    TweenService:Create(mainContainer, closeInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.5)
    screenGui:Destroy()
end)

-- Enhanced Hover Effects for Close Button
closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.3,
        Size = UDim2.new(0, 35, 0, 35)
    }):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.8,
        Size = UDim2.new(0, 32, 0, 32)
    }):Play()
end)

-- Enhanced Drag Functionality
local dragging = false
local dragStart = nil
local startPos = nil

headerFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainContainer.Position
        
        -- Visual feedback
        TweenService:Create(mainContainer, TweenInfo.new(0.1), {
            BackgroundTransparency = 0.05
        }):Play()
    end
end)

headerFrame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainContainer.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

headerFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        
        -- Reset visual feedback
        TweenService:Create(mainContainer, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.15
        }):Play()
    end
end)

-- Status Indicator Animation
spawn(function()
    while wait(2) do
        TweenService:Create(statusIndicator, TweenInfo.new(0.5), {
            BackgroundTransparency = 0.5
        }):Play()
        wait(0.5)
        TweenService:Create(statusIndicator, TweenInfo.new(0.5), {
            BackgroundTransparency = 0
        }):Play()
    end
end)

-- Premium Opening Animation
spawn(function()
    wait(0.1)
    
    -- Animate blur background
    TweenService:Create(blurFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.3
    }):Play()
    
    -- Animate main container with premium size
    TweenService:Create(mainContainer, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 580, 0, 380)  -- Premium larger size
    }):Play()
    
    -- Animate logo rotation
    spawn(function()
        while wait(0.1) do
            TweenService:Create(logoFrame, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                Rotation = logoFrame.Rotation + 360
            }):Play()
            wait(2)
        end
    end)
end)

print("🚀 VenKey Premium UI Loaded Successfully!")
print("📐 Premium Dimensions: 580x380")
print("💎 Advanced Glass Morphism Design")
print("🔓 Premium KeyLess Script Hub Ready!")
print("⚡ Enhanced Features & Animations Active!")
print("🌟 Premium Edition - Version 4.0")