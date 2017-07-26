$destinationFolder = "$Env:userprofile\desktop\lockscreenimages"
$lockScreenImageStore = "$Env:userprofile\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"

$File = Get-ChildItem -Path "$lockScreenImageStore" -Recurse

if (!(Test-Path -path $destinationFolder)) {New-Item "$destinationFolder" -Type Directory}

for($i = 0; $i -lt $File.Count; $i++)
{
   Copy-Item -Force $File[$i].FullName ("$destinationFolder\" + $File[$i].BaseName + $i +".jpg")
}

explorer $destinationFolder