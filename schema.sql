

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

INSERT INTO Review(title,content,rating,smartphoneID,userID) VALUES ('Overall is quite good','The performance of the smartphone is good',4.0,1,3);
INSERT INTO Review(title,content,rating,smartphoneID,userID) VALUES ('Good quality','The smartphone is recommended',5.0,2,3);
INSERT INTO Review(title,content,rating,smartphoneID,userID) VALUES ('Can be improved','Some part of the smartphone can be improved',2.0,3,3);
INSERT INTO Review(title,content,rating,smartphoneID,userID) VALUES ('Bad','The smartphone is not recommended',1.0,4,3);
INSERT INTO Review(title,content,rating,smartphoneID,userID) VALUES ('Normal','Good to use',3.0,5,3);

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
('Apple','Iphone 14 Pro','Hexa-core (2x3.46 GHz Everest + 4x2.02 Ghz Sawtooth)','128GB 6GB RAM, 256GB 6GB RAM,  512GB 6GB RAM, 1TB 6GB RAM','Space Black, Silver, Gold, Deep Purple','Li-Ion 3200 mAH',
4403,5700,'6.1 inches','120Hz','A vital new safety feature designed to save lives. An innovative 48MP camera for mind-blowing detail.','./iphone14pro.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Apple','Iphone 14','Hexa-core (2x3.23 GHz Avalanche + 4x1.82 GHz Blizzard)','128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM','Midnight, Purple, Starlight, Blue, Red','Li-Ion 3279 mAh',
4199,5699,'6.1 inches','120Hz','A15 Bionic, with a 5‑core GPU, powers all the latest features and makes graphically intense games and AR apps feel ultra-fluid. An updated internal design delivers 
better thermal efficiency, so you can stay in the action longer.','./iphone14.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Apple','Iphone SE','Hexa-core (2x3.22 Ghz Avalanche + 4x1.82 Ghz Blizzard','64GB 4GB RAM, 128GB 4GB RAM, 256GB 4GB RAM','Midnight, Starlight, Red','Li-Ion 2018 MAh',
2249,3350,'4.7 inches','60Hz','The most affordable iPhone features the powerful A15 Bionic, 5G, better battery life, improved durability, and a new camera system with advanced features like Smart HDR 4, Photographic Styles, and Deep Fusion.','./iphoneSE2022.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Apple','Iphone 13 Pro','Hexa-core (2x3.23 Ghz Avalanche + 4x1.82 Ghz Blizzard','128GB 6GB RAM,256GB 6GB RAM,512GB 6GB RAM, 1TB 6GB RAM','Graphite, Gold, Silver, Sierra Blue, Alphine Green',
'Li-Ion 3095 mAH',5143,5300,'6.1 inches','120 Hz','Made for low light, the wide camera adds a wider aperture and our largest sensor yet. Ultra Wide gets a wider aperture, a faster sensor, and all-new autofocus. 
Telephoto now has Night mode.','./iphone13pro.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Apple','Iphone 14 Pro Max','Hexa-core (2x3.46 GHz Everest + 4x2.02 GHz Sawtooth)','128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM, 1TB 6GB RAM',
'Space Black, Silver, Gold, Deep Purple','Li-Ion 4323 mAh',5799,8299,'6.7 inches','120Hz','The iPhone 14 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, 
the screen is 6.69 inches diagonally. Actual viewable area is less.','./iphone-14-pro-max.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy S21 5G','Octa-core (1x2.9 GHz Cortex-X1 & 3x2.80 GHz Cortex-A78 & 4x2.2 GHz Cortex-A55)','128GB 8GB RAM, 256GB 8GB RAM',
'Phantom Gray, Phantom White, Phantom Violet, Phantom Pink','Li-Ion 4000 mAh', 2199, 3699,'6.2 inches','120Hz','The Samsung Galaxy S21 
5G is a smartphone that was tested with the Android 11 operating system. This model weighs 6 ounces, has a 6.2 inch display, 12-megapixel main camera, 
and 10-megapixel selfie camera. It comes with 8GB of RAM. It was tested with 128GB of storage.','./samsung-galaxy-S21-5G.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy S22 Ultra 5G','Octa-core (1x2.8 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.8 GHz Cortex-A510)','128GB 8GB RAM, 256GB 12GB RAM, 512GB 12GB RAM, 1TB 12GB RAM',
'Phantom Black, White, Burgundy, Green, Graphite, Red, Sky Blue, Bora Purple','Li-Ion 5000 mAh',4799,5399,'6.8 inches','120Hz','The Samsung Galaxy S22 Ultra 5G is powered by a Qualcomm 
SM8450 Snapdragon 8 Gen 1 (4 nm) CPU processor with 8GB RAM, 128GB ROM.','./THUMB_GalaxyS22Ultra.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy Z Flip','Octa-core (1x2.95 GHz Kryo 485 & 3x2.41 GHz Kryo 485 & 4x1.78 GHz Kryo 485)','256GB 8GB RAM','Mirror Black, Mirror Purple, Mirror Gold, Thom Browne Edition',
'Li-Po 3300 mAh',3880,3899,'6.7 inches','120Hz','Galaxy Z Flip features an Infinity Flex Display with Samsung proprietary bendable Ultra Thin Glass (UTG), making it slimmer with a sleek, premium 
look and feel that has never been seen with a foldable device before.','./samsung-galaxy-z-flip.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy S21 Ultra 5G','Octa-core (1x2.9 GHz Cortex-X1 & 3x2.80 GHz Cortex-A78 & 4x2.2 GHz Cortex-A55)','128GB 12GB RAM, 256GB 12GB RAM, 256GB 16GB RAM, 512GB 12GB RAM, 512GB 16GB RAM',
'Phantom Black, Phantom Silver, Phantom Titanium, Phantom Navy, Phantom Brown, Navy','Li-Ion 5000 mAh',4999,5899,'6.8 inches','120Hz','The Galaxy S21 Ultra comes in a sleeker design and offers faster 
performance from Qualcomms Snapdragon 888 chip','./samsung-galaxy-s21-ultra.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy A13','Octa-core (4x2.0 GHz Cortex-A55 & 4x2.0 GHz Cortex-A55)','32GB 3GB RAM, 32GB 4GB RAM, 64GB 4GB RAM, 128GB 4GB RAM, 128GB 6GB RAM',
'Black, White, Peach, Blue','Li-Po 5000 mAh',699,999,'6.6 inches','60Hz','The Galaxy A13 is one of the few Samsung phones without an OLED display. A simple IPS number, the A13 6.6in screen has a resolution of 2,408 x 1,080 and a pixel density of 400ppi. 
It is not a scratch on Samsungs AMOLED tech, but you are getting a screen that looks rather good for the money.','./samsung-galaxy-a13.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy A04','Octa-core (4x2.3 GHz & 4x1.8 GHz)','32GB 3GB RAM, 32GB 4GB RAM, 64GB 4GB RAM, 64GB 6GB RAM, 128GB 4GB RAM, 128GB 8GB RAM',
'Black, Green, White, Copper','Li-Po 5000 mAh',479,559,'6.5 inches','90Hz','Galaxy A04 combines Octa-core processing power with up to 3GB/4GB of RAM for fast and efficient performance for the task at hand.','./Samsung-Galaxy-A04.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy Z Flip 4','Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)','128GB 8GB RAM, 256GB 8GB RAM, 512GB 8GB RAM','Bora Purple, Graphite, Pink Gold, Blue, Yellow, White, Navy, Khaki, Red',
'Li-Po 3700 mAh',4099,4899,'6.7 inches','120 Hz','The new Galaxy Z Flip4 offers a boost in performance and features. The newest member of the foldable Galaxy family brings improved features with a longer-lasting battery, super-fast charging, a new processor, 
a unique hinge in the smartphone world and the ability to customise the external display as you like.','./GALAXY-Z-FLIP4.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Samsung','Samsung Galaxy A23 5G','Octa-core (2x2.2 GHz Kryo 660 Gold & 6x1.7 GHz Kryo 660 Silver)','64GB 4GB RAM, 64GB 6GB RAM, 128GB 4GB RAM, 128GB 6GB RAM, 128GB 8GB RAM',
'Black, White, Peach, Blue','Li-Po 5000 mAh',1399,1399,'6.6 inches','120Hz','The Galaxy A23 5G combines Snapdragon® mobile platform power with up to 8GB of RAM for fast and efficient
 performance for the task at hand.','./Galaxy A23 5G.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Huawei','Huawei P30','Octa-core (2x2.6 GHz Cortex-A76 & 2x1.92 GHz Cortex-A76 & 4x1.8 GHz Cortex-A55)','64GB 8GB RAM, 128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM','Aurora, Amber Sunrise, Breathing Crystal, Black, Pearl White',
'Li-Po 3650 mAh',1599,2685,'6.1 inches','60Hz','The HUAWEI P30 features various functional cases5 with unique colours and design styles. Be beautiful in your own way with extra protection.','./huawei-p30.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Huawei','Huawei Mate 50','Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x2.0 GHz Cortex-A510)','128GB 8GB RAM, 256GB 8GB RAM, 512GB 8GB RAM','Black, Silver, Purple, Orange',
'Li-Po 4460 mAh',2999,3699,'6.7 inches','90Hz','With the Ultra Aperture XMAGE Camera, HUAWEI Mate 50 allows you to capture brilliance day and night.','./huawei-mate-50.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Huawei','Huawei P40','Octa-core (2x2.86 GHz Cortex-A76 & 2x2.36 GHz Cortex-A76 & 4x1.95 GHz Cortex-A55)','128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM',
'Silver Frost, Blush Gold, Deep Sea Blue, Ice White, Black','Li-Po 3800 mAh',1399,2339,'6.1 inches','90 Hz','Ultimate Performance for a Real Experience. Embrace the ultra-fast speed with the world
first integrated 5G SoC4, Kirin 990 5G chipset. Thanks to the 7nm+ EUV technology and innovative CPU architectures, HUAWEI P40 can achieve high efficiency and system fluidity.','./p40.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Huawei','Huawei P50','Octa-core (1x2.84 GHz Cortex-X1 & 3x2.42 GHz Cortex-A78 & 4x1.80 GHz Cortex-A55)','128GB 8GB RAM, 256GB 8GB RAM',
'Black, Gold, White','Li-Po 4100 mAh',2575,2899,'6.5 inches','120 Hz','The Huawei P50 Pro camera is up there with the Oppo Find X5 Pro and latest Samsung handsets as one of the best phone cameras available, even if it is effectively a 2021 mobile. Its ultra-wide is the weak point, 
but the top-notch zoom makes up for it in my estimation.','./p50.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Huawei','Huawei Mate 40','Octa-core (1x3.13 GHz Cortex-A77 & 3x2.54 GHz Cortex-A77 & 4x2.05 GHz Cortex-A55)','128GB 8GB RAM, 256GB 8GB RAM',
'Silver, White, Black, Green, Yellow','Li-Po 4200 mAh',2296,2727,'6.5 inches','90Hz','Embrace the ultra-fast speed with the world first integrated 5G SoC4, Kirin 990 5G chipset. 
Thanks to the 7nm+ EUV technology and innovative CPU architectures, HUAWEI P40 can achieve high efficiency and system fluidity','./HUAWEI-Mate-40.png');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Xiaomi', 'Xiaomi 12 pro',' Octa-core (1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)', '128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM', 'Blue,Purple,Grey', 
'Li-Po 4600 mAh', 2808, 3131, '6.73 inches',' 120Hz', 'The Xiaomi 12 Pro is powered by a Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm) CPU processor. 
The device also has a 6.73-inch LTPO AMOLED (1440 x 3200 pixels, 521 ppi) display. It has a Triple camera and supports Wifi, Bluetooth, NFC, GPS, 4G LTE and 5G. It running on Android 12, MIUI 13.', 
'./xiaomi-12-pro.jpg');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Xiaomi', 'Xiaomi Mi 11',' Octa-core (1x2.84 GHz Cortex-X1 & 3x2.42 GHz Cortex-A78 & 4x1.80 GHz Cortex-A55', '128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM', 'Blue,White,Grey', 'Li-Po 4600 mAh', 
1899, 2799, '6.81 inches',' 120Hz', 'The Xiaomi Mi 11 is powered by a Qualcomm SM8350 Snapdragon 888 (5 nm) CPU processor. The device also has a 6.81-inch AMOLED (1440 x 3200 pixels, 515 ppi) display. 
It has a Triple camera and supports Wifi, NFC, GPS, 3G, 4G LTE and 5G. It  running on Android 11, MIUI 12.', './xiaomi-mi-11.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Xiaomi','Xiaomi 12T Pro','Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x2.0 GHz Cortex-A510)','128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM','Black, Silver, Blue','Li-Po 5000 mAH',
1499,2699,'6.67 inches','120Hz','The Xiaomi 12 Pro packs a 6.73-inch QHD+(1440x3200) Super AMOLED screen curved screen with support 
for 120Hz screen refresh rate and a touch sampling rate of up to 480Hz.','./xiaomi12Tpro.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Xiaomi','Xiaomi 10T Pro 5G','Octa-core (1x2.84 GHz Cortex-A77 & 3x2.42 GHz Cortex-A77 & 4x1.80 GHz Cortex-A55)','128GB 8GB RAM, 256GB 8GB RAM','Cosmic Black, 
Lunar Silver, Aurora Blue','Li-Po 5000 mAH',1560,1699,'6.67 inches','144Hz','The use of MEMC Technology improves fluidity of low frame rate content to clearly display quick movements.'
,'./xiaomi10Tpro5g.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Xiaomi','Xiaomi 11T Pro','Octa-core (1x2.84 GHz Cortex-X1 & 3x2.42 GHz Cortex-A78 & 4x1.80 GHz Cortex-A55)','128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM','Meteorite Gray, 
Moonlight White, Celestial Blue','Li-Po 5000 mAH',1198,1699,'6.67 inches','144Hz','The Xiaomi 11T Pro brings you professional special effects with leading computational 
videography and pro-grade cameras.','./xiaomi11Tpro.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Xiaomi','Xiaomi Mix 4','Octa-core (1x2.99 GHz Cortex-X1 & 3x2.42 GHz Cortex-A78 & 4x1.80 GHz Cortex-A55)','128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM, 512GB 12GB RAM',
'Ceramic Black, Ceramic White, Shadow Gray','Li-Po 4500 mAh',2459,3115,'6.67 inches','120Hz','The Xiaomi Mix 4 is powered by a Qualcomm SM8350 Snapdragon 888+ 5G (5 nm) CPU processor with 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM, 
512GB 12GB RAM, UFS 3.1. The device also has a 6.67-inch AMOLED (1080 x 2400 pixels, 395 ppi) display.','./Xiaomi-mix-4.png');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Lenovo', 'Lenovo Legion Pro',' Octa-core (1x3.09 GHz Cortex-A77 & 3x2.42 GHz Cortex-A77 & 4x1.80 GHz Cortex-A55)', '128GB 8GB RAM, 128GB 12GB RAM, 
256GB 12GB RAM, 512GB 16GB RAM', 'Black', 'Li-Po 5000 mAh', 2098, 3299, '6.65 inches',' 120Hz', 'The Lenovo Legion Phone Duel is powered by 
a Qualcomm SM8250 Snapdragon 865+ (7 nm+) CPU processor. The device also has a 6.65-inch AMOLED (1080 x 2340 pixels, 388 ppi) display. It has a Dual camera and supports Wifi, NFC, GPS, 3G, 4G
 LTE and 5G. Itrunning on Android 10, Legion OS/ ZUI12.', './lenovo-legion-pro.jpg');
INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES 
('Lenovo', 'Lenovo k12 pro',' Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)', '64GB 4GB RAM, 128GB 4GB RAM', 'Electric Violet, Metallic Sage', 'Li-Po 6000 mAh', 699, 1598, 
'6.5 inches',' 60Hz', 'The Lenovo K12 is powered by a Qualcomm SM4250 Snapdragon 460 (11 nm) CPU processor . The device also has a 6.5-inch IPS LCD (720 x 1600 pixels, 270 ppi) 
display. It has a Dual camera and supports Wifi, NFC, GPS, 3G and 4G LTE. It running on Android 10.', './lenovo-k12-pro.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Lenovo','Lenovo K14 Plus','Octa-core 1.8 GHz','64GB 4GB RAM','Black, Gold','Li-Po 5000 mAH',517,659,'6.5 inches','90Hz',
'Lenovo K14 Plus is equipped with a Multi-touch IPS LCD that has an aspect ratio of 20:9, resolution of 720 x 1600 pixels and pixel density of 270ppi. 
This bezel-less water-drop notch display also features a 90Hz refresh rate.','./lenovok14plus.jpg');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Lenovo','Lenovo Legion Y70','Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)','128GB 8GB RAM, 256GB 12GB RAM, 512GB 16GB RAM',
'Black, Silver, Red','Li-Po 5100 mAh',1435,1999,'6.67 inches','144Hz','The Lenovo Legion Y70 is powered by a Qualcomm SM8475 Snapdragon 8+ Gen 1 (4 nm) CPU processor with 128GB 8GB RAM, 256GB 12GB RAM, 512GB 16GB RAM, UFS 3.1
. The device also has a 6.67-inch OLED (1080 x 2400 pixels, 395 ppi) display.','./lenovo-legion-y70.png');
INSERT INTO Smartphone(brand,model,processor,ram,colour,battery,lowprice,highprice,screenSize,refreshRate,description,image_URL) VALUES 
('Lenovo','Lenovo K13 Pro','Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)','64GB 4GB RAM, 128GB 4GB RAM, 128GB 6GB RAM','Black','Li-Po 5000 mAH',696,815,'6.51 inches',
'90Hz','Lenovo K13 Pro Mobile was launched on 29 September 2021. The smartphone comes with a 6.51-inch (HD+) IPS LCD display with a resolutions of 1600 x 720 Pixels. Here, according to display size, 
type and resolutions we are giving 75 score out of 100.','./lenovok13pro.jpg');

DROP TABLE IF EXISTS Favourite;

CREATE TABLE Favourite (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL,
    smartphoneID INTEGER NOT NULL,
    FOREIGN KEY(userID) REFERENCES User(id),
    FOREIGN KEY(smartphoneID) REFERENCES Smartphone(id)
);
