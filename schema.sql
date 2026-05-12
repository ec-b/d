USE shoe_shop;
GO

-- Справочники
CREATE TABLE category       (id INT PRIMARY KEY, title NVARCHAR(255) NOT NULL);
CREATE TABLE manufacturer   (id INT PRIMARY KEY, title NVARCHAR(255) NOT NULL);
CREATE TABLE name           (id INT PRIMARY KEY, title NVARCHAR(255) NOT NULL);
CREATE TABLE role           (id INT PRIMARY KEY, title NVARCHAR(255) NOT NULL);
CREATE TABLE status         (id INT PRIMARY KEY, title NVARCHAR(255) NOT NULL);
CREATE TABLE supplier       (id INT PRIMARY KEY, title NVARCHAR(255) NOT NULL);
CREATE TABLE unit           (id INT PRIMARY KEY, title NVARCHAR(255) NOT NULL);

CREATE TABLE pickup_point (
    id      INT PRIMARY KEY,
    address NVARCHAR(500) NOT NULL
);

CREATE TABLE [user] (
    id        INT PRIMARY KEY,
    role_id   INT NOT NULL REFERENCES role(id),
    full_name NVARCHAR(255) NOT NULL,
    login     NVARCHAR(100) NOT NULL,
    password  NVARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id              INT PRIMARY KEY,
    article         NVARCHAR(100) NOT NULL,
    name_id         INT NOT NULL REFERENCES name(id),
    unit_id         INT NOT NULL REFERENCES unit(id),
    price           DECIMAL(10,2) NOT NULL,
    supplier_id     INT NOT NULL REFERENCES supplier(id),
    manufacturer_id INT NOT NULL REFERENCES manufacturer(id),
    category_id     INT NOT NULL REFERENCES category(id),
    discount        DECIMAL(5,2) NULL,
    stock_quantity  INT NOT NULL DEFAULT 0,
    description     NVARCHAR(MAX) NULL,
    photo           NVARCHAR(500) NULL
);

CREATE TABLE [order] (
    id              INT PRIMARY KEY,
    order_date      DATETIME NOT NULL,
    delivery_date   DATETIME NULL,
    pickup_point_id INT NOT NULL REFERENCES pickup_point(id),
    user_id         INT NOT NULL REFERENCES [user](id),
    code            NVARCHAR(100) NULL,
    status_id       INT NOT NULL REFERENCES status(id)
);

CREATE TABLE order_item (
    id         INT PRIMARY KEY,
    order_id   INT NOT NULL REFERENCES [order](id),
    product_id INT NOT NULL REFERENCES product(id),
    quantity   INT NOT NULL
);
