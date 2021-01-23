SELECT airline,
       year,
       delay_type,
       delay
FROM   (SELECT a.airline,
               f.year,
               "airline delay" delay_type,
               Count(*)        delay
        FROM   flights f
               JOIN airlines a
                 ON f.carrier = a.iata_code
        WHERE  f.carrier_delay > 0
        GROUP  BY a.airline,
                  f.year
        UNION ALL
        SELECT a.airline,
               f.year,
               "late aircraft delay" delay_type,
               Count(*)              delay
        FROM   flights f
               JOIN airlines a
                 ON f.carrier = a.iata_code
        WHERE  f.late_aircraft_delay > 0
        GROUP  BY a.airline,
                  f.year
        UNION ALL
        SELECT a.airline,
               f.year,
               "air system delay" delay_type,
               Count(*)           delay
        FROM   flights f
               JOIN airlines a
                 ON f.carrier = a.iata_code
        WHERE  f.nas_delay > 0
        GROUP  BY a.airline,
                  f.year
        UNION ALL
        SELECT a.airline,
               f.year,
               "weather delay" delay_type,
               Count(*)        delay
        FROM   flights f
               JOIN airlines a
                 ON f.carrier = a.iata_code
        WHERE  f.weather_delay > 0
        GROUP  BY a.airline,
                  f.year) t
ORDER  BY 1,
          2,
          3;
