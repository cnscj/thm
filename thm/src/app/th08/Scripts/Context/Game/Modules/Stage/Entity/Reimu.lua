module(..., package.seeall)

local M = class("Reimu",StageDefine.PlayerPrefab)
function M:ctor()
    M.super.ctor(self)

    self.animationController = StageDefine.ReimuAnimation.new()
    self:addScript(self.animationController)

    self.playerController = StageDefine.ReimuController.new()
    self:addScript(self.playerController)

    --Reimu子弹发射器
    local emitterController = self.emitter:getScript("EmitterController")
    emitterController.objectPrefab = StageDefine.ReimuBulletPrefab
    emitterController.shotInterval = 0.10
    emitterController.shotSpeed = cc.p(0,20)

    --添加两个僚机的实体
    self.gyoku1 = StageDefine.OnmyouGyoku.new()
    self.gyoku1:setName("GYOKU1")
    self:addChild(self.gyoku1)

    self.gyoku2 = StageDefine.OnmyouGyoku.new()
    self.gyoku2:setName("GYOKU2")
    self:addChild(self.gyoku2)

    ---
    self:addTo(THSTG.SceneManager.get(SceneType.STAGE).playerLayer)  
end


return M