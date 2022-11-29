

DROP TABLE IF EXISTS User;

CREATE TABLE User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    email STRING NOT NULL UNIQUE,
    password STRING NOT NULL,
    type STRING NOT NULL
);

INSERT INTO User(first_name,last_name,email,password,type) VALUES ('Khai Gene','Quah','kg@email.com','sha256$lY2wkUe2jo0ricvx$f4ed8e6a3dab857606e96020a608d981294bd44353b5a95d3226eceaf55e3c30','admin');
INSERT INTO User(first_name,last_name,email,password,type) VALUES ('Keh Jin','Boo','kj@email.com','sha256$lY2wkUe2jo0ricvx$f4ed8e6a3dab857606e96020a608d981294bd44353b5a95d3226eceaf55e3c30','admin');  
INSERT INTO User(first_name,last_name,email,password,type) VALUES ('Johnson','Lim','johnson@email.com','sha256$lY2wkUe2jo0ricvx$f4ed8e6a3dab857606e96020a608d981294bd44353b5a95d3226eceaf55e3c30','customer');
INSERT INTO User(first_name,last_name,email,password,type) VALUES ('Brian','Ooi','brian@email.com','sha256$lY2wkUe2jo0ricvx$f4ed8e6a3dab857606e96020a608d981294bd44353b5a95d3226eceaf55e3c30','customer');

DROP TABLE IF EXISTS Review;

CREATE TABLE Review (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title STRING NOT NULL,
    content STRING NOT NULL,
    rating FLOAT NOT NULL,
    smartphoneID INTEGER NOT NULL,
    userID INTEGER NOT NULL,
    FOREIGN KEY(smartphoneID) REFERENCES Smartphone(id),
    FOREIGN KEY(userID) REFERENCES User(id)
);

DROP TABLE IF EXISTS Smartphone;

CREATE TABLE Smartphone (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand STRING NOT NULL,
    model STRING NOT NULL,
    processor STRING NOT NULL,
    ram STRING NOT NULL,
    colour STRING NOT NULL,
    battery STRING NOT NULL,
    lowprice INTEGER NOT NULL,
    highprice INTEGER NOT NULL,
    screenSize STRING NOT NULL,
    refreshRate STRING NOT NULL,
    description STRING NOT NULL,
    image_URL STRING NOT NULL
);

INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Apple','Iphone 13','Hexa-core (2x3.23 GHz Avalanche + 4x1.82 GHz Blizzard)','128GB 4GB RAM, 256GB 4GB RAM, 512GB 4GB RAM','Gold, Silver, Sierra Blue',
'Li-Ion 3240 mAh', 3639, 4199,'6.1 inches','60Hz','The iPhone 13 display has rounded corners that 
follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard 
rectangular shape, the screen is 6.06 inches diagonally (actual viewable area is less).','./iphone13.webp');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy S21 5G','Octa-core (1x2.9 GHz Cortex-X1 & 3x2.80 GHz Cortex-A78 & 4x2.2 GHz Cortex-A55)','128GB 8GB RAM, 256GB 8GB RAM',
'Phantom Gray, Phantom White, Phantom Violet, Phantom Pink','Li-Ion 4000 mAh', 2199, 3699,'6.2 inches','120Hz','The Samsung Galaxy S21 
5G is a smartphone that was tested with the Android 11 operating system. This model weighs 6 ounces, has a 6.2 inch display, 12-megapixel main camera, 
and 10-megapixel selfie camera. It comes with 8GB of RAM. It was tested with 128GB of storage.','./samsung-galaxy-S21-5G.jpg');


DROP TABLE IF EXISTS Favourite;

CREATE TABLE Favourite (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL,
    smartphoneID INTEGER NOT NULL,
    FOREIGN KEY(userID) REFERENCES User(id),
    FOREIGN KEY(smartphoneID) REFERENCES Smartphone(id)
);
