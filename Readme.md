Ejecutar
1.- Crear Cuenta y SP
Connect-AzAccount -TenantId '14354b3d-5686-421a-a402-305cca0950bf'

Subscription Id (Get-AzSubscription -TenantId $((Get-AzContext).Tenant.Id)).Id

New-AzADServicePrincipal -DisplayName 'TerraformAp' -Role Contributor -Scope /subscriptions/1b011210-a618-4971-91ca-77590b596bc8

ObjectId : a936504b-c2d6-449f-a83e-0919ce362776

2.- Resource group

New-AzResourceGroup -Name RG-TERRAFORM-HCA -Location eastus -Tag @{Source="Code"}
3.- Storage Account

New-AzStorageAccount -ResourceGroupName RG-TERRAFORM-HCA -Name sahcastorage -Location eastus -SkuName Standard_LRS -Kind StorageV2

key: KHIUyQ4GYMWUG11i/Ymy0Qg5See9D7YVftqIqwqj1qE+/7CaOVjJ8k9gmNhjBiZRxc/R27GxDsY4+AStJlN5bQ==

3.- Storage account
$StorageAccount = Get-AzStorageAccount -ResourceGroupName RG-TERRAFORM-HCA -Name sahcastorage
$Context = $StorageAccount.Context
New-AzStorageContainer -Name tfstate  -Context $Context

