--★DCL -계정관리
--계정만들기
create user webdb IDENTIFIED by 1234;

--접속권한부여
grant resource, connect to webdb;


--비밀번호
alter user webdb identified by webdb;

--계정삭제
drop user webdb cascade;

