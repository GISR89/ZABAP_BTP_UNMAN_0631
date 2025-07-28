@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Entity - HC Master'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_HC_MASTER_0631
  as select from zhc_master_0631 as HCMMaster
  //composition of target_data_source_name as _association_name
{
      @ObjectModel.text.element: [ 'EName' ]
  key e_number       as ENumber,
      e_name         as EName,
      e_department   as EDepartment,
      status         as Status,
      job_title      as JobTitle,
      start_date     as StartDate,
      end_date       as EndDate,
      email          as Email,
      m_number       as MNumber,
      m_name         as MName,
      m_department   as MDepartment,
      crea_date_time as CreaDateTime,
      @Semantics.user.createdBy: true
      crea_uname     as CreaUname,
      lchg_date_time as LchgDateTime,
      @Semantics.user.lastChangedBy: true
      lchg_uname     as LchgUname

      // _association_name // Make association public
}
