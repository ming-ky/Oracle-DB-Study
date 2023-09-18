--★그룹함수 - join 
select *
from employees, departments;

--카티젼 프로덕트(Cartesian Product)
-- employees 107건  * departments 27건   = 2889건 이 됨
--올바른 Join조건을 WHERE 절에 부여 해야 함.
--적절한 Join 조건을 Where 절에 부여 (일반적으로 테이블 개수 -1 개의 조인 조건이 필요)

select first_name
       ,salary
       ,department_name
       ,e.department_id as eID
       ,d.department_id as dId
from employees e, departments d -- 컬럼이름의 모호성을 피하기 위해 테이블 이름에 별명 지어줌
where e.department_id = d.department_id; -- 106건 됨 = null은 조인안됨(제외됨)


--모든 직원이름, 부서이름, 업무명 을 출력하세요
select e.first_name
       ,d.department_name
       ,j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id and e.job_id = j.job_id;

--★ outer join > left outer join
select *
from employees e left outer join departments d on e.department_id = d.department_id;  
-- where 대신 from 에 테이블 사이 , 생략하고 left outer join 사용 and 대신 on을 써서 조건을 기입

--다른 입력방식
select e.first_name
       ,e.salary
       ,d.department_name
       ,e.department_id
from employees e, departments d
where e.department_id = d.department_id(+);
--where 을 기입할 때 오른쪽 테이블 뒤 (+) 적어주기

--★ outer join > right outer join
select * 
from employees e right outer join departments d on e.department_id = d.department_id;

select e.first_name
       ,e.salary
       ,d.department_name
       ,e.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;
--where 을 기입할 때 왼쪽 테이블 뒤 (+) 적어주기 // ★left일땐 오른쪽에 , right일땐 왼쪽에

--★ outer join > full outer join
select e.first_name
       ,e.salary
       ,d.department_name
       ,e.department_id
from employees e full outer join departments d
on e.department_id = d.department_id;
--full outer join은 (+)쓰는 약식 없음.

--★ self join
--직원의 이름, 월급 + 그 직원의 매니저 이름, 매니저 전화번호를 출력하기
select e.first_name name
       ,e.salary
       ,e.phone_number
       ,m.first_name magName
       ,m.phone_number magPhonenumber
from employees e, employees m 
--같은 테이블에서 두가지를 비교해야하니까 테이블을 두 번 사용함 (비교가 가능하도록 꼭 별명을 붙여야함)
where e.manager_id = m.employee_id;