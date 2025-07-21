local HttpService = game:GetService("HttpService")

local webhookURL = "https://discord.com/api/webhooks/1396732836685414490/zvv4mUQrkJw1SoUVm_5gKOAI6lXkpuFI5_nEPnksItxpjhYXHHZKrYRK0E__TNCYcHNK"

local data = {
    content = "Test: alguien ejecutó el script"
}

local jsonData = HttpService:JSONEncode(data)

local success, response = pcall(function()
    return HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
end)

if success then
    print("Mensaje enviado correctamente al webhook.")
else
    warn("Error al enviar mensaje al webhook:", response)
end
