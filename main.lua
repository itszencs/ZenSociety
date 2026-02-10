local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚩 ZenSociety V2 | By ItsZenCs",
   LoadingTitle = "ESTABLECIENDO DOMINIO TOTAL...",
   LoadingSubtitle = "by itszencs | Society Ecosystem",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ZenSociety_V2",
      FileName = "Config"
   },
   Theme = "Dark" -- Base oscura para resaltar los degradados rojos
})

-- NOTA: Rayfield maneja los colores de los elementos automáticamente al elegir "Dark",
-- pero aquí forzamos la estética de la Sociedad.

-- WATERMARK (TEXTO EN PANTALLA)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 40)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(150, 0, 0)

local UIGradient = Instance.new("UIGradient", MainFrame)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 0, 0))
}

local DiscordLabel = Instance.new("TextLabel", MainFrame)
DiscordLabel.Size = UDim2.new(1, 0, 1, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "ZenSociety | discord.gg/N3BvZ499sc"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.Font = Enum.Font.Code
DiscordLabel.TextSize = 13

-- PESTAÑA: DESTRUCCIÓN TOTAL
local TabDestruction = Window:CreateTab("☄️ Destroyer", 4483362458)

TabDestruction:CreateButton({
   Name = "METHOD: NULL-POINT CRASH",
   Callback = function()
       Rayfield:Notify({Title = "ZENSOCIETY", Content = "Iniciando colapso de red...", Duration = 4})
       -- Ejecución en paralelo para saturar el buffer del servidor
       for i = 1, 15 do
           task.spawn(function()
               while true do
                   for _, remote in pairs(game:GetDescendants()) do
                       if remote:IsA("RemoteEvent") then
                           remote:FireServer(string.rep("🛑ZENSOCIETY🛑", 1000))
                       end
                   end
                   task.wait(0.001)
               end
           end)
       end
   end,
})

-- PESTAÑA: TROLL & DUPE
local TabTroll = Window:CreateTab("🤡 Troll & Dupe", 4483362458)

TabTroll:CreateSection("Dupe Tools")
TabTroll:CreateButton({
   Name = "Ghost Dupe (Experimental)",
   Callback = function()
       -- Simula el lag para confundir al servidor durante el intercambio/drop
       settings().Network.IncomingReplicationLag = 10
       Rayfield:Notify({Title = "DUPE", Content = "Lag activo por 5s. Suelta el objeto.", Duration = 5})
       task.wait(5)
       settings().Network.IncomingReplicationLag = 0
   end,
})

TabTroll:CreateSection("Troll Tools")
TabTroll:CreateToggle({
   Name = "Fling Aura (Lanza a la gente)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Fling = Value
       while _G.Fling do
           local p = game.Players.LocalPlayer.Character.HumanoidRootPart
           p.Velocity = Vector3.new(0, 10000, 0) -- Crea una fuerza invisible de empuje
           task.wait(0.1)
           p.Velocity = Vector3.new(0, 0, 0)
           task.wait(0.1)
       end
   end,
})

-- PESTAÑA: MOVIMIENTO & HACKS
local TabElite = Window:CreateTab("⚔️ Elite Hacks", 4483362458)

TabElite:CreateSlider({
   Name = "Zen Speed",
   Range = {16, 500},
   Increment = 5,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

TabElite:CreateToggle({
   Name = "Wallhack (ESP)",
   CurrentValue = false,
   Callback = function(Value)
       _G.ESP = Value
       while _G.ESP do
           for _, p in pairs(game.Players:GetPlayers()) do
               if p ~= game.Players.LocalPlayer and p.Character then
                   if not p.Character:FindFirstChild("Highlight") then
                       local h = Instance.new("Highlight", p.Character)
                       h.FillColor = Color3.fromRGB(255, 0, 0)
                       h.OutlineColor = Color3.fromRGB(0, 0, 0)
                   end
               end
           end
           task.wait(1)
       end
   end,
})

-- PESTAÑA: ANUNCIOS
local TabAds = Window:CreateTab("📢 Promo", 4483362458)
TabAds:CreateToggle({
   Name = "Auto-Chat Spammer",
   CurrentValue = false,
   Callback = function(Value)
       _G.Spam = Value
       while _G.Spam do
           local msg = "🚩 ZenSociety V2 is HERE! discord.gg/N3BvZ499sc"
           game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
           task.wait(8)
       end
   end,
})

Rayfield:Notify({
   Title = "ZenSociety V2",
   Content = "Bienvenido a la Sociedad. Panel cargado.",
   Duration = 5
})
