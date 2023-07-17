Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Mon, 17 Jul 2023 17:53:18 +0100
Message-Id: <20230717165318.831766-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_rps: Fix test after silent
 conflict
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A silent conflict sneaked in as I was merging
d86ca7e17b58 ("tests/i915_pm_rps: Exercise sysfs thresholds") in a way
that igt_sysfs_set_u32 has became a function returning void.

Assert is now built-in so drop it from the test.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: d86ca7e17b58 ("tests/i915_pm_rps: Exercise sysfs thresholds")
Reference: 54dc25efaf10 ("lib/igt_sysfs: add asserting helpers for read/write operations")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/i915_pm_rps.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index 68bb99d62c19..6bebecb6bf59 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -1010,8 +1010,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
 	igt_require(def_up && def_down);
 
 	/* Check invalid percentages are rejected */
-	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", 101), false);
-	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", 101), false);
+	igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", 101);
+	igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", 101);
 
 	/*
 	 * Invent some random up-down thresholds, but always include 0 and 100
@@ -1034,8 +1034,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
 	/* Exercise the thresholds with a GPU load to trigger park/unpark etc */
 	for (i = 0; i < points; i++) {
 		igt_info("Testing thresholds up %u%% and down %u%%...\n", ta[i], tb[i]);
-		igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", ta[i]), true);
-		igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", tb[i]), true);
+		igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", ta[i]);
+		igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", tb[i]);
 
 		if (flags & TEST_IDLE) {
 			gem_quiescent_gpu(i915);
@@ -1069,8 +1069,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
 	gem_quiescent_gpu(i915);
 
 	/* Restore defaults */
-	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", def_up), true);
-	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", def_down), true);
+	igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", def_up);
+	igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", def_down);
 
 	free(ta);
 	free(tb);
-- 
2.39.2
