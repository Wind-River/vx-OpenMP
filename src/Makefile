# Makefile - OpenMP VxWorks runtime library
#
# modification history
# --------------------
# 29apr19,kjn  create (F11802)
#

LIB_BASE_NAME = omp

ifeq ($(SPACE), user)
LIB_FORMAT = static
include $(WIND_USR_MK)/defs.library.mk
else
include $(WIND_KRNL_MK)/defs.library.mk
endif

DOC_FILES =

EXTRA_INCLUDE += -I$(CURDIR)/thirdparty/ittnotify -I$(CURDIR)/__vx

OBJS  = ittnotify_static.o z_Linux_asm.o \
        kmp_alloc.o kmp_atomic.o kmp_csupport.o kmp_debug.o kmp_itt.o \
        kmp_environment.o kmp_error.o kmp_global.o kmp_i18n.o kmp_io.o \
        kmp_runtime.o kmp_settings.o kmp_str.o kmp_tasking.o kmp_taskq.o \
        kmp_threadprivate.o kmp_utility.o kmp_barrier.o kmp_wait_release.o \
        kmp_affinity.o kmp_dispatch.o kmp_lock.o kmp_sched.o z_Linux_util.o \
        kmp_gsupport.o kmp_taskdeps.o kmp_cancel.o kmp_ftn_cdecl.o \
        kmp_ftn_extra.o kmp_version.o

ifdef _WRS_CONFIG_ARCH_ppc
OBJS += vxPpcAtomic.o
endif

ifeq ($(SPACE), user)
include $(WIND_USR_MK)/rules.library.mk
else
include $(WIND_KRNL_MK)/rules.library.mk
endif

#
# this code is 3rd party. Suppress all compiler warnings
#
CC_WARNINGS = $(CC_WARNINGS_NONE)
C++_WARNINGS = $(CC_WARNINGS_NONE)
