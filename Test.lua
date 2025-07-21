local HttpService = game:GetService("HttpService")

local webhookURL = "https://discord.com/api/webhooks/1396732836685414490/zvv4mUQrkJw1SoUVm_5gKOAI6lXkpuFI5_nEPnksItxpjhYXHHZKrYRK0E__TNCYcHNK"

local function enviarMensaje(mensaje)
    local data = {
        content = mensaje
    }
    local jsonData = HttpService:JSONEncode(data)
    local success, err = pcall(function()
        HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
    end)
    if success then
        print("Mensaje enviado OK")
    else
        warn("Error al enviar mensaje:", err)
    end
end

-- Ejemplo: cuando alguien ejecute el script
enviarMensaje("Alguien ejecutó el script en Roblox")
