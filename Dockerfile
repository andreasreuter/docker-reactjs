FROM debian:latest

RUN apt-get update && \
    apt-get install --yes \
      git \
      python \
      g++ \
      make \
      curl \
      nginx

# It always downloads and builds latest stable sources of Node.
RUN cd /tmp && \
    curl -O https://nodejs.org/dist/latest-v10.x/node-v10.16.0.tar.gz && \
    tar -xf node-v10.16.0.tar.gz && \
    cd ./node-v10.16.0 && \
    ./configure && \
    make -j4 && \
    make install

# Downloads latest React or fails if an error occurs.
RUN npm update -g && \
  npm install -g \
    react \
    react-dom \
    react-scripts \
    yarn

# Copy and activate reverse proxy configuration.
RUN rm /etc/nginx/sites-enabled/default
COPY ./domain.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/domain.conf /etc/nginx/sites-enabled/

EXPOSE 80/tcp
