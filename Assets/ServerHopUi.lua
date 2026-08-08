local ServerHopLibrary = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

local Purple = Color3.fromRGB(174, 92, 255)
local White = Color3.fromRGB(255, 255, 255)

local function New(Class, Properties, Children)
    local Object = Instance.new(Class)

    for Property, Value in pairs(Properties or {}) do
        Object[Property] = Value
    end

    for _, Child in ipairs(Children or {}) do
        Child.Parent = Object
    end

    return Object
end

function ServerHopLibrary:CreateScreen(Config)
    assert(Config.Duration, "Duration is required!")
    assert(Config.Reason, "Reason is required!")

    local Timeout = Config.Duration
    local Screen = {}

    local Gui = New("ScreenGui", {
        Name = "HopScreen",
        Parent = game:GetService("CoreGui"),
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 999999
    })

    local Overlay = New("Frame", {
        Parent = Gui,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0, 0),
        BackgroundColor3 = Color3.fromRGB(25, 13, 38),
        BackgroundTransparency = 0.88,
        BorderSizePixel = 0
    })

    local Tint = New("Frame", {
        Parent = Overlay,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(67, 27, 91),
        BackgroundTransparency = 0.93,
        BorderSizePixel = 0
    })

    local Center = New("Frame", {
        Parent = Overlay,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.48),
        Size = UDim2.new(0, 380, 0, 155),
        BackgroundTransparency = 1
    })

    Screen.Title = New("TextLabel", {
        Parent = Center,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.15),
        Size = UDim2.new(1, 0, 0, 30),
        Font = Enum.Font.GothamMedium,
        Text = "Server Hop",
        TextColor3 = White,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Center
    })

    Screen.Counter = New("TextLabel", {
        Parent = Center,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.37),
        Size = UDim2.new(1, 0, 0, 48),
        Font = Enum.Font.GothamBold,
        Text = string.format("%02d", Timeout),
        TextColor3 = White,
        TextSize = 42,
        TextXAlignment = Enum.TextXAlignment.Center
    })

    Screen.Info = New("TextLabel", {
        Parent = Center,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.70),
        Size = UDim2.new(1, 0, 0, 18),
        Font = Enum.Font.Gotham,
        Text = "Changing server...",
        TextColor3 = White,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Center
    })

    Screen.Reason = New("TextLabel", {
        Parent = Center,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.84),
        Size = UDim2.new(1, 0, 0, 16),
        Font = Enum.Font.Gotham,
        Text = "Reason: " .. tostring(Config.Reason),
        TextColor3 = White,
        TextSize = 9,
        TextXAlignment = Enum.TextXAlignment.Center
    })

    Screen.Progress = New("Frame", {
        Parent = Overlay,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.66),
        Size = UDim2.new(0, 220, 0, 2),
        BackgroundColor3 = Color3.fromRGB(110, 82, 125),
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0
    })

    Screen.Fill = New("Frame", {
        Parent = Screen.Progress,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Purple,
        BorderSizePixel = 0
    })

    Screen.Cancel = New("TextLabel", {
        Parent = Overlay,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.96),
        Size = UDim2.new(0, 300, 0, 22),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        Text = "Double click anywhere to cancel",
        TextColor3 = White,
        TextSize = 10,
        TextTransparency = 0,
        TextXAlignment = Enum.TextXAlignment.Center
    })

    Screen.Job = New("TextLabel", {
        Parent = Overlay,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.035),
        Size = UDim2.new(0, 500, 0, 18),
        BackgroundTransparency = 1,
        Font = Enum.Font.Code,
        Text = "JOB ID  " .. tostring(game.JobId or "00000000"),
        TextColor3 = White,
        TextSize = 9,
        TextTransparency = 0,
        TextXAlignment = Enum.TextXAlignment.Center
    })

    local Scale = New("UIScale", {
        Parent = Center,
        Scale = 1
    })

    local Camera = workspace.CurrentCamera

    local function UpdateScale()
        if not Camera then
            return
        end

        local Viewport = Camera.ViewportSize

        Scale.Scale = math.clamp(
            math.min(Viewport.X / 700, Viewport.Y / 500),
            0.78,
            1.15
        )
    end

    UpdateScale()

    if Camera then
        Camera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)
    end

    local Aborted = false
    local LastClickTime = 0
    local DoubleClickTime = 0.25

    local function Abort()
        if Aborted then
            return
        end

        Aborted = true

        Screen.Info.Text = "Server hop cancelled"
        Screen.Info.TextColor3 = Purple

        Screen.Reason.Text = "The operation has been stopped"
        Screen.Reason.TextColor3 = White

        TweenService:Create(
            Screen.Counter,
            TweenInfo.new(
                0.2,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                TextColor3 = Purple
            }
        ):Play()

        TweenService:Create(
            Screen.Fill,
            TweenInfo.new(
                0.3,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromScale(1, 1)
            }
        ):Play()
    end

    local InputConnection

    InputConnection = UserInputService.InputBegan:Connect(function(Input, Processed)
        if Processed or Aborted then
            return
        end

        if Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch then

            local CurrentClickTime = tick()

            if CurrentClickTime - LastClickTime < DoubleClickTime then
                Abort()
            end

            LastClickTime = CurrentClickTime
        end
    end)

    TweenService:Create(
        Overlay,
        TweenInfo.new(
            0.45,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        ),
        {
            BackgroundTransparency = 0.91
        }
    ):Play()

    TweenService:Create(
        Center,
        TweenInfo.new(
            0.45,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Position = UDim2.fromScale(0.5, 0.46)
        }
    ):Play()

    local Finish = false
    local Status = "None"

    task.spawn(function()
        while true do
            if Aborted then
                Screen.Info.Text = "Server hop aborted"
                Screen.Reason.Text = "Function will be delayed for 15 seconds"

                task.delay(1, function()
                    local DeleteTimeout = 10

                    while task.wait(1) do
                        if DeleteTimeout <= 0 then
                            Finish = true
                            Status = "Abort"

                            if InputConnection then
                                InputConnection:Disconnect()
                            end

                            TweenService:Create(
                                Overlay,
                                TweenInfo.new(
                                    0.35,
                                    Enum.EasingStyle.Exponential,
                                    Enum.EasingDirection.InOut
                                ),
                                {
                                    BackgroundTransparency = 1
                                }
                            ):Play()

                            TweenService:Create(
                                Center,
                                TweenInfo.new(
                                    0.35,
                                    Enum.EasingStyle.Exponential,
                                    Enum.EasingDirection.InOut
                                ),
                                {
                                    Position = UDim2.fromScale(0.5, 0.52)
                                }
                            ):Play()

                            task.delay(0.4, function()
                                if Gui then
                                    Gui:Destroy()
                                end
                            end)

                            break
                        end

                        DeleteTimeout -= 1

                        Screen.Counter.Text =
                            string.format("%02d", DeleteTimeout)

                        Screen.Info.Text =
                            "Deleting UI..."

                        TweenService:Create(
                            Screen.Fill,
                            TweenInfo.new(
                                0.2,
                                Enum.EasingStyle.Sine,
                                Enum.EasingDirection.InOut
                            ),
                            {
                                Size = UDim2.new(
                                    math.clamp(DeleteTimeout / 10, 0, 1),
                                    0,
                                    1,
                                    0
                                )
                            }
                        ):Play()
                    end
                end)

                break
            end

            Timeout -= 1

            Screen.Counter.Text =
                string.format("%02d", math.max(Timeout, 0))

            Screen.Info.Text =
                "Changing server..."

            TweenService:Create(
                Screen.Fill,
                TweenInfo.new(
                    0.2,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ),
                {
                    Size = UDim2.new(
                        math.clamp(Timeout / Config.Duration, 0, 1),
                        0,
                        1,
                        0
                    )
                }
            ):Play()

            if Timeout <= 0 then
                Finish = true
                Status = "Success"

                if InputConnection then
                    InputConnection:Disconnect()
                end

                break
            end

            task.wait(1)
        end
    end)

    repeat
        task.wait()
    until Finish

    return Status
end

return ServerHopLibrary
