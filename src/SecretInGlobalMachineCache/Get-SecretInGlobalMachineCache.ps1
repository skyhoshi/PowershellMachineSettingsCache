function Get-MachineGlobalCacheSecret {
    [CmdletBinding()]
    param (
        [string]$CacheName,
        [string]$SecretKeyName = "MachineCacheSecretKey"
    )
    
    begin {
        [DateTime]$dateTimeNow = [DateTime]::Now;
        if (!(Test-Path -Path Variable:\$Global:GdAPIKeyCacheStart)) {
            $Global:GdAPIKeyCacheStart = $dateTimeNow;
        }
        Write-Host "Cached Creds were Last Cached at $Global:GdAPIKeyCacheStart";
      
        [DateTime]$dateTimeFuture = $dateTimeNow.AddDays($Global:GodaddyCredentialCacheInDays);
        Write-Debug "Date in Future: $dateTimeFuture";

        if ($CacheName -eq [string]::Empty){
            #TODO: Validate this Global actually exists and is the correct name.
            $CacheName = $Global:MachineCacheName;
        }
    }
    
    process {
        #Encrypt: 
        $key = "1234567891234567"
        $plainPassword = "securekey-textpassword"
        $securePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force
        $secureKey = ConvertTo-SecureString $Key -AsPlainText -Force
        $encryptedKey = ConvertFrom-SecureString $SecureKey -Key(1..16)
        $encryptedPassword = ConvertFrom-SecureString $SecurePassword -SecureKey $secureKey;
        $encryptedKey;
        Out-File -FilePath "$env:TEMP\securekey-enckey.txt"  -InputObject $encryptedPassword;
        $
        Out-File -FilePath "$env:TEMP\securekey-encpass.txt" -InputObject (Write-Host "Key: $Key" Write-Host "Text Password: $textPassword" Write-Host "Encrypted Password: $encryptedPassword" Write-Host "Encrypted Key: $encryptedKey");

    }
    
    end {
        
    }
}

# MyAwesomeUnitTestSecret
#$stringValue;
#$StringKey = (Get-AzKeyVaultSecret -VaultName skyhoshi -Name MachineCacheSecretKey | Select SecretValue).SecretValue | ConvertFrom-SecureString -AsPlainText
#[System.Byte[]]$secretKey = [System.Text.Encoding]::Default.GetBytes($StringKey)


<#
#Decrypt: 
$encryptedKeyFromFile = Get-Content "C:\temp\securekey-enckey.txt"
$encryptedPasswordFromFile = Get-Content "C:\temp\securekey-encpass.txt"
$secureDecryptedKey = ConvertTo-SecureString $encryptedKeyFromFile -Key(1..16)
$secureDecryptedPassword = ConvertTo-SecureString $encryptedPasswordFromFile -SecureKey $secureDecryptedKey
 
$BSTR1 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureDecryptedPassword)
$textPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR1)
 
$BSTR2 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureDecryptedKey)
$key = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR2)
 
Write-Host "Key: $key"
Write-Host "Text Password: $textPassword"
Write-Host "Encrypted Password: $encryptedPasswordFromFile"
Write-Host "Encrypted Key: $encryptedKeyFromFile"

#>