CREATE TABLE seller (
  id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  address VARCHAR2(100)
);

CREATE TABLE buyer (
  id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  address VARCHAR2(100)
);

CREATE TABLE products (
  id NUMBER PRIMARY KEY,
  product_name VARCHAR2(50),
  price NUMBER,
  seller_id NUMBER,
  buyer_id NUMBER,
  sale_date DATE,
  FOREIGN KEY (seller_id) REFERENCES seller(id),
  FOREIGN KEY (buyer_id) REFERENCES buyer(id)
);

--some inserts

INSERT INTO seller (id, first_name, last_name, address)
VALUES (1, 'John', 'Doe', 'New York');

INSERT INTO buyer (id, first_name, last_name, address)
VALUES (1, 'Jane', 'Smith', 'Los Angeles');

INSERT INTO products (id, product_name, price, seller_id, buyer_id, sale_date)
VALUES (1, 'iPhone', 500, 1, 1, '2022-01-01');

--some selects
SELECT b.first_name, b.last_name, p.product_name, p.price, p.sale_date
FROM buyer b
JOIN products p ON b.id = p.buyer_id;




