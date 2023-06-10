create database TripPlanner;

use TripPlanner;

create table Destinations
(destination_id char(5) NOT NULL,
continent varchar(50) NOT NULL,
country char(5) NOT NULL,
city varchar(50) NOT NULL,
constraint pk_destination_id primary key (destination_id));

insert into Destinations
(destination_id, continent, country, city)
values 
('EUBAR', 'Europe', 'ESP', 'Barcelona'),
('ASSEO', 'Asia', 'SKR', 'Seoul'),
('EULIS', 'Europe', 'PRT', 'Lisbon'),
('AUMEL', 'Australia', 'AUS', 'Melbourne'),
('NATOR', 'North America', 'CAN', 'Toronto'),
('SABUA', 'South America', 'ARG', 'Buenos Aires'),
('AFCAI', 'Africa', 'EGY', 'Cairo');

create table Attractions
(attraction_id char(5) NOT NULL,
attraction_name varchar(50) NOT NULL,
entrance_fee varchar(10),
destination_id char(5) NOT NULL,
constraint pk_attraction_id primary key (attraction_id));

insert into Attractions
(attraction_id, attraction_name, entrance_fee, destination_id)
values
('001', 'Basílica de la Sagrada Família', '26 EUR', 'EUBAR'),
('002', 'Park Güell', '10 EUR', 'EUBAR'),
('003', 'Gyeongbokgung Palace', '3,000 KRW', 'ASSEO'),
('004', 'N Seoul Tower', '16,000 KRW', 'ASSEO'),
('005', 'Oceanário de Lisboa', '22 EUR', 'EULIS'),
('006', 'Castelo de S. Jorge', '10 EUR', 'EULIS'),
('007', 'Royal Botanic Gardens Victoria', 'free', 'AUMEL'),
('008', 'National Gallery of Victoria', 'free', 'AUMEL'),
('009', 'CN Tower', '43 CAD', 'NATOR'),
('010', 'Royal Ontario Museum', '23 CAD', 'NATOR'),
('011', 'Museo Nacional de Bellas Artes', 'free', 'SABUA'),
('012', 'Cementerio de la Recoleta', 'free', 'SABUA'),
('013', 'The Museum of Egyptian Antiquities', '160 EGP', 'AFCAI'),
('014', 'Coptic Cairo', '40 EGP', 'AFCAI');

create table Restaurants
(restaurant_id char(7) NOT NULL,
restaurant_name varchar(50) NOT NULL,
food_type varchar(50),
destination_id char(5) NOT NULL,
constraint pk_restaurant_id primary key (restaurant_id));

insert into Restaurants
(restaurant_id, restaurant_name, food_type, destination_id)
values
('BAR1', 'Diegos Restaurant', 'spanish', 'EUBAR'),
('BAR2', 'Costa Pacifico', 'seafood', 'EUBAR'),
('SEO1', 'YoonAh Dakgalbi', 'korean', 'ASSEO'),
('SEO2', 'Hao Chai', 'chinese', 'ASSEO'),
('LIS1', 'Lisboa Restaurant', 'portuguese', 'EULIS'),
('LIS2', 'Maria - Pesticaria', 'seafood', 'EULIS'),
('MEL1', 'La Pasta Fresca', 'italian', 'AUMEL'),
('MEL2', 'Paper Scissors Rice', 'sushi', 'AUMEL'),
('TOR1', 'Wood Oven Pizza', 'pizza', 'NATOR'),
('TOR2', 'The Club Steakhouse', 'steak house', 'NATOR'),
('BUA1', 'Casa Argentina', 'argentinean', 'SABUA'),
('BUA2', 'Deltoro', 'mexican', 'SABUA'),
('CAI1', 'Egyptian House', 'egyptian', 'AFCAI'),
('CAI2', 'The Red Grill', 'barbecue', 'AFCAI');

create table Hotels
(hotel_id int NOT NULL,
hotel_name varchar(50) NOT NULL,
rating float(2),
destination_id char(5) NOT NULL,
constraint pk_hotel_id primary key (hotel_id));

insert into Hotels
(hotel_id, hotel_name, rating, destination_id)
values
(1, 'Casa di Paolo', 4.70, 'EUBAR'),
(2, 'Happy Hotel', 4.91, 'EUBAR'),
(3, 'Seoul Getaway', 4.77, 'ASSEO'),
(4, 'Youngsik Suites', 4.85, 'ASSEO'),
(5, 'Tagus River Inn', 4.12, 'EULIS'),
(6, 'Hotel Maria', 4.56, 'EULIS'),
(7, 'Blue Star', 4.82, 'AUMEL'),
(8, 'The Local B&B', 4.68, 'AUMEL'),
(9, 'Whitebear Hotel & Resort', 4.43, 'NATOR'),
(10, 'Zzz Hotel', 4.09, 'NATOR'),
(11, 'Buenas Noches', 4.24, 'SABUA'),
(12, 'Argentina Suites', 4.63, 'SABUA'),
(13, 'Central Cairo Hotel', 4.55, 'AFCAI'),
(14, 'Cairo Dream', 4.83, 'AFCAI');

create table TimeZones
(time_id char(7) NOT NULL,
time_zone varchar(6),
destination_id char(5) NOT NULL,
constraint pk_time_id primary key(time_id));

insert into TimeZones
(time_id, time_zone, destination_id)
values
('BARTIME', 'UTC+1','EUBAR'),
('SEOTIME', 'UTC+9', 'ASSEO'),
('LISTIME', 'UTC+0', 'EULIS'),
('MELTIME', 'UTC+10', 'AUMEL'),
('TORTIME', 'UTC-5', 'NATOR'),
('BUATIME', 'UTC-3', 'SABUA'),
('CAITIME', 'UTC+2', 'AFCAI');

create table Countries
(country_id char(5) NOT NULL, 
country varchar(50) NOT NULL,
official_language varchar(50),
currency_id char(3) NOT NULL,
constraint pk_country_id primary key(country_id));


insert into Countries
(country_id, country, official_language, currency_id)
values
('ESP', 'Spain', 'Spanish', 'EUR'),
('SKR', 'South Korea', 'Korean', 'KRW'),
('PRT', 'Portugal', 'Portugese', 'EUR'),
('AUS', 'Australia', 'English', 'AUD'),
('CAN', 'Canada', 'English', 'CAD'),
('ARG', 'Argentina', 'Spanish', 'ARS'),
('EGY', 'Egypt', 'Arabic', 'EGP');


create table Currencies
(currency_id char(3) NOT NULL,
currency_name varchar(50),
constraint pk_currency_id primary key (currency_id));

insert into Currencies
(currency_id, currency_name)
values
('EUR', 'Euro'),
('KRW', 'Korean Won'),
('AUD', 'Australian Dollar'),
('CAD', 'Canadian Dollar'),
('ARS', 'Argentine Peso'),
('EGP', 'Egyptian Pound');



-- Set Foreign Key constraints to create relations between the tables

ALTER TABLE Destinations   
ADD  CONSTRAINT FK_destinations_country
FOREIGN KEY(country)
REFERENCES Countries (country_id);

ALTER TABLE Attractions   
ADD  CONSTRAINT FK_attractions_destination_id 
FOREIGN KEY(destination_id)
REFERENCES Destinations (destination_id);

ALTER TABLE Restaurants   
ADD  CONSTRAINT FK_restaurants_destination_id 
FOREIGN KEY(destination_id)
REFERENCES Destinations (destination_id);

ALTER TABLE Hotels   
ADD  CONSTRAINT FK_hotels_destination_id 
FOREIGN KEY(destination_id)
REFERENCES Destinations (destination_id);

ALTER TABLE TimeZones   
ADD  CONSTRAINT FK_times_destination_id 
FOREIGN KEY(destination_id)
REFERENCES Destinations (destination_id);

ALTER TABLE Countries   
ADD  CONSTRAINT FK_countries_currency_id 
FOREIGN KEY(currency_id)
REFERENCES Currencies (currency_id);



-- Using any type of the joins create a view that combines multiple tables in a logical way

select c.country, d.city, a.attraction_name, a.entrance_fee, t.time_zone
from Countries c
left join 
Destinations d
on 
c.country_id = d.country
left join
Attractions a
on 
d.destination_id = a. destination_id
left join
TimeZones t
on
a.destination_id = t.destination_id;



-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis

select restaurant_name, food_type
from restaurants r
where r.destination_id in (select
d.destination_id
from destinations d
where d.country in (select
c.country_id
from
countries c
where 
c.country = 'Argentina'));



-- In your database, create a stored procedure and demonstrate how it runs

create procedure InsertValue @currency_id char(3), @currency_name varchar(50)
as
begin
insert into Currencies(currency_id, currency_name)
values (@currency_id, @currency_name);
end

exec InsertValue gbp, 'British Pound'

select *
from Currencies;



-- In your database, create a trigger and demonstrate how it runs

create trigger Currencies_insert_update on Currencies
after insert, update
as
update Currencies set currency_id = upper(currency_id)
where currency_id in (select currency_id from inserted);

insert into Currencies
(currency_id, currency_name)
values
('nok', 'Norwegian Krone');


create trigger Countries_insert_update on Countries
after insert, update
as
update Countries set country_id = upper(country_id)
where country_id in (select country_id from inserted);

insert into Countries
(country_id, country, official_language, currency_id)
values
('nor', 'Norway', 'Norwegian', 'NOK');


create trigger Destinations_insert_update on Destinations
after insert, update
as
update Destinations set destination_id = upper(destination_id)
where destination_id in (select destination_id from inserted);
   
insert into Destinations
(destination_id, continent, country, city)
values
('euosl', 'Europe', 'NOR', 'Oslo');

select *
from Destinations;




-- In your database, create a stored function that can be applied to a query in your DB

USE TripPlanner

CREATE FUNCTION HotelLevel (@rating DECIMAL(10,2))
RETURNS VARCHAR(20)
AS
BEGIN
   DECLARE @hotel_level VARCHAR(20);

   IF @rating < 4.10
      SET @hotel_level = 'Blue';
	  
	  ELSE IF (@rating >= 4.10 AND @rating < 4.50)
	  SET @hotel_level = 'Bronze'; 

	 ELSE IF (@rating >= 4.50 AND @rating < 4.80)
	 SET @hotel_level = 'Silver';

	 ELSE IF (@rating >= 4.80 AND @rating < 4.90)
	 SET @hotel_level = 'Gold';

	 ELSE IF @rating >= 4.90
	 SET @hotel_level = 'Platinum';

   RETURN @hotel_level;

   END

  select hotel_name, dbo.HotelLevel(rating)"hotel_level"
from Hotels;


