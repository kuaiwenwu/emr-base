FROM centos:latest
MAINTAINER kuaiwenwu

RUN yum -y install wget tar && \
    mkdir /opt/{flink,hadoop,spark,hive}
#jdk download
WORKDIR /tmp
RUN wget -O jdk-8u221-linux-x64.tar.gz \
  -c --content-disposition \
  "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=239835_230deb18db3e4014bb8e3e8324f81b43" && \
   wget "https://archive.apache.org/dist/flink/flink-1.7.2/flink-1.7.2-bin-hadoop27-scala_2.11.tgz" && \
   wget "https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz" && \
   wget "http://archive.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz" && \
   wget "https://mirror.bit.edu.cn/apache/hive/hive-2.3.6/apache-hive-2.3.6-bin.tar.gz" && \
   wget "https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz"

RUN tar xf flink-1.7.2-bin-hadoop27-scala_2.11.tgz -C /opt/flink/ && \
    tar xf scala-2.11.8.tgz -C /usr/local/ && \
    tar xf jdk-8u221-linux-x64.tar.gz -C /usr/local/ && \
    tar xf hadoop-2.7.7.tar.gz -C /opt/hadoop/ && \
    tar xf spark-2.4.4-bin-hadoop2.7.tgz -C /opt/spark/ && \
    tar xf apache-hive-2.3.6-bin.tar.gz && \
    rm -f *.tgz *.tar.gz 

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
