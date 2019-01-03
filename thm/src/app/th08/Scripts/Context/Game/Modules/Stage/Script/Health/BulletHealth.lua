local HealthController = require("Scripts.Context.Game.Modules.Stage.Script.Health.HealthController")
local M = class("BulletHealth",HealthController)

function M:_onInit()
   M.super._onInit(self)

end
--

----
function M:_onHurt()


end

function M:_onDead()
    local animationComp = self:getComponent("AnimationComponent")
    animationComp:play(cc.Sequence:create({
        --自己旋转,缩小,消失
        cc.Spawn:create({
            --XXX:旋转不是绕中心点???
            cc.RotateBy:create(1,280),
            cc.ScaleBy:create(1,0.6),
            cc.FadeOut:create(1)
        }),
        cc.CallFunc:create(function()
            self:killEntity()
        end)
    }))

    
end

return M