$Global:TestModuleDevelopmentScripts = $true;
. "$env:OneDriveConsumer\Scripts\Powershell\Scripts\Personal\marcus\Scripts\My\Secrets\MachineCacheKey\src\Master-Secrets.ps1"
. "$env:OneDriveConsumer\Scripts\Powershell\Scripts\Personal\marcus\Scripts\My\Secrets\MachineCacheKey\src\SecretInGlobalMachineCache\Tests\Test-Get-SecretInGlobalMachineCache.ps1";
. "$env:OneDriveConsumer\Scripts\Powershell\Scripts\Personal\marcus\Scripts\My\Secrets\MachineCacheKey\src\SecretInGlobalMachineCache\Tests\Test-Set-SecretInGlobalMachineCache.ps1";

if ($Global:TestModuleDevelopmentScripts){
    $error.Clear();
    Set-MachineGlobalCacheSecret -CacheName "MachineCacheTest" -SecretKeyName "SecretKey" -SecretKeyValue "osdwod.8941";
    Get-MachineGlobalCacheSecret -CacheName "MachineCacheTest" -SecretKeyName "SecretKey";
    if($error.Count -gt 0){
        return $false;
    }
}
return $false;