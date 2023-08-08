Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E342B10E152
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:14 -0700
Message-ID: <20230808010017.37819-18-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 17/20] tests/i915/perf: Skip
 __for_each_render_engine for xe
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

__for_each_render_engine uses for_each_physical_engine which is only
available for i915. It is sufficient to directly pass a render engine into
the test function for xe.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index bfe4dd6ee533..27408e7909f5 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -6153,8 +6153,14 @@ igt_main
 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
 		igt_subtest_with_dynamic("gen12-mi-rpc") {
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
-			__for_each_render_engine(drm_fd, e)
-				gen12_test_mi_rpc(e);
+			if (is_xe_device(drm_fd)) {
+				const struct intel_execution_engine2 e2 = {};
+				igt_dynamic_f("%s", "rcs")
+					gen12_test_mi_rpc(&e2);
+			} else {
+				__for_each_render_engine(drm_fd, e)
+					gen12_test_mi_rpc(e);
+			}
 		}
 
 		igt_describe("Test OA TLB invalidate");
@@ -6166,8 +6172,14 @@ igt_main
 		igt_subtest_with_dynamic("gen12-unprivileged-single-ctx-counters") {
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			igt_require_f(render_copy, "no render-copy function\n");
-			__for_each_render_engine(drm_fd, e)
-				gen12_test_single_ctx_render_target_writes_a_counter(e);
+			if (is_xe_device(drm_fd)) {
+				const struct intel_execution_engine2 e2 = {};
+				igt_dynamic_f("%s", "rcs")
+					gen12_test_single_ctx_render_target_writes_a_counter(&e2);
+			} else {
+				__for_each_render_engine(drm_fd, e)
+					gen12_test_single_ctx_render_target_writes_a_counter(e);
+			}
 		}
 	}
 
-- 
2.41.0
