--★SubQuery : 하나의 SQL 질의문 속에 다른 SQL 질의문이 포함되어 있는 형태

--예제1
--‘Den’ 보다 급여를 많은 사람의 이름과 급여는?
--'Den'의 급여
select first_name
       ,salary
from employees
where first_name = 'Den';
--'Den'의 급여보다 많이받는 사람
select first_name
       ,salary
from employees
where salary > 11000;

--두 개의 질의문을 SubQuery 로 한 개의 질의문으로 만들기
select first_name
       ,salary
from employees 
where salary > (select salary
                from employees
                where first_name = 'Den');
                
--예제 2
--급여를 가장 적게 받는 사람의 이름,급여,사원번호는?
--가장 적은 급여
select min(salary)
from employees;
--가장 적은 급여를 받는 사람
select first_name
from employees
where salary <= 2100;

--★SubQuery
select first_name
       ,salary
       ,employee_id
from employees
where salary = (select min(salary)
                from employees);
                
--예제 3
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
--평균급여
select avg(salary)
from employees;
--평균급여보다 적게 받는 사람 이름, 급여
select first_name
       ,salary
from employees
where salary < 6461;

--★SubQuery
select first_name
       ,salary
from employees
where salary < (select avg(salary)
                from employees);

--★다중행 SubQuery
select *
from employees
where salary in(12008, 8300);

select *
from employees
where salary = 12008
or salary = 8300;

--방법 1 where or 사용
select employee_id
       ,first_name
       ,salary
from employees
where first_name = 'Shelley'
or first_name = 'William';

--방법 2 wehre in 사용
select employee_id
       ,first_name
       ,salary
from employees
where first_name in ( 'Shelley', 'William');

--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--부서번호가 110인 직원
select first_name
       ,salary
from employees
where department_id = 110;


--합치기
select employee_id
       ,first_name
       ,salary
from employees
where salary in (select salary
                   from employees
                    where salary in(12008, 8300));
                    
--예제
--각 부서별로 최고급여를 받는 사원을 출력하세요
-- 각 부서별 최고급여
select department_id
       ,max(salary)
from employees
group by department_id;

--(각 부서별 최고급여)테이블을 SubQuery로 사용
select first_name
       ,salary
       ,department_id
from employees
where (department_id , salary) in (select department_id
                                          ,max(salary)
                                   from employees
                                   group by department_id);
                                   
--★다중행 SubQuery - ANY (or)
-- 부서번호가 110인 직원의 급여(8300, 12008) 보다 큰 모든 직원의 사번,이름,급여를 출력하세요
-- any를 쓰면 (8300 or 12008) 되어서 급여가 8300보다 큰 사람부터 나옴
select employee_id
       ,first_name
       ,salary
from employees
where salary > any (select salary
                     from employees
                     where department_id = 110);
                     
 --★다중행 SubQuery - ALL (and)  
 -- 부서번호가 110인 직원의 급여(8300, 12008) 보다 큰 모든 직원의 사번,이름,급여를 출력하세요
 -- all를 쓰면 (8300 and 12008) 되어서 급여가 12008 보다 큰 사람부터 나옴
 select employee_id
       ,first_name
       ,salary
from employees
where salary > all (select salary
                     from employees
                     where department_id = 110);
                     
                     
--조건절 vs 테이블 조인
--각 부서별로 최고급여를 받는 사원을 출력하세요

--조건절
select department_id
       ,employee_id
       ,first_name
       ,salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                    from employees
                                    group by department_id);

--테이블 조인                                  
select e.department_id
       ,e.employee_id
       ,e.first_name
       ,e.salary
from employees e, (select department_id, max(salary) salary
                   from employees
                   group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.salary;

--예제
--직원의 이름과 연봉 부서명을 출력하세요
select e.first_name
       ,e.salary
       ,d.department_name
from employees e, departments d
where e.department_id = d.department_id;


--★rownum : 질의의 결과에 가상으로 부여되는 Oracle의 가상(Pseudo)의 Column (일렬번호)
select rownum
       ,first_name
       ,salary
from employees
order by salary desc;

--예제
--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오
-- 정렬과 rounum을 같이 사용하면 번호부터 부여한 뒤 정렬해서 rounum 번호가 섞임.

--그래서 정렬된 테이블(연봉순으로 정렬된 테이블)을 먼저 구하고
select first_name
       ,salary
from employees
order by salary desc;

--그다음 연봉순으로 정렬된 테이블에 rounum을 사용함 
-- 연봉순으로 정렬된 테이블을 넣을 때는 SubQuery로 넣어서 해야함.
select rownum
       ,first_name
       ,salary
       ,email
from (select first_name
             ,salary
             ,email
      from employees
      order by salary desc)
where rownum>=1
and rownum<=5;

--★위 방법대로하면 1번부터만 출력이 가능해서 2~부터 출력하려면 다른 방법을 해야함
--정렬된 테이블과 정렬된 테이블에 순서를 부여한 테이블이 필요함

--정렬된 테이블(ot) 만들기
select first_name
       ,salary
from employees
order by salary desc;

--정렬된 테이블에 순서를 부여한 테이블 (ort) 만들기
select rownum
       ,ot.first_name
       ,ot.salary
from (select first_name
             ,salary
      from employees
      order by salary desc)ot;
      
--만들어진 정렬,순서부여된 테이블 서브쿼리로 넣어서 테이블 안에 있는 순서 뽑아내기 (ot+ort)
-- from SubQuery(SubQuery) 같은 것
select ort.rn
       ,ort.first_name
       ,ort.salary
from (select rownum rn
            ,ot.first_name
            ,ot.salary
      from (select first_name
                  ,salary
            from employees
            order by salary desc)ot
            )ort
where ort.rn>=2
and ort.rn<=3;


--★★예제 
--07년에 입사한 직원 중 급여가 많은 직원 3~7등의 이름 급여 입사일은?

--1.07년입사 중 급여순 정렬한 ot 만들기
select first_name
       ,hire_date
       ,salary
from employees
where hire_date >= '07/01/01' and hire_date <= '07/12/31'
order by salary desc;

--2. ot에 순서번호를 매긴 ort 만들기
select rownum rn
       ,first_name
       ,salary
       ,hire_date
from (select first_name
             ,hire_date
             ,salary
        from employees
        where hire_date >= '07/01/01' and hire_date <= '07/12/31'
        order by salary desc)ot;
        
--3. ort(ot)를 이용해 순서 뽑기
select ort.rn
       ,ort.first_name
       ,ort.salary
       ,ort.hire_date
from (select rownum rn
             ,first_name
             ,salary
             ,hire_date
       from (select first_name
                    ,hire_date
                    ,salary
               from employees
              where hire_date >= '07/01/01' and hire_date <= '07/12/31'
              order by salary desc)ot
      )ort
where ort.rn >=3
and ort.rn<=7;