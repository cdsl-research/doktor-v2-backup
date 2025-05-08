#!/bin/bash

mongodump --host="doktor-m-v2:31320" \
--db stats --collection stats --username root --password example --authenticationDatabase admin \
--out /backup
