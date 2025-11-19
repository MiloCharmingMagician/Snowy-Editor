Function InitEditor()
    mode = 0
End Function

Function UpdateEditor()
Select mode
'Map Editor
Case 0
    Select state
        Case 0
            InitMap()
            state = 1
        Case 1
            UpdateMap()
            DrawMap()
    End Select
Case 1
    Select state
        Case 0
            InitConfig()
            state = 1
        Case 1
            UpdateConfig()
            DrawConfig()
    End Select
End Select
End Function

Function EndEditor()
    EndMap()
	EndConfig()
End Function
