module(..., package.seeall)
local M = class("FightModule", THSTG.CORE.MODULE)

function M:_initRealView()
    self:setViewParent(LayerManager.guiLayer)
    
  
end

function M:_onInit()

end


return M