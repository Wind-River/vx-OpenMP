/* nl_types.h - dummy POSIX localization message catalog implementation */

/*
 * Copyright (C) 2019 Wind River Systems, Inc.
//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
*/

/*
modification history
--------------------
29apr19,kjn  written (F11802)
*/

#ifndef __INCnl_typesh
#define __INCnl_typesh

/* includes */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* defines */

/* typedefs */

typedef int 	nl_catd;

/* function declarations */

static inline int catclose(nl_catd catd)
    {
    return -1;
    }

static inline char *catgets(nl_catd catd, int set_id, int msg_id, const char *s)
    {
    return (char *)s;
    }

static inline nl_catd catopen(const char *name, int oflag)
    {
    return -1;
    }

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* __INCnl_typesh */
