Function InitMap()
    levelCount = 1

    For i:Int = 0 To 1000 - 1
        map_width[i] = 19
        map_height[i] = 13
        worldType[i] = 0
    Next

    databaseItem[0] = 1
    databaseItem[1] = 1

    LoadResources()
End Function

Function DrawMap()
   If img_background Then DrawImage(img_background, 0, 0)

   For x=0 To map_width[currLv]-1
      For y=0 To map_height[currLv]-1
         Select map(currLv, x, y)
            Case 0'NONE
            Case 1
               If img_platform1 Then DrawImage(img_platform1,x*tsize, y*tsize)
            Case 11
               If img_wall1 Then DrawImage(img_wall1,x*tsize, y*tsize)
            Case 21
               If img_bigwall Then DrawImage(img_bigwall,x*tsize-56, y*tsize-40)
            Case 22
               If img_ghostwall Then DrawImage(img_ghostwall,x*tsize, y*tsize)
            Default
               DrawText("T:"+Int(map(currLv, x, y)),x*tsize-8, y*tsize-17)
               DebugLog("Tile:"+map(currLv, x, y))
         End Select

         Select map2(currLv, x, y)
            Case 0'NONE
            Case 31
               If img_hero Then DrawImage(img_hero, x*tsize, y*tsize-17)
            Case 41 
               If img_stone Then DrawImage(img_stone, x*tsize, y*tsize)
            Case 51
               If img_exit Then DrawImage(img_exit, x*tsize, y*tsize)
            Case 101 
               If img_door_1 Then DrawImage(img_door_1, x*tsize, y*tsize)
            Case 102 
               If img_door_2 Then DrawImage(img_door_2, x*tsize, y*tsize)
            Case 103 
               If img_door_3 Then DrawImage(img_door_3, x*tsize, y*tsize)
            Case 201
               If img_key_1 Then DrawImage(img_key_1, x*tsize, y*tsize)
            Case 202
               If img_key_2 Then DrawImage(img_key_2, x*tsize, y*tsize)
            Case 203
               If img_key_3 Then DrawImage(img_key_3, x*tsize, y*tsize)
            Case 301
               If img_teleport_1 Then DrawImage(img_teleport_1, x*tsize, y*tsize)
            Case 302
               If img_teleport_2 Then DrawImage(img_teleport_2, x*tsize, y*tsize)
            Case 303
               If img_teleport_3 Then DrawImage(img_teleport_3, x*tsize, y*tsize)
            Case 304
               If img_teleport_4 Then DrawImage(img_teleport_4, x*tsize, y*tsize)
            Case 305
               If img_teleport_5 Then DrawImage(img_teleport_5, x*tsize, y*tsize)
            Case 401
               If img_move_4 Then DrawImage(img_move_4, x*tsize, y*tsize)
            Case 402
               If img_move_d Then DrawImage(img_move_d, x*tsize, y*tsize)
            Case 403
               If img_move_l Then DrawImage(img_move_l, x*tsize, y*tsize)
            Case 404
               If img_move_lr Then DrawImage(img_move_lr, x*tsize, y*tsize)
            Case 405
               If img_move_r Then DrawImage(img_move_r, x*tsize, y*tsize)
            Case 406
               If img_move_u Then DrawImage(img_move_u, x*tsize, y*tsize)
            Case 407
               If img_move_ud Then DrawImage(img_move_ud, x*tsize, y*tsize)
            Case 501
               If img_conveyor_ud Then DrawImage(img_conveyor_ud, x*tsize, y*tsize)
            Case 502
               If img_conveyor_lr Then DrawImage(img_conveyor_lr, x*tsize, y*tsize)
            Case 503
               If img_conveyor_ud_f Then DrawImage(img_conveyor_ud_f, x*tsize, y*tsize)
            Case 504
               If img_conveyor_lr_f Then DrawImage(img_conveyor_lr_f, x*tsize, y*tsize)
            Case 601
               If img_spanner Then DrawImage(img_spanner, x*tsize, y*tsize)
            Case 701
               If img_item1 Then DrawImage(img_item1, x*tsize, y*tsize)
            Case 702
               If img_item2 Then DrawImage(img_item2, x*tsize, y*tsize)
            Case 703
               If img_item3 Then DrawImage(img_item3, x*tsize, y*tsize)
            Case 704
               If img_item4 Then DrawImage(img_item4, x*tsize, y*tsize)
            Case 705
               If img_item5 Then DrawImage(img_item5, x*tsize, y*tsize)
            Default
               DrawText("O:"+Int(map2(currLv, x, y)),x*tsize-8, y*tsize-17)
               DebugLog("Object:"+map2(currLv, x, y))
         End Select
      Next
   Next

   DrawRect (((MouseX())/tsize)*tsize+10),(((MouseY())/tsize)*tsize+10),tsize+2,tsize+2
   DrawText "X: "+Int((MouseX())/tsize), 0, 50
   DrawText "Y: "+Int((MouseY())/tsize), 0, 60

   If KeyHit(KEY_W) Then 
      If worldType[currLv] = 4 Then worldType[currLv] = -1
      worldtype[currLv] = worldtype[currLv] + 1 'Forwards worldtype
      currWorldType = worldType[currLv]
      LoadWorldResources()
      Cls
      DebugLog("Worldtype: "+worldtype[currLv])
   EndIf

   If KeyHit(KEY_D) Then
      If worldType[currLv] = 0 Then worldType[currLv] = 5
      worldtype[currLv] = worldtype[currLv] - 1 'Backwards worldtypes
      currWorldType = worldType[currLv]
      LoadWorldResources()
      Cls
      DebugLog("Worldtype: "+worldtype[currLv])
   EndIf

   DrawText "Worldtype:"+worldtype[currLv],0,20

   Select editmode
      Case 0'Tilemode
         Select databaseItem[editmode]
            Case 1
               DrawText "Tiletype: Platform", 0, 0
            Case 2
               DrawText "Tiletype: Wall", 0, 0
            Case 3
               DrawText "Tiletype: Ghost Wall", 0, 0
            Case 4
               DrawText "Tiletype: Big Wall", 0, 0
            Default
               DrawText "Tiletype: "+Int(tiletype), 0, 0
         End Select

      Case 1'Objectmode
         Select databaseItem[editmode]
            Case 1
               DrawText "ObjectType: Hero", 0, 0
            Case 2
               DrawText "ObjectType: Stone", 0, 0
            Case 3
               DrawText "ObjectType: Exit", 0, 0
            Case 4
               DrawText "ObjectType: Door 1", 0, 0
            Case 5
               DrawText "ObjectType: Door 2", 0, 0
            Case 6
               DrawText "ObjectType: Door 3", 0, 0
            Case 7
               DrawText "ObjectType: Key 1", 0, 0
            Case 8
               DrawText "ObjectType: Key 2", 0, 0
            Case 9
               DrawText "ObjectType: Key 3", 0, 0
            Case 10
               DrawText "ObjectType: Teleport 1", 0, 0
            Case 11
               DrawText "ObjectType: Teleport 2", 0, 0
            Case 12
               DrawText "ObjectType: Teleport 3", 0, 0
            Case 13
               DrawText "ObjectType: Teleport 4", 0, 0
            Case 14
               DrawText "ObjectType: Teleport 5", 0, 0
            Case 15
               DrawText "ObjectType: Move 1", 0, 0
            Case 16
               DrawText "ObjectType: Move 2", 0, 0
            Case 17
               DrawText "ObjectType: Move 3", 0, 0
            Case 18
               DrawText "ObjectType: Move 4", 0, 0
            Case 19
               DrawText "ObjectType: Move 5", 0, 0
            Case 20
               DrawText "ObjectType: Move 6", 0, 0
            Case 21
               DrawText "ObjectType: Move 7", 0, 0
            Case 22
               DrawText "ObjectType: Conveyor 1", 0, 0
            Case 22
               DrawText "ObjectType: Conveyor 1", 0, 0
            Case 23
               DrawText "ObjectType: Conveyor 2", 0, 0
            Case 24
               DrawText "ObjectType: Conveyor 3", 0, 0
            Case 25
               DrawText "ObjectType: Conveyor 4", 0, 0
            Case 26
               DrawText "ObjectType: Spanner", 0, 0
            Case 27
               DrawText "ObjectType: Item 1", 0, 0
            Case 28
               DrawText "ObjectType: Item 2", 0, 0
            Case 29
               DrawText "ObjectType: Item 3", 0, 0
            Case 30
               DrawText "ObjectType: Item 4", 0, 0
            Case 31
               DrawText "ObjectType: Item 5", 0, 0
            Default
               DrawText "ObjectType: "+Int(tiletype), 0, 0
         End Select
   End Select
End Function

Function UpdateMap()
   'control editmode
   If editmode=2 Then editmode=0
   If editmode=-1 Then editmode=1

   If currLv=-1 Then currLv = LevelCount
   If currLv=1000 Then currLv = 0

   'control worldtype
   If worldtype[currLv]=-1 Then worldtype[currLv]=0

Select editmode
    Case 0 ' Tilemode
        If databaseItem[editmode]=0 Then
            databaseItem[editmode]=4
        ElseIf databaseItem[editmode]=5 Then
            databaseItem[editmode]=1
        End If

    Case 1 ' Objectmode
        If databaseItem[editmode]=0 Then
            databaseItem[editmode]=31
        ElseIf databaseItem[editmode]=32 Then
            databaseItem[editmode]=1
        End If
End Select

   If KeyHit(KEY_0) Then
      databaseItem[editmode]=1
      editmode=editmode+1
      UpdateDatabase()
   EndIf

' Increment
If KeyHit(KEY_1) Then
    databaseItem[editmode] = databaseItem[editmode] + 1
    If editmode = 0 And databaseItem[editmode] > 4 Then databaseItem[editmode] = 1
    If editmode = 1 And databaseItem[editmode] > 31 Then databaseItem[editmode] = 1
    UpdateDatabase()
    DebugLog(databaseItem[editmode])
EndIf

' Decrement
If KeyHit(KEY_2) Then
    databaseItem[editmode] = databaseItem[editmode] - 1
    If editmode = 0 And databaseItem[editmode] < 1 Then databaseItem[editmode] = 4
    If editmode = 1 And databaseItem[editmode] < 1 Then databaseItem[editmode] = 31
    UpdateDatabase()
    DebugLog(databaseItem[editmode])
EndIf

   If KeyHit(KEY_N) Then
       If currLv=levelCount-1 Then currLv=-1
       currLv=currLv+1
   EndIf

   If KeyHit(KEY_P) Then
       If currLv=0 Then currLv=levelCount
       currLv=currLv-1
   EndIf

   'Map Data
   'Saving Map Data
   If KeyHit(KEY_S) Then SaveMap()
   'Loading Map Data
   If KeyHit(KEY_L) Then LoadMap()
   'Make New Map Pack
   If KeyHit(KEY_M) Then CreateMapPack()

   'place tile
   If MouseDown(MOUSE_LEFT) Then
      Select editmode
         Case 0'Tilemode
            DebugLog "Placed Tile: "+tiletype
            map(currLv, (MouseX())/tsize, (MouseY())/tsize) = tiletype
         Case 1'Objectmode
            DebugLog "Placed Object: "+tiletype
            map2(currLv, (MouseX())/tsize, (MouseY())/tsize) = tiletype
      EndSelect
   EndIf

   'remove tile
   If MouseDown(MOUSE_RIGHT) Then
      Select editmode
         Case 0'Tilemode
           If Not map(currLv, (MouseX())/tsize,(MouseY())/tsize) = 0 Then
              DebugLog "Removed Tile"
              map(currLv, (MouseX())/tsize,(MouseY())/tsize) = 0
           EndIf

         Case 1'Objectmode
           If Not map2(currLv, (MouseX())/tsize,(MouseY())/tsize) = 0 Then
              DebugLog "Removed Object"
              map2(currLv, (MouseX())/tsize,(MouseY())/tsize) = 0
           EndIf
      EndSelect
   EndIf
End Function

Function UpdateDatabase()
If editmode=0 Then
   Select databaseItem[editmode]
   Case 0'None
   Case 1'Platform
       tiletype=1
   Case 2'Wall
       tiletype=11
   Case 3'Ghost Wall
       tiletype=20
   Case 4'Big Wall
       tiletype=22
   End Select
EndIf

If editmode=1 Then
   Select databaseItem[editmode]
   Case 0'None
   Case 1'Hero
       tiletype=31
   Case 2'Stone
       tiletype=41
   Case 3'Exit
       tiletype=51
   Case 4'Doors
       tiletype=101
   Case 5
       tiletype=102
   Case 6
       tiletype=103
   Case 7'Keys
       tiletype=201
   Case 8
       tiletype=202
   Case 9
       tiletype=203
   Case 10'Teleporters
       tiletype=301
   Case 11
       tiletype=302
   Case 12
       tiletype=303
   Case 13
       tiletype=304
   Case 14
       tiletype=305
   Case 15'Moves
       tiletype=401
   Case 16
       tiletype=402
   Case 17
       tiletype=403
   Case 18
       tiletype=404
   Case 19
       tiletype=405
   Case 20
       tiletype=406
   Case 21
       tiletype=407
   Case 22'Conveyors
       tiletype=501
   Case 23
       tiletype=502
   Case 24
       tiletype=503
   Case 25
       tiletype=504
   Case 26'Spanner
       tiletype=601
   Case 27'Fruits
       tiletype=701
   Case 28
       tiletype=702
   Case 29
       tiletype=703
   Case 30
       tiletype=704
   Case 31
       tiletype=705
   End Select
EndIf
End Function