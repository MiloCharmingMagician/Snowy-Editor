Include "source/defines.bmx"
Include "source/resources.bmx"
Include "source/map.bmx"
Include "source/map_data.bmx"
Include "source/system_error.bmx"

AppTitle = "Snowy Puzzle Islands Editor"
Graphics 800, 600

InitMap()

While Not AppTerminate()
Cls
UpdateMap()
DrawMap()
Flip
Wend
End