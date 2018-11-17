﻿local M = {}

function M.create(params)
    local scene = THSTG.SCENE.newScene()

    local layer = require("Modules.GUI.MainUi.MainMenu.MainMenuLayer").create(params)
    scene:addChild(layer)

    return scene
end

return M