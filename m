Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0413911A232
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:44 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:26 +0000
Message-Id: <20220823183036.5270-14-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 13/23] i915/perf: Add OA formats for DG2
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h |  6 ++++++
 tests/i915/perf.c           | 38 ++++++++++++++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index b4efc96c..c7587a0f 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2535,6 +2535,12 @@ enum drm_i915_oa_format {
 	I915_OA_FORMAT_A12_B8_C8,
 	I915_OA_FORMAT_A32u40_A4u32_B8_C8,
 
+	/* DG2 */
+	I915_OAR_FORMAT_A32u40_A4u32_B8_C8,
+	I915_OA_FORMAT_A24u40_A14u32_B8_C8,
+	I915_OAR_FORMAT_A36u64_B8_C8,
+	I915_OA_FORMAT_A38u64_R2u64_B8_C8,
+
 	I915_OA_FORMAT_MAX	    /* non-ABI */
 };
 
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 85f3c5de..d601eb36 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -181,6 +181,36 @@ static struct oa_format gen12_oa_formats[I915_OA_FORMAT_MAX] = {
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
+		.a40_high_off = 164, .a40_low_off = 32, .n_a40 = 20,
+		/* u32: A24 - A27 */
+		.a_off = 144, .n_a = 4, .first_a = 24,
+		.b_off = 192, .n_b = 8,
+		.c_off = 224, .n_c = 8, .oa_type = OAG, },
+	[I915_OA_FORMAT_A38u64_R2u64_B8_C8] = {
+		"A38u64_R2u64_B8_C8", .size = 448,
+		.a64_off = 32, .n_a64 = 38,
+		.b_off = 352, .n_b = 8,
+		.c_off = 384, .n_c = 8, .oa_type = OAG, },
+	[I915_OAR_FORMAT_A36u64_B8_C8] = {
+		"A36u64_B8_C8", .size = 384,
+		.a64_off = 32, .n_a64 = 36,
+		.b_off = 320, .n_b = 8,
+		.c_off = 352, .n_c = 8, .oa_type = OAR, },
+};
+
 static bool hsw_undefined_a_counters[45] = {
 	[4] = true,
 	[6] = true,
@@ -239,6 +269,8 @@ get_oa_format(enum drm_i915_oa_format format)
 {
 	if (IS_HASWELL(devid))
 		return hsw_oa_formats[format];
+	else if (IS_DG2(devid))
+		return dg2_oa_formats[format];
 	else if (IS_GEN12(devid))
 		return gen12_oa_formats[format];
 	else
@@ -1304,7 +1336,7 @@ read_2_oa_reports(int format_id,
 			igt_assert_eq(header->size, sample_size);
 
 			report = (const void *)(header + 1);
-			dump_report(report, 64, "oa-formats");
+			dump_report(report, format_size / 4, "oa-formats");
 
 			igt_debug("read report: reason = %x, timestamp = %x, exponent mask=%x\n",
 				  report[0], report[1], exponent_mask);
@@ -1540,8 +1572,8 @@ test_oa_formats(void)
 {
 	for (int i = 0; i < I915_OA_FORMAT_MAX; i++) {
 		struct oa_format format = get_oa_format(i);
-		uint32_t oa_report0[64];
-		uint32_t oa_report1[64];
+		uint32_t oa_report0[format.size / 4];
+		uint32_t oa_report1[format.size / 4];
 
 		if (!format.name) /* sparse, indexed by ID */
 			continue;
-- 
2.25.1
