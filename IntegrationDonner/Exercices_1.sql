-- Exercise 1

select * from EMPLOYEE
select * from BRANCH

-- 1. La liste des noms et prénoms de tous les employés.
select FIRST_NAME, LAST_NAME from EMPLOYEE;	

-- 2. La liste des noms et prénoms de tous les employés ayant comme titre ‘Président’ ou ‘Vice-Président’
select FIRST_NAME, LAST_NAME, TITLE from EMPLOYEE where TITLE IN ('President', 'Vice President')

-- 3. La liste des noms et prénoms de tous les employés et le nom des départements dans lesquels ils travaillent.
select FIRST_NAME, LAST_NAME, DP.NAME from EMPLOYEE as EP 
INNER JOIN DEPARTMENT as DP on DP.DEPT_ID = EP.DEPT_ID;

-- 4. La liste des employés et l’adresse de leur succursale pour ceux qui ont commencé avant l’année 2003
select FIRST_NAME, LAST_NAME, BR.ADDRESS from EMPLOYEE as EP 
INNER JOIN BRANCH as BR on BR.BRANCH_ID = EP.ASSIGNED_BRANCH_ID
where EP.START_DATE <'2003-01-01'

-- 5. Le nombre d’employés de la succursale 3.
select COUNT(*) from EMPLOYEE where ASSIGNED_BRANCH_ID = 3

-- 6. La liste des employés et l’adresse de leur succursale dans l’état ‘NH’
select FIRST_NAME, LAST_NAME, BR.ADDRESS, BR.STATE from EMPLOYEE as EP 
INNER JOIN BRANCH as BR on BR.STATE = 'NH' 

-- Exercise 2
select * from ACCOUNT 

-- 1. Donnez la liste des comptes qui sont encore ouverts.
select * from ACCOUNT where STATUS = 'ACTIVE'

-- 2. Donnez les informations des comptes par balance disponible croissant, et pour chaque balance, par la balance en attente décroissant
select * from ACCOUNT 
order by AVAIL_BALANCE, PENDING_BALANCE DESC

-- 3. Donnez le solde moyen disponible des comptes
select  AVG(AVAIL_BALANCE) as MOYENNE_COUNT from ACCOUNT 

-- 4. Donnez le solde moyen des comptes ouvert dans la succursale Salem
select  AVG(AVAIL_BALANCE) as MOYENNE_COUNT from ACCOUNT
inner join  BRANCH as BR on BR.CITY = 'Salem'
where ACCOUNT.STATUS = 'ACTIVE'

-- 5. Donnez les numéros des clients et leur solde maximum disponible
select CUST_ID, sum(AVAIL_BALANCE) as TOTAL_BALANCE from ACCOUNT group by CUST_ID

-- 6. Donnez les différentes succursales des comptes et le solde maximum en attente
select CUST_ID, max(PENDING_BALANCE) as TOTAL_BALANCE from ACCOUNT inner join BRANCH on BRANCH.BRANCH_ID = ACCOUNT.OPEN_BRANCH_ID
group by CUST_ID

-- 7. Donnez le solde en attente moyen par succursale le plus bas
select MIN(AVG_PENDING_BALANCE) as min_AVG_PENDING_BALANCE
FROM (
	SELECT OPEN_BRANCH_ID, AVG(PENDING_BALANCE) AS AVG_PENDING_BALANCE
	FROM ACCOUNT
	GROUP BY OPEN_BRANCH_ID 
) AS AVG_BALANCE