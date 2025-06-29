#!/bin/bash

set -euxo pipefail

DIR="/backup/backup-$(date "+%Y%m%d")/${SERVICE_NAME}-elastic-$(date "+%Y%m%d-%H%M%S")"
mkdir -p $DIR

elasticdump \
--input=http://"${HOST}:${ELASTICSEARCH_PORT}"/fulltext \
--output="$DIR/mapping.json" \
--type=mapping

elasticdump \
--input=http://"${HOST}:${ELASTICSEARCH_PORT}"/fulltext \
--output="$DIR/settings.json" \
--type=settings

elasticdump \
--input=http://"${HOST}:${ELASTICSEARCH_PORT}"/fulltext \
--output="$DIR/data.json" \
--type=data \
--limit=10000