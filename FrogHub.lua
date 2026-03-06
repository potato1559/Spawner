local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera

player.CharacterAdded:Connect(function(c)
    character = c
end)

local function getHumanoid()
    return character and character:FindFirstChildOfClass("Humanoid")
end
local function getRootPart()
    return character and character:FindFirstChild("HumanoidRootPart")
end

local C = {
    bg         = Color3.fromRGB(10, 14, 10),
    card       = Color3.fromRGB(22, 32, 22),
    accent     = Color3.fromRGB(80, 200, 80),
    accentDim  = Color3.fromRGB(50, 130, 50),
    accentDark = Color3.fromRGB(25, 60, 25),
    text       = Color3.fromRGB(210, 240, 210),
    textDim    = Color3.fromRGB(110, 160, 110),
    textMuted  = Color3.fromRGB(60, 100, 60),
    white      = Color3.fromRGB(255, 255, 255),
    sliderBg   = Color3.fromRGB(18, 28, 18),
    sliderFill = Color3.fromRGB(70, 180, 70),
    titleBar   = Color3.fromRGB(14, 20, 14),
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FrogHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true
screenGui.Parent = player.PlayerGui

local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(0, 316, 0, 596)
shadow.Position = UDim2.new(0, 32, 0, 82)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.6
shadow.BorderSizePixel = 0
shadow.ZIndex = 1
shadow.Parent = screenGui
Instance.new("UICorner", shadow).CornerRadius = UDim.new(0, 16)

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 310, 0, 580)
main.Position = UDim2.new(0, 26, 0, 78)
main.BackgroundColor3 = C.bg
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.ZIndex = 2
main.Parent = screenGui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = C.accentDim
mainStroke.Thickness = 1.2
mainStroke.Transparency = 0.5

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = C.titleBar
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 3
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 14)

local titleBarFill = Instance.new("Frame")
titleBarFill.Size = UDim2.new(1, 0, 0, 14)
titleBarFill.Position = UDim2.new(0, 0, 1, -14)
titleBarFill.BackgroundColor3 = C.titleBar
titleBarFill.BorderSizePixel = 0
titleBarFill.ZIndex = 3
titleBarFill.Parent = titleBar

local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(1, 0, 0, 2)
accentLine.Position = UDim2.new(0, 0, 1, -1)
accentLine.BackgroundColor3 = C.accent
accentLine.BorderSizePixel = 0
accentLine.ZIndex = 4
accentLine.Parent = titleBar
local accentGrad = Instance.new("UIGradient", accentLine)
accentGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 160, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 230, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 160, 40)),
})

local frogIcon = Instance.new("TextLabel")
frogIcon.Text = "🐸"
frogIcon.Font = Enum.Font.GothamBold
frogIcon.TextSize = 22
frogIcon.BackgroundTransparency = 1
frogIcon.Size = UDim2.new(0, 36, 1, 0)
frogIcon.Position = UDim2.new(0, 10, 0, 0)
frogIcon.TextYAlignment = Enum.TextYAlignment.Center
frogIcon.ZIndex = 5
frogIcon.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Frog Hub"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 17
titleLabel.TextColor3 = C.accent
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(0, 160, 1, 0)
titleLabel.Position = UDim2.new(0, 48, 0, 0)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.ZIndex = 5
titleLabel.Parent = titleBar

local subLabel = Instance.new("TextLabel")
subLabel.Text = "utility script"
subLabel.Font = Enum.Font.Gotham
subLabel.TextSize = 10
subLabel.TextColor3 = C.textMuted
subLabel.BackgroundTransparency = 1
subLabel.Size = UDim2.new(0, 160, 0, 14)
subLabel.Position = UDim2.new(0, 49, 0, 28)
subLabel.TextXAlignment = Enum.TextXAlignment.Left
subLabel.ZIndex = 5
subLabel.Parent = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Text = "—"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 14
minBtn.TextColor3 = C.textDim
minBtn.BackgroundColor3 = C.accentDark
minBtn.BorderSizePixel = 0
minBtn.Size = UDim2.new(0, 28, 0, 22)
minBtn.Position = UDim2.new(1, -38, 0.5, -11)
minBtn.AutoButtonColor = false
minBtn.ZIndex = 6
minBtn.Parent = titleBar
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, 0, 1, -52)
scroll.Position = UDim2.new(0, 0, 0, 52)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = C.accentDim
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.BorderSizePixel = 0
scroll.ZIndex = 2
scroll.Parent = main
local contentLayout = Instance.new("UIListLayout", scroll)
contentLayout.Padding = UDim.new(0, 8)
contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
local contentPad = Instance.new("UIPadding", scroll)
contentPad.PaddingTop = UDim.new(0, 12)
contentPad.PaddingBottom = UDim.new(0, 16)
contentPad.PaddingLeft = UDim.new(0, 12)
contentPad.PaddingRight = UDim.new(0, 12)

local function makeCard(layoutOrder)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = C.card
    card.BorderSizePixel = 0
    card.LayoutOrder = layoutOrder
    card.Parent = scroll
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
    local cs = Instance.new("UIStroke", card)
    cs.Color = C.accentDark
    cs.Thickness = 1
    cs.Transparency = 0.3
    local cp = Instance.new("UIPadding", card)
    cp.PaddingTop = UDim.new(0, 10)
    cp.PaddingBottom = UDim.new(0, 10)
    cp.PaddingLeft = UDim.new(0, 10)
    cp.PaddingRight = UDim.new(0, 10)
    local cl = Instance.new("UIListLayout", card)
    cl.Padding = UDim.new(0, 6)
    cl.HorizontalAlignment = Enum.HorizontalAlignment.Center
    cl.SortOrder = Enum.SortOrder.LayoutOrder
    return card
end

local function makeSectionLabel(text, parent, order)
    local lbl = Instance.new("TextLabel")
    lbl.Text = text
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextSize = 10
    lbl.TextColor3 = C.textMuted
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, 0, 0, 16)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = order or 0
    lbl.ZIndex = 3
    lbl.Parent = parent
    return lbl
end

local function makeButton(text, bgColor, parent, order)
    bgColor = bgColor or C.accent
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextColor3 = C.white
    btn.BackgroundColor3 = bgColor
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.AutoButtonColor = false
    btn.LayoutOrder = order or 0
    btn.ZIndex = 4
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local dimColor = Color3.fromRGB(
        math.max(bgColor.R * 255 - 30, 0) / 255,
        math.max(bgColor.G * 255 - 30, 0) / 255,
        math.max(bgColor.B * 255 - 30, 0) / 255
    )
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = dimColor}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = bgColor}):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), {Size = UDim2.new(1, 0, 0, 30)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 34)}):Play()
    end)
    return btn
end

local function makeSliderInput(labelText, minVal, maxVal, defaultVal, parent, order, isFloat)
    local range = maxVal - minVal
    local wrapper = Instance.new("Frame")
    wrapper.Size = UDim2.new(1, 0, 0, 0)
    wrapper.AutomaticSize = Enum.AutomaticSize.Y
    wrapper.BackgroundTransparency = 1
    wrapper.LayoutOrder = order or 0
    wrapper.Parent = parent
    local wl = Instance.new("UIListLayout", wrapper)
    wl.Padding = UDim.new(0, 4)
    wl.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local topRow = Instance.new("Frame")
    topRow.Size = UDim2.new(1, 0, 0, 22)
    topRow.BackgroundTransparency = 1
    topRow.Parent = wrapper
    local trl = Instance.new("UIListLayout", topRow)
    trl.FillDirection = Enum.FillDirection.Horizontal
    trl.HorizontalAlignment = Enum.HorizontalAlignment.Left
    trl.VerticalAlignment = Enum.VerticalAlignment.Center
    trl.Padding = UDim.new(0, 6)

    local rowLbl = Instance.new("TextLabel")
    rowLbl.Text = labelText
    rowLbl.Font = Enum.Font.GothamSemibold
    rowLbl.TextSize = 11
    rowLbl.TextColor3 = C.textDim
    rowLbl.BackgroundTransparency = 1
    rowLbl.Size = UDim2.new(0, 120, 1, 0)
    rowLbl.TextXAlignment = Enum.TextXAlignment.Left
    rowLbl.ZIndex = 4
    rowLbl.Parent = topRow

    local inputBox = Instance.new("TextBox")
    inputBox.Text = tostring(defaultVal)
    inputBox.Font = Enum.Font.GothamBold
    inputBox.TextSize = 12
    inputBox.TextColor3 = C.accent
    inputBox.BackgroundColor3 = C.accentDark
    inputBox.BorderSizePixel = 0
    inputBox.Size = UDim2.new(0, 58, 1, 0)
    inputBox.ClearTextOnFocus = false
    inputBox.ZIndex = 4
    inputBox.Parent = topRow
    Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, 0, 0, 10)
    track.BackgroundColor3 = C.sliderBg
    track.BorderSizePixel = 0
    track.Parent = wrapper
    Instance.new("UICorner", track).CornerRadius = UDim.new(0, 5)
    local trackStroke = Instance.new("UIStroke", track)
    trackStroke.Color = C.accentDark
    trackStroke.Thickness = 1

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = C.sliderFill
    fill.BorderSizePixel = 0
    fill.Parent = track
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 5)

    local thumb = Instance.new("Frame")
    thumb.Size = UDim2.new(0, 14, 0, 14)
    thumb.Position = UDim2.new(1, -7, 0.5, -7)
    thumb.BackgroundColor3 = C.accent
    thumb.BorderSizePixel = 0
    thumb.ZIndex = 5
    thumb.Parent = fill
    Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)
    local thumbStroke = Instance.new("UIStroke", thumb)
    thumbStroke.Color = C.white
    thumbStroke.Thickness = 1.5
    thumbStroke.Transparency = 0.6

    local currentVal = defaultVal

    local function setVal(v)
        v = math.clamp(v, minVal, maxVal)
        if isFloat then
            currentVal = math.floor(v * 10 + 0.5) / 10
        else
            currentVal = math.floor(v + 0.5)
        end
        local pct = (currentVal - minVal) / range
        fill.Size = UDim2.new(pct, 0, 1, 0)
        inputBox.Text = tostring(currentVal)
    end

    setVal(defaultVal)

    local draggingSlider = false
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
           input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
           input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = false
        end
    end)
    RunService.Heartbeat:Connect(function()
        if draggingSlider then
            local mp = UserInputService:GetMouseLocation()
            local tp = track.AbsolutePosition
            local tw = track.AbsoluteSize.X
            local rel = math.clamp((mp.X - tp.X) / tw, 0, 1)
            setVal(minVal + rel * range)
        end
    end)
    inputBox.FocusLost:Connect(function()
        local v = tonumber(inputBox.Text)
        if v then setVal(v) else inputBox.Text = tostring(currentVal) end
    end)

    return wrapper, function() return currentVal end
end

local dragging, dragStart, startMainPos = false, nil, nil

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startMainPos = main.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
                     input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local np = UDim2.new(
            startMainPos.X.Scale, startMainPos.X.Offset + delta.X,
            startMainPos.Y.Scale, startMainPos.Y.Offset + delta.Y
        )
        main.Position = np
        shadow.Position = UDim2.new(np.X.Scale, np.X.Offset + 6, np.Y.Scale, np.Y.Offset + 4)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(main, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 310, 0, 50)}):Play()
        shadow.Visible = false
        minBtn.Text = "+"
    else
        TweenService:Create(main, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 310, 0, 580)}):Play()
        shadow.Visible = true
        minBtn.Text = "—"
    end
end)

local blockCard = makeCard(1)
makeSectionLabel("◈  BLOCK SPAWNER", blockCard, 1)

local blockOptions = {
    {label = "Super Block",   remote = "SpawnSuperBlock"},
    {label = "Rainbow Block", remote = "SpawnRainbowBlock"},
    {label = "Lucky Block",   remote = "SpawnLuckyBlock"},
    {label = "Diamond Block", remote = "SpawnDiamondBlock"},
    {label = "Galaxy Block",  remote = "SpawnGalaxyBlock"},
}
local selectedBlock = blockOptions[1]
local dropOpen = false

local dropBtn = Instance.new("TextButton")
dropBtn.Text = "▾   " .. selectedBlock.label
dropBtn.Font = Enum.Font.GothamSemibold
dropBtn.TextSize = 13
dropBtn.TextColor3 = C.text
dropBtn.BackgroundColor3 = C.sliderBg
dropBtn.BorderSizePixel = 0
dropBtn.Size = UDim2.new(1, 0, 0, 34)
dropBtn.TextXAlignment = Enum.TextXAlignment.Left
dropBtn.AutoButtonColor = false
dropBtn.LayoutOrder = 2
dropBtn.ZIndex = 6
dropBtn.Parent = blockCard
Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 8)
local dbPad = Instance.new("UIPadding", dropBtn)
dbPad.PaddingLeft = UDim.new(0, 10)
local dbStroke = Instance.new("UIStroke", dropBtn)
dbStroke.Color = C.accentDark
dbStroke.Thickness = 1

local dropList = Instance.new("Frame")
dropList.Name = "DropList"
dropList.Size = UDim2.new(0, 286, 0, #blockOptions * 32 + 8)
dropList.BackgroundColor3 = Color3.fromRGB(18, 26, 18)
dropList.BorderSizePixel = 0
dropList.Visible = false
dropList.ZIndex = 20
dropList.Parent = screenGui
Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 8)
local dlStroke = Instance.new("UIStroke", dropList)
dlStroke.Color = C.accentDim
dlStroke.Thickness = 1
local dlLayout = Instance.new("UIListLayout", dropList)
dlLayout.SortOrder = Enum.SortOrder.LayoutOrder
local dlPad = Instance.new("UIPadding", dropList)
dlPad.PaddingTop = UDim.new(0, 4)
dlPad.PaddingBottom = UDim.new(0, 4)

for i, opt in ipairs(blockOptions) do
    local item = Instance.new("TextButton")
    item.Text = "  " .. opt.label
    item.Font = Enum.Font.GothamSemibold
    item.TextSize = 12
    item.TextColor3 = C.textDim
    item.BackgroundColor3 = Color3.fromRGB(18, 26, 18)
    item.BorderSizePixel = 0
    item.Size = UDim2.new(1, 0, 0, 32)
    item.TextXAlignment = Enum.TextXAlignment.Left
    item.AutoButtonColor = false
    item.LayoutOrder = i
    item.ZIndex = 21
    item.Parent = dropList
    item.MouseEnter:Connect(function()
        item.BackgroundColor3 = C.accentDark
        item.TextColor3 = C.accent
    end)
    item.MouseLeave:Connect(function()
        item.BackgroundColor3 = Color3.fromRGB(18, 26, 18)
        item.TextColor3 = C.textDim
    end)
    item.MouseButton1Click:Connect(function()
        selectedBlock = opt
        dropBtn.Text = "▾   " .. opt.label
        dropList.Visible = false
        dropOpen = false
    end)
end

local function repositionDropList()
    local ap = dropBtn.AbsolutePosition
    local as = dropBtn.AbsoluteSize
    dropList.Position = UDim2.new(0, ap.X, 0, ap.Y + as.Y + 4)
end

dropBtn.MouseButton1Click:Connect(function()
    dropOpen = not dropOpen
    if dropOpen then
        repositionDropList()
        dropList.Visible = true
    else
        dropList.Visible = false
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and dropOpen then
        local mp = UserInputService:GetMouseLocation()
        local dp = dropList.AbsolutePosition
        local ds = dropList.AbsoluteSize
        if mp.X < dp.X or mp.X > dp.X + ds.X or mp.Y < dp.Y or mp.Y > dp.Y + ds.Y then
            dropList.Visible = false
            dropOpen = false
        end
    end
end)

local openBlockBtn = makeButton("🎁  Open Block", C.accent, blockCard, 3)
openBlockBtn.MouseButton1Click:Connect(function()
    local ok, remote = pcall(function()
        return ReplicatedStorage:WaitForChild(selectedBlock.remote, 3)
    end)
    if ok and remote then
        remote:FireServer()
    end
end)

local speedCard = makeCard(2)
makeSectionLabel("◈  WALK SPEED", speedCard, 1)
local _, getSpeed = makeSliderInput("Speed", 0, 500, 16, speedCard, 2, false)
local applySpeedBtn = makeButton("⚡  Apply Speed", C.accentDim, speedCard, 3)
applySpeedBtn.MouseButton1Click:Connect(function()
    local hum = getHumanoid()
    if hum then hum.WalkSpeed = getSpeed() end
end)

local jumpCard = makeCard(3)
makeSectionLabel("◈  JUMP POWER", jumpCard, 1)
local _, getJump = makeSliderInput("Jump Power", 0, 500, 50, jumpCard, 2, false)
local applyJumpBtn = makeButton("🦘  Apply Jump", C.accentDim, jumpCard, 3)
applyJumpBtn.MouseButton1Click:Connect(function()
    local hum = getHumanoid()
    if hum then hum.JumpPower = getJump() end
end)

local flyCard = makeCard(4)
makeSectionLabel("◈  FLY  (W/A/S/D · Space · LCtrl)", flyCard, 1)

local flyEnabled = false
local flyBodyVel = nil
local flyBodyGyro = nil
local FLY_SPEED = 60

local flyBtn = makeButton("🪂  Fly: OFF", C.accentDark, flyCard, 2)

local function enableFly()
    local root = getRootPart()
    if not root then return end
    flyBodyVel = Instance.new("BodyVelocity")
    flyBodyVel.Velocity = Vector3.zero
    flyBodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    flyBodyVel.Parent = root
    flyBodyGyro = Instance.new("BodyGyro")
    flyBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    flyBodyGyro.D = 50
    flyBodyGyro.P = 1e4
    flyBodyGyro.CFrame = root.CFrame
    flyBodyGyro.Parent = root
    local hum = getHumanoid()
    if hum then hum.PlatformStand = true end
end

local function disableFly()
    if flyBodyVel then flyBodyVel:Destroy(); flyBodyVel = nil end
    if flyBodyGyro then flyBodyGyro:Destroy(); flyBodyGyro = nil end
    local hum = getHumanoid()
    if hum then hum.PlatformStand = false end
end

flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    if flyEnabled then
        enableFly()
        flyBtn.Text = "🪂  Fly: ON"
        flyBtn.BackgroundColor3 = C.accent
    else
        disableFly()
        flyBtn.Text = "🪂  Fly: OFF"
        flyBtn.BackgroundColor3 = C.accentDark
    end
end)

RunService.Heartbeat:Connect(function()
    if not flyEnabled or not flyBodyVel or not flyBodyGyro then return end
    local root = getRootPart()
    if not root then return end
    local cf = camera.CFrame
    local vel = Vector3.zero
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel += cf.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel -= cf.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel -= cf.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel += cf.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel += Vector3.new(0, 1, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vel -= Vector3.new(0, 1, 0) end
    flyBodyVel.Velocity = if vel.Magnitude > 0 then vel.Unit * FLY_SPEED else Vector3.zero
    flyBodyGyro.CFrame = cf
end)

local gravCard = makeCard(5)
makeSectionLabel("◈  GRAVITY", gravCard, 1)
local _, getGrav = makeSliderInput("Gravity", -1000, 10000, 196, gravCard, 2, false)

local applyGravBtn = makeButton("🌍  Apply Gravity", C.accentDim, gravCard, 3)
applyGravBtn.MouseButton1Click:Connect(function()
    workspace.Gravity = getGrav()
end)

local resetGravBtn = makeButton("↺  Reset Gravity", Color3.fromRGB(50, 50, 70), gravCard, 4)
resetGravBtn.MouseButton1Click:Connect(function()
    workspace.Gravity = 196.2
end)

main.BackgroundTransparency = 1
main.Position = UDim2.new(
    main.Position.X.Scale, main.Position.X.Offset,
    main.Position.Y.Scale, main.Position.Y.Offset + 20
)
TweenService:Create(main, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Position = UDim2.new(
        main.Position.X.Scale, main.Position.X.Offset,
        main.Position.Y.Scale, main.Position.Y.Offset - 20
    ),
}):Play()
