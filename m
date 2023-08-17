Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4E610E05B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:45 +0200
Message-Id: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] Extend compute square to i915 and Xe
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

This series enables compute on TGL, DG2, ATS-M for both i915 and Xe.
I've noticed first run on DG2 Xe causes hang whether next run is fine.
On ATS-M there's hang for each binary run. This was main reason I've
added i915 version for compare - I don't observe such hangs there.

Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Zbigniew Kempczyński (7):
  lib/intel_compute: Migrate xe_compute library to intel_compute
  lib/intel_compute: Reorganize the code for i915 version preparation
  lib/intel_compute: Add name field for debugging purposes
  lib/intel_compute: Add i915 path in compute library
  i915/gem_compute: Add test which runs compute workload on i915
  lib/intel_compute: Add XeHP implementation of compute pipeline
  tests/gem|xe_compute: Update documentation regarding test requirements

 lib/intel_compute.c                           | 924 ++++++++++++++++++
 lib/{xe/xe_compute.h => intel_compute.h}      |  12 +-
 ...rnels.c => intel_compute_square_kernels.c} |  60 +-
 lib/meson.build                               |   4 +-
 lib/xe/xe_compute.c                           | 488 ---------
 tests/i915/gem_compute.c                      |  45 +
 tests/meson.build                             |   1 +
 tests/xe/xe_compute.c                         |   7 +-
 8 files changed, 1039 insertions(+), 502 deletions(-)
 create mode 100644 lib/intel_compute.c
 rename lib/{xe/xe_compute.h => intel_compute.h} (74%)
 rename lib/{xe/xe_compute_square_kernels.c => intel_compute_square_kernels.c} (50%)
 delete mode 100644 lib/xe/xe_compute.c
 create mode 100644 tests/i915/gem_compute.c

-- 
2.34.1
