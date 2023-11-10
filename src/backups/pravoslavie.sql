# Ролі

DROP TABLE IF EXISTS role;

CREATE TABLE
    role(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50)
    );

# Додавання ролей

INSERT INTO role (name) VALUES ('user');

INSERT INTO role (name) VALUES ('admin');

INSERT INTO role (name) VALUES ('anonymous');

# Клієнт

DROP TABLE IF EXISTS user;

CREATE TABLE
    user(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR (50),
        email VARCHAR (50),
        UNIQUE (email),
        password VARCHAR (50),
        role_id INTEGER UNSIGNED,
        FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE
    );

-- Таблиця "user"

INSERT INTO
    user (name, email, password, role_id)
VALUES (
        'John Doe',
        'john@example.com',
        'password123',
        2
    );

INSERT INTO
    user (name, email, password, role_id)
VALUES (
        'Jane Smith',
        'jane@example.com',
        'letmein456',
        2
    );

INSERT INTO
    user (name, email, password, role_id)
VALUES ('Bob Johnson', '', '', 3);

# Таблиця історії замовлень користувачів
DROP TABLE IF EXISTS order_history;
CREATE TABLE
    order_history (
        id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE,
        total_amount DECIMAL(10, 2),
        user_id INTEGER UNSIGNED,
        FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
    );

-- Таблиця "order_history"

INSERT INTO
    order_history (
        order_date,
        total_amount,
        user_id
    )
VALUES ('2023-11-04', 100.50, 1);

INSERT INTO
    order_history (
        order_date,
        total_amount,
        user_id
    )
VALUES ('2023-11-05', 75.20, 2);

INSERT INTO
    order_history (
        order_date,
        total_amount,
        user_id
    )
VALUES ('2023-11-06', 150.75, 1);

# Готелі

DROP TABLE IF EXISTS hotel;

CREATE TABLE
    hotel (
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR (50),
        address VARCHAR(100),
        roomN SMALLINT UNSIGNED,
        placeN SMALLINT UNSIGNED,
        description VARCHAR(250),
        contact_inf VARCHAR(50),
        photo VARCHAR(250)
    );

-- Таблиця "hotel"

INSERT INTO
    hotel (
        name,
        address,
        roomN,
        placeN,
        description,
        contact_inf,
        photo
    )
VALUES (
        'Grand Hotel 1',
        'Sample Address 1',
        50,
        100,
        'Hotel Description 1',
        'Contact Info 1',
        'https://images.unsplash.com/photo-1543968332-f99478b1ebdc?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    );

INSERT INTO
    hotel (
        name,
        address,
        roomN,
        placeN,
        description,
        contact_inf,
        photo
    )
VALUES (
        'Milli Hotel',
        'Sample Address 2',
        60,
        120,
        'Hotel Description 2',
        'Contact Info 2',
        'https://images.unsplash.com/photo-1455587734955-081b22074882?auto=format&fit=crop&q=80&w=1920&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    );

INSERT INTO
    hotel (
        name,
        address,
        roomN,
        placeN,
        description,
        contact_inf,
        photo
    )
VALUES (
        'Wivien Hotel',
        'Sample Address 3',
        45,
        90,
        'Hotel Description 3',
        'Contact Info 3',
        'https://images.unsplash.com/photo-1544124499-58912cbddaad?auto=format&fit=crop&q=80&w=1935&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    );

# Кімнати

DROP TABLE IF EXISTS room;

CREATE TABLE
    room(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        hotel_id INTEGER UNSIGNED,
        FOREIGN KEY (hotel_id) REFERENCES hotel(id) ON DELETE CASCADE,
        placeN SMALLINT UNSIGNED,
        status ENUM ('free', 'occupied'),
        description VARCHAR(250),
        price SMALLINT UNSIGNED
    );

-- Таблиця "room"

INSERT INTO
    room (
        hotel_id,
        placeN,
        status,
        description,
        price
    )
VALUES (
        1,
        2,
        'free',
        'Room Description 1',
        75
    );

INSERT INTO
    room (
        hotel_id,
        placeN,
        status,
        description,
        price
    )
VALUES (
        1,
        2,
        'occupied',
        'Room Description 2',
        85
    );

INSERT INTO
    room (
        hotel_id,
        placeN,
        status,
        description,
        price
    )
VALUES (
        2,
        3,
        'free',
        'Room Description 3',
        95
    );

# Фото кімнат

DROP TABLE IF EXISTS roomPhoto;

CREATE TABLE
    roomPhoto(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        room_id INTEGER UNSIGNED,
        FOREIGN KEY (room_id) REFERENCES room(id) ON DELETE CASCADE,
        photo TEXT
    );

-- Додавання записів до таблиці roomPhoto

INSERT INTO
    roomPhoto (room_id, photo)
VALUES (
        1,
        'https://a0.muscache.com/im/pictures/e5f6a006-ed2c-46f7-81cc-b5f3d713d9c1.jpg'
    ), (
        1,
        'https://a0.muscache.com/im/pictures/1c14cee3-aa96-436a-a39a-7206291eb371.jpg?'
    ), (
        1,
        'https://a0.muscache.com/im/pictures/3ffecb5f-27b6-4519-9226-d125330d7bbb.jpg?'
    );

# Зручності

DROP TABLE IF EXISTS comfort;

CREATE TABLE
    comfort(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR (50)
    );

-- Таблиця "comfort"

INSERT INTO comfort (name) VALUES ('WiFi');

INSERT INTO comfort (name) VALUES ('TV');

INSERT INTO comfort (name) VALUES ('Air Conditioning');

# Гостьовий будинок

DROP TABLE IF EXISTS house;

CREATE TABLE
    house(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        address VARCHAR(100),
        name VARCHAR (50),
        roomN SMALLINT UNSIGNED,
        placeN SMALLINT UNSIGNED,
        description VARCHAR(250),
        contact_inf VARCHAR(50),
        status ENUM ('free', 'occupied'),
        price SMALLINT UNSIGNED
    );

-- Таблиця "house"

INSERT INTO
    house (
        address,
        name,
        roomN,
        placeN,
        description,
        contact_inf,
        status,
        price
    )
VALUES (
        'Sample House 1',
        'Cozy Cottage',
        3,
        6,
        'House Description 1',
        'Contact Info 1',
        'free',
        150
    );

INSERT INTO
    house (
        address,
        name,
        roomN,
        placeN,
        description,
        contact_inf,
        status,
        price
    )
VALUES (
        'Sample House 2',
        'Mountain Retreat',
        2,
        4,
        'House Description 2',
        'Contact Info 2',
        'free',
        120
    );

INSERT INTO
    house (
        address,
        name,
        roomN,
        placeN,
        description,
        contact_inf,
        status,
        price
    )
VALUES (
        'Sample House 3',
        'Beach Villa',
        4,
        8,
        'House Description 3',
        'Contact Info 3',
        'occupied',
        200
    );

# Фото будинків

DROP TABLE IF EXISTS housePhoto;

CREATE TABLE
    housePhoto(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        house_id INTEGER UNSIGNED,
        FOREIGN KEY (house_id) REFERENCES house(id) ON DELETE CASCADE,
        photo TEXT
    );

-- Таблиця "housePhoto"

INSERT INTO
    housePhoto (house_id, photo)
VALUES (
        1,
        'https://a0.muscache.com/im/pictures/miso/Hosting-679390800019898631/original/ac5ae2a8-d1fe-4c5e-8de1-b671a84b1dc9.jpeg'
    );

INSERT INTO
    housePhoto (house_id, photo)
VALUES (
        1,
        'https://a0.muscache.com/im/pictures/miso/Hosting-679390800019898631/original/80ac817f-bc11-4bbf-8f06-c7ee3d4eb539.jpeg'
    );

INSERT INTO
    housePhoto (house_id, photo)
VALUES (
        2,
        'https://a0.muscache.com/im/pictures/e658cbe8-80e0-48a3-b6a1-6d238c9f962c.jpg'
    );

# Конектор будинків та зручностей

DROP TABLE IF EXISTS comfortPlusHouse;

CREATE TABLE
    comfortPlusHouse(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        house_id INTEGER UNSIGNED,
        FOREIGN KEY (house_id) REFERENCES house(id) ON DELETE CASCADE,
        comfort_id INTEGER UNSIGNED,
        FOREIGN KEY (comfort_id) REFERENCES comfort(id) ON DELETE CASCADE,
        status ENUM ('true', 'false')
    );

-- Таблиця "comfortPlusHouse" (продовження)

INSERT INTO
    comfortPlusHouse (house_id, comfort_id, status)
VALUES (1, 3, 'true');

INSERT INTO
    comfortPlusHouse (house_id, comfort_id, status)
VALUES (2, 1, 'true');

INSERT INTO
    comfortPlusHouse (house_id, comfort_id, status)
VALUES (2, 2, 'true');

INSERT INTO
    comfortPlusHouse (house_id, comfort_id, status)
VALUES (1, 2, 'true');

INSERT INTO
    comfortPlusHouse (house_id, comfort_id, status)
VALUES (3, 3, 'false');

# Об'єкт бронювання

DROP TABLE IF EXISTS reservation_object;

CREATE TABLE
    reservation_object(
        id INTEGER PRIMARY KEY AUTO_INCREMENT,
        house_id INTEGER UNSIGNED NULL,
        room_id INTEGER UNSIGNED NULL,
        FOREIGN KEY (house_id) REFERENCES house(id) ON DELETE CASCADE,
        FOREIGN KEY (room_id) REFERENCES room(id) ON DELETE CASCADE
    );

-- Таблиця "reservation_object"

INSERT INTO reservation_object (house_id, room_id) VALUES (1, 2);

INSERT INTO reservation_object (house_id, room_id) VALUES (2, 1);

INSERT INTO reservation_object (house_id, room_id) VALUES (3, 1);

# Бронювання

DROP TABLE IF EXISTS reservation;

CREATE TABLE
    reservation(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        user_id INTEGER UNSIGNED,
        FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
        object_id INTEGER,
        FOREIGN KEY (object_id) REFERENCES reservation_object(id) ON DELETE CASCADE,
        start_date DATE,
        end_date DATE,
        status ENUM ('active', 'denied', 'end'),
        sum SMALLINT UNSIGNED
    );

-- Таблиця "reservation"

INSERT INTO
    reservation (
        user_id,
        object_id,
        start_date,
        end_date,
        status,
        sum
    )
VALUES (
        1,
        1,
        '2023-11-07',
        '2023-11-10',
        'active',
        300
    );

INSERT INTO
    reservation (
        user_id,
        object_id,
        start_date,
        end_date,
        status,
        sum
    )
VALUES (
        2,
        2,
        '2023-11-08',
        '2023-11-12',
        'active',
        240
    );

INSERT INTO
    reservation (
        user_id,
        object_id,
        start_date,
        end_date,
        status,
        sum
    )
VALUES (
        2,
        3,
        '2023-11-09',
        '2023-11-14',
        'denied',
        150
    );

# Оплата

DROP TABLE IF EXISTS payCheck;

CREATE TABLE
    payCheck(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        reservation_id INTEGER UNSIGNED,
        FOREIGN KEY (reservation_id) REFERENCES reservation(id) ON DELETE CASCADE,
        sum SMALLINT UNSIGNED,
        date DATETIME,
        payType ENUM (
            'cash',
            'debit_card',
            'online_wallet'
        )
    );

-- Таблиця "payCheck"

INSERT INTO
    payCheck (
        reservation_id,
        sum,
        date,
        payType
    )
VALUES (
        1,
        300,
        '2023-11-07 12:00:00',
        'online_wallet'
    );

INSERT INTO
    payCheck (
        reservation_id,
        sum,
        date,
        payType
    )
VALUES (
        2,
        240,
        '2023-11-08 14:30:00',
        'debit_card'
    );

INSERT INTO
    payCheck (
        reservation_id,
        sum,
        date,
        payType
    )
VALUES (
        3,
        150,
        '2023-11-09 10:15:00',
        'cash'
    );

# Відгук

DROP TABLE IF EXISTS review;

CREATE TABLE
    review(
        id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        user_id INTEGER UNSIGNED,
        FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
        object_id INTEGER,
        FOREIGN KEY (object_id) REFERENCES reservation_object(id) ON DELETE CASCADE,
        rate TINYINT,
        CONSTRAINT check_rate CHECK (review.rate <= 5),
        text VARCHAR(250),
        date DATETIME
    );

-- Таблиця "review"

INSERT INTO
    review (
        user_id,
        object_id,
        rate,
        text,
        date
    )
VALUES (
        1,
        1,
        4,
        'Great experience!',
        '2023-11-10 15:45:00'
    );

INSERT INTO
    review (
        user_id,
        object_id,
        rate,
        text,
        date
    )
VALUES (
        2,
        2,
        5,
        'Perfect stay!',
        '2023-11-12 09:30:00'
    );

INSERT INTO
    review (
        user_id,
        object_id,
        rate,
        text,
        date
    )
VALUES (
        3,
        3,
        2,
        'Disappointed',
        '2023-11-15 11:20:00'
    );

# Створення індексів

CREATE INDEX idx_hotel_name ON hotel(name);

CREATE INDEX idx_house_num ON house(roomN, placeN);

#трігер на додавання об'єкту

#DELIMITER //

#CREATE TRIGGER add_object

#BEFORE INSERT ON reservation_object

#FOR EACH ROW

#BEGIN

#  DECLARE house_id_val VARCHAR(25);

#  DECLARE room_id_val VARCHAR(25);

#  SELECT CAST(NEW.house_id AS CHAR), CAST(NEW.room_id AS CHAR) INTO house_id_val, room_id_val;

#  SET NEW.id = CAST(CONCAT(house_id_val, room_id_val) AS SIGNED);

#END;

#//

#DELIMITER ;