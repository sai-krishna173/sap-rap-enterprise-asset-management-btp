@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view of Employee'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_EALM_EMPLOYEE as select from zealm_employee
{
    key emp_id as EmpId,
    emp_name as EmpName,
    role as Role,
    e_mail as EMail
}
