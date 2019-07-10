/* vxPpcAtomic.c - fall-back implementation of 64-bit atomics on 32-bit PPC */

/*
 * Copyright (C) 2019 Wind River Systems, Inc.
 *
 * The right to copy, distribute, modify, or otherwise make use
 * of this software may be licensed only pursuant to the terms
 * of an applicable Wind River license agreement.
 */

/*
modification history
--------------------
25apr19,kjn  written (F11802)
*/

/*
DESCRIPTION

The LLVM OpenMP library require atomic operations on 8-byte entities,
something that is not present naively on 32-bit PowerPC.

This file contains fall-back implementation of the required operations,
atomicity is guarateed via the use of a VxWorks task spin-lock.

INCLUDE FILES: [N/A]
*/

/* includes */

#include <pthread.h>
#include <stdbool.h>
#include <stdint.h>

/* defines */

/* typedefs */

/* globals */

/* locals */

/* forward declarations */

static pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;

bool __sync_bool_compare_and_swap_8
    (
    uint64_t *ptr,
    uint64_t  oldval,
    uint64_t  newval
    )
    {
    bool swapped;

    (void)pthread_mutex_lock (&mtx);
    swapped = (*ptr == oldval);
    if (swapped)
        {
        *ptr = newval;
        }
    (void)pthread_mutex_unlock (&mtx);

    return swapped;
    }

uint64_t __sync_val_compare_and_swap_8
    (
    uint64_t *ptr,
    uint64_t  oldval,
    uint64_t  newval
    )
    {
    uint64_t prev;

    (void)pthread_mutex_lock (&mtx);
    prev = *ptr;
    if (prev == oldval)
        {
        *ptr = newval;
        }
    (void)pthread_mutex_unlock (&mtx);

    return prev;
    }

uint64_t __sync_fetch_and_and_8 (uint64_t *ptr, uint64_t value)
    {
    uint64_t prev;

    (void)pthread_mutex_lock (&mtx);
    prev = *ptr;
    *ptr &= value;
    (void)pthread_mutex_unlock (&mtx);

    return prev;
    }

uint64_t __sync_fetch_and_or_8 (uint64_t *ptr, uint64_t value)
    {
    uint64_t prev;

    (void)pthread_mutex_lock (&mtx);
    prev = *ptr;
    *ptr |= value;
    (void)pthread_mutex_unlock (&mtx);

    return prev;
    }

uint64_t __sync_fetch_and_add_8 (uint64_t *ptr, uint64_t value)
    {
    uint64_t prev;

    (void)pthread_mutex_lock (&mtx);
    prev = *ptr;
    *ptr += value;
    (void)pthread_mutex_unlock (&mtx);

    return prev;
    }
