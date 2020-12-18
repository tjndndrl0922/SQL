--그룹함수

--평균 avg() but 하나만 가능
--오류 발생 --> 이유 공부해둘것
SELECT avg(salary),
        first_name 
FROM employees;

--그룹함수 avg()
SELECT avg(salary)
FROM employees;

--그룹함수 count()
--count(*) 전체 row의 갯수
SELECT count(*)
FROM employees;

--count(특정컬럼) null제외
SELECT count(commission_pct)
FROM employees;

SELECT count(*), count(commission_pct)
FROM employees;

SELECT count(*)
FROM employees
where salary > 16000;

--그룹함수 sum()
SELECT sum(salary)
FROM employees;

--그룹함수는 같이 표현 가능
SELECT sum(salary), count(*)
FROM employees;

SELECT count(*),
        sum(salary),
        avg(commission_pct)
FROM employees;

SELECT count(*),
        SUM(salary),
        avg(nvl(commission_pct,0))
FROM employees;

--그룹함수 - max() / min()
SELECT max(salary)
FROM employees;

SELECT min(salary)
FROM employees;

--정렬이 필요한 경우 많은 연산을 수행해야 한다.
SELECT max(salary),
        min(salary),
        COUNT(salary)
FROM employees;

--GROUP BY 절
SELECT department_id, 
        salary
FROM employees
order by department_id asc;

SELECT department_id,
        avg(salary)   --group by가 없으면 오류
FROM employees
group by department_id
order by department_id asc;

--group by 절 > 자주하는 오류
SELECT department_id,
        count(*),
        sum(salary)
        --job_id            오류발생
FROM employees
group by department_id;

SELECT department_id,
        job_id,
        count(*),
        sum(salary),
        avg(salary)
FROM employees
GROUP by department_id, job_id;

--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
--그룹함수는 where 절을 쓸수 없음
SELECT department_id,
        count(*),
        sum(salary)
FROM employees
--where sum(salary) >= 20000
group by department_id;

--HAVING 절 > 그룹함수는 where 대신에 having을 씀
SELECT department_id,
        count(*),
        sum(salary)
FROM employees
GROUP BY department_id
having sum(salary) >= 20000
and department_id = 100;

/*************
--case ~ end
*************/
SELECT employee_id,
        salary,
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary*0.1
            when job_id = 'SA_REP' then salary*0.2  
            when job_id = 'ST_CLERK' then salary*0.3
            else salary*0
        end bonus
FROM employees;

 SELECT employee_id,
        salary,
        job_id,
        decode(
            job_id, 'AC_ACCOUNT', salary +salary * 0.1, 
                    'SA_REP', salary*0.2,
                    'ST_CLERK', salary*0.3,
                    salary*0
              ) bonus
FROM employees;

/*
직원의 이름, 부서, 팀을 출력하세요 팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요
*/
SELECT first_name,
        department_id,
        case    when department_id >= 10 and department_id <= 50 then 'A-TEAM'
                when department_id >= 60 and department_id <= 100 then 'B-TEAM'
                when department_id >= 110 and department_id <= 150 then 'C-TEAM'
                else '팀없음'
        end as TEAM 
FROM employees;
