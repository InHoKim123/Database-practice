insert into member
values('ww2', '1234', '정기원', 'jj@naver.com', '정기', 0, sysdate, 'java');
insert into member
values ('ss2', '1234', '노정주', 'no@naver.com', '노정', 0, sysdate, 'c++');
insert into member
values ('das2', '1234', '서수미', 'so@naver.com', '서수', 0, sysdate, 'c++');
insert into member
values ('fr4', '1234', '정예빈', 'jung2@naver.com', '정예', 0, sysdate, 'java');
insert into member
values ('vvf4', '1234', '심현태', 'shim@naver.com', '심현', 0, sysdate, 'database');
insert into member
values ('nyh5', '1234', '문형우', 'moon@naver.com', '문형', 0, sysdate, 'database');
insert into member
values ('ert43', '1234', '표동현,', 'dong@naver.com', '표동', 0, sysdate, 'c');
insert into member
values ('kut34', '1234', '황형태,', 'hyang@naver.com', '황형', 0, sysdate, 'c');
insert into member
values ('vde3', '1234', '예인혁,', 'in@naver.com', '예인', 0, sysdate, 'c++');
insert into member
values ('oh6', '1234', '오하늘,', 'oh@naver.com', '오하', 0, sysdate, 'c++');
insert into member
values ('erwg', '1234', '황한샘,', 'han@naver.com', '황한', 0, sysdate, 'c#');
insert into member
values ('vdde', '1234', '허송이,', 'song@naver.com', '허송', 0, sysdate, 'c#');
insert into member
values ('dtyn', '1234', '이웅,', 'eeeu@naver.com', '이웅', 0, sysdate, 'c#');
insert into member
values ('jo9', '1234', '조요한,', 'killerjo@naver.com', '조요', 0, sysdate, 'c++');
insert into member
values ('tak9', '1234', '탁경구,', 'tak@naver.com', '탁경', 0, sysdate, 'java');

create sequence post_seq;

insert into post
values(post_seq.nextval, '내가짱이야', '', '나야나야나야나', '탁경', sysdate, 124, '자유게시판');
insert into post
values(post_seq.nextval, '할로', '', '하윙~~~~~~', '조요', sysdate, 1244, '자유게시판');
insert into post
values(post_seq.nextval, '풉', '', '으하하항하앟ㅇㅇ', '예인', sysdate, 5331, '자유게시판');
insert into post
values(post_seq.nextval, '누구야', '', '내머리에 똥싼거 누구야', '문형', sysdate, 6543, '자유게시판');
insert into post
values(post_seq.nextval, '시퀀스', '', '컬럼값을 values 절로 입력하고 시퀀스가 부여된 num 뭐시기', '황형', sysdate, 13444, '자유게시판');
insert into post
values(post_seq.nextval, '공지입니다.', '', '공지사항입니다. 읽어보세요', '관리자', sysdate, 143444, '공지사항');
insert into post
values(post_seq.nextval, '비밀글.', '33', '비밀글 입니다.', '노정', sysdate, 10, '자유게시판');
insert into post
values(post_seq.nextval, '으헤읗에', '', 'sql의 지원', '오하', sysdate, 643, '자유게시판');
insert into post
values(post_seq.nextval, '정전기', '', '따가워욤', '정기', sysdate, 6434, '자유게시판');
insert into post
values(post_seq.nextval, '공지입니다.', '', '오늘부터 쉬는시간 1시간', '관리자', sysdate, 643124, '공지사항');

------------------------------------------------------------------------------------
--조인을 사용하여 글을 작성한 사람의 아이디와 닉네임, 글 내용을 조회한다.
select m.id ||' : '|| m.nicname as "아이디, 닉네임", p.postnum as "글 번호", p.postname as "글 제목", p.postcontent as "글 내용" 
from member m, post p
where m.nicname = p.postwriter;

------------------------------------------------------------------------------------
--조인을 사용하여 관리자가 작성한 공지사항을 조회한다.
select m.nicname "작성자", p.postname "제목", p.postcontent"내용" from member m, post p
where m.managernum = 1 and m.nicname = p.postwriter;

------------------------------------------------------------------------------------
--회원이 작성한 글중 2010년과 2020년 사이에 작성한 글을 작성일 기준 내림차순으로 조회한다.
select m.nicname"작성자", p.postname"제목", p.postcontent"내용", p.postwriteday"작성일" from member m, post p
where m.nicname = p.postwriter and p.postwriteday  between '2010/01/01' and '2020/12/31'
order by p.postwriteday desc;

------------------------------------------------------------------------------------
--회원중 비밀글을 작성한 회원과 글을 조회한다.
select m.nicname "작성자", p.postname "제목", p.postcontent "내용", p.postpasswd "글 비밀번호" from member m, post p
where m.nicname = p.postwriter and not p.postpasswd is null;

------------------------------------------------------------------------------------
--게시글의 조회수가 1000 초과인 게시글을 조회한다.
select postname, postcontent, max(views) from post
group by postname, postcontent
having max(views) > 1000;


