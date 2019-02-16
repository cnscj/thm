module(..., package.seeall)

local M = class("EnemyBullet",StageDefine.BulletPrefab)

function M:ctor()
    M.super.ctor(self)
    self:setName("ENEMY_BULLET")

    self.helthController = StageDefine.EnemyBulletHealth.new()
    self:addScript(self.helthController)

end

return M