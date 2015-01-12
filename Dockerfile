# Pull nodejs base image
FROM google/nodejs:0.10.30

# Author for nagging
MAINTAINER Daniel Mathews "dannyl.mathews@gmail.com"

RUN apt-get -y update

# Install stongloops
RUN npm install --global pg strongloop

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /ios-api && cp -a /tmp/node_modules /ios-api/

ADD . /ios-api

ADD datasources.json /ios-api/server/

# Expose running port
EXPOSE 3000

WORKDIR /ios-api

CMD ["slc", "run"]