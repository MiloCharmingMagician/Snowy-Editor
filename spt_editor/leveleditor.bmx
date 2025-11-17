Include "source/defines.bmx"
Include "source/resources.bmx"
Include "source/config.bmx"
Include "source/map.bmx"
Include "source/map_data.bmx"
Include "source/system_error.bmx"

AppTitle = "Snowy Space Trip Editor"
Graphics 800, 600

InitMap()

While Not AppTerminate()
Cls

If State=2 Then State=0

If KeyHit(KEY_G) Then State=State+1

Select State
Case 0'Map
UpdateMap()
DrawMap()
Case 1'Config
UpdateConfig()
DrawConfig()
End Select

Flip
Wend
End