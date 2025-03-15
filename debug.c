/// @file
/// @brief Debugging functions
/// @copyright
///   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: GPL-3.0-or-later

#include "debug.h"
#include "error.h"

/// @brief The base debug level.
static long long base_debug_level = 0;

/// @brief Set the base debug level.
/// @param level The debug level.
void
set_debug_level(long long level)
{
    base_debug_level = level;
}

/// @brief Debug.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param level The debug level.
/// @param fmt The format.
/// @param ap The arguments.
void
vdebug(
    const char *file, long line, const char *func, long long level,
    const char *fmt, va_list ap
)
{
    if (level > base_debug_level) {
        return;
    }
    vmy_warnx(file, line, func, fmt, ap);
}

/// @brief Debug.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param level The debug level.
/// @param fmt The format.
/// @param ... The arguments.
void
debug(
    const char *file, long line, const char *func, long long level,
    const char *fmt, ...
)
{
    va_list ap;
    va_start(ap, fmt);
    vdebug(file, line, func, level, fmt, ap);
    va_end(ap);
}
