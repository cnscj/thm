--玩家实体
module(..., package.seeall)
local BaseEntity = require("Models.Entity.BaseEntity")
local M = class("PlayerEntity", BaseEntity)
function M:ctor()
    self.roleType = false   --人物类型
    self.speed = 0          --速度
    
end

return M
