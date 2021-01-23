# Flights Sample Data
This simple data set uses the US Department of Transportation [on time performance](https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236&DB_Short_Name=On-Time) dataset for US based flights.

## Retrieve Data
The following script will retrieve the data set by year and month creating CSV data files under the data directory. By default the script will retrieve data for all months in 2020. The script can be edited to retrieve smaller or larger data ranges as needed. The script makes use of curl and unzip which may need to be installed if not already present on your Linux OS:
```
$ ./get_flight_data.sh

Downloading data for 2020-01
######################################################################### 100.0%
######################################################################### 100.0%
Unzipping data for 2020-01
Archive:  data.zip
  inflating: 445515905_.csv

...

```

## Creating and Loading Database
The following script will create (and drop if it already exists) the *flights* database:
```
$ ./create_flights_db.sh
```
This includes the following 3 tables:

*   **airlines** : Dimension table for airlines
*   **airports** : Dimension table for airports
*   **flights** : fact table for airline departure data

The airlines and airports table will also be populated from the airlines.csv and airports.csv files in the schema directory.

The flights table is populated using a separate script which will load each CSV file from the data directory into the flights table:
```
$ ./load_flight_data.sh
```

Both scripts assume a root install of ColumnStore exists on the host but can be run as a regular user.

## Sample Queries
The following sample queries are provided in the queries directory which assume the default data set of all values from 2020 exist:

1.  **2020_airline_summary.sql** : provides a report of flight count, market share percentage, cancelled flights percentage, and diverted flights percentage by airline for 2020.
2.  **airline_delay_types_by_year.sql** : provides a report of the delay types by airline by year.
3.  **ca_2020_delays.sql** : provides a report of the volume and average arrival delay for California based airports by airline in 2020.
4.  **bayarea_2020_delays.sql** : provides a report of the average and maximum delay by month and hour in the day for bay area airports in 2020.
5.  **bayarea_nov_2020_delays.sql** : provides a report of the average and maximum delay by day and hour for bay area airports in November 2020.

The queries can be run in your favorite graphical tool but can also be run on the command line, for example:
```
$ mariadb -t bts < queries/2020_airline_summary.sql
```
