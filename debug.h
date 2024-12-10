#ifndef DEBUG_H
#define DEBUG_H 1

#include <stdarg.h>

/// @brief The debug print.
/// @param level The debug level.
/// @param fmt The format.
/// @param ap The arguments.
#define VDEBUG_PRINTF(level, fmt, ap) \
    vdebug(__FILE__, __LINE__, __func__, (level), fmt, ap)

/// @brief The debug print.
/// @param level The debug level.
/// @param ... The arguments.
#define DEBUG_PRINTF(level, ...) \
    debug(__FILE__, __LINE__, __func__, (level), __VA_ARGS__)

void set_debug_level(long long level);
void vdebug(
    const char *file, long line, const char *func, long long level,
    const char *fmt, va_list ap
);
void debug(
    const char *file, long line, const char *func, long long level,
    const char *fmt, ...
);

#endif // End of `ifndef DEBUG_H`
