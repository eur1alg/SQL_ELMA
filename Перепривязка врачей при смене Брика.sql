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