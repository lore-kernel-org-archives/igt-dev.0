Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBBD10E5D0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:41:24 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E88FA580D2C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:41:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgn68-00AC0q-2m
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:41:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:41:14 +0200
Message-Id: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Make xe_compute test more generic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, xe_compute test runs only on an specific TGL PCI ID.
Make the test more generic, preparing to add support for more
platforms.

Mauro Carvalho Chehab (5):
  compute_square_kernel.cl: add CL file used at xe_compute.c
  xe/xe_compute: place OpenCL kernel on a separate file
  lib/xe/xe_compute: use registers defs from intel_gpu_commands.h
  gen_opencl_kernel: add script to dynamically create OpenCL kernels
  [RFC EXAMPLE] lib/xe/xe_compute_kernels.c: re-generate TGL binary

 lib/meson.build                    |    1 +
 lib/xe/xe_compute.c                |  236 ++--
 lib/xe/xe_compute.h                |   31 +-
 lib/xe/xe_compute_square_kernels.c | 1845 ++++++++++++++++++++++++++++
 opencl/README                      |   11 +
 opencl/compute_square_kernel.cl    |    5 +
 opencl/gen_opencl_kernel           |   86 ++
 tests/xe/xe_compute.c              |  108 +-
 8 files changed, 2129 insertions(+), 194 deletions(-)
 create mode 100644 lib/xe/xe_compute_square_kernels.c
 create mode 100644 opencl/README
 create mode 100644 opencl/compute_square_kernel.cl
 create mode 100755 opencl/gen_opencl_kernel

-- 
2.39.2
