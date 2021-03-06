local M = class("ColliderComponent",ECS.Component)
M.EColliderType = {Rect = 1,Circle = 2}
-----
function M:_onInit()
    self.offset = cc.p(0,0)
    self.anchorPoint = cc.p(0.5,0.5)
    self.isTrigger = false

    self._type = nil            --body类型
    self._transComp = nil
    self._rigidComp = nil
end
------
function M:getType()
    return self._type
end

function M:collide(collder)
    return self:_onCollide(collder)
end

function M:_onAdded(entity)
    self._rigidComp = entity:getComponent("RigidbodyComponent")
    assert(self._rigidComp, string.format("[%s] You must have a RigidbodyComponent ",M.__cname))
    
    self._transComp = entity:getComponent("TransformComponent")
end
------


return M