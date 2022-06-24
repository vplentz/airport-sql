FROM mysql
# Copy data to load into db
COPY ${PWD}/raw_data/ raw_data/
# Creating the Database and Table Schemas
ADD ${PWD}/init_db.sql /docker-entrypoint-initdb.d