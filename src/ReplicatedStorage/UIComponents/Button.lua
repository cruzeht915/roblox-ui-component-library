local BaseComponent = require(script.Parent.Core.BaseComponent)

local Button = setmetatable({}, BaseComponent)
Button.__index = Button

function Button.new(props)
	local self = BaseComponent.new(props)
	setmetatable(self, Button)
	self:render()
	return self
end

function Button:render()
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 100, 0, 40)
	btn.Position = self.props.Position or UDim2.new(0, 0, 0, 0)
	btn.Text = self.props.Text or "Click Me"
	btn.BackgroundColor3 = self.props.BackgroundColor or Color3.fromRGB(0, 170, 255)
	btn.TextColor3 = self.props.TextColor or Color3.fromRGB(255, 255, 255)
	btn.Parent = self.props.Parent or game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIRoot")

	btn.MouseButton1Click:Connect(function()
		if self.props.OnClick then
			self.props.OnClick()
		end
	end)

	self.instance = btn
end

return Button