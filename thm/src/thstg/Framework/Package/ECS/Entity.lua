local M = class("Entity",cc.Node)
local _entityId = 10000
function M:ctor()
    _entityId = _entityId + 1

    self.__id__ = _entityId
    self.__components__ = false
    ----

	local function onEnter()
		local function onUpdate(dTime)
			self:update(dTime)
		end

		self:scheduleUpdateWithPriorityLua(onUpdate,0)
		self:_onEnter()
	end
	local function onExit()
		self:_onExit()
        self:unscheduleUpdate()
	end
	local function onCleanup()
		self:clear()
		self:_onDestroy()
	end
	
	
    self:onNodeEvent("enter", onEnter)
	self:onNodeEvent("exit", onExit)
	self:onNodeEvent("cleanup", onCleanup)
	---
	
	-- self:_onInit()
end
--
function M:addComponent(component)
	
	assert(not tolua.cast(component, "ECS.Component"), "[Entity] the addChild function param value must be a THSTG ECS.Component object!!")
	self.__components__ = self.__components__ or {}

	local componentName = component:getName()
	assert(not self.__components__[componentName], "[Entity] component already added. It can't be added again!")
	self.__components__[componentName] = component

	component:_onAdded(self)
end
--移除组件
function M:removeComponent(name)
	if self.__components__ then
		local component = self.__components__[name]
		if component then
			component:_onRemoved(self)
			self.__components__[name] = nil
		end
	end
end
--获取组件
function M:getComponent(name)
	if self.__components__ then
		return self.__components__[name]
	end
	return nil
end

function M:isHaveComponent(name)
    return self:getComponent(name) and true or false
end

function M:removeAllComponents()
	if self.__components__ then
		for name,_ in pairs(self.__components__) do
			self:removeComponent(name)
		end
	end
end

function M:update(dTime)
	if self.__components__ then
		for k,v in pairs(self.__components__) do
			v:_onUpdate(dTime,self)
		end
	end

	self:_onUpdate(dTime)
end

function M:clear()
	self:removeAllComponents()
end
--

function M:getID()
    return self.__id__
end

---
--[[以下由子类重载]]
function M:_onInit()
end

--进入场景回调
function M:_onEnter()

end

--退出场景回调
function M:_onExit()
	
end

--销毁回调
function M:_onDestroy()
	
end

--每帧回调
function M:_onUpdate(dTime)

end

return M