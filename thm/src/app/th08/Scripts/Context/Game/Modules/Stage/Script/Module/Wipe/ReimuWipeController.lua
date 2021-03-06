local M = class("ReimuWipeController",StageDefine.WipeController)

function M:_onInit()
    M.super._onInit(self)
    -- self.__effectNode:setVisible(false)
    --灵梦组件
    self.reimuCtrl = nil

    --阴阳玉僚机
    self.wingman1 = nil
    self.wingman2 = nil

    --僚机的行为组件
    self._wingman1ActionComp = nil
    self._wingman2ActionComp = nil

end

function M:_onStart()
    M.super._onStart(self)
    --
    self.reimuCtrl = self:getScript("ReimuController")
    --取得僚机实体
    self.wingman1 = self:getEntity():findChild("GYOKU1")
    self.wingman2 = self:getEntity():findChild("GYOKU2")

    self._wingman1ActionComp = self.wingman1:getComponent("ActionComponent")
    self._wingman2ActionComp = self.wingman2:getComponent("ActionComponent")
end

function M:_onWipeOpen()
    M.super._onWipeOpen(self)
end

function M:_onWipeClose()
    M.super._onWipeClose(self)

end

return M