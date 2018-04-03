FROM quay.io/biocontainers/metfrag:2.4.2--1
#FROM ubuntu:16.04

LABEL software.version=2.4.2
LABEL version=0.7
LABEL software=metfrag-cli-batch

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="MetFrag command line interface for batch processing."

# Update & upgrade sources
#RUN apt-get -y update

# Install development files needed
#RUN apt-get -y install wget openjdk-8-jdk-headless parallel zip 

# Clean up
#RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Install MetFrag
#RUN wget -O /usr/local/bin/MetFragCLI.jar http://msbi.ipb-halle.de/~cruttkie/92f73acb731145c73ffa3dfb8fd59581bee0d844963889338c3ec173874b5a5f/MetFrag-2.4.3.jar

#RUN wget http://central.maven.org/maven2/net/sf/jni-inchi/jni-inchi/0.8/jni-inchi-0.8.jar && mkdir -p /root/.jnati/repo/ && jar xf jni-inchi-0.8.jar && mv META-INF/jniinchi /root/.jnati/repo/

# Add testing to container
ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

# Add metfrag.sh
ADD metfrag.sh /usr/local/bin/metfrag.sh
RUN chmod +x /usr/local/bin/metfrag.sh

# Add run_metfrag.sh
ADD run_metfrag.sh /usr/local/bin/run_metfrag.sh
RUN chmod +x /usr/local/bin/run_metfrag.sh

# Define Entry point script
ENTRYPOINT ["metfrag"]

