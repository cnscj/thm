module(..., package.seeall)

local M = class("BulletEntity", StageDefine.MovableEntity)
function M:ctor()
    M.super.ctor(self)
    
end

return M
