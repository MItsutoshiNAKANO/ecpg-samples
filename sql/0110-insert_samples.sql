/**
 * @file
 * @brief The SQL commands for inserting the samples.
 * @copyright
 *   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
 *   SPDX-License-Identifier: GPL-3.0-or-later
 */

DELETE FROM months;

INSERT INTO months (
    month_label, value1, value2, value3, value4, value5,
    value6, value7, value8, value9, value10,
    value11, value12, value13, value14, value15,
    value16, value17, value18, value19, value20,
    value21, value22, value23, value24, value25,
    value26, value27, value28, value29, value30, value31
) VALUES (
    '2024-11-01', 1, 2, 3, 4, 5,
    6, 7, 8, 9, 10,
    11, 12, 13, 14, 15,
    16, 17, 18, 19, 20,
    21, 22, 23, 24, 25,
    26, 27, 28, 29, 30, 31
), (
    '2024-12-01', 101, 102, 103, 104, 105,
    106, 107, 108, 109, 110,
    111, 112, 113, 114, 115,
    116, 117, 118, 119, 120,
    121, 122, 123, 124, 125,
    126, 127, 128, 129, 130, 131
);
