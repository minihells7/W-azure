ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local soundId = "rbxassetid://130785805" 
local sound = Instance.new("Sound")
sound.Name = "ButtonClickSound"
sound.SoundId = soundId
sound.Parent = ReplicatedStorage

local MainScreenGui = Instance.new("ScreenGui")
local ButtonScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

MainScreenGui.Name = "MainScreenGui"
MainScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ButtonScreenGui.Name = "ButtonScreenGui"
ButtonScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ImageButton.Parent = ButtonScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0) 
ImageButton.AnchorPoint = Vector2.new(0.5, 0) 
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Image = "rbxassetid://100644623613900"

UICorner.CornerRadius = UDim.new(1, 0) 
UICorner.Parent = ImageButton

UIStroke.Color = Color3.fromRGB(0, 255, 42)
UIStroke.Parent = ImageButton

local colors = {   
    Color3.fromRGB(0, 255, 42),
}

ImageButton.MouseButton1Down:connect(function()
  game.CoreGui:FindFirstChild("RippleHUBLIB").Enabled = not game.CoreGui:FindFirstChild("RippleHUBLIB").Enabled
end)

_G.Color = Color3.fromRGB(68, 202, 186)
_G.ColorButton = Color3.fromRGB(25, 25, 25)
IKAI = true
if IKAI then
	do
		local ui = game.CoreGui:FindFirstChild("RippleHUBLIB")
		if ui then
			ui:Destroy()
		end
	end
	
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local tween = game:GetService("TweenService")
	local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
	local LogoButton = [[7040391851]]
	
	
	local function Tween(instance, properties,style,wa)
		if style == nil or "" then
			return Back
		end
		tween:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
	end

	-- Ícones (Lucide, igual a Fluent) --
	local IconsData = nil
	local function LoadIcons()
		if IconsData then return IconsData end
		local ok, result = pcall(function()
			return loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/src/Icons.lua", true))()
		end)
		if ok and typeof(result) == "table" then
			IconsData = result
		else
			IconsData = {}
		end
		return IconsData
	end

	local function ResolveIcon(icon)
		-- Aceita: número/string numérica (rbxassetid direto) OU nome de ícone lucide (ex: "home", "settings")
		if icon == nil or icon == "" then return nil end
		if typeof(icon) == "number" then
			return {Image = "rbxassetid://"..icon}
		end
		if tonumber(icon) then
			return {Image = "rbxassetid://"..icon}
		end
		local ok, icons = pcall(LoadIcons)
		if ok and icons then
			local key = tostring(icon):lower():gsub("_","-")
			local data = icons[key] or icons[icon]
			if data then
				local id = data.id or data.Id or data[1]
				local offset = data.imageRectOffset or data.ImageRectOffset
				local size = data.imageRectSize or data.ImageRectSize
				if id then
					return {
						Image = "rbxassetid://"..tostring(id),
						ImageRectOffset = offset,
						ImageRectSize = size
					}
				end
			end
		end
		return nil
	end
	-- Fim Ícones --
	
	local ActualTypes = {
		RoundFrame = "ImageLabel",
		Shadow = "ImageLabel",
		Circle = "ImageLabel",
		CircleButton = "ImageButton",
		Frame = "Frame",
		Label = "TextLabel",
		Button = "TextButton",
		SmoothButton = "ImageButton",
		Box = "TextBox",
		ScrollingFrame = "ScrollingFrame",
		Menu = "ImageButton",
		NavBar = "ImageButton"
	}
	
	local Properties = {
		RoundFrame = {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554237731",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(3,3,297,297)
		},
		SmoothButton = {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554237731",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(3,3,297,297)
		},
		Shadow = {
			Name = "Shadow",
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554236805",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(23,23,277,277),
			Size = UDim2.fromScale(1,1) + UDim2.fromOffset(30,30),
			Position = UDim2.fromOffset(-15,-15)
		},
		Circle = {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554831670"
		},
		CircleButton = {
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Image = "http://www.roblox.com/asset/?id=5554831670"
		},
		Frame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1,1)
		},
		Label = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5,0),
			Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		Button = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5,0),
			Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		Box = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5,0),
			Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		ScrollingFrame = {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.fromScale(0,0),
			Size = UDim2.fromScale(1,1)
		},
		Menu = {
			Name = "More",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5555108481",
			Size = UDim2.fromOffset(20,20),
			Position = UDim2.fromScale(1,0.5) - UDim2.fromOffset(25,10)
		},
		NavBar = {
			Name = "SheetToggle",
			Image = "http://www.roblox.com/asset/?id=5576439039",
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(20,20),
			Position = UDim2.fromOffset(5,5),
			AutoButtonColor = false
		}
	}
	
	local Types = {
		"RoundFrame",
		"Shadow",
		"Circle",
		"CircleButton",
		"Frame",
		"Label",
		"Button",
		"SmoothButton",
		"Box",
		"ScrollingFrame",
		"Menu",
		"NavBar"
	}
	
	function FindType(String)
		for _, Type in next, Types do
			if Type:sub(1, #String):lower() == String:lower() then
				return Type
			end
		end
		return false
	end
	
	local Objects = {}
	
	function Objects.new(Type)
		local TargetType = FindType(Type)
		if TargetType then
			local NewImage = Instance.new(ActualTypes[TargetType])
			if Properties[TargetType] then
				for Property, Value in next, Properties[TargetType] do
					NewImage[Property] = Value
				end
			end
			return NewImage
		else
			return Instance.new(Type)
		end
	end
	
	local function GetXY(GuiObject)
		local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
		local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
		return Px/Max, Py/May
	end
	
	local function CircleAnim(GuiObject, EndColour, StartColour)
		local PX, PY = GetXY(GuiObject)
		local Circle = Objects.new("Circle")
		Circle.Size = UDim2.fromScale(0,0)
		Circle.Position = UDim2.fromScale(PX,PY)
		Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
		Circle.ZIndex = 200
		Circle.Parent = GuiObject
		local Size = GuiObject.AbsoluteSize.X
		TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
		spawn(function()
			wait(0.5)
			Circle:Destroy()
		end)
	end
	
	
	local function MakeDraggable(topbarobject, object)
		local Dragging = nil
		local DragInput = nil
		local DragStart = nil
		local StartPosition = nil
	
		local function Update(input)
			local Delta = input.Position - DragStart
			local pos =
				UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)
			local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
			Tween:Play()
		end
	
		topbarobject.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = input.Position
					StartPosition = object.Position
	
					input.Changed:Connect(
						function()
							if input.UserInputState == Enum.UserInputState.End then
								Dragging = false
							end
						end
					)
				end
			end
		)
	
		topbarobject.InputChanged:Connect(
			function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
				then
					DragInput = input
				end
			end
		)
	
		UserInputService.InputChanged:Connect(
			function(input)
				if input == DragInput and Dragging then
					Update(input)
				end
			end
		)
	end
	
	minihells = {}
	
	function minihells:CreateWindow(config)
		config = config or {}
		local Title = config.Title or "Hub"
		local SubTitle = config.SubTitle or ""
		local Theme = config.Theme or "Dark"
		local WindowSize = config.Size or UDim2.fromOffset(500, 400)

		local Themes = {
			Dark = {
				Main = Color3.fromRGB(45, 45, 45),
				Top = Color3.fromRGB(35, 35, 35),
				Text = Color3.fromRGB(225, 225, 225),
				TextTitle = Color3.fromRGB(240, 240, 240),
				TextDim = Color3.fromRGB(170, 170, 170),
				Element = Color3.fromRGB(70, 70, 70),
				ElementInner = Color3.fromRGB(40, 40, 40),
				Bar = Color3.fromRGB(25, 25, 25),
				ToggleOff = Color3.fromRGB(90, 90, 90),
				Knob = Color3.fromRGB(225, 225, 225),
				Accent = Color3.fromRGB(68, 202, 186)
			},
			Light = {
				Main = Color3.fromRGB(235, 235, 235),
				Top = Color3.fromRGB(220, 220, 220),
				Text = Color3.fromRGB(30, 30, 30),
				TextTitle = Color3.fromRGB(15, 15, 15),
				TextDim = Color3.fromRGB(95, 95, 95),
				Element = Color3.fromRGB(205, 205, 205),
				ElementInner = Color3.fromRGB(225, 225, 225),
				Bar = Color3.fromRGB(190, 190, 190),
				ToggleOff = Color3.fromRGB(180, 180, 180),
				Knob = Color3.fromRGB(255, 255, 255),
				Accent = Color3.fromRGB(0, 122, 255)
			},
			Ocean = {
				Main = Color3.fromRGB(24, 29, 38),
				Top = Color3.fromRGB(18, 22, 30),
				Text = Color3.fromRGB(210, 225, 235),
				TextTitle = Color3.fromRGB(235, 245, 250),
				TextDim = Color3.fromRGB(140, 160, 175),
				Element = Color3.fromRGB(34, 42, 56),
				ElementInner = Color3.fromRGB(22, 28, 38),
				Bar = Color3.fromRGB(14, 18, 26),
				ToggleOff = Color3.fromRGB(55, 65, 80),
				Knob = Color3.fromRGB(225, 235, 245),
				Accent = Color3.fromRGB(0, 180, 216)
			},
			Midnight = {
				Main = Color3.fromRGB(16, 17, 22),
				Top = Color3.fromRGB(11, 12, 16),
				Text = Color3.fromRGB(205, 210, 225),
				TextTitle = Color3.fromRGB(230, 233, 245),
				TextDim = Color3.fromRGB(130, 138, 158),
				Element = Color3.fromRGB(26, 28, 36),
				ElementInner = Color3.fromRGB(16, 17, 22),
				Bar = Color3.fromRGB(8, 9, 12),
				ToggleOff = Color3.fromRGB(48, 52, 66),
				Knob = Color3.fromRGB(220, 224, 238),
				Accent = Color3.fromRGB(99, 102, 241)
			},
			Emerald = {
				Main = Color3.fromRGB(20, 28, 24),
				Top = Color3.fromRGB(14, 20, 17),
				Text = Color3.fromRGB(210, 230, 220),
				TextTitle = Color3.fromRGB(235, 245, 240),
				TextDim = Color3.fromRGB(140, 170, 155),
				Element = Color3.fromRGB(32, 45, 38),
				ElementInner = Color3.fromRGB(20, 28, 24),
				Bar = Color3.fromRGB(12, 18, 15),
				ToggleOff = Color3.fromRGB(55, 80, 68),
				Knob = Color3.fromRGB(225, 240, 232),
				Accent = Color3.fromRGB(46, 204, 113)
			},
			Crimson = {
				Main = Color3.fromRGB(32, 20, 22),
				Top = Color3.fromRGB(24, 14, 16),
				Text = Color3.fromRGB(230, 215, 215),
				TextTitle = Color3.fromRGB(245, 235, 235),
				TextDim = Color3.fromRGB(170, 140, 140),
				Element = Color3.fromRGB(55, 32, 35),
				ElementInner = Color3.fromRGB(35, 20, 22),
				Bar = Color3.fromRGB(20, 10, 12),
				ToggleOff = Color3.fromRGB(90, 55, 58),
				Knob = Color3.fromRGB(235, 225, 225),
				Accent = Color3.fromRGB(225, 45, 65)
			},
			Amethyst = {
				Main = Color3.fromRGB(30, 24, 38),
				Top = Color3.fromRGB(22, 17, 29),
				Text = Color3.fromRGB(220, 210, 232),
				TextTitle = Color3.fromRGB(240, 232, 248),
				TextDim = Color3.fromRGB(160, 145, 180),
				Element = Color3.fromRGB(48, 38, 60),
				ElementInner = Color3.fromRGB(30, 24, 38),
				Bar = Color3.fromRGB(18, 14, 24),
				ToggleOff = Color3.fromRGB(75, 60, 92),
				Knob = Color3.fromRGB(232, 222, 245),
				Accent = Color3.fromRGB(155, 89, 255)
			},
			Sunset = {
				Main = Color3.fromRGB(35, 26, 22),
				Top = Color3.fromRGB(26, 19, 16),
				Text = Color3.fromRGB(235, 220, 205),
				TextTitle = Color3.fromRGB(248, 235, 220),
				TextDim = Color3.fromRGB(180, 150, 130),
				Element = Color3.fromRGB(55, 40, 32),
				ElementInner = Color3.fromRGB(35, 26, 22),
				Bar = Color3.fromRGB(20, 14, 11),
				ToggleOff = Color3.fromRGB(90, 68, 52),
				Knob = Color3.fromRGB(245, 230, 215),
				Accent = Color3.fromRGB(255, 126, 42)
			},
			Rose = {
				Main = Color3.fromRGB(32, 22, 28),
				Top = Color3.fromRGB(24, 16, 21),
				Text = Color3.fromRGB(232, 215, 224),
				TextTitle = Color3.fromRGB(248, 232, 240),
				TextDim = Color3.fromRGB(175, 140, 158),
				Element = Color3.fromRGB(52, 35, 44),
				ElementInner = Color3.fromRGB(32, 22, 28),
				Bar = Color3.fromRGB(18, 12, 16),
				ToggleOff = Color3.fromRGB(85, 58, 70),
				Knob = Color3.fromRGB(240, 225, 235),
				Accent = Color3.fromRGB(244, 63, 140)
			}
		}
		local CurrentTheme = Themes[Theme] or Themes.Dark
		_G.Color = CurrentTheme.Accent
		_G.ColorButton = CurrentTheme.Element

		local ThemeRegistry = {}
		local function Themed(inst, prop, key)
			if typeof(key) == "function" then
				inst[prop] = key()
			else
				inst[prop] = CurrentTheme[key]
			end
			table.insert(ThemeRegistry, {Instance = inst, Property = prop, Key = key})
			return inst
		end
		local function ApplyTheme(name)
			local NewTheme = Themes[name]
			if not NewTheme then return end
			Theme = name
			CurrentTheme = NewTheme
			_G.Color = CurrentTheme.Accent
			_G.ColorButton = CurrentTheme.Element
			for _, entry in next, ThemeRegistry do
				if entry.Instance and entry.Instance.Parent then
					if typeof(entry.Key) == "function" then
						entry.Instance[entry.Property] = entry.Key()
					else
						entry.Instance[entry.Property] = CurrentTheme[entry.Key]
					end
				end
			end
		end

		local uihide = false
		local abc = false
		local logo = config.Logo or 0
		local currentpage = ""
		local keybind = config.Keybind or Enum.KeyCode.RightControl
		local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
		
		local RippleHUBLIB = Instance.new("ScreenGui")
		RippleHUBLIB.Name = "RippleHUBLIB"
		RippleHUBLIB.Parent = game.CoreGui
		RippleHUBLIB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
		local Main = Instance.new("Frame")
		Main.Name = "Main"
		Main.Parent = RippleHUBLIB
		Main.ClipsDescendants = true
		Main.AnchorPoint = Vector2.new(0.5,0.5)
		Themed(Main, "BackgroundColor3", "Main")
		Main.Position = UDim2.new(0.5, 0, 0.5, 0)
		Main.Size = UDim2.new(0, 0, 0, 0)
		
		Main:TweenSize(WindowSize,"Out","Quad",0.4,true)
	
		local MCNR = Instance.new("UICorner")
		MCNR.Name = "MCNR"
		MCNR.Parent = Main
	
	
		local Top = Instance.new("Frame")
		Top.Name = "Top"
		Top.Parent = Main
		Themed(Top, "BackgroundColor3", "Top")
		Top.Size = UDim2.new(1, 0, 0, 27)
	
		local TCNR = Instance.new("UICorner")
		TCNR.Name = "TCNR"
		TCNR.Parent = Top
	
		local Name = Instance.new("TextLabel")
		Name.Name = "Name"
		Name.Parent = Top
		Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Name.BackgroundTransparency = 1.000
		Name.Position = UDim2.new(0, 14, 0, 0)
		Name.Size = UDim2.new(0, 250, 0, 27)
		Name.Font = Enum.Font.GothamBold
		Name.Text = Title
		Themed(Name, "TextColor3", "Text")
		Name.TextSize = 19.000
		Name.TextXAlignment = Enum.TextXAlignment.Left
	
		local Ver = Instance.new("TextLabel")
		Ver.Name = "Ver"
		Ver.Parent = Top
		Ver.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Ver.BackgroundTransparency = 1.000
		Ver.Position = UDim2.new(0.847561002, 0, 0, 1)
		Ver.Size = UDim2.new(0, 47, 0, 27)
		Ver.Font = Enum.Font.GothamSemibold
		Themed(Ver, "Text", function() return Theme end)
		Ver.Visible = false
		Themed(Ver, "TextColor3", "Accent")
		Ver.TextSize = 15.000
	
	
		local CloseButton = Instance.new("TextButton")
		CloseButton.Name = "CloseButton"
		CloseButton.Parent = Top
		CloseButton.BackgroundTransparency = 1.000
		CloseButton.AnchorPoint = Vector2.new(1, 0)
		CloseButton.Position = UDim2.new(1, -8, 0, 1)
		CloseButton.Size = UDim2.new(0, 25, 0, 25)
		CloseButton.Font = Enum.Font.GothamBold
		CloseButton.Text = "X"
		Themed(CloseButton, "TextColor3", "Text")
		CloseButton.TextSize = 16.000

		local MinimizeButton = Instance.new("TextButton")
		MinimizeButton.Name = "MinimizeButton"
		MinimizeButton.Parent = Top
		MinimizeButton.BackgroundTransparency = 1.000
		MinimizeButton.AnchorPoint = Vector2.new(1, 0)
		MinimizeButton.Position = UDim2.new(1, -33, 0, 1)
		MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
		MinimizeButton.Font = Enum.Font.GothamBold
		MinimizeButton.Text = "-"
		Themed(MinimizeButton, "TextColor3", "Text")
		MinimizeButton.TextSize = 18.000

		MinimizeButton.MouseButton1Click:Connect(function()
			RippleHUBLIB.Enabled = false
		end)

		CloseButton.MouseButton1Click:Connect(function()
			RippleHUBLIB:Destroy()
		end)
	
		do  local ui =  game:GetService("CoreGui"):FindFirstChild("Ripple")  if ui then ui:Destroy() end end
	
	
		local Luna = Instance.new("ScreenGui")
		local ToggleFrameUi = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ToggleImgUi = Instance.new("ImageLabel")
		local Uitoggle = Instance.new("TextLabel")
		local Yedhee = Instance.new("TextLabel")
		local SearchStroke = Instance.new("UIStroke")
	
	

	
		MakeDraggable(ToggleFrameUi,ToggleFrameUi)
	
	
	
	
	
		local Tab = Instance.new("Frame")
		Tab.Name = "Tab"
		Tab.Parent = Main
		Themed(Tab, "BackgroundColor3", "Top")
		Tab.Position = UDim2.new(0, 5, 0, 30)
		Tab.Size = UDim2.new(0, 150, 1, -35)
	
		local TCNR = Instance.new("UICorner")
		TCNR.Name = "TCNR"
		TCNR.Parent = Tab
	
		local ScrollTab = Instance.new("ScrollingFrame")
		ScrollTab.Name = "ScrollTab"
		ScrollTab.Parent = Tab
		ScrollTab.Active = true
		ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollTab.BackgroundTransparency = 1.000
		ScrollTab.Size = UDim2.new(1, 0, 1, 0)
		ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollTab.ScrollBarThickness = 0
	
		local PLL = Instance.new("UIListLayout")
		PLL.Name = "PLL"
		PLL.Parent = ScrollTab
		PLL.SortOrder = Enum.SortOrder.LayoutOrder
		PLL.Padding = UDim.new(0, 15)
	
		local PPD = Instance.new("UIPadding")
		PPD.Name = "PPD"
		PPD.Parent = ScrollTab
		PPD.PaddingLeft = UDim.new(0, 10)
		PPD.PaddingTop = UDim.new(0, 10)
	
		local Page = Instance.new("Frame")
		Page.Name = "Page"
		Page.Parent = Main
		Themed(Page, "BackgroundColor3", "Top")
		Page.Position = UDim2.new(0, 160, 0, 30)
		Page.Size = UDim2.new(1, -165, 1, -35)
	
		local PCNR = Instance.new("UICorner")
		PCNR.Name = "PCNR"
		PCNR.Parent = Page
	
		local MainPage = Instance.new("Frame")
		MainPage.Name = "MainPage"
		MainPage.Parent = Page
		MainPage.ClipsDescendants = true
		MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainPage.BackgroundTransparency = 1.000
		MainPage.Size = UDim2.new(1, 0, 1, 0)
	
		local PageList = Instance.new("Folder")
		PageList.Name = "PageList"
		PageList.Parent = MainPage
	
		local UIPageLayout = Instance.new("UIPageLayout")
	
		UIPageLayout.Parent = PageList
		UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
		UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
		UIPageLayout.FillDirection = Enum.FillDirection.Vertical
		UIPageLayout.Padding = UDim.new(0, 15)
		UIPageLayout.TweenTime = 0.400
		UIPageLayout.GamepadInputEnabled = false
		UIPageLayout.ScrollWheelInputEnabled = false
		UIPageLayout.TouchInputEnabled = false
		
		MakeDraggable(Top,Main)
	
		
		local uitab = {}
		function uitab:SetTheme(name)
			ApplyTheme(name)
		end
		
		function uitab:AddTab(tabConfig, logo1)
			local text, iconInput
			if type(tabConfig) == "table" then
				text = tabConfig.Title or tabConfig.Text or "Tab"
				iconInput = tabConfig.Icon
			else
				text = tabConfig
				iconInput = logo1
			end

			local TabButton = Instance.new("TextButton")
			TabButton.Parent = ScrollTab
			TabButton.Name = text.."Server"
			TabButton.Text = text
			TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabButton.BackgroundTransparency = 1.000
			TabButton.Size = UDim2.new(0, 130, 0, 23)
			TabButton.Font = Enum.Font.GothamSemibold
			Themed(TabButton, "TextColor3", "Text")
			TabButton.TextSize = 15.000
			TabButton.TextTransparency = 0.500
			TabButton.TextXAlignment = Enum.TextXAlignment.Left
			TabButton.TextTruncate = Enum.TextTruncate.AtEnd

			local IconResolved = ResolveIcon(iconInput)

			local TabPadding = Instance.new("UIPadding")
			TabPadding.Parent = TabButton
			TabPadding.PaddingLeft = UDim.new(0, IconResolved and 28 or 8)

			local IDK = Instance.new("ImageLabel")
			IDK.Name = "LogoIDK"
			IDK.Parent = TabButton
			IDK.BackgroundTransparency = 1.000
			IDK.AnchorPoint = Vector2.new(0, 0.5)
			IDK.Position = UDim2.new(0, 4, 0.5, 0)
			IDK.Size = UDim2.new(0, 18, 0, 18)
			Themed(IDK, "ImageColor3", "Text")
			IDK.ImageTransparency = 0.500
			IDK.Visible = IconResolved ~= nil

			if IconResolved then
				IDK.Image = IconResolved.Image
				if IconResolved.ImageRectOffset then
					IDK.ImageRectOffset = IconResolved.ImageRectOffset
				end
				if IconResolved.ImageRectSize then
					IDK.ImageRectSize = IconResolved.ImageRectSize
				end
			end

	
			local MainFramePage = Instance.new("ScrollingFrame")
			MainFramePage.Name = text.."_Page"
			MainFramePage.Parent = PageList
			MainFramePage.Active = true
			MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainFramePage.BackgroundTransparency = 1.000
			MainFramePage.BorderSizePixel = 0
			MainFramePage.Size = UDim2.new(1, 0, 1, 0)
			MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
			MainFramePage.ScrollBarThickness = 0
			
			local UIPadding = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")
			
			UIPadding.Parent = MainFramePage
			UIPadding.PaddingLeft = UDim.new(0, 10)
			UIPadding.PaddingTop = UDim.new(0, 10)
	
			UIListLayout.Padding = UDim.new(0,15)
			UIListLayout.Parent = MainFramePage
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			
			TabButton.MouseButton1Click:Connect(function()
				for i,v in next, ScrollTab:GetChildren() do
					if v:IsA("TextButton") then
						TweenService:Create(
							v,
							TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
						local vIcon = v:FindFirstChild("LogoIDK")
						if vIcon then
							TweenService:Create(
								vIcon,
								TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
								{ImageTransparency = 0.5}
							):Play()
						end
					end
					TweenService:Create(
						TabButton,
						TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					if IconResolved then
						TweenService:Create(
							IDK,
							TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{ImageTransparency = 0}
						):Play()
					end
				end
				for i,v in next, PageList:GetChildren() do
					currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
					if v.Name == currentpage then
						UIPageLayout:JumpTo(v)
					end
				end
			end)
	
			if abc == false then
				for i,v in next, ScrollTab:GetChildren() do
					if v:IsA("TextButton") then
						TweenService:Create(
							v,
							TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
					end
					TweenService:Create(
						TabButton,
						TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end
				UIPageLayout:JumpToIndex(1)
				abc = true
			end
			
			game:GetService("RunService").Stepped:Connect(function()
				pcall(function()
					MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
					ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
				end)
			end)
	
			
			local main = {}
			function main:AddButton(options)
				options = options or {}
				local text = options.Title or "Button"
				local desc = options.Description
				local callback = options.Callback or function() end
				local rowHeight = desc and 54 or 40
				local Button = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Inner = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local Label = Instance.new("TextLabel")
				local DescLabel = Instance.new("TextLabel")
				local TextBtn = Instance.new("TextButton")
				local UICorner_3 = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = MainFramePage
				Themed(Button, "BackgroundColor3", "Element")
				Button.Size = UDim2.new(1, -20, 0, rowHeight)

				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = Button

				Inner.Name = "Inner"
				Inner.Parent = Button
				Themed(Inner, "BackgroundColor3", "ElementInner")
				Inner.Position = UDim2.new(0, 1, 0, 1)
				Inner.Size = UDim2.new(1, -2, 1, -2)

				UICorner_2.CornerRadius = UDim.new(0, 6)
				UICorner_2.Parent = Inner

				Label.Name = "Label"
				Label.Parent = Button
				Label.BackgroundTransparency = 1.000
				Label.Position = desc and UDim2.new(0, 15, 0, 6) or UDim2.new(0, 15, 0, 0)
				Label.Size = desc and UDim2.new(1, -95, 0, 20) or UDim2.new(1, -95, 1, 0)
				Label.Font = Enum.Font.GothamSemibold
				Label.Text = text
				Themed(Label, "TextColor3", "TextTitle")
				Label.TextSize = 15.000
				Label.TextXAlignment = Enum.TextXAlignment.Left

				DescLabel.Name = "DescLabel"
				DescLabel.Parent = Button
				DescLabel.BackgroundTransparency = 1.000
				DescLabel.Visible = desc and true or false
				DescLabel.Position = UDim2.new(0, 15, 0, 27)
				DescLabel.Size = UDim2.new(1, -95, 0, 20)
				DescLabel.Font = Enum.Font.Gotham
				DescLabel.Text = desc or ""
				Themed(DescLabel, "TextColor3", "TextDim")
				DescLabel.TextSize = 13.000
				DescLabel.TextXAlignment = Enum.TextXAlignment.Left
				DescLabel.TextTruncate = Enum.TextTruncate.AtEnd

				TextBtn.Name = "TextBtn"
				TextBtn.Parent = Button
				TextBtn.AnchorPoint = Vector2.new(1, 0.5)
				Themed(TextBtn, "BackgroundColor3", "Accent")
				TextBtn.Position = UDim2.new(1, -12, 0.5, 0)
				TextBtn.Size = UDim2.new(0, 66, 0, 26)
				TextBtn.AutoButtonColor = false
				TextBtn.Font = Enum.Font.GothamSemibold
				TextBtn.Text = "Executar"
				TextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBtn.TextSize = 12.000
				TextBtn.ClipsDescendants = true

				UICorner_3.CornerRadius = UDim.new(0, 6)
				UICorner_3.Parent = TextBtn

				TextBtn.MouseEnter:Connect(function()
					TweenService:Create(
						TextBtn,
						TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundTransparency = 0.2}
					):Play()
				end)
				TextBtn.MouseLeave:Connect(function()
					TweenService:Create(
						TextBtn,
						TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
				end)
				TextBtn.MouseButton1Click:Connect(function()
					CircleAnim(TextBtn, Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
					pcall(callback)
				end)
			end
			function main:AddToggle(options)
				options = options or {}
				local text = options.Title or "Toggle"
				local desc = options.Description
				local callback = options.Callback or function() end
				local config = options.Default or false
				local toggled = config
				local rowHeight = desc and 54 or 40
				local Toggle = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Button = Instance.new("TextButton")
				local UICorner_2 = Instance.new("UICorner")
				local Label = Instance.new("TextLabel")
				local DescLabel = Instance.new("TextLabel")
				local ToggleImage = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local Circle = Instance.new("Frame")
				local UICorner_4 = Instance.new("UICorner")


				Toggle.Name = "Toggle"
				Toggle.Parent = MainFramePage
				Themed(Toggle, "BackgroundColor3", "Element")
				Toggle.Size = UDim2.new(1, -20, 0, rowHeight)

				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = Toggle

				Button.Name = "Button"
				Button.Parent = Toggle
				Themed(Button, "BackgroundColor3", "ElementInner")
				Button.Position = UDim2.new(0, 1, 0, 1)
				Button.Size = UDim2.new(1, -2, 1, -2)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 11.000

				UICorner_2.CornerRadius = UDim.new(0, 6)
				UICorner_2.Parent = Button

				Label.Name = "Label"
				Label.Parent = Toggle
				Label.BackgroundTransparency = 1.000
				Label.Position = desc and UDim2.new(0, 15, 0, 6) or UDim2.new(0, 15, 0, 0)
				Label.Size = desc and UDim2.new(1, -75, 0, 20) or UDim2.new(1, -75, 1, 0)
				Label.Font = Enum.Font.GothamSemibold
				Label.Text = text
				Themed(Label, "TextColor3", "TextTitle")
				Label.TextSize = 15.000
				Label.TextXAlignment = Enum.TextXAlignment.Left

				DescLabel.Name = "DescLabel"
				DescLabel.Parent = Toggle
				DescLabel.BackgroundTransparency = 1.000
				DescLabel.Visible = desc and true or false
				DescLabel.Position = UDim2.new(0, 15, 0, 27)
				DescLabel.Size = UDim2.new(1, -75, 0, 20)
				DescLabel.Font = Enum.Font.Gotham
				DescLabel.Text = desc or ""
				Themed(DescLabel, "TextColor3", "TextDim")
				DescLabel.TextSize = 13.000
				DescLabel.TextXAlignment = Enum.TextXAlignment.Left
				DescLabel.TextTruncate = Enum.TextTruncate.AtEnd

				ToggleImage.Name = "ToggleImage"
				ToggleImage.Parent = Toggle
				Themed(ToggleImage, "BackgroundColor3", function() return toggled and CurrentTheme.Accent or CurrentTheme.ToggleOff end)
				ToggleImage.AnchorPoint = Vector2.new(1, 0.5)
				ToggleImage.Position = UDim2.new(1, -12, 0.5, 0)
				ToggleImage.Size = UDim2.new(0, 46, 0, 24)

				UICorner_3.CornerRadius = UDim.new(0, 12)
				UICorner_3.Parent = ToggleImage

				Circle.Name = "Circle"
				Circle.Parent = ToggleImage
				Themed(Circle, "BackgroundColor3", "Knob")
				Circle.Position = UDim2.new(0, 3, 0, 3)
				Circle.Size = UDim2.new(0, 18, 0, 18)

				UICorner_4.CornerRadius = UDim.new(0, 9)
				UICorner_4.Parent = Circle

				Button.MouseButton1Click:Connect(function()
					if toggled == false then
						toggled = true
						Circle:TweenPosition(UDim2.new(0,25,0,3),"Out","Sine",0.2,true)
						TweenService:Create(
							ToggleImage,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = _G.Color}
						):Play()
					else
						toggled = false
						Circle:TweenPosition(UDim2.new(0,3,0,3),"Out","Sine",0.2,true)
						TweenService:Create(
							ToggleImage,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = CurrentTheme.ToggleOff}
						):Play()
					end
					pcall(callback,toggled)
				end)

				if config == true then
					toggled = true
					Circle.Position = UDim2.new(0,25,0,3)
					pcall(callback,toggled)
				end
			end
		function main:AddDropdown(options)
			options = options or {}
			local text = options.Title or "Dropdown"
			local desc = options.Description
			local option = options.Values or {}
			local callback = options.Callback or function() end
			local isdropping = false
			local baseHeight = desc and 54 or 40
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropTitle = Instance.new("TextLabel")
			local DropDescLabel = Instance.new("TextLabel")
			local DropValue = Instance.new("TextLabel")
			local DropScroll = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local DropButton = Instance.new("TextButton")
			local DropImage = Instance.new("ImageLabel")

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = MainFramePage
			Themed(Dropdown, "BackgroundColor3", "Element")
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(1, -20, 0, baseHeight)

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = Dropdown

			DropTitle.Name = "DropTitle"
			DropTitle.Parent = Dropdown
			DropTitle.BackgroundTransparency = 1.000
			DropTitle.Position = desc and UDim2.new(0, 15, 0, 6) or UDim2.new(0, 15, 0, 0)
			DropTitle.Size = desc and UDim2.new(1, -70, 0, 20) or UDim2.new(1, -70, 0, baseHeight)
			DropTitle.Font = Enum.Font.GothamSemibold
			DropTitle.Text = text
			Themed(DropTitle, "TextColor3", "TextTitle")
			DropTitle.TextSize = 15.000
			DropTitle.TextXAlignment = Enum.TextXAlignment.Left

			DropDescLabel.Name = "DropDescLabel"
			DropDescLabel.Parent = Dropdown
			DropDescLabel.BackgroundTransparency = 1.000
			DropDescLabel.Visible = desc and true or false
			DropDescLabel.Position = UDim2.new(0, 15, 0, 27)
			DropDescLabel.Size = UDim2.new(1, -70, 0, 20)
			DropDescLabel.Font = Enum.Font.Gotham
			DropDescLabel.Text = desc or ""
			Themed(DropDescLabel, "TextColor3", "TextDim")
			DropDescLabel.TextSize = 13.000
			DropDescLabel.TextXAlignment = Enum.TextXAlignment.Left
			DropDescLabel.TextTruncate = Enum.TextTruncate.AtEnd

			DropValue.Name = "DropValue"
			DropValue.Parent = Dropdown
			DropValue.BackgroundTransparency = 1.000
			DropValue.AnchorPoint = Vector2.new(1, 0)
			DropValue.Position = UDim2.new(1, -35, 0, 0)
			DropValue.Size = UDim2.new(0, 120, 0, baseHeight)
			DropValue.Font = Enum.Font.Gotham
			DropValue.Text = "Selecionar"
			Themed(DropValue, "TextColor3", "TextDim")
			DropValue.TextSize = 13.000
			DropValue.TextXAlignment = Enum.TextXAlignment.Right
			DropValue.TextTruncate = Enum.TextTruncate.AtEnd

			DropScroll.Name = "DropScroll"
			DropScroll.Parent = Dropdown
			DropScroll.Active = true
			DropScroll.BackgroundTransparency = 1.000
			DropScroll.BorderSizePixel = 0
			DropScroll.Position = UDim2.new(0, 0, 0, baseHeight)
			DropScroll.Size = UDim2.new(1, 0, 0, 100)
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
			DropScroll.ScrollBarThickness = 3

			UIListLayout.Parent = DropScroll
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			UIPadding.Parent = DropScroll
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)

			DropImage.Name = "DropImage"
			DropImage.Parent = Dropdown
			DropImage.BackgroundTransparency = 1.000
			DropImage.AnchorPoint = Vector2.new(1, 0.5)
			DropImage.Position = UDim2.new(1, -12, 0, baseHeight/2)
			DropImage.Rotation = -90
			DropImage.Size = UDim2.new(0, 18, 0, 18)
			DropImage.Image = "rbxassetid://6031090990"

			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown
			DropButton.BackgroundTransparency = 1.000
			DropButton.Size = UDim2.new(1, 0, 0, baseHeight)
			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14.000

			for i,v in next,option do
				local Item = Instance.new("TextButton")

				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(1, -10, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(v)
				Themed(Item, "TextColor3", "Text")
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500
				Item.ClipsDescendants = true


				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					CircleAnim(Item, Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
					isdropping = false
					Dropdown:TweenSize(UDim2.new(1,-20,0,baseHeight),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = -90}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
					callback(Item.Text)
					DropValue.Text = Item.Text
				end)
			end

			DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

			DropButton.MouseButton1Click:Connect(function()
				if isdropping == false then
					isdropping = true
					Dropdown:TweenSize(UDim2.new(1,-20,0,baseHeight + 100),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
				else
					isdropping = false
					Dropdown:TweenSize(UDim2.new(1,-20,0,baseHeight),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = -90}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
				end
			end)

			local dropfunc = {}
			function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(1, -10, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Themed(Item, "TextColor3", "Text")
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500
				Item.ClipsDescendants = true

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					CircleAnim(Item, Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
					Dropdown:TweenSize(UDim2.new(1,-20,0,baseHeight),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = -90}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
					callback(Item.Text)
					DropValue.Text = Item.Text
				end)
			end

			function dropfunc:Clear()
				DropValue.Text = "Selecionar"
				isdropping = false
				Dropdown:TweenSize(UDim2.new(1,-20,0,baseHeight),"Out","Quad",0.3,true)
				TweenService:Create(
					DropImage,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = -90}
				):Play()
				for i,v in next, DropScroll:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			return dropfunc
		end

		function main:AddThemeDropdown(options)
			options = options or {}
			local names = {}
			for name,_ in pairs(Themes) do
				table.insert(names, name)
			end
			table.sort(names)
			return self:AddDropdown({
				Title = options.Title or "Tema",
				Description = options.Description or "Escolha o tema da interface",
				Values = names,
				Callback = function(value)
					ApplyTheme(value)
				end
			})
		end
	
			function main:AddSlider(options)
				options = options or {}
				local text = options.Title or "Slider"
				local desc = options.Description
				local min = options.Min or 0
				local max = options.Max or 100
				local set = options.Default or min
				local callback = options.Callback or function() end
				local baseHeight = desc and 65 or 51
				local Slider = Instance.new("Frame")
				local slidercorner = Instance.new("UICorner")
				local sliderr = Instance.new("Frame")
				local sliderrcorner = Instance.new("UICorner")
				local SliderLabel = Instance.new("TextLabel")
				local SliderDescLabel = Instance.new("TextLabel")
				local HAHA = Instance.new("Frame")
				local AHEHE = Instance.new("TextButton")
				local bar = Instance.new("Frame")
				local bar1 = Instance.new("Frame")
				local bar1corner = Instance.new("UICorner")
				local barcorner = Instance.new("UICorner")
				local circlebar = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local slidervalue = Instance.new("Frame")
				local valuecorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				local UICorner_2 = Instance.new("UICorner")
	
				Slider.Name = "Slider"
				Slider.Parent = MainFramePage
				Themed(Slider, "BackgroundColor3", "Element")
				Slider.BackgroundTransparency = 0
				Slider.Size = UDim2.new(1, -20, 0, baseHeight)
	
				slidercorner.CornerRadius = UDim.new(0, 6)
				slidercorner.Name = "slidercorner"
				slidercorner.Parent = Slider
	
				sliderr.Name = "sliderr"
				sliderr.Parent = Slider
				Themed(sliderr, "BackgroundColor3", "ElementInner")
				sliderr.Position = UDim2.new(0, 1, 0, 1)
				sliderr.Size = UDim2.new(1, -2, 1, -2)
	
				sliderrcorner.CornerRadius = UDim.new(0, 6)
				sliderrcorner.Name = "sliderrcorner"
				sliderrcorner.Parent = sliderr
	
				SliderLabel.Name = "SliderLabel"
				SliderLabel.Parent = sliderr
				SliderLabel.BackgroundTransparency = 1.000
				SliderLabel.Position = UDim2.new(0, 15, 0, desc and 6 or 0)
				SliderLabel.Size = UDim2.new(0, 180, 0, desc and 20 or 26)
				SliderLabel.Font = Enum.Font.GothamSemibold
				SliderLabel.Text = text
				Themed(SliderLabel, "TextColor3", "TextTitle")
				SliderLabel.TextSize = 15.000
				SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

				SliderDescLabel.Name = "SliderDescLabel"
				SliderDescLabel.Parent = sliderr
				SliderDescLabel.BackgroundTransparency = 1.000
				SliderDescLabel.Visible = desc and true or false
				SliderDescLabel.Position = UDim2.new(0, 15, 0, 27)
				SliderDescLabel.Size = UDim2.new(1, -100, 0, 18)
				SliderDescLabel.Font = Enum.Font.Gotham
				SliderDescLabel.Text = desc or ""
				Themed(SliderDescLabel, "TextColor3", "TextDim")
				SliderDescLabel.TextSize = 13.000
				SliderDescLabel.TextXAlignment = Enum.TextXAlignment.Left
				SliderDescLabel.TextTruncate = Enum.TextTruncate.AtEnd
	
				HAHA.Name = "HAHA"
				HAHA.Parent = sliderr
				HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HAHA.BackgroundTransparency = 1.000
				HAHA.Size = UDim2.new(1, -2, 0, 29)
	
				AHEHE.Name = "AHEHE"
				AHEHE.Parent = sliderr
				AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AHEHE.BackgroundTransparency = 1.000
				AHEHE.Position = UDim2.new(0, 10, 0, desc and 49 or 35)
				AHEHE.Size = UDim2.new(1, -20, 0, 5)
				AHEHE.Font = Enum.Font.SourceSans
				AHEHE.Text = ""
				AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
				AHEHE.TextSize = 14.000
	
				bar.Name = "bar"
				bar.Parent = AHEHE
				Themed(bar, "BackgroundColor3", "Bar")
				bar.Size = UDim2.new(1, 0, 0, 5)
	
				bar1.Name = "bar1"
				bar1.Parent = bar
				Themed(bar1, "BackgroundColor3", "Accent")
				bar1.BackgroundTransparency = 0
				bar1.Size = UDim2.new(set/max, 0, 0, 5)
	
				bar1corner.CornerRadius = UDim.new(0, 5)
				bar1corner.Name = "bar1corner"
				bar1corner.Parent = bar1
	
				barcorner.CornerRadius = UDim.new(0, 5)
				barcorner.Name = "barcorner"
				barcorner.Parent = bar
	
				circlebar.Name = "circlebar"
				circlebar.Parent = bar1
				Themed(circlebar, "BackgroundColor3", "Knob")
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				circlebar.Size = UDim2.new(0, 10, 0, 10)
	
				UICorner.CornerRadius = UDim.new(0, 100)
				UICorner.Parent = circlebar
	
				slidervalue.Name = "slidervalue"
				slidervalue.Parent = sliderr
				Themed(slidervalue, "BackgroundColor3", "Accent")
				slidervalue.BackgroundTransparency = 0
				slidervalue.AnchorPoint = Vector2.new(1, 0)
				slidervalue.Position = UDim2.new(1, -8, 0, 5)
				slidervalue.Size = UDim2.new(0, 65, 0, 18)
	
				valuecorner.CornerRadius = UDim.new(0, 5)
				valuecorner.Name = "valuecorner"
				valuecorner.Parent = slidervalue
	
				TextBox.Parent = slidervalue
				Themed(TextBox, "BackgroundColor3", "Top")
				TextBox.Position = UDim2.new(0, 1, 0, 1)
				TextBox.Size = UDim2.new(0, 63, 0, 16)
				TextBox.Font = Enum.Font.GothamSemibold
				Themed(TextBox, "TextColor3", "Text")
				TextBox.TextSize = 9.000
				TextBox.Text = set
				TextBox.TextTransparency = 0
	
				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = TextBox
	
				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
	
				if Value == nil then
					Value = set
					pcall(function()
						callback(Value)
					end)
				end
				
				AHEHE.MouseButton1Down:Connect(function()
					Value = math.floor((((tonumber(max) - tonumber(min)) / bar.AbsoluteSize.X) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
					pcall(function()
						callback(Value)
					end)
					TweenService:Create(
						bar1,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, bar.AbsoluteSize.X), 0, 5)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					--bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
					TweenService:Create(
						circlebar,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Position =  UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, bar.AbsoluteSize.X - 10), 0, -3)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					--circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
					moveconnection = mouse.Move:Connect(function()
						TextBox.Text = Value
						Value = math.floor((((tonumber(max) - tonumber(min)) / bar.AbsoluteSize.X) * bar1.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						TweenService:Create(
							bar1,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, bar.AbsoluteSize.X), 0, 5)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						--bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
						TweenService:Create(
							circlebar,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position =  UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, bar.AbsoluteSize.X - 10), 0, -3)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						--circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(max) - tonumber(min)) / bar.AbsoluteSize.X) * bar1.AbsoluteSize.X) + tonumber(min))
							pcall(function()
								callback(Value)
							end)
							TweenService:Create(
								bar1,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, bar.AbsoluteSize.X), 0, 5)} -- UDim2.new(0, 128, 0, 25)
							):Play()
							--bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
							TweenService:Create(
								circlebar,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Position =  UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, bar.AbsoluteSize.X - 10), 0, -3)} -- UDim2.new(0, 128, 0, 25)
							):Play()
							--circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(max) - tonumber(min)) / bar.AbsoluteSize.X) * bar1.AbsoluteSize.X) + tonumber(min))
						TextBox.Text = Value
					end
				end)
	
				TextBox.FocusLost:Connect(function()
					if tonumber(TextBox.Text) > max then
						TextBox.Text  = max
					end
					bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
					circlebar.Position = UDim2.new(1, -2, 0, -3)
					TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
					pcall(callback, TextBox.Text)
				end)
			end
	
			function main:AddTextbox(options)
				options = options or {}
				local text = options.Title or "Textbox"
				local desc = options.Description
				local disappear = options.ClearTextOnFocus or false
				local callback = options.Callback or function() end
				local baseHeight = desc and 54 or 40
				local Textbox = Instance.new("Frame")
				local TextboxCorner = Instance.new("UICorner")
				local Textboxx = Instance.new("Frame")
				local TextboxxCorner = Instance.new("UICorner")
				local TextboxLabel = Instance.new("TextLabel")
				local TextboxDescLabel = Instance.new("TextLabel")
				local RealTextbox = Instance.new("TextBox")
				local UICorner = Instance.new("UICorner")
	
				Textbox.Name = "Textbox"
				Textbox.Parent = MainFramePage
				Themed(Textbox, "BackgroundColor3", "Element")
				Textbox.BackgroundTransparency = 0
				Textbox.Size = UDim2.new(1, -20, 0, baseHeight)
	
				TextboxCorner.CornerRadius = UDim.new(0, 6)
				TextboxCorner.Name = "TextboxCorner"
				TextboxCorner.Parent = Textbox
	
				Textboxx.Name = "Textboxx"
				Textboxx.Parent = Textbox
				Themed(Textboxx, "BackgroundColor3", "ElementInner")
				Textboxx.Position = UDim2.new(0, 1, 0, 1)
				Textboxx.Size = UDim2.new(1, -2, 1, -2)
	
				TextboxxCorner.CornerRadius = UDim.new(0, 6)
				TextboxxCorner.Name = "TextboxxCorner"
				TextboxxCorner.Parent = Textboxx
	
				TextboxLabel.Name = "TextboxLabel"
				TextboxLabel.Parent = Textbox
				TextboxLabel.BackgroundTransparency = 1.000
				TextboxLabel.Position = desc and UDim2.new(0, 15, 0, 6) or UDim2.new(0, 15, 0, 0)
				TextboxLabel.Text = text
				TextboxLabel.Size = desc and UDim2.new(1, -125, 0, 20) or UDim2.new(1, -125, 1, 0)
				TextboxLabel.Font = Enum.Font.GothamSemibold
				Themed(TextboxLabel, "TextColor3", "TextTitle")
				TextboxLabel.TextSize = 15.000
				TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

				TextboxDescLabel.Name = "TextboxDescLabel"
				TextboxDescLabel.Parent = Textbox
				TextboxDescLabel.BackgroundTransparency = 1.000
				TextboxDescLabel.Visible = desc and true or false
				TextboxDescLabel.Position = UDim2.new(0, 15, 0, 27)
				TextboxDescLabel.Size = UDim2.new(1, -125, 0, 18)
				TextboxDescLabel.Font = Enum.Font.Gotham
				TextboxDescLabel.Text = desc or ""
				Themed(TextboxDescLabel, "TextColor3", "TextDim")
				TextboxDescLabel.TextSize = 13.000
				TextboxDescLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextboxDescLabel.TextTruncate = Enum.TextTruncate.AtEnd
	
				RealTextbox.Name = "RealTextbox"
				RealTextbox.Parent = Textbox
				Themed(RealTextbox, "BackgroundColor3", "Bar")
				RealTextbox.BackgroundTransparency = 0
				RealTextbox.AnchorPoint = Vector2.new(1, 0.5)
				RealTextbox.Position = UDim2.new(1, -12, 0.5, 0)
				RealTextbox.Size = UDim2.new(0, 100, 0, 26)
				RealTextbox.Font = Enum.Font.GothamSemibold
				RealTextbox.PlaceholderText = "..."
				RealTextbox.Text = ""
				Themed(RealTextbox, "TextColor3", "Text")
				RealTextbox.TextSize = 12.000
				RealTextbox.TextTransparency = 0
	
				RealTextbox.FocusLost:Connect(function()
					callback(RealTextbox.Text)
					if disappear then
						RealTextbox.Text = ""
					end
				end)
	
				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = RealTextbox
			end
			function main:AddLabel(options)
				options = options or {}
				local text = options.Text or ""
				local Label = Instance.new("TextLabel")
				local PaddingLabel = Instance.new("UIPadding")
				local labell = {}
		
				Label.Name = "Label"
				Label.Parent = MainFramePage
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(1, -20, 0, 20)
				Label.Font = Enum.Font.GothamSemibold
				Themed(Label, "TextColor3", "Text")
				Label.TextSize = 16.000
				Label.Text = text
				Label.TextXAlignment = Enum.TextXAlignment.Left
	
				PaddingLabel.PaddingLeft = UDim.new(0,0)
				PaddingLabel.Parent = Label
				PaddingLabel.Name = "PaddingLabel"
		
				function labell:Set(newtext)
					Label.Text = newtext
				end
	
				return labell
			end
			function main:AddSubLabel(options)
				options = options or {}
				local text = options.Text or ""
				local Label = Instance.new("TextLabel")
				local PaddingLabel = Instance.new("UIPadding")
				local labell = {}
		
				Label.Name = "Label"
				Label.Parent = MainFramePage
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(1, -20, 0, 20)
				Label.Font = Enum.Font.GothamSemibold
				Themed(Label, "TextColor3", "TextDim")
				Label.TextSize = 15.000
				Label.Text = text
				Label.TextXAlignment = Enum.TextXAlignment.Left
	
				PaddingLabel.PaddingLeft = UDim.new(0,25)
				PaddingLabel.Parent = Label
				PaddingLabel.Name = "PaddingLabel"
		
				function labell:Set(newtext)
					Label.Text = newtext
				end
	
				return labell
			end
			function main:AddSection(options)
				options = options or {}
				local text = options.Title or ""
				local Seperator = Instance.new("Frame")
				local Sep1 = Instance.new("Frame")
				local Sep2 = Instance.new("TextLabel")
				local Sep3 = Instance.new("Frame")
				
				Seperator.Name = "Seperator"
				Seperator.Parent = MainFramePage
				Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Seperator.BackgroundTransparency = 1.000
				Seperator.Size = UDim2.new(1, -20, 0, 20)
				
				Sep1.Name = "Sep1"
				Sep1.Parent = Seperator
				Themed(Sep1, "BackgroundColor3", "Accent")
				Sep1.BorderSizePixel = 0
				Sep1.Position = UDim2.new(0, 0, 0, 10)
				Sep1.Size = UDim2.new(0, 80, 0, 1)
				
				Sep2.Name = "Sep2"
				Sep2.Parent = Seperator
				Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Sep2.BackgroundTransparency = 1.000
				Sep2.AnchorPoint = Vector2.new(0.5, 0)
			Sep2.Position = UDim2.new(0.5, 0, 0, 0)
				Sep2.Size = UDim2.new(0, 100, 0, 20)
				Sep2.Font = Enum.Font.GothamSemibold
				Sep2.Text = text
				Themed(Sep2, "TextColor3", "Text")
				Sep2.TextSize = 14.000
				
				Sep3.Name = "Sep3"
				Sep3.Parent = Seperator
				Themed(Sep3, "BackgroundColor3", "Accent")
				Sep3.BorderSizePixel = 0
				Sep3.AnchorPoint = Vector2.new(1, 0)
			Sep3.Position = UDim2.new(1, 0, 0, 10)
				Sep3.Size = UDim2.new(0, 80, 0, 1)
			end
	
			function main:AddDivider()
				local Linee = Instance.new("Frame")
				local Line = Instance.new("Frame")
				
				Linee.Name = "Linee"
				Linee.Parent = MainFramePage
				Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Linee.BackgroundTransparency = 1.000
				Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
				Linee.Size = UDim2.new(1, -20, 0, 20)
				
				Line.Name = "Line"
				Line.Parent = Linee
				Themed(Line, "BackgroundColor3", "Accent")
				Line.BorderSizePixel = 0
				Line.Position = UDim2.new(0, 0, 0, 10)
				Line.Size = UDim2.new(1, 0, 0, 1)
			end
			return main
		end
		return uitab
	end
end