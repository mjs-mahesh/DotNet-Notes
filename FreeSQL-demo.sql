SELECT *
FROM
    HR.COUNTRIES C
inner Join HR.Regions R on
C.REGION_ID = R.REGION_ID 
Where C.REGION_ID = 30
and C.COUNTRY_NAME like '%I%'
ORDER BY
    C.REGION_ID;

Select * from Hr.Regions where REGION_ID not in (10, 20)

Insert into HR.COUNTRIES
Values
(
    'SL', 'SriLanka', 30
)

SELECT 
  E.First_Name || ' ' || E.LAST_NAME || ' makes $' || E.Salary || ' a day' || ' in ' || J.Job_Title || ' at ' || D.Department_Name || ' ' || L.City as "Income."
FROM
    HR.EMPLOYEES E

Left Join HR.Jobs J on
J.Job_Id = E.Job_Id
Left Join HR.Departments D on
D.department_id = E.department_id
Left join HR.Locations L on
L.Location_Id = D.Location_Id

ORDER BY
    E.Salary Desc,
    E.Job_id,
    E.HIRE_DATE DESC;

Select * from AD.AD_Exam_Results

SELECT Upper(COUNTRY_NAME)
FROM
    HR.COUNTRIES C

SELECT lower(COUNTRY_NAME)
FROM
    HR.COUNTRIES C

Insert into HR.COUNTRIES
Values
(
    SL, SriLanka, 30
)

Select Add_Months(sysdate, 1) from dual