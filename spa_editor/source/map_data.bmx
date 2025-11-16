Function LoadMap()
   filter$="Snowy Pack *.spk:spk"
   filename$=RequestFile( "Select pack file to load",filter$,False)
   Local file:TStream = ReadFile(filename)

   If file Then
      DebugLog("Map Loaded:"+filename)
      
      map_sign = ReadInt(file)

      If map_sign = map_version Then
        ReadInt(file) 'always - 16
        levelCount = ReadInt(file)
        
        For i = 0 To levelCount - 1
        worldtype[i] = ReadShort(file)
        map_width[i] = ReadShort(file)
        map_height[i] = ReadShort(file)

        currWorldType = worldtype[0]

        'Read Tiles
        For x=0 To map_height[i]-1
           For y=0 To map_width[i]-1
              map[i, y, x, 0] = ReadShort(file)
           Next
        Next

       'Read Objects
        For x=0 To map_height[i]-1
           For y=0 To map_width[i]-1
              map[i, y, x, 1] = ReadShort(file)
           Next
        Next

        'Read Items
        For x=0 To map_height[i]-1
           For y=0 To map_width[i]-1
              map[i, y, x, 2] = ReadShort(file)
           Next
        Next

        'Read Flags
        flags[i,0]=ReadShort(file)
        flags[i,1]=ReadShort(file)
        flags[i,2]=ReadShort(file)
        flags[i,3]=ReadShort(file)
        flags[i,4]=ReadShort(file)
      Next

        LoadWorldResources()
        CloseFile(file)
      EndIf
   Else
      globalerror("Couldn't Load - "+filename)
   EndIf
End Function

Function SaveMap()
   filter$="Snowy Pack *.spk:spk"
   filename$=RequestFile( "Select pack file to save",filter$,True)
   Local file:TStream = WriteFile(filename)

   If file Then
      DebugLog("Map Saved:"+filename)
      
      WriteInt(file, map_version)

      WriteInt(file, 16) 'fixed always 16
      WriteInt(file, levelCount)
      
      For i = 0 To levelCount - 1
        WriteShort(file, worldType[i])
        WriteShort(file, map_width[i])
        WriteShort(file, map_height[i])

        'Write Tiles
        For x=0 To map_height[i]-1
           For y=0 To map_width[i]-1
              WriteShort(file, map[i, y, x, 0])
           Next
        Next

       'Write Objects
        For x=0 To map_height[i]-1
           For y=0 To map_width[i]-1
              WriteShort(file, map[i, y, x, 1])
           Next
        Next

        'Write Items
        For x=0 To map_height[i]-1
           For y=0 To map_width[i]-1
              WriteShort(file, map[i, y, x, 2])
           Next
        Next

        'Write Flags
        WriteShort(file, flags[i,0])
        WriteShort(file, flags[i,1])
        WriteShort(file, flags[i,2])
        WriteShort(file, flags[i,3])
        WriteShort(file, flags[i,4])
      Next
      CloseFile(file)
   Else
      globalerror("Couldn't Save - "+filename)
   EndIf
End Function

Function CreateMapPack()
   Print "Snowy Pack Creation"
   Local pkLvlCount:String=Input("How many Levels?: ")
   Local pkWorld:String=Input("What World? 0=green, 1=yellow, 2=forest, 3=snow, 4=factory, *=custom: ")

   filter$="Snowy Pack *.spk:spk"
   filename$=RequestFile( "Select where you would like to save your new pack to",filter$,True)
   Local file:TStream = WriteFile(filename)

   Local pkMapWidth:Int = 20
   Local pkMapHeight:Int = 14

   If file Then
      DebugLog("Map Pack Created:"+filename)
      
      WriteInt(file, map_version)

      WriteInt(file, 16) 'fixed
      WriteInt(file, Int(pkLvlCount))

      currWorldType=Int(pkWorld)
      levelCount=Int(pkLvlCount)

      For i:Int = 0 To Int(pkLvlCount) - 1
        map_width[i] = pkMapWidth
        map_height[i] = pkMapHeight
        worldType[i] = Int(pkWorld)
      Next

      For i = 0 To Int(pkLvlCount) - 1
        WriteShort(file, Int(pkWorld))
        WriteShort(file, pkMapWidth)
        WriteShort(file, pkMapHeight)

        'Write Tiles
        For x=0 To pkMapWidth-1
           For y=0 To pkMapHeight-1
              WriteShort(file, map[i, y, x, 0])
           Next
        Next

       'Write Objects
        For x=0 To pkMapWidth-1
           For y=0 To pkMapHeight-1
              WriteShort(file, map[i, y, x, 1])
           Next
        Next

        'Write Items
        For x=0 To pkMapWidth-1
           For y=0 To pkMapHeight-1
              WriteShort(file, map[i, y, x, 2])
           Next
        Next

        'Write Flags
        WriteShort(file, 0)
        WriteShort(file, 0)
        WriteShort(file, 0)
        WriteShort(file, 0)
        WriteShort(file, 0)
     Next
      LoadWorldResources()
      CloseFile(file)
   Else
      DebugLog("Couldn't Create - "+filename)
   EndIf
End Function