-- VenKey By VTriP Syntary (Modern Enhanced Version)
-- Modern UI Script for Roblox with Advanced Transparency and Touch Controls

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VenKeyUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Modern Blur Effect
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 0
blurEffect.Parent = game.Lighting

-- Welcome Frame with Enhanced Animation
local welcomeFrame = Instance.new("Frame", screenGui)
welcomeFrame.Name = "WelcomeFrame"
welcomeFrame.BackgroundTransparency = 1
welcomeFrame.Size = UDim2.new(1, 0, 1, 0)
welcomeFrame.ZIndex = 10

-- Modern Welcome Background
local welcomeBg = Instance.new("Frame", welcomeFrame)
welcomeBg.Size = UDim2.new(1, 0, 1, 0)
welcomeBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
welcomeBg.BackgroundTransparency = 0.3
welcomeBg.ZIndex = 9

local welcomeLabel = Instance.new("TextLabel", welcomeFrame)
welcomeLabel.Size = UDim2.new(0, 500, 0, 120)
welcomeLabel.Position = UDim2.new(0.5, -250, 0.5, -60)
welcomeLabel.Font = Enum.Font.GothamBold
welcomeLabel.Text = "Welcome to The, <font color='rgb(255, 87, 51)'>VTriP Syntary</font>"
welcomeLabel.TextColor3 = Color3.new(1, 1, 1)
welcomeLabel.TextSize = 28
welcomeLabel.TextStrokeTransparency = 0.3
welcomeLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
welcomeLabel.RichText = true
welcomeLabel.TextTransparency = 1
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.ZIndex = 11

-- Main Frame with Glass Morphism Effect
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BackgroundTransparency = 0.15
mainFrame.ClipsDescendants = true

-- Glass Morphism Corner
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 16)

-- Modern Glass Effect
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(255, 255, 255)
mainStroke.Thickness = 1
mainStroke.Transparency = 0.8

-- Enhanced Gradient
local mainGradient = Instance.new("UIGradient", mainFrame)
mainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 20)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 87, 51)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 87, 51)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
})
mainGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(0.5, 0.95),
    NumberSequenceKeypoint.new(1, 0.1)
})

-- Title with Modern Styling
local titleFrame = Instance.new("Frame", mainFrame)
titleFrame.Size = UDim2.new(1, 0, 0, 50)
titleFrame.BackgroundTransparency = 1

local titleLabel = Instance.new("TextLabel", titleFrame)
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "VenKey By VTriP Syntary"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.TextStrokeTransparency = 0.7
titleLabel.TextStrokeColor3 = Color3.fromRGB(255, 87, 51)

-- Modern Close Button
local closeButton = Instance.new("ImageButton", titleFrame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0.5, -15)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 87, 51)
closeButton.BackgroundTransparency = 0.2
closeButton.Image = "rbxassetid://3926305904"
closeButton.ImageColor3 = Color3.new(1, 1, 1)

local closeCorner = Instance.new("UICorner", closeButton)
closeCorner.CornerRadius = UDim.new(0, 8)

local closeStroke = Instance.new("UIStroke", closeButton)
closeStroke.Color = Color3.fromRGB(255, 87, 51)
closeStroke.Thickness = 1.5
closeStroke.Transparency = 0.5

-- Tab Frame with Modern Design
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(1, 0, 0, 45)
tabFrame.Position = UDim2.new(0, 0, 0, 50)
tabFrame.BackgroundTransparency = 1

local function createTabButton(name, position)
    local button = Instance.new("TextButton", tabFrame)
    button.Name = name .. "Tab"
    button.Size = UDim2.new(0, 90, 0, 35)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(255, 87, 51)
    button.BackgroundTransparency = 0.3
    button.Font = Enum.Font.GothamMedium
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 13
    button.AutoButtonColor = false
    
    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", button)
    stroke.Color = Color3.fromRGB(255, 87, 51)
    stroke.Thickness = 1
    stroke.Transparency = 0.6
    
    return button
end

local scriptTab = createTabButton("Script", UDim2.new(0, 15, 0.5, -17.5))
local infoTab = createTabButton("Info", UDim2.new(0, 115, 0.5, -17.5))

-- Enhanced Content Frame with Hidden Scrollbar
local contentFrame = Instance.new("ScrollingFrame", mainFrame)
contentFrame.Size = UDim2.new(1, -30, 1, -115)
contentFrame.Position = UDim2.new(0, 15, 0, 105)
contentFrame.ScrollBarThickness = 0  -- Hide scrollbar
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.ScrollingDirection = Enum.ScrollingDirection.Y  -- Vertical only
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

-- Custom Touch Scrolling Variables
local touchScrolling = false
local lastTouchPosition = nil
local scrollVelocity = 0
local scrollConnection = nil

-- Touch Scrolling Implementation (Vertical Only)
local function startTouchScroll(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        touchScrolling = true
        lastTouchPosition = input.Position.Y
        scrollVelocity = 0
        
        if scrollConnection then
            scrollConnection:Disconnect()
        end
    end
end

local function updateTouchScroll(input)
    if touchScrolling and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local currentY = input.Position.Y
        if lastTouchPosition then
            local deltaY = currentY - lastTouchPosition
            scrollVelocity = deltaY * 0.5
            
            -- Apply vertical scrolling only
            local currentCanvasPosition = contentFrame.CanvasPosition.Y
            local newCanvasPosition = math.max(0, math.min(
                contentFrame.CanvasSize.Y.Offset - contentFrame.AbsoluteSize.Y,
                currentCanvasPosition - deltaY * 2
            ))
            
            contentFrame.CanvasPosition = Vector2.new(0, newCanvasPosition)
        end
        lastTouchPosition = currentY
    end
end

local function endTouchScroll(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        touchScrolling = false
        lastTouchPosition = nil
        
        -- Smooth deceleration
        if math.abs(scrollVelocity) > 1 then
            scrollConnection = RunService.Heartbeat:Connect(function()
                scrollVelocity = scrollVelocity * 0.9
                
                local currentCanvasPosition = contentFrame.CanvasPosition.Y
                local newCanvasPosition = math.max(0, math.min(
                    contentFrame.CanvasSize.Y.Offset - contentFrame.AbsoluteSize.Y,
                    currentCanvasPosition - scrollVelocity
                ))
                
                contentFrame.CanvasPosition = Vector2.new(0, newCanvasPosition)
                
                if math.abs(scrollVelocity) < 1 then
                    scrollConnection:Disconnect()
                    scrollConnection = nil
                end
            end)
        end
    end
end

-- Connect touch events
contentFrame.InputBegan:Connect(startTouchScroll)
contentFrame.InputChanged:Connect(updateTouchScroll)
contentFrame.InputEnded:Connect(endTouchScroll)

-- Content Frames
local scriptContent = Instance.new("Frame", contentFrame)
scriptContent.Name = "ScriptContent"
scriptContent.BackgroundTransparency = 1
scriptContent.Size = UDim2.new(1, 0, 0, 0)
scriptContent.Visible = true

local infoContent = Instance.new("Frame", contentFrame)
infoContent.Name = "InfoContent"
infoContent.BackgroundTransparency = 1
infoContent.Size = UDim2.new(1, 0, 0, 200)
infoContent.Visible = false

-- Modern Info Label
local infoLabel = Instance.new("TextLabel", infoContent)
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.Font = Enum.Font.Gotham
infoLabel.Text = "VenKey By VTriP Syntary\n\n🚀 Modern Script Hub\n📱 Version: 2.0 Enhanced\n\n✨ Features:\n• Glass Morphism Design\n• Touch Scroll Controls\n• Modern Transparency Effects\n• Smooth Animations"
infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
infoLabel.TextSize = 14
infoLabel.TextYAlignment = Enum.TextYAlignment.Top
infoLabel.BackgroundTransparency = 1
infoLabel.TextStrokeTransparency = 0.8
infoLabel.TextStrokeColor3 = Color3.fromRGB(255, 87, 51)

-- Enhanced Script Button Creation
local scriptCount = 0
local function createScriptButton(name, logoId, script)
    local frame = Instance.new("Frame", scriptContent)
    frame.Size = UDim2.new(1, 0, 0, 70)
    frame.Position = UDim2.new(0, 0, 0, scriptCount * 80)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    frame.BackgroundTransparency = 0.2
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 12)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(255, 87, 51)
    stroke.Thickness = 1
    stroke.Transparency = 0.7
    
    local logo = Instance.new("ImageLabel", frame)
    logo.Size = UDim2.new(0, 45, 0, 45)
    logo.Position = UDim2.new(0, 12, 0.5, -22.5)
    logo.Image = logoId
    logo.ImageColor3 = Color3.fromRGB(255, 87, 51)
    logo.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -140, 1, 0)
    label.Position = UDim2.new(0, 70, 0, 0)
    label.Font = Enum.Font.GothamMedium
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextSize = 15
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 70, 0, 35)
    button.Position = UDim2.new(1, -80, 0.5, -17.5)
    button.Font = Enum.Font.GothamMedium
    button.Text = "Execute"
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 12
    button.BackgroundColor3 = Color3.fromRGB(255, 87, 51)
    button.BackgroundTransparency = 0.1
    
    local btnCorner = Instance.new("UICorner", button)
    btnCorner.CornerRadius = UDim.new(0, 8)
    
    local btnStroke = Instance.new("UIStroke", button)
    btnStroke.Color = Color3.fromRGB(255, 87, 51)
    btnStroke.Thickness = 1.5
    btnStroke.Transparency = 0.5
    
    -- Enhanced Execute Functionality
    button.MouseButton1Click:Connect(function()
        -- Button animation
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundTransparency = 0.3}):Play()
        wait(0.1)
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundTransparency = 0.1}):Play()
        
        local success, response = pcall(function()
            return game:HttpGet(script)
        end)
        
        if success then
            local func, err = loadstring(response)
            if func then
                print("[VenKey Enhanced]: Executing script:", name)
                pcall(func)
            else
                warn("[VenKey ERROR]: Loadstring error -", err)
            end
        else
            warn("[VenKey ERROR]: Cannot load script from URL -", script)
        end
    end)
    
    scriptCount = scriptCount + 1
    
    -- Update canvas size
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, scriptCount * 80)
end

-- Add Scripts
createScriptButton("SpeedHub X", "rbxassetid://136890595976124", "https://github.com/TDAIP/HubDeStroy/raw/refs/heads/main/Grow%20a%20Garden.lua%20(2).txt")

-- Enhanced Tab Switching
local function switchTab(tabName)
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    if tabName == "Script" then
        scriptContent.Visible = true
        infoContent.Visible = false
        
        TweenService:Create(scriptTab, tweenInfo, {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(infoTab, tweenInfo, {BackgroundTransparency = 0.5}):Play()
    else
        scriptContent.Visible = false
        infoContent.Visible = true
        
        TweenService:Create(scriptTab, tweenInfo, {BackgroundTransparency = 0.5}):Play()
        TweenService:Create(infoTab, tweenInfo, {BackgroundTransparency = 0.1}):Play()
    end
end

scriptTab.MouseButton1Click:Connect(function() switchTab("Script") end)
infoTab.MouseButton1Click:Connect(function() switchTab("Info") end)

-- Enhanced Close Animation
closeButton.MouseButton1Click:Connect(function()
    -- Blur out effect
    TweenService:Create(blurEffect, TweenInfo.new(0.3), {Size = 0}):Play()
    
    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.4)
    screenGui:Destroy()
end)

-- Enhanced Drag Functionality
local dragging, dragStart, startPos = false

titleFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

titleFrame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

titleFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Enhanced Opening Animation
spawn(function()
    -- Blur in effect
    TweenService:Create(blurEffect, TweenInfo.new(0.5), {Size = 5}):Play()
    
    -- Welcome animation
    TweenService:Create(welcomeLabel, TweenInfo.new(0.8, Enum.EasingStyle.Quart), {TextTransparency = 0}):Play()
    wait(2.5)
    
    TweenService:Create(welcomeLabel, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(welcomeBg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    
    wait(0.5)
    welcomeFrame:Destroy()
    
    -- Main frame entrance
    TweenService:Create(mainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 420, 0, 350)
    }):Play()
    
    -- Reduce blur after opening
    wait(0.8)
    TweenService:Create(blurEffect, TweenInfo.new(0.3), {Size = 2}):Play()
end)

print("VenKey Enhanced UI Loaded Successfully! 🚀")
