module("EventType", package.seeall)

-----公共事件--------------------------
PUBLIC_MODULE_OPENED = UIDUtil.getEventUID()--有模块打开了
PUBLIC_MODULE_CLOSED = UIDUtil.getEventUID()--有模块关闭了
PUBLIC_MODULE_OPENING = UIDUtil.getEventUID()--有模块打开即将打开

PUBLIC_OPEN_MODULE = UIDUtil.getEventUID()--打开模块
PUBLIC_CLOSE_MODULE = UIDUtil.getEventUID()--关闭模块

--开始菜单项
STARTITEM_SELECTDIFF_SELECT = UIDUtil.getEventUID()
STARTITEM_SELECTDIFF_CANCEL = UIDUtil.getEventUID()
STARTITEM_SELECTROLE_SELECT = UIDUtil.getEventUID()
STARTITEM_SELECTROLE_CANCEL = UIDUtil.getEventUID()


--加载模块
LOADING_EXECUTE = UIDUtil.getEventUID()
LOADING_BUSY = UIDUtil.getEventUID()


--舞台模块
STAGE_ENTER = UIDUtil.getEventUID()
STAGE_EXIT = UIDUtil.getEventUID()

STAGE_ADD_ENTITY = UIDUtil.getEventUID()
STAGE_REMOVE_ENTITY = UIDUtil.getEventUID()

--实体事件

--测试事件
STAGE_TEST_STATUS_UPDATE = UIDUtil.getEventUID()

--View事件
STAGE_VIEW_PREEFFECT_PLAYER_SPELLCARDATTACK = UIDUtil.getEventUID()