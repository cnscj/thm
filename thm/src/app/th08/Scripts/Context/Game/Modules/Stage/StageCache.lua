module(..., package.seeall)
local ERoleType = Const.Stage.ERoleType
local EModeType = Const.Stage.EModeType
--
local _bIsInStage = false
local _bIsTeam = false
local _eGroupType = false
local _eRoleType = ERoleType.Reimu
local _eStageMode = EModeType.BossRush

function setGroupType(val)
    _eGroupType = val
end

function getGroupType()
    return _eGroupType
end

function setRoleType(val)
    _eRoleType = val
end

function getRoleType()
    return _eRoleType
end

function isTeam()
    return _bIsTeam
end

function isInStage()
    return _bIsInStage
end

function setInStage(state)
    _bIsInStage = state
end
function getStageMode()
    return _eStageMode
end

function setStageMode(mode)
    _eStageMode = mode
end

---

function getStageId()
    return 4
end

function getMapId()
    return getStageId()
end

----
local _allEntities = {}
local _bossEntity = nil
local _playerEntity = nil
local _enemyBullet = {}
local _playerBuller = {}

function setBossEntity(entity)
    _bossEntity = entity
end
function getBossEntity()
    local bossEntitys = THSTG.ECSManager.findEntitiesByName("BOSS")
    if next(bossEntitys) then
        return bossEntitys[1]
    end
    return nil
end
function setPlayerEntity(entity)
    _playerEntity = entity
end

function getPlayerEntity()
    return _playerEntity
end




----
function clear()
    
end