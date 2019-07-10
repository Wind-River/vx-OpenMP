# VxWorks® 7 OpenMP 5.0

## Overview

This layer contains a VxWorks port of the LLVM OpenMP library project
found here

	[https://github.com/llvm-mirror/openmp]
 
All CPU-architectures supported by VxWorks can use OpenMP.

## Project License

Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
See https://llvm.org/LICENSE.txt for license information.
SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

## Prerequisite

* Wind River® VxWorks® 7 operating system version SR0620.

## Installation

1. Download the **VxWorks 7 OpenMP 5.0** layer into VxWorks 7 from the 
following location:  

   git clone https://github.com/Wind-River/vx-OpenMP openmp

2. Confirm that the layer is present in your VxWorks 7 installation.

   cd $WIND_BASE/pkgs_v2/app/

## How to use

The layer is named `OPENMP` and it is not included into VSBs by
default. OpenMP can be included in the build like this

	$ cd <VSB_DIR>
	$ vxprj vsb add OPENMP

The component `INCLUDE_OPENMP` must be added to any VIP that want to
use OpenMP. OpenMP can be used both in kernel tasks and RTPs. 

The component `INCLUDE_OMP_LIB` ensure that the symbols required to 
support OpenMP application packaged as DKMs are included in the kernel. 
This component is not required for OpenMP support in kernel or RTPs.

The recommended use is within RTPs as the exection model in VxWorks
kernel tasks is a bit different than what OpenMP applications usually
see. One artifact of using OpenMP in the kernel is that worker tasks
named `tOpenMPx` where x is 1 to the number of online CPU-threads for
the VxWorks target.

The worker tasks are idle if nothing inside the kernel currently using
OpenMP, so the tasks only consume some RAM while idle.

The worker tasks spawned in an RTP is removed when the RTP calls
`exit()`.

For more VxWorks project configuration and usage information of **OpenMP** , 
please refer to [VxWorks 7 Third-Party Software Support](https://docs.windriver.com/bundle/vxworks_7_third_party_software_support_sr0620/page/wgj1559160429944.html) 

## Legal Notices

All product names, logos, and brands are property of their respective owners. 
All company, product and service names used in this software are for 
identification purposes only. Wind River and VxWorks are registered trademarks 
of Wind River Systems, Inc. UNIX is a registered trademark of The Open Group.

Disclaimer of Warranty / No Support: 
Wind River does not provide support and maintenance services for this software, 
under Wind River’s standard Software Support and Maintenance Agreement or otherwise. 
Unless required by applicable law, Wind River provides the software (and each 
contributor provides its contribution) on an “AS IS” BASIS, WITHOUT WARRANTIES OF 
ANY KIND, either express or implied, including, without limitation, any warranties 
of TITLE, NONINFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. 
You are solely responsible for determining the appropriateness of using or 
redistributing the software and assume any risks associated with your exercise 
of permissions under the license.


