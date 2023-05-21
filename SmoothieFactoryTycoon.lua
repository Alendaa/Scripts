local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
Rayfield:LoadConfiguration()

--[[ Player Variables ]]--
local plr = game:GetService("Players").LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local hrp = chr:WaitForChild("HumanoidRootPart")
local hr = chr:WaitForChild("Humanoid")

--[[ Services ]]--


--[[ Variables ]]--
local G = getgenv

local Tycoon
for i,v in next, workspace.Tycoons:GetDescendants() do
    if v:IsA("ObjectValue") and v.Name == "Owner" and tostring(v.Value) == plr.Name then
        Tycoon = v.Parent
    end
end

if Tycoon == nil then
    Rayfield:Notify({
        Title = "Warn.",
        Content = "No tycoon claimed, claim a tycoon and execute the script again.",
        Duration = 6.5,
        Image = nil,
        Actions = { -- Notification Buttons
            Ignore = {
                Name = "Okay!",
                Callback = function()
                end
            },
        },
    })
    return
end

G().Easy = false
G().Hard = false
G().Blending = false
G().OpeningDoor = false
G().OpeningCrateDoor = false


--[[ Parts ]]--


--[[ Functions ]]--


--[[ Tables ]]--







local Window = Rayfield:CreateWindow({
	Name = "Cheaters Hub.",
	LoadingTitle = "Cheaters Hub.",
	LoadingSubtitle = "by MigueI#2421",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "Cheaters Hub",
		FileName = "None"
	},
	Discord = {
		Enabled = false,
		Invite = "",
		RememberJoins = true
	},
	KeySystem = false,
	KeySettings = {
		Title = "Cheaters Hub",
		Subtitle = "Key System",
		Note = "Drink Water.",
		FileName = "CheatersHub",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = "1"
	}
})



local Tab = Window:CreateTab("Main", nil)


local Toggle = Tab:CreateToggle({
    Name = "Auto Blend.",
    Info = nil,
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        G().AutoBlend = Value

        while G().AutoBlend do task.wait()
            if not G().Easy and not G().Hard then
                for i,v in next, Tycoon.Purchases:GetChildren() do
                    if v:IsA("Model") and string.find(string.lower(v.Name), "blender") and v:GetAttribute("Filled") then
                        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            G().Blending = true
                            local OldCFrame = plr.Character.HumanoidRootPart.CFrame
                            plr.Character.HumanoidRootPart.CFrame = v.Button.CFrame
                            task.wait(0.25)
                            fireproximityprompt(v.Button.Attachment.ActivateBlender)
                            task.wait(0.1)
                            plr.Character.HumanoidRootPart.CFrame = OldCFrame
                            G().Blending = false
                            task.wait(1)
                        end
                    end
                end
            end
        end
    end,
})


local Toggle = Tab:CreateToggle({
    Name = "Auto Open Door.",
    Info = nil,
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        G().AutoOpenDoor = Value

        while G().AutoOpenDoor do task.wait()
            if not G().Easy and not G().Hard then
                if not G().Blending and not G().OpeningCrateDoor then
                    if Tycoon.ProcessingMachines.JarFactory.JarFactory.Button.Button:FindFirstChild("Arrow") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        G().OpeningDoor = true
                        local OldCFrame = plr.Character.HumanoidRootPart.CFrame
                        plr.Character.HumanoidRootPart.CFrame = Tycoon.ProcessingMachines.JarFactory.JarFactory.Button.Button.CFrame
                        task.wait(0.25)
                        fireproximityprompt(Tycoon.ProcessingMachines.JarFactory.JarFactory.Button.Button.Attachment.OpenDoorPrompt)
                        task.wait(0.1)
                        plr.Character.HumanoidRootPart.CFrame = OldCFrame
                        G().OpeningDoor = false
                        task.wait(1)
                    end
                end
            end
        end
    end,
})


local Toggle = Tab:CreateToggle({
    Name = "Auto Open Crate Door.",
    Info = nil,
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        G().AutoOpenCrateDoor = Value

        while G().AutoOpenCrateDoor do task.wait()
            if not G().Easy and not G().Hard then
                if not G().Blending and not G().OpeningDoor then
                    if Tycoon.ProcessingMachines.CratePackager.CratePackager:WaitForChild("Crate") then
                        local Jars = Tycoon.ProcessingMachines.CratePackager.CratePackager.Crate.Jars:GetChildren()
                        if table.maxn(Jars) >= 8 then
                            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                G().OpeningCrateDoor = true
                                local OldCFrame = plr.Character.HumanoidRootPart.CFrame
                                plr.Character.HumanoidRootPart.CFrame = Tycoon.ProcessingMachines.CratePackager.CratePackager.Button.Button.CFrame
                                task.wait(0.25)
                                fireproximityprompt(Tycoon.ProcessingMachines.CratePackager.CratePackager.Button.Button.Attachment.OpenDoorPrompt)
                                task.wait(0.1)
                                plr.Character.HumanoidRootPart.CFrame = OldCFrame
                                G().OpeningCrateDoor = false
                                task.wait(1)
                            end
                        end
                    end
                end
            end
        end
    end,
})



local Tab = Window:CreateTab("Obby", nil)


local Toggle = Tab:CreateToggle({
    Name = "Auto Easy Obby.",
    Info = "Auto Complete Easy Obby For You.",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        G().AutoEasyObby = Value

        while G().AutoEasyObby do task.wait()
            if workspace.Obbies:FindFirstChild("EasyObby") then
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and not workspace.Obbies.EasyObby.Decorations.ObbySign.Border.CanCollide then
                    G().Easy = true
                    local OldCFrame = plr.Character.HumanoidRootPart.CFrame
                    plr.Character.HumanoidRootPart.CFrame = workspace.Obbies.EasyObby.Speed.Enter.Part.CFrame
                    task.wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Obbies.EasyObby.Finish.Button.CFrame
                    task.wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Obbies.EasyObby.Speed.Exit.Part.CFrame
                    task.wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = OldCFrame
                    G().Easy = false
                    task.wait(1)
                end
            end
        end
    end,
})


local Toggle = Tab:CreateToggle({
    Name = "Auto Hard Obby.",
    Info = "Auto Complete Hard Obby For You.",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        G().AutoHardObby = Value

        while G().AutoHardObby do task.wait()
            if workspace.Obbies:FindFirstChild("HardObby") then
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and not workspace.Obbies.HardObby.Decorations.ObbySign.Border.CanCollide then
                    G().Hard = true
                    local OldCFrame = plr.Character.HumanoidRootPart.CFrame
                    plr.Character.HumanoidRootPart.CFrame = workspace.Obbies.HardObby.Speed.Enter.Part.CFrame
                    task.wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Obbies.HardObby.Finish.Button.CFrame
                    task.wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Obbies.HardObby.Speed.Exit.Part.CFrame
                    task.wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = OldCFrame
                    G().Hard = false
                    task.wait(1)
                end
            end
        end
    end,
})



local Tab = Window:CreateTab("Teleport", nil)


local Button = Tab:CreateButton({
    Name = "Teleport To Tycoon",
    Info = nil,
    Interact = 'Changable',
    Callback = function()
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = Tycoon.TycoonPlayerSpawn.CFrame
        end
    end,
})
