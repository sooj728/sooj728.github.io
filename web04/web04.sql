-- 게시판 테이블
create table mp_board(
    bno number primary key,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    writer varchar2(100) not null,
    regdate date default sysdate,
    hit number default 0
 );
-- 게시판 테이블 시퀀스
 create sequence mp_board_seq
 start with 1
 increment by 1;
 
-- 파일 테이블?
 create table mp_file(
    file_no number primary key,
    bno number not null,
    org_file_name varchar2(260) not null,
    stored_file_name varchar2(36) not null,
    file_size number,
    regdate date default sysdate,
    del_gb varchar2(1) default 'n' not null
);
-- 파일 테이블 시퀀스
create sequence mp_reply_seq
start with 1
minvalue 0;

-- 회원 테이블
create table mp_member(
    userid varchar2(40) primary key,
    userpass varchar2(100) not null,
    username varchar2(40) not null,
    regdate date default sysdate
);
-- 회원 테이블 시퀀스
create sequence seq_mp_file_no
start with 1
increment by 1
nomaxvalue nocache;

-- 답변 테이블
create table mp_reply(
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate, 
    constraint pk_1 primary key(bno, rno)
);
-- 외래키에 의한 참조테이블이 있는 경우 무왜 연쇄 삭제
drop table mp_reply cascade constraints;

--댓글 테이블의 bno에 mp_board의 bno를 외래키로 추가
alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno);
 
-- sql developer에서 relationship erd 제작
-- 1) 파일 - data modeler - 임포트 - 데이터 딕셔너리