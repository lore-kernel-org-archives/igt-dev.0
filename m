Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DB410EB85
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:44 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:28 -0700
Message-Id: <20230323225534.3739835-25-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 24/30] i915/perf: Run non-zero-reason on
 media engines as well
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

Enable non-zero-reason test to run on media engines as well.

v2: Check if new params are available before passing (CI failure)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/perf.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e72704b5..02d0f232 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2895,26 +2895,33 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 }
 
 static void
-test_non_zero_reason(void)
+test_non_zero_reason(const struct intel_execution_engine2 *e)
 {
 	/* ~20 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+	struct intel_perf_metric_set *test_set = metric_set(e);
+	uint64_t fmt = test_set->perf_oa_format;
+	size_t report_size = get_oa_format(fmt).size;
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
+		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = ARRAY_SIZE(properties) / 2,
+		.num_properties = has_param_class_instance() ?
+				  ARRAY_SIZE(properties) / 2 :
+				  (ARRAY_SIZE(properties) / 2) - 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	struct drm_i915_perf_record_header *header;
-	uint32_t buf_size = 3 * 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
+	uint32_t buf_size = 3 * 65536 * (report_size + sizeof(struct drm_i915_perf_record_header));
 	uint8_t *buf = malloc(buf_size);
 	uint32_t total_len = 0, reports_lost;
 	const uint32_t *last_report;
@@ -2959,10 +2966,9 @@ test_non_zero_reason(void)
 
 			igt_assert_neq(reason, 0);
 
-			if (last_report) {
-				sanity_check_reports(last_report, report,
-						     default_test_set->perf_oa_format);
-			}
+			if (last_report)
+				sanity_check_reports(last_report, report, fmt);
+
 			last_report = report;
 			break;
 		}
@@ -5789,10 +5795,11 @@ igt_main
 			test_buffer_fill(e);
 
 	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
-	igt_subtest("non-zero-reason") {
+	igt_subtest_with_dynamic("non-zero-reason") {
 		/* Reason field is only available on Gen8+ */
 		igt_require(intel_gen(devid) >= 8);
-		test_non_zero_reason();
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
+			test_non_zero_reason(e);
 	}
 
 	igt_subtest("disabled-read-error")
-- 
2.36.1
