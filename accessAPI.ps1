# Change IP address, email and password to yours
$hubIP = "http://192.168.30.34:55555"
$mail = "*******@*******.com"
$password = "*******"

$mail = $mail -replace "@", "%40"
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36"
Invoke-WebRequest -UseBasicParsing -Uri "$hubIP/api/server/login/$mail" `
-Method "POST" `
-WebSession $session `
-Headers @{
"Accept"="application/json, text/plain, */*"
  "DNT"="1"
  "Origin"="$hubIP"
  "Referer"="$hubIP/login"
  "Accept-Encoding"="gzip, deflate"
  "Accept-Language"="ru"
} `
-ContentType "application/x-www-form-urlencoded" `
-Body "$password"

# Change to required API URI and Method. The example provides a list of all accessories
$response = Invoke-WebRequest -Method GET -Uri $hubIP/api/accessories -WebSession $session
$response | ConvertFrom-Json