
module(..., package.seeall)

local M = {}
function M.create(params)
    -------Model-------
  
   
    -------View-------
    local node = THSTG.UI.newNode()

  
    -------Controller-------
    node:onNodeEvent("enter", function ()
        
    end)

    node:onNodeEvent("exit", function ()
        
    end)
    
    return node
end

return M