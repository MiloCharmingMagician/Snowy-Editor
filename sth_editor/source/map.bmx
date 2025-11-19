Function InitMap()
    For i:Int = 0 To 1000 - 1
        mapWidth[i] = 40
        mapHeight[i] = 30
        worldType[i] = 0
    Next

If gameID = "sth1" Then currMapVersion = mapVersion1
If gameID = "sth2" Then currMapVersion = mapVersion2
If gameID = "sth3" Then currMapVersion = mapVersion3

If gameID = "sth1" Then episode = 0
If gameID = "sth2" Then episode = 1
If gameID = "sth3" Then episode = 2

LoadMap()

currWorldType = worldtype[0]

LoadResources()
LoadWorldResources()
End Function

Function DrawMap()
If img_background Then DrawImage(img_background, 0, 0)

For x=0 To mapWidth[currlv]-1
For y=0 To mapHeight[currlv]-1
Select mapData(currlv, x, y, 1)
Case 0'None
Case 373
If img_gem1 Then DrawImage(img_gem1,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
Case 374
If img_gem2 Then DrawImage(img_gem2,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
Case 375
If img_gem3 Then DrawImage(img_gem3,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
Case 376
If img_gem4 Then DrawImage(img_gem4,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
Case 377
If img_gem5 Then DrawImage(img_gem5,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
Case 378
If img_gem6 Then DrawImage(img_gem6,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
Case 0835
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("0",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0836
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("1",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0837
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("2",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0838
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("3",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0839
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("4",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0840
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("5",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0841
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("6",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0842
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("7",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0843
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("8",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0844
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("9",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0845
If img_arrow2 Then DrawImage(img_arrow2,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
Case 0846
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("10",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0847
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("11",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0848
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("12",scroll_x+x*tsize,scroll_y+y*tsize)
Case 0849
If img_hint Then DrawImage(img_hint,scroll_x+x*tsize-12,scroll_y+y*tsize-10)
DrawText("13",scroll_x+x*tsize,scroll_y+y*tsize)
Default'DEFAULT
DrawText("O"+mapData(currlv, x,y, 1),scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DebugLog("Object:"+mapData(currlv, x, y, 1))
End Select
Next
Next

For x=0 To mapWidth[currlv]-1
For y=0 To mapHeight[currlv]-1
Select mapData(currlv, x, y, 0)
Case 0'NONE
Case 1
If img_block_ground Then DrawImage(img_block_ground,scroll_x+x*tsize,scroll_y+y*tsize)
Case 2
If img_block2_ground Then DrawImage(img_block2_ground,scroll_x+x*tsize,scroll_y+y*tsize)
Case 3
If img_block_rock Then DrawImage(img_block_rock,scroll_x+x*tsize,scroll_y+y*tsize)
Case 4
If img_block_ground Then DrawImage(img_block_ground,scroll_x+x*tsize,scroll_y+y*tsize)
If img_ice1 Then DrawImage(img_ice1,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 5
If img_block2_ground Then DrawImage(img_block_ground,scroll_x+x*tsize,scroll_y+y*tsize)
If img_ice2 Then DrawImage(img_ice2,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 6
If img_ladder Then DrawImage(img_ladder,scroll_x+x*tsize,scroll_y+y*tsize)
Case 7
If img_hidden_ladder Then DrawImage(img_hidden_ladder,scroll_x+x*tsize,scroll_y+y*tsize)
Case 8
If img_hbar Then DrawImage(img_hbar,scroll_x+x*tsize,scroll_y+y*tsize)
Case 9
If img_exit Then DrawImage(img_exit,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 10
If img_exit_closed Then DrawImage(img_exit_closed,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 11
If img_hero Then DrawImage(img_hero,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 12'Tel-In1
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("1",scroll_x+x*tsize,scroll_y+y*tsize)
Case 13'Tel-In2
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("2",scroll_x+x*tsize,scroll_y+y*tsize)
Case 14'Tel-In3
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("3",scroll_x+x*tsize,scroll_y+y*tsize)
Case 15'Tel-In4
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("4",scroll_x+x*tsize,scroll_y+y*tsize)
Case 16'Tel-In5
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("5",scroll_x+x*tsize,scroll_y+y*tsize)
Case 17'Tel-In6
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("6",scroll_x+x*tsize,scroll_y+y*tsize)
Case 18'Tel-In7
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("7",scroll_x+x*tsize,scroll_y+y*tsize)
Case 19'Tel-In8
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("8",scroll_x+x*tsize,scroll_y+y*tsize)
Case 20'Tel-In9
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("9",scroll_x+x*tsize,scroll_y+y*tsize)
Case 21'Tel-In10
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("10",scroll_x+x*tsize,scroll_y+y*tsize)
Case 22'Tel-In11
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("11",scroll_x+x*tsize,scroll_y+y*tsize)
Case 23'Tel-In12
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("12",scroll_x+x*tsize,scroll_y+y*tsize)
Case 24'Tel-In13
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("13",scroll_x+x*tsize,scroll_y+y*tsize)
Case 25'Tel-In14
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("14",scroll_x+x*tsize,scroll_y+y*tsize)
Case 26'Tel-In15
If img_teleport_in Then DrawImage(img_teleport_in,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("15",scroll_x+x*tsize,scroll_y+y*tsize)
Case 27'Tel-Out1
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("1",scroll_x+x*tsize,scroll_y+y*tsize)
Case 28'Tel-Out2
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("2",scroll_x+x*tsize,scroll_y+y*tsize)
Case 29'Tel-Out3
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("3",scroll_x+x*tsize,scroll_y+y*tsize)
Case 30'Tel-Out4
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("4",scroll_x+x*tsize,scroll_y+y*tsize)
Case 31'Tel-Out5
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("5",scroll_x+x*tsize,scroll_y+y*tsize)
Case 32'Tel-Out6
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("6",scroll_x+x*tsize,scroll_y+y*tsize)
Case 33'Tel-Out7
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("7",scroll_x+x*tsize,scroll_y+y*tsize)
Case 34'Tel-Out8
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("8",scroll_x+x*tsize,scroll_y+y*tsize)
Case 35'Tel-Out9
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("9",scroll_x+x*tsize,scroll_y+y*tsize)
Case 36'Tel-Out10
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("10",scroll_x+x*tsize,scroll_y+y*tsize)
Case 37'Tel-Out11
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("11",scroll_x+x*tsize,scroll_y+y*tsize)
Case 38'Tel-Out12
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("12",scroll_x+x*tsize,scroll_y+y*tsize)
Case 39'Tel-Out13
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("13",scroll_x+x*tsize,scroll_y+y*tsize)
Case 40'Tel-Out14
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("14",scroll_x+x*tsize,scroll_y+y*tsize)
Case 41'Tel-Out15
If img_teleport_out Then DrawImage(img_teleport_out,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("15",scroll_x+x*tsize,scroll_y+y*tsize)
Case 142'MonsterGuard-Right
If img_monster_guard Then DrawImage(img_monster_guard,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 143'MonsterGuard-Left
If img_monster_guard_left Then DrawImage(img_monster_guard_left,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 144'MonsterGuard-Smart-Right
If img_monster_guard_smart_right Then DrawImage(img_monster_guard_smart_right,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 145'MonsterGuard-Smart
If img_monster_guard_smart Then DrawImage(img_monster_guard_smart,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 483'Score
If img_score Then DrawImage(img_score,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 484'Life
If img_live Then DrawImage(img_live,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 146'SmartMonster1
If img_monster_smart Then DrawImage(img_monster_smart,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("1",scroll_x+x*tsize,scroll_y+y*tsize)
Case 147'SmartMonster2
If img_monster_smart Then DrawImage(img_monster_smart,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("2",scroll_x+x*tsize,scroll_y+y*tsize)
Case 148'SmartMonster3
If img_monster_smart Then DrawImage(img_monster_smart,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("3",scroll_x+x*tsize,scroll_y+y*tsize)
Case 149'SmartMonster4
If img_monster_smart Then DrawImage(img_monster_smart,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("4",scroll_x+x*tsize,scroll_y+y*tsize)
Case 156'SmartMonster-Spawner
If img_monster_smart_spawner Then DrawImage(img_monster_smart_spawner,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("1",scroll_x+x*tsize,scroll_y+y*tsize)
Case 157'SmartMonster2-Spawner
If img_monster_smart_spawner Then DrawImage(img_monster_smart_spawner,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("2",scroll_x+x*tsize,scroll_y+y*tsize)
Case 158'SmartMonster3-Spawner
If img_monster_smart_spawner Then DrawImage(img_monster_smart_spawner,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("3",scroll_x+x*tsize,scroll_y+y*tsize)
Case 159'SmartMonster4-Spawner
If img_monster_smart_spawner Then DrawImage(img_monster_smart_spawner,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DrawText("4",scroll_x+x*tsize,scroll_y+y*tsize)
Case 268
If img_key Then DrawImage(img_key,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 269'Item-Trap
If img_trap Then DrawImage(img_trap,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 271'Item-Bomb
If img_bomb Then DrawImage(img_bomb,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 272'Item-Fakehero
If img_fakehero Then DrawImage(img_fakehero,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 587'Cover
If img_cover Then DrawImage(img_cover,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 266'Hammer
If img_hammerX Then DrawImage(img_hammerX,scroll_x+x*tsize-8,scroll_y+y*tsize-17)
Case 978'Preset1
If img_preset1 Then DrawImage(img_preset1,scroll_x+x*tsize,scroll_y+y*tsize)
Case 966'Preset2
If img_preset2 Then DrawImage(img_preset2,scroll_x+x*tsize,scroll_y+y*tsize)
Case 968'Preset3
If img_preset3 Then DrawImage(img_preset3,scroll_x+x*tsize,scroll_y+y*tsize)
Case 969'Preset4
If img_preset4 Then DrawImage(img_preset4,scroll_x+x*tsize,scroll_y+y*tsize)
Default'DEFAULT
DrawText("T"+mapData(currlv, x,y, 0),scroll_x+x*tsize-8,scroll_y+y*tsize-17)
DebugLog("Tile:"+mapData(currlv, x, y, 0))
End Select
Next
Next

If KeyDown(KEY_RIGHT) Then
    If camera_x = mapWidth[currlv]+1 Then
    Else

    Delay 40
    camera_x = camera_x + 1
    scroll_x = scroll_x - tsize
    EndIf
EndIf

If KeyDown(KEY_LEFT) Then
    Delay 40
    camera_x = camera_x - 1
    scroll_x = scroll_x + tsize
EndIf

If KeyDown(KEY_DOWN) Then
    If camera_y = mapHeight[currlv]+1 Then
    Else

    Delay 40
    camera_y = camera_y + 1
    scroll_y = scroll_y - tsize
    EndIf
EndIf

If KeyDown(KEY_UP) Then
    Delay 40
    camera_y = camera_y - 1
    scroll_y = scroll_y + tsize
EndIf

DrawRect (((scroll_x-scroll_x+MouseX())/tsize)*tsize)-1,(((scroll_y-scroll_y+MouseY())/tsize)*tsize)-1,tsize+2,tsize+2

If currlv = -1 Then currlv = levelCount
If currlv = levelCount+1 Then currlv = 0

If KeyHit(KEY_W) Then
worldtype[currlv] = worldtype[currlv] + 1 'Forwards worldtype
currWorldType = worldtype[currlv]
LoadWorldResources()
Cls
DebugLog("Worldtype: "+worldtype[currlv])
EndIf

If KeyHit(KEY_O) Then 
worldtype[currlv] = worldtype[currlv] - 1 'Backwards worldtypes
currWorldType = worldtype[currlv]
LoadWorldResources()
Cls
DebugLog("Worldtype: "+worldtype[currlv])
EndIf

DrawText "Worldtype:"+worldtype[currlv],0,20

DrawText "Episode:"+gameID,0,40
DrawText "Level:"+currlv,width-80,20

Select editmode
Case 0'Tilemode
Select tiletype
Case 1
DrawText "Tiletype:Block",0,0
Case 2
DrawText "Tiletype:Block2",0,0
Case 3
DrawText "Tiletype:Rock",0,0
Case 4
DrawText "Tiletype:Ice",0,0
Case 5
DrawText "Tiletype:Ladder",0,0
Case 6
DrawText "Tiletype:Hidden-Ladder",0,0
Case 7
DrawText "Tiletype:HBar",0,0
Case 8
DrawText "Tiletype:Exit",0,0
Case 9
DrawText "Tiletype:Exit-Closed",0,0
Case 10
DrawText "Tiletype:Hero",0,0
Case 11
DrawText "Tiletype:Teleport-In1",0,0
Case 12
DrawText "Tiletype:Teleport-In2",0,0
Case 13
DrawText "Tiletype:Teleport-In3",0,0
Case 14
DrawText "Tiletype:Teleport-In4",0,0
Case 15
DrawText "Tiletype:Teleport-In5",0,0
Case 16
DrawText "Tiletype:Teleport-In6",0,0
Case 17
DrawText "Tiletype:Teleport-In7",0,0
Case 18
DrawText "Tiletype:Teleport-In8",0,0
Case 19
DrawText "Tiletype:Teleport-In9",0,0
Case 20
DrawText "Tiletype:Teleport-In10",0,0
Case 21
DrawText "Tiletype:Teleport-In11",0,0
Case 22
DrawText "Tiletype:Teleport-In12",0,0
Case 23
DrawText "Tiletype:Teleport-In13",0,0
Case 24
DrawText "Tiletype:Teleport-In14",0,0
Case 25
DrawText "Tiletype:Teleport-In15",0,0
Case 26
DrawText "Tiletype:Teleport-Out1",0,0
Case 27
DrawText "Tiletype:Teleport-Out2",0,0
Case 28
DrawText "Tiletype:Teleport-Out3",0,0
Case 29
DrawText "Tiletype:Teleport-Out4",0,0
Case 30
DrawText "Tiletype:Teleport-Out5",0,0
Case 31
DrawText "Tiletype:Teleport-Out6",0,0
Case 32
DrawText "Tiletype:Teleport-Out7",0,0
Case 33
DrawText "Tiletype:Teleport-Out8",0,0
Case 34
DrawText "Tiletype:Teleport-Out9",0,0
Case 35
DrawText "Tiletype:Teleport-Out10",0,0
Case 36
DrawText "Tiletype:Teleport-Out11",0,0
Case 37
DrawText "Tiletype:Teleport-Out12",0,0
Case 38
DrawText "Tiletype:Teleport-Out13",0,0
Case 39
DrawText "Tiletype:Teleport-Out14",0,0
Case 40
DrawText "Tiletype:Teleport-Out15",0,0
Case 41
DrawText "Tiletype:Stoneman",0,0
Case 42
DrawText "Tiletype:Score",0,0
Case 43
DrawText "Tiletype:Monster-Smart1",0,0
Case 44
DrawText "Tiletype:Key",0,0
Case 45
DrawText "Tiletype:Item-Trap",0,0
Case 46
DrawText "Tiletype:Smart-Stoneman",0,0
Case 47
DrawText "Tiletype:Monster-Smart2",0,0
Case 48
DrawText "Tiletype:Monster-Smart-Spawner",0,0
Case 49
DrawText "Tiletype:Item-Bomb",0,0
Case 50
DrawText "Tiletype:Item-Fakehero",0,0
Case 51
DrawText "Tiletype:Monster-Smart2-Spawner",0,0
Case 52
DrawText "Tiletype:Monster-Smart3-Spawner",0,0
Case 53
DrawText "Tiletype:Monster-Smart3",0,0
Case 54
DrawText "Tiletype:Monster-Smart4",0,0
Case 55
DrawText "Tiletype:Monster-Smart4-Spawner",0,0
Case 56
DrawText "Tiletype:Cover",0,0
Case 57
DrawText "Tiletype:Hammer",0,0
Case 58
DrawText "Tiletype:Stoneman-Right",0,0
Case 59
DrawText "Tiletype:Smart-Stoneman-Left",0,0
Case 60
DrawText "Tiletype:Preset1",0,0
Case 61
DrawText "Tiletype:Preset2",0,0
Case 62
DrawText "Tiletype:Preset3",0,0
Case 63
DrawText "Tiletype:Preset4",0,0
End Select

Case 1'Objectmode
Select tiletype
Case 1
DrawText "Tiletype:Gem1",0,0
Case 2
DrawText "Tiletype:Gem2",0,0
Case 3
DrawText "Tiletype:Gem3",0,0
Case 4
DrawText "Tiletype:Gem4",0,0
Case 5
DrawText "Tiletype:Gem5",0,0
Case 6
DrawText "Tiletype:Gem6",0,0
Case 7
DrawText "Tiletype:Hint1",0,0
Case 8
DrawText "Tiletype:Hint2",0,0
Case 9
DrawText "Tiletype:Hint3",0,0
Case 10
DrawText "Tiletype:Hint4",0,0
Case 11
DrawText "Tiletype:Hint5",0,0
Case 12
DrawText "Tiletype:Hint6",0,0
Case 13
DrawText "Tiletype:Hint7",0,0
Case 14
DrawText "Tiletype:Hint8",0,0
Case 15
DrawText "Tiletype:Hint9",0,0
Case 16
DrawText "Tiletype:Arrow2",0,0
Case 17
DrawText "Tiletype:Hint10",0,0
Case 18
DrawText "Tiletype:Hint11",0,0
Case 19
DrawText "Tiletype:Hint12",0,0
Case 20
DrawText "Tiletype:Hint13",0,0
End Select
End Select
End Function

Function UpdateMap()
Local mx:Int = (scroll_x-scroll_x-scroll_x+MouseX())/tsize
Local my:Int = (scroll_y-scroll_y-scroll_y+MouseY())/tsize

If gameID = "sth1" Then currMapVersion = mapVersion1
If gameID = "sth2" Then currMapVersion = mapVersion2
If gameID = "sth3" Then currMapVersion = mapVersion3

If camera_x = 0 Or camera_x = -1 Then
    camera_x = 0
    scroll_x = 0
EndIf

If camera_y = 0 Or camera_y = -1 Then
    scroll_y = 0
    camera_y = 0
EndIf

If currLv=-1 Then currLv = LevelCount
If currLv=1000 Then currLv = 0

'control editmode
If editmode=2 Then editmode=0
If editmode=-1 Then editmode=1
'control worldtype
If worldtype[currlv]=-1 Then worldtype[currlv]=0

Select editmode
Case 0'Tilemode
If tiletype=0 Or tiletype=-1 Then tiletype=63
If tiletype=64 Then tiletype=1
Case 1'Objectmode
If tiletype=0 Or tiletype=-1 Then tiletype=20
If tiletype=21 Then tiletype=1
End Select

If KeyHit(KEY_0) Then
tiletype=1
editmode=editmode+1
EndIf

If KeyHit(KEY_1) Then tiletype=tiletype-1
If KeyHit(KEY_2) Then tiletype=tiletype+1

 If KeyHit(KEY_N) Then
       If currLv=levelCount-1 Then currLv=-1
       currLv=currLv+1
       DebugLog("Level: "+Int(currLv))
       DebugLog("World: "+Int(worldtype[currLv]))
       currWorldType = worldtype[currLv]
       LoadWorldResources()

       'For j:Int = 0 To 5300 - 1
       '    DebugLog("Flag"+Int(j)+": "+Int(flags[currLv, j]))
       'Next
   EndIf

   If KeyHit(KEY_P) Then
       DebugLog("Level: "+Int(currLv))
       If currLv=0 Then currLv=levelCount
       currLv=currLv-1
       currWorldType = worldtype[currLv]
       LoadWorldResources()
   EndIf

   'Map Data
   'Saving Map Data
   If KeyHit(KEY_S) Then SaveMap()
   'Make New Map Pack
   If KeyHit(KEY_M) Then CreateMapPack()

'Loading Map Data
If KeyHit(KEY_L) Then
    LoadMap()
    currWorldType = worldType[0]
    LoadWorldResources()
    Cls
EndIf

If episode = 3 Then episode = 0
If episode = -1 Then episode = 2

'Change GameID
If KeyHit(KEY_E) Then
     episode = episode + 1
     
     Select episode
     Case -1
         gameID = "sth3"
         LoadResources()
         LoadWorldResources()
         Cls
         episode = 2
     Case 0
         gameID = "sth1"
         LoadResources()
         LoadWorldResources()
         Cls
     Case 1
         gameID = "sth2"
         LoadResources()
         LoadWorldResources()
         Cls
     Case 2
         gameID = "sth3"
         LoadResources()
         LoadWorldResources()
         Cls
     Case 3
         episode = 0
         gameID = "sth1"
         LoadResources()
         LoadWorldResources()
         Cls
     End Select

     DebugLog(episode)
EndIf

'place tile
If MouseDown(MOUSE_LEFT) Then
Select editmode
Case 0'Tilemode
If mapData(currlv, mapWidth[currlv]+1, mapHeight[currlv]+1, 0) Then
Else
Select tiletype
Case 1
DebugLog "Placed Tile:Block"
mapData(currlv, mx,my, 0) = 1
Case 2
mapData(currlv, mx,my, 0) = 2
DebugLog "Placed Tile:Block2"
Case 3
mapData(currlv, mx,my, 0) = 3
DebugLog "Placed Tile:Rock"
Case 4
mapData(currlv, mx,my, 0) = 4
DebugLog "Placed Tile:Ice"
Case 5
mapData(currlv, mx,my, 0) = 6
DebugLog "Placed Tile:Ladder"
Case 6
mapData(currlv, mx,my, 0) = 7
DebugLog "Placed Tile:Hidden-Ladder"
Case 7
mapData(currlv, mx,my, 0) = 8
DebugLog "Placed Tile:HBar"
Case 8
mapData(currlv, mx,my, 0) = 9
DebugLog "Placed Tile:Exit"
Case 9
mapData(currlv, mx,my, 0) = 10
DebugLog "Placed Tile:Exit-Closed"
Case 10
mapData(currlv, mx,my, 0) = 11
DebugLog "Placed Tile:Hero"
Case 11
mapData(currlv, mx,my, 0) = 12
DebugLog "Placed Tile:Teleport-In1"
Case 12
mapData(currlv, mx,my, 0) = 13
DebugLog "Placed Tile:Teleport-In2"
Case 13
mapData(currlv, mx,my, 0) = 14
DebugLog "Placed Tile:Teleport-In3"
Case 14
mapData(currlv, mx,my, 0) = 15
DebugLog "Placed Tile:Teleport-In4"
Case 15
mapData(currlv, mx,my, 0) = 16
DebugLog "Placed Tile:Teleport-In5"
Case 16
mapData(currlv, mx,my, 0) = 17
DebugLog "Placed Tile:Teleport-In6"
Case 17
mapData(currlv, mx,my, 0) = 18
DebugLog "Placed Tile:Teleport-In7"
Case 18
mapData(currlv, mx,my, 0) = 19
DebugLog "Placed Tile:Teleport-In8"
Case 19
mapData(currlv, mx,my, 0) = 20
DebugLog "Placed Tile:Teleport-In9"
Case 20
mapData(currlv, mx,my, 0) = 21
DebugLog "Placed Tile:Teleport-In10"
Case 21
mapData(currlv, mx,my, 0) = 22
DebugLog "Placed Tile:Teleport-In11"
Case 22
mapData(currlv, mx,my, 0) = 23
DebugLog "Placed Tile:Teleport-In12"
Case 23
mapData(currlv, mx,my, 0) = 24
DebugLog "Placed Tile:Teleport-In13"
Case 24
mapData(currlv, mx,my, 0) = 25
DebugLog "Placed Tile:Teleport-In14"
Case 25
mapData(currlv, mx,my, 0) = 26
DebugLog "Placed Tile:Teleport-In15"
Case 26
mapData(currlv, mx,my, 0) = 27
DebugLog "Placed Tile:Teleport-Out1"
Case 27
mapData(currlv, mx,my, 0) = 28
DebugLog "Placed Tile:Teleport-Out2"
Case 28
mapData(currlv, mx,my, 0) = 29
DebugLog "Placed Tile:Teleport-Out3"
Case 29
mapData(currlv, mx,my, 0) = 30
DebugLog "Placed Tile:Teleport-Out4"
Case 30
mapData(currlv, mx,my, 0) = 31
DebugLog "Placed Tile:Teleport-Out5"
Case 31
mapData(currlv, mx,my, 0) = 32
DebugLog "Placed Tile:Teleport-Out6"
Case 32
mapData(currlv, mx,my, 0) = 33
DebugLog "Placed Tile:Teleport-Out7"
Case 33
mapData(currlv, mx,my, 0) = 34
DebugLog "Placed Tile:Teleport-Out8"
Case 34
mapData(currlv, mx,my, 0) = 35
DebugLog "Placed Tile:Teleport-Out9"
Case 35
mapData(currlv, mx,my, 0) = 36
DebugLog "Placed Tile:Teleport-Out10"
Case 36
mapData(currlv, mx,my, 0) = 37
DebugLog "Placed Tile:Teleport-Out11"
Case 37
mapData(currlv, mx,my, 0) = 38
DebugLog "Placed Tile:Teleport-Out12"
Case 38
mapData(currlv, mx,my, 0) = 39
DebugLog "Placed Tile:Teleport-Out13"
Case 39
mapData(currlv, mx,my, 0) = 40
DebugLog "Placed Tile:Teleport-Out14"
Case 40
mapData(currlv, mx,my, 0) = 41
DebugLog "Placed Tile:Teleport-Out15"
Case 41
mapData(currlv, mx,my, 0) = 142
DebugLog "Placed Tile:Stoneman-Right"
Case 42
mapData(currlv, mx,my, 0) = 483
DebugLog "Placed Tile:Score"
Case 43
mapData(currlv, mx,my, 0) = 146
DebugLog "Placed Tile:Monster-Smart1"
Case 44
mapData(currlv, mx,my, 0) = 268
DebugLog "Placed Tile:Key"
Case 45
mapData(currlv, mx,my, 0) = 269
DebugLog "Placed Tile:Item-Cage"
Case 46
mapData(currlv, mx,my, 0) = 145
DebugLog "Placed Tile:Smart-Stoneman-Left"
Case 47
mapData(currlv, mx,my, 0) = 147
DebugLog "Placed Tile:Monster-Smart2"
Case 48
mapData(currlv, mx,my, 0) = 156
DebugLog "Placed Tile:Monster-Smart-Spawner"
Case 49
mapData(currlv, mx,my, 0) = 271
DebugLog "Placed Tile:Item-Bomb"
Case 50
mapData(currlv, mx,my, 0) = 272
DebugLog "Placed Tile:Item-Fakehero"
Case 51
mapData(currlv, mx,my, 0) = 157
DebugLog "Placed Tile:Monster-Smart2-Spawner"
Case 52
mapData(currlv, mx,my, 0) = 158
DebugLog "Placed Tile:Monster-Smart3-Spawner"
Case 53
mapData(currlv, mx,my, 0) = 148
DebugLog "Placed Tile:Monster-Smart3"
Case 54
mapData(currlv, mx,my, 0) = 149
DebugLog "Placed Tile:Monster-Smart4"
Case 55
mapData(currlv, mx,my, 0) = 159
DebugLog "Placed Tile:Monster-Smart4-Spawner"
Case 56
mapData(currlv, mx,my, 0) = 587
DebugLog "Placed Tile:Cover"
Case 57
mapData(currlv, mx,my, 0) = 266
DebugLog "Placed Tile:Hammer"
Case 58
mapData(currlv, mx,my, 0) = 143
DebugLog "Placed Tile:Stoneman-Right"
Case 59
mapData(currlv, mx,my, 0) = 144
DebugLog "Placed Tile:Smart-Stoneman-Left"
Case 60
mapData(currlv, mx,my, 0) = 966
DebugLog "Placed Tile:Preset1"
Case 61
mapData(currlv, mx,my, 0) = 967
DebugLog "Placed Tile:Preset2"
Case 62
mapData(currlv, mx,my, 0) = 968
DebugLog "Placed Tile:Preset3"
Case 63
mapData(currlv, mx,my, 0) = 969
DebugLog "Placed Tile:Preset4"
End Select
EndIf
Case 1'Objectmode
If mapData(currlv, mapWidth[currlv]+1, mapHeight[currlv]+1, 1) Then
Else
Select tiletype
Case 1
mapData(currlv, mx,my, 1) = 373
DebugLog "Placed Tile:Gem1"
Case 2
mapData(currlv, mx,my, 1) = 374
DebugLog "Placed Tile:Gem2"
Case 3
mapData(currlv, mx,my, 1) = 375
DebugLog "Placed Tile:Gem3"
Case 4
mapData(currlv, mx,my, 1) = 376
DebugLog "Placed Tile:Gem4"
Case 5
mapData(currlv, mx,my, 1) = 377
DebugLog "Placed Tile:Gem5"
Case 6
mapData(currlv, mx,my, 1) = 378
DebugLog "Placed Tile:Gem6"
Case 7
mapData(currlv, mx,my, 1) = 0836
DebugLog "Placed Tile:Hint1"
Case 8
mapData(currlv, mx,my, 1) = 0837
DebugLog "Placed Tile:Hint2"
Case 9
mapData(currlv, mx,my, 1) = 0838
DebugLog "Placed Tile:Hint3"
Case 10
mapData(currlv, mx,my, 1) = 0839
DebugLog "Placed Tile:Hint4"
Case 11
mapData(currlv, mx,my, 1) = 0840
DebugLog "Placed Tile:Hint5"
Case 12
mapData(currlv, mx,my, 1) = 0841
DebugLog "Placed Tile:Hint6"
Case 13
mapData(currlv, mx,my, 1) = 0842
DebugLog "Placed Tile:Hint7"
Case 14
mapData(currlv, mx,my, 1) = 0843
DebugLog "Placed Tile:Hint8"
Case 15
mapData(currlv, mx,my, 1) = 0844
DebugLog "Placed Tile:Hint9"
Case 16
mapData(currlv, mx,my, 1) = 0845
DebugLog "Placed Tile:Arrow2"
Case 17
mapData(currlv, mx,my, 1) = 0846
DebugLog "Placed Tile:Hint10"
Case 18
mapData(currlv, mx,my, 1) = 0847
DebugLog "Placed Tile:Hint11"
Case 19
mapData(currlv, mx,my, 1) = 0848
DebugLog "Placed Tile:Hint12"
Case 20
mapData(currlv, mx,my, 1) = 0849
DebugLog "Placed Tile:Hint13"
End Select
EndIf
End Select
EndIf

'remove tile
If MouseDown(MOUSE_RIGHT) Then
Select editmode
Case 0'Tilemode
If Not mapData(currlv, mx,my, 0) = 0 Then
DebugLog "Removed Tile"
mapData(currlv, mx,my, 0) = 0
EndIf
Case 1'Objectmode
If Not mapData(currlv, mx,my, 1) = 0 Then
DebugLog "Removed Object"
mapData(currlv, mx,my, 1) = 0
EndIf
End Select
EndIf
End Function

Function EndMap()
End Function