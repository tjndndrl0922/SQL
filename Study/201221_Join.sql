/********************************
**join**
*********************************/

SELECt *
FROM employees e, departments d
where e.department_id = d.department_id;

--모든 직원이름, 부서이름, 업무명 을 출력하세요
SELECT em.first_name,
        de.department_name,
        j.job_title
FROM employees em, departments de, jobs j
where em.department_id = de.department_id
and em.job_id = j.job_id;

--left outer join(left 조인)
SELECT
    *
FROM employees em left outer join departments de
on em.department_id = de.department_id;

-- right 조인
SELECT em.department_id,
        em.first_name,
        de.department_name
FROM employees em right outer join departments de
on em.employee_id = de.department_id;

-- right 조인 --> left 조인
SELECT de.department_id,
        em.department_id,
        em.first_name
FROM departments de left outer join employees em
on de.department_id = em.department_id;

--full outer join
SELECT em.department_id,
        em.first_name,
        de.department_id
FROM employees em full outer join departments de
on em.department_id = em.department_id;

--alias
SELECT em.first_name,
        de.department_name,
        de.department_id
FROM employees em, departments de
where em.department_id = de.department_id
order by de.department_id desc;

--잘못된 사용 예
SELECT
    *
FROM employees em, locations lo
where em.salary = lo.location_id;