-- �Խ��� ���̺�
create table mp_board(
    bno number primary key,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    writer varchar2(100) not null,
    regdate date default sysdate,
    hit number default 0
 );
-- �Խ��� ���̺� ������
 create sequence mp_board_seq
 start with 1
 increment by 1;
 
-- ���� ���̺�?
 create table mp_file(
    file_no number primary key,
    bno number not null,
    org_file_name varchar2(260) not null,
    stored_file_name varchar2(36) not null,
    file_size number,
    regdate date default sysdate,
    del_gb varchar2(1) default 'n' not null
);
-- ���� ���̺� ������
create sequence mp_reply_seq
start with 1
minvalue 0;

-- ȸ�� ���̺�
create table mp_member(
    userid varchar2(40) primary key,
    userpass varchar2(100) not null,
    username varchar2(40) not null,
    regdate date default sysdate
);
-- ȸ�� ���̺� ������
create sequence seq_mp_file_no
start with 1
increment by 1
nomaxvalue nocache;

-- �亯 ���̺�
create table mp_reply(
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate, 
    constraint pk_1 primary key(bno, rno)
);
-- �ܷ�Ű�� ���� �������̺��� �ִ� ��� ���� ���� ����
drop table mp_reply cascade constraints;

--��� ���̺��� bno�� mp_board�� bno�� �ܷ�Ű�� �߰�
alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno);
 
-- sql developer���� relationship erd ����
-- 1) ���� - data modeler - ����Ʈ - ������ ��ųʸ�