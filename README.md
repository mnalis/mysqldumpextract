# mysqldumpextract

parses mysqldump backup file (usually created with "mysqldump --all-databases", and extracts only one database from it.
It can also extract only some tables from that database, or extract all tables except some of them.

Usage:

# All tables from database "mydb1" EXCEPT "table1" and "table2" from .gz backup
zcat mysqldump.sql.gz | mysqldumpextract --ignore-table=mydb1.table1 --ignore-table=table2 mydb1 | gzip > short_dump.sql.gz

# only table5 and table6 from database "mydb2", reading from .xz backup and compressing output to .bz2 
xzcat mysqldump.sql.xz | mysqldumpextract mydb1 table5 table6 |bzip2 > table_5_6.sql.bz2
