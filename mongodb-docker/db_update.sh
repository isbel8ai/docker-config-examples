# Update local database
docker exec mongodb mongodump --host="$BARNES_DB_HOST" --port="$BARNES_DB_PORT" --db="$BARNES_DB_NAME" --authenticationDatabase="admin" --username="$BARNES_DB_USER" --password="$BARNES_DB_PASS" --out=/tmp/dump
docker exec mongodb mongorestore --host=localhost --port=27017 --authenticationDatabase=admin --username=root --password=password --drop /tmp/dump
docker exec mongodb rm -fr /tmp/dump
