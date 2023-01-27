Set xmlhttp = CreateObject("MSXML2.XMLHTTP")

xmlhttp.Open "GET", "https://www.9kw.eu/index.cgi?action=usercaptchaguthaben&apikey=APISchlüssel", False
xmlhttp.Send
WScript.Echo "Restguthaben: " & xmlhttp.responseText & " "
