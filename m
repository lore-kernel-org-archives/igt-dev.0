Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F55AF1E3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 06:31:45 +0000 (UTC)
From: Karthikeya Sunkesula <karthikeya.sunkesula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 12:01:55 +0530
Message-Id: <20220823063155.1309939-2-karthikeya.sunkesula@intel.com>
In-Reply-To: <20220823063155.1309939-1-karthikeya.sunkesula@intel.com>
References: <20220823063155.1309939-1-karthikeya.sunkesula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] i915/pm:Add descriptions to pm tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: karthikeya.sunkesula@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Karthikeya Sunkesula <karthikeya.sunkesula@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c |  8 ++++++++
 tests/i915/i915_pm_rps.c           | 13 +++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cf7a92b9..325fed64 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -57,6 +57,8 @@ struct residencies {
 	int duration;
 };
 
+IGT_TEST_DESCRIPTION("Tests to verify rc6 residency in different cases");
+
 static unsigned long get_rc6_enabled_mask(void)
 {
 	unsigned long enabled;
@@ -541,6 +543,8 @@ igt_main
 		ctx = intel_ctx_create_all_physical(i915);
 	}
 
+	igt_describe("Measure rc6 residency and energy, when GPU is idle, "
+			"with light workload and with waitboost.");
 	igt_subtest_with_dynamic("rc6-idle") {
 		const struct intel_execution_engine2 *e;
 
@@ -555,6 +559,8 @@ igt_main
 		}
 	}
 
+	igt_describe("Measure rc6 residency for a request held-up by external "
+			"fence and verify power conservation while waiting.");
 	igt_subtest("rc6-fence") {
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
@@ -580,6 +586,7 @@ igt_main
 			igt_require(rc6_enabled & RC6_ENABLED);
 		}
 
+		igt_describe("Measure rc6 residency per gt  when it is idle.");
 		igt_subtest("rc6-accuracy") {
 			struct residencies res;
 
@@ -587,6 +594,7 @@ igt_main
 			residency_accuracy(res.rc6, res.duration, "rc6");
 		}
 
+		igt_describe("Measure media rc6 residency per gt when it is idle.");
 		igt_subtest("media-rc6-accuracy") {
 			struct residencies res;
 
diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index db39ec69..563af4b1 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -914,6 +914,8 @@ igt_main
 		igt_install_exit_handler(pm_rps_exit_handler);
 	}
 
+	igt_describe("Verify the rps sysfs constraints, by varying min, max gt frequencies "
+			"with RPn, RP0 and mid values with valid and invalid cases.");
 	igt_subtest("basic-api") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
@@ -921,6 +923,8 @@ igt_main
 	}
 
 	/* Verify the constraints, check if we can reach idle */
+	igt_describe("Verify the constraints and verify current frequency settles down to "
+			"RPn or min within the allotted time after a low workload is run.");
 	igt_subtest("min-max-config-idle") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
@@ -928,6 +932,8 @@ igt_main
 	}
 
 	/* Verify the constraints with high load, check if we can reach max */
+	igt_describe("Verify the constraints and with a high workload, verify current "
+			"frequency scales upto RP0 or max within the allotted time.");
 	igt_subtest("min-max-config-loaded") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
@@ -937,20 +943,22 @@ igt_main
 	}
 
 	/* Checks if we achieve boost using gem_wait */
+	igt_describe("Verify current frequency bumps to boost frequency with workload "
+			"with waitboost scenario.");
 	igt_subtest("waitboost") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		waitboost(drm_fd, false);
 	}
 
-	igt_describe("Check if the order of fences does not affect waitboosting");
+	igt_describe("Verify if the order of fences does not affect waitboosting");
 	igt_subtest("fence-order") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		fence_order(drm_fd);
 	}
 
-	igt_describe("Check if context reuse does not affect waitboosting");
+	igt_describe("Verify if context reuse does not affect waitboosting");
 	igt_subtest("engine-order") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
@@ -958,6 +966,7 @@ igt_main
 	}
 
 	/* Test boost frequency after GPU reset */
+	igt_describe("Verify waitboost after GPU reset");
 	igt_subtest("reset") {
 		igt_hang_t hang;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-- 
2.25.1
