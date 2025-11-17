Function LoadMap()
   'filter$="Snowy Space Trip Pack *.tpk:tpk"
   'filename$=RequestFile( "Select pack file to load",filter$,False)
   filename$=packsDir+"Easy\demopack.tpk"
   Local file:TStream = ReadFile(filename)

   If file Then
      DebugLog("Map Loaded:"+filename)
      
      map_sign = ReadInt(file)

      If map_sign = map_version Then
        ReadInt(file) 'fixed - 16
        levelCount = ReadInt(file)
        DebugLog("LevelCount: "+levelCount)
        
        For i = 0 To levelCount - 1
        worldtype[i] = ReadShort(file)
        map_width[i] = ReadShort(file)
        map_height[i] = ReadShort(file)

        currWorldType = worldType[currLv]

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

        'Read Config
        For j=0 To propCount-1
            flags[i,j] = ReadShort(file)
            'DebugLog("Flag"+Int(j)+": "+flags[i,j])
        Next

        'Read Bytecode
        For j=0 To bytecodeSize-1
            bytecode[i,j] = ReadByte(file)
            'DebugLog("Bytecode: "+bytecode[i,j])
        Next
      Next

        CloseFile(file)

        LoadWorldResources()
      EndIf
   Else
      DebugLog("Couldn't Load - "+filename)
   EndIf
End Function

Function SaveMap()
   filter$="Snowy Space Trip Pack *.tpk:tpk"
   filename$=RequestFile( "Select pack file to save",filter$,True)
   Local file:TStream = WriteFile(filename)

   If file Then
      DebugLog("Map Saved:"+filename)
      
      WriteInt(file, map_version)

      WriteInt(file, 16) 'fixed
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

        'Write Config
        For j=0 To propCount-1
            WriteShort(file, flags[i,j])
        Next

        'Write Bytecode
        For j=0 To bytecodeSize-1
            WriteByte(file, bytecode[i,j])
        Next
      Next
      CloseFile(file)
   Else
      DebugLog("Couldn't Save - "+filename)
   EndIf
End Function

Function CreateMapPack()
   Print "Snowy Space Trip Pack Creation"
   Local pkLvlCount:String=Input("How many Levels?: ")
   Local pkWorld:String=Input("What World? 0, 1, 2, 3: ")

   filter$="Snowy Space Trip Pack *.tpk:tpk"
   filename$=RequestFile( "Select where you would like to save your new pack to",filter$,True)
   Local file:TStream = WriteFile(filename)

   Local pkMapWidth:Int = 32
   Local pkMapHeight:Int = 24

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

        'Write Config
        For j=0 To propCount-1
            WriteInt(file, 0)
        Next

        'Write Bytecode
        For j=0 To bytecodeSize-1
            WriteByte(file, 0)
        Next
     Next
      LoadWorldResources()
      CloseFile(file)
   Else
      DebugLog("Couldn't Create - "+filename)
   EndIf
End Function