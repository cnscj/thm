module("EVENTTYPE", package.seeall)

--MVC模块
MVC_MODULE_OPENED = UIDUtil.getEventUID()
MVC_MODULE_CLOSED = UIDUtil.getEventUID()
MVC_OPEN_MODULE = UIDUtil.getEventUID()
MVC_CLOSE_MODULE = UIDUtil.getEventUID()

--ECS模块
ECS_ENTITY_ADDED = UIDUtil.getEventUID()
ECS_ENTITY_DESTROY = UIDUtil.getEventUID()
ECS_ENTITY_REMOVED = UIDUtil.getEventUID()
ECS_SYSTEM_ADDED = UIDUtil.getEventUID()
ECS_SYSTEM_REMOVEd = UIDUtil.getEventUID()