#!/bin/bash

set -euxo pipefail

timestamp=$(date "+%Y%m%d-%H%M%S")

mc alias set backup http://"${HOST}:${MINIO_PORT}" ${MINIO_USERNAME} ${MINIO_PASSWORD}
mc alias ls
mc alias ls backup
mc mirror "backup/${MINIO_OUTPUT}" /backup/${timestamp}-${MINIO_OUTPUT}-minio