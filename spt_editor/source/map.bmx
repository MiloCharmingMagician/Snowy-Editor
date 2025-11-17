Function InitMap()
    levelCount = 1

    For i:Int = 0 To 1000 - 1
        map_width[i] = 32
        map_height[i] = 24
        worldType[i] = 0

        For j=0 To propCount-1
            flags[i,j] = 0
        Next

        For j=0 To bytecodeSize-1
            bytecode[i,j] = 0
        Next
    Next

    currWorldType = worldType[0]

    databaseItem[0] = 1
    databaseItem[1] = 1

    'LoadMap()
    LoadResources()
    LoadWorldResources()

   ' For j=0 To propCount-1
        'DebugLog("Flag"+Int(j)+": "+flags[0,j])
    'Next
End Function

Function DrawMap()
   If img_background Then DrawImage(img_background, 0, 0)

   For x=0 To map_width[currLv]-1
      For y=0 To map_height[currLv]-1
         Select map(currLv, x, y, 0)
            Case 0'NONE
            Case 1
               If img_block Then DrawImage(img_block,cx+x*tsize, y*tsize)
            Case 2
               If img_block_add Then DrawImage(img_block_add,cx+x*tsize, y*tsize)
            Case 3
               If img_diagblock_l_down Then DrawImage(img_diagblock_l_down,cx+x*tsize, y*tsize)
            Case 4
               If img_diagblock_l_up Then DrawImage(img_diagblock_l_up,cx+x*tsize, y*tsize)
            Case 5
               If img_diagblock_r_down Then DrawImage(img_diagblock_l_up,cx+x*tsize, y*tsize)
            Case 6
               If img_diagblock_r_up Then DrawImage(img_diagblock_l_up,cx+x*tsize, y*tsize)
            Case 7
               If img_jumppad Then DrawImage(img_jumppad,cx+x*tsize, y*tsize)
            Case 8
               If img_block Then DrawImage(img_block,cx+x*tsize, y*tsize)
               If img_ice Then DrawImage(img_ice,cx+x*tsize, y*tsize-10)
            Default
               DrawText("T:"+Int(map(currLv, x, y, 0)),cx+x*tsize-8, y*tsize-21)
               DebugLog("Tile:"+map(currLv, x, y, 0))
         End Select

         Select map(currLv, x, y, 1)
            Case 0'NONE
            Case 101
               If img_hero Then DrawImage(img_hero, cx+x*tsize, y*tsize-35)
            Case 201
               If img_portal Then DrawImage(img_portal,cx+x*tsize, y*tsize-35)
            Case 202
               If img_portal Then DrawImage(img_portal,cx+x*tsize, y*tsize-35)
            Case 203
               If img_portal Then DrawImage(img_portal,cx+x*tsize, y*tsize-35)
            Case 301
               If img_simple1 Then DrawImage(img_simple1,cx+x*tsize, y*tsize-21)
            Case 302
               If img_simple2 Then DrawImage(img_simple2,cx+x*tsize, y*tsize-21)
            Case 303
               If img_simple_plus1 Then DrawImage(img_simple_plus1,cx+x*tsize, y*tsize-21)
            Case 304
               If img_simple_plus2 Then DrawImage(img_simple_plus2,cx+x*tsize, y*tsize-21)
            Case 305
               If img_simple1 Then DrawImage(img_simple1,cx+x*tsize, y*tsize-21)
            Case 401
               If img_bullet1 Then DrawImage(img_bullet1,cx+x*tsize, y*tsize-35)
            Case 402
               If img_bullet2 Then DrawImage(img_bullet2,cx+x*tsize, y*tsize-35)
            Case 403
               mpdat:Short = map(currLv, x, y-1, 0)
               If mpdat = 1 Or mpdat = 2 Or mpdat = 3 Or mpdat = 4 Or mpdat = 5 Or mpdat = 6 Or mpdat = 8 Then
                   If img_gun_ceil_l Then DrawImage(img_gun_ceil_l,cx+x*tsize-10, y*tsize-10)
               Else
                   If img_gun_ground_l Then DrawImage(img_gun_ground_l,cx+x*tsize-10, y*tsize-35)
               EndIf
            Case 404
               mpdat:Short = map(currLv, x, y-1, 0)
               If mpdat = 1 Or mpdat = 2 Or mpdat = 3 Or mpdat = 4 Or mpdat = 5 Or mpdat = 6 Or mpdat = 8 Then
                   If img_gun_ceil_r Then DrawImage(img_gun_ceil_r,cx+x*tsize-10, y*tsize-10)
               Else
                   If img_gun_ground_r Then DrawImage(img_gun_ground_r,cx+x*tsize-10, y*tsize-35)
               EndIf
            Default
               DrawText("O:"+Int(map(currLv, x, y, 1)),cx+x*tsize-8, y*tsize-21)
               DebugLog("Object:"+map(currLv, x, y, 1))
         End Select
      Next
   Next

   DrawRect (((MouseX())/tsize)*tsize+10),(((MouseY())/tsize)*tsize+10),tsize+2,tsize+2

   If editmode=2 Then DrawText "Config ID: "+cfgId, 0, 0

   DrawText "X: "+Int((MouseX())/tsize), 0, 80
   DrawText "Y: "+Int((MouseY())/tsize), 0, 90

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

   'If KeyDown(KEY_RIGHT) Then cx=cx-1

   DrawText "Worldtype:"+worldtype[currLv],0,60

   Select editmode
      Case 0'Tilemode
         Select databaseItem[editmode]
            Case 1
               DrawText "Tiletype: Block", 0, 40
            Case 2
               DrawText "Tiletype: Block2", 0, 40
            Case 3
               DrawText "Tiletype: Diag Block Left Down", 0, 40
            Case 4
               DrawText "Tiletype: Diag Block Left Up", 0, 40
            Case 5
               DrawText "Tiletype: Diag Block Right Down", 0, 40
            Case 6
               DrawText "Tiletype: Diag Block Right Up", 0, 40
            Case 7
               DrawText "Tiletype: Jump Pad", 0, 40
            Case 8
               DrawText "Tiletype: Ice", 0, 40
            Default
               DrawText "Tiletype: "+Int(tiletype), 0, 40
         End Select

      Case 1'Objectmode
         Select databaseItem[editmode]
            Case 1
               DrawText "ObjectType: Hero", 0, 40
            Case 2
               DrawText "ObjectType: Portal 1", 0, 40
            Case 3
               DrawText "ObjectType: Portal 2", 0, 40
            Case 4
               DrawText "ObjectType: Portal 3", 0, 40
            Case 5
               DrawText "ObjectType: Fellow 1", 0, 40
            Case 6
               DrawText "ObjectType: Fellow 2", 0, 40
            Case 7
               DrawText "ObjectType: Fellow 3", 0, 40
            Case 8
               DrawText "ObjectType: Fellow 4", 0, 40
            Case 9
               DrawText "ObjectType: Fellow 5", 0, 40
            Case 10
               DrawText "ObjectType: Bullet1", 0, 40
            Case 11
               DrawText "ObjectType: Bullet2", 0, 40
            Case 12
               DrawText "ObjectType: Gun Left", 0, 40
            Case 13
               DrawText "ObjectType: Gun Right", 0, 40
            Default
               DrawText "ObjectType: "+Int(tiletype), 0, 40
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

   If KeyHit(KEY_0) Then
      databaseItem[editmode]=1
      editmode=editmode+1
      UpdateDatabase()
   EndIf

' Increment
If KeyHit(KEY_1) Then
    databaseItem[editmode] = databaseItem[editmode] + 1
    If editmode = 0 And databaseItem[editmode] > 8 Then databaseItem[editmode] = 1
    If editmode = 1 And databaseItem[editmode] > 14 Then databaseItem[editmode] = 1
    UpdateDatabase()
EndIf

' Decrement
If KeyHit(KEY_2) Then
    databaseItem[editmode] = databaseItem[editmode] - 1
    If editmode = 0 And databaseItem[editmode] < 1 Then databaseItem[editmode] = 8
    If editmode = 1 And databaseItem[editmode] < 1 Then databaseItem[editmode] = 13
    UpdateDatabase()
EndIf

   If KeyHit(KEY_N) Then
       If currLv=levelCount-1 Then currLv=-1
       currLv=currLv+1
       DebugLog("Level: "+Int(currLv))
       'For j=0 To propCount-1
            'DebugLog("Flag"+Int(j)+": "+flags[currLv,j])
       'Next
   EndIf

   If KeyHit(KEY_P) Then
       DebugLog("Level: "+Int(currLv))
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
   If MouseHit(MOUSE_LEFT) Then
      Select editmode
         Case 0'Tilemode
            DebugLog "Placed Tile: "+tiletype
            map(currLv, (MouseX())/tsize, (MouseY())/tsize, 0) = tiletype
         Case 1'Objectmode
            DebugLog "Placed Object: "+tiletype
            map(currLv, (MouseX())/tsize, (MouseY())/tsize, 1) = tiletype
      EndSelect
   EndIf

   'remove tile
   If MouseDown(MOUSE_RIGHT) Then
      Select editmode
         Case 0'Tilemode
           If Not map(currLv, (MouseX())/tsize,(MouseY())/tsize, 0) = 0 Then
              DebugLog "Removed Tile"
              map(currLv, (MouseX())/tsize,(MouseY())/tsize, 0) = 0
           EndIf

         Case 1'Objectmode
           If Not map(currLv, (MouseX())/tsize,(MouseY())/tsize, 1) = 0 Then
              DebugLog "Removed Object"
              map(currLv, (MouseX())/tsize,(MouseY())/tsize, 1) = 0
           EndIf
      EndSelect
   EndIf
End Function

Function UpdateDatabase()
If editmode=0 Then
   Select databaseItem[editmode]
   Case 0'None
   Case 1'Block
       tiletype=1
   Case 2'Block2
       tiletype=2
   Case 3
       tiletype=3
   Case 4
       tiletype=4
   Case 5
       tiletype=5
   Case 6
       tiletype=6
   Case 7
       tiletype=7
   Case 8
       tiletype=8
   End Select
EndIf

If editmode=1 Then
   Select databaseItem[editmode]
   Case 0'None
   Case 1'Hero
       tiletype=101
   Case 2
       tiletype=201
   Case 3
       tiletype=202
   Case 4
       tiletype=203
   Case 5
       tiletype=301
   Case 6
       tiletype=302
   Case 7
       tiletype=303
   Case 8
       tiletype=304
   Case 9
       tiletype=305
   Case 10
       tiletype=401
   Case 11
       tiletype=402
   Case 12
       tiletype=403
   Case 13
       tiletype=404
   End Select
EndIf
End Function