use sakila;


-- 내부 조인한 테이블에서 조건에 맞는 데이터 조회
SELECT
	a.customer_id, a.store_id, a.first_name, a.last_name, a.email, a.address_id AS a_address_id,
    b.address_id AS b_address_id, b.address, b.district, b.city_id, b.postal_code, b.phone, b.location
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
WHERE a.first_name = 'ROSA';

-- 열 이름이 유일하지 않은 경우
SELECT
	adress_id
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
WHERE a.first_name = 'ROSA';

-- 2개의 조인 조건으로 조인한 테이블에서 조건에 맞는 데이터 조회
SELECT # 조건에 맞게 조회된 데이터는 없지만 관계없는 열끼리도 조인할 수 있다.
	a.customer_id, a.first_name, a.last_name,
    b.address_id, b.address, b.district, b.postal_code
FROM customer AS a
	INNER join address AS b ON a.address_id = b.address_id AND a.create_date = b.last_update
WHERE a.first_name = 'ROSA';

-- 3개의 테이블을 조인한 테이블에서 조건에 맞는 데이터 조회
SELECT
	a.customer_id, a.first_name, a.last_name,
    b.address_id, b.address, b.district, b.postal_code,
    c.city_id, c.city
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
    INNER JOIN city AS c ON b.city_id = c.city_id
WHERE a.first_name = 'ROSA';

-- LEFT OUTER JOIN한 결과 조회
SELECT
	a.address, a.address_id AS a_address_id,
    b.address_id AS b_address_id, b.store_id
FROM address AS a
	LEFT OUTER JOIN store AS b ON a.address_id = b.address_id;
    
-- LEFT OUTER JOIN으로 조회한 결과에서 NULL만 조회
SELECT
	a.address, a.address_id AS a_address_id,
    b.address_id AS b_address_id, b.store_id
FROM address AS a
	LEFT OUTER JOIN store AS b ON a.address_id = b.address_id
WHERE b.address_id IS NULL

-- RIGHT OUTER JOIN한 결과 조회
SELECT
	a.address, a.address_id AS a_address_id,
    b.address_id AS b_address_id, b.store_id
FROM address AS a
	RIGHT OUTER JOIN store AS b ON a.address_id = b.address_id;
    
-- FULL OUTER JOIN으로 조회한 결과에서 NULL만 조회
SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	RIGHT OUTER JOIN address AS b ON a.address_id = b.address_id
WHERE a.address_id IS NULL;

UNION

SELECT
	a.address_id AS a_address_id, a.store_id,
    b.address, b.address_id AS b_address_id
FROM store AS a
	RIGHT OUTER JOIN address AS b ON a.address_id = b.address_id;
    
-- 샘플 데이터 생성
CREATE TABLE doit_cross1 (NUM INT);
CREATE TABLE doit_cross2 (name VARCHAR(10));

INSERT INTO doit_cross1 VALUES (1), (2), (3);
INSERT INTO doit_cross2 VALUES ('Do'), ('It'), ('SQL');

-- CROSS JOIN 문을 적용한 쿼리
SELECT
	a.num, b.name
FROM doit_cross1 AS a
	CROSS JOIN doit_cross2 AS b
ORDER BY a.num;

-- WHERE 문을 사용한 CROSS
SELECT
	a.num, b.name
FROM doit_cross1 AS a
	CROSS JOIN doit_cross2 AS b
WHERE a.num = 1;

-- SELF JOIN 문을 적용한 쿼리 1
SELECT
	a.customer_id AS a_customer_id, b.customer_id AS b_customer_id
FROM customer AS a
	INNER JOIN customer AS b ON a.customer_id = b.customer_id
    
-- SELF JOIN 문을 적용한 쿼리2
SELECT
	a.payment_id, a.amount, b.payment_id, b.amount, b.amount - a.amount AS profit_amount
FROM payment AS a
		LEFT OUTER JOIN payment AS b ON a.payment_id = b.payment_id -1;
        
-- 단일 행 서브 쿼리 적용
SELECT * FROM customer
WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name = 'ROSA');
	
-- 잘못된 단일 행 서브 쿼리 적용 시 오류 발생 예
SELECT * FROM customer #주어진 결과가 단일 행이 아니어서 오류가 난다.
WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- IN을 활용한 다중 행 서브 쿼리 적용 1
SELECT * FROM customer WHERE first_name IN ('ROSA', 'ANA');

-- IN을 활용한 다중 행 서브 쿼리 적용2
SELECT * FROM customer
WHERE customer_id IN (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- 테이블 3개를 조인하는 쿼리
SELECT
	a.film_id, a.title
FROM film AS a
	INNER JOIN film_category AS b ON a.film_id = b.film_id
    INNER JOIN category AS c ON b.category_id = c.category_id
where c.name = 'Action';

-- IN을 활용한 서브 쿼리 적용
SELECT
	film_id, title
FROM film
WHERE film_id IN (
	SELECT a.film_id
    FROM film_category AS a
		INNER JOIN category AS b ON a.category_id = b.category_id
	WHERE b.name = 'Action'
    );

-- NOT IN을 활용한 서브 쿼리 적용
SELECT
	film_id, title
FROM film
WHERE film_id NOT IN (
	SELECT a.film_id
    FROM film_category AS a
		INNER JOIN category AS b ON a.category_id = b.category_id
	WHERE b.name = 'Action'
    );
    
-- = ANY를 활용한 서브 쿼리 적용
SELECT * FROM customer
WHERE customer_id = ANY (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- < ANY를 활용한 서브 쿼리 적용
SELECT * FROM customer
WHERE customer_id < ANY (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));	

-- > ANY를 활용한 서브 퀄 ㅣ적용
SELECT * FROM customer
WHERE customer_id > ANY (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- EXISTS를 활용한 서브 쿼리 적용: TRUE를 반환하는 경우
SELECT * FROM customer
WHERE EXISTS (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- EXISTS를 활용한 서브 쿼리 적용: FALSE를 반환하는 경우
SELECT * FROM customer # where절에 사용된 서브 쿼리에 결괏값이 없으므로 fALSE로 판단되어 주 쿼리가 실행되지 않아서 아무런 결과가 나타나지 않았다.
WHERE EXISTS (SELECT customer_id FROM customer WHERE first_name IN ('KANG'));

-- NOT EXISTS를 활용한 서브 쿼리 적용: TURE를 반환하는 경우
SELECT * FROM customer
WHERE NOT EXISTS (SELECT customer_id FROM customer WHERE first_name IN ('KANG'));

-- ALL을 활용한 서브 쿼리 적용
SELECT * FROM customer
WHERE customer_id = ALL (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'AMA'));

-- 테이블 조인
SELECT
	a.film_id, a.title, a.special_features, C.name
FROM film AS a
	INNER JOIN film_category AS b ON a.film_id = b.film_id
    INNER JOIN category AS c ON b.category_id = c.category_id
WHERE a.film_id > 10 AND a.film_id < 20;

-- FROM 문에 서브 쿼리 적용
SELECT
	a.film_id, a.title, a.special_features, x.name
FROM film AS a
INNER JOIN (
	SELECT
		b.film_id, c.name
	FROM film_category AS b
		INNER JOIN category AS c ON b.category_id = c.category_id
	WHERE b.film_id > 10 AND b.film_id < 20
    ) AS x ON a.film_id = x.film_id;
-- 테이블조인
SELECT
	a.film_id, a.title, a.special_features, c.name
FROM film AS a
	INNER JOIN film_category AS b ON a.film_id = b.film_id
    INNER JOIN category AS c ON b.category_id = c.category_id
WHERE a.film_id > 10 AND a.film_id < 20;

-- SELECT문에 서브 쿼리 적용
SELECT
	a.film_id, a.title, a.special_features, (SELECT c.name FROM film_category as
    b INNER JOIN category AS c ON b.category_id = c.category_id WHERE a.film_id =
    b.film_id) AS name
FROM film AS a
WHERE a.film_id > 10 AND a.film_id < 20;