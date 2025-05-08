#!/bin/bash

mc alias set backup http://doktor-m-v2:30892 minio minio123
mc mirror backup/paper /backup