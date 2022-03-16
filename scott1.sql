insert into member
values('ww2', '1234', '�����', 'jj@naver.com', '����', 0, sysdate, 'java');
insert into member
values ('ss2', '1234', '������', 'no@naver.com', '����', 0, sysdate, 'c++');
insert into member
values ('das2', '1234', '������', 'so@naver.com', '����', 0, sysdate, 'c++');
insert into member
values ('fr4', '1234', '������', 'jung2@naver.com', '����', 0, sysdate, 'java');
insert into member
values ('vvf4', '1234', '������', 'shim@naver.com', '����', 0, sysdate, 'database');
insert into member
values ('nyh5', '1234', '������', 'moon@naver.com', '����', 0, sysdate, 'database');
insert into member
values ('ert43', '1234', 'ǥ����,', 'dong@naver.com', 'ǥ��', 0, sysdate, 'c');
insert into member
values ('kut34', '1234', 'Ȳ����,', 'hyang@naver.com', 'Ȳ��', 0, sysdate, 'c');
insert into member
values ('vde3', '1234', '������,', 'in@naver.com', '����', 0, sysdate, 'c++');
insert into member
values ('oh6', '1234', '���ϴ�,', 'oh@naver.com', '����', 0, sysdate, 'c++');
insert into member
values ('erwg', '1234', 'Ȳ�ѻ�,', 'han@naver.com', 'Ȳ��', 0, sysdate, 'c#');
insert into member
values ('vdde', '1234', '�����,', 'song@naver.com', '���', 0, sysdate, 'c#');
insert into member
values ('dtyn', '1234', '�̿�,', 'eeeu@naver.com', '�̿�', 0, sysdate, 'c#');
insert into member
values ('jo9', '1234', '������,', 'killerjo@naver.com', '����', 0, sysdate, 'c++');
insert into member
values ('tak9', '1234', 'Ź�汸,', 'tak@naver.com', 'Ź��', 0, sysdate, 'java');

create sequence post_seq;

insert into post
values(post_seq.nextval, '����¯�̾�', '', '���߳��߳��߳�', 'Ź��', sysdate, 124, '�����Խ���');
insert into post
values(post_seq.nextval, '�ҷ�', '', '����~~~~~~', '����', sysdate, 1244, '�����Խ���');
insert into post
values(post_seq.nextval, 'Ǳ', '', '���������ϝۤ���', '����', sysdate, 5331, '�����Խ���');
insert into post
values(post_seq.nextval, '������', '', '���Ӹ��� �˽Ѱ� ������', '����', sysdate, 6543, '�����Խ���');
insert into post
values(post_seq.nextval, '������', '', '�÷����� values ���� �Է��ϰ� �������� �ο��� num ���ñ�', 'Ȳ��', sysdate, 13444, '�����Խ���');
insert into post
values(post_seq.nextval, '�����Դϴ�.', '', '���������Դϴ�. �о����', '������', sysdate, 143444, '��������');
insert into post
values(post_seq.nextval, '��б�.', '33', '��б� �Դϴ�.', '����', sysdate, 10, '�����Խ���');
insert into post
values(post_seq.nextval, '�����ƿ�', '', 'sql�� ����', '����', sysdate, 643, '�����Խ���');
insert into post
values(post_seq.nextval, '������', '', '��������', '����', sysdate, 6434, '�����Խ���');
insert into post
values(post_seq.nextval, '�����Դϴ�.', '', '���ú��� ���½ð� 1�ð�', '������', sysdate, 643124, '��������');

------------------------------------------------------------------------------------
--������ ����Ͽ� ���� �ۼ��� ����� ���̵�� �г���, �� ������ ��ȸ�Ѵ�.
select m.id ||' : '|| m.nicname as "���̵�, �г���", p.postnum as "�� ��ȣ", p.postname as "�� ����", p.postcontent as "�� ����" 
from member m, post p
where m.nicname = p.postwriter;

------------------------------------------------------------------------------------
--������ ����Ͽ� �����ڰ� �ۼ��� ���������� ��ȸ�Ѵ�.
select m.nicname "�ۼ���", p.postname "����", p.postcontent"����" from member m, post p
where m.managernum = 1 and m.nicname = p.postwriter;

------------------------------------------------------------------------------------
--ȸ���� �ۼ��� ���� 2010��� 2020�� ���̿� �ۼ��� ���� �ۼ��� ���� ������������ ��ȸ�Ѵ�.
select m.nicname"�ۼ���", p.postname"����", p.postcontent"����", p.postwriteday"�ۼ���" from member m, post p
where m.nicname = p.postwriter and p.postwriteday  between '2010/01/01' and '2020/12/31'
order by p.postwriteday desc;

------------------------------------------------------------------------------------
--ȸ���� ��б��� �ۼ��� ȸ���� ���� ��ȸ�Ѵ�.
select m.nicname "�ۼ���", p.postname "����", p.postcontent "����", p.postpasswd "�� ��й�ȣ" from member m, post p
where m.nicname = p.postwriter and not p.postpasswd is null;

------------------------------------------------------------------------------------
--�Խñ��� ��ȸ���� 1000 �ʰ��� �Խñ��� ��ȸ�Ѵ�.
select postname, postcontent, max(views) from post
group by postname, postcontent
having max(views) > 1000;


