Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E0F10EA02
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:46:55 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:29 -0800
Message-Id: <20230215004648.2100655-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/31] i915/perf: Use a helper for OA format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Refactor and use a helper for OA format

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index add41f7d..90c78929 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -670,6 +670,12 @@ oar_unit_default_format(void)
 	return test_set->perf_oa_format;
 }
 
+static int
+oa_unit_default_format(void)
+{
+	return test_set->perf_oa_format;
+}
+
 /*
  * Temporary wrapper to distinguish mappings on !llc platforms,
  * where it seems cache over GEM_MMAP_OFFSET is not flushed before execution.
@@ -1913,7 +1919,7 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
 static void
 test_oa_exponents(const struct intel_execution_engine2 *e)
 {
-	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t fmt = oa_unit_default_format();
 
 	load_helper_init();
 	load_helper_run(HIGH);
@@ -2256,7 +2262,7 @@ test_blocking(uint64_t requested_oa_period,
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
+	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format());
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2419,7 +2425,7 @@ test_polling(uint64_t requested_oa_period,
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
+	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format());
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2693,7 +2699,7 @@ gen12_test_oa_tlb_invalidate(const struct intel_execution_engine2 *e)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -2736,7 +2742,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t fmt = oa_unit_default_format();
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -2972,7 +2978,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t fmt = oa_unit_default_format();
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -4567,7 +4573,7 @@ test_stress_open_close(const struct intel_execution_engine2 *e)
 
 			/* OA unit configuration */
 			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+			DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 			DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 			DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -4670,7 +4676,7 @@ test_global_sseu_config_invalid(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
@@ -4759,7 +4765,7 @@ test_global_sseu_config(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
-- 
2.36.1
