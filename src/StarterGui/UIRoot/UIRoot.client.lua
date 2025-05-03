local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Toast = require(ReplicatedStorage.UIComponents.Toast)
local Modal = require(ReplicatedStorage.UIComponents.Modal)
local Button = require(ReplicatedStorage.UIComponents.Button)

-- Utility: create a simple button with text and a click handler
local function createButton(text: string, position: UDim2, onClick: () -> ())
	local _btn = Button.new({
		Text = text,
		Position = position,
		OnClick = onClick
	})
end

-- Show Toast immediately on startup
Toast.new({
	Text = "Welcome to the UI component demo!",
	Duration = 3
})

-- Add Buttons to trigger Modal and Toast manually
createButton("Show Modal", UDim2.new(0.5, -110, 0.6, 0), function()
	Modal.new({
		Message = "This is a modal dialog. Press Close to dismiss."
	})
end)

createButton("Show Toast", UDim2.new(0.5, 10, 0.6, 0), function()
	Toast.new({
		Text = "This is a toast triggered by a button!",
		Duration = 2
	})
end)