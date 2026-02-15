@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View of Maintenance'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_EALM_MAINTENANCE  as projection on zi_ealm_Maintenance
{
    key RequestUuid,
    AssetUuid,
    Description,
    RequestedBy,
    RequestedDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    EstimatedCst,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    ActualCst,
    DueDat,
    Currencycode,
    Status,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Asset : redirected to parent ZC_EALM_ASSET
}
