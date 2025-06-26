#!/bin/bash

set -euxo pipefail

elasticdump --input=http://"${HOST}:${ELASTICSEARCH_PORT}"/fulltext \
--output=/backup/backup-$(date "+%Y%m%d")/${ELASTICSEARCH_OUTPUT}-elastic-$(date "+%Y%m%d-%H%M%S").json --type=data --limit=10000 --overwrite