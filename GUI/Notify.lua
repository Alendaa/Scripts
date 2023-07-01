local NotificationSystem = {}
local GUIFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alendaa/Scripts/main/GUI/CreateGUI.lua",true))();


if not game:GetService("CoreGui"):FindFirstChild("NotificationSystem") then
    GUIFunctions.CreateGUI()
end

function NotificationSystem:Notify(Config)
    if type(Config) == "table" then
        local Content = GUIFunctions:CreateContent()
        if Config["Title"] ~= nil and type(Config["Title"]) == "string" then
            Content.Title.Text = Config["Title"]
        else
            return warn(Config["Title"].." its not a string.")
        end

        if Config["Content"] ~= nil and type(Config["Content"]) == "string" then
            Content.Text.Text = Config["Content"]
        else
            return warn(Config["Content"].." its not a string.")
        end

        if Config["Time"] ~= nil and type(Config["Time"]) == "number" then
            game:GetService("Debris"):AddItem(Content, Config["Time"])
        else
            return warn(Config["Time"].." its not a number.")
        end

        if Config["Important"] ~= nil and type(Config["Important"]) == "boolean" then
            if Config["Important"] then
                Content.LayoutOrder = 0
            end
        else
            return warn(Config["Important"].." its not a number.")
        end
    else
        return warn(Config.." its not a table.")
    end
end

NotificationSystem:Notify({
    Title = "Title",
    Content = "Content",
    ImageId = 0,
    Time = 1.5,
    Important = false
})


return NotificationSystem
