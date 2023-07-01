local NotificationSystem = Instance.new("ScreenGui")
local Notification = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local Content = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Image = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Title = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Text = Instance.new("TextLabel")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local UIGradient = Instance.new("UIGradient")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")

NotificationSystem.Name = "NotificationSystem"
NotificationSystem.Parent = game:GetService("CoreGui")
NotificationSystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Notification.Name = "Notification"
Notification.Parent = NotificationSystem
Notification.AnchorPoint = Vector2.new(0.5, 0.5)
Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Notification.BackgroundTransparency = 1.000
Notification.BorderSizePixel = 0
Notification.Position = UDim2.new(0.89690721, 0, 0.488294303, 0)
Notification.Size = UDim2.new(0.168630332, 0, 0.94193548, 0)

UIGridLayout.Parent = Notification
UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIGridLayout.CellSize = UDim2.new(0, 250, 0, 125)

return function CreateContent()
  Content.Name = "Content"
  Content.Parent = Notification
  Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Content.LayoutOrder = 1
  Content.Position = UDim2.new(-0.0218340605, 0, 0.0428082198, 0)
  Content.Size = UDim2.new(1.09170318, 0, 0.214041099, 0)
  
  UICorner.CornerRadius = UDim.new(0, 6)
  UICorner.Parent = Content
  
  Image.Name = "Image"
  Image.Parent = Content
  Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Image.BackgroundTransparency = 1.000
  Image.Position = UDim2.new(0.0399999991, 0, 0.0960000008, 0)
  Image.Size = UDim2.new(0.159999996, 0, 0.319999993, 0)
  
  UICorner_2.CornerRadius = UDim.new(0, 4)
  UICorner_2.Parent = Image
  
  UIAspectRatioConstraint.Parent = Image
  
  Title.Name = "Title"
  Title.Parent = Content
  Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Title.BackgroundTransparency = 1.000
  Title.BorderSizePixel = 0
  Title.Position = UDim2.new(0.231999993, 0, 0.0960000008, 0)
  Title.Size = UDim2.new(0.720000029, 0, 0.319999993, 0)
  Title.Font = Enum.Font.Ubuntu
  Title.Text = ""
  Title.TextColor3 = Color3.fromRGB(255, 255, 255)
  Title.TextScaled = true
  Title.TextSize = 14.000
  Title.TextWrapped = true
  Title.TextXAlignment = Enum.TextXAlignment.Left
  
  UIAspectRatioConstraint_2.Parent = Title
  UIAspectRatioConstraint_2.AspectRatio = 4.500
  
  Text.Name = "Text"
  Text.Parent = Content
  Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Text.BackgroundTransparency = 1.000
  Text.BorderSizePixel = 0
  Text.Position = UDim2.new(0.0399999991, 0, 0.495999992, 0)
  Text.Size = UDim2.new(0.924000025, 0, 0.439999998, 0)
  Text.Font = Enum.Font.Ubuntu
  Text.Text = ""
  Text.TextColor3 = Color3.fromRGB(255, 255, 255)
  Text.TextScaled = true
  Text.TextSize = 14.000
  Text.TextWrapped = true
  Text.TextXAlignment = Enum.TextXAlignment.Left
  Text.TextYAlignment = Enum.TextYAlignment.Top
  
  UIAspectRatioConstraint_3.Parent = Text
  UIAspectRatioConstraint_3.AspectRatio = 4.200
  
  UIAspectRatioConstraint_4.Parent = Content
  UIAspectRatioConstraint_4.AspectRatio = 2.000
  
  UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(44, 44, 44)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))}
  UIGradient.Rotation = 30
  UIGradient.Parent = Content
  
  UIAspectRatioConstraint_5.Parent = Notification
  UIAspectRatioConstraint_5.AspectRatio = 0.392
end
