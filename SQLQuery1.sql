CREATE DATABASE drill_7A;

CREATE TABLE [PERSONTABLE]
(
	[id] [int] IDENTITY (1,1) NOT NULL,
	[FirstName] VARCHAR(50) NOT NULL,
	[LastName] VARCHAR(50) NOT NULL
);

INSERT INTO [PERSONTABLE] ([FirstName], [LastName])
	VALUES
	('Katelyn', 'Kwananator'),
	('Mariam', 'Crankanator'),
	('Sharon', 'Ape')
;

SELECT * FROM [PERSONTABLE];

CREATE TABLE tbl_lastname (
	lname_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	lname_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_lastname
	(lname_type)
	VALUES
	('Kwananator'),
	('Crankanator'),
	('Ape')
;

SELECT * FROM tbl_lastname


CREATE TABLE tbl_contact (
	phone_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	phone_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_contact
	(phone_type)
	VALUES
	('604-566-6665'),
	('778-906-5432'),
	('604-322-9065')
;

SELECT * FROM tbl_contact;

//*Still unsure about foreign key concept*//

USE db_zooTes2
CREATE PROCEDURE createZooDB
AS
BEGIN


	CREATE TABLE tbl_animalia (
		animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		animalia_type VARCHAR (50) NOT NULL
	);

	INSERT INTO tbl_animalia
		(animalia_type)
		VALUES
		('vertebrate'),
		('invertebrate')
	;
	SELECT * FROM tbl_animalia;

	CREATE TABLE tbl_class (
		class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		class_type VARCHAR(50) NOT NULL
	);

	INSERT INTO tbl_class
		(class_type)
		VALUES
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinodern')
	;

	SELECT * FROM tbl_class;

	CREATE TABLE tbl_order (
		order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		order_type VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_care (
		care_id VARCHAR(50) PRIMARY KEY NOT NULL,
		care_type VARCHAR(50) NOT NULL,
		care_specialist INT NOT NULL
	);

	CREATE TABLE tbl_nutrition (
		nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
		nutrition_type VARCHAR(50) NOT NULL,
		nutrition_cost MONEY NOT NULL
	);

	CREATE TABLE tbl_habitat (
		habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
		habitat_type VARCHAR(50) NOT NULL,
		habitat_cost MONEY NOT NULL
	);

	CREATE TABLE tbl_specialist (
		specialist_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		specialist_fname VARCHAR(50) NOT NULL,
		specialist_lname VARCHAR(50) NOT NULL,
		specialist_contact VARCHAR(50) NOT NULL

	);

	INSERT INTO tbl_order
		(order_type)
		VALUES
		('carnivore'),
		('herbivore'),
		('omnivore')
	;

	SELECT * FROM tbl_order;

	INSERT INTO tbl_care 
		(care_id, care_type, care_specialist)
		VALUES
		('care_0', 'replace the straw', 1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitamins', 1),
		('care_3', 'human contact_pet subject', 2),
		('care_4', 'clean up animal waste', 1),
		('care_5', 'move subject to exercise pen', 3),
		('care_6', 'drain and refill aquarium', 1),
		('care_7', 'extensive dental work', 3)
	;

	SELECT * FROM tbl_care

	INSERT INTO tbl_nutrition
		(nutrition_type, nutrition_cost)
		VALUES
		('raw fish', 1500),
		('living rodents', 600),
		('mixture of fruit and rice', 800),
		('warm bottle of milk', 600),
		('syringe feed broth', 600),
		('lard and seed mix', 300),
		('aphids', 150),
		('vitamins and marrow', 3500)
	;

	SELECT * FROM tbl_nutrition;

	INSERT INTO tbl_habitat
		(habitat_type, habitat_cost)
		VALUES
		('tundra', 40000),
		('grassy gnoll with trees', 12000),
		('10 ft pond and rocks', 30000),
		('icy aquarium with snowy facade', 50000),
		('short grass, shade, and moat', 50000),
		('netted forest atrium', 10000),
		('jungle vines and winding branches', 15000),
		('cliff with shaded cave', 15000)
	;

	SELECT * FROM tbl_habitat;

	INSERT INTO tbl_specialist
		(specialist_fname, specialist_lname, specialist_contact)
		VALUES
		('margret', 'nyguen','384-576-2899'), 
		('mary', 'fischer','384-764-4856'), 
		('arnold', 'holden','385-475-3944'), 
		('ken', 'byesan','384-485-4855'), 
		('delmonte', 'fyedo','768-288-3749')
	;

	SELECT * FROM tbl_specialist;

	CREATE TABLE tbl_species (
		species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		species_name VARCHAR(50) NOT NULL,
		species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
		);

		INSERT INTO tbl_species
			(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
			VALUES
			('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
			('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
			('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
			('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
			('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
			('panda', 1, 102, 3, 5006, 2202, 'care_4'),
			('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
			('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
		;


		SELECT * FROM tbl_species;

		SELECT
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tbl_species a1
		INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
		INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
		INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
		WHERE species_name = 'brown bear'
	;
END

SELECT * FROM tbl_habitat;

SELECT * FROM tbl_species WHERE species_order = 3

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;

SELECT species_name FROM tbl_species WHERE nutrition_id BETWEEN 2202 AND 2206;
SELECT species_name FROM tbl_species INNER JOIN tbl_nutrition ON tbl_species.species_name = tbl_nutrition.nutrition_id WHERE nutrition_id BETWEEN 2202 and 2206; //* Not sure how to do this one*//

SELECT * FROM tbl_specialist WHERE specialist_fname, specialist_lname, specialist_contact 