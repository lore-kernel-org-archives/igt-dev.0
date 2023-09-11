Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B118D10E10C
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 06:03:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Sep 2023 08:03:36 +0200
Message-Id: <20230911060345.324372-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/9] Extend compute square to i915 and Xe
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

Even we already got gem|xe_gpgpu_fill we'd like to have a little
bit more complex compute test. Pipeline comes from reversing aub
dumped from hello.c square compute.

This series enables compute on TGL, DG2, ATS-M, PVC selectively 
for i915 and Xe.

v3: Addressing review comments, series is r-b apart of first patch.
    Get the results for both - i915 and xe.

Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Zbigniew Kempczyński (9):
  lib/intel_compute: Migrate xe_compute library to intel_compute
  lib/intel_compute: Add compatibility flags for running compute
  lib/intel_compute: Reorganize the code for i915 version preparation
  lib/intel_compute: Add name field for debugging purposes
  lib/intel_compute: Add i915 path in compute library
  intel/gem_compute: Add test which runs compute workload on i915
  lib/intel_compute: Add XeHP implementation of compute pipeline
  lib/intel_compute: Adding pvc compute pipeline implementation
  tests/gem|xe_compute: Update documentation regarding test requirements

 lib/intel_compute.c                      | 1157 ++++++++++++++++++++++
 lib/{xe/xe_compute.h => intel_compute.h} |   12 +-
 lib/intel_compute_square_kernels.c       |  166 ++++
 lib/meson.build                          |    4 +-
 lib/xe/xe_compute.c                      |  488 ---------
 lib/xe/xe_compute_square_kernels.c       |   71 --
 tests/intel/gem_compute.c                |   45 +
 tests/intel/xe_compute.c                 |    7 +-
 tests/meson.build                        |    1 +
 9 files changed, 1380 insertions(+), 571 deletions(-)
 create mode 100644 lib/intel_compute.c
 rename lib/{xe/xe_compute.h => intel_compute.h} (72%)
 create mode 100644 lib/intel_compute_square_kernels.c
 delete mode 100644 lib/xe/xe_compute.c
 delete mode 100644 lib/xe/xe_compute_square_kernels.c
 create mode 100644 tests/intel/gem_compute.c

-- 
2.34.1
