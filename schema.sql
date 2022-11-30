

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
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Apple','Iphone 14','Hexa-core (2x3.23 GHz Avalanche + 4x1.82 GHz Blizzard)','128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM','Midnight, Purple, Starlight, Blue, Red','Li-Ion 3279 mAh',
4199,5699,'6.1 inches','120Hz','A15 Bionic, with a 5‑core GPU, powers all the latest features and makes graphically intense games and AR apps feel ultra-fluid. An updated internal design delivers 
better thermal efficiency, so you can stay in the action longer.','./iphone14.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy S22 Ultra 5G','Octa-core (1x2.8 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.8 GHz Cortex-A510)','128GB 8GB RAM, 256GB 12GB RAM, 512GB 12GB RAM, 1TB 12GB RAM',
'Phantom Black, White, Burgundy, Green, Graphite, Red, Sky Blue, Bora Purple','Li-Ion 5000 mAh',4799,5399,'6.8 inches','120Hz','The Samsung Galaxy S22 Ultra 5G is powered by a Qualcomm 
SM8450 Snapdragon 8 Gen 1 (4 nm) CPU processor with 8GB RAM, 128GB ROM.','./samsung-galaxy-S22-Ultra.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Huawei','Huawei P30','Octa-core (2x2.6 GHz Cortex-A76 & 2x1.92 GHz Cortex-A76 & 4x1.8 GHz Cortex-A55)','64GB 8GB RAM, 128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM','Aurora, Amber Sunrise, Breathing Crystal, Black, Pearl White',
'Li-Po 3650 mAh',1599,2685,'6.1 inches','60Hz','The HUAWEI P30 features various functional cases5 with unique colours and design styles. Be beautiful in your own way with extra protection.','./huawei-p30.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Huawei','Huawei Mate 50','Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x2.0 GHz Cortex-A510)','128GB 8GB RAM, 256GB 8GB RAM, 512GB 8GB RAM','Black, Silver, Purple, Orange',
'Li-Po 4460 mAh',2999,3699,'6.7 inches','90Hz','With the Ultra Aperture XMAGE Camera, HUAWEI Mate 50 allows you to capture brilliance day and night.','./huawei-mate-50.png');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Xiaomi', 'Xiaomi 12 pro',' Octa-core (1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)', '128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM', 'Blue,Purple,Grey', 
'Li-Po 4600 mAh', 2808, 3131, '6.73 inches',' 120HZ refresh rate', 'The Xiaomi 12 Pro is powered by a Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm) CPU processor. 
The device also has a 6.73-inch LTPO AMOLED (1440 x 3200 pixels, 521 ppi) display. It has a Triple camera and supports Wifi, Bluetooth, NFC, GPS, 4G LTE and 5G. It running on Android 12, MIUI 13.', 
'./xiaomi-12-pro.jpg');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Xiaomi', 'Xiaomi Mi 11',' Octa-core (1x2.84 GHz Cortex-X1 & 3x2.42 GHz Cortex-A78 & 4x1.80 GHz Cortex-A55', '128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM', 'Blue,White,Grey', 'Li-Po 4600 mAh', 
1899, 2799, '6.81 inches',' 120HZ refresh rate', 'The Xiaomi Mi 11 is powered by a Qualcomm SM8350 Snapdragon 888 (5 nm) CPU processor. The device also has a 6.81-inch AMOLED (1440 x 3200 pixels, 515 ppi) display. 
It has a Triple camera and supports Wifi, NFC, GPS, 3G, 4G LTE and 5G. It  running on Android 11, MIUI 12.', './xiaomi-mi-11.jpg');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Lenovo', 'Lenovo Legion Pro',' Octa-core (1x3.09 GHz Cortex-A77 & 3x2.42 GHz Cortex-A77 & 4x1.80 GHz Cortex-A55)', '128GB 8GB RAM, 128GB 12GB RAM, 
256GB 12GB RAM, 512GB 16GB RAM', 'Black', 'Li-Po 5000 mAh', 2098, 3299, '6.65 inches',' 120HZ refresh rate', 'The Lenovo Legion Phone Duel is powered by 
a Qualcomm SM8250 Snapdragon 865+ (7 nm+) CPU processor. The device also has a 6.65-inch AMOLED (1080 x 2340 pixels, 388 ppi) display. It has a Dual camera and supports Wifi, NFC, GPS, 3G, 4G
 LTE and 5G. Itrunning on Android 10, Legion OS/ ZUI12.', './lenovo-legion-pro.jpg');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Lenovo', 'Lenovo k12 pro',' Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)', '64GB 4GB RAM, 128GB 4GB RAM', 'Electric Violet, Metallic Sage', 'Li-Po 6000 mAh', 699, 1598, 
'6.5 inches',' 60HZ refresh rate', 'The Lenovo K12 is powered by a Qualcomm SM4250 Snapdragon 460 (11 nm) CPU processor . The device also has a 6.5-inch IPS LCD (720 x 1600 pixels, 270 ppi) 
display. It has a Dual camera and supports Wifi, NFC, GPS, 3G and 4G LTE. It running on Android 10.', './lenovo-k12-pro.jpg');

DROP TABLE IF EXISTS Favourite;

CREATE TABLE Favourite (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL,
    smartphoneID INTEGER NOT NULL,
    FOREIGN KEY(userID) REFERENCES User(id),
    FOREIGN KEY(smartphoneID) REFERENCES Smartphone(id)
);
