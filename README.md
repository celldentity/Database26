# Database26
데이터베이스학습(mysql)

mysql 설치를 진행한다.
https://dev.mysql.com/downloads/mysql (LTS 버전을 설치한다.)

mysql 설치중 오류가 발생하면 vs code 라이브러리 설치
구글 검색 : visual c++ 2015 redistributable v14 (vc_redist.x64.exe) 필요

mysqls 관련 프로그램을 설치한다.
https://dev.mysql.com/downloads/workbench/

1. (정)의어 : DDL - Data Definition Language
    1. [데이터베이스,테이블,사용자,뷰,인덱스,스키마, 생성/수정/삭제]
    2. 생성 : CREATE DATABASE / CRATE TABLE / CREATE USER …
    3. 수정 : ALTER DATABASE / ALTER TABLE / ALTER USER …
    4. 삭제 : DROP DATABASE / DROP TABLE / DROP USER …
    5. 이름변경 : RENAME TABLE / RENAME USER …
    6. 보기 : SELECT
       
2. (조)작어 : DML - Data Manipulation Language
    1. [데이터베이스 테이블에 자료 관리용]
    2. C(자료생성) : INSERT INTO 테이블명(필드명들), VALUES (값들),
    3. R(찾기) : SELECT [필드명] FROM [테이블] WHERE [조건]
    4. U(자료수정) : UPDATE [테이블명] SET(필드명=값) WHERE [조건]
    5. D(자료삭제) : DELETE FROM [테이블] WHERE [조건] {조건 안잡으면 다지워짐}
       
3. (제)어어 : DCL - Data Control Language
    1. [데이터의 보안, 무결성, 데이터복원, 병행수행 등…(데이터 관리목적)]
    2. ROLLBACK : 트렌젝션 복귀
    3. COMMIT : 트렌젝션 저장
        1. (트렌직션 : 일괄작업과 동시성을 볼 때 트렌젝션이란 말을 쓴다.)
    4. GRANT : 권한 부여(사용자에게 관리자가 테이블 및 기능에 권한 부여)
    5. REVOKE : 권한 삭제
