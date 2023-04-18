Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10C410E69C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 07:25:42 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 09:25:25 +0200
Message-Id: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/10] Integrate intel-bb with Xe
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

Series touches intel-bb + intel-buf which are rendercopy, gpgpu fill and
media fill facilities. Exercise both paths on CI (i915 and xe) to check
there's no regression in common part.

v2: fix allocator issue

Zbigniew Kempczyński (10):
  lib/xe_ioctl: Add missing header for direct resolving
  lib/xe_query: Add region helpers and missing doc
  lib/xe_query: Remove commented out function prototype
  lib/intel_allocator: Add allocator support for Xe
  lib/intel_bufops: Add Xe support in bufops
  lib/intel_batchbuffer: Add Xe support in intel-bb
  tests/xe_intel_bb: Check if intel-bb Xe support correctness
  tests/xe-fast-feedback: Add xe_intel_bb test to BAT
  lib/gpgpu_fill: Use RENDER engine flag to work on Xe
  tests/xe_gpgpu_fill: Exercise gpgpu fill on Xe

 lib/gpgpu_fill.c                         |    4 +-
 lib/gpu_cmds.c                           |    2 +-
 lib/intel_allocator.c                    |   49 +-
 lib/intel_aux_pgtable.c                  |    2 +-
 lib/intel_batchbuffer.c                  |  430 ++++++--
 lib/intel_batchbuffer.h                  |   28 +-
 lib/intel_bufops.c                       |   73 +-
 lib/intel_bufops.h                       |   13 +-
 lib/xe/xe_ioctl.h                        |    1 +
 lib/xe/xe_query.c                        |   45 +
 lib/xe/xe_query.h                        |    3 +-
 tests/i915/gem_caching.c                 |    4 +-
 tests/i915/gem_pxp.c                     |    2 +-
 tests/intel-ci/xe-fast-feedback.testlist |   19 +
 tests/meson.build                        |    2 +
 tests/xe/xe_gpgpu_fill.c                 |  133 +++
 tests/xe/xe_intel_bb.c                   | 1181 ++++++++++++++++++++++
 17 files changed, 1850 insertions(+), 141 deletions(-)
 create mode 100644 tests/xe/xe_gpgpu_fill.c
 create mode 100644 tests/xe/xe_intel_bb.c

-- 
2.34.1
