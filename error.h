#ifndef ERROR_H
#define ERROR_H 1

/// @file
/// @brief Error handling.
/// @copyright
///   (C) 2025 Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: GPL-3.0-or-later

#include <stdarg.h>

/// @brief Warning.
/// @param ... The arguments.
#define WARN(...) my_warn(__FILE__, __LINE__, __func__, __VA_ARGS__)

/// @brief Warning.
/// @param ... The arguments.
#define WARNX(...) my_warnx(__FILE__, __LINE__, __func__, __VA_ARGS__)

/// @brief Failed and exit.
/// @param exit_status The exit status.
#define ERR(exit_status, ...) \
    my_err(__FILE__, __LINE__, __func__, exit_status, __VA_ARGS__)

/// @brief Failed and exit.
/// @param exit_status The exit status.
/// @param ... The arguments.
#define ERRX(exit_status, ...) \
    my_errx(__FILE__, __LINE__, __func__, exit_status, __VA_ARGS__)

void vmy_warn(
    const char *file, long line, const char *func, const char *fmt, va_list ap
);
void
my_warn(const char *file, long line, const char *func, const char *fmt, ...);
[[noreturn]] void vmy_err(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, va_list ap
);
[[noreturn]] void my_err(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, ...
);
void vmy_warnx(
    const char *file, long line, const char *func, const char *fmt, va_list ap
);
void
my_warnx(const char *file, long line, const char *func, const char *fmt, ...);
[[noreturn]] void vmy_errx(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, va_list ap
);
[[noreturn]] void my_errx(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, ...
);

#endif // End of `ifndef ERROR_H`
