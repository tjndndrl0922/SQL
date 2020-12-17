--사원의 컬럼을 전체출력 하세요
SELECT
    *
FROM employees;

--부서의 컬럼을 전체출력 하세요
SELECT
    *
FROM departments;

--사원의 사원아이디(employee_id), 이름(first_name), 성(last_name)을 출력하세요
SELECT employee_id,
        FIRST_name,
        last_name
FROM employees;

--사원의 이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요
SELECT first_name,
        phone_number,
        hire_date,
        salary
FROM employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
SELECT first_name,
        last_name,
        salary,
        phone_number,
        email,
        hire_date
FROM employees;

--사원의 컬럼이름을 employee_id = empNo, first_name = E_name,
--salary = "연봉" 으로 출력하세요
SELECT employee_id as empNo,
        first_name E_name,
        salary 연봉
FROM employees;

--사원의 이름(fisrt_name)과 전화번호 입사일 급여 로 표시되도록 출력하세요
SELECT first_name, 
        phone_number,
        hire_date,
        salary
FROM employees;

--사원의 사원번호 이름(first_name) 성(last_name) 
-- 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
SELECT employee_id,
        first_name,
        last_name,
        salary,
        phone_number,
        email,
        hire_date
FROM employees;

--사원의 이름과 성을 출력하세요
SELECt first_name, 
        last_name
FROM employees;

--사원의 이름과 성 사이에 띄어쓰기 후 출력 해주세요.
SELECT first_name || ' ' || last_name
FROM employees;

--사원의 이름과 입사일 사이에  hire date is 를 추가해주세요.
SELECt first_name || ' hire date is '||hire_date
FROM employees;

--사원의 이름과 급여를 출력하세요
SELECT first_name,
        salary
FROM employees;

--사원의 이름과 급여, 연봉을 출력하세요
SELECT first_name,
        salary,
        salary*12
FROM employees;

--사원의 이름과 급여, 급여에 300을 더한 값에 연봉을 출력하세요
SELECT first_name,
        salary,
        (salary +300)*12
FROM employees;

--성명(first_name last_name) 성과 이름사이에 - 로구분, 급여, 연봉, 연봉2(급여*12+5000), 전화번호를 출력하세요
SELECT first_name || '-' || last_name,
        salary,
        salary*12,
        salary*12+5000,
        phone_number
FROM employees;

--부서번호가 10인 사원의 이름을 구하시오
SELECT first_name
FROM employees
where department_id = 10;

--연봉이 15000 이상인 사원들의 이름과 연봉을 출력하세요
SELECT first_name,
        salary
FROM employees
where salary >=15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
SELECT first_name,
        hire_date
FROM employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
SELECT salary
FROM employees
where first_name = 'Lex';

--연봉이 14000 이상 17000 이하인 사원의 이름과 연봉을 구하시오.
SELECT first_name,
        salary
FROM employees
where salary >= 14000
and salary <=17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
SELECT first_name,
        salary
FROM employees
where salary <= 14000
or salary >=17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
SELECT first_name,
        hire_date
FROM employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
SELECT first_name,
        salary
FROM employees
where salary between 14000 and 17000;

--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
SELECT first_name,
        salary
FROM employees
where salary >= 14000
and salary <= 17000;

--이름이 Neena Lex John의 이름 성 연봉을 구하시오.
SELECT first_name,
        last_name,
        salary
FROM employees
where first_name in ('Neena','Lex','John');

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
SELECT first_name,
        salary
FROM employees
where salary in ('2100','3100','4100','5100');

--사원 중 이름이 L로 시작하는 사원의 이름 성 급여를 구하시오
-- like 기억하기!!!!!!!!
SELECT first_name,
        salary
FROM employees
WHERE first_name like 'L%';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
SELECT first_name,
        salary
FROM employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
SELECT first_name,
        salary
FROM employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
SELECT first_name
FROM employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
SELECt first_name
FROM employees
where first_name like '__a_';

--커미션 퍼센트 null을 출력하세요
SELECT commission_pct
FROM employees
where commission_pct is null;

--사원의 급여 13000이상 15000이하 사원 이름 급여 커미션퍼센트 급여*커미션퍼센트를 출력하세요
SELECT first_name,
        salary,
        commission_pct,
        salary*commission_pct
FROM employees
where salary between 13000 and 15000;

--사원의 커미션퍼센트가 null인 이름 급여 커미션 퍼센트를 출력하세요
SELECT first_name,
        salary,
        commission_pct
FROM employees
where commission_pct is null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
SELECT first_name,
        salary,
        commission_pct
FROM employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
SELECT first_name
FROM employees
where manager_id is null
and commission_pct is null;

--사원의 급여를 내림차순으로 정렬 하고 이름 급여를 출력하세요
SELECT first_name,
        salary
FROM employees
order by salary desc;

--사원의 급여를 9000 이상, 오름차순으로 정렬하고 이름 급여를 출력하세요
SELECT first_name,
        salary
FROM employees
where salary >=9000
ORDER by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
SELECT department_id,
        salary,
        first_name
FROM employees
ORDER BY department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
SELECT first_name,
        salary
FROM employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
SELECT department_id,
        salary,
        first_name
FROM employees
ORDER BY department_id desc, salary desc;
