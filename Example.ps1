# Before Cache : You call the Azure KeyVault Get Secret Commandlet every time and it goes out and makes a call to the valut.
$gdapikey =  (Get-AzKeyVaultSecret -VaultName skyhoshi -Name godaddyapikey | Select SecretValue ).SecretValue | ConvertFrom-SecureString -AsPlainText;

#Cache Setup 
$Global:GodaddyCredentialCacheInDays = 14
$Global:CacheName = "MyCoolSecretCache"
$Global:$($Global:CacheName)KeyCacheDateTimeStamp;

# AFTER Cache Setup You can call
