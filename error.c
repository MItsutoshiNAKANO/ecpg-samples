/// @file
/// @brief Error handling.
/// @copyright
///   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: GPL-3.0-or-later

#include <err.h>
#include <errno.h>
#include <stdarg.h>

#include "error.h"

/// @brief
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param err_number The errno.
/// @param fmt The fprintf(3) format string.
/// @param ap
void
vmy_warn(
    const char *file, long line, const char *func, int err_number,
    const char *fmt, va_list ap
)
{
    int prev_errno = errno;
    warnx("%s:%ld:%s(): %d(%d)", file, line, func, err_number, prev_errno);
    errno = err_number;
    vwarn(fmt, ap);
    errno = prev_errno;
}

/// @brief Warning.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param err_number The errno.
/// @param fmt The fprintf(3) format string.
/// @param ... The arguments.
void
my_warn(
    const char *file, long line, const char *func, int err_number,
    const char *fmt, ...
)
{
    va_list ap;
    va_start(ap, fmt);
    vmy_warn(file, line, func, err_number, fmt, ap);
    va_end(ap);
}

/// @brief Failed and exit.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param err_number The errno.
/// @param exit_status The exit status.
/// @param fmt The fprintf(3) format string.
/// @param ap The argument list.
[[noreturn]] void
vmy_err(
    const char *file, long line, const char *func, int err_number,
    int exit_status, const char *fmt, va_list ap
)
{
    int prev_errno = errno;
    warnx("%s:%ld:%s(): %d(%d)", file, line, func, err_number, prev_errno);
    errno = err_number;
    verr(exit_status, fmt, ap);
}

/// @brief Failed and exit.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param err_number The errno.
/// @param exit_status The exit status.
/// @param fmt The fprintf(3) format string.
/// @param ... The arguments.
[[noreturn]] void
my_err(
    const char *file, long line, const char *func, int err_number,
    int exit_status, const char *fmt, ...
)
{
    va_list ap;
    va_start(ap, fmt);
    vmy_err(file, line, func, exit_status, err_number, fmt, ap);
    va_end(ap);
}

/// @brief Warning.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param fmt The fprintf(3) format string.
/// @param ap The argument list.
void
vmy_warnx(
    const char *file, long line, const char *func, const char *fmt, va_list ap
)
{
    warnx("%s:%ld:%s()", file, line, func);
    vwarnx(fmt, ap);
}

/// @brief Warning.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param fmt The fprintf(3) format string.
/// @param ... The arguments.
void
my_warnx(const char *file, long line, const char *func, const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    vmy_warnx(file, line, func, fmt, ap);
    va_end(ap);
}

/// @brief Failed and exit.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param exit_status The exit status.
/// @param fmt The fprintf(3) format string.
/// @param ap The argument list.
[[noreturn]] void
vmy_errx(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, va_list ap
)
{
    warnx("%s:%ld:%s()", file, line, func);
    errx(exit_status, fmt, ap);
}

/// @brief Failed and exit.
/// @param file __FILE__.
/// @param line __LINE__.
/// @param func __func__.
/// @param exit_status The exit status.
/// @param fmt The fprintf(3) format string.
/// @param  ... The arguments.
[[noreturn]] void
my_errx(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, ...
)
{
    va_list ap;
    va_start(ap, fmt);
    vmy_errx(file, line, func, exit_status, fmt, ap);
    va_end(ap);
}
