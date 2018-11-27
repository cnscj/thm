
Game = class("Game")

function Game:ctor()

end

function Game:run()
    if self:_onInit() then
        self:_onRun()
    end
end


function Game:createEnv(gameRoot)

    -------------------------
    --添加LUA包含路径
    local newPath = string.gsub(gameRoot, "%.", "/")    --转移
    package.path = package.path .. ';' .. newPath .. '/?.lua'

    --添加资源路径
    cc.FileUtils:getInstance():addSearchPath("src/" .. newPath .. "/")

    --子类初始化
    return self:_onEnv(gameRoot)

end

--[[以下函数由子类重载]]--
function Game:_onEnv(gameRoot)  

    --初始化游戏
    return true
end

function Game:_onInit()
    --初始化游戏
    return true
end

function Game:_onScene()
    return display.newScene()
end

function Game:_onRun()
    --创建场景
    local mainScene,transition = self:_onScene()

    --运行
    display.runScene(mainScene)
end

return Game
