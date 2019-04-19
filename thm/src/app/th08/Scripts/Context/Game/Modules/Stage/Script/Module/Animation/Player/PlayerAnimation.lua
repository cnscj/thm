local M = class("PlayerAnimation",StageDefine.AnimationController)

function M:_onInit()
    M.super._onInit(self)
    
    self.animater = THSTG.ANIMATION.newDBXAnimater({
        tex = ResManager.getResSub(ResType.ANIMATION,AnimationType.SEQUENCE,"player00_tex"),
        ske = ResManager.getResSub(ResType.ANIMATION,AnimationType.SEQUENCE,"player00_ske")
    })
    
end

function M:_onState()
    return {
        initial = "Idle",
        events  = {
            {name = "MoveLeft",  from = {"Idle","MoveRight"},  to = "MoveLeft"},
            {name = "MoveRight",  from = {"Idle","MoveLeft"},  to = "MoveRight"},

            {name = "Idle", from = {"MoveRight","MoveLeft"},  to = "Idle"},
        },
        callbacks = {
            onMoveLeft = handler(self,self._onMoveLeft),
            onMoveRight = handler(self,self._onMoveRight),
            onIdle = handler(self,self._onIdle),
        },
    }
end
function M:getRoleType()
    return self.roleType
end
----
function M:_onStart()
    M.super._onStart(self)
  
    --替换一下组件
    self._transComp = self:getComponentInParent("TransformComponent")
    self._prevPos = cc.p(self._transComp:getPositionX(),self._transComp:getPositionY())
    
    local playerCtrl = self:getScriptInParten("PlayerController")
    self.roleType = playerCtrl.roleType
end
----
function M:_onMove(dx,dy)
    if dx < 0 then 
        self:play("MoveLeft")
    elseif dx > 0 then 
        self:play("MoveRight")
    else 
        self:play("Idle") 
    end
end

function M:_onMoveLeft(event)
    self.spriteComp:setFlippedX(false)
    self.animaComp:stop()
    self.animaComp:playCustom(cc.Sequence:create({
        cc.Animate:create(AnimationCache.getResBySheet(StageConfig.getRoleAnimSheetArgs(self:getRoleType(),"move_left_start"))),
        cc.CallFunc:create(function() 
            self.animaComp:playCustom(cc.RepeatForever:create(
                cc.Animate:create(AnimationCache.getResBySheet(StageConfig.getRoleAnimSheetArgs(self:getRoleType(),"move_left_sustain")))
            ))
        end)
    }))
end

function M:_onMoveRight(event)
    self.spriteComp:setFlippedX(true)
    self.animaComp:stop()
    self.animaComp:playCustom(cc.Sequence:create({
        cc.Animate:create(AnimationCache.getResBySheet(StageConfig.getRoleAnimSheetArgs(self:getRoleType(),"move_left_start"))),
        cc.CallFunc:create(function() 
            self.animaComp:playCustom(cc.RepeatForever:create(
                cc.Animate:create(AnimationCache.getResBySheet(StageConfig.getRoleAnimSheetArgs(self:getRoleType(),"move_left_sustain")))
            ))
        end)
    }))
end


function M:_onIdle(event)
    local actions = {}
    if event.from == "MoveRight" or event.from == "MoveLeft" then
        local animation = AnimationCache.getResBySheet(StageConfig.getRoleAnimSheetArgs(self:getRoleType(),"move_left"))
        animation:setDelayPerUnit(1/26)
        table.insert( actions,cc.Animate:create(animation):reverse())
        table.insert( actions,cc.CallFunc:create(function() 
            self.spriteComp:setFlippedX(not self.spriteComp:isFlippedX())
        end))
    end
    table.insert( actions,cc.CallFunc:create(function() 
        self.animaComp:playCustom(cc.Animate:create(AnimationCache.getResBySheet(StageConfig.getRoleAnimSheetArgs(self:getRoleType(),"stand_normal"))))
    end))
    self.animaComp:stop()
    self.animaComp:playCustom(cc.Sequence:create(actions))
end

----


return M