$resp = try { 
  Invoke-RestMethod https://naas.isalman.dev/no 
} catch { 
  $_.Exception.Response
  exit 1
}

echo $resp.reason

Set-Clipboard -value $resp.reason

$sp = New-Object -ComObject SAPI.SpVoice

$sp.Speak($resp.reason)
