CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars;

ALTER DATABASE indexed_cars OWNER TO indexed_cars_user;

\i scripts/car_models.sql;


\i scripts/car_model_data.sql; --*10

SELECT DISTINCT make_title FROM car_models WHERE make_code='LAM';
/*time = 39.243*/


SELECT DISTINCT model_title FROM car_models WHERE make_code='NISSAN' AND model_code='GT-R';
/*time = 38.854*/


SELECT count(*) FROM car_models WHERE make_code='LAM';
/*time = 39.552;*/

SELECT count(*) FROM car_models WHERE year >=2010 AND year <= 2015;
/*time 49.922;*/

SELECT count(*) FROM car_models WHERE year = 2010;
/*time 53.349*/

CREATE INDEX makeCodeIndex ON car_models (make_code);
CREATE INDEX yearIndex ON car_models (year);
CREATE INDEX modelCodelIndex ON car_models (model_code);
/*CREATE INDEX makeTitleIndex ON car_models (make_title);*/
/*CREATE INDEX modelTitleIndex ON car_models (modelTitle);*/

SELECT DISTINCT make_title FROM car_models WHERE make_code='LAM';
--2.207 

SELECT DISTINCT model_title FROM car_models WHERE make_code='NISSAN' AND model_code='GT-R';
--1.320


SELECT count(*) FROM car_models WHERE make_code='LAM';
--0.768

SELECT count(*) FROM car_models WHERE year >=2010 AND year <= 2015;
--27.260

SELECT count(*) FROM car_models WHERE year = 2010;
--7.421
DROP TABLE car_models; 

\i scripts/car_models.sql;
\i scripts/car_model_data.sql;
