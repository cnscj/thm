local M = class("CCEntity",ECS.Entity,cc.Node)

function M:ctor()
    M.super.ctor(self)
    self.__isCCNode__ = true

    local function onEnter()
		function M.onUpdate(dTime)
			self:update(dTime)
		end
		self:scheduleUpdateWithPriorityLua(M.onUpdate,0)
		self:_enter()
	end
	local function onExit()
		self:_exit()
		self:unscheduleUpdate()
	end
	local function onCleanup()
		self:_onCleanup()
	end
	
    self:onNodeEvent("enter", onEnter)
	self:onNodeEvent("exit", onExit)
	self:onNodeEvent("cleanup", onCleanup)
end

return M