Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C877010EAB2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 08:15:57 +0000 (UTC)
From: Karthikeya Sunkesula <karthikeya.sunkesula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Sep 2022 13:47:03 +0530
Message-Id: <20220915081704.3039599-2-karthikeya.sunkesula@intel.com>
In-Reply-To: <20220915081704.3039599-1-karthikeya.sunkesula@intel.com>
References: <20220915081704.3039599-1-karthikeya.sunkesula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] Add descriptions to pm rc6 residency
 tests
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
 tests/i915/i915_pm_rc6_residency.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cf7a92b9..f8cf4325 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -57,6 +57,8 @@ struct residencies {
 	int duration;
 };
 
+IGT_TEST_DESCRIPTION("Tests to verify rc6 in different cases");
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
 
-- 
2.25.1
