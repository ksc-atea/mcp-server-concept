using 'main.bicep'

// Shared registry — keep acrName and acrResourceGroupName identical to dev.bicepparam
param acrName             = 'kicm1'
param acrResourceGroupName = 'rg-kicm1'

// Prod-environment resources
param containerAppsEnvName = 'kicmprod1'
param keyVaultName        = 'kicmprod1'
param logAnalyticsName    = 'kicmprod1'
param location            = 'westeurope'
param resourceGroupName   = 'rg-kicmprod1'
param storageAccountName  = 'stkicmprod1'
