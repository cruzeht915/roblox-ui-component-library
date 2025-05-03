local BaseComponent = require(script.Parent.Core.BaseComponent)
local TweenService = game:GetService("TweenService")

local Toast = setmetatable({}, BaseComponent)
Toast.__index = Toast

function Toast.new(props)
	local self = BaseComponent.new(props)
	setmetatable(self, Toast)
	self:render()
	return self
end

function Toast:render()
	local screenGui = self.props.Parent or game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIRoot")

	local toast = Instance.new("TextLabel")
	toast.Size = UDim2.new(0, 300, 0, 50)
	toast.Position = UDim2.new(0.5, -150, 1, -60)
	toast.Text = self.props.Text or "This is a toast message!"
	toast.TextColor3 = Color3.new(1, 1, 1)
	toast.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	toast.BackgroundTransparency = 0.2
	toast.TextScaled = true
	toast.AnchorPoint = Vector2.new(0.5, 1)
	toast.ZIndex = 10
	toast.Parent = screenGui

	self.instance = toast

	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local appearTween = TweenService:Create(toast, tweenInfo, { Position = UDim2.new(0.5, -150, 0.9, -10) })
	appearTween:Play()

	task.delay(self.props.Duration or 2, function()
		if self.instance then
			local disappearTween = TweenService:Create(toast, tweenInfo, { Position = UDim2.new(0.5, -150, 1, -60) })
			disappearTween:Play()
			disappearTween.Completed:Wait()
			self:destroy()
		end
	end)
end

return Toast