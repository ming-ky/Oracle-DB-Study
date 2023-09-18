--★DDL - 테이블의 데이터 관리
/* CRUD 
    등록(C create)
    조회(R read)
    수정(U update)
    삭제(D delete)
*/

--insert문 : 데이터 입력
/*묵시적 방법
컬럼 이름, 순서 지정하지 않음
테이블 생성시 정이ㅡ한 순서에 따라 값 지정
author - author_id , author_name , author_desc 니까
(1, '박경리' 토지 작가' ) 이렇게 입력
*/

/*명시적 방법
컬럼 이름을 명시적 사용
지정되지 않은 컬럼 null 자동입력
author_id, author_name
(2, '이문열') 하면 2는 id에 '이문열'은 name 컬럼에 입력되고 desc는 null값 입력됨
*/

--★insert문
insert into author 
values(1, '박경리', '토지작가');

select *
from author;

insert into author(author_id, author_name)
values(2, '이문열');

insert into author(author_id, author_name, author_desc)
values(3, '이문열', '삼국지작가');

insert into author(author_id, author_name)
values(4, '이다영');

select * 
from author;

--★update문
update author 
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id = 1; --where절로 바꿀 레코드의 위치 입력

select * 
from author; --1행 수정 확인

--update문 입력주의★where절을 안쓰면 모든 레코드에 적용됨
update author
set author_name = '이다영',
    author_desc = '인기작가';

select * 
from author; --전체 레코드 수정 확인

update author
set author_name = '기안84'
where author_id = 1;

select * 
from author; -- 1행 레코드 수정 확인

insert into author
values(5, '이다영', '학생');

insert into author
values(6, '유재석', '개그맨');

update author
set author_name = '손성진'
where author_id >= 3; --3번 레코드부터 수정

select * 
from author;

update author
set author_desc = '남자'
where author_desc like '%맨'; --> desc 컬럼의 레코드 값이 %맨 인 레코드를 수정함

select * 
from author;

update author
set author_desc = '요리사'
where author_id = 4;

select * 
from author;

--Q. 특정 값들만 수정하고 싶으면 어떻게 해야 하는지?

--★delete 문
delete from author
where author_id = 6; -- id 6을 가진 레코드 삭제 
--update와 마찬가지로 where 안쓰면 모든 레코드 삭제 됨

select * 
from author;

--★commit 테이블 레코드 확정
commit; -- 5개의 레코드가 있는 상태로 확정

insert into author
values(6, '이다영', '학생');

select * 
from author; --6번 추가

--★rollback commit상태로 되돌리기
rollback;

select * 
from author; -- commit 했던 테이블 가져옴

--rollback 테스트 (DML에서만 적용됨)
delete from author; --전체 삭제

select * 
from author; --전체 삭제 확인

rollback; --commit 상태로 되돌림

select * 
from author; -- commit했던 테이블 가져와짐 확인

