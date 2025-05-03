local BaseComponent = require(script.Parent.Core.BaseComponent)
local Modal = setmetatable({}, BaseComponent)
Modal.__index = Modal

function Modal.new(props)
	local self = BaseComponent.new(props)
	setmetatable(self, Modal)
	self:render()
	return self
end

function Modal:render()
	local screenGui = self.props.Parent or game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIRoot")

	-- Backdrop
	local overlay = Instance.new("Frame")
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.4
	overlay.ZIndex = 1
	overlay.Parent = screenGui

	-- Modal Frame
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 300, 0, 200)
	frame.Position = UDim2.new(0.5, -150, 0.5, -100)
	frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	frame.BorderSizePixel = 0
	frame.ZIndex = 2
	frame.Parent = overlay

	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, -20, 1, -60)
	text.Position = UDim2.new(0, 10, 0, 10)
	text.Text = self.props.Message or "This is a modal!"
	text.TextColor3 = Color3.fromRGB(0, 0, 0)
	text.BackgroundTransparency = 1
	text.TextWrapped = true
	text.ZIndex = 3
	text.Parent = frame

	local closeButton = Instance.new("TextButton")
	closeButton.Size = UDim2.new(0, 100, 0, 40)
	closeButton.Position = UDim2.new(0.5, -50, 1, -50)
	closeButton.Text = "Close"
	closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
	closeButton.TextColor3 = Color3.new(1, 1, 1)
	closeButton.ZIndex = 3
	closeButton.Parent = frame

	closeButton.MouseButton1Click:Connect(function()
		self:destroy()
	end)

	self.instance = overlay
end

return Modal