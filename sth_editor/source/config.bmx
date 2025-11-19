Global SlotData:Int[256]

Global SlotCX:Int = 0
Global SlotCY:Int = 0

Function UpdateConfig()
    If Not SlotCY=0 Then
        If KeyDown(KEY_UP) Then SlotCY=SlotCY+10
    EndIf

    If KeyDown(KEY_DOWN) Then SlotCY=SlotCY-10
End Function

Function DrawConfig()
    'For i:Int=0 To PortalCount-1
    '    DrawText "Layer"+Int(i)+": "+Int(i), SlotCX, SlotCY+i*25
    'Next
End Function

Function EndConfig()
End Function