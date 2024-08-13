FROM postgres:16.2

#### Environmental variables ####
# Set timezone
ENV TZ="Europe/Warsaw"
# Set DB name and default user
ENV POSTGRES_DB="Actions"
ENV POSTGRES_PASSWORD="S4TR0N8_!@#"
ENV POSTGRES_USER="Actions"

#### Install packages ####
# Install plpython extension for code written in Python support
RUN apt-get update
RUN apt-get install -y postgresql-plpython3-16
RUN apt-get install -y locales locales-all
RUN apt-get install -y python3-requests


#### Copy files ####
# Copy scripts to run on startup
COPY ./SQL/* /docker-entrypoint-initdb.d/



EXPOSE 5432
CMD ["postgres"]