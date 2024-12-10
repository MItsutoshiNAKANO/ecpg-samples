#ifndef SQL_LOG_H
#define SQL_LOG_H 1

/// @file
/// @brief SQL Log.
/// @copyright
///   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: GPL-3.0-or-later

#include <stdarg.h>

/// @brief Log SQL error.
/// @param priority Log priority.
/// @param fmt Format string.
/// @param ap Argument list.
#define VSQL_LOG(priority, fmt, ap) \
    vsql_log((priority), __FILE__, __LINE__, __func__, fmt, ap)

/// @brief Log SQL error.
/// @param priority Log priority.
/// @param ... Arguments.
#define SQL_LOG(priority, ...) \
    sql_log(priority, __FILE__, __LINE__, __func__, __VA_ARGS__)

/// @brief Log SQL error and exit.
/// @param priority Log priority.
/// @param exit_status Exit status.
/// @param fmt Format string.
/// @param ap Argument list.
#define VSQL_LOG_EXIT(priority, exit_status, fmt, ap) \
    vsql_log_exit( \
        (priority), __FILE__, __LINE__, __func__, (exit_status), fmt, ap \
    )

/// @brief Log SQL error and exit.
/// @param priority Log priority.
/// @param exit_status Exit status.
/// @param ... Arguments.
#define SQL_LOG_EXIT(priority, exit_status, ...) \
    sql_log_exit( \
        (priority), __FILE__, __LINE__, __func__, (exit_status), __VA_ARGS__ \
    )

void vsql_log(
    int priority, const char *file, long line, const char *func,
    const char *fmt, va_list ap
);

void sql_log(
    int priority, const char *file, long line, const char *func,
    const char *fmt, ...
);

[[noreturn]] void vsql_log_exit(
    int priority, const char *file, long line, const char *func,
    int exit_status, const char *fmt, va_list ap
);

[[noreturn]] void sql_log_exit(
    int priority, const char *file, long line, const char *func,
    int exit_status, const char *fmt, ...
);

#endif // End Of `ifndef SQL_LOG_H`
