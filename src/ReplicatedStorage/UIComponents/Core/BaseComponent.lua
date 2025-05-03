local BaseComponent = {}
BaseComponent.__index = BaseComponent

function BaseComponent.new(props)
	local self = setmetatable({}, BaseComponent)
	self.props = props or {}
	return self
end

function BaseComponent:render()
	-- override in child
end

function BaseComponent:destroy()
	if self.instance then
		self.instance:Destroy()
	end
end

return BaseComponent