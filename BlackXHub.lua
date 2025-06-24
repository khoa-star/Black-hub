
if not game:IsLoaded() then game.Loaded:Wait() end
local P = game:GetService("Players")
local L = P.LocalPlayer
local H = game:GetService("HttpService")
local RS = game:GetService("ReplicatedStorage")
local G = Instance.new("ScreenGui", L:WaitForChild("PlayerGui"))
G.Name = "BlackXHub"
G.ResetOnSpawn = false

local Main = Instance.new("Frame", G)
Main.Size = UDim2.new(0, 600, 0, 400)
Main.Position = UDim2.new(0.5, -300, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

local Header = Instance.new("TextLabel", Sidebar)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Text = "Black X Hub"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 18
Header.TextColor3 = Color3.new(1,1,1)
Header.BackgroundTransparency = 1

local Tabs = {"Home", "Finder", "ESP", "AutoBuy", "Settings"}
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 140, 0, 0)
Content.Size = UDim2.new(1, -140, 1, 0)
Content.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Content.BorderSizePixel = 0
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

local function switchTab(name)
    for _, obj in pairs(Content:GetChildren()) do
        if obj:IsA("Frame") then obj.Visible = false end
    end
    if Content:FindFirstChild(name) then
        Content[name].Visible = true
    end
end

for i, tab in ipairs(Tabs) do
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1, -10, 0, 30)
    B.Position = UDim2.new(0, 5, 0, 40 + (i - 1) * 35)
    B.Text = tab
    B.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    B.TextColor3 = Color3.new(1, 1, 1)
    B.Font = Enum.Font.Gotham
    B.TextSize = 14
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 6)

    local TabFrame = Instance.new("Frame", Content)
    TabFrame.Name = tab
    TabFrame.Size = UDim2.new(1, 0, 1, 0)
    TabFrame.BackgroundTransparency = 1
    TabFrame.Visible = false

    B.MouseButton1Click:Connect(function()
        switchTab(tab)
    end)
end
switchTab("Home")
