
local M = class("HealthBarController",THSTG.ECS.Script)

function M:_onInit()
    M.super._onInit(self)
    self.healthBar = THSTG.UI.newRadialProgressBar({
        x = 0,
        y = 0,
        anchorPoint = THSTG.UI.POINT_CENTER,
        style = {
           --背景皮肤
           bgSkin = {
              src = ResManager.getUIRes(UIType.PROGRESS_BAR, "prog_radial_bg"),
              
           },
           --进度条皮肤
           progressSkin = {
              src = ResManager.getUIRes(UIType.PROGRESS_BAR, "prog_radial_hp"),
           }
        }
    })
end

function M:refresh(val,maxVal)
    self.healthBar:refresh(val,maxVal)
end

function M:_onAdded(params)
    local entity = self:getEntity()

    self.healthBar:setPosition(cc.p(entity:getContentSize().width/2,entity:getContentSize().height/2))
    entity:addChild(self.healthBar)
end

function M:_onRemoved(params)
    self.healthBar:removeFromParent()
end

return M