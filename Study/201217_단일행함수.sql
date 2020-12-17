--단일행 함수

--문자함수 - initcap(컬럼명)
SELECT email,
        initcap(email),
        department_id
FROM employees
where department_id = 100;

--문자함수 - LOWER(컬럼명)/UPPER(컬럼명)
SELECT first_name 이름,
        lower(first_name) 소문자,
        upper(first_name) 대문자
FROM employees
where department_id = 100;

--문자함수-SUBSTR(컬럼명, 시작위치, 글자수)
SELECT  first_name,
        SUBSTR(first_name, 2, 6), -- 앞에서부터 시작
        SUBSTR(first_name,-3,2), -- 뒤에서부터 시작
        SUBSTR(first_name,3) -- 시작부터 끝까지
FROM employees
where department_id = 100;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
SELECT first_name,
        lpad(first_name, 10, '*'), -- 글자수를 맞추고 부족한 경우 앞에 *추가, 초과한 경우 10자리만 나옴
        rpad(first_name, 10, '*')  -- 글자수를 맞추고 부족한 경우 뒤에 *추가, 초과한 경우 10자리만 나옴
FROM employees;

--문자함수 – REPLACE (컬럼명, 문자1, 문자2)
SELECT first_name,
        REPLACE(first_name, 'a', '*'), -- a 들어간문자를 *로 바꿈
        department_id
FROM employees
where department_id = 100;

--함수 조합
SELECT first_name,
        REPLACE(first_name, 'a', '*'),
        SUBSTR(first_name,2,3),
        REPLACE(first_name, SUBSTR(first_name,2,4), '****')
FROM employees
where department_id = 100;

--숫자함수 – ROUND(숫자, 출력을 원하는 자리수)
SELECT round(1234.456, 2) r2, -- 원하는 자리수까지 출력하되, 원하는 자리수 +1에서 반올림
        round(123.456, 0) r0, 
        round(124.456, -1) "r-1" 
FROM dual;

SELECT salary,
        ROUND(salary, -3) "sR2"
FROM employees;

--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수)
SELECT  trunc(123.456, 2) t2,
        TRUNC(123.456 ,0) t0,
        trunc(123.456, -1) "T-2"
FROM dual;

--날짜함수 – SYSDATE
SELECT sysdate
FROM dual;

SELECT SYSDATE,
        first_name
FROM employees;

--날짜함수 – MONTHS_BETWEEN(d1, d2)
SELECT  sysdate,
        hire_date,
        MONTHS_BETWEEN(SYSDATE,hire_date) "workMonth",
        trunc(MONTHS_BETWEEN(SYSDATE,hire_date) ,0) "근무개월"
FROM employees
where department_id = 100;

--날짜함수 - LAST_DAY(d1)
SELECT last_day('20/02/06'), -- 그달의 마지막 날
        last_day(sysdate)
FROM dual;

--변환함수
--TO_CHAR(숫자, ‘출력모양’)  숫자형문자형으로 변환하기
SELECT first_name,
        salary,
        salary*12,
        TO_CHAR(salary*12, '$999,999.00'),
        TO_CHAR(salary*12, '999,999'),
        TO_CHAR(salary*1200, '999,999'), -- 숫자와 출력모양의 크기를 맞춰야함
        TO_CHAR(salary*12, '099,999'),
        TO_CHAR(salary*1200, '999,999,999')
FROM employees
where department_id = 100;

--변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜문자형으로 변환하기
SELECT sysdate,
        TO_CHAR(sysdate, 'yyyy') yyyy,
        TO_CHAR(sysdate, 'yy') yy,
        TO_CHAR(sysdate, 'mm') mm,
        TO_CHAR(sysdate, 'month') month,
        to_char(sysdate, 'dd') dd,
        to_char(sysdate, 'day') day,
        to_char(sysdate, 'ddth') ddth,
        to_char(sysdate, 'hh24') hh24,
        to_char(sysdate, 'hh') hh,
        to_char(sysdate, 'MI') MI,
        to_char(sysdate, 'ss') ss
FROM dual;

--년월일 시분초
SELECT sysdate,
        to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
FROM dual;

SELECT first_name,
        hire_date,
        TO_CHAR(hire_date, 'yy-mm-dd hh24:mi:Ss')
FROM employees;

--NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
SELECT  first_name,
        commission_pct,
        nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0)
FROM employees;