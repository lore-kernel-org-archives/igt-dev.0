Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5AC10E200
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 20:07:18 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Oct 2022 20:06:52 +0000
Message-Id: <20221025200709.83314-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
References: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 12/29] i915/perf: Add OA formats for DG2
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

Add OA formats for DG2.

v2:
- 40-bit A counter accumulation was broken due to incorrect DG2 format
  definition. Introduce first_a40 to fix the sanity check.
- Drop 64-bit OA formats
- Set the correct OAR format for mi-rpc

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com> #v1
---
 include/drm-uapi/i915_drm.h |  4 +++
 tests/i915/perf.c           | 50 +++++++++++++++++++++++++++++++------
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index ae9558b3..70700c7d 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2535,6 +2535,10 @@ enum drm_i915_oa_format {
 	I915_OA_FORMAT_A12_B8_C8,
 	I915_OA_FORMAT_A32u40_A4u32_B8_C8,
 
+	/* DG2 */
+	I915_OAR_FORMAT_A32u40_A4u32_B8_C8,
+	I915_OA_FORMAT_A24u40_A14u32_B8_C8,
+
 	I915_OA_FORMAT_MAX	    /* non-ABI */
 };
 
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 6079d1b1..6652c218 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -110,6 +110,7 @@ struct oa_format {
 	int a_off;
 	int n_a;
 	int first_a;
+	int first_a40;
 	int b_off;
 	int n_b;
 	int c_off;
@@ -179,6 +180,26 @@ static struct oa_format gen12_oa_formats[I915_OA_FORMAT_MAX] = {
 		.c_off = 224, .n_c = 8, },
 };
 
+static struct oa_format dg2_oa_formats[I915_OA_FORMAT_MAX] = {
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
+};
+
 static bool hsw_undefined_a_counters[45] = {
 	[4] = true,
 	[6] = true,
@@ -237,6 +258,8 @@ get_oa_format(enum drm_i915_oa_format format)
 {
 	if (IS_HASWELL(devid))
 		return hsw_oa_formats[format];
+	else if (IS_DG2(devid))
+		return dg2_oa_formats[format];
 	else if (IS_GEN12(devid))
 		return gen12_oa_formats[format];
 	else
@@ -509,6 +532,15 @@ oa_report_get_ctx_id(uint32_t *report)
 	return report[2];
 }
 
+static int
+oar_unit_default_format(void)
+{
+	if (IS_DG2(devid))
+		return I915_OAR_FORMAT_A32u40_A4u32_B8_C8;
+
+	return test_set->perf_oa_format;
+}
+
 /*
  * Temporary wrapper to distinguish mappings on !llc platforms,
  * where it seems cache over GEM_MMAP_OFFSET is not flushed before execution.
@@ -802,7 +834,7 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 	max_delta = clock_delta * intel_perf->devinfo.n_eus;
 
 	/* Gen8+ has some 40bit A counters... */
-	for (int j = 0; j < format.n_a40; j++) {
+	for (int j = format.first_a40; j < format.n_a40 + format.first_a40; j++) {
 		uint64_t value0 = gen8_read_40bit_a_counter(oa_report0, fmt, j);
 		uint64_t value1 = gen8_read_40bit_a_counter(oa_report1, fmt, j);
 		uint64_t delta = gen8_40bit_a_delta(value0, value1);
@@ -1260,7 +1292,7 @@ read_2_oa_reports(int format_id,
 			igt_assert_eq(header->size, sample_size);
 
 			report = (const void *)(header + 1);
-			dump_report(report, 64, "oa-formats");
+			dump_report(report, format_size / 4, "oa-formats");
 
 			igt_debug("read report: reason = %x, timestamp = %x, exponent mask=%x\n",
 				  report[0], report[1], exponent_mask);
@@ -1484,8 +1516,8 @@ test_oa_formats(void)
 {
 	for (int i = 0; i < I915_OA_FORMAT_MAX; i++) {
 		struct oa_format format = get_oa_format(i);
-		uint32_t oa_report0[64];
-		uint32_t oa_report1[64];
+		uint32_t oa_report0[format.size / 4];
+		uint32_t oa_report1[format.size / 4];
 
 		if (!format.name) /* sparse, indexed by ID */
 			continue;
@@ -3016,6 +3048,7 @@ test_disabled_read_error(void)
 static void
 gen12_test_mi_rpc(void)
 {
+	uint64_t fmt = oar_unit_default_format();
 	uint64_t properties[] = {
 		/* On Gen12, MI RPC uses OAR. OAR is configured only for the
 		 * render context that wants to measure the performance. Hence a
@@ -3036,7 +3069,7 @@ gen12_test_mi_rpc(void)
 		 * values.
 		 */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
@@ -3050,7 +3083,7 @@ gen12_test_mi_rpc(void)
 	uint32_t ctx_id = INVALID_CTX_ID;
 	uint32_t *report32;
 	size_t format_size_32;
-	struct oa_format format = get_oa_format(test_set->perf_oa_format);
+	struct oa_format format = get_oa_format(fmt);
 
 	/* Ensure perf_stream_paranoid is set to 1 by default */
 	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
@@ -3865,6 +3898,7 @@ again:
 
 static void gen12_single_ctx_helper(void)
 {
+	uint64_t fmt = oar_unit_default_format();
 	uint64_t properties[] = {
 		/* Have a random value here for the context id, but initialize
 		 * it once you figure out the context ID for the work to be
@@ -3880,7 +3914,7 @@ static void gen12_single_ctx_helper(void)
 		 * values.
 		 */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
@@ -3903,7 +3937,7 @@ static void gen12_single_ctx_helper(void)
 	uint32_t ctx1_id = INVALID_CTX_ID;
 	int ret;
 	struct accumulator accumulator = {
-		.format = test_set->perf_oa_format
+		.format = fmt
 	};
 
 	bops = buf_ops_create(drm_fd);
-- 
2.25.1
