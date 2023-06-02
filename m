Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24CB10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 08:27:36 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Fri,  2 Jun 2023 10:27:15 +0200
Message-Id: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 i-g-t 0/6] Introduce KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This series is a continuation of Isabella's work on introducing
KUnit to IGT.

Sample drm_buddy output:
[thread:13223] TAP version 1
[thread:13223] Executing 6 tests in: drm_buddy
Starting subtest: drm_buddy__drm_test_buddy_alloc_limit
Subtest drm_buddy__drm_test_buddy_alloc_limit: SUCCESS (0.000s)
Starting subtest: drm_buddy__drm_test_buddy_alloc_range
Subtest drm_buddy__drm_test_buddy_alloc_range: SUCCESS (0.000s)
Starting subtest: drm_buddy__drm_test_buddy_alloc_optimistic
Subtest drm_buddy__drm_test_buddy_alloc_optimistic: SUCCESS (0.000s)
Starting subtest: drm_buddy__drm_test_buddy_alloc_pessimistic
Subtest drm_buddy__drm_test_buddy_alloc_pessimistic: SUCCESS (0.000s)
Starting subtest: drm_buddy__drm_test_buddy_alloc_smoke
Subtest drm_buddy__drm_test_buddy_alloc_smoke: SUCCESS (0.000s)
Starting subtest: drm_buddy__drm_test_buddy_alloc_pathological
Subtest drm_buddy__drm_test_buddy_alloc_pathological: SUCCESS (0.000s)
Starting subtest: drm_buddy
Subtest drm_buddy: SUCCESS (0.000s)

The issue of possibility of too many sublevels occurrence is solved
by name concatenation.

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Dominik Karol Piatkowski (2):
  Change logic of ktap parser to run on a thread
  Fix drm_mm build error

Isabella Basso (4):
  lib/igt_kmod: rename kselftest functions to ktest
  lib/igt_kmod.c: check if module is builtin before attempting to unload
    it
  lib/igt_kmod: add compatibility for KUnit
  tests: DRM selftests: switch to KUnit

 lib/igt_kmod.c                   | 133 ++++++-
 lib/igt_kmod.h                   |  14 +-
 lib/igt_ktap.c                   | 615 +++++++++++++++++++++++++++++++
 lib/igt_ktap.h                   |  50 +++
 lib/meson.build                  |   1 +
 tests/drm_buddy.c                |   4 +-
 tests/drm_mm.c                   |   4 +-
 tests/i915/i915_test_config.json |   2 +-
 tests/kms_selftest.c             |   8 +
 9 files changed, 811 insertions(+), 20 deletions(-)
 create mode 100644 lib/igt_ktap.c
 create mode 100644 lib/igt_ktap.h

-- 
2.34.1


