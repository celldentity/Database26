USE Sakila;

-- first_name 열을 조회
SELECT first_name FROM customer;

-- 2개의 열을 조회
SELECT first_name, last_name FROM customer;

-- 모든 열을 조회
SELECT * FROM customer;

-- customer 테이블의 열 정보를 조회
SHOW COLUMNS FROM sakila.customer;

-- WHERE 문, = 연산자로 특정 값 조회
SELECT * FROM customer WHERE first_name = 'MARIA';

-- address_id가 200인 행을 조회
SELECT * FROM customer WHERE address_id = 200;

-- address_id가 200 미만인 행을 조회
SELECT * FROM customer WHERE address_id < 200;

-- first_name이 MARIA인 행을 조회
SELECT * FROM customer WHERE first_name = 'MARIA';

-- first_name이 MARIA 미만인 행을 조회
SELECT * FROM customer WHERE first_name < 'MARIA';

-- payment_date가 2005-07-09 13:24:07인 행을 조회
SELECT * FROM payment WHERE payment_date = '2005-07-09 13:24:07';

-- payment_date가 2005년 7월 9일 미만인 행을 조회
SELECT * FROM payment WHERE payment_date < '2005-07-09';

-- 정해진 범위에 해당하는 데이터 조회
SELECT * FROM customer WHERE address_id BETWEEN 5 AND 10;

-- 2005년 6월 17일~2005년 7월 19일을 포함한 날짜 조회
SELECT * FROM payment WHERE payment_date BETWEEN '2005-06-17' AND '2005-07-19';

-- 정확한 날짜를 조회
SELECT * FROM payment WHERE payment_date = '2005-07-08 07:33:56';

-- first_name 열에서 M~O 범위의 데이터 조회
SELECT * FROM customer WHERE first_name BETWEEN 'M' AND 'O';

-- first_name 열에서 M~O 범위의 값을 제외한 데이터 조회
SELECT * FROM customer WHERE first_name NOT BETWEEN 'M' AND 'O';

-- 두 조건을 만족하는 데이터 조회
SELECT * FROM city WHERE city = 'Sunnyvale' AND country_id= 103;

-- 두 개의 비교 연산식을 만족하는 데이터 조회
SELECT * FROM payment WHERE payment_date >= '2005-06-01' AND payment_date <= '2005-07-05';

-- 한 조건을 만족한 경우 데이터 조회
SELECT * FROM customer WHERE first_name = 'MARIA' OR first_name = 'LINDA';

-- OR를 두 개 이상 사용한 경우
SELECT * FROM customer WHERE first_name = 'MARIA' OR first_name = 'LINDA' OR first_name = 'NANCY';

-- IN을 활용한 데이터 조회
SELECT * FROM customer WHERE first_name IN ('MARIA', 'LINDA','NANCY');

-- 요구 사항을 반영해 작성한 쿼리
SELECT * FROM city WHERE country_id = 103 OR country_id = 86 AND city IN ('Cheju', 'Sunnyvale', 'Dallas');

-- 쿼리 순서를 변경
SELECT * FROM city WHERE country_id = 86 OR country_id = 103 AND city IN ('Cheju', 'Sunnyvale', 'Dallas' );

-- 소괄호로 우선순위를 다시 정해 데이터를 조회
SELECT * FROM city WHERE (country_id = 103 OR country_id = 86) AND city IN ('Cheju', 'Sunnyvale', 'Dallas');

-- IN, AND를 결합하여 조회
SELECT * FROM city WHERE country_id IN (103, 86) AND city IN ('Cheju', 'Sunnyvale', 'Dallas' );

-- Null이 있는 테이블 조회
SELECT * FROM address;

-- = 연산자를 사용해 NULL 데이터 조회
SELECT * FROM address WHERE address2 = NULL;

-- address2 열에서 NULL인 데이터 조회
SELECT * FROM address WHERE address2 IS NULL;

-- address2 열에서 NULL이 아닌 데이터 조회
SELECT * FROM address WHERE address2 IS NOT NULL;

-- address2 열에서 NULL이 아닌 데이터 조회
SELECT * FROM address WHERE address2 = '';

-- first_name 열을 기준으로 정렬
SELECT * FROM customer ORDER BY first_name;

-- last_name 열을 기준으로 정렬
SELECT * FROM customer ORDER BY last_name;

-- store_id, first_name 순으로 데이터 정렬
SELECT * FROM customer ORDER BY store_id, first_name;

-- first_name, store_id 순으로 데이터 정렬
SELECT * FROM customer ORDER BY first_name, store_id;

-- first_name 열을 오름차순으로 정렬
SELECT * FROM customer ORDER BY first_name ASC;

-- first_name 열을 내림차순으로 정렬
SELECT * FROM customer ORDER BY first_name DESC;

-- ASC와 DESC를 조합하여 데이터 정렬
SELECT * FROM customer ORDER BY store_id DESC, first_name ASC;

-- LIMIT으로 상위 10개의 데이터 조회
SELECT * FROM customer ORDER BY store_id DESC, first_name ASC LIMIT 10;

-- LIMIT으로 101번째부터 10개의 데이터 조회
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 100, 10;

-- 데이터 100 개를 건너뛰고 데이터 10개 조회
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 10 OFFSET 100;

-- 첫 번째 글자가 A로 시작하는 데이터 조회
SELECT * FROM customer WHERE first_name LIKE 'A%';

-- 첫 번째 글자가 AA로 시작하는 데이터 조회
SELECT * FROM customer WHERE first_name LIKE 'AA%';

-- A로 끝나는 모든 데이터 조회
SELECT * FROM customer WHERE first_name LIKE '%A';

-- RA로 끝나는 모든 데이터 조회
SELECT * FROM customer WHERE first_name LIKE '%RA';

-- A를 포함한 모든 데이터 조회
SELECT * FROM customer WHERE first_name LIKE '%A%';

-- 첫 번째 글자가 A로 시작하지 않는 데이터만 조회
SELECT * FROM customer WHERE first_name NOT LIKE 'A%';

-- 특수 문자를 포함한 임의의 테이블 생성
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE;

-- 특수 문자 %를 포함한 데이터 조회
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%';

-- ESCAPE로 특수 문자 %를 포함한 데이터 조회
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%#%%' ESCAPE '#';

-- ESCAPE와 !로 특수 문자 %를 포함한 데이터 조회
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%!%%' ESCAPE '!';

-- A로 시작하면서 문자열 길이가 2인 데이터 조회
SELECT * FROM customer WHERE first_name LIKE 'A_';

-- A로 시작하면서 문자열 길이가 3인 데이터 조회
SELECT * FROM customer WHERE first_name LIKE 'A__';

-- A로 끝나면서 문자열 길이가 3인 데이터 조회
SELECT * FROM customer WHERE first_name LIKE '__A';

-- A로 시작하고 A로 끝나면서 문자열 길이가 4인 데이터 조회
SELECT * FROM customer WHERE first_name LIKE 'A__A';

-- 문자열 길이가 5인 데이터 조회
SELECT * FROM customer WHERE first_name LIKE '_____';

-- A_R로 시작하는 문자열 조회
SELECT * FROM customer WHERE first_name LIKE 'A_R%';

-- __R로 시작하는 문자열 조회
SELECT * FROM customer WHERE first_name LIKE '__R%';

-- A로 시작하면서 R_로 끝나는 문자열 조회
SELECT * FROM customer WHERE first_name LIKE 'A%R_';

-- ^, |, $를 사용해 데이터 조회
SELECT * FROM customer WHERE first_name REGEXP '^K|N$';

-- […]를 사용해 데이터 조회
SELECT * FROM customer WHERE first_name REGEXP 'K[L-N]';

-- [^…]를 사용해 데이터 조회
SELECT * FROM customer WHERE first_name REGEXP 'K[^L-N]';

-- %와 […]을 사용해 데이터 조회
SELECT * FROM customer WHERE first_name LIKE 'S%' AND first_name REGEXP 'A[L-N]';

-- 와일드카드 조합으로 데이터 조회
SELECT * FROM customer WHERE first_name LIKE '_______' AND first_name REGEXP 'A[L-N]' AND first_name REGEXP 'O$';

-- special_features 열의 데이터를 그룹화
SELECT special_features FROM film GROUP BY special_features;

-- rating 열의 데이터를 그룹화
SELECT rating FROM film GROUP BY rating;

-- special_features, rating 열 순서로 데이터를 그룹화
SELECT special_features, rating FROM film GROUP BY special_features, rating;

-- rating, special_features 열 순서로 데이터를 그룹화
SELECT rating, special_features FROM film GROUP BY special_features, rating;

-- COUNT 함수로 그룹에 속한 데이터 개수 세기
SELECT special_features, COUNT(*) AS cnt FROM film GROUP BY special_features;

-- 두 열의 데이터 그룹에 속한 데이터 개수 세기
SELECT 
	special_features, rating, COUNT(*) AS cnt 
FROM film
GROUP BY special_features, rating 
ORDER BY special_features, rating, cnt DESC;

-- SELECT 문과 GROUP BY 문의 열 이름을 달리할 경우
SELECT special_features, rating, COUNT(*) AS cnt FROM film GROUP BY rating;

-- rating 열에서 G인 데이터만 필터링
SELECT 
	special_features, rating 
FROM film
GROUP BY special_features, rating
HAVING rating = 'G';

-- special_features 열에서 데이터 개수가 70보다 큰 것만 필터링
SELECT 
	special_features, COUNT(*) AS cnt 
FROM film
GROUP BY special_features
HAVING cnt > 70;

-- 그룹화하지 않은 열을 필터링할 경우
SELECT
	special_features, COUNT(*) AS cnt 
FROM film
GROUP BY special_features
HAVING rating = 'G';

-- 오류 없이 필터링할 경우
SELECT 
	special_features, rating, COUNT(*) AS cnt 
FROM film
GROUP BY special_features, rating
HAVING rating = 'R' AND cnt > 8;

-- 두 열의 데이터 중복 제거
SELECT DISTINCT special_features, rating FROM film;

-- GROUP BY 문으로 두 열을 그룹화한 경우
SELECT special_features, rating FROM film GROUP BY special_features, rating;

-- DISTINCT 문에 COUNT 함수를 사용할 경우
SELECT DISTINCT special_features, rating, COUNT(*) AS cnt FROM film;