# Use the official MySQL image as the base image
FROM mysql:latest

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=olympic_games
ENV MYSQL_USER=db_root
ENV MYSQL_PASSWORD=db_root

# Copy SQL script and CSV file into the container
COPY ./setup_database/athlete_events.csv /var/lib/mysql-files/
COPY ./setup_database/setup.sql /docker-entrypoint-initdb.d/

# Expose MySQL default port
EXPOSE 3306