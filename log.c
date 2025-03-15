/// @file
/// @brief Logging.
/// @copyright
///   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: GPL-3.0-or-later

#include <stdarg.h>
#include <syslog.h>

#include "log.h"

/// @brief Log.
/// @param priority The syslog(3) priority.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param fmt The fprintf(3) format string.
/// @param ap The argument list.
void
vmy_log(
    int priority, const char *file, long line, const char *func,
    const char *fmt, va_list ap
)
{
    vsyslog(priority, fmt, ap);
    syslog(priority, "  at %s:%ld:%s()", file, line, func);
}

/// @brief
/// @param priority The syslog(3) priority.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param fmt The fprintf(3) format string.
/// @param ... The argument list.
void
my_log(
    int priority, const char *file, long line, const char *func,
    const char *fmt, ...
)
{
    va_list ap;
    va_start(ap, fmt);
    vmy_log(priority, file, line, func, fmt, ap);
    va_end(ap);
}
