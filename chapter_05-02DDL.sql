--★DDL -테이블관리

--테이블 생성
--오라클 자료형 
--char(size): 고정길이 문자열
--varchar2(size) : 가변길이 문자열
--number (p.s) : 숫자데이터 p(전체자리수), s(소수점 이하 자리수) 
--                ex)3.14면 전체자리수는 3, 소수점 이하자리수는 2
--date : 날짜+시간

create table book(
    book_id number(5), 
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

--테이블 (컬럼)관리
--book 테이블에 pubs 컬럼추가
alter table book add (pubs varchar2(50));

select * 
from book; -- pubs 추가 확인

--컬럼 수정 (컬럼정보수정)
--book 테이블에 title varchar 수정 
alter table book modify (title varchar2(100));
--book 테이블 title컬럼의 컬럼명 수정
alter table book rename column title to subject;
select * 
from book; -- title->subject 컬럼명 수정 확인 

--컬럼삭제
--author 컬럼 삭제
alter table book drop (author);
select * 
from book; -- author 컬럼 삭제 확인

--테이블 명 수정
--book 테이블 명을 article로 변경
rename book to article;
select * 
from article; -- 테이블명 book->article 변경 확인

--테이블 삭제
drop table article;
select * 
from article; -- 테이블 삭제 확인


/*
제약조건
not-null : null값 입력불가
unique : 중복값 입력 불가 (null값은 허용)
primary key : not null+unique  
              즉, 데이터들끼리 유일성을 보장하는 칼럼에 설정 / 테이블당 1개만 설정가능
              (여러 개를 묶어서 설정가능)
foreign key : 외래키 일반적으로 REFERENCE 테이블의 pk를 참조
              REFERENCE 테이블에 없는 값은 삽입 불가
              REFERENCE 테이블의 레코드 삭제 시 동작
              - on delete cascade : 해당하는 FK를 가진 참조행도 삭제
              - on delete set null  : 해당하는 FK를 null로 바꿈
*/

--★테이블만들기 
--author테이블
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--book 테이블
create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key (author_id) -- foreign key을 담을 컬럼명 book 테이블에 있는 거여야함
    references author(author_id) -- 어떤테이블의 어떤컬럼인지 (author테이블에서 연결할 컬럼명)
);

select *
from author; --author 테이블 확인

select * 
from book; -- book 테이블 확인

