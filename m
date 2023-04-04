Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3D210E17D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 07:38:41 +0000 (UTC)
Received: from linux.intel.com (daanders-mobl1.ger.corp.intel.com
 [10.252.28.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D9B75580D5D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 00:38:38 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjbFU-000rTH-2A
 for igt-dev@lists.freedesktop.org; Tue, 04 Apr 2023 09:38:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 09:38:31 +0200
Message-Id: <20230404073835.205323-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] Make xe_compute test more generic
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

---

v2:
  - removed the RFC example patch:
	https://patchwork.freedesktop.org/patch/528910/?series=115670&rev=1
    (no need to re-send, as this is just an example that won't be
     merged)
  - run_xe_compute_kernel() now returns true if suceeded, false
    otherwise;
  - opencl/gen_opencl_kernel is now compatible with legacy versions
    of xxd;
  - added some notes at opencl/README about Intel compute mode
    versions.

Mauro Carvalho Chehab (4):
  compute_square_kernel.cl: add CL file used at xe_compute.c
  xe/xe_compute: place OpenCL kernel on a separate file
  lib/xe/xe_compute: use registers defs from intel_gpu_commands.h
  gen_opencl_kernel: add script to dynamically create OpenCL kernels

 lib/meson.build                    |   1 +
 lib/xe/xe_compute.c                | 236 +++++++++++++++++++----------
 lib/xe/xe_compute.h                |  31 ++--
 lib/xe/xe_compute_square_kernels.c |  71 +++++++++
 opencl/README                      |  30 ++++
 opencl/compute_square_kernel.cl    |   5 +
 opencl/gen_opencl_kernel           | 103 +++++++++++++
 tests/xe/xe_compute.c              | 108 +------------
 8 files changed, 391 insertions(+), 194 deletions(-)
 create mode 100644 lib/xe/xe_compute_square_kernels.c
 create mode 100644 opencl/README
 create mode 100644 opencl/compute_square_kernel.cl
 create mode 100755 opencl/gen_opencl_kernel

-- 
2.39.2
