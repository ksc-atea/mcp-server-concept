using 'main.bicep'

// Shared registry — keep acrName and acrResourceGroupName identical in prod.bicepparam
param acrName             = 'kicm1'
param acrResourceGroupName = 'rg-kicm1'

// Dev-environment resources
param containerAppsEnvName = 'kicmdev1'
param keyVaultName        = 'kicmdev1'
param logAnalyticsName    = 'kicmdev1'
param location            = 'westeurope'
param resourceGroupName   = 'rg-kicmdev1'
param storageAccountName  = 'stkicmdev1'
