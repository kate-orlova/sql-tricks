![GitHub release (latest by date)](https://img.shields.io/github/v/release/kate-orlova/sql-tricks)
[![GitHub release](https://img.shields.io/github/release-date/kate-orlova/sql-tricks.svg?style=flat)](https://github.com/kate-orlova/sql-tricks/releases/tag/v1.0)
[![GitHub license](https://img.shields.io/github/license/kate-orlova/sql-tricks.svg)](https://github.com/kate-orlova/sql-tricks/blob/master/LICENSE)
![GitHub language count](https://img.shields.io/github/languages/count/kate-orlova/sql-tricks.svg?style=flat)
![GitHub top language](https://img.shields.io/github/languages/top/kate-orlova/sql-tricks.svg?style=flat)
![GitHub repo size](https://img.shields.io/github/repo-size/kate-orlova/sql-tricks.svg?style=flat)
![GitHub contributors](https://img.shields.io/github/contributors/kate-orlova/sql-tricks)


# SQL tricks
SQL tricks are a set of useful SQL scripts everybody supporting MS SQL DBs should have at hand. Scripts are grouped into folders based on specific functionality:
* **Data integrity**
   * disable / enable DB integrity check
   * turn off / on identity check for auto incremental columns (it is required when a specific value needs to be inserted during data import as a record Id for example) 
* **DB backup**
   * create a DB backup, restore a DB from a backup
* **DB Id**
   * retrieve a DB Id
   * retrieve Id for all DBs at once
* **DB Users**
   * autofix a DB user after a DB recovery
   * change a DB owner
* **Indexes**
   * rebuild indexes (including a system _sp_MSforeachtable_ procedure in case it is missing in Azure environment)
* **Info**
   * select a product version
* **JSON**
   * create a computed column based on a JSON property
   * get a value of a JSON property into a local variable
   * use JSON properties in a query
* **Log file**
   * shrink a log file
* **Server resource utilization**
   * memory usage by a table
   * buffer cache consumption by DBs / page types
* **Spatial data**
   * create a geography column in a table
* **Statistics**
   * review statistics
   * update statistics
   * review an execution plan
* **Triggers**
   * disable / enable all table triggers
* **Validation**
   * check DB objects (stored procedures, views, functions, tables, triggers) for compatibility with DB schema


# Contribution
Hope you found these scripts helpful, your contributions and suggestions will be very much appreciated. Please submit a pull request.

# License
SQL tricks are released under the MIT license what means that you can modify and use scripts how you want even for commercial use. Please give this repository a star if you like any of SQL tricks and your experience was positive.
