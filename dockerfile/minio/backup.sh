#!/bin/bash

set -euxo pipefail

mc alias set backup http://"${HOST}:${MINIO_PORT}" ${MINIO_USERNAME} ${MINIO_PASSWORD}
mc mirror "backup/${SERVICE_NAME}" /backup/backup-$(date "+%Y%m%d")/${SERVICE_NAME}-minio-$(date "+%Y%m%d-%H%M%S")