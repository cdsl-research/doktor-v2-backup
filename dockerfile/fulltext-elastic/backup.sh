#!/bin/bash

elasticdump --input=http://doktor-m-v2:32134/fulltext \
--output=/backup/dump.json --type=data --limit=10000 --overwrite