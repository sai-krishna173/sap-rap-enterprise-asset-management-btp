@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View of ASSET'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_EALM_ASSET provider contract transactional_query as projection on ZI_EALM_Asset
{
    @EndUserText.label: 'Assest Id'
    key AssetUuid,
    @EndUserText.label: 'Asset Name'
    AssetName,
    @EndUserText.label: 'Asset Type'
    AssetType,
    @EndUserText.label: 'Plant ID'
    PlantId,
    @EndUserText.label: 'Cost Center'
    CostCenter,
    @EndUserText.label: 'Purchase Date'
    PurchaseDate,
    @EndUserText.label: 'Status'
    Status,
    status_criticality as StatusCriticality,
    @EndUserText.label: 'Created By'
    CreatedBy,
    @EndUserText.label: 'Created At'
    CreatedAt,
    @EndUserText.label: 'Last Changed By'
    LastChangedBy,
    @EndUserText.label: 'Last Changed At'
    LastChangedAt,
    @EndUserText.label: 'Local Last Changed At'
    LocalLastChangedAt,
    /* Associations */
    _Maintenance : redirected to composition child ZC_EALM_MAINTENANCE
    
    
}
