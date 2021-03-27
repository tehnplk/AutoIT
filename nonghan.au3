#include <MsgBoxConstants.au3>
#include <Date.au3>

ConsoleWrite("....BOT START...." & @CRLF)
Global $click
Global $sec = 3000

WinActivate("[CLASS:TMainForm]","")
WinWaitActive("[CLASS:TMainForm]")
#WinSetOnTop("[CLASS:TMainForm]","",@SW_MAXIMIZE)
WinSetState("[CLASS:TMainForm]","",@SW_MAXIMIZE)
ControlFocus("[CLASS:TMainForm]","","TdxDBGrid1")
MsgBox($MB_SYSTEMMODAL, "Auto BOT", "Bot will start in 8 second.", 8)
Sleep(8000)

While 1

   $time = _NowTime()
   If $time > "11:00:00" Then
	  $sec = 30000
   EndIf
   If $time > "13:00:00" Then
	  $sec = 3600000
   EndIf

   _Click()

WEnd
Exit

Func _Click()
	#Click  lab
	ConsoleWrite("Do click ........." & $time & @CRLF)
	Sleep(1000)
	#ConsoleWrite("Click" & @CRLF)
	$btn_lab = ControlClick("[CLASS:TMainForm]","","TcxButton8")
	If Not $btn_lab Then
		ConsoleWrite("Not found Btn LAB" & @CRLF)
		Sleep(10000)
		Return False
	EndIf
	WinWait("[CLASS:TfrmLabOrder]","")
	If WinExists("[CLASS:TfrmLabOrder]","") Then
		#Sleep(2000)
		WinActivate("[CLASS:TfrmLabOrder]","")
		WinWaitActive("[CLASS:TfrmLabOrder]","")
		Sleep(1000)
		ControlClick("[CLASS:TfrmLabOrder]","","TcxButton11")
		Sleep(1000)
		#popup appear
		If WinExists("[CLASS:#32770]", "") Then
		   Sleep(1000)
		   #ConsoleWrite("Popuppp" & @CRLF)
		   WinActivate("[CLASS:#32770]", "")
		   #ConsoleWrite("Popuppp Activeate" & @CRLF)
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
	ConsoleWrite("Click Success Count = " & $click & @CRLF)
	ConsoleWrite("Wait for next in  " & $sec/1000 & " sec" & @CRLF)
	ConsoleWrite("_______________________________________" & @CRLF)
	Sleep($sec)
   _GridNext()
EndFunc

Func _GridNext()
	WinActivate("[CLASS:TMainForm]","")
	#Sleep(1000)
	ControlFocus("[CLASS:TMainForm]","","TdxDBGrid1")
	#ConsoleWrite("Grid focus" & @CRLF)
	#ControlFocus("[CLASS:TMainForm]","","TcxButton8")
	#Send("{TAB 18}")
	Send("{DOWN}")
	#ConsoleWrite("Next" & @CRLF)
EndFunc