# LMS에 대한 테이블을 생성 하고 더미데이터를 입력한다(CRUD)

SHOW databases; # LMS만 보인다.
use LMS; # LMS 데이터베이스를 사용하겠다.

CREATE TABLE members (
    id          INT AUTO_INCREMENT PRIMARY KEY, -- 정수, 자동번호생성, 기본키
    uid         VARCHAR(50) NOT NULL UNIQUE,    -- 가변문자(50), 공백불가, 중복불가
    password    VARCHAR(255) NOT NULL,          -- 비밀번호
    name        VARCHAR(50) NOT NULL,           -- 이름
    role        ENUM('admin', 'manager', 'user') DEFAULT 'user', -- 열거형 (쉼표 확인!)
    active      BOOLEAN DEFAULT TRUE,           -- 불린타입 (쉼표 확인!)
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP -- 생성일
);

# 더미데이터 입력
INSERT INTO members (uid, password, name, role, active)
VALUES ('kkw', '1234', '김기원', 'admin', true);

# 더미데이터 수정
UPDATE members set name = '김지영' WHERE uid = 'kjy';

# 더미데이터 출력
SELECT * FROM members;
SELECT * FROM members where uid = 'kkw' and password = '1234' and active = TRUE ;

# 회원삭제(지우는 방법도 있지만 비활성화 하는 방법도 있다.)
DELETE FROM members WHERE uid = 'kkw'; 
UPDATE members set acive = false WHERE uid = 'kkw'; # 회원 비활성화

INSERT INTO members (uid, password, name, role, active)
VALUES ('kkw', '1234', '김기원', 'admin', true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('lhj', '5678', '임효정', 'manager', true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('kdg', '1111', '김도균', 'user', true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('ksb', '2222', '김수빈', 'user', true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('kjy', '3333', '김지양', 'user', true);

