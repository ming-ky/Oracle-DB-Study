--단일주석
/*
여러줄 주석
*/

--select 문 기본
select * from employees;
select * from departments;
select * from jobs;

select first_name from employees;

--사원의 이름과 전화번호 입사일 연봉을 출력하세요

select first_name
       ,phone_number
       ,hire_date
       ,salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요 ? 컬럼명이 많을때 표기팁
select  first_name
        ,last_name
        ,salary
        ,phone_number
        ,email
        ,hire_date
from employees;

--사원의 이름(fisrt_name)과 전화번호 입사일 연봉으로 표시되도록 출력하세요
select first_name as 이름
       ,phone_number as 전화번호
       ,hire_date as 입사일
       ,salary as 연봉
from employees;

--as를 생략할 수 있음.
select first_name 이름
       ,phone_number 전화번호
       ,hire_date 입사일
       ,salary 연봉
from employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
--출력할 때 컬럼에 별명 사용하기
select employee_id "eID" --" "안에 기입하면 그대로 표시됨
       ,first_name 이름
       ,last_name 성
       ,salary "연 봉" 
       ,phone_number 전화번호
       ,email 이메일
       ,hire_date 입사일
from employees;

select employee_id "empNO"
       ,first_name "f-name"
       ,salary "연 봉"
from employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
select first_name || last_name
from employees;

--응용1.연결 연산자(Concatenation)로 컬럼들 붙이면서 사이 공백넣고 name으로 컬럼명 바꾸기
select first_name ||' '|| last_name name
from employees;

--응용2. 컬럼들 붙이면서 사이와 끝에 문장넣기
select first_name ||' 이 사람의 입사일은 '|| hire_date ||' 입니다'
from employees;

--산술 연산자 사용하기
select first_name "이름"
       ,salary "월급" --월급
       ,salary*12 "연봉" -- 월급*12 = 연봉
from employees;

select first_name
       ,salary
       ,salary*12 ysalary
       ,salary/30 dsalary
       ,(salary+300)*12 bsalary
from employees;

/*
전체직원의 정보를 다음과 같이 출력하세요
    성명(first_name last_name)
      성과 이름사이에 ? 로 구분 ex) William-Gietz
      급여 
      연봉(급여*12)
      연봉2(급여*12+5000)
      전화번호
*/
      
select first_name||'-'||last_name 성명
       ,salary 급여
       ,salary*12 연봉
       ,(salary*12)+5000 연봉2
       ,phone_number 전화번호
from employees;

--WHERE 절 
--부서번호가 10인 사원의 이름을 구하시오
select *
from employees
where department_id = 10; --자바와 다르게 같다를 = 하나로 표현함

--연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
select *
from employees
where salary>=15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name
       ,hire_date
from employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select salary
       ,first_name
from employees
where first_name = 'Lex';

--연봉이 14000 이상이고, 17000 이하인 사원의 이름과 연봉을 출력하세요
select first_name
       ,salary
from employees
where salary >=14000 
and salary <=17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name
       ,salary
from employees
where salary <=14000 
or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name
       ,hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--Between 연산자 
--연봉이 14000 이상이고, 17000 이하인 사원의 이름과 연봉을 출력하세요
select first_name
       ,salary
from employees
where salary between 14000 and 17000; 

--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
select first_name
       ,salary
from employees
where salary >= 14000
and salary <=17000;

--IN 연산자
--IN 연산자로 여러 조건을 검사하기
select first_name
       ,last_name
       ,salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

-- 위 방법을 IN연산자로 할 수 있음
select *
from employees
where first_name in ('Neena' , 'Lex' , 'John');

--연봉이 2100, 3100, 4100, 5100인 사원의 이름과 연봉을 구하시오
select first_name
       ,salary
from employees
where salary in (2100, 3100, 4100, 5100);

--LIKE 연산자
select first_name, last_name, salary
from employees
where first_name like 'L%';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name
       ,salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '__a_';


--NULL
select first_name
       ,salary
       ,commission_pct
       ,salary*commission_pctm 
from employees
where salary between 13000 and 15000;

--커미션이 null이 아닌 사원을 구하시오.
select *
from employees
where commission_pct is null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name
       ,salary
       ,commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null
and commission_pct is null;

--ORDER BY 절
--급여 오름차순 asc / 내림차순 desc 정렬하기 
--asc와 desc를 외우는 팁 asc : a->c 오름 / desc : d->c 내림
select first_name, salary
from employees
order by salary desc;

--연봉이 9000이상인 사람 내림차순으로 정렬하고 연봉과 이름 출력하시오.
select salary
       ,first_name
from employees
where salary >=9000
order by salary desc;

--응용. 연봉은 내림차순 desc 연봉이 겹칠 경우 이름이 오름차순 asc 정렬해서 출력하시오.
select salary
       ,first_name
from employees
where salary >=9000
order by salary desc, first_name asc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id
       ,salary
       ,first_name
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name
       ,salary
from employees
where salary >=10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select department_id
       ,salary
       ,first_name
from employees
order by department_id asc, salary desc;