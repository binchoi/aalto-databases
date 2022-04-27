CREATE TABLE Appointment(
	patient TEXT,
	doctor TEXT,
	date TEXT,
	description TEXT,
	PRIMARY KEY (patient, doctor, date)
);

CREATE TABLE Book (
	ID INTEGER PRIMARY KEY,
	title TEXT,
	author TEXT,
	language TEXT,
	year INT
);

CREATE TABLE CD (
	ID INTEGER PRIMARY KEY,
	title TEXT,
	artist TEXT,
	year INT,
	length REAL
);

CREATE TABLE Customer (
	email TEXT PRIMARY KEY,
	name TEXT,
	address TEXT,
	birthday TEXT
);

CREATE TABLE Doctor(
	id TEXT PRIMARY KEY,
	name TEXT,
	email TEXT
);

CREATE TABLE DVD (
	ID INTEGER PRIMARY KEY,
	title TEXT,
	year INT,
	length REAL
);

CREATE TABLE LibraryCustomer (
	name TEXT,
	phone TEXT,
	email TEXT,
	libraryCardNumber TEXT PRIMARY KEY
);

CREATE TABLE LibraryItem (ID INTEGER PRIMARY KEY, loanPeriod INT);

CREATE TABLE Loan (
	itemID ID,
	libraryCardNumber TEXT,
	startDate TEXT,
	endDate TEXT,
	returned INTEGER,
	PRIMARY KEY (itemID, libraryCardNumber, startDate)
);

CREATE TABLE OrderContent(
	orderID TEXT,
	product TEXT,
	amount INTEGER,
	PRIMARY KEY (orderID, product)
);

CREATE TABLE Orders(
	orderID TEXT PRIMARY KEY,
	customer TEXT,
	date TEXT,
	payment TEXT
);

CREATE TABLE Patient(
	ssNo TEXT PRIMARY KEY,
	name TEXT,
	birthday TEXT,
	heights REAL,
	weight REAL,
	phone TEXT,
	vaccine TEXT
);

CREATE TABLE Product(
	prodID TEXT PRIMARY KEY,
	description TEXT,
	price REAL,
	weight REAL,
	type TEXT
);


INSERT INTO Appointment (patient, doctor, date, description) VALUES ('24101992-643G', '02952', '2017-09-18', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('24101992-643G', '02952', '2016-05-01', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('24101992-643G', '44383', '2020-01-14', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('04021971-651D', '73292', '2021-03-23', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('20091990-259W', '35609', '2013-01-16', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('14061971-171P', '21453', '2015-09-30', 'acute');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('14061971-171P', '21453', '2015-10-11', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('14061971-171P', '35609', '2016-12-20', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('23011985-1958', '73292', '2021-02-17', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('27042009-062N', '73292', '2017-05-28', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('27042009-062N', '73292', '2021-01-23', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('03091987-022F', '35609', '2014-01-22', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('15051970-009W', '05908', '2011-11-03', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('15051970-009W', '05908', '2016-05-03', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('15051970-009W', '73292', '2021-01-16', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('13092010-041L', '05908', '2011-10-21', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('04021976-188P', '35609', '2018-12-18', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('04021976-188P', '35609', '2018-12-19', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('04021976-188P', '35609', '2019-03-23', 'checkup');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '21453', '2015-09-04', 'acute');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '05908', '2015-12-06', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '05908', '2015-11-04', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '02952', '2015-10-04', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '73292', '2021-08-17', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '73292', '2021-01-23', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('06071983-169R', '21453', '2011-03-31', 'acute');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('12091972-3084', '05908', '2021-03-17', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('11072016-778G', '05908', '2019-08-11', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('18021988-100K', '21453', '2021-01-24', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('24101992-643G', '73292', '2021-05-01', 'acute');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('11031993-2860', '05908', '2021-05-02', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('06071983-169R', '05908', '2021-04-28', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('14061971-171P', '05908', '2021-04-28', 'vaccine');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '21453', '2021-04-27', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('12091942-123F', '21453', '2021-05-03', 'treatment');
INSERT INTO Appointment (patient, doctor, date, description) VALUES ('25031955-198C', '05908', '2021-06-11', 'vaccine');
INSERT INTO Book (ID, title, author, language, year) VALUES (1, 'The Tale of Peter Rabbit', 'Beatrix Potter', 'English', 1990);
INSERT INTO Book (ID, title, author, language, year) VALUES (2, 'Jonathan Livingston Seagull', 'Richard Bach', 'English', 2002);
INSERT INTO Book (ID, title, author, language, year) VALUES (3, 'The Very Hungry Caterpillar', 'Eric Carle', 'English', 2016);
INSERT INTO Book (ID, title, author, language, year) VALUES (4, 'A Message to Garcia', 'Elbert Hubbard', 'English', 2013);
INSERT INTO Book (ID, title, author, language, year) VALUES (5, 'To Kill a Mockingbird', 'Harper Lee', 'English', 2013);
INSERT INTO Book (ID, title, author, language, year) VALUES (6, 'Flowers in the Attic', 'V. C. Andrews', 'English', 2006);
INSERT INTO Book (ID, title, author, language, year) VALUES (7, 'Cosmos', 'Carl Sagan', 'English', 2016);
INSERT INTO Book (ID, title, author, language, year) VALUES (8, 'Sophie''s World', 'Jostein Gaarder', 'English', 1991);
INSERT INTO Book (ID, title, author, language, year) VALUES (9, 'Angels & Demons', 'Dan Brown', 'English', 2005);
INSERT INTO Book (ID, title, author, language, year) VALUES (10, 'Kane and Abel', 'Jeffrey Archer', 'English', 2004);
INSERT INTO Book (ID, title, author, language, year) VALUES (11, 'How the Steel Was Tempered', 'Nikolai Ostrovsky', 'English', 2005);
INSERT INTO Book (ID, title, author, language, year) VALUES (12, 'War and Peace', 'Leo Tolstoy', 'English', 2019);
INSERT INTO Book (ID, title, author, language, year) VALUES (13, 'The Diary of Anne Frank', 'Anne Frank', 'English', 2008);
INSERT INTO Book (ID, title, author, language, year) VALUES (14, 'Your Erroneous Zones', 'Wayne Dyer', 'English', 2013);
INSERT INTO Book (ID, title, author, language, year) VALUES (15, 'The Thorn Birds', 'Colleen McCullough', 'English', 2011);
INSERT INTO Book (ID, title, author, language, year) VALUES (16, 'The Purpose Driven Life', 'Rick Warren', 'English', 1990);
INSERT INTO Book (ID, title, author, language, year) VALUES (17, 'The Kite Runner', 'Khaled Hosseini', 'English', 1991);
INSERT INTO Book (ID, title, author, language, year) VALUES (18, 'Valley of the Dolls', 'Jacqueline Susann', 'English', 1992);
INSERT INTO Book (ID, title, author, language, year) VALUES (19, 'The Great Gatsby', 'F. Scott Fitzgerald', 'English', 1990);
INSERT INTO Book (ID, title, author, language, year) VALUES (20, 'Gone with the Wind', 'Margaret Mitchell', 'English', 2009);
INSERT INTO Book (ID, title, author, language, year) VALUES (21, 'Rebecca', 'Daphne du Maurier', 'English', 2002);
INSERT INTO Book (ID, title, author, language, year) VALUES (22, 'Nineteen Eighty-Four', 'George Orwell', 'English', 2001);
INSERT INTO Book (ID, title, author, language, year) VALUES (23, 'The Revolt of Mamie Stover', 'William Bradford Huie', 'English', 2011);
INSERT INTO Book (ID, title, author, language, year) VALUES (24, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'English', 1990);
INSERT INTO Book (ID, title, author, language, year) VALUES (25, 'The Lost Symbol', 'Dan Brown', 'English', 2004);
INSERT INTO Book (ID, title, author, language, year) VALUES (26, 'Harry Potter and the Half-Blood Prince', 'J. K. Rowling', 'English', 2010);
INSERT INTO Book (ID, title, author, language, year) VALUES (27, 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 'English', 2005);
INSERT INTO Book (ID, title, author, language, year) VALUES (28, 'The Alchemist (O Alquimista)', 'Paulo Coelho', 'English', 2014);
INSERT INTO Book (ID, title, author, language, year) VALUES (29, 'Catching Fire', 'Suzanne Collins', 'English', 2001);
INSERT INTO Book (ID, title, author, language, year) VALUES (30, 'Mockingjay', 'Suzanne Collins', 'English', 2000);
INSERT INTO CD (ID, title, artist, year, length) VALUES (51, 'Midnight Memories', 'One Direction', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (52, 'The Marshall Mathers LP 2', 'Eminem', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (53, 'The 20/20 Experience', 'Justin Timberlake', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (54, 'Unorthodox Jukebox', 'Bruno Mars', 2012, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (55, 'Random Access Memories', 'Daft Punk', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (56, 'Prism', 'Katy Perry', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (57, 'To Be Loved', 'Michael Bublé', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (58, 'Night Visions', 'Imagine Dragons', 2012, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (59, 'Artpop', 'Lady Gaga', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (60, 'Beyoncé', 'Beyoncé', 2013, NULL);
INSERT INTO CD (ID, title, artist, year, length) VALUES (61, '1989', 'Taylor Swift', 2014, NULL);
INSERT INTO Customer (email, name, address, birthday) VALUES ('wiley123@yahoo.com', 'Wiley Murray', ' Otakaari 20', '1974-03-14');
INSERT INTO Customer (email, name, address, birthday) VALUES ('mariam.quigley@aalto.fi', 'Mariam Quigley', 'Jämeräntaival 2', '1998-10-06');
INSERT INTO Customer (email, name, address, birthday) VALUES ('t.brekke@gmail.com', 'Trace Brekke', 'Rakentajanaukio 4', '1992-06-16');
INSERT INTO Customer (email, name, address, birthday) VALUES ('john.l.harris@gmail.com', 'John Harris', 'Luolamiehentie 7', '1990-10-04');
INSERT INTO Customer (email, name, address, birthday) VALUES ('reanna.ebert@aalto.fi', 'Reanna Ebert', 'Maarintie 16', '1975-05-26');
INSERT INTO Customer (email, name, address, birthday) VALUES ('aridickens@gmail.com', 'Ari Dickens', 'Kemistintie 5', '1988-05-05');
INSERT INTO Customer (email, name, address, birthday) VALUES ('raynor.zack@hotmail.com', 'Zack Raynor', 'Otaranta 8', '1983-11-08');
INSERT INTO Customer (email, name, address, birthday) VALUES ('gill.quigley@hotmail.com', 'Gillian Quigley', 'Betonimiehenkuja 2', '2001-05-25');
INSERT INTO Customer (email, name, address, birthday) VALUES ('a.jarrod@gmail.com', 'Jarrod Abernathy', 'Tekniikantie 6', '1998-01-05');
INSERT INTO Customer (email, name, address, birthday) VALUES ('kris.bauch1@gmail.fi', 'Kris Bauch', 'Tietotie 1', '1981-08-11');
INSERT INTO Customer (email, name, address, birthday) VALUES ('kaileysch@yahoo.fi', 'Kailey Schinner', 'Otaniementie 8', '1998-01-05');
INSERT INTO Customer (email, name, address, birthday) VALUES ('carolcarol@gmail.com', 'Carol Schmidt', 'Otakuja 2', '1983-11-08');
INSERT INTO Customer (email, name, address, birthday) VALUES ('raph.renn@gmail.com', 'Raphaelle Renner', 'Kuusisaarentie 15', '1943-11-08');
INSERT INTO Doctor (id, name, email) VALUES ('02952', 'Dr. Alena Klocko', 'alena.klocko@example.fi');
INSERT INTO Doctor (id, name, email) VALUES ('05908', 'Dr. Jerrell Kunde', 'jerrell.kunde@example.fi');
INSERT INTO Doctor (id, name, email) VALUES ('21453', 'Dr. Leilani Mitchell', 'leilani.mitchell@example.fi');
INSERT INTO Doctor (id, name, email) VALUES ('35609', 'Dr. Cody Schmitt', 'cody.schmitt@example.fi');
INSERT INTO Doctor (id, name, email) VALUES ('44383', 'Dr. Edward McCullough', 'edward.mccullough@example.fi');
INSERT INTO Doctor (id, name, email) VALUES ('73292', 'Dr. Nova Shanahan', 'nova.shanahan@example.fi');
INSERT INTO DVD (ID, title, year, length) VALUES (71, 'Finding Nemo', 2003, NULL);
INSERT INTO DVD (ID, title, year, length) VALUES (72, 'Cars', 2006, NULL);
INSERT INTO DVD (ID, title, year, length) VALUES (73, 'Spider-Man', 2002, NULL);
INSERT INTO DVD (ID, title, year, length) VALUES (74, 'The Dark Knight', 2008, NULL);
INSERT INTO DVD (ID, title, year, length) VALUES (75, 'Avatar', 2010, 121.3);
INSERT INTO DVD (ID, title, year, length) VALUES (76, 'Shrek 2', 2004, 96.9);
INSERT INTO DVD (ID, title, year, length) VALUES (77, 'Transformers', 2007, 132.9);
INSERT INTO DVD (ID, title, year, length) VALUES (78, 'Pirates of the Caribbean: The Curse of the Black Pearl', 2003, 142.5);
INSERT INTO DVD (ID, title, year, length) VALUES (79, 'Pirates of the Caribbean: Dead Man''s Chest', 2006, 121.8);
INSERT INTO DVD (ID, title, year, length) VALUES (80, 'The Incredibles', 2005, 111.1);
INSERT INTO DVD (ID, title, year, length) VALUES (81, 'Pirates of the Caribbean: At World''s End', 2007, 97.3);
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Marybeth Adess', '849 877 6622', 'madess0@google.de', '902-003-4480');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Lara Caveau', '331 834 7490', 'lcaveau1@princeton.edu', '569-273-2939');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Thurston Grannell', '478 221 6304', 'tgrannell2@t-online.de', '583-794-6519');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Fiona Rowe', '408 735 8333', 'frowe3@4shared.com', '565-043-7815');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Gonzales O''Gaven', '543 774 5608', 'gogaven4@1688.com', '440-360-0352');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Asher Matityahu', '129 890 0062', 'amatityahu5@springer.com', '775-196-3263');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Rickie Maken', '148 360 8406', 'rmaken6@google.com.au', '255-083-2027');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Jo Brockway', '495 529 9537', 'jbrockway7@de.vu', '017-408-2665');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Read Espinal', '984 772 4456', 'respinal8@mozilla.org', '357-720-5636');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Bethany Gannicott', '439 865 2586', 'bgannicott9@jigsy.com', '256-970-2471');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Audie Bortoloni', '451 702 1927', 'abortolonia@spiegel.de', '482-179-7577');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Galven Macallam', '666 922 2884', 'gmacallamb@yellowbook.com', '047-966-1316');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Jon O'' Borne', '187 345 2882', 'joc@smh.com.au', '602-225-5864');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Randall Dowle', '856 488 3335', 'rdowled@1688.com', '142-445-2163');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Appolonia Hourahan', '556 198 2758', 'ahourahane@t.co', '675-495-5090');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Clari Tringham', '781 240 1586', 'ctringhamf@naver.com', '175-651-1349');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Gussy Gandley', '176 538 7819', 'ggandleyg@soup.io', '494-818-8077');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Buck Stienton', '920 510 9362', 'bstientonh@chron.com', '311-929-3121');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Dorthea Addekin', '752 202 4412', 'daddekini@pcworld.com', '711-791-4823');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Alikee Iorillo', '946 841 8661', 'aiorilloj@pagesperso-orange.fr', '437-744-5251');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Cord Swannie', '801 156 3474', 'cswanniek@cornell.edu', '998-997-5868');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Annabell Hallbird', '782 932 9415', 'ahallbirdl@devhub.com', '308-929-7418');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Rodrique Lawland', '406 346 5199', 'rlawlandm@tripod.com', '186-536-0392');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Marcelia Somerset', '261 488 4480', 'msomersetn@blogtalkradio.com', '688-658-9695');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Baxter Stockau', '339 769 0785', 'bstockauo@cam.ac.uk', '496-285-2167');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Pia Pryn', '541 921 7227', 'pprynp@g.co', '152-852-3490');
INSERT INTO LibraryCustomer (name, phone, email, libraryCardNumber) VALUES ('Fairfax Leggan', '892 559 7274', 'flegganq@miitbeian.gov.cn', '379-087-2733');
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (1, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (2, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (3, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (4, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (5, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (6, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (7, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (8, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (9, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (10, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (11, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (12, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (13, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (14, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (15, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (16, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (17, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (18, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (19, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (20, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (21, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (22, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (23, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (24, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (25, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (26, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (27, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (28, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (29, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (30, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (41, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (42, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (43, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (44, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (45, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (46, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (47, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (48, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (49, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (50, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (51, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (52, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (53, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (54, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (55, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (56, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (57, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (58, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (59, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (60, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (61, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (71, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (72, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (73, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (74, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (75, 21);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (76, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (77, 7);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (78, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (79, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (80, 14);
INSERT INTO LibraryItem (ID, loanPeriod) VALUES (81, 7);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (1, '711-791-4823', '2020-10-04', '2020-10-11', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (2, '256-970-2471', '2020-07-24', '2020-08-07', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (6, '440-360-0352', '2020-01-02', '2020-01-16', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (7, '688-658-9695', '2020-09-01', '2020-09-08', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (8, '357-720-5636', '2020-02-10', '2020-03-02', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (9, '255-083-2027', '2020-10-13', '2020-10-20', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (9, '998-997-5868', '2020-11-18', '2020-11-25', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (12, '311-929-3121', '2020-08-28', '2020-09-11', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (13, '142-445-2163', '2020-09-14', '2020-09-28', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (14, '583-794-6519', '2020-02-04', '2020-02-11', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (15, '440-360-0352', '2020-05-20', '2020-06-10', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (18, '255-083-2027', '2020-12-16', '2021-01-06', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (19, '711-791-4823', '2020-05-10', '2020-05-24', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (20, '175-651-1349', '2020-04-28', '2020-05-19', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (21, '437-744-5251', '2020-08-01', '2020-08-15', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (23, '496-285-2167', '2020-05-05', '2020-05-26', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (24, '142-445-2163', '2020-03-13', '2020-03-27', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (25, '688-658-9695', '2020-11-21', '2020-12-05', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (26, '255-083-2027', '2020-06-14', '2020-07-05', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (30, '152-852-3490', '2020-02-12', '2020-03-04', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (41, '379-087-2733', '2020-08-23', '2020-09-06', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (42, '496-285-2167', '2020-06-21', '2020-07-05', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (43, '017-408-2665', '2020-01-28', '2020-02-04', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (44, '017-408-2665', '2020-04-05', '2020-04-26', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (45, '496-285-2167', '2020-05-06', '2020-05-13', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (47, '602-225-5864', '2020-01-03', '2020-01-10', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (48, '255-083-2027', '2020-08-16', '2020-09-06', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (51, '357-720-5636', '2020-08-08', '2020-08-29', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (52, '152-852-3490', '2020-05-02', '2020-05-09', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (53, '152-852-3490', '2020-05-07', '2020-05-21', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (54, '142-445-2163', '2020-08-19', '2020-09-09', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (56, '482-179-7577', '2020-11-10', '2020-11-24', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (57, '565-043-7815', '2020-11-19', '2020-12-10', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (58, '494-818-8077', '2020-06-05', '2020-06-19', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (60, '256-970-2471', '2020-11-06', '2020-11-27', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (61, '482-179-7577', '2020-01-02', '2020-01-23', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (71, '017-408-2665', '2020-09-08', '2020-09-22', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (72, '379-087-2733', '2020-01-24', '2020-02-14', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (73, '902-003-4480', '2020-11-12', '2020-12-03', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (74, '437-744-5251', '2020-04-22', '2020-04-29', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (75, '152-852-3490', '2020-10-28', '2020-11-18', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (76, '437-744-5251', '2020-08-06', '2020-08-20', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (78, '152-852-3490', '2020-11-20', '2020-12-04', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (80, '256-970-2471', '2020-07-13', '2020-07-27', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (1, '308-929-7418', '2021-02-03', '2021-02-10', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (2, '565-043-7815', '2021-02-06', '2021-02-20', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (3, '256-970-2471', '2021-01-10', '2021-01-17', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (4, '775-196-3263', '2021-01-04', '2021-01-25', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (5, '482-179-7577', '2021-01-30', '2021-02-06', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (10, '255-083-2027', '2021-03-20', '2021-04-03', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (11, '583-794-6519', '2021-02-01', '2021-02-15', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (12, '308-929-7418', '2021-01-20', '2021-02-03', 0);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (13, '142-445-2163', '2021-01-30', '2021-02-13', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (14, '583-794-6519', '2021-01-03', '2021-01-10', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (16, '583-794-6519', '2021-02-15', '2021-02-22', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (18, '602-225-5864', '2021-01-26', '2021-02-16', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (41, '569-273-2939', '2021-01-09', '2021-01-23', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (44, '047-966-1316', '2021-03-23', '2021-04-13', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (25, '496-285-2167', '2021-01-23', '2021-02-06', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (26, '047-966-1316', '2021-03-20', '2021-04-10', 1);
INSERT INTO Loan (itemID, libraryCardNumber, startDate, endDate, returned) VALUES (29, '775-196-3263', '2021-01-20', '2021-02-10', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('001', '151', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('001', '201', 4);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('001', '435', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('231', '711', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('147', '035', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('147', '077', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('010', '640', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('111', '722', 3);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('043', '537', 3);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('043', '458', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('043', '218', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('043', '151', 3);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('047', '318', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('047', '010', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('047', '241', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('060', '003', 4);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('060', '035', 5);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('060', '095', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('060', '426', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('073', '688', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('073', '675', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('073', '725', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('074', '458', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('074', '488', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('074', '411', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('074', '673', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('076', '689', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('076', '690', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('096', '021', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('096', '179', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('096', '150', 4);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('106', '021', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('106', '179', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('125', '700', 5);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('146', '745', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('146', '725', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('146', '488', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('149', '046', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('149', '030', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('149', '218', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('149', '098', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('149', '010', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('150', '021', 2);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('169', '553', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('169', '484', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('231', '817', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('146', '848', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('125', '894', 1);
INSERT INTO OrderContent (orderID, product, amount) VALUES ('106', '916', 3);
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('231', 'kaileysch@yahoo.fi', '2021-03-19', 'mobilepay');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('001', 'wiley123@yahoo.com', '2020-08-09', 'credit');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('147', 'wiley123@yahoo.com', '2020-07-11', 'credit');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('010', 'carolcarol@gmail.com', '2020-09-02', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('111', 'raph.renn@gmail.com', '2021-01-31', 'credit');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('043', 'reanna.ebert@aalto.fi', '2020-10-09', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('047', 'reanna.ebert@aalto.fi', '2020-05-26', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('060', 'reanna.ebert@aalto.fi', '2020-12-22', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('073', 'john.l.harris@gmail.com', '2021-03-27', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('074', 'gill.quigley@hotmail.com', '2020-07-05', 'credit');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('076', 'mariam.quigley@aalto.fi', '2020-09-03', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('096', 'a.jarrod@gmail.com', '2020-05-15', 'credit');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('106', 'a.jarrod@gmail.com', '2020-05-19', 'credit');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('125', 't.brekke@gmail.com', '2020-11-26', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('146', 'aridickens@gmail.com', '2020-05-03', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('149', 'raynor.zack@hotmail.com', '2021-04-16', 'paypal');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('150', 'a.jarrod@gmail.com', '2021-01-22', 'credit');
INSERT INTO Orders (orderID, customer, date, payment) VALUES ('169', 'kris.bauch1@gmail.fi', '2021-03-09', 'mobilepay');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('24101992-643G', 'Hiram Veum', '1992-10-24', 176.9, 75.041, '244-567-9440', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('04021971-651D', 'Maxwell Gulgowski', '1971-02-04', 194.4, 95.2, '391-637-2577', '1');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('20091990-259W', 'Darius Hills', '1990-09-20', 160.8, 84.8, '473-175-7498', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('14061971-171P', 'Curtis Mante', '1971-06-14', 175.6, 62.9, '294-897-6706', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('24022005-206A', 'Nova Daugherty', '2005-02-24', 144.7, 40.9, '487-740-9239', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('23011985-1958', 'Garrison Kovacek', '1985-01-23', 176.8, 87.5, '448-855-8520', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('27042009-062N', 'Claudia Bogisich', '2009-04-27', 110.2, 25.3, '631-532-9482', '1');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('03091987-022F', 'Kayden Schumm', '1987-09-03', 180.3, 72.3, '402-517-1966', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('15051970-009W', 'Hugh Keebler', '1970-05-15', 149.0, 51.3, '023-713-7460', '1');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('13092010-041L', 'Manley Barrows', '2010-09-13', 146.2, 42.8, '342-914-9219', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('04021976-188P', 'Gisselle Nikolaus', '1976-02-04', 164.9, 89.0, '629-887-4788', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('11031993-2860', 'Trinity Davis', '1993-03-11', 162.0, 57.3, '607-662-9308', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('06011940-186D', 'Michale Bayer', '1940-01-06', 173.7, 76.0, '390-605-7879', '1');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('25031955-198C', 'Malinda Zulauf', '1955-03-25', 175.4, 61.1, '245-311-5814', '1');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('06071983-169R', 'Buddy Wilkinson', '1983-07-06', 163.8, 55.6, '914-745-2967', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('12091972-3084', 'Etha Hickle', '1972-09-12', 190.9, 76.0, '285-276-5166', '1');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('11072016-778G', 'Patricia Eichmann', '2016-07-11', 105.0, 20.7, '824-826-4415', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('12091942-123F', 'Keven Bergstrom', '1942-09-12', 163.2, 83.8, '754-745-6336', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('29111962-415Y', 'Diego Koepp', '1962-11-29', 175.3, 83.2, '102-742-6364', '0');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('18021988-100K', 'Alvena Toy', '1988-02-18', 173.5, 62.0, '925-623-3476', '1');
INSERT INTO Patient (ssNo, name, birthday, heights, weight, phone, vaccine) VALUES ('22031954-483A', 'Hardy Koepp', '1954-03-22', 160.3, 58.7, '756-655-1079', '1');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('003', 'Bread', 2.13, 500.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('010', 'Coffee', 4.49, 500.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('021', 'Lentils', 1.59, 400.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('030', 'Broccoli', 2.29, 400.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('035', 'Tomato soup', 2.79, 570.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('046', 'Banana', 0.25, 170.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('074', 'Zucchini', 0.5, 250.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('077', 'Basil (fresh)', 1.89, 100.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('095', 'Basil (dried)', 0.79, 6.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('098', 'Salmon', 16.99, 600.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('150', 'Noodles', 0.69, 90.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('151', 'Milk', 0.79, 1000.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('179', 'Oat milk', 2.19, 1000.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('201', 'Canned tuna', 1.79, 200.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('218', 'Potato', 1.39, 1000.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('241', 'Flour', 1.19, 2000.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('317', 'Sugar', 0.85, 1000.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('318', 'Salt', 0.95, 1000.0, 'food');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('411', 'Toothbrush', 1.45, 100.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('426', 'Toothpaste', 0.99, 100.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('435', 'Toilet paper', 3.35, 200.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('443', 'Toilet brush', 5.59, 200.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('458', 'Shampoo', 1.79, 350.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('481', 'Shavers', 3.85, 50.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('484', 'Napkins', 1.75, 100.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('488', 'Deodorant', 2.05, 100.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('490', 'Mouthwash', 4.79, 500.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('527', 'Soap', 1.79, 300.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('537', 'Diapers', 10.99, 1000.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('553', 'Disinfectant', 2.55, 400.0, 'hygiene');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('622', 'Football', 24.95, 400.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('640', 'Cycle', 299.0, 5000.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('670', 'Helmet', 24.95, 900.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('673', 'Flowers', 5.6, 300.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('675', 'Movie DVD', 7.99, 100.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('688', 'Console 4', 299.0, 1000.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('689', 'Toy', 12.99, 300.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('690', 'Boardgame', 24.95, 500.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('700', 'Mini skateboard', 9.99, 10.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('711', 'Scooter', 22.95, 3000.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('722', 'Jigsaw', 15.99, 500.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('725', 'Music CD', 19.55, 100.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('745', 'Shoes', 59.95, 400.0, 'hobbies');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('817', 'Spatula', 10.99, 100.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('826', 'Whisk', 6.95, 100.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('848', 'Microwave oven', 59.95, 2000.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('857', 'Blender', 23.95, 1500.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('858', 'Ladel', 10.99, 100.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('883', 'Bowl', 13.0, 500.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('894', 'Utensils', 39.99, 1000.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('905', 'Coffee machine', 29.95, 1500.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('915', 'Kettle', 20.95, 500.0, 'kitchen');
INSERT INTO Product (prodID, description, price, weight, type) VALUES ('916', 'Coffee mug', 9.99, 300.0, 'kitchen');