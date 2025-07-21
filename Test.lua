-- 🧪 Mostrar cuadro "Test"
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TestGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "🧪 Test"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Parent = Frame

-- 🌐 Webhook Discord
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local username = player.Name
local displayname = player.DisplayName
local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local device = (UserInputService.TouchEnabled and "Mobile") or "PC"
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local executor = identifyexecutor and identifyexecutor() or "Desconocido"

-- Avatar URL
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=150&height=150&format=png"

-- Webhook
local webhookUrl = "https://discord.com/api/webhooks/1396732836685414490/zvv4mUQrkJw1SoUVm_5gKOAI6lXkpuFI5_nEPnksItxpjhYXHHZKrYRK0E__TNCYcHNK"

-- Embed
local data = {
    ["content"] = "**Success To Execute Script!**",
    ["embeds"] = {{
        ["title"] = "W-Skinny Hub Executado!",
        ["description"] = string.format("**%s | Nickname of Player**", username),
        ["color"] = 0x00FFFF,
        ["thumbnail"] = {["url"] = avatarUrl},
        ["fields"] = {
            {["name"] = "Game Name:", ["value"] = gameName .. " 🏆", ["inline"] = false},
            {["name"] = "Hardware ID:", ["value"] = hwid, ["inline"] = false},
            {["name"] = "Device:", ["value"] = device, ["inline"] = false},
            {["name"] = "Executor:", ["value"] = executor, ["inline"] = false}
        }
    }}
}

-- Enviar Webhook
pcall(function()
    HttpService:PostAsync(webhookUrl, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
end)
