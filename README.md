# PowershellMachineSettingsCache
A PowerShell Module that stores Azure KeyVault keys encrypted locally for a TTL. This is meant to reduce the calls to Azure KeyVault.

## Modules

## Globals

```powershell-interactive
Variable:\$Global:CacheName
Variable:\$Global:$($Global:CacheName)KeyCacheDateTimeStamp;
Variable:\$Global
```

|Variable Name|Scope|Type|Purpose|
|-------|--|-----------|----------|
|CacheName|Global|String|Allows you to create one or many caches by name, this is also used to blank out all cache values as you can call Clear-SecretCache and it will use this name to nullify all variables related to this cache only|
|[CacheName]KeyCacheDateTimeStamp|Global|DateTime|Represents the Cache Expiration, cna be updated, if date is in the future, the next time a check happens it's set back to now. |

### Cache Management

|Command|Prerequisites|Description|Parameters|
|-------|--|---------|----------|
|Clear-SecretCache||||

### Secrets In Global Machine Cache

This section of commands are not inteneded to be used in every day scripts. they are provided for manual intervention in the cache.

#### Commands

|Command|Prerequisites|Description|Parameters|
|-------|--|---------|----------|
|Set-SecretInGlobalMachineCache|None - Required Values must be passed|Will Append the Cache Name to the SecretName and attempt to store the value in Azure KeyVault|  |
|Get-SecretInGlobalMachineCache|None - Required Values must be passed|Retrieves the Cache Item on the condition of expiration or non-existence in the cache. if either are true it will call Azure KeVault by concatenating CacheName and SecretName to retrieve the value TO the cache with a new expiration and return the SecureString.||

### Retrieve Settings

#### Commands

|Command|Prerequisites|Description|Parameters|
|-------|-----------|----------|---------|
|Get-SecretSetting| 1. Variable:\Global:CacheName 1. Az.KeyVault Connect-Azure must have been executed succefully 1. A KeyVault Name must Exist 1. | Calls the Cache for secret on conditions of expiration or non-existence in the cache if either is true it will call Azure KeyVault by concatenating the CacheName and SecretName|
|Set-SecretSetting|Variable:\Global:CacheName|Sets th||

