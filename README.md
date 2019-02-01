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
   * rebuild indexes
* **Info**
   * select a product version
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


# Contribution
Hope you found these scripts helpful, your contributions and suggestions will be very much appreciated. Please submit a pull request.

# License
SQL tricks are released under the MIT license what means that you can modify and use it how you want even for commercial use. Please give this repository a star if you like any of SQL tricks and your experience was positive.
