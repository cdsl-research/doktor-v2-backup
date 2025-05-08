#!/bin/bash

mc alias set backup http://doktor-m-v2:31691 minio minio123
mc mirror backup/thumbnail /backup