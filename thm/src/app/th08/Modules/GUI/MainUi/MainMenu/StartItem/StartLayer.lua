module(..., package.seeall)
local SelectDifficultyLayer = require("Modules.GUI.MainUi.MainMenu.StartItem.Layer.SelectDifficultyLayer")
local SelectRoleLayer = require("Modules.GUI.MainUi.MainMenu.StartItem.Layer.SelectRoleLayer")
local M = {}
function M.create(params)
    --------Model--------
    local TITLE_MOVE_OFFSET_Y = 30

    local _uiTitle = nil
    local _selectDiffLayer = nil
    local _selectRoleLayer = nil

    local _varIsActionDone = nil

    local _varMoveBy = nil

    --------View--------
    local node = THSTG.SCENE.newScene()

    _selectRoleLayer = SelectRoleLayer.create()
    _selectRoleLayer:setVisible(false)
    _selectRoleLayer:setEnabled(false)
    node:addChild(_selectRoleLayer)

    _selectDiffLayer = SelectDifficultyLayer.create()
    _selectDiffLayer:setEnabled(true)
    node:addChild(_selectDiffLayer)


    _uiTitle = THSTG.UI.newSprite({
        x = display.cx,
        y = display.height,
        anchorPoint = THSTG.UI.POINT_CENTER_TOP,
        src = ResManager.getResSub(ResType.GUI,GUIType.MAIN_UI,"diff_title"),
    })
    _uiTitle:setPositionY(display.height + _uiTitle:getContentSize().height)
    node:addChild(_uiTitle)

    --------Control--------
    local function runTileAction(actions)
        
        table.insert(actions,cc.CallFunc:create(function() _varIsActionDone = true  end))
        local seqAction = cc.Sequence:create(actions)
        _varIsActionDone = false
        _uiTitle:runAction(seqAction)

    end
    function node.swapLayer(_,e,params)
        if not _varIsActionDone then
            return 
        end

        if e == EventType.STARTITEM_SELECTDIFF_SELECT then
            --的使能
            _selectRoleLayer:setVisible(true)
            _selectRoleLayer:setEnabled(true)
            _selectDiffLayer:setEnabled(false)
            local actions = {
                cc.MoveBy:create(0.2, cc.p(0,(_uiTitle:getContentSize().height+TITLE_MOVE_OFFSET_Y))),
                cc.MoveBy:create(0.2, cc.p(0,-(_uiTitle:getContentSize().height+TITLE_MOVE_OFFSET_Y)))    
            }
            runTileAction(actions)
            
        elseif e == EventType.STARTITEM_SELECTROLE_CANCEL then
            _selectRoleLayer:setVisible(false)
            _selectRoleLayer:setEnabled(false)
            _selectDiffLayer:setEnabled(true)
            local actions = {
                cc.MoveBy:create(0.2, cc.p(0,(_uiTitle:getContentSize().height+TITLE_MOVE_OFFSET_Y))),
                cc.MoveBy:create(0.2, cc.p(0,-(_uiTitle:getContentSize().height+TITLE_MOVE_OFFSET_Y)))
            }
            runTileAction(actions)
        elseif e == EventType.STARTITEM_SELECTDIFF_CANCEL then
            _selectDiffLayer:setEnabled(false)
            local actions = {
                cc.MoveBy:create(0.2, cc.p(0,(_uiTitle:getContentSize().height+TITLE_MOVE_OFFSET_Y))),
            }
            runTileAction(actions)
            --返回主菜单
            -- THSTG.Dispatcher.dispatchEvent(EventType.GAME_REPLACE_SCENE,{type = SceneType.MAIN_SCENE})
            
        end
    end

    function node.updateLayer()
        local actions = {
            -- cc.MoveBy:create(0.1, cc.p(0,(_uiTitle:getContentSize().height+TITLE_MOVE_OFFSET_Y))),
            -- cc.DelayTime:create(1.0),
            cc.MoveBy:create(0.1, cc.p(0,-(_uiTitle:getContentSize().height+TITLE_MOVE_OFFSET_Y)))
        }
        runTileAction(actions)
    end

    node:onNodeEvent("enter", function ()
        node.updateLayer()
        THSTG.Dispatcher.addEventListener(EventType.STARTITEM_SELECTDIFF_CANCEL,node.swapLayer)
        THSTG.Dispatcher.addEventListener(EventType.STARTITEM_SELECTDIFF_SELECT,node.swapLayer)
        THSTG.Dispatcher.addEventListener(EventType.STARTITEM_SELECTROLE_CANCEL,node.swapLayer)
        THSTG.Dispatcher.addEventListener(EventType.STARTITEM_SELECTROLE_SELECT,node.swapLayer)
	end)

    node:onNodeEvent("exit", function ()
        THSTG.Dispatcher.removeEventListener(EventType.STARTITEM_SELECTDIFF_CANCEL,node.swapLayer)
        THSTG.Dispatcher.removeEventListener(EventType.STARTITEM_SELECTDIFF_SELECT,node.swapLayer)
        THSTG.Dispatcher.removeEventListener(EventType.STARTITEM_SELECTROLE_CANCEL,node.swapLayer)
        THSTG.Dispatcher.removeEventListener(EventType.STARTITEM_SELECTROLE_SELECT,node.swapLayer)
    end)



    return node
end
return M