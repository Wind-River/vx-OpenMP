# Makefile - OpenMP VxWorks runtime library
#
# Copyright 2019 Wind River Systems, Inc.
#
# The right to copy, distribute, modify or otherwise make use
# of this software may be licensed only pursuant to the terms
# of an applicable Wind River license agreement.
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
