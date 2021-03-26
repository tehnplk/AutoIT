#include <Date.au3>
$time = _NowTime()

ConsoleWrite($time & @CRLF)

If $time > "16:00:00" Then
   ConsoleWrite("OK")
EndIf