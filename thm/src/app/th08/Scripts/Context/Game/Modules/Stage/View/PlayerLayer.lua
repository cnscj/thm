module(..., package.seeall)

local M = {}
function M.create(params)
    -------Model-------
    -- local _eReimu = StageDefine.Reimu.new()
    local _eSakuya = StageDefine.Sakuya.new()
   
    -------View-------
    local node = THSTG.UI.newNode()
    -- node:addChild(_eReimu)
    node:addChild(_eSakuya)
    

    -------Controller-------
  
    local function updateFrame()
        -- StageDefine.TestSystem.move(_eYukari)
    end
 

    node:onNodeEvent("enter", function ()
        -- node:scheduleUpdateWithPriorityLua(updateFrame,0)
    end)

    node:onNodeEvent("exit", function ()
        -- node:unscheduleUpdate()
    end)
    
    return node
end

return M