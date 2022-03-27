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
**Step 1:** Set up the databases<br>
* Install MongoDB on Machine 1
* Install Apache Cassandra on Machine 2
* Install Apache HBase on Machine 3

**Step 2:** Set up Trino <br>
* Copy folders to the respective Machine.
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
**Step 3:** Run Trino CLI <br>
* At the machine where the coordinator Trino node runs 
  ```
  cd Trino
  ./trino
  ```
Now you can query the databases by writing SQL query to Trino CLI;

### Example

