module(..., package.seeall)

local M = class("MarisaBulletPrefab",StageDefine.PlayerBulletPrefab)
function M:ctor()
    M.super.ctor(self)

    self.animationController = StageDefine.MarisaBulletAnimation.new()
    self:addScript(self.animationController)
    
    self.bulletController = StageDefine.MarisaBulletController.new()
    self:addScript(self.bulletController)

    ----
    self:addTo(THSTG.SceneManager.get(SceneType.STAGE).barrageLayer)
end



return M