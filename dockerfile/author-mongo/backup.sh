#!/bin/bash

mongodump --host="doktor-m-v2:30736" \
--db author --collection author --username root --password example --authenticationDatabase admin \
--out /backup
