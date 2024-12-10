#ifndef LOG_H
#define LOG_H 1

/// @file
/// @brief Logging.
/// @copyright
///   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: GPL-3.0-or-later

#include <stdarg.h>

/// @brief Log.
/// @param priority The syslog(3) priority.
/// @param fmt The fprintf(3) format string.
/// @param ap The argument list.
#define VMY_LOG(priority, fmt, ap) \
    vmy_log(priority, __FILE__, __LINE__, __func__, fmt, ap)

/// @brief Log.
/// @param priority The syslog(3) priority.
/// @param ... The arguments.
#define MY_LOG(priority, ...) \
    my_log(priority, __FILE__, __LINE__, __func__, __VA_ARGS__)

void vmy_log(
    int priority, const char *file, long line, const char *func,
    const char *fmt, va_list ap
);

void my_log(
    int priority, const char *file, long line, const char *func,
    const char *fmt, ...
);

#endif // End of `ifndef LOG_H`
