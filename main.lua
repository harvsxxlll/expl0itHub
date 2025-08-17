-- main.lua
local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")

-- Check if the user is on a mobile device
if not userInputService:IsTouchEnabled() then
    player:Kick("Mobile And Tablet Devices Only!")
    return
end

-- Function to create the password GUI
local function createPasswordGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(0.5, -100, 0.5, -50)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Text = "Enter Password"
    title.TextScaled = true
    title.Parent = frame

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, 0, 0, 50)
    input.Position = UDim2.new(0, 0, 0.5, 0)
    input.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    input.TextColor3 = Color3.new(1, 1, 1)
    input.PlaceholderText = "Password"
    input.TextScaled = true
    input.Parent = frame

    local function onInputEnded(inputObject, inputState)
        if inputState == Enum.UserInputState.End then
            if input.Text == "expl0!tHUB" then
                title.Text = "Welcome Please Click Continue"
                input.Visible = false

                local continueButton = Instance.new("TextButton")
                continueButton.Size = UDim2.new(1, 0, 0, 50)
                continueButton.Position = UDim2.new(0, 0, 0.5, 0)
                continueButton.BackgroundColor3 = Color3.new(0, 1, 0)
                continueButton.TextColor3 = Color3.new(1, 1, 1)
                continueButton.Text = "Continue"
                continueButton.TextScaled = true
                continueButton.Parent = frame

                continueButton.MouseButton1Click:Connect(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/your-repo-name/main/src/exploitHub.lua"))()
                end)
            else
                player:Kick("Wrong Password.")
            end
        end
    end

    input.FocusLost:Connect(onInputEnded)
end

createPasswordGui()