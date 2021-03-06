# mysqldumpextract

parses mysqldump backup file (usually created with "mysqldump --all-databases", and extracts only one database from it.
It can also extract only some tables from that database, or extract all tables except some of them.

Usage:

# All tables from database "mydb1" EXCEPT "table1" and "table2" from .gz backup
zcat mysqldump.sql.gz | mysqldumpextract --ignore-table=mydb1.table1 --ignore-table=table2 mydb1 | gzip > short_dump.sql.gz

# only table5 and table6 from database "mydb2", reading from .xz backup and compressing output to .bz2 
xzcat mysqldump.sql.xz | mysqldumpextract mydb2 table5 table6 |bzip2 > table_5_6.sql.bz2

# extract all tables from mydb2 with names starting with "tt", but only extract structure for "tt_log"
xzcat mysqldump.sql.xz | mysqldumpextract --ignore-table-data=tt_log mydb2 tt% 

# table names may include "%" as SQL wildcard.
cat mysqldump.sql | mysqldumpextract mysql help_%
