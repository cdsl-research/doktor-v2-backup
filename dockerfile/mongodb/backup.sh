#!/bin/bash

set -euxo pipefail

mongodump \
--host="${HOST}:${MONGO_PORT}" \
--db ${MONGO_DB} \
--collection ${MONGO_COLLECTION} \
--username ${MONGO_USERNAME} \
--password ${MONGO_PASSWORD} \
--authenticationDatabase ${MONGO_AUTHDB} \
--out /backup/backup-$(date "+%Y%m%d")/${SERVICE_NAME}-mongo-$(date "+%Y%m%d-%H%M%S")