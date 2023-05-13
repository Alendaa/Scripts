local GuiService = game:GetService("GuiService")
local NotificationSystem = {}

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
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")


Notification.Name = "Notification"
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

Content.Name = "Content"
Content.Parent = Notification
Content.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Content.LayoutOrder = 1
Content.NextSelectionLeft = Content
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

UIAspectRatioConstraint_5.Parent = Notification
UIAspectRatioConstraint_5.AspectRatio = 0.392


local LayourOrderCheck = function(f)
    local Order = f.LayoutOrder
    for i,v in pairs(f.Parent) do
        if v:IsA("Frame") and v ~= f then
            if v.LayoutOrder <= Order then
                Order = v.LayoutOrder - Order - 5
            end
        end
    end

    return Order
end

NotificationSystem.Notify = function(Table)
    if typeof(Table) == "table" then
        for i,v in pairs(Table) do
            print(i,v)
        end

        if typeof(Table[1]) == "string" or Table[1] == nil then
            if Table[1] == nil then Table[1] = "" end
            local GUI = Notification:Clone()
            GUI.Content.Title.Text = Table[1]
            if typeof(Table[2]) == "string" or Table[2] == nil then
                if Table[2] == nil then Table[2] = "" end
                GUI.Content.Text = Table[2]

                if typeof(Table[3]) == "number" or Table[3] == nil then
                    if Table[3] == nil then
                        GUI.Content.Image = ""
                    else
                        GUI.Content.Image = "rbxassetid://"..Table[3]
                    end

                    if typeof(Table[4]) == "number" then
                        if typeof(Table[5]) == "boolean" then
                            GUI.Parent = game:GetService("CoreGui")
                            if Table[5] then
                                GUI.Content.LayoutOrder = LayourOrderCheck(GUI.Content)
                            end
                        else
                            return warn(Table[2].." its a "..typeof(Table[2])..", not a boolean.")
                        end
                        
                        task.wait(Table[4])
                        GUI:Destroy()
                    else
                        return warn(Table[2].." its a "..typeof(Table[2])..", not a number.")
                    end
                else
                    return warn(Table[2].." its a "..typeof(Table[2])..", not a number.")
                end
            else
                return warn(Table[2].." its a "..typeof(Table[2])..", not a string.")
            end
        else
            return warn(Table[1].." its a "..typeof(Table[1])..", not a string.")
        end
    else
        return warn(Table.." its a "..typeof(Table)..", not a table.")
    end
end

return NotificationSystem
