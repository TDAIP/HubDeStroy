-- VenKey - Modern KeyLess Script Hub (Optimized Layout)
-- Professional Glass Morphism UI Design with Executor

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VenKeyModern"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Container with Glass Morphism (Optimized Size: 532x326)
local mainContainer = Instance.new("Frame", screenGui)
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0, 0, 0, 0)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
mainContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainContainer.BackgroundTransparency = 0.5  -- Darker transparency (50% instead of 70%)
mainContainer.ClipsDescendants = true
mainContainer.ZIndex = 2

-- Glass Effect Corner
local containerCorner = Instance.new("UICorner", mainContainer)
containerCorner.CornerRadius = UDim.new(0, 20)

-- Glass Border
local containerStroke = Instance.new("UIStroke", mainContainer)
containerStroke.Color = Color3.fromRGB(255, 255, 255)
containerStroke.Thickness = 1.5
containerStroke.Transparency = 0.4

-- Header Section
local headerFrame = Instance.new("Frame", mainContainer)
headerFrame.Size = UDim2.new(1, 0, 0, 50)
headerFrame.BackgroundTransparency = 1
headerFrame.ZIndex = 3

-- Compact Title
local titleLabel = Instance.new("TextLabel", headerFrame)
titleLabel.Size = UDim2.new(1, -60, 0, 24)
titleLabel.Position = UDim2.new(0, 15, 0, 6)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "VenKey"
titleLabel.TextColor3 = Color3.fromRGB(40, 40, 40)
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1

-- Subtitle
local subtitleLabel = Instance.new("TextLabel", headerFrame)
subtitleLabel.Size = UDim2.new(1, -60, 0, 16)
subtitleLabel.Position = UDim2.new(0, 15, 0, 28)
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.Text = "KeyLess Script Hub"
subtitleLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
subtitleLabel.TextSize = 11
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.BackgroundTransparency = 1

-- Modern Close Button (Transparent with Black Icon)
local closeButton = Instance.new("TextButton", headerFrame)
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -38, 0, 11)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
closeButton.BackgroundTransparency = 1  -- 100% transparent
closeButton.Text = "×"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black icon
closeButton.AutoButtonColor = false

local closeCorner = Instance.new("UICorner", closeButton)
closeCorner.CornerRadius = UDim.new(0, 14)

-- Divider Line
local divider = Instance.new("Frame", mainContainer)
divider.Size = UDim2.new(1, -30, 0, 1)
divider.Position = UDim2.new(0, 15, 0, 50)
divider.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
divider.BackgroundTransparency = 0.6
divider.BorderSizePixel = 0

-- Tab Navigation
local tabFrame = Instance.new("Frame", mainContainer)
tabFrame.Size = UDim2.new(1, 0, 0, 40)
tabFrame.Position = UDim2.new(0, 0, 0, 60)
tabFrame.BackgroundTransparency = 1

local function createModernTab(name, position, isActive)
    local tab = Instance.new("TextButton", tabFrame)
    tab.Name = name .. "Tab"
    tab.Size = UDim2.new(0, 90, 0, 28)
    tab.Position = position
    tab.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    tab.BackgroundTransparency = isActive and 0.3 or 0.7
    tab.Font = Enum.Font.GothamMedium
    tab.Text = name
    tab.TextColor3 = Color3.fromRGB(50, 50, 50)
    tab.TextSize = 12
    tab.AutoButtonColor = false
    
    local tabCorner = Instance.new("UICorner", tab)
    tabCorner.CornerRadius = UDim.new(0, 14)
    
    return tab
end

local scriptsTab = createModernTab("Scripts", UDim2.new(0, 15, 0, 6), true)
local executorTab = createModernTab("Executor", UDim2.new(0, 115, 0, 6), false)
local settingsTab = createModernTab("Settings", UDim2.new(0, 215, 0, 6), false)
local aboutTab = createModernTab("About", UDim2.new(0, 315, 0, 6), false)

-- Content Container
local contentContainer = Instance.new("Frame", mainContainer)
contentContainer.Size = UDim2.new(1, -30, 1, -115)
contentContainer.Position = UDim2.new(0, 15, 0, 110)
contentContainer.BackgroundTransparency = 1
contentContainer.ClipsDescendants = true

-- Scripts Content (ScrollingFrame with hidden scrollbar)
local scriptsContent = Instance.new("ScrollingFrame", contentContainer)
scriptsContent.Name = "ScriptsContent"
scriptsContent.Size = UDim2.new(1, 0, 1, 0)
scriptsContent.BackgroundTransparency = 1
scriptsContent.ScrollBarThickness = 0
scriptsContent.ScrollingDirection = Enum.ScrollingDirection.Y
scriptsContent.CanvasSize = UDim2.new(0, 0, 0, 0)
scriptsContent.Visible = true

-- Executor Content
local executorContent = Instance.new("Frame", contentContainer)
executorContent.Name = "ExecutorContent"
executorContent.Size = UDim2.new(1, 0, 1, 0)
executorContent.BackgroundTransparency = 1
executorContent.Visible = false

-- Executor TextBox
local executorBox = Instance.new("TextBox", executorContent)
executorBox.Size = UDim2.new(1, 0, 1, -40)
executorBox.Position = UDim2.new(0, 0, 0, 0)
executorBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
executorBox.BackgroundTransparency = 0.3
executorBox.Font = Enum.Font.Code
executorBox.Text = "-- Enter your Lua script here\nprint('Hello VenKey!')"
executorBox.TextColor3 = Color3.fromRGB(50, 50, 50)
executorBox.TextSize = 12
executorBox.TextXAlignment = Enum.TextXAlignment.Left
executorBox.TextYAlignment = Enum.TextYAlignment.Top
executorBox.MultiLine = true
executorBox.ClearTextOnFocus = false
executorBox.TextWrapped = true

local executorCorner = Instance.new("UICorner", executorBox)
executorCorner.CornerRadius = UDim.new(0, 12)

-- Execute Button for Executor
local executeScriptBtn = Instance.new("TextButton", executorContent)
executeScriptBtn.Size = UDim2.new(0, 100, 0, 30)
executeScriptBtn.Position = UDim2.new(1, -105, 1, -35)
executeScriptBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
executeScriptBtn.BackgroundTransparency = 0.2
executeScriptBtn.Font = Enum.Font.GothamMedium
executeScriptBtn.Text = "Execute"
executeScriptBtn.TextColor3 = Color3.fromRGB(40, 40, 40)
executeScriptBtn.TextSize = 12
executeScriptBtn.AutoButtonColor = false

local executeScriptCorner = Instance.new("UICorner", executeScriptBtn)
executeScriptCorner.CornerRadius = UDim.new(0, 15)

-- Clear Button for Executor
local clearScriptBtn = Instance.new("TextButton", executorContent)
clearScriptBtn.Size = UDim2.new(0, 80, 0, 30)
clearScriptBtn.Position = UDim2.new(1, -195, 1, -35)
clearScriptBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 150)
clearScriptBtn.BackgroundTransparency = 0.2
clearScriptBtn.Font = Enum.Font.GothamMedium
clearScriptBtn.Text = "Clear"
clearScriptBtn.TextColor3 = Color3.fromRGB(40, 40, 40)
clearScriptBtn.TextSize = 12
clearScriptBtn.AutoButtonColor = false

local clearScriptCorner = Instance.new("UICorner", clearScriptBtn)
clearScriptCorner.CornerRadius = UDim.new(0, 15)

-- Settings Content
local settingsContent = Instance.new("Frame", contentContainer)
settingsContent.Name = "SettingsContent"
settingsContent.Size = UDim2.new(1, 0, 1, 0)
settingsContent.BackgroundTransparency = 1
settingsContent.Visible = false

-- About Content
local aboutContent = Instance.new("Frame", contentContainer)
aboutContent.Name = "AboutContent"
aboutContent.Size = UDim2.new(1, 0, 1, 0)
aboutContent.BackgroundTransparency = 1
aboutContent.Visible = false

-- About Text
local aboutText = Instance.new("TextLabel", aboutContent)
aboutText.Size = UDim2.new(1, 0, 1, 0)
aboutText.Font = Enum.Font.Gotham
aboutText.Text = "VenKey - KeyLess Script Hub\n\n🔓 Bypass script keys automatically\n⚡ Fast and reliable execution\n🎨 Modern glass morphism design\n🛡️ Safe and secure\n💻 Built-in script executor\n📱 Optimized compact layout\n\nVersion: 3.1 Optimized\nCreated by VTriP Syntary"
aboutText.TextColor3 = Color3.fromRGB(70, 70, 70)
aboutText.TextSize = 13
aboutText.TextYAlignment = Enum.TextYAlignment.Top
aboutText.BackgroundTransparency = 1
aboutText.TextWrapped = true

-- Settings Toggle
local autoExecuteFrame = Instance.new("Frame", settingsContent)
autoExecuteFrame.Size = UDim2.new(1, 0, 0, 45)
autoExecuteFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
autoExecuteFrame.BackgroundTransparency = 0.4
autoExecuteFrame.Position = UDim2.new(0, 0, 0, 10)

local settingCorner = Instance.new("UICorner", autoExecuteFrame)
settingCorner.CornerRadius = UDim.new(0, 12)

local settingLabel = Instance.new("TextLabel", autoExecuteFrame)
settingLabel.Size = UDim2.new(1, -50, 1, 0)
settingLabel.Position = UDim2.new(0, 12, 0, 0)
settingLabel.Font = Enum.Font.GothamMedium
settingLabel.Text = "Auto Execute Scripts"
settingLabel.TextColor3 = Color3.fromRGB(60, 60, 60)
settingLabel.TextSize = 13
settingLabel.TextXAlignment = Enum.TextXAlignment.Left
settingLabel.BackgroundTransparency = 1

-- Enhanced Script Card Creation
local scriptCount = 0
local function createScriptCard(scriptName, description, scriptUrl, iconId)
    local card = Instance.new("Frame", scriptsContent)
    card.Size = UDim2.new(1, 0, 0, 70)
    card.Position = UDim2.new(0, 0, 0, scriptCount * 80)
    card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    card.BackgroundTransparency = 0.2  -- Less transparent for better visibility
    
    local cardCorner = Instance.new("UICorner", card)
    cardCorner.CornerRadius = UDim.new(0, 16)
    
    local cardStroke = Instance.new("UIStroke", card)
    cardStroke.Color = Color3.fromRGB(180, 180, 180)
    cardStroke.Thickness = 1.2
    cardStroke.Transparency = 0.5
    
    -- Enhanced Script Icon with Background
    local iconBg = Instance.new("Frame", card)
    iconBg.Size = UDim2.new(0, 50, 0, 50)
    iconBg.Position = UDim2.new(0, 10, 0, 10)
    iconBg.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    iconBg.BackgroundTransparency = 0.8
    
    local iconBgCorner = Instance.new("UICorner", iconBg)
    iconBgCorner.CornerRadius = UDim.new(0, 12)
    
    local icon = Instance.new("ImageLabel", iconBg)
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Position = UDim2.new(0.5, -15, 0.5, -15)
    icon.Image = iconId or "rbxassetid://4483345998"
    icon.BackgroundTransparency = 1
    icon.ImageColor3 = Color3.fromRGB(100, 150, 255)
    
    -- Enhanced Script Name
    local nameLabel = Instance.new("TextLabel", card)
    nameLabel.Size = UDim2.new(1, -160, 0, 22)
    nameLabel.Position = UDim2.new(0, 70, 0, 12)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = scriptName
    nameLabel.TextColor3 = Color3.fromRGB(40, 40, 40)
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.BackgroundTransparency = 1
    
    -- Enhanced Script Description
    local descLabel = Instance.new("TextLabel", card)
    descLabel.Size = UDim2.new(1, -160, 0, 18)
    descLabel.Position = UDim2.new(0, 70, 0, 32)
    descLabel.Font = Enum.Font.Gotham
    descLabel.Text = description
    descLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
    descLabel.TextSize = 11
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.BackgroundTransparency = 1
    
    -- Enhanced Execute Button
    local executeBtn = Instance.new("TextButton", card)
    executeBtn.Size = UDim2.new(0, 75, 0, 28)
    executeBtn.Position = UDim2.new(1, -85, 0, 21)
    executeBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    executeBtn.BackgroundTransparency = 0.1
    executeBtn.Font = Enum.Font.GothamMedium
    executeBtn.Text = "Execute"
    executeBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
    executeBtn.TextSize = 11
    executeBtn.AutoButtonColor = false
    
    local btnCorner = Instance.new("UICorner", executeBtn)
    btnCorner.CornerRadius = UDim.new(0, 14)
    
    local btnStroke = Instance.new("UIStroke", executeBtn)
    btnStroke.Color = Color3.fromRGB(100, 200, 100)
    btnStroke.Thickness = 1
    btnStroke.Transparency = 0.6
    
    -- Execute Function with Updated SpeedHub Script
    executeBtn.MouseButton1Click:Connect(function()
        -- Button animation
        TweenService:Create(executeBtn, TweenInfo.new(0.1), {
            BackgroundTransparency = 0.3
        }):Play()
        
        wait(0.1)
        
        TweenService:Create(executeBtn, TweenInfo.new(0.1), {
            BackgroundTransparency = 0.1
        }):Play()
        
        -- Execute script with new loadstring format
        if scriptName == "SpeedHub X" then
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://github.com/TDAIP/HubDeStroy/raw/refs/heads/main/Grow%20a%20Garden.lua%20(2).txt", true))()
            end)
            
            if success then
                print("✅ [VenKey] Successfully executed:", scriptName)
            else
                warn("❌ [VenKey] Failed to execute:", scriptName)
            end
        else
            -- For other scripts
            local success, result = pcall(function()
                local scriptCode = game:HttpGet(scriptUrl)
                return loadstring(scriptCode)
            end)
            
            if success and result then
                pcall(result)
                print("✅ [VenKey] Successfully executed:", scriptName)
            else
                warn("❌ [VenKey] Failed to execute:", scriptName)
            end
        end
    end)
    
    scriptCount = scriptCount + 1
    scriptsContent.CanvasSize = UDim2.new(0, 0, 0, scriptCount * 80 + 10)
end

-- Add SpeedHub X Script
createScriptCard("SpeedHub X", "Universal script hub with keyless access", "https://github.com/TDAIP/HubDeStroy/raw/refs/heads/main/Grow%20a%20Garden.lua%20(2).txt", "rbxassetid://136890595976124")

-- Executor Functions
executeScriptBtn.MouseButton1Click:Connect(function()
    local code = executorBox.Text
    if code and code ~= "" then
        local success, result = pcall(function()
            return loadstring(code)
        end)
        
        if success and result then
            pcall(result)
            print("✅ [VenKey Executor] Script executed successfully")
        else
            warn("❌ [VenKey Executor] Script execution failed")
        end
    end
end)

clearScriptBtn.MouseButton1Click:Connect(function()
    executorBox.Text = "-- Enter your Lua script here\nprint('Hello VenKey!')"
end)

-- Tab Switching Function
local function switchTab(tabName)
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    -- Hide all content
    scriptsContent.Visible = false
    executorContent.Visible = false
    settingsContent.Visible = false
    aboutContent.Visible = false
    
    -- Reset all tabs
    TweenService:Create(scriptsTab, tweenInfo, {BackgroundTransparency = 0.7}):Play()
    TweenService:Create(executorTab, tweenInfo, {BackgroundTransparency = 0.7}):Play()
    TweenService:Create(settingsTab, tweenInfo, {BackgroundTransparency = 0.7}):Play()
    TweenService:Create(aboutTab, tweenInfo, {BackgroundTransparency = 0.7}):Play()
    
    -- Show selected content and highlight tab
    if tabName == "Scripts" then
        scriptsContent.Visible = true
        TweenService:Create(scriptsTab, tweenInfo, {BackgroundTransparency = 0.3}):Play()
    elseif tabName == "Executor" then
        executorContent.Visible = true
        TweenService:Create(executorTab, tweenInfo, {BackgroundTransparency = 0.3}):Play()
    elseif tabName == "Settings" then
        settingsContent.Visible = true
        TweenService:Create(settingsTab, tweenInfo, {BackgroundTransparency = 0.3}):Play()
    elseif tabName == "About" then
        aboutContent.Visible = true
        TweenService:Create(aboutTab, tweenInfo, {BackgroundTransparency = 0.3}):Play()
    end
end

-- Connect Tab Events
scriptsTab.MouseButton1Click:Connect(function() switchTab("Scripts") end)
executorTab.MouseButton1Click:Connect(function() switchTab("Executor") end)
settingsTab.MouseButton1Click:Connect(function() switchTab("Settings") end)
aboutTab.MouseButton1Click:Connect(function() switchTab("About") end)

-- Close Button Function
closeButton.MouseButton1Click:Connect(function()
    local closeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    
    TweenService:Create(mainContainer, closeInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.4)
    screenGui:Destroy()
end)

-- Drag Functionality
local dragging = false
local dragStart = nil
local startPos = nil

headerFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainContainer.Position
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
    end
end)

-- Smooth Touch Scrolling
local touchScrolling = false
local lastTouchY = nil

scriptsContent.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        touchScrolling = true
        lastTouchY = input.Position.Y
    end
end)

scriptsContent.InputChanged:Connect(function(input)
    if touchScrolling and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        if lastTouchY then
            local deltaY = input.Position.Y - lastTouchY
            local currentPos = scriptsContent.CanvasPosition.Y
            local newPos = math.max(0, math.min(
                scriptsContent.CanvasSize.Y.Offset - scriptsContent.AbsoluteSize.Y,
                currentPos - deltaY * 2
            ))
            scriptsContent.CanvasPosition = Vector2.new(0, newPos)
        end
        lastTouchY = input.Position.Y
    end
end)

scriptsContent.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        touchScrolling = false
        lastTouchY = nil
    end
end)

-- Opening Animation (Optimized Size: 532x326)
spawn(function()
    wait(0.1)
    
    -- Animate main container with optimized dimensions
    TweenService:Create(mainContainer, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 532, 0, 326)  -- Width -30% (532px), Height -15% (326px)
    }):Play()
end)

print("🚀 VenKey Optimized UI Loaded Successfully!")
print("📐 Dimensions: 532x326 (Optimized Compact)")
print("💎 Enhanced Glass Morphism Design")
print("🔓 KeyLess Script Hub with Executor Ready!")
print("⚡ SpeedHub X with Updated Script!")
