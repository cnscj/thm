module(..., package.seeall)

local M = class("PlayerPrefab",StageDefine.PlayerEntity)

function M:ctor(...)
    M.super.ctor(self)

    self.healthController = StageDefine.PlayerHealth.new()
    self:addScript(self.healthController)

    self.collisionController = StageDefine.PlayerCollision.new()
    self:addScript(self.collisionController)

    self.wipeController = StageDefine.WipeController.new()
    self:addScript(self.wipeController)

    self.brushController = StageDefine.BrushController.new()
    self:addScript(self.brushController)

    self.spellController = StageDefine.PlayerSpellController.new()
    self:addScript(self.spellController)

    self.slowController = StageDefine.SlowController.new()
    self:addScript(self.slowController)

    self.inputController = StageDefine.PlayerInput.new()
    self:addScript(self.inputController)
    
    self.constraintByBorder = StageDefine.ConstraintByBorder.new()
    self:addScript(self.constraintByBorder)

    --初始化变量
    self:setName("PLAYER")

    --普通子弹的发射口
    self.emitter = StageDefine.EmitterPrefab.new()
    self.emitter:setName("EMITTER")
    self:addChild(self.emitter)


end


----------


return M