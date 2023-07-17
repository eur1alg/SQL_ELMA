select count (*) from [dbo].[ELMA_TABLE_Contacts] where 


[dbo].[ELMA_LOAD_Companies]


select count (*) from  [ELMA_DB].[dbo].[ELMA_TABLE_Companies] where [Companies_APG_Division_Alpha_Account_Target] = 'true'
select count (*) from  [ELMA_BACKUP].[dbo].[2023_06_30_ELMA_TABLE_Companies] where [Companies_APG_Division_Alpha_Account_Target] = 'true'


select count (*) from [ELMA_DB].[dbo].[ELMA_TABLE_Contacts] where [Contacts_Division_General_Contact_Target] = 'true'
select count(*) from [ELMA_BACKUP].[dbo].[2023_06_30_ELMA_TABLE_Contacts] where [Contacts_Division_General_Contact_Target] = 'true'



select count (*) from [ELMA_BACKUP].[dbo].[2023_06_30_ELMA_TABLE_Contacts] 
left join [ELMA_DB].[dbo].[ELMA_TABLE_Contacts]
on [ELMA_BACKUP].[dbo].[2023_06_30_ELMA_TABLE_Contacts].[Contacts_id] = [ELMA_DB].[dbo].[ELMA_TABLE_Contacts].[Contacts_id]

 where [ELMA_BACKUP].[dbo].[2023_06_30_ELMA_TABLE_Contacts].[Contacts_DivisionAlphaTarget_PrevCycle] = 'true'

select [Contacts_id] from  [ELMA_BACKUP].[dbo].[2023_06_30_ELMA_TABLE_Contacts] where [Contacts_Division_General_Contact_Target] = 'true'


select [Companies_id] from  [ELMA_BACKUP].[dbo].[2023_06_30_ELMA_TABLE_Companies] where [Companies_APG_Division_Alpha_Account_Target] = 'true'




[Companies_APG_Division_Alpha_Account_Target]
[Companies_Division_Alpha_Account_Target_PrevCycle]
[dbo].[2023_06_30_ELMA_TABLE_Companies]
[dbo].[2023_06_30_ELMA_TABLE_Contacts]
[Contacts_Division_General_Contact_Target]
[Contacts_DivisionAlphaTarget_PrevCycle]


select * from [dbo].[ELMA_VIEW_UsersStructDetails] order by [UserDetails_Allocation]

select * from  [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality]

select 
[Contacts_id],
[Contacts_APG_Specialty],
[Contacts_APG_Responsible_General_Contact_User],
[APG_Locality_Name],
[APG_Locality_Area],
[APG_Locality_User_allocated_1],
[APG_Locality_User_allocated_2],
[APG_Locality_User_allocated_3],
[APG_Locality_User_allocated_4],
[APG_Locality_User_allocated_5],

(iif([APG_Locality_User_allocated_1] is null,0,1) + 
 iif([APG_Locality_User_allocated_2] is null,0,1) + 
 iif([APG_Locality_User_allocated_3] is null,0,1) + 
 iif([APG_Locality_User_allocated_4] is null,0,1)) as qnt


 from  [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality]

 where [Contacts_APG_Responsible_General_Contact_User] != '[]'
 and (iif([APG_Locality_User_allocated_1] is null,0,1) + 
 iif([APG_Locality_User_allocated_2] is null,0,1) + 
 iif([APG_Locality_User_allocated_3] is null,0,1) + 
 iif([APG_Locality_User_allocated_4] is null,0,1))  = 1

 and APG_Locality_Area != 'Москва'

 and [APG_Locality_User_allocated_1] != [Contacts_APG_Responsible_General_Contact_User]