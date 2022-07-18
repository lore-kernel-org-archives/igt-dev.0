Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D501125D9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 22:32:13 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Jul 2022 15:32:05 -0700
Message-Id: <20220718223205.1629532-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/perf/i915_ref_count: Skip on
 __drm_open_driver failure
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

Skip early on __drm_open_driver() to generate a consistent failure
signature for CI (rather than a follow-on igt_assert(is_i915_device(fd))).

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e641d5d2db7e..5502a3fb4e59 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4838,6 +4838,7 @@ test_i915_ref_count(void)
 	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
 
 	drm_fd = __drm_open_driver(DRIVER_INTEL);
+	igt_require_intel(drm_fd);
 	devid = intel_get_drm_devid(drm_fd);
 	sysfs = igt_sysfs_open(drm_fd);
 
-- 
2.34.1
