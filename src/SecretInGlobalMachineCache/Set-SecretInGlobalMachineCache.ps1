
function Set-MachineGlobalCacheSecret {
    [CmdletBinding()]
    param (
        [string]$CacheName,
        [string]$SecretKeyName,
        [SecureString]$SecretKeyValue        
    )
    
    begin {
        [DateTime]$dateTimeNow = [DateTime]::Now;
        if (!(Test-Path -Path Variable:\$Global:GdAPIKeyCacheStart)) {
            $Global:GdAPIKeyCacheStart = $dateTimeNow;
        }
        Write-Host "Cached Creds were Last Cached at $Global:GdAPIKeyCacheStart";
      
        [DateTime]$dateTimeFuture = $dateTimeNow.AddDays($Global:GodaddyCredentialCacheInDays);
        Write-Debug "Date in Future: $dateTimeFuture";

    }
    
    process {
        #Encrypt: 
        $key = "1234567891234567"
        $plainPassword = "securekey-textpassword"
        $securePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force
        $secureKey = ConvertTo-SecureString $Key -AsPlainText -Force
        $encryptedKey = ConvertFrom-SecureString $SecureKey -Key(1..16)
        $encryptedPassword = ConvertFrom-SecureString $SecurePassword -SecureKey $secureKey;
        $encryptedKey | Out-File "$env:TEMP\securekey-enckey.txt" $encryptedPassword | Out-File "$env:TEMP\securekey-encpass.txt" Write-Host "Key: $Key" Write-Host "Text Password: $textPassword" Write-Host "Encrypted Password: $encryptedPassword" Write-Host "Encrypted Key: $encryptedKey"
    }
    
    end {
        # if ($gdapikey -eq [string]::Empty){
        #     throw [System.ArgumentNullException] "gdAPIKey is blank please check the cache. ensure you are logged into azure KeyVault";
        #   }
          
        #   if ($gdapisecret -eq [string]::Empty){
        #     throw [System.ArgumentNullException] "gdAPISecret is blank please check the cache. ensure you are logged into azure KeyVault";
        #   }
    }
}


