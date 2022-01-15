$FolderName = "C:\MyDir"
if (Test-Path $FolderName){

}
else
{
    new-item $FolderName -itemtype directory
    
}

Get-ChildItem -Path C:\ -Directory -Force -ErrorAction SilentlyContinue | ForEach-Object {-join('C:\',$_.Name) } > C:\MyDir\File.txt
Get-ChildItem -Path D:\ -Directory -Force -ErrorAction SilentlyContinue | ForEach-Object { -join('D:\',$_.Name) } >> C:\MyDir\File.txt


$Procs = Get-Content -Path C:\MyDir\File.txt

$FileName = "C:\MyDir\Result.txt"
if (Test-Path $FileName -PathType Leaf){
    Remove-Item $FileName
}
else
{

    
}
New-Item $FileName
$Command = "C:\scantool.exe" 
$params = "s"

foreach ( $Proc in $Procs )
{
    & "$command" $params $Proc  2>&1 | %{ "$_" } >> $FileName

}
