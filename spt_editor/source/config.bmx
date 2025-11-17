Global SlotData:Short[256]
Global SlotName:String[256]

Global SlotCX:Int = 0
Global SlotCY:Int = 0

Global PortalCount:Int = 10

Function UpdateConfig()
    If Not SlotCY=0 Then
        If KeyDown(KEY_UP) Then SlotCY=SlotCY+10
    EndIf

    If KeyDown(KEY_DOWN) Then SlotCY=SlotCY-10
End Function

Function DrawConfig()
    For i:Int=0 To PortalCount-1
        SetSlotNames(i, 1920)
        DrawText "Portal1 Slot"+Int(i)+": "+SlotName[i], SlotCX, SlotCY+i*25
    Next

    For i:Int=0 To PortalCount-1
        SetSlotNames(i, 1935)
        DrawText "Portal2 Slot"+Int(i)+": "+SlotName[i], SlotCX, SlotCY+i*25+256
    Next

    For i:Int=0 To PortalCount-1
        SetSlotNames(i, 1949)
        DrawText "Portal3 Slot"+Int(i)+": "+SlotName[i], SlotCX, SlotCY+i*25+515
    Next

    DrawText "Waypoint Left X: "+Int(flags[curLv, 1965]), SlotCX, SlotCY+750+1*25
    DrawText "Waypoint Right X: "+Int(flags[curLv, 1963]), SlotCX, SlotCY+750+2*25
    DrawText "Waypoint Left Y: "+Int(flags[curLv, 1967]), SlotCX, SlotCY+750+3*25
    DrawText "Waypoint Right Y: "+Int(flags[curLv, 1995]), SlotCX, SlotCY+750+4*25

    'flags[curLv, 1965]'x-left-length-portal1
    'flags[0, 1993] = 9'x-right-length-portal1
    'flags[0, 1967] = 12'y-left-length-portal1
    'flags[0, 1995] = 12'y-right-length-portal1
End Function

Function SetSlotNames(i:Int, index:Short)
    SlotData[i] = flags[curLv, index+i]
    
    Select SlotData[i]
        Case 1
          SlotName[i] = "Robot"
        Case 2
          SlotName[i] = "Spider"
        Case 3
          SlotName[i] = "Shooter"
        Case 4
          SlotName[i] = "Bat"
        Default
          SlotName[i] = ""
    End Select
End Function