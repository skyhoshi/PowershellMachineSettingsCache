# $env:ProperUserName;
# $env:AzureKeyVaultDefaultName;

# function Set-MachineCacheSecretKey {
#     param (
#         # Parameter help description
#         [Parameter()]
#         [securestring]
#         $SecretValue
#     )
#     Set-AzKeyVaultSecret -VaultName $env:AzureKeyVaultDefaultName -Name MachineCacheSecretKey -SecretValue $SecretValue    
# }

function Set-MachineCacheSecretKey {
    param (
        # Parameter help description
        [Parameter()]
        [string]
        $SecretStringValue
    )
    $encoder = [System.Text.Encoding]::Default;
    $data = $encoder.GetBytes($stringValue);
    
    $SecretValue = ConvertTo-SecureString $SecretStringValue -AsPlainText -Force;
    Set-AzKeyVaultSecret -VaultName $env:AzureKeyVaultDefaultName -Name MachineCacheSecretKey -SecretValue $SecretValue
}


