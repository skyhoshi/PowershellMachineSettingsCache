[DateTime]$dateTimeNow = [DateTime]::Now;
if (!(Test-Path -Path Variable:\$Global:GdAPIKeyCacheStart)) {
  $Global:GdAPIKeyCacheStart = $dateTimeNow;
}
Write-Host "Cached Creds were Last Cached at $Global:GdAPIKeyCacheStart";

[DateTime]$dateTimeFuture = $dateTimeNow.AddDays($Global:GodaddyCredentialCacheInDays);
Write-Debug "Date in Future: $dateTimeFuture";
if ($null -eq $Global:GdAPIKey -or $Global:GdAPIKey -eq [string]::Empty) {

}

function Test-CacheExpiration {
  [CmdletBinding()]
  param (
    
  )
  
  begin {
    
  }
  
  process {
    [DateTime]$dateTimeNow = [DateTime]::Now;
    if (!(Test-Path -Path Variable:\$Global:GdAPIKeyCacheStart)) {
      $Global:GdAPIKeyCacheStart = $dateTimeNow;
    }
    Write-Host "Cached Creds were Last Cached at $Global:GdAPIKeyCacheStart";
    
    [DateTime]$dateTimeFuture = $dateTimeNow.AddDays($Global:GodaddyCredentialCacheInDays);
    Write-Debug "Date in Future: $dateTimeFuture";
  }
  
  end {
    return $dateTimeNow -gt $dateTimeFuture;
  }
}