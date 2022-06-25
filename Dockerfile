FROM mysql
# Copy data to load into db
COPY ${PWD}/raw_data/ raw_data/
COPY ${PWD}/sqls/ sqls/
