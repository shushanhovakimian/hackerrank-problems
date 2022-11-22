SELECT  t1.company_code,
        t1.founder,
        count(distinct t2.lead_manager_code),
        count(distinct t3.senior_manager_code),
        count(distinct  t4.manager_code),
        count(distinct t5.employee_code)
FROM 
Company t1 
 JOIN Lead_Manager t2 ON t1.company_code = t2.company_code
 JOIN Senior_Manager t3 ON t2.lead_manager_code = t3.lead_manager_code
 JOIN Manager t4 ON t3.senior_manager_code = t4.senior_manager_code
 JOIN Employee t5 ON t4.manager_code = t5.manager_code
group by t1.company_code, t1.founder
order by t1.company_code;