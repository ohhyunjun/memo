show databases;
#데이터베이스 생성
create database academy;
#데이터베이스 사영
use academy;
#테이블 보여주기
show tables;

create table major (
    major_code varchar(100) primary key,
    major_name varchar(100) not null,
    tutor_name varchar(100) not null
);

create table exam(
    student_code varchar(100) not null comment '수강생 코드',
    exam_seq int not null comment '시험주차',
    score decimal(10, 2) not null comment '시험점수',
    result varchar(1) not null comment '합불'
);

CREATE TABLE student(
    student_code VARCHAR(100) PRIMARY KEY COMMENT '수강생코드',
    name VARCHAR(100) NOT NULL COMMENT '이름',
    birth VARCHAR(8) NULL COMMENT '생년월일',
    gender VARCHAR(1) NOT NULL COMMENT '성별',
    phone VARCHAR(11) NULL COMMENT '전화번호',
    major_code VARCHAR(100) NOT NULL COMMENT '주특기코드',
    FOREIGN KEY(major_code) references major(major_code)

);

alter table exam add primary key(student_code, exam_seq);
alter table exam
    add constraint exam_fk_student_code foreign key (student_code) references student(student_code);

#컬럼명 오타난 경우
#alter table exam rename column student_cod to student_code;

#DML
INSERT INTO major values('m1', '스프링', '김남일');
INSERT INTO major values('m2', '리엑트', '강일삼');
INSERT INTO major values('m3', '노드', '김이일');
INSERT INTO major values('m4', 'HTML', '박성일');
INSERT INTO major values('m5', '자바', '김남모');
INSERT INTO major values('m6', '루비온레일즈', '양희관');
INSERT INTO major values('m7', '뷰', '김서영');
INSERT INTO major values('m8', '앵귤러', '최태우');

INSERT INTO student values('s1', '최원빈', '20010422','M', '01022223333','m1');
INSERT INTO student values('s2', '김진짜', '20011122','M', '01066666666','m1')
                         ,('s3', '박하사탕','19990909', 'W','01072568888','m2')
                         ,('s4', '김','19970412','W', '010555444','m1')
                         ,('s5', '박','20050306','W', '010555444','m1')
                         ,('s6', '공','19440101','W', '010555444','m3')
                         ,('s7', '최','19970411','W', '0105565444','m2')
                         ,('s8', '만','19850508','W', '0105545644','m1')
                         ,('s9', '임','19990919','W', '01045454','m2');

INSERT INTO student (student_code, name, gender, major_code) values ('s10', '가아이', 'W', 'm3');
INSERT INTO student (student_code, name, gender, major_code) values ('s11', '오타이', 'W', 'm3');



INSERT INTO STUDENT(student_code, name, gender, major_code) VALUES('s12', '권오빈', 'M', 'm3');
INSERT INTO STUDENT VALUES('s13', '김가은', '20220121', 'F', '01000000030', 'm1');
INSERT INTO STUDENT(student_code, name, gender, major_code) VALUES('s14', '김동현', 'M', 'm4');

INSERT INTO STUDENT VALUES('s15', '박은진', '20221101', 'F', '01000000040', 'm1');
INSERT INTO STUDENT(student_code, name, birth, gender, phone, major_code) VALUES('s16', '정영호', '20221105', 'M', '01000000050', 'm5');
INSERT INTO STUDENT(student_code, name, gender, major_code) VALUES('s17', '박가현', 'F', 'm7');
INSERT INTO STUDENT(student_code, name, birth, gender, phone, major_code) VALUES('s18', '박용태', '20220508', 'M', '01000000060', 'm6');
INSERT INTO STUDENT VALUES('s19', '김예지', '20220505', 'F', '01000000070', 'm2');
INSERT INTO STUDENT VALUES('s20', '윤지용', '20220909', 'M', '01000000080', 'm3');
INSERT INTO STUDENT VALUES('s21', '손윤주', '20220303', 'F', '01000000090', 'm6');

INSERT INTO EXAM VALUES('s1', 1, 8.5, 'P'),
                       ('s1', 2, 9.5, 'P'),
                       ('s1', 3, 3.5, 'F'),
                       ('s2', 1, 8.2, 'P'),
                       ('s2', 2, 9.5, 'P'),
                       ('s2', 3, 7.5, 'P'),
                       ('s3', 1, 9.3, 'P'),
                       ('s3', 2, 5.3, 'F'),
                       ('s3', 3, 9.9, 'P'),
                    ('s4', 1, 8.4, 'P'),
                    ('s5', 1, 9.5, 'P'),
                    ('s5', 2, 3.5, 'F'),
                    ('s6', 1, 8.3, 'P'),
                    ('s7', 1, 9.2, 'P'),
                    ('s7', 2, 9.9, 'P'),
                    ('s7', 3, 3.6, 'F'),
                    ('s8', 1, 8.4, 'P'),
                    ('s9', 1, 9.7, 'P'),
                    ('s10', 1, 8.4, 'P'),
                    ('s10', 2, 9.8, 'P'),
                    ('s10', 3, 8.4, 'P'),
                    ('s11', 1, 8.6, 'P'),
                    ('s12', 1, 9.2, 'P'),
                    ('s13', 1, 8.1, 'P'),
                    ('s13', 2, 9.5, 'P'),
                    ('s13', 3, 2.1, 'F'),
                    ('s14', 1, 9.2, 'P'),
                    ('s15', 1, 9.7, 'P'),
                    ('s15', 2, 1.7, 'F'),
                    ('s16', 1, 8.4, 'P'),
                    ('s17', 1, 9.3, 'P'),
                    ('s17', 2, 9.9, 'P'),
                    ('s17', 3, 1.3, 'F'),
                    ('s18', 1, 9.9, 'P'),
                    ('s19', 1, 9.4, 'P'),
                    ('s19', 2, 8.9, 'P'),
                    ('s19', 3, 7.4, 'F'),
                    ('s20', 1, 8.1, 'P');


insert into student values ('s0', '김수강','20200101','M', '01011112222','m1');
# 조회기능
select *
from student
where student_code = 's0';

# 업데이트
update student
set major_code = 'm2'
where student_code = 's0';

# 삭제
delete
from student
where student_code = 's0';

# 조회
-- 테이블의 모든 컬럼 데이터 조회
select *
from student;
-- 테이블의 특정 조건의 데이터 조회
select *
from student
where major_code = 'm2';
-- 특정 학생의 이름과 전공 컬럼만 조회
select name, major_code
from student
where student_code = 's2';

# 조회 심화
-- 명시적 조인
-- JOIN 키워드를 사용하여 두 테이블을 조인합니다.
-- ON절을 사용하여 조인 조건을 지정
-- 가독성 높음, 복잡한 조인 조건을 명확하게 구분, 표현하기 쉽다.
-- INNER JOIN(default), LEFT JOIN, RIGHT JOIN등 여러 조인 방식이 있음
SELECT s.name, s.major_code, m.major_name
FROM student s
JOIN major m on s.major_code = m.major_code;
-- 암시적 조인
-- 테이블을 콤마(,)로 나열합니다.
-- WHERE절에서 조인 조건을 지정한다.
-- 간단한 쿼리에서는 코드가 짧고 빠르게 작성할 수 있지만, 복잡해질수록 가독성이 낮다.
-- 다양한 조인 방식을 사용 할 수 없음.
SELECT s.name, s.major_code, m.major_name
FROM student s, major m
WHERE s.major_code = m.major_code;


#---------------------------
#https://ohnyong.notion.site/sql-prac
#여기다 숙제 풀이쓰기
#DROP DATABASE ProblemPractice;
show databases;
create database ProblemPractice;
use ProblemPractice;
CREATE TABLE student(
    student_code VARCHAR(100) PRIMARY KEY COMMENT '수강생코드',
    name VARCHAR(100) NOT NULL COMMENT '이름',
    exam_seq int not null comment '시험주차',
    score decimal(10, 2) not null comment '시험점수'
);
create table MANAGER(
    id bigint primary key,
    name varchar(100) not null,
    student_code varchar(100) not null,
    constraint manager_fk_student_code foreign key(student_code) references student(student_code)
);
alter table manager modify column id bigint auto_increment;


insert into student values ('s1','아만다','2','3.2'),
                           ('s2','도만','3','2.5'),
                           ('s3','크리스','4','4.1'),
                           ('s4','지민','2','2.0'),
                           ('s5','오링','1','1.2'),
                           ('s6','파이드','1','2.6'),
                           ('s7','제임스','3','3.8'),
                           ('s8','톰','4','3.5'),
                           ('s9','민지', '2','2.9');

insert into manager (name, student_code) values ('managerA','s1'),
                                                ('managerA','s2'),
                                                ('managerA','s3'),
                                                ('managerA','s4'),
                                                ('managerA','s5');
insert into manager (name, student_code) values ('managerB','s6'),
                                                ('managerB','s7'),
                                                ('managerB','s8'),
                                                ('managerB','s9');

select s.name, s.exam_seq, s.score
from student s
join manager m on s.student_code = m.student_code
where m.name = 'managerA';

alter table manager drop foreign key manager_fk_student_code;

alter table manager add constraint manager_fk_student_code
    foreign key(student_code) references student(student_code) on DELETE cascade;

delete
from student
where student_code = 's1';
