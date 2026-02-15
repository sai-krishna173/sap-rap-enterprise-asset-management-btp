@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view of Maintenance'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_ealm_Maintenance as select from zealm_maint
association to parent ZI_EALM_Asset as _Asset
    on $projection.AssetUuid = _Asset.AssetUuid
{
    key request_uuid as RequestUuid,
    asset_uuid as AssetUuid,
    description as Description,
    requested_by as RequestedBy,
    requested_date as RequestedDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    estimated_cst as EstimatedCst,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    actual_cst as ActualCst,
    due_dat as DueDat,
    currencycode as Currencycode,
    status as Status,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    local_last_changed_at as LocalLastChangedAt,
    _Asset // Make association public
}
