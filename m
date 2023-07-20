Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99B410E1C4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:02 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:36 -0700
Message-ID: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/20] Extend i915/perf for testing Xe OA
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

* Share i915 perf code between i915 and Xe.
* A few shortcuts, but hopefully sufficient for testing initial Xe OA
  patches.

Ashutosh Dixit (20):
  drm-uapi/xe_drm: OA changes
  lib/xe/xe_query: Add xe_gts interface
  lib/i915/perf: Add xe_perf_for_fd
  lib/i915/perf: Derive topology info for xe devices
  tests/i915/perf: Track variables across i915 and xe
  tests/i915/perf: Skip not ready tests for xe
  tests/i915/perf: Fix i915_perf_revision for use with xe
  tests/i915/perf: Fix sysfs functions for xe
  tests/i915/perf: Fix test_i915_ref_count for xe
  tests/i915/perf: Support only default_engine_group for xe
  tests/i915/perf: Only iterate over render engines for xe
  tests/i915/perf: Don't load module
  tests/i915/perf: Move test_sysctl_defaults after the fixture
  tests/i915/perf: Fix has_class_instance for xe
  tests/i915/perf: Temporarily skip render_copy for xe
  tests/i915/perf: Skip intel_ctx_create_all_physical for xe
  tests/i915/perf: Skip __for_each_render_engine for xe
  tests/i915/perf: Fix buf_map for xe
  tests/i915/perf: Use engine_id in gen12_test_mi_rpc for xe
  HAX: Add OA tests to xe-fast-feedback.testlist

 include/drm-uapi/xe_drm.h                | 295 ++++++++++++++++++++++-
 lib/i915/perf.c                          | 170 ++++++++++++-
 lib/i915/perf.h                          |   1 +
 lib/meson.build                          |   2 +-
 lib/xe/xe_query.c                        |   8 +
 lib/xe/xe_query.h                        |   1 +
 tests/i915/perf.c                        | 234 ++++++++++++------
 tests/intel-ci/xe-fast-feedback.testlist |  43 ++++
 tests/intel-ci/xe.blocklist.txt          |   1 -
 9 files changed, 665 insertions(+), 90 deletions(-)

-- 
2.41.0
