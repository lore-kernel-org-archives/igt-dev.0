Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C6010E0A5
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 09:01:10 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 11:00:52 +0200
Message-Id: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/12] Extend intel_blt to work on Xe
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

Blitter library currently supports block-copy, ctrl-surf-copy
and fast-copy on i915. Lets extend this to xe as most of the
code is driver independent.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Zbigniew Kempczyński (12):
  lib/xe_query: Use vramN when returning string region name
  lib/xe_query: Add xe_region_class() helper
  lib/drmtest: Add get_intel_driver() helper
  lib/xe_util: Return dynamic subtest name for Xe
  lib/xe_util: Add vm bind/unbind helper for Xe
  lib/intel_allocator: Add field to distinct underlying driver
  lib/intel_allocator: Add intel_allocator_bind()
  lib/intel_ctx: Add xe context information
  lib/intel_blt: Introduce blt_copy_init() helper to cache driver
  lib/intel_blt: Extend blitter library to support xe driver
  tests/xe_ccs: Check if flatccs is working with block-copy for Xe
  tests/xe_exercise_blt: Check blitter library fast-copy for Xe

 lib/drmtest.c                  |  10 +
 lib/drmtest.h                  |   1 +
 lib/igt_fb.c                   |   2 +-
 lib/intel_allocator.c          | 162 +++++++
 lib/intel_allocator.h          |   6 +
 lib/intel_blt.c                | 293 +++++++++----
 lib/intel_blt.h                |  10 +-
 lib/intel_ctx.c                | 110 ++++-
 lib/intel_ctx.h                |  14 +
 lib/meson.build                |   3 +-
 lib/xe/xe_query.c              |  20 +-
 lib/xe/xe_query.h              |   1 +
 lib/xe/xe_util.c               | 237 ++++++++++
 lib/xe/xe_util.h               |  48 +++
 tests/i915/gem_ccs.c           |  34 +-
 tests/i915/gem_exercise_blt.c  |  22 +-
 tests/i915/gem_lmem_swapping.c |   4 +-
 tests/meson.build              |   2 +
 tests/xe/xe_ccs.c              | 763 +++++++++++++++++++++++++++++++++
 tests/xe/xe_exercise_blt.c     | 372 ++++++++++++++++
 20 files changed, 1992 insertions(+), 122 deletions(-)
 create mode 100644 lib/xe/xe_util.c
 create mode 100644 lib/xe/xe_util.h
 create mode 100644 tests/xe/xe_ccs.c
 create mode 100644 tests/xe/xe_exercise_blt.c

-- 
2.34.1
