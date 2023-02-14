Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370F10E497
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:14 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 12:59:48 -0800
Message-Id: <20230214210007.2026033-12-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 11/30] i915/perf: Use a helper for OA format
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
 tests/i915/perf.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e9613dc9..a23438fc 100644
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
@@ -1951,7 +1957,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 		int ret, n_timer_reports = 0;
 		uint32_t matches = 0;
 		struct {
-			uint32_t report[64];
+			uint32_t report[format_size / 4];
 		} timer_reports[30];
 
 		igt_debug("testing OA exponent %d,"
@@ -2254,7 +2260,7 @@ test_blocking(uint64_t requested_oa_period,
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
+	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format());
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2417,7 +2423,7 @@ test_polling(uint64_t requested_oa_period,
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
+	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format());
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2691,7 +2697,7 @@ gen12_test_oa_tlb_invalidate(const struct intel_execution_engine2 *e)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -2734,7 +2740,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t fmt = oa_unit_default_format();
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -2754,11 +2760,11 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 		.properties_ptr = to_user_pointer(properties),
 	};
 	struct drm_i915_perf_record_header *header;
-	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
+	size_t report_size = get_oa_format(fmt).size;
+	int buf_size = 65536 * (report_size + sizeof(struct drm_i915_perf_record_header));
 	uint8_t *buf = malloc(buf_size);
 	int len;
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	size_t report_size = get_oa_format(fmt).size;
 	int n_full_oa_reports = oa_buf_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 
@@ -2770,7 +2776,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 		bool overflow_seen;
 		uint32_t n_periodic_reports;
 		uint32_t first_timestamp = 0, last_timestamp = 0;
-		uint32_t last_periodic_report[64];
+		uint32_t last_periodic_report[report_size / 4];
 
 		do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
 
@@ -2970,7 +2976,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t fmt = oa_unit_default_format();
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -2990,10 +2996,10 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 				  (ARRAY_SIZE(properties) / 2) - 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
+	size_t report_size = get_oa_format(fmt).size;
+	int buf_size = 65536 * (report_size + sizeof(struct drm_i915_perf_record_header));
 	uint8_t *buf = malloc(buf_size);
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	size_t report_size = get_oa_format(fmt).size;
 	int n_full_oa_reports = oa_buf_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 
@@ -3007,7 +3013,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 		uint32_t n_periodic_reports;
 		struct drm_i915_perf_record_header *header;
 		uint64_t first_timestamp = 0, last_timestamp = 0;
-		uint32_t last_periodic_report[64];
+		uint32_t last_periodic_report[report_size / 4];
 
 		/* Giving enough time for an overflow might help catch whether
 		 * the OA unit has been enabled even if the driver might at
@@ -4565,7 +4571,7 @@ test_stress_open_close(const struct intel_execution_engine2 *e)
 
 			/* OA unit configuration */
 			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+			DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 			DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 			DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -4668,7 +4674,7 @@ test_global_sseu_config_invalid(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
@@ -4757,7 +4763,7 @@ test_global_sseu_config(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
-- 
2.36.1
