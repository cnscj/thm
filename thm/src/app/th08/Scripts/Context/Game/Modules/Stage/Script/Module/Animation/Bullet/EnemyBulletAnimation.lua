local M = class("EnemyBulletAnimation",StageDefine.BulletAnimation)

function M:_onInit()
    M.super._onInit(self)

end
--

---
function M:_onStart()
    M.super._onStart(self)
end

function M:_onState()
    return {
        initial = "Idle",
        events  = {
        
            {name = "Idle", from = {},  to = "Idle"},
        },
        callbacks = {
            onIdle = handler(self,self._onIdle),
        },
    }
end

function M:_onIdle(event)
    self:getSprite():runAction(cc.Animate:create(AnimationCache.getResBySheet("etama","bullet_big_jade_idle_4")))
end
----

return M