using 'containerApp.bicep'

param imageName = 'nationalize'
param appName = 'nationalize'
param acrName = 'kicm1'
param environmentName = 'kicmdev1'
param resourceGroupName = 'rg-kicmdev1'
param keyVaultSecrets = [
  {
    key: 'nationalizeclientid' // Must be lowercase - used in secretRef
    value: 'NationalizeClientId' // PascalCase - actual Key Vault secret name
  }
  {
    key: 'nationalizeclientsecret' // Must be lowercase - used in secretRef
    value: 'NationalizeClientSecret' // PascalCase - actual Key Vault secret name
  }
  {
    key: 'nationalizetenantid' // Must be lowercase - used in secretRef
    value: 'NationalizeTenantId' // PascalCase - actual Key Vault secret name
  }
]
param environment = [
  {
    name: 'EntraIdAuth__TenantId'
    secretRef: 'nationalizetenantid'
  }
  {
    name: 'EntraIdAuth__ClientId'
    secretRef: 'nationalizeclientid'
  }
  {
    name: 'EntraIdAuth__ClientSecret'
    secretRef: 'nationalizeclientsecret'
  }
  {
    name: 'EntraIdAuth__PublicUrl'
    value: 'https://nationalize.mangodesert-387a277b.westeurope.azurecontainerapps.io'
  }
  {
    name: 'NationalizeApi__BaseUrl'
    value: 'https://api.nationalize.io'
  }
  {
    name: 'IsTransportStateless'
    value: 'true'
  }
  // Application Insights connection string is automatically added by the template
]
