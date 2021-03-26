#include <MsgBoxConstants.au3>
#include <Date.au3>

WinActivate("[CLASS:TMainForm]","")
WinWaitActive("[CLASS:TMainForm]")
#WinSetOnTop("[CLASS:TMainForm]","",@SW_MAXIMIZE)
WinSetState("[CLASS:TMainForm]","",@SW_MAXIMIZE)
#Focus Grid
ControlFocus("[CLASS:TMainForm]","","TdxDBGrid1")
ConsoleWrite("Grid focus" & @CRLF)

While 1
   $time = _NowTime()
   ConsoleWrite("Time =" & $time & @CRLF)
   $sec = 5000
   If $time > "12:00:00" Then
	  $sec = 10000
   EndIf
   Sleep($sec)
   _Click()
WEnd
Exit

Func _Click()
	#Click ?? lab
	ConsoleWrite("Click" & @CRLF)
	ControlClick("[CLASS:TMainForm]","","TcxButton8")
	WinWait("[CLASS:TfrmLabOrder]","")
	ConsoleWrite("frmLab1" & @CRLF)
	If WinExists("[CLASS:TfrmLabOrder]","") Then
		#Click ??????
		#Sleep(2000)
		WinActivate("[CLASS:TfrmLabOrder]","")
		ConsoleWrite("frmLab2" & @CRLF)
		WinWaitActive("[CLASS:TfrmLabOrder]","")
		Sleep(1000)
		ControlClick("[CLASS:TfrmLabOrder]","","TcxButton11")
		Sleep(2000)
		#?? popup ?????????
		If WinExists("[CLASS:#32770]", "") Then
		   Sleep(1000)
		   ConsoleWrite("Popuppp" & @CRLF)
		   WinActivate("[CLASS:#32770]", "")
		   ConsoleWrite("Popuppp Activeate" & @CRLF)
		   ControlClick("[CLASS:#32770]", "","Button1")
		   Sleep(1000)
		   WinActivate("[CLASS:TfrmLabOrder]","")
		   ControlClick("[CLASS:TfrmLabOrder]","","TcxButton12")
		EndIf
		WinWaitClose("[CLASS:TfrmLabOrder]","")
		WinWaitNotActive("[CLASS:TfrmLabOrder]","")
		Sleep(5000)
	EndIf
	WinActivate("[CLASS:TMainForm]","")
	Sleep(1000)
	ControlFocus("[CLASS:TMainForm]","","TdxDBGrid1")
	ConsoleWrite("Grid focus" & @CRLF)
	#ControlFocus("[CLASS:TMainForm]","","TcxButton8")
	#Send("{TAB 18}")
	Send("{DOWN}")
	ConsoleWrite("Next" & @CRLF)
EndFunc