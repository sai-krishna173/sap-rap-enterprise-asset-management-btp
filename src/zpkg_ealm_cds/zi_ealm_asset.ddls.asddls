@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view of Asset'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_EALM_Asset
  as select from zealm_asset
  composition [1..*] of zi_ealm_Maintenance as _Maintenance
{
  key asset_uuid            as AssetUuid,
      asset_name            as AssetName,
      asset_type            as AssetType,
      plant_id              as PlantId,
      cost_center           as CostCenter,
      purchase_date         as PurchaseDate,
      status                as Status,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,
      _Maintenance,

      cast(
        case status
          when 'ACTIVE' then 3
          when 'UNDER MAINTENANCE' then 2
          when 'SCRAPPED' then 1
          else 0
        end
        as abap.int1
      )                     as status_criticality

}
