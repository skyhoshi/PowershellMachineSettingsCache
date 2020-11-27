
#Set-MachineCacheSecretKeyFrom-StringValue "$(1..16)"
# $value = New-Guid;
# Write-Host "Byte Count:  $([System.Text.Encoding]::Default.GetByteCount($value))";
# $stringValue = [System.Text.Encoding]::Default.GetBytes($value);
# Set-MachineCacheSecretKeyFrom-StringValue New-Guid;




# $MachineStringValue = "9b7bcd389d054a9a";
# $SecretSecureValue = ConvertTo-SecureString $MachineStringValue ;
# Set-MachineCacheSecretKey $SecretSecureValue;