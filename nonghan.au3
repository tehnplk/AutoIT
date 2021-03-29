#include <MsgBoxConstants.au3>
#include <Date.au3>

Global $start_time = _NowTime()
Global $click
Global $sec = 1000

ConsoleWrite("....BOT START...." & $start_time & @CRLF)

WinActivate("[CLASS:TMainForm]","")
WinWaitActive("[CLASS:TMainForm]")
#WinSetOnTop("[CLASS:TMainForm]","",@SW_MAXIMIZE)
WinSetState("[CLASS:TMainForm]","",@SW_MAXIMIZE)
ControlFocus("[CLASS:TMainForm]","","TdxDBGrid1")
MsgBox($MB_SYSTEMMODAL, "Auto BOT", "Bot will start in 8 second.", 8)
Sleep(3000)

While 1

   $sec = 4000

   $time = _NowTime()

   Local $ltime = StringLen($time)
   If $ltime < 8 Then
	   $time = '0' & $time
	EndIf

   If $time > "08:00:00" Then
	  $sec = 8000
   EndIf
   If $time > "11:00:00" Then
	  $sec = 20000
   EndIf
   If $time > "13:00:00" Then
	  $sec = 60000
   EndIf
   If $time > "20:00:00" Then
	  $sec = 3600000
   EndIf
   If $time < "06:15:00" Then
	  $sec = 3600000
   EndIf

   ConsoleWrite($time & @CRLF)

   _Click()

WEnd
Exit

Func _Click()
	#Click  lab
	ConsoleWrite("Do click ...... from " & $start_time & " to " & $time & @CRLF)
	Sleep(1000)
	#ConsoleWrite("Click" & @CRLF)
	$btn_lab = ControlClick("[CLASS:TMainForm]","","TcxButton8")
	If Not $btn_lab Then
		ConsoleWrite("Not found Btn LAB" & @CRLF)
		ConsoleWrite("_______________________________________" & @CRLF)
		Sleep(15000)
		Return False
	EndIf

	Sleep(500)
    If Not WinExists("[CLASS:TfrmLabOrder]","") Then
	  ConsoleWrite("Not found Form LAB" & @CRLF)
	  ConsoleWrite("_______________________________________" & @CRLF)
	  Sleep(60000)
	  Return False
    EndIf

	WinWait("[CLASS:TfrmLabOrder]","",10)
	If WinExists("[CLASS:TfrmLabOrder]","") Then
		#Sleep(2000)
		WinActivate("[CLASS:TfrmLabOrder]","")
		WinWaitActive("[CLASS:TfrmLabOrder]","",10)
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
		WinWaitClose("[CLASS:TfrmLabOrder]","",10)
		WinWaitNotActive("[CLASS:TfrmLabOrder]","",10)
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