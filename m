Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC42210E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:13 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 12:59:44 -0800
Message-Id: <20230214210007.2026033-8-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 07/30] i915/perf: Enable tests to run on specific
 engines
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

New perf interface enabled passing engine class instance to the perf
interface. Enable some tests to utlize this interface to run the test on
supported engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 388 +++++++++++++++++++++++++++++++---------------
 1 file changed, 264 insertions(+), 124 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 13cfe895..bd3cdb6a 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -87,6 +87,13 @@ IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
 
 #define MAX_OA_BUF_SIZE (16 * 1024 * 1024)
 
+#define ADD_PROPS(_head, _tail, _key, _value) \
+	do { \
+		igt_assert((_tail - _head) < (DRM_I915_PERF_PROP_MAX * 2)); \
+		*_tail++ = DRM_I915_PERF_PROP_##_key; \
+		*_tail++ = _value; \
+	} while (0)
+
 struct accumulator {
 #define MAX_RAW_OA_COUNTERS 62
 	enum drm_i915_oa_format format;
@@ -327,6 +334,50 @@ __perf_open(int fd, struct drm_i915_perf_open_param *param, bool prevent_pm)
 	return ret;
 }
 
+static int i915_perf_revision(int fd)
+{
+	drm_i915_getparam_t gp;
+	int value = 1, ret;
+
+	gp.param = I915_PARAM_PERF_REVISION;
+	gp.value = &value;
+	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
+	if (ret == -1) {
+		/* If the param is missing, consider version 1. */
+		igt_assert_eq(errno, EINVAL);
+		return 1;
+	}
+
+	return value;
+}
+
+/*
+ * perf_supports_engine is used in the for loop that iterates over engines and
+ * determines if perf test can be run on a particular engine. For perf revisions
+ * below 10, we only need to run the test once, so we return true only for rcs0.
+ * Note that the test itself ignores the class instance parameters if they are
+ * not supported by the perf interface. This enables us to use a single for-loop
+ * construct to run the same test on all platforms and all perf revisions.
+ */
+static bool
+perf_supports_engine(const struct intel_execution_engine2 *e)
+{
+	return e->class == I915_ENGINE_CLASS_RENDER &&
+	       e->instance == 0;
+}
+
+static bool
+has_param_class_instance(void)
+{
+	return i915_perf_revision(drm_fd) >= 6;
+}
+
+static bool
+has_param_poll_period(void)
+{
+	return i915_perf_revision(drm_fd) >= 5;
+}
+
 static int
 lookup_format(int i915_perf_fmt_id)
 {
@@ -1436,7 +1487,8 @@ open_and_read_2_oa_reports(int format_id,
 			   int exponent,
 			   uint32_t *oa_report0,
 			   uint32_t *oa_report1,
-			   bool timer_only)
+			   bool timer_only,
+			   const struct intel_execution_engine2 *e)
 {
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
@@ -1446,11 +1498,15 @@ open_and_read_2_oa_reports(int format_id,
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, format_id,
 		DRM_I915_PERF_PROP_OA_EXPONENT, exponent,
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
 
@@ -1633,7 +1689,7 @@ print_report(uint32_t *report, int fmt)
 #endif
 
 static void
-test_oa_formats(void)
+test_oa_formats(const struct intel_execution_engine2 *e)
 {
 	for (int i = 0; i < I915_OA_FORMAT_MAX; i++) {
 		struct oa_format format = get_oa_format(i);
@@ -1652,7 +1708,8 @@ test_oa_formats(void)
 					   oa_exp_1_millisec,
 					   oa_report0,
 					   oa_report1,
-					   false); /* timer reports only */
+					   false, /* timer reports only */
+					   e);
 
 		print_reports(oa_report0, oa_report1, i);
 		sanity_check_reports(oa_report0, oa_report1, i);
@@ -1799,7 +1856,7 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
 }
 
 static void
-test_oa_exponents(void)
+test_oa_exponents(const struct intel_execution_engine2 *e)
 {
 	load_helper_init();
 	load_helper_run(HIGH);
@@ -1817,10 +1874,14 @@ test_oa_exponents(void)
 			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, exponent,
+			DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
+			DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
 		};
 		struct drm_i915_perf_open_param param = {
 			.flags = I915_PERF_FLAG_FD_CLOEXEC,
-			.num_properties = ARRAY_SIZE(properties) / 2,
+			.num_properties = has_param_class_instance() ?
+					  ARRAY_SIZE(properties) / 2 :
+					  (ARRAY_SIZE(properties) / 2) - 2,
 			.properties_ptr = to_user_pointer(properties),
 		};
 		uint64_t expected_timestamp_delta = 2ULL << exponent;
@@ -2099,30 +2160,16 @@ get_time(void)
  * kernelspace.
  */
 static void
-test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t kernel_hrtimer)
+test_blocking(uint64_t requested_oa_period,
+	      bool set_kernel_hrtimer,
+	      uint64_t kernel_hrtimer,
+	      const struct intel_execution_engine2 *e)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t properties[] = {
-		/* Include OA reports in samples */
-		DRM_I915_PERF_PROP_SAMPLE_OA, true,
-
-		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
-		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
-
-		/* Kernel configuration (optional) */
-		DRM_I915_PERF_PROP_POLL_OA_PERIOD, kernel_hrtimer,
-	};
-	struct drm_i915_perf_open_param param = {
-		.flags = I915_PERF_FLAG_FD_CLOEXEC |
-			I915_PERF_FLAG_DISABLED,
-		.num_properties = set_kernel_hrtimer ?
-				  ARRAY_SIZE(properties) / 2 :
-				  (ARRAY_SIZE(properties) / 2) - 1,
-		.properties_ptr = to_user_pointer(properties),
-	};
+	uint64_t props[DRM_I915_PERF_PROP_MAX * 2];
+	uint64_t *idx = props;
+	struct drm_i915_perf_open_param param;
 	uint8_t buf[1024 * 1024];
 	struct tms start_times;
 	struct tms end_times;
@@ -2147,6 +2194,24 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
 	int64_t start, end;
 	int n = 0;
 
+	ADD_PROPS(props, idx, SAMPLE_OA, true);
+	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
+	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
+	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
+
+	if (has_param_poll_period() && set_kernel_hrtimer)
+		ADD_PROPS(props, idx, POLL_OA_PERIOD, kernel_hrtimer);
+
+	if (has_param_class_instance()) {
+		ADD_PROPS(props, idx, OA_ENGINE_CLASS, e->class);
+		ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, e->instance);
+	}
+
+	param.flags = I915_PERF_FLAG_FD_CLOEXEC |
+		      I915_PERF_FLAG_DISABLED;
+	param.num_properties = (idx - props) / 2;
+	param.properties_ptr = to_user_pointer(props);
+
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
 	times(&start_times);
@@ -2258,31 +2323,16 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
 }
 
 static void
-test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t kernel_hrtimer)
+test_polling(uint64_t requested_oa_period,
+	     bool set_kernel_hrtimer,
+	     uint64_t kernel_hrtimer,
+	     const struct intel_execution_engine2 *e)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t properties[] = {
-		/* Include OA reports in samples */
-		DRM_I915_PERF_PROP_SAMPLE_OA, true,
-
-		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
-		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
-
-		/* Kernel configuration (optional) */
-		DRM_I915_PERF_PROP_POLL_OA_PERIOD, kernel_hrtimer,
-	};
-	struct drm_i915_perf_open_param param = {
-		.flags = I915_PERF_FLAG_FD_CLOEXEC |
-			I915_PERF_FLAG_DISABLED |
-			I915_PERF_FLAG_FD_NONBLOCK,
-		.num_properties = set_kernel_hrtimer ?
-				  ARRAY_SIZE(properties) / 2 :
-				  (ARRAY_SIZE(properties) / 2) - 1,
-		.properties_ptr = to_user_pointer(properties),
-	};
+	uint64_t props[DRM_I915_PERF_PROP_MAX * 2];
+	uint64_t *idx = props;
+	struct drm_i915_perf_open_param param;
 	uint8_t buf[1024 * 1024];
 	struct tms start_times;
 	struct tms end_times;
@@ -2307,6 +2357,25 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 	int64_t start, end;
 	int n = 0;
 
+	ADD_PROPS(props, idx, SAMPLE_OA, true);
+	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
+	ADD_PROPS(props, idx, OA_FORMAT, test_set->perf_oa_format);
+	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
+
+	if (has_param_poll_period() && set_kernel_hrtimer)
+		ADD_PROPS(props, idx, POLL_OA_PERIOD, kernel_hrtimer);
+
+	if (has_param_class_instance()) {
+		ADD_PROPS(props, idx, OA_ENGINE_CLASS, e->class);
+		ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, e->instance);
+	}
+
+	param.flags = I915_PERF_FLAG_FD_CLOEXEC |
+		      I915_PERF_FLAG_DISABLED |
+		      I915_PERF_FLAG_FD_NONBLOCK;
+	param.num_properties = (idx - props) / 2;
+	param.properties_ptr = to_user_pointer(props);
+
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
 	times(&start_times);
@@ -2557,7 +2626,7 @@ num_valid_reports_captured(struct drm_i915_perf_open_param *param,
 }
 
 static void
-gen12_test_oa_tlb_invalidate(void)
+gen12_test_oa_tlb_invalidate(const struct intel_execution_engine2 *e)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(30000000);
 	uint64_t properties[] = {
@@ -2566,11 +2635,15 @@ gen12_test_oa_tlb_invalidate(void)
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
+		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_DISABLED,
-		.num_properties = ARRAY_SIZE(properties) / 2,
+		.num_properties = has_param_class_instance() ?
+				  ARRAY_SIZE(properties) / 2 :
+				  (ARRAY_SIZE(properties) / 2) - 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	int num_reports1, num_reports2, num_expected_reports;
@@ -2598,7 +2671,7 @@ gen12_test_oa_tlb_invalidate(void)
 
 
 static void
-test_buffer_fill(void)
+test_buffer_fill(const struct intel_execution_engine2 *e)
 {
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
@@ -2611,10 +2684,14 @@ test_buffer_fill(void)
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
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
@@ -2829,7 +2906,7 @@ test_non_zero_reason(void)
 }
 
 static void
-test_enable_disable(void)
+test_enable_disable(const struct intel_execution_engine2 *e)
 {
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
@@ -2842,11 +2919,15 @@ test_enable_disable(void)
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
+		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			 I915_PERF_FLAG_DISABLED, /* Verify we start disabled */
-		.num_properties = ARRAY_SIZE(properties) / 2,
+		.num_properties = has_param_class_instance() ?
+				  ARRAY_SIZE(properties) / 2 :
+				  (ARRAY_SIZE(properties) / 2) - 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
@@ -3167,7 +3248,7 @@ test_disabled_read_error(void)
 }
 
 static void
-gen12_test_mi_rpc(void)
+gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 {
 	uint64_t fmt = oar_unit_default_format();
 	uint64_t properties[] = {
@@ -3191,10 +3272,14 @@ gen12_test_mi_rpc(void)
 		 */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
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
 	struct buf_ops *bops;
@@ -4017,7 +4102,7 @@ again:
 	} while (WEXITSTATUS(child_ret) == EAGAIN);
 }
 
-static void gen12_single_ctx_helper(void)
+static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 {
 	uint64_t fmt = oar_unit_default_format();
 	uint64_t properties[] = {
@@ -4036,10 +4121,14 @@ static void gen12_single_ctx_helper(void)
 		 */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
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
 	struct buf_ops *bops;
@@ -4323,7 +4412,7 @@ static void gen12_single_ctx_helper(void)
 }
 
 static void
-gen12_test_single_ctx_render_target_writes_a_counter(void)
+gen12_test_single_ctx_render_target_writes_a_counter(const struct intel_execution_engine2 *e)
 {
 	int child_ret;
 	struct igt_helper_process child = {};
@@ -4337,7 +4426,7 @@ gen12_test_single_ctx_render_target_writes_a_counter(void)
 			drm_fd = gem_reopen_driver(drm_fd);
 
 			igt_drop_root();
-			gen12_single_ctx_helper();
+			gen12_single_ctx_helper(e);
 
 			close(drm_fd);
 		}
@@ -4401,7 +4490,7 @@ test_rc6_disable(void)
 }
 
 static void
-test_stress_open_close(void)
+test_stress_open_close(const struct intel_execution_engine2 *e)
 {
 	load_helper_init();
 	load_helper_run(HIGH);
@@ -4418,11 +4507,15 @@ test_stress_open_close(void)
 			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+			DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
+			DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
 		};
 		struct drm_i915_perf_open_param param = {
 			.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			         I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
-			.num_properties = ARRAY_SIZE(properties) / 2,
+			.num_properties = has_param_class_instance() ?
+					  ARRAY_SIZE(properties) / 2 :
+					  (ARRAY_SIZE(properties) / 2) - 2,
 			.properties_ptr = to_user_pointer(properties),
 		};
 
@@ -4473,7 +4566,8 @@ static void print_sseu_config(struct drm_i915_gem_context_param_sseu *sseu)
 }
 
 static struct drm_i915_gem_context_param_sseu
-make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_sseu)
+make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_sseu,
+			       uint16_t class, uint16_t instance)
 {
 	struct drm_i915_gem_context_param_sseu sseu = default_sseu;
 
@@ -4490,11 +4584,14 @@ make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_ss
 		sseu.subslice_mask = mask_minus_one(sseu.subslice_mask);
 	}
 
+	sseu.engine.engine_class = class;
+	sseu.engine.engine_instance = instance;
+
 	return sseu;
 }
 
 static void
-test_global_sseu_config_invalid(void)
+test_global_sseu_config_invalid(const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_context_param_sseu default_sseu;
 	struct drm_i915_gem_context_param_sseu sseu_param;
@@ -4514,18 +4611,27 @@ test_global_sseu_config_invalid(void)
 		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
+		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
+		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 		I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
-		.num_properties = ARRAY_SIZE(properties) / 2,
+		.num_properties = has_param_class_instance() ?
+				  ARRAY_SIZE(properties) / 2 :
+				  (ARRAY_SIZE(properties) / 2) - 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
 	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
-	default_sseu.engine.engine_class = default_e2.class;
-	default_sseu.engine.engine_instance = default_e2.flags;
+	if (has_param_class_instance()) {
+		default_sseu.engine.engine_class = e->class;
+		default_sseu.engine.engine_instance = e->flags;
+	} else {
+		default_sseu.engine.engine_class = default_e2.class;
+		default_sseu.engine.engine_instance = default_e2.flags;
+	}
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
@@ -4564,7 +4670,9 @@ test_global_sseu_config_invalid(void)
 		igt_fork(child, 1) {
 			igt_drop_root();
 
-			sseu_param = make_valid_reduced_sseu_config(default_sseu);
+			sseu_param = make_valid_reduced_sseu_config(default_sseu,
+								    e->class,
+								    e->instance);
 			do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EACCES);
 		}
 		igt_waitchildren();
@@ -4572,7 +4680,7 @@ test_global_sseu_config_invalid(void)
 }
 
 static void
-test_global_sseu_config(void)
+test_global_sseu_config(const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_context_param_sseu default_sseu;
 	struct drm_i915_gem_context_param_sseu sseu_param;
@@ -4592,18 +4700,27 @@ test_global_sseu_config(void)
 		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
+		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
+		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 		I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
-		.num_properties = ARRAY_SIZE(properties) / 2,
+		.num_properties = has_param_class_instance() ?
+				  ARRAY_SIZE(properties) / 2 :
+				  (ARRAY_SIZE(properties) / 2) - 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
 	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
-	default_sseu.engine.engine_class = default_e2.class;
-	default_sseu.engine.engine_instance = default_e2.flags;
+	if (has_param_class_instance()) {
+		default_sseu.engine.engine_class = e->class;
+		default_sseu.engine.engine_instance = e->flags;
+	} else {
+		default_sseu.engine.engine_class = default_e2.class;
+		default_sseu.engine.engine_instance = default_e2.flags;
+	}
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
@@ -4613,7 +4730,9 @@ test_global_sseu_config(void)
 
 	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 0);
 
-	sseu_param = make_valid_reduced_sseu_config(default_sseu);
+	sseu_param = make_valid_reduced_sseu_config(default_sseu,
+						    e->class,
+						    e->instance);
 	igt_debug("Selected context sseu:\n");
 	print_sseu_config(&sseu_param);
 
@@ -5115,22 +5234,15 @@ test_sysctl_defaults(void)
 	igt_assert_eq(max_freq, 100000);
 }
 
-static int i915_perf_revision(int fd)
-{
-	drm_i915_getparam_t gp;
-	int value = 1, ret;
+#define __for_each_perf_enabled_engine(fd__, e__) \
+	for_each_physical_engine(fd__, e__) \
+		if (perf_supports_engine(e__)) \
+			igt_dynamic_f("%s", e__->name)
 
-	gp.param = I915_PARAM_PERF_REVISION;
-	gp.value = &value;
-	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
-	if (ret == -1) {
-		/* If the param is missing, consider version 1. */
-		igt_assert_eq(errno, EINVAL);
-		return 1;
-	}
-
-	return value;
-}
+#define __for_each_render_engine(fd__, e__) \
+	for_each_physical_engine(fd__, e__) \
+		if (e__->class == I915_ENGINE_CLASS_RENDER) \
+			igt_dynamic_f("%s", e__->name)
 
 static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
 {
@@ -5157,6 +5269,7 @@ static void set_default_engine(const intel_ctx_t *ctx)
 igt_main
 {
 	const intel_ctx_t *ctx;
+	const struct intel_execution_engine2 *e;
 
 	igt_fixture {
 		struct stat sb;
@@ -5221,23 +5334,26 @@ igt_main
 	igt_subtest("missing-sample-flags")
 		test_missing_sample_flags();
 
-	igt_subtest("oa-formats")
-		test_oa_formats();
+	igt_subtest_with_dynamic("oa-formats")
+		__for_each_perf_enabled_engine(drm_fd, e)
+			test_oa_formats(e);
 
 	igt_subtest("invalid-oa-exponent")
 		test_invalid_oa_exponent();
 	igt_subtest("low-oa-exponent-permissions")
 		test_low_oa_exponent_permissions();
-	igt_subtest("oa-exponents")
-		test_oa_exponents();
+	igt_subtest_with_dynamic("oa-exponents")
+		__for_each_perf_enabled_engine(drm_fd, e)
+			test_oa_exponents(e);
 
 	igt_subtest("per-context-mode-unprivileged") {
 		igt_require(IS_HASWELL(devid));
 		test_per_context_mode_unprivileged();
 	}
 
-	igt_subtest("buffer-fill")
-		test_buffer_fill();
+	igt_subtest_with_dynamic("buffer-fill")
+		__for_each_perf_enabled_engine(drm_fd, e)
+			test_buffer_fill(e);
 
 	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
 	igt_subtest("non-zero-reason") {
@@ -5251,45 +5367,64 @@ igt_main
 	igt_subtest("non-sampling-read-error")
 		test_non_sampling_read_error();
 
-	igt_subtest("enable-disable")
-		test_enable_disable();
+	igt_subtest_with_dynamic("enable-disable")
+		__for_each_perf_enabled_engine(drm_fd, e)
+			test_enable_disable(e);
 
 	igt_describe("Test blocking read with default hrtimer frequency");
-	igt_subtest("blocking") {
-		test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
-			      false /* set_kernel_hrtimer */,
-			      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */);
+	igt_subtest_with_dynamic("blocking") {
+		__for_each_perf_enabled_engine(drm_fd, e)
+			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
+				      false /* set_kernel_hrtimer */,
+				      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
+				      e);
 	}
 
 	igt_describe("Test blocking read with different hrtimer frequencies");
 	igt_subtest("blocking-parameterized") {
+		const struct intel_execution_engine2 _e = {
+		      .class = default_e2.class,
+		      .instance = default_e2.instance,
+		};
+
 		igt_require(i915_perf_revision(drm_fd) >= 5);
 
 		test_blocking(10 * 1000 * 1000 /* 10ms oa period */,
 			      true /* set_kernel_hrtimer */,
-			      40 * 1000 * 1000 /* default 40ms hrtimer */);
+			      40 * 1000 * 1000 /* default 40ms hrtimer */,
+			      &_e);
 		test_blocking(500 * 1000 /* 500us oa period */,
 			      true /* set_kernel_hrtimer */,
-			      2 * 1000 * 1000 /* default 2ms hrtimer */);
+			      2 * 1000 * 1000 /* default 2ms hrtimer */,
+			      &_e);
 	}
 
 	igt_describe("Test polled read with default hrtimer frequency");
-	igt_subtest("polling") {
-		test_polling(40 * 1000 * 1000 /* 40ms oa period */,
-			     false /* set_kernel_hrtimer */,
-			     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */);
+	igt_subtest_with_dynamic("polling") {
+		__for_each_perf_enabled_engine(drm_fd, e)
+			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
+				     false /* set_kernel_hrtimer */,
+				     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
+				     e);
 	}
 
 	igt_describe("Test polled read with different hrtimer frequencies");
 	igt_subtest("polling-parameterized") {
+		const struct intel_execution_engine2 _e = {
+		      .class = default_e2.class,
+		      .instance = default_e2.instance,
+		};
+
 		igt_require(i915_perf_revision(drm_fd) >= 5);
 
 		test_polling(10 * 1000 * 1000 /* 10ms oa period */,
 			     true /* set_kernel_hrtimer */,
-			     40 * 1000 * 1000 /* default 40ms hrtimer */);
+			     40 * 1000 * 1000 /* default 40ms hrtimer */,
+			     &_e);
 		test_polling(500 * 1000 /* 500us oa period */,
 			     true /* set_kernel_hrtimer */,
-			     2 * 1000 * 1000 /* default 2ms hrtimer */);
+			     2 * 1000 * 1000 /* default 2ms hrtimer */,
+			     &_e);
 	}
 
 	igt_describe("Test polled read with buffer size smaller than available data");
@@ -5328,21 +5463,23 @@ igt_main
 		igt_fixture igt_require(intel_gen(devid) >= 12);
 
 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
-		igt_subtest("gen12-mi-rpc") {
-			igt_require_f(has_class_instance(drm_fd,
-							 I915_ENGINE_CLASS_RENDER,
-							 0), "no render engine\n");
-			gen12_test_mi_rpc();
+		igt_subtest_with_dynamic("gen12-mi-rpc") {
+			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
+			__for_each_render_engine(drm_fd, e)
+				gen12_test_mi_rpc(e);
 		}
 
 		igt_describe("Test OA TLB invalidate");
-		igt_subtest("gen12-oa-tlb-invalidate")
-			gen12_test_oa_tlb_invalidate();
+		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate")
+			__for_each_perf_enabled_engine(drm_fd, e)
+				gen12_test_oa_tlb_invalidate(e);
 
 		igt_describe("Measure performance for a specific context using OAR in Gen 12");
-		igt_subtest("gen12-unprivileged-single-ctx-counters") {
+		igt_subtest_with_dynamic("gen12-unprivileged-single-ctx-counters") {
+			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			igt_require_f(render_copy, "no render-copy function\n");
-			gen12_test_single_ctx_render_target_writes_a_counter();
+			__for_each_render_engine(drm_fd, e)
+				gen12_test_single_ctx_render_target_writes_a_counter(e);
 		}
 	}
 
@@ -5358,8 +5495,9 @@ igt_main
 		test_rc6_disable();
 
 	igt_describe("Stress tests opening & closing the i915-perf stream in a busy loop");
-	igt_subtest("stress-open-close")
-		test_stress_open_close();
+	igt_subtest_with_dynamic("stress-open-close")
+		__for_each_perf_enabled_engine(drm_fd, e)
+			test_stress_open_close(e);
 
 	igt_subtest_group {
 		igt_fixture {
@@ -5368,12 +5506,14 @@ igt_main
 		}
 
 		igt_describe("Verify invalid SSEU opening parameters");
-		igt_subtest("global-sseu-config-invalid")
-			test_global_sseu_config_invalid();
+		igt_subtest_with_dynamic("global-sseu-config-invalid")
+			__for_each_perf_enabled_engine(drm_fd, e)
+				test_global_sseu_config_invalid(e);
 
 		igt_describe("Verify specifying SSEU opening parameters");
-		igt_subtest("global-sseu-config")
-			test_global_sseu_config();
+		igt_subtest_with_dynamic("global-sseu-config")
+			__for_each_perf_enabled_engine(drm_fd, e)
+				test_global_sseu_config(e);
 	}
 
 	igt_subtest("invalid-create-userspace-config")
-- 
2.36.1
