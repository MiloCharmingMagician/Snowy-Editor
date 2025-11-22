Include "source\defines.bmx"
Include "source\resources.bmx"
Include "source\map.bmx"
Include "source\mapdata.bmx"
Include "source\config.bmx"

Select gameID
Case "sth1"
    AppTitle = "Snowy Treasure Hunter Editor"
Case "sth2"
    AppTitle = "Snowy Treasure Hunter 2 Editor"
Case "sth3"
    AppTitle = "Snowy Treasure Hunter 3 Editor"
Default
End Select

Graphics 800, 600

InitMap()

While Not AppTerminate()
Cls
UpdateMap()
DrawMap()
Flip
Wend
End