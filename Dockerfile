# Specify Ubuntu Saucy as base image
FROM ubuntu:latest

MAINTAINER Rusty Phillips

ADD ./setup.sh /home/rusty/setup.sh

RUN /home/rusty/setup.sh
RUN rm /home/rusty/setup.sh
# Copy ssh keys pair to home directory of theodoer user
ADD ./ssh/zen-cmd.pub /home/rusty/.ssh/authorized_keys

# Expose ssh port and mosh port
EXPOSE 22 6000
