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
    Name = "Auto Click.",
    Info = "Vai te dar ponto de força sem precisar clicar com o mouse.",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        G().T = Value

        while G().T do task.wait()
            game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()
        end
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "Auto Punch NPC.",
    Info = "Vai atacar o NPC automaticamente quando você entrar em uma luta.",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        G().V = Value

        while G().V do task.wait()
            firesignal(game.Players.LocalPlayer.PlayerGui.FightingMainUi.ClickButton.Activated)
        end
    end,
})
