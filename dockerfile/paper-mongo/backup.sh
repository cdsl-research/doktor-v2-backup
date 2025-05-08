#!/bin/bash

mongodump --host="doktor-m-v2:31051" \
--db paper --collection paper --username root --password example --authenticationDatabase admin \
--out /backup
