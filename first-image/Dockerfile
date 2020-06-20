# Use an existing docker image as a base
FROM alpine 

# Download and install a dependency
# if this step was already performed data will be stored in the cache.
# however, the chaching is dependent from the order
RUN apk add --update redis 
RUN apk add --update gcc

# Tell that image what to do when in starts as a container
CMD ["redis-server"]