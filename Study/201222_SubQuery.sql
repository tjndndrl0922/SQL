/************************************************
*Sub Query 서브 쿼리
*************************************************/

--11000 보다 급여를 많은 사람의 이름과 급여는?
SELECT employee_id,
        first_name,
        salary
FROM employees
where salary > 11000;

--'Den' 보다 급여를 많은 사람의 이름과 급여는?
--1. 'Den'의 급여
SELECT employee_id,
        first_name,
        salary
FROM employees
where first_name = 'Den';

--2.'Den' 보다 급여 높은사람
SELECT employee_id,
        first_name,
        salary
FROM employees
where salary > 11000;

-- 1개의 질문으로 해결
SELECT employee_id,
        first_name,
        salary
FROM employees
where salary > (SELECT  salary
                FROM employees
                where first_name = 'Den');
                
--예제)
-- 급여를 가장 적게 받은 사람의 이름, 급여, 사원번호는?
SELECT min(salary)
FROM employees;

SELECT first_name,
        salary,
        employee_id
FROM employees
where salary = 2100;

SELECT first_name,
        salary,
        employee_id
FROM employees
where salary = (SELECT min(salary)
                FROM employees);

--예제)               
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
SELECT first_name,
        salary
FROM employees
where salary < (SELECT avg(salary)
                FROM employees);
                
--예제)                
--부서 번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름 급여를 출력하세요.
--부서번호가 110인 직원
SELECT first_name,
        salary,
        employee_id
FROM employees
where department_id = 110;
     
--급여가 12008, 8300인 직원     
SELECT first_name,
        salary,
        employee_id
FROM employees
where salary  in (12008,8300);

SELECT first_name,
        salary,
        employee_id
FROM employees
where salary in (SELECT salary
                 FROM employees
                 where department_id = 110);
       
--예제                 
--각 부서별로 최고급여를 받는 사원을 출력하세요

--1. 부서별 최고 급여 얼마인지? 누구는 못구함.
SELECT max(salary),
        department_id
FROM employees
GROUP by department_id;

--2. 전체 사원 테이블에서 부서 번호와 급여 같은 사람을 찾는다
-- 부서별 최고 급여 리스트를 기준으로
SELECT first_name,
        employee_id,
        salary,
        department_id
FROM employees
WHERE (department_id, salary) in (SELECT department_id,
                                        max(salary)
                                FROM employees
                                GROUP by department_id);

--예제
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

--부서번호 110인 직원의 급여 리스트
SELECT first_name,
        salary,
        department_id
FROM employees
where department_id = 110; --12008 ,8300

SELECT department_id,
        first_name,
        salary
FROM employees
where salary >any (SELECT salary
                  FROM employees
                  where department_id = 110);

--ALL(and)
SELECT department_id,
        first_name,
        salary
FROM employees
where salary >all (SELECT salary
                  FROM employees
                  where department_id = 110);

--Sub Query 로 테이블 만들기 --> Join으로 사용
-- 각 부서별로 최고 급여를 받는 사원을 출력하세요
--1. 각 부서별로 최고 급여 테이블
SELECT max(salary),
        department_id
FROM employees
group by department_id;

--2. 직원테이블 (1)테이블을 join 한다
SELECT em.first_name,
        em.salary,
        em.employee_id
FROM employees em, (SELECT max(salary) salary,
                           department_id
                    FROM employees
                    group by department_id) s
where em.department_id =  s.department_id
and em.salary = s.salary;



































































































































































































































































































































































































































