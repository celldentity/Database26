-- 파이썬과 mysql 병합 작업을 위한 sql 페이지
-- 절차 = 일반적으로 시스템 계정(root) 계정은 개발용으로 사용하지 않는다.
-- mysqld에 사용할 id와 pw와 권한을 부여하고 db를 생성한다.

CREATE USER 'mbc'@'localhost' IDENTIFIED BY '1234';
# 사용자계정생성 ID(sql 로그인 아이디)     접속PC      암호
# 조장이 열어주는거면 로컬 호스트가 아니라 IP 주소로 적으면 된다
# 			 'lhj'@'192.168.0.155'             '5678' → 반장님이 154주소로 들어올 수 있다.
#            'lhj'@'192.168.0.%'       %는 해당 대역대로 생각하면 되는데 0.1~0.255 사이의 모든 값이 들어올 수 있는 범위다. 이 경우엔 2,3,4층이 다 같이 들어올 수 있다. 
#            'lhj'@'%'                 전체IP, 외부에서도 접속이 가능한 상황이다(보안에 좋지 않다.)
# 컴퓨터의 IP주소가 바뀌면 못들어 갈 수 있다. 이 경우엔 ALTER로 바꿔야 하지만 위와 같은 방법으로 설정하면 조금 편하게 사용할 수 잇다.alter
# 사용자의 계정생성은 아이디가 중복되어도 된다. → 대신 접속 PC를 다중처리 할 수 있음
# CREATE USER 'mbc'@'192.168.0.%' IDENTIFIED BY '5678';　
# CREATE USER 'mbc'@'%' IDENTIFIED BY IDENTIFIED BY 'Mbc320!!';

# 사용자를 삭제할 경우
#drop user 'mbc'@'localhost';

# mbc사용자에게 lms 권한 부여
# 1. 데이터베이스 생성 → 2. 계정에 권한을 
CREATE DATABASE lms DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;
# lms 데이터를 생성                         한국어지원     !!!!
# COLLATE : 문자 집함에 포함된 문자들을 어덯게 비교하고 정렬할지 정의하는 키워드
# 데이터비교시 대소문자 구분, 문자 간의 정렬 순서, 언어별 특수문자 처리 방식 지원
# utf8mb4 : 문자집합
# general : 비교규칙(간단한 일반비교)
# ci : Case Insensitive(대소문자 구분하지 않음)
# COLLATE utf8mb4_bin (대소문자 구분 함)

#mbc라는 계정에 lms를 사용할 수 있게 권한부여
GRANT ALL PRIVILEGES ON LMS. * TO 'mbc'@'localhost';
#						DB명.테이블  ID      접속PC
# ALL PRIVILEGES = 모든권한 부여
# GRANT SELECT, INSERT, ON LMS.* TO '알바'@'%';
#         READ   CREATE       알바생에게 이렇게도 권한을 주기도 한다.     

# 권한을 즉시 반영해야 할 때
FLUSH PRIVILEGES;

USE MYSQL;  #MYSQL 최고 권한 DB로 접속
select * from user;  #MYSQL 사용자의 목록을 볼 수 있다.


