Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E098C10E99F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 12:59:51 -0800
Message-Id: <20230214210007.2026033-15-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 14/30] i915/perf: Add OAM support
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

Add OAM formats and support for media engines in perf tests

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h |   4 ++
 lib/intel_chipset.h         |   3 +
 lib/intel_device_info.c     |   1 +
 tests/i915/perf.c           | 138 +++++++++++++++++++++++++-----------
 4 files changed, 105 insertions(+), 41 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 5fab3066..ab244346 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2545,6 +2545,10 @@ enum drm_i915_oa_format {
 	I915_OAR_FORMAT_A32u40_A4u32_B8_C8,
 	I915_OA_FORMAT_A24u40_A14u32_B8_C8,
 
+	/* MTL OAM */
+	I915_OAM_FORMAT_MPEC8u64_B8_C8,
+	I915_OAM_FORMAT_MPEC8u32_B8_C8,
+
 	I915_OA_FORMAT_MAX	    /* non-ABI */
 };
 
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index c9762ae6..c2c8998d 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -45,6 +45,7 @@ struct intel_device_info {
 	unsigned gt; /* 0 if unknown */
 	bool has_4tile : 1;
 	bool has_flatccs : 1;
+	bool has_oam : 1;
 	bool is_mobile : 1;
 	bool is_whitney : 1;
 	bool is_almador : 1;
@@ -231,4 +232,6 @@ void intel_check_pch(void);
 
 #define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
 
+#define HAS_OAM(devid)		(intel_get_device_info(devid)->has_oam)
+
 #endif /* _INTEL_CHIPSET_H */
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 12b81d48..0b11dfce 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -472,6 +472,7 @@ static const struct intel_device_info intel_meteorlake_info = {
 	.graphics_rel = 70,
 	.display_ver = 14,
 	.has_4tile = true,
+	.has_oam = true,
 	.is_meteorlake = true,
 	.codename = "meteorlake",
 	.cmds_info = &gen12_mtl_cmds_info,
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index b9422964..f5d0726b 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -212,6 +212,40 @@ static struct oa_format dg2_oa_formats[I915_OA_FORMAT_MAX] = {
 		.c_off = 224, .n_c = 8, .oa_type = OAG, },
 };
 
+static struct oa_format mtl_oa_formats[I915_OA_FORMAT_MAX] = {
+	[I915_OAR_FORMAT_A32u40_A4u32_B8_C8] = {
+		"A32u40_A4u32_B8_C8", .size = 256,
+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 32,
+		.a_off = 144, .n_a = 4, .first_a = 32,
+		.b_off = 192, .n_b = 8,
+		.c_off = 224, .n_c = 8, .oa_type = OAR, },
+	/* This format has A36 and A37 interleaved with high bytes of some A
+	 * counters, so we will accumulate only subset of counters.
+	 */
+	[I915_OA_FORMAT_A24u40_A14u32_B8_C8] = {
+		"A24u40_A14u32_B8_C8", .size = 256,
+		/* u40: A4 - A23 */
+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 20, .first_a40 = 4,
+		/* u32: A0 - A3 */
+		.a_off = 16, .n_a = 4,
+		.b_off = 192, .n_b = 8,
+		.c_off = 224, .n_c = 8, .oa_type = OAG, },
+
+	/* Treat MPEC countes as A counters for now */
+	[I915_OAM_FORMAT_MPEC8u64_B8_C8] = {
+		"MPEC8u64_B8_C8", .size = 192,
+		.a64_off = 32, .n_a64 = 8,
+		.b_off = 96, .n_b = 8,
+		.c_off = 128, .n_c = 8, .oa_type = OAM,
+		.report_hdr_64bit = true, },
+	[I915_OAM_FORMAT_MPEC8u32_B8_C8] = {
+		"MPEC8u32_B8_C8", .size = 128,
+		.a_off = 32, .n_a = 8,
+		.b_off = 64, .n_b = 8,
+		.c_off = 96, .n_c = 8, .oa_type = OAM,
+		.report_hdr_64bit = true, },
+};
+
 static bool hsw_undefined_a_counters[45] = {
 	[4] = true,
 	[6] = true,
@@ -273,8 +307,10 @@ get_oa_format(enum drm_i915_oa_format format)
 {
 	if (IS_HASWELL(devid))
 		return hsw_oa_formats[format];
-	else if (IS_DG2(devid) || IS_METEORLAKE(devid))
+	else if (IS_DG2(devid))
 		return dg2_oa_formats[format];
+	else if (IS_METEORLAKE(devid))
+		return mtl_oa_formats[format];
 	else if (IS_GEN12(devid))
 		return gen12_oa_formats[format];
 	else
@@ -356,21 +392,6 @@ static int i915_perf_revision(int fd)
 	return value;
 }
 
-/*
- * perf_supports_engine is used in the for loop that iterates over engines and
- * determines if perf test can be run on a particular engine. For perf revisions
- * below 10, we only need to run the test once, so we return true only for rcs0.
- * Note that the test itself ignores the class instance parameters if they are
- * not supported by the perf interface. This enables us to use a single for-loop
- * construct to run the same test on all platforms and all perf revisions.
- */
-static bool
-perf_supports_engine(const struct intel_execution_engine2 *e)
-{
-	return e->class == I915_ENGINE_CLASS_RENDER &&
-	       e->instance == 0;
-}
-
 static bool
 has_param_class_instance(void)
 {
@@ -674,8 +695,12 @@ oar_unit_default_format(void)
 }
 
 static int
-oa_unit_default_format(void)
+oa_unit_default_format(const struct intel_execution_engine2 *e)
 {
+	if (e->class == I915_ENGINE_CLASS_VIDEO ||
+	    e->class == I915_ENGINE_CLASS_VIDEO_ENHANCE)
+		return I915_OAM_FORMAT_MPEC8u32_B8_C8;
+
 	return test_set->perf_oa_format;
 }
 
@@ -1752,6 +1777,20 @@ print_report(uint32_t *report, int fmt)
 }
 #endif
 
+static bool
+oa_unit_supports_engine(int oa_unit, const struct intel_execution_engine2 *e)
+{
+	switch (oa_unit) {
+	case OAM:
+		return e->class == I915_ENGINE_CLASS_VIDEO ||
+		       e->class == I915_ENGINE_CLASS_VIDEO_ENHANCE;
+	case OAG:
+		return e->class == I915_ENGINE_CLASS_RENDER;
+	}
+
+	return false;
+}
+
 static void
 test_oa_formats(const struct intel_execution_engine2 *e)
 {
@@ -1763,7 +1802,7 @@ test_oa_formats(const struct intel_execution_engine2 *e)
 		if (!format.name) /* sparse, indexed by ID */
 			continue;
 
-		if (format.oa_type != OAG) /* sparse, indexed by ID */
+		if (!oa_unit_supports_engine(format.oa_type, e))
 			continue;
 
 		igt_debug("Checking OA format %s\n", format.name);
@@ -1922,7 +1961,7 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
 static void
 test_oa_exponents(const struct intel_execution_engine2 *e)
 {
-	uint64_t fmt = oa_unit_default_format();
+	uint64_t fmt = oa_unit_default_format(e);
 
 	load_helper_init();
 	load_helper_run(HIGH);
@@ -2264,7 +2303,7 @@ test_blocking(uint64_t requested_oa_period,
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format());
+	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format(e));
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2427,7 +2466,7 @@ test_polling(uint64_t requested_oa_period,
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRICS_SET, test_set->perf_oa_metrics_set);
-	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format());
+	ADD_PROPS(props, idx, OA_FORMAT, oa_unit_default_format(e));
 	ADD_PROPS(props, idx, OA_EXPONENT, oa_exponent);
 
 	if (has_param_poll_period() && set_kernel_hrtimer)
@@ -2701,7 +2740,7 @@ gen12_test_oa_tlb_invalidate(const struct intel_execution_engine2 *e)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -2744,7 +2783,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = oa_unit_default_format();
+	uint64_t fmt = oa_unit_default_format(e);
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -2980,7 +3019,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	uint64_t fmt = oa_unit_default_format();
+	uint64_t fmt = oa_unit_default_format(e);
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
@@ -4575,7 +4614,7 @@ test_stress_open_close(const struct intel_execution_engine2 *e)
 
 			/* OA unit configuration */
 			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-			DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
+			DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 			DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 			DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -4678,7 +4717,7 @@ test_global_sseu_config_invalid(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
@@ -4767,7 +4806,7 @@ test_global_sseu_config(const struct intel_execution_engine2 *e)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(),
+		DRM_I915_PERF_PROP_OA_FORMAT, oa_unit_default_format(e),
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
@@ -5304,10 +5343,27 @@ test_sysctl_defaults(void)
 	igt_assert_eq(max_freq, 100000);
 }
 
-#define __for_each_perf_enabled_engine(fd__, e__) \
-	for_each_physical_engine(fd__, e__) \
-		if (perf_supports_engine(e__)) \
-			igt_dynamic_f("%s", e__->name)
+static struct intel_execution_engine2 *
+__ci_to_e2(const intel_ctx_t *ctx, struct i915_engine_class_instance *ci)
+{
+	static struct intel_execution_engine2 e2;
+	struct intel_execution_engine2 *e;
+
+	for_each_ctx_engine(drm_fd, ctx, e) {
+		if (e->class == ci->engine_class && e->instance == ci->engine_instance) {
+			e2 = *e;
+			break;
+		}
+	}
+
+	return &e2;
+}
+
+#define __for_random_engine_in_each_group(groups_, ctx_, e_) \
+	for (int i_ = 0; \
+	     i_ < num_perf_oa_groups && !!(e_ = __ci_to_e2(ctx_, random_engine(&groups_[i_]))); \
+	     i_++) \
+		igt_dynamic_f("%d-%s", i_, e_->name)
 
 #define __for_each_render_engine(fd__, e__) \
 	for_each_physical_engine(fd__, e__) \
@@ -5682,7 +5738,7 @@ igt_main
 		test_missing_sample_flags();
 
 	igt_subtest_with_dynamic("oa-formats")
-		__for_each_perf_enabled_engine(drm_fd, e)
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_oa_formats(e);
 
 	igt_subtest("invalid-oa-exponent")
@@ -5690,7 +5746,7 @@ igt_main
 	igt_subtest("low-oa-exponent-permissions")
 		test_low_oa_exponent_permissions();
 	igt_subtest_with_dynamic("oa-exponents")
-		__for_each_perf_enabled_engine(drm_fd, e)
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_oa_exponents(e);
 
 	igt_subtest("per-context-mode-unprivileged") {
@@ -5699,7 +5755,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("buffer-fill")
-		__for_each_perf_enabled_engine(drm_fd, e)
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_buffer_fill(e);
 
 	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
@@ -5715,12 +5771,12 @@ igt_main
 		test_non_sampling_read_error();
 
 	igt_subtest_with_dynamic("enable-disable")
-		__for_each_perf_enabled_engine(drm_fd, e)
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_enable_disable(e);
 
 	igt_describe("Test blocking read with default hrtimer frequency");
 	igt_subtest_with_dynamic("blocking") {
-		__for_each_perf_enabled_engine(drm_fd, e)
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
 				      false /* set_kernel_hrtimer */,
 				      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
@@ -5748,7 +5804,7 @@ igt_main
 
 	igt_describe("Test polled read with default hrtimer frequency");
 	igt_subtest_with_dynamic("polling") {
-		__for_each_perf_enabled_engine(drm_fd, e)
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
 				     false /* set_kernel_hrtimer */,
 				     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
@@ -5818,7 +5874,7 @@ igt_main
 
 		igt_describe("Test OA TLB invalidate");
 		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate")
-			__for_each_perf_enabled_engine(drm_fd, e)
+			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				gen12_test_oa_tlb_invalidate(e);
 
 		igt_describe("Measure performance for a specific context using OAR in Gen 12");
@@ -5855,7 +5911,7 @@ igt_main
 
 	igt_describe("Stress tests opening & closing the i915-perf stream in a busy loop");
 	igt_subtest_with_dynamic("stress-open-close")
-		__for_each_perf_enabled_engine(drm_fd, e)
+		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_stress_open_close(e);
 
 	igt_subtest_group {
@@ -5866,12 +5922,12 @@ igt_main
 
 		igt_describe("Verify invalid SSEU opening parameters");
 		igt_subtest_with_dynamic("global-sseu-config-invalid")
-			__for_each_perf_enabled_engine(drm_fd, e)
+			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config_invalid(e);
 
 		igt_describe("Verify specifying SSEU opening parameters");
 		igt_subtest_with_dynamic("global-sseu-config")
-			__for_each_perf_enabled_engine(drm_fd, e)
+			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config(e);
 	}
 
-- 
2.36.1
