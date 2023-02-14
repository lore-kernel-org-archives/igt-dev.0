Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B2310E9A6
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:16 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 12:59:59 -0800
Message-Id: <20230214210007.2026033-23-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 22/30] i915/perf: Add support for engine specific
 metrics
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

Metrics config is different for media vs render engines. Choose the metrics
configurations as per the engine used for the test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 236 ++++++++++++++++++++++++++--------------------
 1 file changed, 136 insertions(+), 100 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index f5d0726b..02835602 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -278,7 +278,6 @@ static uint32_t num_perf_oa_groups;
 
 static uint64_t gt_max_freq_mhz = 0;
 static struct intel_perf *intel_perf = NULL;
-static struct intel_perf_metric_set *test_set = NULL;
 static bool *undefined_a_counters;
 static uint64_t oa_exp_1_millisec;
 
@@ -289,6 +288,10 @@ static void (*sanity_check_reports)(const uint32_t *oa_report0,
 				    const uint32_t *oa_report1,
 				    enum drm_i915_oa_format format);
 
+
+static struct intel_perf_metric_set *metric_set(const struct intel_execution_engine2 *e2);
+#define default_test_set metric_set(&default_e2)
+
 static void
 dump_report(const uint32_t *report, uint32_t size, const char *message) {
 	uint32_t i;
@@ -691,17 +694,7 @@ oar_unit_default_format(void)
 	if (IS_DG2(devid) || IS_METEORLAKE(devid))
 		return I915_OAR_FORMAT_A32u40_A4u32_B8_C8;
 
-	return test_set->perf_oa_format;
-}
-
-static int
-oa_unit_default_format(const struct intel_execution_engine2 *e)
-{
-	if (e->class == I915_ENGINE_CLASS_VIDEO ||
-	    e->class == I915_ENGINE_CLASS_VIDEO_ENHANCE)
-		return I915_OAM_FORMAT_MPEC8u32_B8_C8;
-
-	return test_set->perf_oa_format;
+	return default_test_set->perf_oa_format;
 }
 
 /*
@@ -1133,9 +1126,6 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 static bool
 init_sys_info(void)
 {
-	const char *test_set_name = NULL;
-	struct intel_perf_metric_set *metric_set_iter;
-
 	igt_assert_neq(devid, 0);
 
 	intel_perf = intel_perf_for_fd(drm_fd);
@@ -1152,38 +1142,17 @@ init_sys_info(void)
 	 * RenderBasic
 	 */
 	if (IS_HASWELL(devid)) {
-		test_set_name = "RenderBasic";
 		read_report_ticks = hsw_read_report_ticks;
 		sanity_check_reports = hsw_sanity_check_render_basic_reports;
 		undefined_a_counters = hsw_undefined_a_counters;
 	} else {
-		test_set_name = "TestOa";
 		read_report_ticks = gen8_read_report_ticks;
 		sanity_check_reports = gen8_sanity_check_test_oa_reports;
 		undefined_a_counters = gen8_undefined_a_counters;
 	}
 
-	igt_list_for_each_entry(metric_set_iter, &intel_perf->metric_sets, link) {
-		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
-			test_set = metric_set_iter;
-			break;
-		}
-	}
-
-	if (!test_set)
-		return false;
-
-	igt_debug("%s metric set UUID = %s\n",
-		  test_set->symbol_name,
-		  test_set->hw_config_guid);
-
 	intel_perf_load_perf_configs(intel_perf, drm_fd);
 
-	if (test_set->perf_oa_metrics_set == 0) {
-		igt_debug("Unable to load configurations\n");
-		return false;
-	}
-
 	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
 
 	return true;
@@ -1255,8 +1224,8 @@ test_system_wide_paranoid(void)
 			DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 			/* OA unit configuration */
-			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+			DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		};
 		struct drm_i915_perf_open_param param = {
@@ -1281,8 +1250,8 @@ test_system_wide_paranoid(void)
 			DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 			/* OA unit configuration */
-			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+			DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		};
 		struct drm_i915_perf_open_param param = {
@@ -1313,8 +1282,8 @@ test_invalid_open_flags(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -1331,8 +1300,8 @@ test_invalid_class_instance(void)
 {
 	uint64_t properties[] = {
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, 0,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, 0,
@@ -1375,7 +1344,7 @@ test_invalid_oa_metric_set_id(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_OA_METRICS_SET, UINT64_MAX,
 	};
@@ -1392,7 +1361,7 @@ test_invalid_oa_metric_set_id(void)
 	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
 
 	/* Check that we aren't just seeing false positives... */
-	properties[ARRAY_SIZE(properties) - 1] = test_set->perf_oa_metrics_set;
+	properties[ARRAY_SIZE(properties) - 1] = default_test_set->perf_oa_metrics_set;
 	stream_fd = __perf_open(drm_fd, &param, false);
 	__perf_close(stream_fd);
 
@@ -1409,7 +1378,7 @@ test_invalid_oa_format_id(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_OA_FORMAT, UINT64_MAX,
 	};
@@ -1426,7 +1395,7 @@ test_invalid_oa_format_id(void)
 	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
 
 	/* Check that we aren't just seeing false positives... */
-	properties[ARRAY_SIZE(properties) - 1] = test_set->perf_oa_format;
+	properties[ARRAY_SIZE(properties) - 1] = default_test_set->perf_oa_format;
 	stream_fd = __perf_open(drm_fd, &param, false);
 	__perf_close(stream_fd);
 
@@ -1442,9 +1411,9 @@ test_missing_sample_flags(void)
 		/* No _PROP_SAMPLE_xyz flags */
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
@@ -1577,6 +1546,7 @@ open_and_read_2_oa_reports(int format_id,
 			   bool timer_only,
 			   const struct intel_execution_engine2 *e)
 {
+	struct intel_perf_metric_set *test_set = metric_set(e);
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -1961,7 +1931,8 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
 static void
 test_oa_exponents(const struct intel_execution_engine2 *e)
 {
-	uint64_t fmt = oa_unit_default_format(e);
+	struct intel_perf_metric_set *test_set = metric_set(e);
+	uint64_t fmt = test_set->perf_oa_format;
 
 	load_helper_init();
 	load_helper_run(HIGH);
@@ -2105,8 +2076,8 @@ test_invalid_oa_exponent(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, 31, /* maximum exponent expected
 						       to be accepted */
 	};
@@ -2141,8 +2112,8 @@ test_low_oa_exponent_permissions(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, bad_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2204,8 +2175,8 @@ test_per_context_mode_unprivileged(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2300,10 +2271,11 @@ test_blocking(uint64_t requested_oa_period,
 
 	int64_t start, end;
 	int n = 0;
+	struct intel_perf_metric_set *test_set = metric_set(e);
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format(e));
+	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2463,10 +2435,11 @@ test_polling(uint64_t requested_oa_period,
 	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
 	int64_t start, end;
 	int n = 0;
+	struct intel_perf_metric_set *test_set = metric_set(e);
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format(e));
+	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2638,8 +2611,8 @@ static void test_polling_small_buf(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2651,7 +2624,7 @@ static void test_polling_small_buf(void)
 	};
 	uint32_t test_duration = 80 * 1000 * 1000;
 	int sample_size = (sizeof(struct drm_i915_perf_record_header) +
-			   get_oa_format(test_set->perf_oa_format).size);
+			   get_oa_format(default_test_set->perf_oa_format).size);
 	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
 	int n_expect_read_bytes = n_expected_reports * sample_size;
 	struct timespec ts = {};
@@ -2736,11 +2709,12 @@ static void
 gen12_test_oa_tlb_invalidate(const struct intel_execution_engine2 *e)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(30000000);
+	struct intel_perf_metric_set *test_set = metric_set(e);
 	uint64_t properties[] = {
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -2783,7 +2757,8 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = oa_unit_default_format(e);
+	struct intel_perf_metric_set *test_set = metric_set(e);
+	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -2940,8 +2915,8 @@ test_non_zero_reason(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2997,7 +2972,7 @@ test_non_zero_reason(void)
 
 			if (last_report) {
 				sanity_check_reports(last_report, report,
-						     test_set->perf_oa_format);
+						     default_test_set->perf_oa_format);
 			}
 			last_report = report;
 			break;
@@ -3019,7 +2994,8 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = oa_unit_default_format(e);
+	struct intel_perf_metric_set *test_set = metric_set(e);
+	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -3179,8 +3155,8 @@ test_short_reads(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -3270,8 +3246,8 @@ test_non_sampling_read_error(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 
 		/* XXX: no sampling exponent */
 	};
@@ -3306,8 +3282,8 @@ test_disabled_read_error(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -3333,7 +3309,7 @@ test_disabled_read_error(void)
 	param.flags &= ~I915_PERF_FLAG_DISABLED;
 	stream_fd = __perf_open(drm_fd, &param, false);
 
-	read_2_oa_reports(test_set->perf_oa_format,
+	read_2_oa_reports(default_test_set->perf_oa_format,
 			  oa_exponent,
 			  oa_report0,
 			  oa_report1,
@@ -3347,7 +3323,7 @@ test_disabled_read_error(void)
 
 	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
 
-	read_2_oa_reports(test_set->perf_oa_format,
+	read_2_oa_reports(default_test_set->perf_oa_format,
 			  oa_exponent,
 			  oa_report0,
 			  oa_report1,
@@ -3360,6 +3336,7 @@ static void
 gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 {
 	uint64_t fmt = oar_unit_default_format();
+	struct intel_perf_metric_set *test_set = metric_set(e);
 	uint64_t properties[] = {
 		/* On Gen12, MI RPC uses OAR. OAR is configured only for the
 		 * render context that wants to measure the performance. Hence a
@@ -3468,8 +3445,8 @@ test_mi_rpc(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 
 		/* Note: no OA exponent specified in this case */
 	};
@@ -3507,7 +3484,7 @@ test_mi_rpc(void)
 	report32 = buf->ptr;
 	dump_report(report32, 64, "mi-rpc");
 	igt_assert_eq(report32[0], 0xdeadbeef); /* report ID */
-	igt_assert(oa_timestamp(report32, test_set->perf_oa_format)); /* timestamp */
+	igt_assert(oa_timestamp(report32, default_test_set->perf_oa_format)); /* timestamp */
 
 	igt_assert_neq(report32[63], 0x80808080); /* end of report */
 	igt_assert_eq(report32[64], 0x80808080); /* after 256 byte report */
@@ -3571,8 +3548,8 @@ hsw_test_single_ctx_counters(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 
 		/* Note: no OA exponent specified in this case */
 	};
@@ -3717,7 +3694,7 @@ hsw_test_single_ctx_counters(void)
 		igt_assert_neq(report1_32[1], 0); /* timestamp */
 
 		print_reports(report0_32, report1_32,
-			      lookup_format(test_set->perf_oa_format));
+			      lookup_format(default_test_set->perf_oa_format));
 
 		/* A40 == N samples written to all render targets */
 		n_samples_written = report1_32[43] - report0_32[43];
@@ -3800,8 +3777,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 
 		/* Note: no OA exponent specified in this case */
@@ -3811,7 +3788,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
+	size_t format_size = get_oa_format(default_test_set->perf_oa_format).size;
 	size_t sample_size = (sizeof(struct drm_i915_perf_record_header) +
 			      format_size);
 	int max_reports = MAX_OA_BUF_SIZE / format_size;
@@ -3846,7 +3823,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			int delta_delta;
 			int ret;
 			struct accumulator accumulator = {
-				.format = test_set->perf_oa_format
+				.format = default_test_set->perf_oa_format
 			};
 
 			bops = buf_ops_create(drm_fd);
@@ -4012,7 +3989,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 				goto again;
 			}
 
-			len = i915_read_reports_until_timestamp(test_set->perf_oa_format,
+			len = i915_read_reports_until_timestamp(default_test_set->perf_oa_format,
 								buf, buf_size,
 								report0_32[1],
 								report1_32[1]);
@@ -4027,7 +4004,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 				uint32_t reason;
 				const char *skip_reason = NULL, *report_reason = NULL;
 				struct accumulator laccumulator = {
-					.format = test_set->perf_oa_format
+					.format = default_test_set->perf_oa_format
 				};
 
 
@@ -4158,7 +4135,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 				if (report == report1_32) {
 					igt_debug("Breaking on end of report\n");
 					print_reports(report0_32, report1_32,
-						      lookup_format(test_set->perf_oa_format));
+						      lookup_format(default_test_set->perf_oa_format));
 					break;
 				}
 			}
@@ -4213,6 +4190,7 @@ again:
 
 static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 {
+	struct intel_perf_metric_set *test_set = metric_set(e);
 	uint64_t fmt = oar_unit_default_format();
 	uint64_t properties[] = {
 		/* Have a random value here for the context id, but initialize
@@ -4558,8 +4536,8 @@ test_rc6_disable(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -4601,6 +4579,8 @@ test_rc6_disable(void)
 static void
 test_stress_open_close(const struct intel_execution_engine2 *e)
 {
+	struct intel_perf_metric_set *test_set = metric_set(e);
+
 	load_helper_init();
 	load_helper_run(HIGH);
 
@@ -4614,7 +4594,7 @@ test_stress_open_close(const struct intel_execution_engine2 *e)
 
 			/* OA unit configuration */
 			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-			DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 			DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 			DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -4702,6 +4682,7 @@ make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_ss
 static void
 test_global_sseu_config_invalid(const struct intel_execution_engine2 *e)
 {
+	struct intel_perf_metric_set *test_set = metric_set(e);
 	struct drm_i915_gem_context_param_sseu default_sseu;
 	struct drm_i915_gem_context_param_sseu sseu_param;
 	struct drm_i915_gem_context_param ctx_gp = {
@@ -4717,7 +4698,7 @@ test_global_sseu_config_invalid(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
@@ -4791,6 +4772,7 @@ test_global_sseu_config_invalid(const struct intel_execution_engine2 *e)
 static void
 test_global_sseu_config(const struct intel_execution_engine2 *e)
 {
+	struct intel_perf_metric_set *test_set = metric_set(e);
 	struct drm_i915_gem_context_param_sseu default_sseu;
 	struct drm_i915_gem_context_param_sseu sseu_param;
 	struct drm_i915_gem_context_param ctx_gp = {
@@ -4806,7 +4788,7 @@ test_global_sseu_config(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
@@ -5012,7 +4994,7 @@ test_create_destroy_userspace_config(void)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_OA_METRICS_SET
 	};
@@ -5299,8 +5281,8 @@ test_i915_ref_count(void)
 	 * init_sys_info()...
 	 */
 	igt_require(init_sys_info());
-	properties[3] = test_set->perf_oa_metrics_set;
-	properties[5] = test_set->perf_oa_format;
+	properties[3] = default_test_set->perf_oa_metrics_set;
+	properties[5] = default_test_set->perf_oa_format;
 	properties[7] = oa_exp_1_millisec;
 
 	ref_count0 = read_i915_module_ref();
@@ -5321,7 +5303,7 @@ test_i915_ref_count(void)
 
 	igt_assert(ref_count0 > baseline);
 
-	read_2_oa_reports(test_set->perf_oa_format,
+	read_2_oa_reports(default_test_set->perf_oa_format,
 			  oa_exp_1_millisec,
 			  oa_report0,
 			  oa_report1,
@@ -5381,6 +5363,9 @@ struct perf_engine_group {
 	/* perf engines in a group */
 	int num_engines;
 	struct i915_engine_class_instance *ci;
+
+	int gt;
+	struct intel_perf_metric_set *test_set;
 };
 
 static struct drm_i915_query_engine_info *query_engine_info(int i915)
@@ -5397,6 +5382,49 @@ static struct drm_i915_query_engine_info *query_engine_info(int i915)
 	return qinfo;
 }
 
+static struct intel_perf_metric_set *metric_set(const struct intel_execution_engine2 *e2)
+{
+	const char *test_set_name = NULL;
+	struct intel_perf_metric_set *metric_set_iter;
+	struct intel_perf_metric_set *test_set = NULL;
+
+	if (IS_HASWELL(devid))
+		test_set_name = "RenderBasic";
+	else if (e2->class == I915_ENGINE_CLASS_RENDER)
+		test_set_name = "TestOa";
+	else if ((e2->class == I915_ENGINE_CLASS_VIDEO ||
+		  e2->class == I915_ENGINE_CLASS_VIDEO_ENHANCE) &&
+		 HAS_OAM(devid))
+		test_set_name = "MediaSet1";
+	else
+		igt_assert(!"reached");
+
+	igt_list_for_each_entry(metric_set_iter, &intel_perf->metric_sets, link) {
+		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
+			test_set = metric_set_iter;
+			break;
+		}
+	}
+
+	igt_assert(test_set);
+
+	/*
+	 * configuration was loaded in init_sys_info() ->
+	 * intel_perf_load_perf_configs(), and test_set->perf_oa_metrics_set
+	 * should point to metric id returned by the config add ioctl. 0 is
+	 * invalid.
+	 */
+	igt_assert_neq_u64(test_set->perf_oa_metrics_set, 0);
+
+	igt_debug("engine %d:%d - %s metric set UUID = %s\n",
+		  e2->class,
+		  e2->instance,
+		  test_set->symbol_name,
+		  test_set->hw_config_guid);
+
+	return test_set;
+}
+
 static int compare_engine_oa_unit_id(const void *e1, const void *e2)
 {
 	const struct drm_i915_engine_info *_e1 = e1;
@@ -5572,8 +5600,8 @@ test_gt_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
 {
 	uint64_t properties[] = {
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, 0,
+		DRM_I915_PERF_PROP_OA_FORMAT, 0,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, 0,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, 0,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
@@ -5592,12 +5620,16 @@ test_gt_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
 	for (i = 0; i < num_perf_oa_groups; i++) {
 		struct perf_engine_group *grp = &perf_oa_groups[i];
 		struct i915_engine_class_instance *ci = random_engine(grp);
+		struct intel_execution_engine2 *e2 = __ci_to_e2(ctx, ci);
+		struct intel_perf_metric_set *test_set = metric_set(e2);
 
 		if (!exponent) {
 			properties[0] = DRM_I915_PERF_PROP_CTX_HANDLE;
 			properties[1] = ctx->id;
 		}
 
+		properties[3] = test_set->perf_oa_metrics_set;
+		properties[5] = test_set->perf_oa_format;
 		properties[7] = ci->engine_class;
 		properties[9] = ci->engine_instance;
 		grp->perf_fd = igt_ioctl(drm_fd,
@@ -5615,6 +5647,8 @@ test_gt_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
 
 		for (j = 0; j < grp->num_engines; j++) {
 			struct i915_engine_class_instance *ci = grp->ci + j;
+			struct intel_execution_engine2 *e2 = __ci_to_e2(ctx, ci);
+			struct intel_perf_metric_set *test_set = metric_set(e2);
 
 			/*
 			 * case 1:
@@ -5622,6 +5656,8 @@ test_gt_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
 			 */
 			properties[0] = DRM_I915_PERF_PROP_SAMPLE_OA;
 			properties[1] = true;
+			properties[3] = test_set->perf_oa_metrics_set;
+			properties[5] = test_set->perf_oa_format;
 			properties[7] = ci->engine_class;
 			properties[9] = ci->engine_instance;
 			/* for SAMPLE OA use case, we must pass exponent */
-- 
2.36.1
