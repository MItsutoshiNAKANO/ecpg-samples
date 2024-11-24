/**
 * @file
 * @brief The SQL commands for creating the tables.
 */

CREATE TABLE months (
    month_id SERIAL, month_label DATE NOT NULL,
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