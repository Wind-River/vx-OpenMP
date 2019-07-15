# Makefile - OpenMP VxWorks runtime library
#
# Copyright (c) 2019, Wind River Systems, Inc.
#
#//===----------------------------------------------------------------------===//
#//
#// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
#// See https://llvm.org/LICENSE.txt for license information.
#// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#//
#//===----------------------------------------------------------------------===//
#
# modification history
# --------------------
# 29apr19,kjn  create (F11802)

include $(WIND_KRNL_MK)/defs.layers.mk

SHARED_PUBLIC_H_DIRS = h
BUILD_DIRS = src

ifdef _WRS_CONFIG_RTP
BUILD_USER_DIRS = src
endif

POST_NOBUILD_CDFDIRS = cdf

include $(WIND_KRNL_MK)/rules.layers.mk
