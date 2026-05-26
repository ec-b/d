USE shoe_shop;
GO

-- справочники
IF OBJECT_ID('category', 'U') IS NULL
    CREATE TABLE category (id INT IDENTITY(1,1) PRIMARY KEY, title NVARCHAR(255) NOT NULL);

IF OBJECT_ID('manufacturer', 'U') IS NULL
    CREATE TABLE manufacturer (id INT IDENTITY(1,1) PRIMARY KEY, title NVARCHAR(255) NOT NULL);

IF OBJECT_ID('[name]', 'U') IS NULL
    CREATE TABLE [name] (id INT IDENTITY(1,1) PRIMARY KEY, title NVARCHAR(255) NOT NULL);

IF OBJECT_ID('role', 'U') IS NULL
    CREATE TABLE role (id INT IDENTITY(1,1) PRIMARY KEY, title NVARCHAR(255) NOT NULL);

IF OBJECT_ID('status', 'U') IS NULL
    CREATE TABLE status (id INT IDENTITY(1,1) PRIMARY KEY, title NVARCHAR(255) NOT NULL);

IF OBJECT_ID('supplier', 'U') IS NULL
    CREATE TABLE supplier (id INT IDENTITY(1,1) PRIMARY KEY, title NVARCHAR(255) NOT NULL);

IF OBJECT_ID('unit', 'U') IS NULL
    CREATE TABLE unit (id INT IDENTITY(1,1) PRIMARY KEY, title NVARCHAR(255) NOT NULL);

IF OBJECT_ID('pickup_point', 'U') IS NULL
    CREATE TABLE pickup_point (
        id      INT IDENTITY(1,1) PRIMARY KEY,
        address NVARCHAR(500) NOT NULL
    );

IF OBJECT_ID('[user]', 'U') IS NULL
    CREATE TABLE [user] (
        id        INT IDENTITY(1,1) PRIMARY KEY,
        role_id   INT NOT NULL REFERENCES role(id),
        full_name NVARCHAR(255) NOT NULL,
        login     NVARCHAR(100) NOT NULL,
        password  NVARCHAR(255) NOT NULL
    );

IF OBJECT_ID('product', 'U') IS NULL
    CREATE TABLE product (
        id              INT IDENTITY(1,1) PRIMARY KEY,
        article         NVARCHAR(100) NOT NULL,
        name_id         INT NOT NULL REFERENCES [name](id),
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

IF OBJECT_ID('[order]', 'U') IS NULL
    CREATE TABLE [order] (
        id              INT IDENTITY(1,1) PRIMARY KEY,
        order_date      DATETIME NOT NULL,
        delivery_date   DATETIME NULL,
        pickup_point_id INT NOT NULL REFERENCES pickup_point(id),
        user_id         INT NOT NULL REFERENCES [user](id),
        code            NVARCHAR(100) NULL,
        status_id       INT NOT NULL REFERENCES status(id)
    );

IF OBJECT_ID('order_item', 'U') IS NULL
    CREATE TABLE order_item (
        id         INT IDENTITY(1,1) PRIMARY KEY,
        order_id   INT NOT NULL REFERENCES [order](id),
        product_id INT NOT NULL REFERENCES product(id),
        quantity   INT NOT NULL
    );
