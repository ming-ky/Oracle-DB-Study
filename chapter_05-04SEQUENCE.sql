--★SEQUENCE(시퀀스) 오라클에서만 쓸 수 있음
/*연속적인 일렬번호 생성 ->PK에 주로 사용됨
ex) author에 author_id는 pk라 유니크가 적용되어있음
시퀀스로 연속적인 일렬번호를 생성하면 순차적으로 id값이 입력됨
*/

--시퀀스 생성 create sequence 시퀀스명_사용할 컬럼명
create sequence seq_author_id
increment by 1 -- (증가번호) 몇 번씩 올라갈 건지
start with 1 -- (시작번호) 몇 번 부터 시작할 건지
nocache;
--기본값 : 번호를 10장 미리 뽑아놔서 속도를 높임. 다음 시퀀스때는 11번부터 시작하게 됨
--nocache : 기본값처럼 미리 저장용량을 만들어놓지 않고 쓰일때 용량 차지 하는 개념의 옵션

insert into author
values (seq_author_id.nextval, '박명수' , '개그맨');


--시퀀스 조회 (USER_SEQUENCES대문자여야함)
select * from USER_SEQUENCES;

--작가시퀀스 현재 값
select seq_author_id.currval from dual;

--다음시퀀스 조회
select seq_author_id.nextval from dual;

--시퀀스 삭제
drop sequence seq_author_id;


drop table author;
drop table book;




