Include "source\defines.bmx"
Include "source\resources.bmx"
Include "source\map.bmx"
Include "source\map_data.bmx"
Include "source\system_error.bmx"

AppTitle = "Snowy Editor"
Graphics 800, 560

InitMap()

While Not AppTerminate()
Cls

UpdateMap()
DrawMap()
Flip
Wend
End