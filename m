Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EFF10E22F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 12:49:32 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Mon, 12 Jun 2023 14:49:07 +0200
Message-Id: <20230612124916.7372-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 i-g-t 0/9] Introduce KUnit
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
        Starting subtest: drm_buddy_test
        [thread:23835] TAP version 1
        [thread:23835] Executing 6 tests in: drm_buddy
        Starting dynamic subtest: drm_buddy-drm_test_buddy_alloc_limit
        Dynamic subtest drm_buddy-drm_test_buddy_alloc_limit: SUCCESS (0.000s)
        Starting dynamic subtest: drm_buddy-drm_test_buddy_alloc_range
        Dynamic subtest drm_buddy-drm_test_buddy_alloc_range: SUCCESS (0.000s)
        Starting dynamic subtest: drm_buddy-drm_test_buddy_alloc_optimistic
        Dynamic subtest drm_buddy-drm_test_buddy_alloc_optimistic: SUCCESS (0.000s)
        Starting dynamic subtest: drm_buddy-drm_test_buddy_alloc_pessimistic
        Dynamic subtest drm_buddy-drm_test_buddy_alloc_pessimistic: SUCCESS (0.000s)
        Starting dynamic subtest: drm_buddy-drm_test_buddy_alloc_smoke
        Dynamic subtest drm_buddy-drm_test_buddy_alloc_smoke: SUCCESS (0.000s)
        Starting dynamic subtest: drm_buddy-drm_test_buddy_alloc_pathological
        Dynamic subtest drm_buddy-drm_test_buddy_alloc_pathological: SUCCESS (0.000s)
        Starting dynamic subtest: drm_buddy
        Dynamic subtest drm_buddy: SUCCESS (0.000s)
        Subtest drm_buddy_test: SUCCESS (0.182s)

The issue of possibility of too many sublevels occurrence is solved
by name concatenation.

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Dominik Karol Piatkowski (3):
  Change logic of ktap parser to run on a thread
  KUnit: Remove igt_kselftest fallback
  KUnit: Change subtest name from all-tests to module name

Isabella Basso (4):
  lib/igt_kmod: rename kselftest functions to ktest
  lib/igt_kmod.c: check if module is builtin before attempting to unload
    it
  lib/igt_kmod: add compatibility for KUnit
  tests: DRM selftests: switch to KUnit

Mauro Carvalho Chehab (2):
  kunit tests: add an optional name for the selftests
  tests/xe: Add a test that launches the xe driver live kunit tests

 lib/igt_kmod.c           | 142 ++++++++-
 lib/igt_kmod.h           |  14 +-
 lib/igt_ktap.c           | 615 +++++++++++++++++++++++++++++++++++++++
 lib/igt_ktap.h           |  50 ++++
 lib/meson.build          |   1 +
 tests/drm_buddy.c        |   2 +-
 tests/drm_mm.c           |  44 +--
 tests/kms_selftest.c     |  19 +-
 tests/meson.build        |   1 +
 tests/xe/xe_live_ktest.c |  52 ++++
 10 files changed, 899 insertions(+), 41 deletions(-)
 create mode 100644 lib/igt_ktap.c
 create mode 100644 lib/igt_ktap.h
 create mode 100644 tests/xe/xe_live_ktest.c

-- 
2.34.1


