#!/bin/bash

download_spark () {
	cd ~
	wget  https://archive.apache.org/dist/spark/spark-3.1.1/spark-3.1.1-bin-hadoop3.2.tgz
	tar -xzf spark-3.1.1-bin-hadoop3.2.tgz
	
}

configure_spark () {

	echo "export SPARK_HOME=/home/user/spark-3.1.1-bin-hadoop3.2" >> ~/.bashrc
	echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> ~/.bashrc
	echo "export PYSPARK_PYTHON=python3" >> ~/.bashrc
	echo "alias start-all.sh='\$SPARK_HOME/sbin/start-all.sh'" >> ~/.bashrc
	echo "alias stop-all.sh='\$SPARK_HOME/sbin/stop-all.sh'" >> ~/.bashrc

	source ~/.bashrc

	cd ~/spark-3.1.1-bin-hadoop3.2/conf

	cp spark-env.sh.template spark-env.sh
	echo "SPARK_WORKER_CORES=3" >> spark-env.sh
	echo "SPARK_WORKER_MEMORY=3g" >> spark-env.sh

	cp spark-defaults.conf.template spark-defaults.conf
	echo "spark.master\t\tspark://master:7077" >> spark-defaults.conf
	echo "spark.submit.deployMode\t\tclient" >> spark-defaults.conf
	echo "spark.executor.instances\t\t2" >> spark-defaults.conf
	echo "spark.executor.cores\t\t2" >> spark-defaults.conf
	echo "spark.executor.memory\t\t3g" >> spark-defaults.conf
	echo "spark.driver.memory\t\t512m" >> spark-defaults.conf
	
	echo "master" > slaves
	echo "slave1" >> slaves
        echo "slave2" >> slaves
}


echo "STARTING DOWNLOAD ON MASTER"
download_spark

echo "STARTING DOWNLOAD ON SLAVE"
ssh user@slave1 "$(typeset -f download_spark); download_spark"
ssh user@slave2 "$(typeset -f download_spark); download_spark"

echo "STARTING HADOOP CONFIGURE ON MASTER"
configure_spark

echo "STARTING HADOOP CONFIGURE ON SLAVE"
ssh user@slave1 "$(typeset -f configure_spark); configure_spark"
ssh user@slave2 "$(typeset -f configure_spark); configure_spark"
