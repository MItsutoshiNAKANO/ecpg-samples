#ifndef SQL_ERROR_H
#define SQL_ERROR_H 1

/// @file
/// @brief SQL error handling.
/// @copyright
///   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: GPL-3.0-or-later

#include <stdarg.h>

void vsql_warn(const char *file, long line, const char *func, const char *fmt,
               va_list ap);
void sql_warn(const char *file, long line, const char *func, const char *fmt,
              ...);
[[noreturn]] void sql_error(const char *file, long line, const char *func,
                            int exit_status, const char *fmt, ...);

#endif // End of ifndef SQL_ERROR_H
