Function LoadMap()
   For i:Int = 0 To 1000 - 1
        mapWidth[i] = 40
        mapHeight[i] = 30
        worldType[i] = 0
        mapConfig[i,0] = 0
        mapConfig[i,1] = 0
		mapConfig[i,2] = 0
		mapConfig[i,3] = 0
		mapConfig[i,4] = 0
		mapConfig[i,5] = 0
		mapConfig[i,6] = 0

        For j = 0 To mapPropMax - 1
		    mapPropData[i, j] = 0
		Next
		
        For x=0 To mapHeight[i]-1
            For y=0 To mapWidth[i]-1
                mapData[i, y, x, 0] = 0
            Next
        Next
            
        For x=0 To mapHeight[i]-1
            For y=0 To mapWidth[i]-1
                mapData[i, y, x, 1] = 0
           Next
       Next
   Next

   levelCount = 0
   currlv = 0

   If gameID="sth3" Then
       filter$="Snowy Teasure Hunter 3 Pack *.th3:th3"
   Else
       filter$="Snowy Teasure Hunter Pack *.thp:thp"
   EndIf
   
   filename$=RequestFile( "Select pack file to load",filter$,False)
   'filename$=packsdir+"standard\0.th3"
   Local file:TStream = ReadFile(filename)

   If file Then
      DebugLog("Map Loaded:"+filename)
      
      mapSign = ReadInt(file)

      If mapSign = mapVersion1 Or mapSign = mapVersion2 Or mapSign = mapVersion3 Then
        fixed = ReadInt(file)'fixed always 16
        levelCount = ReadInt(file)

        If fixed = 16 Then
        For i = 0 To levelCount - 1
            worldtype[i] = ReadShort(file)
		    mapConfig[i,0] = ReadShort(file)
		                
		    If mapSign = mapVersion3 Then
		        mapWidth[i] = ReadShort(file)
                mapHeight[i] = ReadShort(file)

                mapWidth[i] = 40
		        mapHeight[i] = 30
		
		        For j = 0 To mapPropMax - 1
		            mapPropData[i, j] = ReadInt(file)
		        Next
		    Else
		        mapConfig[i,1] = ReadShort(file)
		        mapConfig[i,2] = ReadShort(file)
		        mapConfig[i,3] = ReadShort(file)
		        mapConfig[i,4] = ReadShort(file)
		        mapConfig[i,5] = ReadShort(file)
		        mapConfig[i,6] = ReadShort(file)
                mapWidth[i]=ReadShort(file)
                mapHeight[i]=ReadShort(file)
		    EndIf
		                
            'Read Tiles
            For x=0 To mapHeight[i]-1
                For y=0 To mapWidth[i]-1
                    mapData[i, y, x, 0] = ReadShort(file)
                Next
            Next
            
           'Read Objects
            For x=0 To mapHeight[i]-1
                For y=0 To mapWidth[i]-1
                    mapData[i, y, x, 1] = ReadShort(file)
                Next
            Next
            
            For j = 0 To 5300 - 1
		        ReadShort(file)'unknown data
		    Next
		Next
		EndIf
		
        CloseFile(file)
        EndIf
   Else
       DebugLog("Couldn't Load LevelPack: "+filename)
   EndIf
End Function

Function SaveMap()
   If gameID="sth3" Then
       filter$="Snowy Teasure Hunter 3 Pack *.th3:th3"
   Else
       filter$="Snowy Teasure Hunter Pack *.thp:thp"
   EndIf
   filename$=RequestFile( "Select where you would like to save your new pack to",filter$,True)
   Local file:TStream = WriteFile(filename)

   If file Then
      DebugLog("Map Saved:"+filename)
      
      WriteInt(file, currMapVersion)
      WriteInt(file, fixed)
      WriteInt(file, levelCount)
      
      For i = 0 To levelCount - 1
        WriteShort(file, worldType[i])
		WriteShort(file, mapConfig[i,0])
		
            If currMapVersion = mapVersion3 Then
                WriteShort(file, 0)'width
                WriteShort(file, 0)'height
		        
		        For j = 0 To mapPropMax - 1
		            WriteInt(file, mapPropData[i, j])
		        Next
		    Else
		        WriteShort(file, mapConfig[i,1])
		        WriteShort(file, mapConfig[i,2])
		        WriteShort(file, mapConfig[i,3])
		        WriteShort(file, mapConfig[i,4])  
                WriteShort(file, mapConfig[i,5])		        
                WriteShort(file, mapConfig[i,6])
                WriteShort(file, mapWidth[i])
                WriteShort(file, mapHeight[i])
		    EndIf
		  
        'Write Tiles
        For x=0 To mapHeight[i] - 1
           For y=0 To mapWidth[i] - 1
              'check for player
              If Not mapData[i, y, x, 0] = 11 Then
                 mapData[i, 0, 0, 0] = 11
              EndIf

              WriteShort(file, mapData[i, y, x, 0])
           Next
        Next

       'Write Objects
        For x=0 To mapHeight[i] - 1
           For y=0 To mapWidth[i] - 1
              WriteShort(file, mapData[i, y, x, 1])
           Next
        Next

        For j = 0 To 5300 - 1
		    WriteShort(file, 0)
	    Next
      Next

      CloseFile(file)
   Else
      DebugLog("Couldn't Save LevelPack: "+filename)
   EndIf
End Function

Function CreateMapPack()
   Print "Snowy Treasure Hunter Pack Creation"
   Local filter:String
   Local pkLvlCount:String
   Local pkWorld:String

    pkLvlCount=Input("How many Levels?: ")

   Select gameID
   Case "sth1"
       pkWorld=Input("What World? 0=egypt, 1=greek, 2=norse: ")
       filter$="Snowy Treasure Hunter Pack *.thp:thp"
       currMapVersion=mapVersion1
   Case "sth2"
       pkWorld=Input("What World? 0=jungle, 1=mayan, 2=china: ")
       filter$="Snowy Treasure Hunter Pack *.thp:thp"
       currMapVersion=mapVersion2
   Case "sth3"
       pkWorld=Input("What World? 0=castle-int, 1=castle-out, 2=basement: ")
       filter$="Snowy Treasure Hunter 3 Pack *.th3:th3"
       currMapVersion=mapVersion3
   End Select

   filename$=RequestFile( "Select where you would like to save your new pack to",filter$,True)
   Local file:TStream = WriteFile(filename)

   Local pkMapWidth:Int = 40
   Local pkMapHeight:Int = 30

   If file Then
      DebugLog("Map Pack Created:"+filename)
      
      WriteInt(file, currMapVersion)

      WriteInt(file, fixed)
      WriteInt(file, Int(pkLvlCount))

      currWorldType=Int(pkWorld)
      levelCount=Int(pkLvlCount)

      For i:Int = 0 To Int(pkLvlCount) - 1
        mapWidth[i] = 40
        mapHeight[i] = 30
        worldType[i] = Int(pkWorld)
      Next

      For i = 0 To Int(pkLvlCount) - 1
        WriteShort(file, Int(pkWorld))
        WriteShort(file, mapConfig[i,0])

        If currMapVersion = mapVersion3 Then
                WriteShort(file, 0)'width
                WriteShort(file, 0)'height
		        
		        For j = 0 To mapPropMax - 1
		            WriteInt(file, mapPropData[i, j])
		        Next
		    Else
		        WriteShort(file, mapConfig[i,1])
		        WriteShort(file, mapConfig[i,2])
		        WriteShort(file, mapConfig[i,3])
		        WriteShort(file, mapConfig[i,4])  
                WriteShort(file, mapConfig[i,5])		        
                WriteShort(file, mapConfig[i,6])
                WriteShort(file, mapWidth[i])
                WriteShort(file, mapHeight[i])
		    EndIf
		

        'Write Tiles
        For x=0 To mapHeight[i] - 1
           For y=0 To mapWidth[i] - 1
              'check for player
              If Not mapData[i, y, x, 0] = 11 Then
                 mapData[i, 0, 0, 0] = 11
              EndIf

              WriteShort(file, mapData[i, y, x, 0])
           Next
        Next

       'Write Objects
        For x=0 To mapHeight[i] - 1
           For y=0 To mapWidth[i] - 1
              WriteShort(file, mapData[i, y, x, 1])
           Next
        Next

        For j = 0 To 5300 - 1
		    WriteShort(file, 0)
	    Next
      Next

      LoadWorldResources()
      CloseFile(file)
   Else
      DebugLog("Couldn't Create - "+filename)
   EndIf
End Function