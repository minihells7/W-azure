local ServerHopLibrary = {}

local getgenv = getgenv or function()
    return shared
end

local function New(Name, Properties, Children)
    local Object = Instance.new(Name)

    for Name, Value in next, Properties or {} do
        if Name ~= "ThemeTag" and Name ~= "ImageThemeTag" then
            Object[Name] = Value
        end
    end

    for _, Child in next, Children or {} do
        Child.Parent = Object
    end

    return Object
end

local function Tween(obj, info, properties, callback)
    local anim = game:GetService("TweenService"):Create(
        obj,
        TweenInfo.new(unpack(info)),
        properties
    )

    anim:Play()

    if callback then
        anim.Completed:Connect(callback)
    end

    return anim
end

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer

local GUI = New("ScreenGui", {
    Parent = RunService:IsStudio() and LocalPlayer.PlayerGui or game:GetService("CoreGui"),
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999999
})

function ServerHopLibrary:CreateScreen(Config)
    assert(Config.Duration, "Duration is required!")
    assert(Config.Reason, "Reason is required!")

    local Timeout = Config.Duration
    local Screen = {}

    local Theme = {
        Background = Color3.fromRGB(8, 6, 14),
        Panel = Color3.fromRGB(16, 11, 27),
        Purple = Color3.fromRGB(157, 78, 255),
        PurpleLight = Color3.fromRGB(190, 125, 255),
        White = Color3.fromRGB(245, 242, 250),
        Text = Color3.fromRGB(220, 214, 230),
        Muted = Color3.fromRGB(143, 134, 158),
        Stroke = Color3.fromRGB(63, 42, 84)
    }

    Screen.Background = New("Frame", {
        Parent = GUI,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 0.08,
        BorderSizePixel = 0,
        ZIndex = 1
    })

    Screen.Glow = New("Frame", {
        Parent = Screen.Background,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.45),
        Size = UDim2.fromScale(0.7, 0.7),
        BackgroundColor3 = Theme.Purple,
        BackgroundTransparency = 0.94,
        BorderSizePixel = 0,
        ZIndex = 2
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })

    Screen.Frame = New("CanvasGroup", {
        Parent = Screen.Background,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(0, 510, 0, 300),
        BackgroundColor3 = Theme.Panel,
        BackgroundTransparency = 0.04,
        GroupTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 10
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 18)
        }),

        New("UIStroke", {
            Color = Theme.Stroke,
            Thickness = 1,
            Transparency = 0.15
        })
    })

    Screen.TopAccent = New("Frame", {
        Parent = Screen.Frame,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(1, -36, 0, 2),
        BackgroundColor3 = Theme.Purple,
        BorderSizePixel = 0,
        ZIndex = 11
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })

    Screen.Brand = New("TextLabel", {
        Parent = Screen.Frame,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 28, 0, 25),
        Size = UDim2.new(1, -56, 0, 28),
        Font = Enum.Font.GothamBold,
        Text = "W-Azure",
        TextColor3 = Theme.PurpleLight,
        TextSize = 20,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 12
    })

    Screen.Status = New("TextLabel", {
        Parent = Screen.Frame,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 28, 0, 52),
        Size = UDim2.new(1, -56, 0, 20),
        Font = Enum.Font.Gotham,
        Text = "SERVER TRANSITION",
        TextColor3 = Theme.Muted,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 12
    })

    Screen.Dot = New("Frame", {
        Parent = Screen.Frame,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -28, 0, 32),
        Size = UDim2.fromOffset(8, 8),
        BackgroundColor3 = Theme.PurpleLight,
        BorderSizePixel = 0,
        ZIndex = 12
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })

    Screen.Divider = New("Frame", {
        Parent = Screen.Frame,
        Position = UDim2.new(0, 28, 0, 78),
        Size = UDim2.new(1, -56, 0, 1),
        BackgroundColor3 = Theme.Stroke,
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        ZIndex = 11
    })

    Screen.HopText = New("TextLabel", {
        Parent = Screen.Frame,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.33),
        Size = UDim2.new(1, -50, 0, 38),
        Font = Enum.Font.GothamBold,
        Text = "Hopping Server in " .. Timeout .. "s...",
        TextColor3 = Theme.White,
        TextSize = 23,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 12
    })

    Screen.Reason = New("TextLabel", {
        Parent = Screen.Frame,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.49),
        Size = UDim2.new(1, -70, 0, 25),
        Font = Enum.Font.Gotham,
        Text = "Reason: " .. Config.Reason,
        TextColor3 = Theme.Text,
        TextSize = 13,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 12
    })

    Screen.JobId = New("TextLabel", {
        Parent = Screen.Frame,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.60),
        Size = UDim2.new(1, -60, 0, 20),
        Font = Enum.Font.Code,
        Text = "JOB • " .. tostring(game.JobId or "00000000-0000-0000-0000-000000000000"),
        TextColor3 = Theme.Muted,
        TextSize = 10,
        TextTransparency = 0.15,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 12
    })

    Screen.ProgressBackground = New("Frame", {
        Parent = Screen.Frame,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.73),
        Size = UDim2.new(1, -70, 0, 7),
        BackgroundColor3 = Color3.fromRGB(34, 25, 45),
        BorderSizePixel = 0,
        ZIndex = 12
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })

    Screen.InnerProgressBar = New("Frame", {
        Parent = Screen.ProgressBackground,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Theme.Purple,
        BorderSizePixel = 0,
        ZIndex = 13
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })

    Screen.BottomText = New("TextLabel", {
        Parent = Screen.Frame,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.82),
        Size = UDim2.new(1, -50, 0, 25),
        Font = Enum.Font.Gotham,
        Text = "Double click anywhere to abort",
        TextColor3 = Theme.Muted,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 12
    })

    local Aborted = false
    local LastClickTime = 0
    local DoubleClickTime = 0.25

    Screen.Frame.InputBegan:Connect(function(Input)
        if
            Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch
        then
            local CurrentClickTime = RunService.Stepped:Wait()

            if (CurrentClickTime - LastClickTime) < DoubleClickTime then
                Aborted = true
            end

            LastClickTime = CurrentClickTime
        end
    end)

    local Finish = false
    local Status = "None"

    task.spawn(function()
        while true do
            if Aborted then
                Screen.HopText.Text = "Server Hop Aborted"
                Screen.HopText.TextColor3 = Theme.PurpleLight
                Screen.BottomText.Text = "Function will be delayed for 15 seconds"

                Tween(
                    Screen.InnerProgressBar,
                    {0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut},
                    {Size = UDim2.new(1, 0, 1, 0)}
                )

                task.delay(1, function()
                    local Timeout = 10

                    while task.wait(1) do
                        if Timeout <= 0 then
                            Screen.JobId.Visible = false
                            Screen.ProgressBackground.Visible = false
                            Screen.BottomText.Visible = false
                            Screen.Reason.Visible = false
                            Screen.Status.Visible = false
                            Screen.Dot.Visible = false

                            Finish = true
                            Status = "Abort"

                            Tween(
                                Screen.Frame,
                                {0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut},
                                {GroupTransparency = 1},
                                function()
                                    Screen.Background:Destroy()
                                end
                            )

                            break
                        end

                        Timeout -= 1
                        Screen.HopText.Text = "Deleting UI in " .. Timeout .. "s"

                        Tween(
                            Screen.InnerProgressBar,
                            {0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut},
                            {
                                Size = UDim2.new(
                                    math.clamp(Timeout / 10, 0, 1),
                                    0,
                                    1,
                                    0
                                )
                            }
                        )
                    end
                end)

                break
            end

            Timeout -= 1

            Screen.HopText.Text =
                "Hopping Server in " .. Timeout .. "s..."

            Tween(
                Screen.InnerProgressBar,
                {0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut},
                {
                    Size = UDim2.new(
                        math.clamp(Timeout / 10, 0, 1),
                        0,
                        1,
                        0
                    )
                }
            )

            if Timeout <= 0 then
                Finish = true
                Status = "Success"
                break
            end

            task.wait(1)
        end
    end)

    Screen.Frame.Position = UDim2.fromScale(0.5, 0.53)

    Tween(
        Screen.Frame,
        {0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out},
        {
            Position = UDim2.fromScale(0.5, 0.5),
            GroupTransparency = 0
        }
    )

    repeat
        task.wait()
    until Finish

    return Status
end

return ServerHopLibrary
