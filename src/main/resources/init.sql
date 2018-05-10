/*
    Database initialization script that runs on every web-application redeployment.
*/
DROP TABLE IF EXISTS coupons_shops_users CASCADE;
DROP TABLE IF EXISTS coupons CASCADE;
DROP TABLE IF EXISTS shops CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
	CONSTRAINT email_not_empty CHECK (email <> ''),
	CONSTRAINT password_not_empty CHECK (password <> '')
);

CREATE TABLE shops (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
	CONSTRAINT name_not_empty CHECK (name <> '')
);

CREATE TABLE coupons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    percentage INTEGER NOT NULL,
    user_id INTEGER,
    CONSTRAINT name_not_empty CHECK (name <> ''),
	CONSTRAINT percentage_between_bounds CHECK (percentage >= 0 AND percentage <= 100),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE coupons_shops_users (
    coupon_id INTEGER,
    shop_id INTEGER,
    user_id INTEGER,
    PRIMARY KEY (coupon_id, shop_id, user_id),
    FOREIGN KEY (coupon_id) REFERENCES coupons(id),
    FOREIGN KEY (shop_id) REFERENCES shops(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (email, password) VALUES
	('user1@user1', '1'), -- 1
	('user2@user2', '2'), -- 2
	('user3@user3', '3'); -- 3

INSERT INTO shops (name) VALUES
	('SPAR'),   -- 1
	('Tesco'),  -- 2
	('Auchan'), -- 3
	('LIDL'),   -- 4
	('ALDI');   -- 5

INSERT INTO coupons (name, percentage, user_id) VALUES
	('Sausage discount', 10, 1),           -- 1
	('Bread super-sale', 50, 1),           -- 2
	('Bread super-sale', 40, 3),           -- 3
	('20% off from EVERYTHING!', 20, 3),   -- 4
	('1 product for FREE!', 100, 3);       -- 5

INSERT INTO coupons_shops_users (coupon_id, shop_id, user_id) VALUES
    (1, 1, 1), -- 1
    (1, 2, 1),
    (1, 3, 1),
    (2, 1, 1), -- 2
    (2, 2, 1),
    (2, 3, 1),
    (2, 5, 1),
    (3, 1, 3), -- 3
    (3, 2, 3),
    (3, 5, 3),
    (4, 3, 3), -- 4
    (5, 2, 3), -- 5
    (5, 5, 3);
