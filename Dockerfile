# Use a base image with a minimal Linux distribution
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Update package lists and install necessary tools
RUN apt-get update \
    && apt-get install -y \
        openjdk-11-jre-headless \
        wget \
        gnupg2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Add JAVA_HOME to the PATH
ENV PATH $PATH:$JAVA_HOME/bin

# Install Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - \
    && sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' \
    && apt-get update \
    && apt-get install -y \
        jenkins \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose the default Jenkins port
EXPOSE 8080

# Start Jenkins on container startup
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

