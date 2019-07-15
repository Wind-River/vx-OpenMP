/* 10openmp.cdf - VxWorks OpenMP support */

/*
 * Copyright (c) 2019, Wind River Systems, Inc.
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
22apr19,kjn  created (F11802)
*/

Folder FOLDER_OPENMP {
        NAME            OpenMP
        SYNOPSIS        Library support for OpenMP
        _CHILDREN       FOLDER_APPLICATION
        CHILDREN        INCLUDE_OPENMP \
                        INCLUDE_OMP_LIB
        DEFAULTS        INCLUDE_OPENMP
}

Component INCLUDE_OPENMP {
        NAME            OpenMP OS support library
        SYNOPSIS        OpenMP (Open Multi-Processing) is an application \
                        programming interface (API) that supports \
                        multi-platform shared memory multiprocessing \
                        programming in C and C++. Aarch64, IA32, x86_64 \
                        and PPC64 CPU-architectures are supported on VxWorks. \
                        OpenMP consists of a set of compiler directives, \
                        library routines, and environment variables that \
                        influence run-time behavior.
        PROTOTYPE       void ompInit (void);
        INIT_RTN        ompInit ();
        REQUIRES        INCLUDE_POSIX_PTHREADS INCLUDE_POSIX_PTHREAD_SCHEDULER
        HDR_FILES       omp.h
}

Component INCLUDE_OMP_LIB {
        NAME            OpenMP downloadable module support
        SYNOPSIS        This component ensure that the symbols required \
                        to support OpenMP application packaged as DKMs \
                        are included in the kernel. This component is not \
                        required for OpenMP support in kernel or RTPs.
        REQUIRES        INCLUDE_OPENMP
        LINK_SYMS       __kmpc_fork_call __kmpc_for_static_init_4 \
                        omp_set_num_threads omp_get_num_threads \
                        omp_get_max_threads omp_get_thread_num \
                        omp_get_num_procs omp_in_parallel omp_set_dynamic \
                        omp_get_dynamic omp_get_cancellation omp_set_nested \
                        omp_get_nested omp_set_schedule omp_get_schedule \
                        omp_get_thread_limit omp_get_supported_active_levels \
                        omp_set_max_active_levels omp_get_max_active_levels \
                        omp_get_level omp_get_ancestor_thread_num \
                        omp_get_team_size omp_get_active_level omp_in_final \
                        omp_get_proc_bind omp_get_num_places \
                        omp_get_place_num_procs omp_get_place_proc_ids \
                        omp_get_place_num omp_get_partition_num_places \
                        omp_get_partition_place_nums omp_set_affinity_format \
                        omp_get_affinity_format omp_display_affinity \
                        omp_capture_affinity omp_set_default_device \
                        omp_get_default_device omp_get_num_devices \
                        omp_get_device_num omp_get_num_teams omp_get_team_num \
                        omp_is_initial_device omp_get_initial_device \
                        omp_get_max_task_priority omp_pause_resource \
                        omp_pause_resource_all omp_init_lock \
                        omp_init_lock_with_hint omp_init_nest_lock_with_hint \
                        omp_destroy_lock omp_destroy_nest_lock \
                        omp_set_lock omp_set_nest_lock \
                        omp_unset_lock omp_unset_nest_lock \
                        omp_test_lock omp_test_nest_lock \
                        omp_get_wtime omp_get_wtick \
                        omp_init_allocator omp_destroy_allocator \
                        omp_set_default_allocator omp_get_default_allocator \
                        omp_alloc omp_free omp_control_tool
}
