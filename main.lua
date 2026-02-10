local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚩 ZenSociety | v1.0",
   LoadingTitle = "Iniciando Protocolo de Extinción...",
   LoadingSubtitle = "by ZenSociety Admin",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ZenSociety_Data",
      FileName = "MainHacks"
   },
   Theme = "Red" -- Esto configura los tonos rojos y negros
})

-- VARIABLES --
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- PESTAÑA INFO / DISCORD --
local TabInfo = Window:CreateTab("🔗 Social", 4483362458)
TabInfo:CreateSection("Únete a la Sociedad")
TabInfo:CreateButton({
   Name = "Copiar Link de Discord",
   Callback = function()
       setclipboard("https://discord.gg/N3BvZ499sc")
       Rayfield:Notify({Title = "ZenSociety", Content = "¡Link copiado al portapapeles!", Duration = 5})
   end,
})

-- PESTAÑA CRASH (ATTACK) --
local TabCrash = Window:CreateTab("🔥 Server Destroyer", 4483362458)
TabCrash:CreateSection("⚠️ PELIGRO: Estas funciones pueden banearte")

TabCrash:CreateButton({
   Name = "MÉTODO: REMOTE OVERLOAD (LAG)",
   Callback = function()
       Rayfield:Notify({Title = "ZenSociety", Content = "Inyectando paquetes basura...", Duration = 3})
       for i = 1, 1000 do
           for _, v in pairs(game:GetDescendants()) do
               if v:IsA("RemoteEvent") then
                   v:FireServer(string.rep("ZenSociety_OWNED", 500))
               end
           end
           task.wait(0.01)
       end
   end,
})

TabCrash:CreateToggle({
   Name = "PART SPAM (Destruir FPS)",
   CurrentValue = false,
   Callback = function(Value)
       _G.SpamParts = Value
       while _G.SpamParts do
           local p = Instance.new("Part", workspace)
           p.Size = Vector3.new(20, 20, 20)
           p.Position = Player.Character.HumanoidRootPart.Position + Vector3.new(0, 50, 0)
           p.Velocity = Vector3.new(0, 1000, 0)
           p.BrickColor = BrickColor.new("Really red")
           task.wait()
       end
   end,
})

-- PESTAÑA HACKS (COMBATE) --
local TabHacks = Window:CreateTab("💀 Elite Hacks", 4483362458)

TabHacks:CreateToggle({
   Name = "Hitbox Expander (GOD)",
   CurrentValue = false,
   Callback = function(Value)
       _G.HitboxSize = 25
       _G.HitboxEnabled = Value
       game:GetService("RunService").RenderStepped:Connect(function()
           if _G.HitboxEnabled then
               for _, v in pairs(game.Players:GetPlayers()) do
                   if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                       v.Character.HumanoidRootPart.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                       v.Character.HumanoidRootPart.Transparency = 0.7
                       v.Character.HumanoidRootPart.Color = Color3.fromRGB(255, 0, 0)
                       v.Character.HumanoidRootPart.CanCollide = false
                   end
               end
           end
       end)
   end,
})

-- PESTAÑA MOVIMIENTO --
local TabMove = Window:CreateTab("⚡ Movimiento", 4483362458)
TabMove:CreateSlider({
   Name = "Speed Velocity",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) Player.Character.Humanoid.WalkSpeed = Value end,
})

TabMove:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
       game:GetService("UserInputService").JumpRequest:Connect(function()
           Player.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
       end)
   end,
})

Rayfield:Notify({
   Title = "ZenSociety Inyectado",
   Content = "Servidor bajo control. Discord: N3BvZ499sc",
   Duration = 7,
})