#include <MsgBoxConstants.au3>
#include <Date.au3>

WinActivate("[CLASS:TMainForm]","")
WinWaitActive("[CLASS:TMainForm]")
#WinSetOnTop("[CLASS:TMainForm]","",@SW_MAXIMIZE)
WinSetState("[CLASS:TMainForm]","",@SW_MAXIMIZE)
#Focus Grid
ControlFocus("[CLASS:TMainForm]","","TdxDBGrid1")
ConsoleWrite("Grid focus" & @CRLF)

Global $click

While 1

   $time = _NowTime()
   $sec = 3000
   If $time > "11:00:00" Then
	  $sec = 10000
   EndIf
   If $time > "13:00:00" Then
	  $sec = 15000
   EndIf

   ConsoleWrite("Time =" & $time & " Sec = " & $sec & @CRLF)

   _Click()
   Sleep($sec)
   _GridNext()


WEnd
Exit

Func _Click()
	#Click ?? lab
	Sleep(1000)
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
		Sleep(1000)
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
		#Sleep(5000)
	EndIf
	$click = $click +1
	ConsoleWrite("Click = " & $click & "Times" & @CRLF)
EndFunc

Func _GridNext()
	WinActivate("[CLASS:TMainForm]","")
	#Sleep(1000)
	ControlFocus("[CLASS:TMainForm]","","TdxDBGrid1")
	ConsoleWrite("Grid focus" & @CRLF)
	#ControlFocus("[CLASS:TMainForm]","","TcxButton8")
	#Send("{TAB 18}")
	Send("{DOWN}")
	ConsoleWrite("Next" & @CRLF)
EndFunc