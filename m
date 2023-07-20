Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5EC10E607
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:03 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:42 -0700
Message-ID: <20230720231756.3464641-7-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/20] tests/i915/perf: Skip not ready tests
 for xe
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

SSEU config feature is not ready in the xe driver. The other tests need
more work in IGT to port to xe. Skip these till they are ready.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 6ab371857847..9fb11f9e0730 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -6147,12 +6147,14 @@ igt_main
 		 */
 		igt_describe("Verify exclusivity of perf streams with sample oa option");
 		igt_subtest("gen12-group-exclusive-stream-sample-oa") {
+			igt_require(!is_xe_device(drm_fd));
 			igt_require(intel_gen(devid) >= 12);
 			test_group_exclusive_stream(ctx, true);
 		}
 
 		igt_describe("Verify exclusivity of perf streams with ctx handle");
 		igt_subtest("gen12-group-exclusive-stream-ctx-handle") {
+			igt_require(!is_xe_device(drm_fd));
 			igt_require(intel_gen(devid) >= 12);
 			test_group_exclusive_stream(ctx, false);
 		}
@@ -6177,14 +6179,18 @@ igt_main
 		}
 
 		igt_describe("Verify invalid SSEU opening parameters");
-		igt_subtest_with_dynamic("global-sseu-config-invalid")
+		igt_subtest_with_dynamic("global-sseu-config-invalid") {
+			igt_require(!is_xe_device(drm_fd));
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config_invalid(ctx, e);
+		}
 
 		igt_describe("Verify specifying SSEU opening parameters");
-		igt_subtest_with_dynamic("global-sseu-config")
+		igt_subtest_with_dynamic("global-sseu-config") {
+			igt_require(!is_xe_device(drm_fd));
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config(ctx, e);
+		}
 	}
 
 	igt_subtest("invalid-create-userspace-config")
-- 
2.41.0
