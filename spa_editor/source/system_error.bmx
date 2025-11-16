Function globalerror(err:String)
    Print("")
	
	Print("-----")
	Print("ERROR")
	Print("-----")
	
	Print(err)
	DebugLog(err)
	
	Print("")
	
	While AppTerminate()
	Wend
	
	While Not AppTerminate()
	Wend
	
	End
End Function
