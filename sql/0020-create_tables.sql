/**
 * @file
 * @brief The SQL commands for creating the tables.
 * @copyright
 *   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
 *   SPDX-License-Identifier: GPL-3.0-or-later
 */

DROP TABLE months;
CREATE TABLE months (
    month_id SERIAL, month_label DATE UNIQUE NOT NULL,
    value1 NUMERIC(19), value2 NUMERIC(19),
    value3 NUMERIC(19), value4 NUMERIC(19),
    value5 NUMERIC(19), value6 NUMERIC(19),
    value7 NUMERIC(19), value8 NUMERIC(19),
    value9 NUMERIC(19), value10 NUMERIC(19),
    value11 NUMERIC(19), value12 NUMERIC(19),
    value13 NUMERIC(19), value14 NUMERIC(19),
    value15 NUMERIC(19), value16 NUMERIC(19),
    value17 NUMERIC(19), value18 NUMERIC(19),
    value19 NUMERIC(19), value20 NUMERIC(19),
    value21 NUMERIC(19), value22 NUMERIC(19),
    value23 NUMERIC(19), value24 NUMERIC(19),
    value25 NUMERIC(19), value26 NUMERIC(19),
    value27 NUMERIC(19), value28 NUMERIC(19),
    value29 NUMERIC(19), value30 NUMERIC(19),
    value31 NUMERIC(19),
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (month_id)
);

DROP TABLE users;
CREATE TABLE users (
    user_id SERIAL, user_name VARCHAR(255) UNIQUE NOT NULL,
    real_name VARCHAR(255), addr VARCHAR(255),
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);