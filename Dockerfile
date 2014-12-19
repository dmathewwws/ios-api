# Pull nodejs base image
FROM google/nodejs:0.10.30

# Author for nagging
MAINTAINER Daniel Mathews "dannyl.mathews@gmail.com"

RUN apt-get -y update

# Install stongloops
RUN npm install --global pg strongloop

ADD . /ios-api

RUN cd /ios-api && npm install

ADD datasources.json /ios-api/server/

# Expose running port
EXPOSE 3000

WORKDIR /ios-api

CMD ["slc", "run"]