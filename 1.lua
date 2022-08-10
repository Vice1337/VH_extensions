
--- PRE UI STUFF ---

if game.CoreGui:FindFirstChild("Vice") then
	game.CoreGui:FindFirstChild("Vice"):Destroy()
end

local UserInputService = game:GetService('UserInputService')
local TextService = game:GetService('TextService')
local TweenService = game:GetService('TweenService')
local CoreGui = game:GetService('CoreGui')
local RenderStepped = game:GetService('RunService').RenderStepped
local LocalPlayer = game:GetService('Players').LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer


local function Drag(drag, frame) 
	pcall(function()
		local dragging = false
		local dragInput, mousePos, framePos

		drag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				mousePos = input.Position
				framePos = frame.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		drag.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - mousePos
				frame.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
			end
		end)
	end)
end

local PID = LocalPlayer.UserId

--- LIB START ---

local lib = {
	Animations = {
		AnimSpeed = 0.2,
		ElementsAS = 0.2
	}
}

---HOLDERS---

local Vice = Instance.new("ScreenGui")
Vice.Name = "Vice"
Vice.Parent = game.CoreGui
Vice.ZIndexBehavior = Enum.ZIndexBehavior.Global

local NotifsGui = Instance.new("ScreenGui")
NotifsGui.Name = "NotifsGui"
NotifsGui.Parent = game.CoreGui
NotifsGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local NotifsHolder = Instance.new("Frame")
NotifsHolder.Name = "NotifsHolder"
NotifsHolder.Parent = NotifsGui
NotifsHolder.AnchorPoint = Vector2.new(1, 0.5)
NotifsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotifsHolder.BackgroundTransparency = 1.000
NotifsHolder.Position = UDim2.new(1, -20, 0.5, 0)
NotifsHolder.Size = UDim2.new(0, 300, 1, -40)

local NotifsHolderListing = Instance.new("UIListLayout")
NotifsHolderListing.Name = "NotifsHolderListing"
NotifsHolderListing.Parent = NotifsHolder
NotifsHolderListing.SortOrder = Enum.SortOrder.LayoutOrder
NotifsHolderListing.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifsHolderListing.Padding = UDim.new(0, 5)

---HOLDERS END---

function lib:Create(ver, size)
	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Vice
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 900, 0, 825)
	if size == '' or nil then
		MainFrame.Size = UDim2.new(0, 700, 0, 625)
	else
		MainFrame.Size = size
	end
	
	local MainFrameShadow = Instance.new("ImageLabel")
	MainFrameShadow.Name = "MainFrameShadow"
	MainFrameShadow.Parent = MainFrame
	MainFrameShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameShadow.BackgroundTransparency = 1.000
	MainFrameShadow.Position = UDim2.new(0, -15, 0, -15)
	MainFrameShadow.Size = UDim2.new(1, 30, 1, 30)
	MainFrameShadow.Image = "rbxassetid://6521733637"
	MainFrameShadow.ImageColor3 = Color3.fromRGB(21, 19, 37)
	MainFrameShadow.ImageTransparency = 0.300
	MainFrameShadow.ScaleType = Enum.ScaleType.Slice
	MainFrameShadow.SliceCenter = Rect.new(19, 19, 281, 281)

	local MainFrameCorner = Instance.new("UICorner")
	MainFrameCorner.CornerRadius = UDim.new(0, 4)
	MainFrameCorner.Name = "MainFrameCorner"
	MainFrameCorner.Parent = MainFrame
	
	local LeftBarBack = Instance.new("Frame")
	LeftBarBack.Name = "LeftBarBack"
	LeftBarBack.Parent = MainFrame
	LeftBarBack.BackgroundColor3 = Color3.fromRGB(13, 10, 28)
	LeftBarBack.Size = UDim2.new(0, 80, 1, 0)
	
	local LeftBarBackCR = Instance.new("Frame")
	LeftBarBackCR.Name = "LeftBarBackCR"
	LeftBarBackCR.Parent = LeftBarBack
	LeftBarBackCR.BackgroundColor3 = Color3.fromRGB(12, 10, 26)
	LeftBarBackCR.BorderSizePixel = 0
	LeftBarBackCR.Position = UDim2.new(1, -5, 0, 0)
	LeftBarBackCR.Size = UDim2.new(0, 5, 1, 0)
	
	local LeftBarBackLine = Instance.new("Frame")
	LeftBarBackLine.Name = "LeftBarBackLine"
	LeftBarBackLine.Parent = LeftBarBack
	LeftBarBackLine.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	LeftBarBackLine.BorderSizePixel = 0
	LeftBarBackLine.Position = UDim2.new(1, -1, 0, 0)
	LeftBarBackLine.Size = UDim2.new(0, 1, 1, 0)
	
	local LeftBarBackCorner = Instance.new("UICorner")
	LeftBarBackCorner.CornerRadius = UDim.new(0, 4)
	LeftBarBackCorner.Name = "LeftBarBackCorner"
	LeftBarBackCorner.Parent = LeftBarBack
	
	local AllTabBtns = Instance.new("Frame")
	AllTabBtns.Name = "AllTabBtns"
	AllTabBtns.Parent = LeftBarBack
	AllTabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AllTabBtns.BackgroundTransparency = 1.000
	AllTabBtns.Position = UDim2.new(0, 0, 0, 80)
	AllTabBtns.Size = UDim2.new(1, 0, 1, -80)
	
	local AllTabBtnsListing = Instance.new("UIListLayout")
	AllTabBtnsListing.Name = "AllTabBtnsListing"
	AllTabBtnsListing.Parent = AllTabBtns
	AllTabBtnsListing.SortOrder = Enum.SortOrder.LayoutOrder
	AllTabBtnsListing.Padding = UDim.new(0, 10)

    
local TabImage = Instance.new("ImageLabel")

TabImage.Name = "TabImage"
TabImage.Parent = LeftBarBack
TabImage.AnchorPoint = Vector2.new(0.5, 0)
TabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabImage.BackgroundTransparency = 1.000
TabImage.Position = UDim2.new(0.497999996, 0, 0.0299999993, 3)
TabImage.Size = UDim2.new(0, 40, 0, 40)
TabImage.Image = "rbxassetid://10272150497"
	
	local LeftBarBackCorner = Instance.new("UICorner")
	LeftBarBackCorner.CornerRadius = UDim.new(0, 5)
	LeftBarBackCorner.Name = "LeftBarBackCorner"
	LeftBarBackCorner.Parent = LeftBarBack
	
	local MainFrameShadow = Instance.new("ImageLabel")
	MainFrameShadow.Name = "MainFrameShadow"
	MainFrameShadow.Parent = MainFrame
	MainFrameShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameShadow.BackgroundTransparency = 1.000
	MainFrameShadow.Position = UDim2.new(0, -15, 0, -15)
	MainFrameShadow.Size = UDim2.new(1, 30, 1, 30)
	MainFrameShadow.Image = "rbxassetid://6521733637"
	MainFrameShadow.ImageColor3 = Color3.fromRGB(21, 19, 37)
	MainFrameShadow.ImageTransparency = 0.300
	MainFrameShadow.ScaleType = Enum.ScaleType.Slice
	MainFrameShadow.SliceCenter = Rect.new(19, 19, 281, 281)
	
	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Parent = MainFrame
	TopBar.BackgroundColor3 = Color3.fromRGB(23, 20, 46)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0, 80, 0, 0)
	TopBar.Size = UDim2.new(1, -80, 0, 60)
	
	local TopBarCorner = Instance.new("UICorner")
	TopBarCorner.CornerRadius = UDim.new(0, 4)
	TopBarCorner.Name = "TopBarCorner"
	TopBarCorner.Parent = TopBar
	
	local TopBarLine = Instance.new("Frame")
	TopBarLine.Name = "TopBarLine"
	TopBarLine.Parent = TopBar
	TopBarLine.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	TopBarLine.BorderSizePixel = 0
	TopBarLine.Position = UDim2.new(0, 0, 1, 0)
	TopBarLine.Size = UDim2.new(1, 0, 0, 1)
	
	local ProfileStuff = Instance.new("Frame")
	ProfileStuff.Name = "ProfileStuff"
	ProfileStuff.Parent = TopBar
	ProfileStuff.AnchorPoint = Vector2.new(1, 0.5)
	ProfileStuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfileStuff.BackgroundTransparency = 1.000
	ProfileStuff.Position = UDim2.new(1, 0, 0.5, 0)
	ProfileStuff.Size = UDim2.new(0, 140, 1, 0)
	
	local ProfileInfo = Instance.new("Frame")
	ProfileInfo.Name = "ProfileInfo"
	ProfileInfo.Parent = ProfileStuff
	ProfileInfo.AnchorPoint = Vector2.new(1, 0.5)
	ProfileInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfileInfo.BackgroundTransparency = 1.000
	ProfileInfo.LayoutOrder = -1
	ProfileInfo.Position = UDim2.new(1, 0, 0.5, 0)
	ProfileInfo.Size = UDim2.new(1, -40, 0, 30)
	
	local Username = Instance.new("TextLabel")
	Username.Name = "Username"
	Username.Parent = ProfileInfo
	Username.AnchorPoint = Vector2.new(0, 1)
	Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Username.BackgroundTransparency = 1.000
	Username.Position = UDim2.new(0, 0, 0.5, 0)
	Username.Size = UDim2.new(1, 0, 0, 14)
	Username.Font = Enum.Font.GothamMedium
	Username.Text = LocalPlayer.Name
	Username.TextColor3 = Color3.fromRGB(255, 255, 255)
	Username.TextSize = 12.000
	Username.TextXAlignment = Enum.TextXAlignment.Left
	
	local Etc = Instance.new("TextLabel")
	Etc.Name = "Etc"
	Etc.Parent = ProfileInfo
	Etc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Etc.BackgroundTransparency = 1.000
	Etc.Position = UDim2.new(0, 0, 0.5, 0)
	Etc.Size = UDim2.new(1, -10, 0, 14)
	Etc.Font = Enum.Font.GothamMedium
	Etc.Text = ver
	Etc.TextColor3 = Color3.fromRGB(120, 124, 123)
	Etc.TextSize = 12.000
	Etc.TextXAlignment = Enum.TextXAlignment.Left
	
	local ProfilePictureOutline = Instance.new("Frame")
	ProfilePictureOutline.Name = "ProfilePictureOutline"
	ProfilePictureOutline.Parent = ProfileStuff
	ProfilePictureOutline.AnchorPoint = Vector2.new(0, 0.5)
	ProfilePictureOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfilePictureOutline.BackgroundTransparency = 1.000
	ProfilePictureOutline.Position = UDim2.new(0, 0, 0.5, 0)
	ProfilePictureOutline.Size = UDim2.new(0, 30, 0, 30)
	
	local ProfilePicture = Instance.new("Frame")
	ProfilePicture.Name = "ProfilePicture"
	ProfilePicture.Parent = ProfilePictureOutline
	ProfilePicture.AnchorPoint = Vector2.new(0.5, 0.5)
	ProfilePicture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfilePicture.BackgroundTransparency = 1.000
	ProfilePicture.Position = UDim2.new(0.5, 0, 0.5, 0)
	ProfilePicture.Size = UDim2.new(1, 0, 1, 0)
	
	local ProfilePictureCorner = Instance.new("UICorner")
	ProfilePictureCorner.CornerRadius = UDim.new(1, 0)
	ProfilePictureCorner.Name = "ProfilePictureCorner"
	ProfilePictureCorner.Parent = ProfilePicture
	
	local ProfileImage = Instance.new("ImageLabel")
	ProfileImage.Name = "ProfileImage"
	ProfileImage.Parent = ProfilePicture
	ProfileImage.BackgroundColor3 = Color3.fromRGB(143, 131, 255)
	ProfileImage.BackgroundTransparency = 0.800
	ProfileImage.Size = UDim2.new(1, 0, 1, 0)
	ProfileImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. PID .. "&w=48&h=48"
	
	local ProfileImageCorner = Instance.new("UICorner")
	ProfileImageCorner.CornerRadius = UDim.new(1, 0)
	ProfileImageCorner.Name = "ProfileImageCorner"
	ProfileImageCorner.Parent = ProfileImage
	
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = ProfilePictureOutline
	
	local SearchBack = Instance.new("Frame")
	SearchBack.Name = "SearchBack"
	SearchBack.Parent = TopBar
	SearchBack.BackgroundColor3 = Color3.fromRGB(143, 131, 255)
	SearchBack.BackgroundTransparency = 0.900
	SearchBack.Position = UDim2.new(0, 15, 0.5, -15)
	SearchBack.Size = UDim2.new(1, -180, 0, 30)
	
	local SearchBackCorner = Instance.new("UICorner")
	SearchBackCorner.CornerRadius = UDim.new(0, 5)
	SearchBackCorner.Name = "SearchBackCorner"
	SearchBackCorner.Parent = SearchBack
	
	local SearchBox = Instance.new("TextBox")
	SearchBox.Name = "SearchBox"
	SearchBox.Parent = SearchBack
	SearchBox.AnchorPoint = Vector2.new(1, 0.5)
	SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.BackgroundTransparency = 1.000
	SearchBox.ClipsDescendants = true
	SearchBox.Position = UDim2.new(1, -6, 0.5, 0)
	SearchBox.Size = UDim2.new(1, -58, 1, 0)
	SearchBox.Font = Enum.Font.Gotham
	SearchBox.PlaceholderColor3 = Color3.fromRGB(143, 131, 255)
	SearchBox.PlaceholderText = "Search..."
	SearchBox.Text = ""
	SearchBox.TextColor3 = Color3.fromRGB(143, 131, 255)
	SearchBox.TextSize = 12.000
	SearchBox.TextXAlignment = Enum.TextXAlignment.Left
	
	local SearchIcon = Instance.new("ImageLabel")
	SearchIcon.Name = "SearchIcon"
	SearchIcon.Parent = SearchBack
	SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
	SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIcon.BackgroundTransparency = 1.000
	SearchIcon.Position = UDim2.new(0, 10, 0.5, 0)
	SearchIcon.Size = UDim2.new(0, 18, 0, 18)
	SearchIcon.Image = "rbxassetid://9992305542"
	SearchIcon.ImageColor3 = Color3.fromRGB(143, 131, 255)
	
	local SearchBackLine = Instance.new("Frame")
	SearchBackLine.Name = "SearchBackLine"
	SearchBackLine.Parent = SearchBack
	SearchBackLine.AnchorPoint = Vector2.new(0, 0.5)
	SearchBackLine.BackgroundColor3 = Color3.fromRGB(143, 131, 255)
	SearchBackLine.Position = UDim2.new(0, 38, 0.5, 0)
	SearchBackLine.Size = UDim2.new(0, 1, 1, -20)
	
	local AllPages = Instance.new("Frame")
	AllPages.Name = "AllPages"
	AllPages.Parent = MainFrame
	AllPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AllPages.BackgroundTransparency = 1.000
	AllPages.Position = UDim2.new(0, 80, 0, 60)
	AllPages.Size = UDim2.new(1, -80, 1, -60)
	AllPages.ZIndex = 2
	
	local AllPagesFolder = Instance.new("Folder")
	AllPagesFolder.Name = "AllPagesFolder"
	AllPagesFolder.Parent = AllPages
	
	Drag(TopBar, MainFrame)
	
	local tabs = {}
	
	function tabs:Tab(title, AssID, desc1, desc2)
		local Tab = Instance.new("Frame")
		Tab.Name = "Tab"
		Tab.Parent = AllTabBtns
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.Size = UDim2.new(1, 0, 0, 42)
		
		local TabTitle = Instance.new("TextLabel")
		TabTitle.Name = "TabTitle"
		TabTitle.Parent = Tab
		TabTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.BorderSizePixel = 0
		TabTitle.Position = UDim2.new(0, 0, 1, -14)
		TabTitle.Size = UDim2.new(1, 0, 0, 14)
		TabTitle.Font = Enum.Font.GothamMedium
		TabTitle.Text = title
		TabTitle.TextColor3 = Color3.fromRGB(122, 122, 122)
		TabTitle.TextSize = 12
		TabTitle.TextTransparency = 0
		
		local TabImage = Instance.new("ImageLabel")
		TabImage.Name = "TabImage"
		TabImage.Parent = Tab
		TabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabImage.BackgroundTransparency = 1.000
		TabImage.AnchorPoint = Vector2.new(0.5, 0)
		TabImage.Position = UDim2.new(0.5, 0, 0, 3)
		TabImage.Size = UDim2.new(0, 18, 0, 18)
		TabImage.Image = "http://www.roblox.com/asset/?id=" .. AssID
		TabImage.ImageColor3 = Color3.fromRGB(122, 122, 122)
		TabImage.ImageTransparency = 0
		
		local TabHighlight = Instance.new("Frame")
		TabHighlight.Name = "TabHighlight"
		TabHighlight.Parent = Tab
		TabHighlight.BackgroundColor3 = Color3.fromRGB(102, 88, 218)
		TabHighlight.BackgroundTransparency = 0
		TabHighlight.BorderSizePixel = 0
		TabHighlight.AnchorPoint = Vector2.new(0, 0.5)
		TabHighlight.Position = UDim2.new(0, 0, 0.5, 0)
		TabHighlight.Size = UDim2.new(0, 4, 0, 0)
		
		local TabInteract = Instance.new("TextButton")
		TabInteract.Name = "TabInteract"
		TabInteract.Parent = Tab
		TabInteract.AnchorPoint = Vector2.new(0.5, 0.5)
		TabInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabInteract.BackgroundTransparency = 1.000
		TabInteract.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabInteract.Size = UDim2.new(1, 0, 1, 0)
		TabInteract.Font = Enum.Font.SourceSans
		TabInteract.Text = ""
		TabInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
		TabInteract.TextSize = 14.000
		
		local Page = Instance.new("Frame")
		Page.Name = "Page"
		Page.Parent = AllPagesFolder
		Page.AnchorPoint = Vector2.new(0.5, 0)
		Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page.BackgroundTransparency = 1.000
		Page.Position = UDim2.new(0.5, 0, 0, 20)
		Page.Size = UDim2.new(1, 0, 1, -20)
		Page.ZIndex = 2
		Page.Visible = false
		
		local PageFade = Instance.new("Frame")
		PageFade.Name = "PageFade"
		PageFade.Parent = MainFrame
		PageFade.AnchorPoint = Vector2.new(1, 1)
		PageFade.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
		PageFade.BackgroundTransparency = 1
		PageFade.BorderSizePixel = 0
		PageFade.Position = UDim2.new(1, 0, 1, 0)
		PageFade.Size = UDim2.new(1, -80, 1, -60)
		PageFade.ZIndex = 99
		PageFade.Visible = true
		
		local TabInnerTitle = Instance.new("TextLabel")
		TabInnerTitle.Name = "TabInnerTitle"
		TabInnerTitle.Parent = Page
		TabInnerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabInnerTitle.BackgroundTransparency = 1.000
		TabInnerTitle.Position = UDim2.new(0, 20, 0, 0)
		TabInnerTitle.Size = UDim2.new(0, 196, 0, 20)
		TabInnerTitle.Font = Enum.Font.GothamMedium
		TabInnerTitle.Text = desc1
		TabInnerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabInnerTitle.TextSize = 20.000
		TabInnerTitle.TextXAlignment = Enum.TextXAlignment.Left
		
		local TabDescription = Instance.new("TextLabel")
		TabDescription.Name = "TabDescription"
		TabDescription.Parent = Page
		TabDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabDescription.BackgroundTransparency = 1.000
		TabDescription.Position = UDim2.new(0, 22, 0, 24)
		TabDescription.Size = UDim2.new(0, 235, 0, 13)
		TabDescription.Font = Enum.Font.Gotham
		TabDescription.Text = desc2
		TabDescription.TextColor3 = Color3.fromRGB(254, 253, 255)
		TabDescription.TextSize = 13.000
		TabDescription.TextXAlignment = Enum.TextXAlignment.Left
		
		local PageCont = Instance.new("Frame")
		PageCont.Name = "PageCont"
		PageCont.Parent = Page
		PageCont.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageCont.BackgroundTransparency = 1.000
		PageCont.Position = UDim2.new(0, 0, 0, 70)
		PageCont.Size = UDim2.new(1, 0, 1, -70)
		
		local AllSubTabBtns = Instance.new("Frame")
		AllSubTabBtns.Name = "AllSubTabBtns"
		AllSubTabBtns.Parent = PageCont
		AllSubTabBtns.AnchorPoint = Vector2.new(0.5, 0)
		AllSubTabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		AllSubTabBtns.BackgroundTransparency = 1.000
		AllSubTabBtns.Position = UDim2.new(0.5, 0, 0, 0)
		AllSubTabBtns.Size = UDim2.new(1, -40, 0, 30)
		
		local AllSubTabBtnsListing = Instance.new("UIListLayout")
		AllSubTabBtnsListing.Name = "AllSubTabBtnsListing"
		AllSubTabBtnsListing.Parent = AllSubTabBtns
		AllSubTabBtnsListing.FillDirection = Enum.FillDirection.Horizontal
		AllSubTabBtnsListing.SortOrder = Enum.SortOrder.LayoutOrder
		AllSubTabBtnsListing.VerticalAlignment = Enum.VerticalAlignment.Center
		AllSubTabBtnsListing.Padding = UDim.new(0, 5)
		
		TabInteract.MouseButton1Click:Connect(function()
			for i, v in next, AllPagesFolder:GetChildren() do
				coroutine.wrap(function()
					wait(lib.Animations.AnimSpeed)
					v.Visible = false
				end)()
			end
			coroutine.wrap(function()
				wait(lib.Animations.AnimSpeed)
				Page.Visible = true
			end)()
			
			coroutine.wrap(function()
				game.TweenService:Create(PageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 0
				}):Play()
				wait(lib.Animations.AnimSpeed)
				game.TweenService:Create(PageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 1
				}):Play()
			end)()

			for i, v in next, AllTabBtns:GetDescendants() do
				if v:IsA("TextLabel") then
					game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						TextColor3 = Color3.fromRGB(122, 122, 122)
					}):Play()
				end
				if v:IsA("ImageLabel") then
					game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						ImageColor3 = Color3.fromRGB(122, 122, 122)
					}):Play()
				end
				if v.Name == 'TabHighlight' then
					game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						Size = UDim2.new(0, 4, 0, 0)
					}):Play()
				end
			end
			game.TweenService:Create(TabTitle, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(TabImage, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				ImageColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(TabHighlight, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 4, 1, 0)
			}):Play()
		end)
		
		local subtabs = {}
		
		local PageItems = Instance.new("Frame")
		PageItems.Name = "PageItems"
		PageItems.Parent = PageCont
		PageItems.AnchorPoint = Vector2.new(0.5, 1)
		PageItems.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageItems.BackgroundTransparency = 1.000
		PageItems.Position = UDim2.new(0.5, 0, 1, 0)
		PageItems.Size = UDim2.new(1, 0, 1, -44)
		PageItems.Visible = true
		
		local AllSubPagesFolder = Instance.new("Folder")
		AllSubPagesFolder.Name = "AllSubPagesFolder"
		AllSubPagesFolder.Parent = PageItems
		
		function subtabs:SubTab(title, AssID)
			local SubTabBtnOutline = Instance.new("Frame")
			SubTabBtnOutline.Name = "SubTabBtnOutline"
			SubTabBtnOutline.Parent = AllSubTabBtns
			SubTabBtnOutline.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
			SubTabBtnOutline.Size = UDim2.new(0, 110, 1, -4)

			local SubTabBtnOutlineCorner = Instance.new("UICorner")
			SubTabBtnOutlineCorner.CornerRadius = UDim.new(0, 4)
			SubTabBtnOutlineCorner.Name = "SubTabBtnOutlineCorner"
			SubTabBtnOutlineCorner.Parent = SubTabBtnOutline

			local SubTabBtnInline = Instance.new("Frame")
			SubTabBtnInline.Name = "SubTabBtnInline"
			SubTabBtnInline.Parent = SubTabBtnOutline
			SubTabBtnInline.AnchorPoint = Vector2.new(0.5, 0.5)
			SubTabBtnInline.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
			SubTabBtnInline.Position = UDim2.new(0.5, 0, 0.5, 0)
			SubTabBtnInline.Size = UDim2.new(1, -2, 1, -2)

			local SubTabBtnInteract = Instance.new("TextButton")
			SubTabBtnInteract.Name = "SubTabBtnInteract"
			SubTabBtnInteract.Parent = SubTabBtnInline
			SubTabBtnInteract.AnchorPoint = Vector2.new(0.5, 0.5)
			SubTabBtnInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnInteract.BackgroundTransparency = 1.000
			SubTabBtnInteract.Position = UDim2.new(0.5, 0, 0.5, 0)
			SubTabBtnInteract.Size = UDim2.new(1, 0, 1, 0)
			SubTabBtnInteract.Font = Enum.Font.Gotham
			SubTabBtnInteract.Text = ""
			SubTabBtnInteract.TextColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnInteract.TextSize = 12.000
			SubTabBtnInteract.TextXAlignment = Enum.TextXAlignment.Right

			local SubTabBtnIcon = Instance.new("ImageLabel")
			SubTabBtnIcon.Name = "SubTabBtnIcon"
			SubTabBtnIcon.Parent = SubTabBtnInline
			SubTabBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnIcon.BackgroundTransparency = 1.000
			SubTabBtnIcon.BorderSizePixel = 0
			SubTabBtnIcon.Position = UDim2.new(0, 3, 0.5, -9)
			SubTabBtnIcon.Size = UDim2.new(0, 18, 0, 18)
			SubTabBtnIcon.Image = "http://www.roblox.com/asset/?id=" .. AssID

			local SubTabBtnInlineCorner = Instance.new("UICorner")
			SubTabBtnInlineCorner.CornerRadius = UDim.new(0, 4)
			SubTabBtnInlineCorner.Name = "SubTabBtnInlineCorner"
			SubTabBtnInlineCorner.Parent = SubTabBtnInline

			local SubTabBtnTitle = Instance.new("TextLabel")
			SubTabBtnTitle.Name = "SubTabBtnTitle"
			SubTabBtnTitle.Parent = SubTabBtnInline
			SubTabBtnTitle.AnchorPoint = Vector2.new(1, 0.5)
			SubTabBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnTitle.BackgroundTransparency = 1.000
			SubTabBtnTitle.ClipsDescendants = true
			SubTabBtnTitle.Position = UDim2.new(1, -4, 0.5, 0)
			SubTabBtnTitle.Size = UDim2.new(1, -30, 1, 1)
			SubTabBtnTitle.Font = Enum.Font.Gotham
			SubTabBtnTitle.Text = title
			SubTabBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnTitle.TextSize = 12.000
			SubTabBtnTitle.TextXAlignment = Enum.TextXAlignment.Right
			
			local Left = Instance.new("Frame")
			Left.Name = "Left"
			Left.Parent = AllSubPagesFolder
			Left.AnchorPoint = Vector2.new(0, 0.5)
			Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Left.BackgroundTransparency = 1.000
			Left.Position = UDim2.new(0, 0, 0.5, 0)
			Left.Size = UDim2.new(0.5, 0, 1, 0)
			Left.Visible = false
			
			local LeftListing = Instance.new("UIListLayout")
			LeftListing.Name = "LeftListing"
			LeftListing.Parent = Left
			LeftListing.HorizontalAlignment = Enum.HorizontalAlignment.Left
			LeftListing.SortOrder = Enum.SortOrder.LayoutOrder
			LeftListing.Padding = UDim.new(0, 1)
			
			local Right = Instance.new("Frame")
			Right.Name = "Right"
			Right.Parent = AllSubPagesFolder
			Right.AnchorPoint = Vector2.new(1, 0.5)
			Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Right.BackgroundTransparency = 1.000
			Right.Position = UDim2.new(1, -1, 0.5, 0)
			Right.Size = UDim2.new(0.5, -2, 1, 0)
			Right.Visible = false

			local RightListing = Instance.new("UIListLayout")
			RightListing.Name = "RightListing"
			RightListing.Parent = Right
			RightListing.HorizontalAlignment = Enum.HorizontalAlignment.Left
			RightListing.SortOrder = Enum.SortOrder.LayoutOrder
			
			local SubPageFade = Instance.new("Frame")
			SubPageFade.Name = "SubPageFade"
			SubPageFade.Parent = MainFrame
			SubPageFade.AnchorPoint = Vector2.new(1, 1)
			SubPageFade.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
			SubPageFade.BackgroundTransparency = 1
			SubPageFade.BorderSizePixel = 0
			SubPageFade.Position = UDim2.new(1, 0, 1, 0)
			SubPageFade.Size = UDim2.new(1, -80, 1, -190)
			SubPageFade.ZIndex = 99
			SubPageFade.Visible = true
			
			SubTabBtnInteract.MouseButton1Click:Connect(function()
				for i, v in next, AllSubPagesFolder:GetChildren() do
					coroutine.wrap(function()
						wait(lib.Animations.AnimSpeed)
						v.Visible = false
					end)()
				end
				coroutine.wrap(function()
					wait(lib.Animations.AnimSpeed)
					Left.Visible = true
					Right.Visible = true
				end)()

				coroutine.wrap(function()
					game.TweenService:Create(SubPageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()
					wait(lib.Animations.AnimSpeed)
					game.TweenService:Create(SubPageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()
				end)()

				for i, v in next, AllSubTabBtns:GetDescendants() do
					if v.Name == 'SubTabBtnInline' then
						game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(23, 20, 41)
						}):Play()
					end
				end
				game.TweenService:Create(SubTabBtnInline, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundColor3 = Color3.fromRGB(107, 89, 222)
				}):Play()
			end)
			
			local items = {}
			
			function items:Label(side, text, image)
				local Label = Instance.new("Frame")
				Label.Name = tostring(text)
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BorderSizePixel = 0
				Label.Size = UDim2.new(1, 0, 0, 36)
				
				local LabelOutline = Instance.new("UIStroke")
				LabelOutline.Enabled = true
				LabelOutline.Parent = Label
				LabelOutline.Color = Color3.fromRGB(31, 26, 61)
				LabelOutline.LineJoinMode = Enum.LineJoinMode.Miter
				LabelOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				LabelOutline.Thickness = 1
				LabelOutline.Transparency = 0
				
				local LabelTitle = Instance.new("TextLabel")
				LabelTitle.Name = "LabelTitle"
				LabelTitle.Parent = Label
				LabelTitle.AnchorPoint = Vector2.new(1, 0.5)
				LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.BackgroundTransparency = 1.000
				LabelTitle.Position = UDim2.new(1, 0, 0.5, 0)
				LabelTitle.Size = UDim2.new(1, -40, 1, 0)
				LabelTitle.Font = Enum.Font.GothamMedium
				LabelTitle.Text = text
				LabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.TextSize = 12.000
				LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local LabelArrows = Instance.new("TextLabel")
				LabelArrows.Name = "LabelArrows"
				LabelArrows.Parent = Label
				LabelArrows.AnchorPoint = Vector2.new(0, 0.5)
				LabelArrows.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelArrows.BackgroundTransparency = 1.000
				LabelArrows.Position = UDim2.new(0, 21, 0.5, -1)
				LabelArrows.Size = UDim2.new(0, 10, 0, 20)
				LabelArrows.Font = Enum.Font.Ubuntu
				LabelArrows.Text = "Â»"
				LabelArrows.TextColor3 = Color3.fromRGB(107, 89, 222)
				LabelArrows.TextSize = 20
				LabelArrows.TextXAlignment = Enum.TextXAlignment.Left
				
				local LabelGradient = Instance.new("UIGradient")
				LabelGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(23, 20, 46)), ColorSequenceKeypoint.new(0.08, Color3.fromRGB(26, 23, 56)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 23, 56))}
				LabelGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.25)}
				LabelGradient.Name = "LabelGradient"
				LabelGradient.Parent = Label
				
				if side == 'Left' then
					Label.Parent = Left
				elseif side == 'Right' then
					Label.Parent = Right
				else
					Label:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
			end
			function items:Toggle(side, text, callback)
				local Toggle = Instance.new("Frame")
				Toggle.Name = tostring(text)
				Toggle.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
				Toggle.BackgroundTransparency = 0
				Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(1, 0, 0, 36)
				
				local ToggleOutline = Instance.new("UIStroke")
				ToggleOutline.Enabled = true
				ToggleOutline.Parent = Toggle
				ToggleOutline.Color = Color3.fromRGB(31, 26, 61)
				ToggleOutline.LineJoinMode = Enum.LineJoinMode.Miter
				ToggleOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				ToggleOutline.Thickness = 1
				ToggleOutline.Transparency = 0
				
				local ToggleTitle = Instance.new("TextLabel")
				ToggleTitle.Name = "ToggleTitle"
				ToggleTitle.Parent = Toggle
				ToggleTitle.AnchorPoint = Vector2.new(1, 0.5)
				ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.BackgroundTransparency = 1.000
				ToggleTitle.Position = UDim2.new(1, 0, 0.5, 0)
				ToggleTitle.Size = UDim2.new(1, -21, 1, 0)
				ToggleTitle.Font = Enum.Font.GothamMedium
				ToggleTitle.Text = text
				ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.TextSize = 12.000
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local ToggleFrameBack = Instance.new("Frame")
				ToggleFrameBack.Name = "ToggleFrameBack"
				ToggleFrameBack.Parent = Toggle
				ToggleFrameBack.AnchorPoint = Vector2.new(1, 0.5)
				ToggleFrameBack.BackgroundColor3 = Color3.fromRGB(33, 28, 64)
				ToggleFrameBack.Position = UDim2.new(1, -12, 0.5, 0)
				ToggleFrameBack.Size = UDim2.new(0, 36, 0, 18)
				
				local ToggleFrameBackCorner = Instance.new("UICorner")
				ToggleFrameBackCorner.CornerRadius = UDim.new(1, 0)
				ToggleFrameBackCorner.Name = "ToggleFrameBackCorner"
				ToggleFrameBackCorner.Parent = ToggleFrameBack
				
				local ToggleFrameCircle = Instance.new("Frame")
				ToggleFrameCircle.Name = "ToggleFrameCircle"
				ToggleFrameCircle.Parent = ToggleFrameBack
				ToggleFrameCircle.AnchorPoint = Vector2.new(0, 0.5)
				ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleFrameCircle.Position = UDim2.new(0, 3, 0.5, 0)
				ToggleFrameCircle.Size = UDim2.new(0, 14, 0, 14)
				
				local ToggleFrameCircleCorner = Instance.new("UICorner")
				ToggleFrameCircleCorner.CornerRadius = UDim.new(1, 0)
				ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
				ToggleFrameCircleCorner.Parent = ToggleFrameCircle
				
				local ToggleInteract = Instance.new("TextButton")
				ToggleInteract.Name = "ToggleInteract"
				ToggleInteract.Parent = Toggle
				ToggleInteract.AnchorPoint = Vector2.new(0.5, 0.5)
				ToggleInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleInteract.BackgroundTransparency = 1.000
				ToggleInteract.Position = UDim2.new(0.5, 0, 0.5, 0)
				ToggleInteract.Size = UDim2.new(1, 0, 1, 0)
				ToggleInteract.Font = Enum.Font.SourceSans
				ToggleInteract.Text = ""
				ToggleInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
				ToggleInteract.TextSize = 14.000

			
				Toggle.MouseEnter:Connect(function()
					game.TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(107, 89, 222)
					}):Play()
				end)
				Toggle.MouseLeave:Connect(function()
					game.TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(22, 20, 45)
					}):Play()
				end)



				local toggled = false
				ToggleInteract.MouseButton1Click:Connect(function()
					toggled = not toggled
					if toggled then
						game.TweenService:Create(ToggleFrameCircle, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Position = UDim2.new(0, 20, 0.5, 0)
						}):Play()
						game.TweenService:Create(ToggleFrameBack, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							BackgroundColor3 = Color3.fromRGB(107, 89, 222)
						}):Play()
					else
						game.TweenService:Create(ToggleFrameCircle, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Position = UDim2.new(0, 3, 0.5, 0)
						}):Play()
						game.TweenService:Create(ToggleFrameBack, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							BackgroundColor3 = Color3.fromRGB(33, 28, 64)
						}):Play()
					end
					pcall(callback, toggled)
				end)
				
				if side == 'Left' then
					Toggle.Parent = Left
				elseif side == 'Right' then
					Toggle.Parent = Right
				else
					Toggle:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
			end
			function items:Slider(side, text, min, max, inc, callback)
				local dragging = false
				local Slider = Instance.new("Frame")
				Slider.Name = tostring(text)
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Slider.BorderSizePixel = 0
				Slider.Size = UDim2.new(1, 0, 0, 36)
				
				local SliderOutline = Instance.new("UIStroke")
				SliderOutline.Enabled = true
				SliderOutline.Parent = Slider
				SliderOutline.Color = Color3.fromRGB(31, 26, 61)
				SliderOutline.LineJoinMode = Enum.LineJoinMode.Miter
				SliderOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				SliderOutline.Thickness = 1
				SliderOutline.Transparency = 0
				
				local SliderTitle = Instance.new("TextLabel")
				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = Slider
				SliderTitle.AnchorPoint = Vector2.new(0, 0.5)
				SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.ClipsDescendants = true
				SliderTitle.Position = UDim2.new(0, 21, 0.5, 0)
				SliderTitle.Size = UDim2.new(0, 180, 1, 0)
				SliderTitle.Font = Enum.Font.GothamMedium
				SliderTitle.Text = text
				SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.TextSize = 12.000
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local SlideBack = Instance.new("Frame")
				SlideBack.Name = "SlideBack"
				SlideBack.Parent = Slider
				SlideBack.AnchorPoint = Vector2.new(1, 0.5)
				SlideBack.BackgroundColor3 = Color3.fromRGB(33, 28, 64)
				SlideBack.BorderSizePixel = 0
				SlideBack.Position = UDim2.new(1, -62, 0.5, 0)
				SlideBack.Size = UDim2.new(0, 130, 0, 2)
				
				local SlideCircle = Instance.new("Frame")
				SlideCircle.Name = "SlideCircle"
				SlideCircle.Parent = SlideBack
				SlideCircle.AnchorPoint = Vector2.new(0.5, 0.5)
				SlideCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SlideCircle.Position = UDim2.new(0, 0, 0.5, 0)
				SlideCircle.Size = UDim2.new(0, 14, 0, 14)
				SlideCircle.ZIndex = 2
				
				local SlideCircleCorner = Instance.new("UICorner")
				SlideCircleCorner.CornerRadius = UDim.new(1, 0)
				SlideCircleCorner.Name = "SlideCircleCorner"
				SlideCircleCorner.Parent = SlideCircle
				
				local SlideBackLight = Instance.new("Frame")
				SlideBackLight.Name = "SlideBackLight"
				SlideBackLight.Parent = SlideBack
				SlideBackLight.AnchorPoint = Vector2.new(0, 0.5)
				SlideBackLight.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
				SlideBackLight.BorderSizePixel = 0
				SlideBackLight.Position = UDim2.new(0, 0, 0.5, 0)
				SlideBackLight.Size = UDim2.new(0, 0, 0, 2)
				
				local SlideBackLightCorner = Instance.new("UICorner")
				SlideBackLightCorner.CornerRadius = UDim.new(1, 0)
				SlideBackLightCorner.Name = "SlideBackLightCorner"
				SlideBackLightCorner.Parent = SlideBackLight
				
				local SliderValue = Instance.new("TextLabel")
				SliderValue.Name = "SliderValue"
				SliderValue.Parent = Slider
				SliderValue.AnchorPoint = Vector2.new(0, 0.5)
				SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.BackgroundTransparency = 1.000
				SliderValue.ClipsDescendants = true
				SliderValue.Position = UDim2.new(1, -50, 0.5, 0)
				SliderValue.Size = UDim2.new(0, 30, 1, 0)
				SliderValue.Font = Enum.Font.GothamMedium
				SliderValue.Text = min
				SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.TextSize = 12.000
				SliderValue.TextXAlignment = Enum.TextXAlignment.Left
				
				if side == 'Left' then
					Slider.Parent = Left
				elseif side == 'Right' then
					Slider.Parent = Right
				else
					Slider:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
				
				local function move(Input)
					local XSize = math.clamp((Input.Position.X - SlideBack.AbsolutePosition.X) / SlideBack.AbsoluteSize.X, 0, 1)
					local Increment = inc and (max / ((max - min) / (inc * 4))) or 
						(max >= 50 and max / ((max - min) / 4)) or 
						(max >= 25 and max / ((max - min) / 2)) or 
						(max / (max - min))

					local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 0, 2)
					local PosRoundedCircle = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 0.5, 0)
					SlideBackLight:TweenSize(SizeRounded, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
					SlideCircle:TweenPosition(PosRoundedCircle, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)

					local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
					SliderValue.Text = tostring(Val)
					pcall(callback, tonumber(Val))
				end

				SlideCircle.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						move(input)
					end
				end)

				SlideCircle.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
						move(input)
					end
				end)
				
				SlideBack.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						move(input)
					end
				end)

				SlideBack.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
						move(input)
					end
				end)
				
				SlideBackLight.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						move(input)
					end
				end)

				SlideBackLight.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
						move(input)
					end
				end)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)
			end
			function items:Dropdown(side, text, default, options, cb)
				local opened = false
				assert(type(options) == "table", "options must be a table")
				assert(type(cb) == "function", "callback must be a function")
				
				local Dropdown = Instance.new("Frame")
				Dropdown.Name = "Dropdown"
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Dropdown.BorderSizePixel = 0
				Dropdown.Size = UDim2.new(1, 0, 0, 36)
				
				local DropdownOutline = Instance.new("UIStroke")
				DropdownOutline.Enabled = true
				DropdownOutline.Parent = Dropdown
				DropdownOutline.Color = Color3.fromRGB(31, 26, 61)
				DropdownOutline.LineJoinMode = Enum.LineJoinMode.Miter
				DropdownOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				DropdownOutline.Thickness = 1
				DropdownOutline.Transparency = 0
				
				local DropdownTitle = Instance.new("TextLabel")
				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.AnchorPoint = Vector2.new(0, 0.5)
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.BackgroundTransparency = 1.000
				DropdownTitle.ClipsDescendants = true
				DropdownTitle.Position = UDim2.new(0, 21, 0.5, 0)
				DropdownTitle.Size = UDim2.new(0, 180, 1, 0)
				DropdownTitle.Font = Enum.Font.GothamMedium
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.TextSize = 12.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local DropdownDropFrame = Instance.new("Frame")
				DropdownDropFrame.Name = "DropdownDropFrame"
				DropdownDropFrame.Parent = Dropdown
				DropdownDropFrame.AnchorPoint = Vector2.new(1, 0.5)
				DropdownDropFrame.BackgroundColor3 = Color3.fromRGB(34, 28, 64)
				DropdownDropFrame.Position = UDim2.new(1, -12, 0.5, 0)
				DropdownDropFrame.Size = UDim2.new(0, 173, 0, 22)
				
				local DropdownDropFrameCorner = Instance.new("UICorner")
				DropdownDropFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownDropFrameCorner.Name = "DropdownDropFrameCorner"
				DropdownDropFrameCorner.Parent = DropdownDropFrame
				
				local DropdownInteract = Instance.new("TextButton")
				DropdownInteract.Name = "DropdownInteract"
				DropdownInteract.Parent = DropdownDropFrame
				DropdownInteract.AnchorPoint = Vector2.new(0, 0.5)
				DropdownInteract.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				DropdownInteract.BorderColor3 = Color3.fromRGB(27, 42, 53)
				DropdownInteract.Position = UDim2.new(0, 0, 0.5, 0)
				DropdownInteract.Size = UDim2.new(1, 0, 1, 0)
				DropdownInteract.AutoButtonColor = false
				DropdownInteract.Font = Enum.Font.SourceSans
				DropdownInteract.Text = ""
				DropdownInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownInteract.TextSize = 14.000
				DropdownInteract.BackgroundTransparency = 1
				
				local DropdownDropFrameArrowHolder = Instance.new("Frame")
				DropdownDropFrameArrowHolder.Name = "DropdownDropFrameArrowHolder"
				DropdownDropFrameArrowHolder.Parent = DropdownDropFrame
				DropdownDropFrameArrowHolder.AnchorPoint = Vector2.new(1, 0.5)
				DropdownDropFrameArrowHolder.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
				DropdownDropFrameArrowHolder.Position = UDim2.new(1, -2, 0.5, 0)
				DropdownDropFrameArrowHolder.Size = UDim2.new(0, 14, 0, 16)
				
				local DropdownDropFrameArrowHolderCorner = Instance.new("UICorner")
				DropdownDropFrameArrowHolderCorner.CornerRadius = UDim.new(0, 4)
				DropdownDropFrameArrowHolderCorner.Name = "DropdownDropFrameArrowHolderCorner"
				DropdownDropFrameArrowHolderCorner.Parent = DropdownDropFrameArrowHolder
				
				local DropdownArrow = Instance.new("ImageLabel")
				DropdownArrow.Name = "DropdownArrow"
				DropdownArrow.Parent = DropdownDropFrameArrowHolder
				DropdownArrow.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownArrow.BackgroundTransparency = 1.000
				DropdownArrow.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropdownArrow.Size = UDim2.new(1, 0, 1, 0)
				DropdownArrow.Image = "rbxassetid://10125383411"
				
				local DropdownSelected = Instance.new("TextLabel")
				DropdownSelected.Name = "DropdownSelected"
				DropdownSelected.Parent = DropdownDropFrame
				DropdownSelected.AnchorPoint = Vector2.new(0, 0.5)
				DropdownSelected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownSelected.BackgroundTransparency = 1.000
				DropdownSelected.ClipsDescendants = false
				DropdownSelected.Position = UDim2.new(0, 4, 0.5, 0)
				DropdownSelected.Size = UDim2.new(1, -24, 1, 0)
				DropdownSelected.Visible = true
				DropdownSelected.Font = Enum.Font.Gotham
				DropdownSelected.Text = string.format(default)
				DropdownSelected.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownSelected.TextSize = 12.000
				DropdownSelected.TextXAlignment = Enum.TextXAlignment.Left
				
				local DropdownChildFrameOutline = Instance.new("Frame")
				DropdownChildFrameOutline.Name = "DropdownChildFrame"
				DropdownChildFrameOutline.Parent = DropdownDropFrame
				DropdownChildFrameOutline.AnchorPoint = Vector2.new(0.5, 0)
				DropdownChildFrameOutline.BackgroundColor3 = Color3.fromRGB(34, 28, 64)
				DropdownChildFrameOutline.Position = UDim2.new(0.5, 0, 0, 0)
				DropdownChildFrameOutline.Size = UDim2.new(1, 0, 0, 100)
				DropdownChildFrameOutline.BackgroundTransparency = 1
				DropdownChildFrameOutline.Visible = false
				DropdownChildFrameOutline.ZIndex = 99
				
				local DropdownChildFrameOutlineCorner = Instance.new("UICorner")
				DropdownChildFrameOutlineCorner.CornerRadius = UDim.new(0, 4)
				DropdownChildFrameOutlineCorner.Name = "DropdownChildFrameOutlineCorner"
				DropdownChildFrameOutlineCorner.Parent = DropdownChildFrameOutline
				
				local DropdownChildFrame = Instance.new("Frame")
				DropdownChildFrame.Name = "DropdownChildFrame"
				DropdownChildFrame.Parent = DropdownChildFrameOutline
				DropdownChildFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownChildFrame.BackgroundColor3 = Color3.fromRGB(22, 20, 45)
				DropdownChildFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropdownChildFrame.Size = UDim2.new(1, -2, 1, -2)
				DropdownChildFrame.BackgroundTransparency = 1
				DropdownChildFrame.ZIndex = 99
				
				local DropdownChildFrameCorner = Instance.new("UICorner")
				DropdownChildFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownChildFrameCorner.Name = "DropdownChildFrameCorner"
				DropdownChildFrameCorner.Parent = DropdownChildFrame
				
				local DropdownChildFrameScroll = Instance.new("ScrollingFrame")
				DropdownChildFrameScroll.Name = "DropdownChildFrameScroll"
				DropdownChildFrameScroll.Parent = DropdownChildFrame
				DropdownChildFrameScroll.Active = true
				DropdownChildFrameScroll.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownChildFrameScroll.BackgroundColor3 = Color3.fromRGB(33, 28, 64)
				DropdownChildFrameScroll.BackgroundTransparency = 1.000
				DropdownChildFrameScroll.BorderSizePixel = 0
				DropdownChildFrameScroll.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropdownChildFrameScroll.Size = UDim2.new(1, 0, 1, -8)
				DropdownChildFrameScroll.ScrollBarThickness = 0
				DropdownChildFrameScroll.ZIndex = 99
				
				local DropdownChildFrameScrollListing = Instance.new("UIListLayout")
				DropdownChildFrameScrollListing.Name = "DropdownChildFrameScrollListing"
				DropdownChildFrameScrollListing.Parent = DropdownChildFrameScroll
				DropdownChildFrameScrollListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
				DropdownChildFrameScrollListing.SortOrder = Enum.SortOrder.LayoutOrder
				DropdownChildFrameScrollListing.Padding = UDim.new(0, 1)
				
				DropdownChildFrameScrollListing:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					DropdownChildFrameScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownChildFrameScrollListing.AbsoluteContentSize.Y) 
				end)
				
				DropdownInteract.MouseEnter:Connect(function()
					game.TweenService:Create(DropdownDropFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(42, 34, 80)
					}):Play()
				end)
				DropdownInteract.MouseLeave:Connect(function()
					game.TweenService:Create(DropdownDropFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(34, 28, 64)
					}):Play()
				end)
				
				local debounce = false

				local function toggle()
					DropdownChildFrameOutline.Visible = true
					if (debounce) then return end

					opened = not opened

					if (not opened) then
						debounce = true
					end

					local tween = TweenService:Create(
						DropdownChildFrame, TweenInfo.new(.2), {
							BackgroundTransparency = opened and 0 or 1
						}
					)
					TweenService:Create(
						DropdownChildFrameOutline, TweenInfo.new(.2), {
							BackgroundTransparency = opened and 0 or 1
						}
					):Play()
					
					for i,v in next, DropdownChildFrameScroll:GetDescendants() do
						if v:IsA('TextButton') then
							game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundTransparency = opened and 0 or 1
							}):Play()
						end
						if v:IsA('TextLabel') then
							game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextTransparency = opened and 0 or 1
							}):Play()
						end
						if v:IsA('ImageLabel') then
							game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								ImageTransparency = opened and 0 or 1
							}):Play()
						end
					end
					
					tween:Play()
					if (not opened) then
						wait(.2)
						debounce = false
					end

					DropdownChildFrame.Visible = opened
				end

				DropdownInteract.InputBegan:Connect(function(inp)
					if (inp.UserInputType == Enum.UserInputType.MouseButton1) then
						toggle()
					end
				end)
				
				local pressed = false
				for _, opt in next, options do
					local DropdownBtn = Instance.new("TextButton")
					DropdownBtn.Name = "DropdownBtn"
					DropdownBtn.Parent = DropdownChildFrameScroll
					DropdownBtn.BackgroundColor3 = Color3.fromRGB(22, 20, 45)
					DropdownBtn.Size = UDim2.new(1, -8, 0, 22)
					DropdownBtn.Font = Enum.Font.SourceSans
					DropdownBtn.Text = ""
					DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropdownBtn.TextSize = 14.000
					DropdownBtn.AutoButtonColor = false
					DropdownBtn.BackgroundTransparency = 1
					DropdownBtn.ZIndex = 99
					
					local DropdownBtnTitle = Instance.new("TextLabel")
					DropdownBtnTitle.Name = "DropdownBtnTitle"
					DropdownBtnTitle.Parent = DropdownBtn
					DropdownBtnTitle.AnchorPoint = Vector2.new(1, 0.5)
					DropdownBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DropdownBtnTitle.BackgroundTransparency = 1.000
					DropdownBtnTitle.ClipsDescendants = true
					DropdownBtnTitle.Position = UDim2.new(1, 0, 0.5, 0)
					DropdownBtnTitle.Size = UDim2.new(1, -6, 1, 0)
					DropdownBtnTitle.Font = Enum.Font.Gotham
					DropdownBtnTitle.Text = tostring(opt)
					DropdownBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
					DropdownBtnTitle.TextSize = 12.000
					DropdownBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
					DropdownBtnTitle.TextTransparency = 1
					DropdownBtnTitle.ZIndex = 99

					local DropdownBtnCorner = Instance.new("UICorner")
					DropdownBtnCorner.CornerRadius = UDim.new(0, 4)
					DropdownBtnCorner.Name = "DropdownBtnCorner"
					DropdownBtnCorner.Parent = DropdownBtn
					
					DropdownBtn.MouseButton1Click:Connect(function()
						if (pressed) then return end
						pressed = true
						DropdownSelected.Text = string.format(opt)
						coroutine.wrap(cb)(opt)
						toggle()
						pressed = false
					end)
					DropdownBtn.MouseEnter:Connect(function()
						game.TweenService:Create(DropdownBtn, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(107, 89, 222)
						}):Play()
					end)
					DropdownBtn.MouseLeave:Connect(function()
						game.TweenService:Create(DropdownBtn, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(22, 20, 45)
						}):Play()
					end)
				end
				
				if side == 'Left' then
					Dropdown.Parent = Left
				elseif side == 'Right' then
					Dropdown.Parent = Right
				else
					Dropdown:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
			end
			
			local subitems = {}
			
			function subitems:AddColor(name, presetcolor, callback)
				local ColorPickerToggled = false
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil

				local ColorPickerHolder = Instance.new("Frame")
				ColorPickerHolder.Name = ("ColorPickerHolder")
				ColorPickerHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorPickerHolder.BackgroundTransparency = 1.000
				ColorPickerHolder.Position = UDim2.new(0, 0, 0, 0)
				ColorPickerHolder.Size = UDim2.new(1, 0, 0, 22)
				ColorPickerHolder.ClipsDescendants = false

				local NameColorPicker = Instance.new("Frame")
				NameColorPicker.Name = (name .. "ColorPicker")
				NameColorPicker.Parent = ColorPickerHolder
				NameColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NameColorPicker.BackgroundTransparency = 1.000
				NameColorPicker.AnchorPoint = Vector2.new(1, 0)
				NameColorPicker.Position = UDim2.new(1, -6, 1, 0)
				NameColorPicker.Size = UDim2.new(0, 170, 0, 0)
				NameColorPicker.ClipsDescendants = true

				local ColorPickerCover = Instance.new("TextButton")
				ColorPickerCover.Name = "ColorPickerCover"
				ColorPickerCover.Parent = NameColorPicker
				ColorPickerCover.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				ColorPickerCover.BackgroundTransparency = 1
				ColorPickerCover.BorderSizePixel = 0
				ColorPickerCover.Size = UDim2.new(1, 0, 1, 0)
				ColorPickerCover.AutoButtonColor = false
				ColorPickerCover.Font = Enum.Font.Gotham
				ColorPickerCover.Text = ""
				ColorPickerCover.TextColor3 = Color3.fromRGB(160, 160, 160)
				ColorPickerCover.TextSize = 12.000
				ColorPickerCover.ZIndex = 99

				local Title = Instance.new("TextLabel")
				Title.Name = "Title"
				Title.Parent = ColorPickerHolder
				Title.AnchorPoint = Vector2.new(0, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0, 6, 0.5, 0)
				Title.Size = UDim2.new(1, 0, 0, 14)
				Title.Font = Enum.Font.Gotham
				Title.Text = name
				Title.TextColor3 = Color3.fromRGB(160, 160, 160)
				Title.TextSize = 12.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				local ColorPickerToggleOutline = Instance.new("Frame")
				ColorPickerToggleOutline.Name = "ColorPickerToggle"
				ColorPickerToggleOutline.Parent = ColorPickerHolder
				ColorPickerToggleOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				ColorPickerToggleOutline.BackgroundTransparency = 0
				ColorPickerToggleOutline.AnchorPoint = Vector2.new(1, 0.5)
				ColorPickerToggleOutline.Position = UDim2.new(1, -6, 0.5, 0)
				ColorPickerToggleOutline.Size = UDim2.new(0, 24, 0, 12)

				local ColorPickerToggleOutlineCorner = Instance.new("UICorner")
				ColorPickerToggleOutlineCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerToggleOutlineCorner.Name = "ColorPickerToggleOutlineCorner"
				ColorPickerToggleOutlineCorner.Parent = ColorPickerToggleOutline

				local ColorPickerToggle = Instance.new("Frame")
				ColorPickerToggle.Name = "ColorPickerToggle"
				ColorPickerToggle.Parent = ColorPickerToggleOutline
				ColorPickerToggle.BackgroundColor3 = presetcolor
				ColorPickerToggle.BackgroundTransparency = 0
				ColorPickerToggle.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPickerToggle.Position = UDim2.new(0.5, 0, 0.5, 0)
				ColorPickerToggle.Size = UDim2.new(1, -2, 1, -2)

				local ColorPickerToggleCorner = Instance.new("UICorner")
				ColorPickerToggleCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerToggleCorner.Name = "ColorPickerToggleCorner"
				ColorPickerToggleCorner.Parent = ColorPickerToggle

				local ColorPickerOutline = Instance.new("Frame")
				ColorPickerOutline.Name = "ColorPickerOutline"
				ColorPickerOutline.Parent = NameColorPicker
				ColorPickerOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				ColorPickerOutline.BackgroundTransparency = 0
				ColorPickerOutline.ClipsDescendants = true
				ColorPickerOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPickerOutline.Position = UDim2.new(0.5, 0, 0.5, 0)
				ColorPickerOutline.Size = UDim2.new(1, 0, 1, 0)
				ColorPickerOutline.BorderSizePixel = 0
				ColorPickerOutline.ZIndex = 100

				local ColorPickerOutlineCorner = Instance.new("UICorner")
				ColorPickerOutlineCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerOutlineCorner.Name = "ColorPickerOutlineCorner"
				ColorPickerOutlineCorner.Parent = ColorPickerOutline

				local ColorPicker = Instance.new("Frame")
				ColorPicker.Name = "ColorPicker"
				ColorPicker.Parent = ColorPickerOutline
				ColorPicker.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				ColorPicker.BackgroundTransparency = 0
				ColorPicker.ClipsDescendants = false
				ColorPicker.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPicker.Position = UDim2.new(0.5, 0, 0.5, 0)
				ColorPicker.Size = UDim2.new(1, -2, 1, -2)
				ColorPicker.BorderSizePixel = 0
				ColorPicker.ZIndex = 100

				local ColorPickerCorner = Instance.new("UICorner")
				ColorPickerCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerCorner.Name = "ColorPickerCorner"
				ColorPickerCorner.Parent = ColorPicker

				local Color = Instance.new("ImageLabel")
				Color.Name = "Color"
				Color.Parent = ColorPicker
				Color.BackgroundColor3 = presetcolor
				Color.BorderSizePixel = 0
				Color.AnchorPoint = Vector2.new(0, 0)
				Color.Position = UDim2.new(0, 6, 0, 6)
				Color.Size = UDim2.new(0, 124, 0, 100)
				Color.ZIndex = 100
				Color.Image = "rbxassetid://4155801252"

				local ColorSelection = Instance.new("ImageLabel")
				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(presetcolor and select(3, Color3.toHSV(presetcolor)))
				ColorSelection.Size = UDim2.new(0, 12, 0, 12)
				ColorSelection.ZIndex = 101
				ColorSelection.Image = "rbxassetid://4953646208"
				ColorSelection.ScaleType = Enum.ScaleType.Fit

				local RValueOutline = Instance.new("Frame")
				RValueOutline.Name = "RValueOutline"
				RValueOutline.Parent = ColorPicker
				RValueOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				RValueOutline.BackgroundTransparency = 0
				RValueOutline.AnchorPoint = Vector2.new(0, 1)
				RValueOutline.Position = UDim2.new(0, 6, 0, 132)
				RValueOutline.Size = UDim2.new(0, 46, 0, 20)
				RValueOutline.ZIndex = 100

				local RValueOutlineCorner = Instance.new("UICorner")
				RValueOutlineCorner.CornerRadius = UDim.new(0, 2)
				RValueOutlineCorner.Name = "RValueOutlineCorner"
				RValueOutlineCorner.Parent = RValueOutline

				local RValue = Instance.new("Frame")
				RValue.Name = "RValue"
				RValue.Parent = RValueOutline
				RValue.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				RValue.BackgroundTransparency = 0
				RValue.AnchorPoint = Vector2.new(0.5, 0.5)
				RValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				RValue.Size = UDim2.new(1, -2, 1, -2)
				RValue.ZIndex = 100

				local RValueCorner = Instance.new("UICorner")
				RValueCorner.CornerRadius = UDim.new(0, 2)
				RValueCorner.Name = "RValueCorner"
				RValueCorner.Parent = RValue

				local ValueR = Instance.new("TextLabel")
				ValueR.Name = "ValueR"
				ValueR.Parent = RValue
				ValueR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueR.BackgroundTransparency = 1.000
				ValueR.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueR.Position = UDim2.new(0.5, 0, 0.5, 0)
				ValueR.Size = UDim2.new(1, -8, 1, 0)
				ValueR.ZIndex = 101
				ValueR.Font = Enum.Font.Gotham
				ValueR.Text = "255"
				ValueR.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueR.TextSize = 12.000

				local GValueOutline = Instance.new("Frame")
				GValueOutline.Name = "GValueOutline"
				GValueOutline.Parent = ColorPicker
				GValueOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				GValueOutline.BackgroundTransparency = 0
				GValueOutline.AnchorPoint = Vector2.new(0.5, 1)
				GValueOutline.Position = UDim2.new(0.5, 0, 0, 132)
				GValueOutline.Size = UDim2.new(0, 46, 0, 20)
				GValueOutline.ZIndex = 100

				local GValueOutlineCorner = Instance.new("UICorner")
				GValueOutlineCorner.CornerRadius = UDim.new(0, 2)
				GValueOutlineCorner.Name = "GValueOutlineCorner"
				GValueOutlineCorner.Parent = GValueOutline

				local GValue = Instance.new("Frame")
				GValue.Name = "GValue"
				GValue.Parent = GValueOutline
				GValue.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				GValue.BackgroundTransparency = 0
				GValue.AnchorPoint = Vector2.new(0.5, 0.5)
				GValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				GValue.Size = UDim2.new(1, -2, 1, -2)
				GValue.ZIndex = 100

				local GValueCorner = Instance.new("UICorner")
				GValueCorner.CornerRadius = UDim.new(0, 2)
				GValueCorner.Name = "GValueCorner"
				GValueCorner.Parent = GValue

				local ValueG = Instance.new("TextLabel")
				ValueG.Name = "ValueG"
				ValueG.Parent = GValue
				ValueG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueG.BackgroundTransparency = 1.000
				ValueG.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueG.Position = UDim2.new(0.5, 0, 0.5, 0)
				ValueG.Size = UDim2.new(1, -8, 1, 0)
				ValueG.ZIndex = 101
				ValueG.Font = Enum.Font.Gotham
				ValueG.Text = "255"
				ValueG.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueG.TextSize = 12.000

				local BValueOutline = Instance.new("Frame")
				BValueOutline.Name = "BValueOutline"
				BValueOutline.Parent = ColorPicker
				BValueOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				BValueOutline.BackgroundTransparency = 0
				BValueOutline.AnchorPoint = Vector2.new(1, 1)
				BValueOutline.Position = UDim2.new(1, -6, 0, 132)
				BValueOutline.Size = UDim2.new(0, 46, 0, 20)
				BValueOutline.ZIndex = 100

				local BValueOutlineCorner = Instance.new("UICorner")
				BValueOutlineCorner.CornerRadius = UDim.new(0, 2)
				BValueOutlineCorner.Name = "BValueOutlineCorner"
				BValueOutlineCorner.Parent = BValueOutline

				local BValue = Instance.new("Frame")
				BValue.Name = "BValue"
				BValue.Parent = BValueOutline
				BValue.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				BValue.BackgroundTransparency = 0
				BValue.AnchorPoint = Vector2.new(0.5, 0.5)
				BValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				BValue.Size = UDim2.new(1, -2, 1, -2)
				BValue.ZIndex = 100

				local BValueCorner = Instance.new("UICorner")
				BValueCorner.CornerRadius = UDim.new(0, 2)
				BValueCorner.Name = "BValueCorner"
				BValueCorner.Parent = BValue

				local ValueB = Instance.new("TextLabel")
				ValueB.Name = "ValueB"
				ValueB.Parent = BValue
				ValueB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueB.BackgroundTransparency = 1.000
				ValueB.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueB.Position = UDim2.new(0.5, 0, 0.5, 0)
				ValueB.Size = UDim2.new(1, -8, 1, 0)
				ValueB.ZIndex = 101
				ValueB.Font = Enum.Font.Gotham
				ValueB.Text = "255"
				ValueB.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueB.TextSize = 12.000

				local Hue = Instance.new("Frame")
				Hue.Name = "Hue"
				Hue.Parent = ColorPicker
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.BackgroundTransparency = 0
				Hue.AnchorPoint = Vector2.new(1, 0)
				Hue.Position = UDim2.new(1, -6, 0, 6)
				Hue.Size = UDim2.new(0, 25, 0, 100)
				Hue.ZIndex = 100

				local UIGradient = Instance.new("UIGradient")
				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
				UIGradient.Rotation = 270
				UIGradient.Parent = Hue

				local HueSelection = Instance.new("ImageLabel")
				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(presetcolor)))
				HueSelection.Size = UDim2.new(0, 12, 0, 12)
				HueSelection.ZIndex = 101
				HueSelection.Image = "rbxassetid://4953646208"
				HueSelection.ScaleType = Enum.ScaleType.Fit

				ColorPickerHolder.MouseEnter:Connect(function()
					game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextColor3 = Color3.fromRGB(200, 200, 200)
					}):Play()
				end)
				ColorPickerHolder.MouseLeave:Connect(function()
					game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextColor3 = Color3.fromRGB(160, 160, 160)
					}):Play()
				end)

				local function SetRGBValues()
					ValueR.Text = (math.floor(ColorPickerToggle.BackgroundColor3.r * 255))
					ValueG.Text = (math.floor(ColorPickerToggle.BackgroundColor3.g * 255))
					ValueB.Text = (math.floor(ColorPickerToggle.BackgroundColor3.b * 255))
				end

				local function UpdateColorPicker(nope)
					ColorPickerToggle.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					SetRGBValues()
					callback(ColorPickerToggle.BackgroundColor3)
				end

				ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

				ColorPickerToggle.BackgroundColor3 = presetcolor
				Color.BackgroundColor3 = presetcolor
				SetRGBValues()
				callback(Color.BackgroundColor3)

				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then return end

						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput = RunService.RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY

							UpdateColorPicker(true)
						end)
					end
				end)

				Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				Hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then return end

						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = RunService.RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)

							HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				Hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)

				ColorPickerToggle.InputBegan:Connect(function(inp)
					if (inp.UserInputType == Enum.UserInputType.MouseButton1) then
						ColorPickerToggled = not ColorPickerToggled

						coroutine.wrap(function()
							if ColorPickerToggled then
								while ColorPickerToggled do
									RunService.RenderStepped:Wait(Highlight(Title))
								end
							else
								game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(160, 160, 160)
								}):Play()
							end
						end)()

						if ColorPickerToggled then
							TweenService:Create(NameColorPicker, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 170, 0, 140)}):Play()
							game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							}):Play()
						elseif not ColorPickerToggled then
							TweenService:Create(NameColorPicker, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 170, 0, 0)}):Play()
							game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(160, 160, 160)
							}):Play()
						end
					end
				end)
				
				if side == 'Left' then
					ColorPicker.Parent = Left
				elseif side == 'Right' then
					ColorPicker.Parent = Right
				else
					ColorPicker:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
				
			end
			
			---SEARCH BAR FUNCTION---
			local function Refresh()
				local entry = string.lower(SearchBox.Text)
				for i,v in pairs(Left:GetChildren()) do
					if v:IsA("Frame") then
						if entry ~= "" then
							local Script = string.lower(v.Name)
							if string.find(Script, entry) then
								v.Visible = true
							else
								v.Visible = false
							end
						else
							v.Visible = true
						end
					end
				end
				for i,v in pairs(Right:GetChildren()) do
					if v:IsA("Frame") then
						if entry ~= "" then
							local Script = string.lower(v.Name)
							if string.find(Script, entry) then
								v.Visible = true
							else
								v.Visible = false
							end
						else
							v.Visible = true
						end
					end
				end
			end
			SearchBox.Changed:Connect(Refresh)
			---JUST STUFF---
			return items
		end
		return subtabs
	end
	return tabs
end
function lib:Notify(title, desc, dur)
	local Notification = Instance.new("Frame")
	Notification.Name = "Notification"
	Notification.Parent = NotifsHolder
	Notification.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
	Notification.Size = UDim2.new(1, 0, 0, 60)
	Notification.AnchorPoint = Vector2.new(0, 0.5)
	Notification.Position = UDim2.new(1, 20, 0.5, 0)
	Notification.BackgroundTransparency = 1
	
	local NotificationBack = Instance.new("Frame")
	NotificationBack.Name = "NotificationBack"
	NotificationBack.Parent = Notification
	NotificationBack.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
	NotificationBack.Size = UDim2.new(1, 0, 1, 0)
	NotificationBack.AnchorPoint = Vector2.new(0, 0.5)
	NotificationBack.Position = UDim2.new(1, 20, 0.5, 0)
	NotificationBack.BackgroundTransparency = 1
	
	local NotificationShadow = Instance.new("ImageLabel")
	NotificationShadow.Name = "NotificationShadow"
	NotificationShadow.Parent = NotificationBack
	NotificationShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationShadow.BackgroundTransparency = 1.000
	NotificationShadow.Position = UDim2.new(0, -15, 0, -15)
	NotificationShadow.Size = UDim2.new(1, 30, 1, 30)
	NotificationShadow.Image = "rbxassetid://6521733637"
	NotificationShadow.ImageColor3 = Color3.fromRGB(21, 19, 37)
	NotificationShadow.ImageTransparency = 0.300
	NotificationShadow.ScaleType = Enum.ScaleType.Slice
	NotificationShadow.SliceCenter = Rect.new(19, 19, 281, 281)

	local NotificationCorner = Instance.new("UICorner")
	NotificationCorner.CornerRadius = UDim.new(0, 4)
	NotificationCorner.Name = "NotificationCorner"
	NotificationCorner.Parent = NotificationBack

	local NotificationLine = Instance.new("Frame")
	NotificationLine.Name = "NotificationLine"
	NotificationLine.Parent = NotificationBack
	NotificationLine.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	NotificationLine.BorderSizePixel = 0
	NotificationLine.Position = UDim2.new(0, 0, 0, 20)
	NotificationLine.Size = UDim2.new(1, 0, 0, 1)
	NotificationLine.BackgroundTransparency = 1
	
	local NotificationDurationLine = Instance.new("Frame")
	NotificationDurationLine.Name = "NotificationDurationLine"
	NotificationDurationLine.Parent = NotificationBack
	NotificationDurationLine.BackgroundColor3 = Color3.fromRGB(89, 75, 176)
	NotificationDurationLine.BorderSizePixel = 0
	NotificationDurationLine.Position = UDim2.new(0, 0, 0, 20)
	NotificationDurationLine.Size = UDim2.new(1, 0, 0, 1)
	NotificationDurationLine.BackgroundTransparency = 1

	local NotificationTitle = Instance.new("TextLabel")
	NotificationTitle.Name = "NotificationTitle"
	NotificationTitle.Parent = NotificationBack
	NotificationTitle.AnchorPoint = Vector2.new(0, 0)
	NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationTitle.BackgroundTransparency = 1.000
	NotificationTitle.Position = UDim2.new(0, 10, 0, 0)
	NotificationTitle.Size = UDim2.new(1, -10, 0, 20)
	NotificationTitle.Font = Enum.Font.GothamMedium
	NotificationTitle.Text = title
	NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	NotificationTitle.TextSize = 12.000
	NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
	NotificationTitle.TextTransparency = 1

	local NotificationDesc = Instance.new("TextLabel")
	NotificationDesc.Name = "NotificationDesc"
	NotificationDesc.Parent = NotificationBack
	NotificationDesc.AnchorPoint = Vector2.new(1, 1)
	NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDesc.BackgroundTransparency = 1.000
	NotificationDesc.Position = UDim2.new(1, 0, 1, 8)
	NotificationDesc.Size = UDim2.new(1, -10, 1, -16)
	NotificationDesc.Font = Enum.Font.Gotham
	NotificationDesc.Text = desc
	NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDesc.TextSize = 12.000
	NotificationDesc.TextWrapped = true
	NotificationDesc.TextXAlignment = Enum.TextXAlignment.Left
	NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top
	NotificationDesc.TextTransparency = 1
	
	coroutine.wrap(function()
		for i,v in next, NotificationBack:GetChildren() do
			if v:IsA('Frame') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 0
				}):Play()
			elseif v:IsA('TextLabel') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					TextTransparency = 0
				}):Play()
			end
		end
		game.TweenService:Create(NotificationDurationLine, TweenInfo.new(dur, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 0, 0, 1)
		}):Play()
		game.TweenService:Create(NotificationBack, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0, 0, 0.5, 0)
		}):Play()
		game.TweenService:Create(NotificationBack, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0
		}):Play()
		
		wait(lib.Animations.AnimSpeed)
		wait(dur)
		
		game.TweenService:Create(NotificationBack, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Position = UDim2.new(1, 20, 0.5, 0)
		}):Play()
		for i,v in next, NotificationBack:GetChildren() do
			if v:IsA('Frame') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 1.000
				}):Play()
			elseif v:IsA('TextLabel') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					TextTransparency = 1.000
				}):Play()
			end
		end
		wait(lib.Animations.AnimSpeed)
		Notification:Destroy()
	end)()
end
return lib
