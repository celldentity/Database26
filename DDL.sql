CREATE DATABASE DoItSQL;

CREATE DATABASE doitsql;
USE doitsql;

CREATE TABLE doit_create_table (
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);

-- DROP 문으로 테이블 삭제
DROP TABLE doit_create_table;

-- INSERT 문으로 데이터 삽입
-- VARCHAR 배리어블 캐릭터로 문자열을 집어넣겠다는 선언이고 최대 50글자의 길이를 넣겠다는 뜻
CREATE TABLE doit_dml (
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);
INSERT INTO doit_dml (col_1, col_2, col_3) VALUES (1, 'DoItSQL', '2023-01-01');

-- 테이블 조회하여 삽입한 데이터 확인
SELECT * FROM doit_dml

-- 데이터 유형 불일치로 인한 오류 발생 예
INSERT INTO doit_dml(col_1) VALUES ('문자 입력');

-- 삽입된 데이터 확인
SELECT * FROM doit_dml;

-- 열 개수 불일치로 인한 오류 발생시키기
INSERT INTO doit_dml VALUES (3, 'col_3 값 생략');

-- 특정 열에만 데이터 삽입해보기
INSERT INTO doit_dml(col_1, col_2) VALUES (3, 'col_3 값 생략');

-- 삽입된 데이터 확인
SELECT * FROM doit_dml;

-- 삽입할 데이터의 순서 변경해보기(컬럼 위치가 바뀌어도 데이터는 짝만 맞으면 잘 들어간다.)
INSERT INTO doit_dml(col_1, col_3, col_2) VALUES (4, '2023-01-03', '열순서 변경');

-- 삽입된 데이터 확인
SELECT * FROM doit_dml;

-- 여러 데이터를 한 번에 삽입하기
INSERT INTO doit_dml(col_1, col_2, col_3) VALUES (5, '데이터 입력5', '2023-01-03'), (6, '데이터 입력6', '2023-01-03'), (7, '데이터 입력7', '2023-01-03');

-- 삽입된 데이터 확인하기
SELECT * FROM doit_dml;

-- NULL을 허용하지 않는 테이블 생성 후 NULL 삽입 시 오류가 발생한 예
CREATE TABLE doit_notnull (
col_1 INT,
col_2 VARCHAR(50) NOT NULL
);
INSERT INTO doit_notnull (col_1) VALUES (1); -- 눌을 허용하지 않는데, 입력했기 때문에 테이블에 입력이 안된 상황이다. 2번 컬럼에 낫 눌을 사용했다면 눌 값이 없도록 해야한다.

-- UPDATE 문으로 데이터 수정하기 1
UPDATE doit_dml SET col_2 = '데이터 수정'
WHERE col_1 = 4;

-- 테이블 확인하기
SELECT * FROM doit_dml;

-- 안전모드 해제하고 실행하기
set SQL_SAFE_UPDATES=0;

-- UPDATE 문으로 데이터 수정하기 2
UPDATE doit_dml SET col_2 = '데이터 수정'
WHERE col_1 = 4;

-- 테이블 확인하기
SELECT * FROM doit_dml;

-- UPDATE 문으로 테이블 전체 데이터 수정하기  (첫번재 컬럼값에 +10씩을 더하겠다는 의미)
UPDATE doit_dml SET col_1 = col_1 + 10;

-- 테이블 확인하기
SELECT * FROM doit_dml;

-- DELETE 문으로 데이터 수정
DELETE FROM doit_dml WHERE col_1 = 14;

-- 테이블 확인하기   (컬럼 1 기준 14번 데이터행이 사라진 걸 볼 수 있다)
SELECT * FROM doit_dml;

-- DELETE 로 테이블 전체 삭제하기
DELETE FROM doit_dml;

-- 테이블 확인하기   (컬럼 1 기준 14번 데이터행이 사라진 걸 볼 수 있다)
SELECT * FROM doit_dml;
