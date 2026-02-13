local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🚩 ZenSociety V2.1  —  TROLL MODE",
    LoadingTitle = "ESTABLECIENDO DOMINIO TOTAL...",
    LoadingSubtitle = "by itszencs | zSociety Ecosystem",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ZenSociety_Troll",
        FileName = "TrollConfig"
    },
    Theme = "Dark"
})

-- ────────────────────────────────────────────────────────────────
--                   WATERMARK / BANNER ROJO
-- ────────────────────────────────────────────────────────────────
local sg = Instance.new("ScreenGui", game.CoreGui)
sg.ResetOnSpawn = false

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 320, 0, 38)
frame.Position = UDim2.new(0.5, -160, 0, 8)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(180,0,0)

local grad = Instance.new("UIGradient", frame)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(220,20,60)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(139,0,0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40,0,0))
}

local txt = Instance.new("TextLabel", frame)
txt.Size = UDim2.new(1,0,1,0)
txt.BackgroundTransparency = 1
txt.Text = "🚩 ZenSociety V2.1  •  discord.gg/N3BvZ499sc  •  TROLL & SHAME"
txt.TextColor3 = Color3.new(1,1,1)
txt.Font = Enum.Font.Code
txt.TextSize = 14
txt.TextStrokeTransparency = 0.7
txt.TextStrokeColor3 = Color3.fromRGB(80,0,0)

-- ────────────────────────────────────────────────────────────────
--                         TABS
-- ────────────────────────────────────────────────────────────────

local TrollTab   = Window:CreateTab("🤡 TROLL", 4483362458)
local VisualTab  = Window:CreateTab("👁️ Visual Shit", 4483362458)
local Movement   = Window:CreateTab("⚡ Movement", 4483362458)
local SpamTab    = Window:CreateTab("📢 Spam & Shame", 4483362458)
local AudioTab   = Window:CreateTab("🔊 Audio Cancer", 4483362458)

-- ────────────────────────────────────────────────────────────────
--                       TROLL TAB
-- ────────────────────────────────────────────────────────────────

TrollTab:CreateSection("Classic Trolls")

TrollTab:CreateButton({
    Name = "Hacete gigante x10",
    Callback = function()
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        hrp.Size = Vector3.new(30,30,30)
        hrp.Transparency = 0.4
        game:GetService("Debris"):AddItem(hrp, 6)
    end
})

TrollTab:CreateButton({
    Name = "Hacete chiquitito (rata mode)",
    Callback = function()
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        hrp.Size = Vector3.new(0.4, 0.4, 0.4)
        hrp.Transparency = 0.3
        game:GetService("Debris"):AddItem(hrp, 7)
    end
})

TrollTab:CreateToggle({
    Name = "Fling Aura (te lanzás vos solo)",
    CurrentValue = false,
    Callback = function(v)
        _G.FlingAura = v
        spawn(function()
            while _G.FlingAura do
                pcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hrp.Velocity = Vector3.new(math.random(-200,200), 150+math.random(0,300), math.random(-200,200))
                end)
                task.wait(0.12)
            end
        end)
    end
})

TrollTab:CreateButton({
    Name = "Rainbow Name (si el juego lo permite)",
    Callback = function()
        spawn(function()
            local name = game.Players.LocalPlayer.Name
            for i = 1, 50 do
                game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("BillboardGui").Adornee.TextLabel.TextColor3 = Color3.fromHSV(i/50,1,1)
                task.wait(0.08)
            end
        end)
    end
})

-- ────────────────────────────────────────────────────────────────
--                       VISUAL SHIT
-- ────────────────────────────────────────────────────────────────

VisualTab:CreateSection("Visual Cancer")

VisualTab:CreateToggle({
    Name = "ESP rojo brillante (todos)",
    CurrentValue = false,
    Callback = function(v)
        _G.ESP = v
        while _G.ESP do
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= game.Players.LocalPlayer and plr.Character then
                    local char = plr.Character
                    if not char:FindFirstChild("ESPHighlight") then
                        local hl = Instance.new("Highlight", char)
                        hl.Name = "ESPHighlight"
                        hl.FillColor = Color3.fromRGB(255,40,40)
                        hl.OutlineColor = Color3.fromRGB(255,200,0)
                        hl.FillTransparency = 0.4
                        hl.OutlineTransparency = 0
                    end
                end
            end
            task.wait(1.2)
        end
    end
})

VisualTab:CreateToggle({
    Name = "Force Field arcoíris (vos)",
    CurrentValue = false,
    Callback = function(v)
        _G.RainbowFF = v
        spawn(function()
            local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
            local ff = Instance.new("ForceField", char)
            while _G.RainbowFF and ff.Parent do
                ff.Visible = true
                for i = 0, 1, 0.03 do
                    ff.Color3 = Color3.fromHSV(i,1,1)
                    task.wait(0.03)
                end
            end
            if ff then ff:Destroy() end
        end)
    end
})

-- ────────────────────────────────────────────────────────────────
--                       MOVEMENT
-- ────────────────────────────────────────────────────────────────

Movement:CreateSlider({
    Name = "WalkSpeed (16 → 350)",
    Range = {16, 350},
    Increment = 8,
    CurrentValue = 16,
    Callback = function(v)
        local h = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if h then h.WalkSpeed = v end
    end
})

Movement:CreateSlider({
    Name = "JumpPower (50 → 300)",
    Range = {50, 300},
    Increment = 10,
    CurrentValue = 50,
    Callback = function(v)
        local h = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if h then h.JumpPower = v end
    end
})

-- ────────────────────────────────────────────────────────────────
--                       SPAM & SHAME
-- ────────────────────────────────────────────────────────────────

SpamTab:CreateToggle({
    Name = "Auto Spam Chat (cada 6s)",
    CurrentValue = false,
    Callback = function(v)
        _G.ChatSpam = v
        spawn(function()
            while _G.ChatSpam do
                local msgs = {
                    "🚩 zSociety ownz u  •  discord.gg/N3BvZ499sc",
                    "get rekt kiddo 😈",
                    "imagine being this bad 😂",
                    "zSociety > your whole bloodline",
                    "cry more in chat lil bro"
                }
                local msg = msgs[math.random(1,#msgs)]
                pcall(function()
                    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents",true).SayMessageRequest:FireServer(msg, "All")
                end)
                task.wait(6)
            end
        end)
    end
})

-- ────────────────────────────────────────────────────────────────
--                       AUDIO CANCER
-- ────────────────────────────────────────────────────────────────

AudioTab:CreateButton({
    Name = "Spam Sound Id (toca varias veces = caos)",
    Callback = function()
        for i = 1, 8 do
            spawn(function()
                local snd = Instance.new("Sound")
                snd.SoundId = "rbxassetid://1847661825"   -- ejemplo (podes cambiarlo)
                snd.Volume = 10
                snd.Looped = false
                snd.Parent = game.Players.LocalPlayer.PlayerGui
                snd:Play()
                snd.Ended:Wait()
                snd:Destroy()
            end)
        end
    end
})

AudioTab:CreateToggle({
    Name = "Loop Sound Cancer (muy molesto)",
    CurrentValue = false,
    Callback = function(v)
        if v then
            local snd = Instance.new("Sound", game.Players.LocalPlayer.PlayerGui)
            snd.SoundId = "rbxassetid://1847661825"   -- cámbialo por el id que quieras
            snd.Volume = 6
            snd.Looped = true
            snd:Play()
            _G.CancerSound = snd
        else
            if _G.CancerSound then
                _G.CancerSound:Stop()
                _G.CancerSound:Destroy()
            end
        end
    end
})

Rayfield:Notify({
    Title = "zSociety V2.1 - TROLL MODE",
    Content = "Panel cargado. A romperle la cabeza a todos (sin crashear pls 😈)",
    Duration = 6
