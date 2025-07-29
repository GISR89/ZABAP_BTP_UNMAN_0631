@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Entity - HC Master'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true 

define root view entity Z_C_HC_MASTER_0631
  provider contract transactional_query
  as projection on Z_R_HC_MASTER_0631
{
  @Search.defaultSearchElement: true
  key ENumber,
      EName,
      EDepartment,
      Status,
      JobTitle,
      StartDate,
      EndDate,
      Email,
      MNumber,
      MName,
      MDepartment,
      @Semantics.user.createdBy: true
      CreaDateTime,
      CreaUname,
      @Semantics.user.lastChangedBy: true
      LchgDateTime,
      LchgUname
}
