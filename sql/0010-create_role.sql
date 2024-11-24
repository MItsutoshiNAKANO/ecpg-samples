/**
 * @file
 * @brief The SQL commands for creating the database role.
 */

CREATE ROLE sample LOGIN CREATEROLE PASSWORD 'sample';
CREATE DATABASE sample OWNER sample;
