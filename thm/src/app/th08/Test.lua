------------------------------------------------------------------
--调试版本下的全局变量
------------------------------------------------------------------

--测试状态用来隐藏测试按钮
THSTG.__HIDE_TEST__ = false

--每个人定义一个自己的类型，用于屏蔽其他人写的打印log，为0时打印所有
THSTG.__PRINT_TYPE__ = 0

--调用print时是否显示文件和等号
THSTG.__PRINT_WITH_FILE_LINE__ = false

--------------------------------------------------
_G.print = THSTG.print
_G.dump = THSTG.dumpTable
_G.debugUI = THSTG.debugUI