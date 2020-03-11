FROM centos:latest
MAINTAINER kuaiwenwu

ADD flink.tar.gz /opt/flink/
ADD jdk-8u221-linux-x64.tar.gz /usr/local/
ADD hadoop-2.7.7.tar.gz /opt/hadoop/
ADD scala-2.11.8.tar.gz /usr/local/
ADD spark-2.4.4-bin-hadoop2.7.tgz /opt/spark/
ADD apache-hive-2.3.6-bin.tar.gz /opt/hive/

ENV TIME_ZONE Asia/Shanghai
ENV SPARK_HOME=/opt/spark/spark-2.4.4-bin-hadoop2.7
ENV SPARK_CONF_DIR=$SPARK_HOME/conf
ENV PYSPARK_ALLOW_INSECURE_GATEWAY=1
ENV HIVE_HOME=/opt/hive/apache-hive-2.3.6-bin
ENV FLINK_HOME=/opt/flink/flink-1.7.2
ENV HIVE_CONF_DIR=$HIVE_HOME/conf
ENV SCALA_HOME=/usr/local/scala-2.11.8
ENV HADOOP_HOME=/opt/hadoop/hadoop-2.7.7
ENV HADOOP_CONF_PATH=$HADOOP_HOME/etc/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV JAVA_HOME /usr/local/jdk1.8.0_221
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH ${JAVA_HOME}/bin/:${SPARK_HOME}/bin:${HIVE_HOME}/bin:${SCALA_HOME}/bin:${FLINK_HOME}/bin:${HADOOP_HOME}/sbin:${HADOOP_HOME}/bin:$PATH
