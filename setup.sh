#! /bin/sh -eux

## @file
# @brief Setup the database for the sample project.

dir=$(dirname "$0")
cd "$dir"

sudo sudo -u postgres psql -f './sql/0010-create_role.sql'
psql -f './sql/0020-create_tables.sql' 'postgresql://sample@127.0.0.1'
psql -f './sql/0110-insert_samples.sql' 'postgresql://sample@127.0.0.1'
make
