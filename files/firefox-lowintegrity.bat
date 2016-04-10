@echo on

;
; set firefox in low integrity mode
;
; from http://hardenwindows7forsecurity.com/Harden%20Windows%207%20Home%20Premium%2064bit%20-%20Standalone.html

set USERNAME=

icacls "C:\Program Files (x86)\Mozilla Firefox\Firefox.exe" /setintegritylevel low

icacls "C:\Users\%USERNAME%\AppData\Local\Temp" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\%USERNAME%\AppData\Local\Mozilla" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\%USERNAME%\AppData\Roaming\Mozilla" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\%USERNAME%\Downloads" /setintegritylevel(oi)(ci) low /t

