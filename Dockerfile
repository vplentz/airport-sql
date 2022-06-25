FROM mysql
# Copy data to load into db
COPY ${PWD}/raw_data/ raw_data/
COPY ${PWD}/sqls/ sqls/

# Creating the database, table schemas and inserting data
#ADD ${PWD}/init_db.sql /docker-entrypoint-initdb.d