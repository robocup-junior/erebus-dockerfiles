# syntax=docker/dockerfile:1

FROM alfredroberts/erebus

# Create a directory for my controller code to go
RUN mkdir -p /usr/local/controller
WORKDIR /usr/local/controller

# Copy my controller code from the dir my dockerfile is in to my
# current (work) directory
COPY . .
# Compile my controller
RUN make

# Run my controller (using extern controller helper)
CMD webots-controller --protocol=tcp --ip-address=$EREBUS_SERVER --port=1234 --robot-name=Erebus_Bot main