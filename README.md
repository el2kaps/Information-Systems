### Information-Systems
This project is part of the course "Analysis and Design of Information Systems" <br>
School of ECE, National Technical University of Athens 2021-2022 <br>
Team: <br>
[Eleftherios Lymperopoulos](https://github.com/LefterisLymp) <br>
[Eleni-Elpida Kapsali](https://github.com/el2kaps) <br>
[Theodoti Stoikou](https://github.com/DidoStoikou) <br>

## A study of the Trino (Presto) polystore for executing SQL analytic queries
</p>
<p align="center">
   <a href="https://trino.io/download.html">
       <img src="https://img.shields.io/maven-central/v/io.trino/trino-server.svg?label=Trino" alt="Trino download" />
   </a>
   <a href="https://trino.io/trino-the-definitive-guide.html">
       <img src="https://img.shields.io/badge/Trino%3A%20The%20Definitive%20Guide-download-brightgreen" alt="Trino: The Definitive Guide book download" />
   </a>
</p>
<br>
The purpose of this project is to connect the distributed SQL query engine Trino with the databases MongoDB, Apache HBase, Apache Cassandra and study the properties "Query optimization", "Scalability" and "Performance" of the system. 

The **architecture** of the implemented system: <br>

<img src="https://user-images.githubusercontent.com/63153771/160221904-ce759083-f60a-4ec8-9672-a8522e6356ff.png" width="600" height="400" align="center">

### Set up the system
**Step 1:** Install the databases using the official guides<br>
✔️**MongoDB** on Machine 1 <br>
  Start MongoDB:  ```sudo systemctl start mongod.service```<br>
  Stop MongoDB: ```sudo systemctl start mongod.service```
<br>
✔️**Apache Cassandra** on Machine 2
<br>
✔️**Apache HBase** on Machine 3

**Step 2:** Set up the databases <br>
Now we must set up the databases so as to LISTEN to the private network's addresses 192.168.0.1, 192.168.0.2, 192.168.0.3 rather than localhost (127.0.0.1).<br>
✔️**MongoDB** <br>
Change network interfaces in ```mongod.conf``` to: <br>
```
# network interfaces
net:
  port: 27017
  bindIp: 192.168.0.1
  and restart the database. <br>
  ```
Use the command ```sudo lsof -iTCP -sTCP:LISTEN | grep mongo``` to check that the database listens to the desired IP. <br>
```mongod.conf``` in our system is located in \etc\ directory.
<br>
✔️**Cassandra** <br>
Replace ```cassandra.yaml``` with the ```cassandra.yaml``` in the Cassandra directory. <br>
Use the command ```sudo lsof -iTCP -sTCP:LISTEN | grep cassandra```to check that the database listens to the desired IP (192.168.02). <br>
```cassandra.yaml``` in our system is located in \etc\ directory.

✔️**HBase**<br>
HBase's set up is a little bit more tricky because Trino doesn't provides an HBase connenctor but a Phoenix connector.


**Step 3:** Set up Trino <br>
* Copy directory to the respective Machine.
* Start Trino servers (one for each machine)
  ```
  cd Trino/trino/server-373
  bin/launcher run
  ```
* To stop a Trino server run 
  ```
  cd Trino/trino/server-373
  bin/launcher stop
  ```
**Step 4:** Run Trino CLI <br>
* At the machine where the coordinator Trino node runs 
  ```
  cd Trino
  ./trino
  ```
✔️Now you can query the databases by writing SQL queries to Trino CLI.

## Examples
* Checks that all workers are connected 
<img src="https://user-images.githubusercontent.com/63153771/160288908-3c6aebe1-0d84-4e8e-871e-5d40fe66fb22.png" width="600" height="200" align="center">

* Check that we have access to all dbs

![image](https://user-images.githubusercontent.com/63153771/160290466-fc335cf7-ba7c-456c-8c26-39ac165f34f5.png)

![image](https://user-images.githubusercontent.com/63153771/160290487-30ec31a1-d22b-4379-81d4-1e481d180f14.png)

* To work on a specific schema ex. mongodb.tpcds 
  ```use mongodb.tpcds```
  Output: ```USE```
  Now store_returns refers to the store_returns table stored in MongoDB.
  ![image](https://user-images.githubusercontent.com/63153771/160290380-59fe3b1b-3c29-47ec-93f4-feabca38ef82.png)
  
 * Use ```DESCRIBE <table name>``` to view sql columns of the table.
  ![image](https://user-images.githubusercontent.com/63153771/160290912-ee1b0cbe-ca4f-459f-80f0-25f29db94dd1.png)
  
* Use ```SHOW STATS``` for approximated statistics for the named table.
  
    

