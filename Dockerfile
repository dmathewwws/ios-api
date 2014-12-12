# Pull nodejs base image
FROM google/nodejs:0.10.30

# Author for nagging
MAINTAINER Daniel Mathews "dannyl.mathews@gmail.com"

RUN apt-get -y update

# Install dependencies
#RUN apt-get -y install postgresql-client supervisor

# Install gatewayd's dependencies using NPM:
#RUN npm install --global pg pm2 grunt grunt-cli forever db-migrate jshint

# Install stongloops
RUN npm install --global pg strongloop

#Get source code
RUN cd / && git clone https://github.com/dmathewwws/ios-api.git

#ADD . /iOS-test

# Clone project to /gatewayd
RUN cd /ios-api && npm install

# Expose running port
EXPOSE 3000

WORKDIR /ios-api

RUN slc run