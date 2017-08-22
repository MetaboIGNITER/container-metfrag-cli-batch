FROM ubuntu:16.04

LABEL software.version=2.4.2
LABEL version=0.2
LABEL software=metfrag-cli-batch

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="MetFrag command line interface for batch processing."

# Update & upgrade sources
RUN apt-get -y update

# Install development files needed
RUN apt-get -y install wget default-jre-headless parallel

# Clean up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Install MetFrag
RUN wget -O /usr/local/bin/MetFragCLI.jar http://msbi.ipb-halle.de/~cruttkie/92f73acb731145c73ffa3dfb8fd59581bee0d844963889338c3ec173874b5a5f/MetFrag-2.4.2.jar

# Add testing to container
ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

# Add metfrag.sh
ADD metfrag.sh /usr/local/bin/metfrag.sh
RUN chmod +x /usr/local/bin/metfrag.sh

# Define Entry point script
#ENTRYPOINT ["java", "-jar", "/usr/local/bin/MetFragCLI.jar"]

