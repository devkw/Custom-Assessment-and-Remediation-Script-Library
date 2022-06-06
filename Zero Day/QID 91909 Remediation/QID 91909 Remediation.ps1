if (Test-Path -path registry::HKEY_CLASSES_ROOT\ms-msdt\ -ErrorAction Ignore){
    reg delete HKEY_CLASSES_ROOT\ms-msdt /f | out-null #To delete "HKEY_CLASSES_ROOT\ms-msdt" Key
    Write-Output "MSDT URL Protocol has been disabled. HKEY_CLASSES_ROOT\ms-msdt has been deleted"
}
else {
    Write-Output "Script execution failed. 'HKEY_CLASSES_ROOT\ms-msdt' key not found"
}

#Launching OnDemand VM scan for evaluation of QID-91909

$v = 1
$regkey = 'HKLM:\Software\Qualys\QualysAgent\ScanOnDemand\Vulnerability'
$name = "ScanOnDemand"
if (Get-ItemProperty -Path $regkey -Name $name -ErrorAction Ignore){
    Set-Itemproperty -path $regkey -Name $name -Value $v -Force
}
$v = 100
$regkey = 'HKLM:\Software\Qualys\QualysAgent\ScanOnDemand\Vulnerability'
$name = "CpuLimit"
if (Get-ItemProperty -Path $regkey -Name $name -ErrorAction Ignore){
    Set-Itemproperty -path $regkey -Name $name -Value $v -Force
}