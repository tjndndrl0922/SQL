/*
문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
(56건)
*/
SELECT count(salary)
FROM employees
where salary < (SELECT avg(salary)
                FROM employees);
                
SELECT count(em.salary)
FROM employees em, (SELECT avg(salary) ss 
                     FROM employees) s
where em.salary < ss; 

/*
문제2. 
평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 
급여의 오름차순으로 정렬하여 출력하세요 
(51건)
*/
SELECT avg(salary), --6461.83
        max(salary) --24000
FROM employees; --6461.83 <= salary <=24000

SELECT  employee_id,
        first_name,
        salary,
        avg(salary),
        max(salary)
FROM employees
where salary >= (SELECT avg(salary)
                 FROM employees)
and salary <= (SELECT max(salary)
                FROM employees)
group by employee_id, first_name, salary
order by salary asc;

/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 
도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/
SELECT em.first_name || ' ' || em.last_name,
        em.department_id
FROM employees em, departments de
where em.department_id = de.department_id
and first_name = 'Steven'
and last_name = 'King';

SELECT lo.location_id 도시아이디,
        lo.street_address 거리명,
        lo.postal_code 우편번호,
        lo.city 도시명,
        lo.state_province 주,
        lo.country_id 나라아이디
FROM employees em, departments de, locations lo
where first_name = 'Steven'
and last_name = 'King'
and em.department_id = de.department_id
and de.location_id = lo.location_id;

SELECT lo.location_id 도시아이디,
        lo.street_address 거리명,
        lo.postal_code 우편번호,
        lo.city 도시명,
        lo.state_province 주,
        lo.country_id 나라아이디
FROM locations lo
where location_id = (SELECT lo.location_id
                      FROM employees em, departments de, locations lo
                      where first_name = 'Steven'
                      and last_name = 'King'
                      and em.department_id = de.department_id
                      and de.location_id = lo.location_id);
                    
SELECT lo.location_id 도시아이디,
        lo.street_address 거리명,
        lo.postal_code 우편번호,
        lo.city 도시명,
        lo.state_province 주,
        lo.country_id 나라아이디
FROM locations lo, (SELECT lo.location_id id
                     FROM employees em, departments de, locations lo
                     where first_name = 'Steven'
                     and last_name = 'King'
                     and em.department_id = de.department_id
                     and de.location_id = lo.location_id) lol
where lo.location_id = lol.id;                    

/*
문제4.
job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용
(74건)
*/
--8000, 8200, 7900, 6500, 5800
SELECT employee_id,
        first_name,
        salary
FROM employees
where salary <ANY (SELECT salary
                FROM employees
                where job_id = 'ST_MAN')
order by salary desc;

/*
문제5. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/ --100, 30, 90, 20, 70, 110, 50, 80, 40, 60, 10 
SELECT employee_id,
        first_name,
        salary,
        department_id
FROM employees
where (salary,department_id) in (SELECT max(salary),
                                        department_id
                                  FROM employees
                                  group by department_id)
order by salary desc;

SELECT em.employee_id,
        em.first_name,
        em.salary,
        em.department_id
FROM employees em, (SELECT max(salary) sa,
                           department_id
                    FROM employees
                    group by department_id) se
where em.department_id = se.department_id
and em.salary = se.sa
order by salary desc;

/*
문제6.
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
(19건)
*/
SELECT  jo.job_title,
        sum(salary)
FROM employees em, jobs jo
where em.job_id = jo.job_id
group by job_title
order by sum(salary) desc;

SELECT
    *
FROM jobs;
/*
문제7.
자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 급여(salary)을 조회하세요 
(38건)
*/
SELECT avg(salary)
FROM employees
group by department_id;

SELECT em.employee_id,
        em.first_name,
        em.salary
FROM employees em, (SELECT avg(salary) ss,
                            department_id sd
                    FROM employees
                    group by department_id) se
where em.department_id =  se.sd
and salary > ss;

SELECT em.employee_id,
        em.first_name,
        em.salary 
FROM employees em, departments de
where em.department_id = de.department_id
and salary > ANY (SELECT avg(salary)
                 FROM employees
                 group by department_id);
/*
문제8.
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력하세요
*/
SELECT employee_id,
        first_name,
        salary,
        hire_date
FROM employees
order by hire_date asc;

SELECT rownum,
        o.employee_id,
       o.first_name,
       o.salary,
       o.hire_date
FROM (SELECT employee_id,
             first_name,
             salary,
             hire_date
      FROM employees
      order by hire_date asc) o;

SELECT ro.rown,
        ro.employee_id,
        ro.first_name,
        ro.salary,
        ro.hire_date
FROM (SELECT   rownum rown,
               o.employee_id,
               o.first_name,
               o.salary,
               o.hire_date
      FROM (SELECT employee_id,
                     first_name,
                     salary,
                     hire_date
              FROM employees
              order by hire_date asc) o
      )ro
where ro.rown >= 11
and ro.rown <= 15;
