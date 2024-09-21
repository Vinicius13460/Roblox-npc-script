-- Simple NPC Hitbox and ESP Script

-- Hitbox and ESP settings
local hitboxSize = Vector3.new(10, 10, 10)  -- Size of the hitbox
local hitboxTransparency = 0.5  -- Hitbox transparency
local espEnabled = true  -- Enable ESP

-- Function to expand the hitbox
local function expandHitbox(npc)
    if npc and npc:FindFirstChild("HumanoidRootPart") then
        local humanoidPart = npc:FindFirstChild("HumanoidRootPart")
        humanoidPart.Size = hitboxSize
        humanoidPart.Transparency = hitboxTransparency
        humanoidPart.CanCollide = false
    end
end

-- Function to apply ESP (a visual highlight) to the NPC
local function applyESP(npc)
    if npc and npc:FindFirstChild("HumanoidRootPart") then
        local humanoidPart = npc:FindFirstChild("HumanoidRootPart")

        -- Check if Highlight (ESP) is already applied
        if not humanoidPart:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Parent = humanoidPart
            highlight.FillColor = Color3.fromRGB(255, 0, 0)  -- Red color
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0) -- Black outline
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
        end
    end
end

-- Function to apply hitboxes and ESP to all NPCs
local function expandHitboxesAndApplyESP()
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") then
            expandHitbox(npc)
            if espEnabled then
                applyESP(npc)
            end
        end
    end
end

-- Loop to keep applying hitbox changes and ESP
while true do
    expandHitboxesAndApplyESP()
    wait(1)  -- Wait for 1 second before checking again
end
