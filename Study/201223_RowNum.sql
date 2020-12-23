/***********************************
* rownum
**************************************/

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.

--rownum이 order by 보다 먼저 생겨서 번호가 섞인다.
SELECT  employee_id,
        first_name,
        salary,
        rownum
FROM employees
order by salary desc;

-- 정렬하고 rownum을 사용
SELECT rownum,
        o.employee_id,
        o.first_name,
        o.salary
FROM (SELECT employee_id,
             first_name,
             salary
       FROM employees
       order by salary desc) o -- salary로 정렬되어 있는 테이블 사용
where rownum >=1  -- where절 조건이 2부터 안됨.
and rownum <=5;  

-- 일련번호 주고 바로 조건을 판단해서
SELECT ro.rnum,
        ro.employee_id,
        ro.first_name,
        ro.salary
FROM (SELECT rownum rnum,
             o.employee_id,
             o.first_name,
             o.salary
        FROM (SELECT employee_id,
                     first_name,
                     salary
               FROM employees
               order by salary desc) o
        ) ro
where rnum >= 11
and rnum <= 20;

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
SELECT employee_id,
        first_name,
        salary,
        hire_date
FROM employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc;

SELECT rownum rown,
       o.employee_id,
       o.first_name,
       o.salary,
       o.hire_date
FROM (SELECT employee_id,
             first_name,
             salary,
             hire_date
       FROM employees
       where hire_date >= '07/01/01'
       and hire_date <= '07/12/31'
       order by salary desc) o;
       
SELECT ro.rown,
        ro.employee_id,
        ro.first_name,
        ro.salary,
        ro.hire_date
FROM (SELECT rownum rown,
                   o.employee_id,
                   o.first_name,
                   o.salary,
                   o.hire_date
       FROM (SELECT employee_id,
                         first_name,
                         salary,
                         hire_date
             FROM employees
             where hire_date >= '07/01/01'
             and hire_date <= '07/12/31'
             order by salary desc) o
       )ro
where ro.rown >=3
and ro.rown <= 7;