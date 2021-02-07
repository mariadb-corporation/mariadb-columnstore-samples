DROP DATABASE IF EXISTS bts;

CREATE DATABASE bts;

USE bts;

CREATE TABLE airlines
  (
     iata_code VARCHAR(2),
     airline   VARCHAR(30)
  )
engine=columnstore
DEFAULT CHARACTER SET=utf8;

CREATE TABLE airports
  (
     iata_code VARCHAR(3),
     airport   VARCHAR(80),
     city      VARCHAR(30),
     state     VARCHAR(2),
     country   VARCHAR(30),
     latitude  DECIMAL(11, 4),
     longitude DECIMAL(11, 4)
  )
engine=columnstore
DEFAULT CHARACTER SET=utf8;

CREATE TABLE flights
  (
     year                SMALLINT,
     month               TINYINT,
     day                 TINYINT,
     day_of_week         TINYINT,
     fl_date             DATE,
     carrier             VARCHAR(2),
     tail_num            VARCHAR(6),
     fl_num              SMALLINT,
     origin              VARCHAR(5),
     dest                VARCHAR(5),
     crs_dep_time        VARCHAR(4),
     dep_time            VARCHAR(4),
     dep_delay           SMALLINT,
     taxi_out            SMALLINT,
     wheels_off          VARCHAR(4),
     wheels_on           VARCHAR(4),
     taxi_in             SMALLINT,
     crs_arr_time        VARCHAR(4),
     arr_time            VARCHAR(4),
     arr_delay           SMALLINT,
     cancelled           SMALLINT,
     cancellation_code   SMALLINT,
     diverted            SMALLINT,
     crs_elapsed_time    SMALLINT,
     actual_elapsed_time SMALLINT,
     air_time            SMALLINT,
     distance            SMALLINT,
     carrier_delay       SMALLINT,
     weather_delay       SMALLINT,
     nas_delay           SMALLINT,
     security_delay      SMALLINT,
     late_aircraft_delay SMALLINT
  )
engine=columnstore
DEFAULT CHARACTER SET=utf8; 
