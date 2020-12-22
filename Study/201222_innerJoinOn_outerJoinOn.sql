--from절 where 절 표현방법, (+) <-- 오라클
--left/right/full outer join ~ on / inner join ~ on


--inner join --> 양쪽이 만족하는 경우(null을 제외시킴) 
--   inner join ~ on
SELECT em.first_name,
        em.department_id,
        de.department_name,
        de.department_id
FROM employees em inner join departments de
on em.department_id = de.department_id;


--outer join --> 기준이 되는 쪽은 포함 비교되는 쪽은 null 표시
--    left outer join ~ on
--    right outer join ~ on
--    full outer join ~ on




