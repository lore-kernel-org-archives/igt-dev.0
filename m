Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B20810EAB6
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 08:16:01 +0000 (UTC)
From: Karthikeya Sunkesula <karthikeya.sunkesula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Sep 2022 13:47:04 +0530
Message-Id: <20220915081704.3039599-3-karthikeya.sunkesula@intel.com>
In-Reply-To: <20220915081704.3039599-1-karthikeya.sunkesula@intel.com>
References: <20220915081704.3039599-1-karthikeya.sunkesula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] Add descriptions to pm rps tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com,
 Karthikeya Sunkesula <karthikeya.sunkesula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Karthikeya Sunkesula <karthikeya.sunkesula@intel.com>
---
 tests/i915/i915_pm_rps.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index db39ec69..44228b44 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -914,12 +914,16 @@ igt_main
 		igt_install_exit_handler(pm_rps_exit_handler);
 	}
 
+	igt_describe("Verify the rps sysfs constraints, by varying min, max gt frequencies "
+			"with RPn, RP0 and mid values with valid and invalid cases.");
 	igt_subtest("basic-api") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		min_max_config(basic_check, false);
 	}
 
+	igt_describe("Verify the constraints and verify current frequency settles down to "
+			"RPn or min within the allotted time after a low workload is run.");
 	/* Verify the constraints, check if we can reach idle */
 	igt_subtest("min-max-config-idle") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
@@ -927,6 +931,8 @@ igt_main
 		min_max_config(idle_check, true);
 	}
 
+	igt_describe("Verify the constraints and with a high workload, verify current "
+			"frequency scales upto RP0 or max within the allotted time.");
 	/* Verify the constraints with high load, check if we can reach max */
 	igt_subtest("min-max-config-loaded") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
@@ -937,6 +943,8 @@ igt_main
 	}
 
 	/* Checks if we achieve boost using gem_wait */
+	igt_describe("Verify actual frequency bumps to boost frequency with workload "
+			"with waitboost scenario.");
 	igt_subtest("waitboost") {
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
