/**
 * @file
 * @brief The SQL commands for creating the database role.
 * @copyright
 *   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
 *   SPDX-License-Identifier: GPL-3.0-or-later
 */

CREATE ROLE sample LOGIN CREATEROLE PASSWORD 'sample';
CREATE DATABASE sample OWNER sample;
