Include "source\defines.bmx"
Include "source\resources.bmx"
Include "source\map.bmx"
Include "source\mapdata.bmx"
Include "source\config.bmx"

AppTitle = "Snowy Treasure Hunter Editor"
Graphics 800, 600

InitMap()

While Not AppTerminate()
Cls
UpdateMap()
DrawMap()
Flip
Wend
End