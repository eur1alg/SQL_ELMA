use [ELMA_DB]

------- параметры на вход
declare @start_cycle_date date
declare @end_cycle_date date
declare @TCFA_Rx_plan_5 int
declare @TCFA_Rx_plan_4 int
declare @TCFA_Rx_plan_3 int
declare @TCFA_Rx_plan_2 int
declare @TCFA_Ph_plan_A int
declare @TCFA_Ph_plan_B int

SET @start_cycle_date = '2023-01-01'
SET @end_cycle_date = '2023-04-01'
SET @TCFA_Rx_plan_5 = 5
SET @TCFA_Rx_plan_4 = 4
SET @TCFA_Rx_plan_3 = 3
SET @TCFA_Rx_plan_2 = 2
SET @TCFA_Ph_plan_A = 3
SET @TCFA_Ph_plan_B = 3


---------ВЫБОРКА ПО АПТЕКАМ

Select 
Line,
ASM,
Manager_txt,
Representative,
Account_Name,
Brick,
Account_Address,
'' as Doc_Name,
'' as Speciality,
'' as Speciality_group,
APG_Division_Alpha_Account_Category as Category,
APG_Division_Alpha_Account_Category as Category_group,
isnull(Call_Qnt,0) as Call_Qnt, 
iif(APG_Division_Alpha_Account_Category = 'A' and  isnull(Call_Qnt,0)>=@TCFA_Ph_plan_A,1,iif(APG_Division_Alpha_Account_Category = 'B' and  isnull(Call_Qnt,0)>=@TCFA_Ph_plan_B,1,0)) as PLAN_ACHIEV,
1 as Target_qnt,
UserId,
User_status,
Work_start_date,
Work_end_date,
Pharmacy_Target.AccountId as ClientId

into
--drop table
 [ELMA_REPORT]..TCFA_LIST_2023_03  ----------УКАЗЫВАЕМ КУДЫ ВЫГРУЖАТЬ


from
--список таргетных аптек
(SELECT 
'Rx' AS Line,
Account.Companies_id as AccountId,
[User].UserDetails_ASM as ASM,
[User].UserDetails_Manager_TXT as Manager_txt,
[User].Users_Name as Representative,
Account.Companies_Name as Account_Name,
Account.Companies_APG_Address as Account_Address,
Account.APG_Locality_Name as Brick,
Account.Companies_Division_General_Account_Category as APG_Division_Alpha_Account_Category,
[User].Users_id AS UserId,
[User].UserDetails_Status AS User_status,
[User].UserDetails_Work_start_date AS Work_start_date,
[User].UserDetails_Work_end_date AS Work_end_date,
Account.Companies_IsActive
FROM [ELMA_VIEW_CompaniesAPGLocality] Account INNER JOIN [dbo].[ELMA_VIEW_UsersStructDetails]  [User] ON Account.Companies_APG_General_responsible_User = [User].Users_id

WHERE (Account.Companies_Division_General_Account_Category = 'A' Or Account.Companies_Division_General_Account_Category = 'B') AND 
Account.Companies_IsActive='true' AND 
--Account.Companies_APG_Division_Alpha_Account_Target = 'true' AND 
Account.Companies_Division_Alpha_Account_Target_PrevCycle = 'true' AND 
([User].UserDetails_Type = 'SUPERVISOR' Or [User].UserDetails_Type = 'REP' Or [User].UserDetails_Type = 'KAS' Or [User].UserDetails_Type = 'RSM' Or [User].UserDetails_Type = 'KAM' Or [User].UserDetails_Type = 'KAS_Ph') AND 
[User].UserDetails_UserDivision = 'General' AND
Account.RecordType_name = 'Pharmacy'

) Pharmacy_Target

--список количества визитов аптечной линией с группировкой по организациям
left join 

(
SELECT ELMA_DB..ELMA_TABLE_Activity_2.AccountId as Account_Id, Count(ELMA_DB..ELMA_TABLE_Activity_2.Activity_Id) AS Call_Qnt
FROM ELMA_DB..ELMA_TABLE_Activity_2,[ELMA_VIEW_UsersStructDetails]
WHERE ELMA_DB..ELMA_TABLE_Activity_2.Activity_RecordType_name = 'Визит в аптеку' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = 'Завершен' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_startAt between @start_cycle_date and @end_cycle_date AND
ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [ELMA_VIEW_UsersStructDetails].Users_id AND [ELMA_VIEW_UsersStructDetails].UserDetails_UserDivision = 'General'
GROUP BY ELMA_DB..ELMA_TABLE_Activity_2.AccountId
) Pharmacy_Call

on Pharmacy_Target.AccountId = Pharmacy_Call.Account_Id


--------------------------- ОБЪЕДИНЯЕМ 2 ТАБЛИЦЫ (АПТЕКИ И ВРАЧИ) ---------------------------------------
UNION ALL
--------------------------- ОБЪЕДИНЯЕМ 2 ТАБЛИЦЫ (АПТЕКИ И ВРАЧИ) ---------------------------------------

---------ВЫБОРКА ПО ВРАЧАМ 

Select 
Line,
ASM,
Manager_txt,
Representative,
Account_Name,
Brick,
Account_Address,
Doc_Name,
Speciality,
Speciality_group,
Division_Alpha_Contact_Category as Category,
iif(Division_Alpha_Contact_Category = '5','5',iif(Division_Alpha_Contact_Category = '4','4',iif(Division_Alpha_Contact_Category = '3','3',iif(Division_Alpha_Contact_Category = '2','2',Division_Alpha_Contact_Category)))) as Category_group,
isnull(Call_Qnt,0) as Call_Qnt, 
iif(Division_Alpha_Contact_Category = '5' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_5,1,
iif(Division_Alpha_Contact_Category = '4' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_4,1,
iif(Division_Alpha_Contact_Category = '3' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_3,1,
iif(Division_Alpha_Contact_Category = '2' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_2,1,0)))) as PLAN_ACHIEV,
1 as Target_qnt,
UserId,
User_status,
Work_start_date,
Work_end_date,
Doctor_Target.ContactId as ClientId

--список таргетных врачей

FROM

(SELECT 
'Rx' AS Line,
Contact.Contacts_id as ContactId,
[User].UserDetails_ASM as ASM,
[User].UserDetails_Manager_TXT as Manager_txt,
[User].Users_Name as Representative,
Contact.Companies_Name as Account_Name, 
Contact.Companies_APG_Address as Account_Address, 
Contact.APG_Locality_Name as Brick, 
Contact.Contacts_Division_General_Contact_Category as Division_Alpha_Contact_Category, 
Contact.Contacts_Name as Doc_Name, 
Contact.Contacts_APG_Specialty as Speciality, 
Contact.Contacts_APG_Specialty as Speciality_group, 
[User].Users_id AS UserId,
[User].UserDetails_Status AS User_status,
[User].UserDetails_Work_start_date AS Work_start_date,
[User].UserDetails_Work_end_date AS Work_end_date,
Contact.Contacts_IsActive
FROM 
[ELMA_VIEW_ContactsCompaniesAPGLocality] Contact INNER JOIN [ELMA_VIEW_UsersStructDetails]  [User] ON Contact.Contacts_APG_Responsible_General_Contact_User = [User].Users_id
WHERE 
(Contact.Contacts_Division_General_Contact_Category='5' Or Contact.Contacts_Division_General_Contact_Category='4' Or Contact.Contacts_Division_General_Contact_Category='3' Or Contact.Contacts_Division_General_Contact_Category='2') AND 
Contact.Contacts_IsActive='true' AND 
Contact.RecordType_name = 'Doctor' AND 
([User].UserDetails_Type = 'SUPERVISOR' Or [User].UserDetails_Type = 'REP' Or [User].UserDetails_Type = 'KAS' Or [User].UserDetails_Type = 'RSM' Or [User].UserDetails_Type = 'KAM' Or [User].UserDetails_Type = 'KAS_Ph') AND 
[User].UserDetails_UserDivision = 'General' AND
--Contact.Contacts_Division_General_Contact_Target='true'
Contact.Contacts_DivisionAlphaTarget_PrevCycle='true'
) Doctor_Target

--список количества визитов врачебной линией с группировкой по контактам
left join

(
SELECT ELMA_DB..ELMA_TABLE_Activity_2.ContactId as Contact_Id, Count(ELMA_DB..ELMA_TABLE_Activity_2.Activity_Id) AS Call_Qnt
FROM ELMA_DB..ELMA_TABLE_Activity_2,[ELMA_VIEW_UsersStructDetails]
WHERE ELMA_DB..ELMA_TABLE_Activity_2.Activity_RecordType_name = 'Визит к врачу' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = 'Завершен' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_startAt between @start_cycle_date and @end_cycle_date AND
ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [ELMA_VIEW_UsersStructDetails].Users_id AND [ELMA_VIEW_UsersStructDetails].UserDetails_UserDivision = 'General'
GROUP BY ELMA_DB..ELMA_TABLE_Activity_2.ContactId
) Pharmacy_Call

on Doctor_Target.ContactId = Pharmacy_Call.Contact_Id

