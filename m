Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EF610E299
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 00:05:28 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Tue, 21 Mar 2023 17:05:01 -0700
Message-Id: <20230322000523.3310187-10-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 09/31] i915/perf: Treat timestamp as 64
 bit value
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

New OA formats in MTL have 64 bit OA report header. Update the timestamp
in the tests to be default 64 bit.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/perf.c | 156 +++++++++++++++++++++++++++-------------------
 1 file changed, 93 insertions(+), 63 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 6b76e35c..d116667d 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -539,9 +539,28 @@ cs_timebase_scale(uint32_t u32_delta)
 }
 
 static uint64_t
-timebase_scale(uint32_t u32_delta)
+oa_timestamp(const uint32_t *report, enum drm_i915_oa_format format)
 {
-	return ((uint64_t)u32_delta * NSEC_PER_SEC) / intel_perf->devinfo.timestamp_frequency;
+	struct oa_format fmt = get_oa_format(format);
+
+	return fmt.report_hdr_64bit ? *(uint64_t *)&report[2] : report[1];
+}
+
+static uint64_t
+oa_timestamp_delta(const uint32_t *report1,
+		   const uint32_t *report0,
+		   enum drm_i915_oa_format format)
+{
+	uint32_t width = intel_graphics_ver(devid) >= IP_VER(12, 55) ? 56 : 32;
+
+	return elapsed_delta(oa_timestamp(report1, format),
+			     oa_timestamp(report0, format), width);
+}
+
+static uint64_t
+timebase_scale(uint64_t delta)
+{
+	return (delta * NSEC_PER_SEC) / intel_perf->devinfo.timestamp_frequency;
 }
 
 /* Returns: the largest OA exponent that will still result in a sampling period
@@ -550,7 +569,7 @@ timebase_scale(uint32_t u32_delta)
 static int
 max_oa_exponent_for_period_lte(uint64_t period)
 {
-	/* NB: timebase_scale() takes a uint32_t and an exponent of 30
+	/* NB: timebase_scale() takes a uint64_t and an exponent of 30
 	 * would already represent a period of ~3 minutes so there's
 	 * really no need to consider higher exponents.
 	 */
@@ -699,12 +718,14 @@ hsw_sanity_check_render_basic_reports(const uint32_t *oa_report0,
 				      const uint32_t *oa_report1,
 				      enum drm_i915_oa_format fmt)
 {
-	uint32_t time_delta = timebase_scale(oa_report1[1] - oa_report0[1]);
+	uint64_t time_delta = timebase_scale(oa_timestamp_delta(oa_report1,
+								oa_report0,
+								fmt));
 	uint64_t clock_delta;
 	uint64_t max_delta;
 	struct oa_format format = get_oa_format(fmt);
 
-	igt_assert_neq(time_delta, 0);
+	igt_assert_neq_u64(time_delta, 0);
 
 	/* As a special case we have to consider that on Haswell we
 	 * can't explicitly derive a clock delta for all OA report
@@ -713,8 +734,7 @@ hsw_sanity_check_render_basic_reports(const uint32_t *oa_report0,
 	if (format.n_c == 0) {
 		/* Assume running at max freq for sake of
 		 * below sanity check on counters... */
-		clock_delta = (gt_max_freq_mhz *
-			       (uint64_t)time_delta) / 1000;
+		clock_delta = (gt_max_freq_mhz * time_delta) / 1000;
 	} else {
 		uint64_t freq;
 
@@ -858,7 +878,8 @@ accumulate_reports(struct accumulator *accumulator,
 
 	if (intel_gen(devid) >= 8) {
 		/* timestamp */
-		accumulate_uint32(4, start, end, deltas + idx++);
+		deltas[idx] += oa_timestamp_delta(end, start, accumulator->format);
+		idx++;
 
 		/* clock cycles */
 		deltas[idx] += oa_tick_delta(end, start, accumulator->format);
@@ -934,7 +955,9 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 				  enum drm_i915_oa_format fmt)
 {
 	struct oa_format format = get_oa_format(fmt);
-	uint32_t time_delta = timebase_scale(oa_report1[1] - oa_report0[1]);
+	uint64_t time_delta = timebase_scale(oa_timestamp_delta(oa_report1,
+								oa_report0,
+								fmt));
 	uint64_t clock_delta = oa_tick_delta(oa_report1, oa_report0, fmt);
 	uint64_t max_delta;
 	uint64_t freq;
@@ -1122,11 +1145,11 @@ static int
 i915_read_reports_until_timestamp(enum drm_i915_oa_format oa_format,
 				  uint8_t *buf,
 				  uint32_t max_size,
-				  uint32_t start_timestamp,
-				  uint32_t end_timestamp)
+				  uint64_t start_timestamp,
+				  uint64_t end_timestamp)
 {
 	size_t format_size = get_oa_format(oa_format).size;
-	uint32_t last_seen_timestamp = start_timestamp;
+	uint64_t last_seen_timestamp = start_timestamp;
 	int total_len = 0;
 
 	while (last_seen_timestamp < end_timestamp) {
@@ -1135,7 +1158,7 @@ i915_read_reports_until_timestamp(enum drm_i915_oa_format oa_format,
 		/* Running out of space. */
 		if ((max_size - total_len) < format_size) {
 			igt_warn("run out of space before reaching "
-				 "end timestamp (%u/%u)\n",
+				 "end timestamp (%"PRIu64"/%"PRIu64")\n",
 				 last_seen_timestamp, end_timestamp);
 			return -1;
 		}
@@ -1164,7 +1187,7 @@ i915_read_reports_until_timestamp(enum drm_i915_oa_format oa_format,
 			uint32_t *report = (uint32_t *) (header + 1);
 
 			if (header->type == DRM_I915_PERF_RECORD_SAMPLE)
-				last_seen_timestamp = report[1];
+				last_seen_timestamp = oa_timestamp(report, oa_format);
 
 			offset += header->size;
 		}
@@ -1470,11 +1493,11 @@ read_2_oa_reports(int format_id,
 			report = (const void *)(header + 1);
 			dump_report(report, format_size / 4, "oa-formats");
 
-			igt_debug("read report: reason = %x, timestamp = %x, exponent mask=%x\n",
-				  report[0], report[1], exponent_mask);
+			igt_debug("read report: reason = %x, timestamp = %"PRIx64", exponent mask=%x\n",
+				  report[0], oa_timestamp(report, format_id), exponent_mask);
 
 			/* Don't expect zero for timestamps */
-			igt_assert_neq(report[1], 0);
+			igt_assert_neq_u64(oa_timestamp(report, format_id), 0);
 
 			if (timer_only) {
 				if (!oa_report_is_periodic(exponent, report)) {
@@ -1538,9 +1561,11 @@ static void
 print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 {
 	struct oa_format format = get_oa_format(fmt);
+	uint64_t ts0 = oa_timestamp(oa_report0, fmt);
+	uint64_t ts1 = oa_timestamp(oa_report1, fmt);
 
-	igt_debug("TIMESTAMP: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
-		  oa_report0[1], oa_report1[1], oa_report1[1] - oa_report0[1]);
+	igt_debug("TIMESTAMP: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
+		  ts0, ts1, ts1 - ts0);
 
 	if (IS_HASWELL(devid) && format.n_c == 0) {
 		igt_debug("CLOCK = N/A\n");
@@ -1645,7 +1670,7 @@ print_report(uint32_t *report, int fmt)
 {
 	struct oa_format format = get_oa_format(fmt);
 
-	igt_debug("TIMESTAMP: %"PRIu32"\n", report[1]);
+	igt_debug("TIMESTAMP: %"PRIu64"\n", oa_timestamp(report, fmt));
 
 	if (IS_HASWELL(devid) && format.n_c == 0) {
 		igt_debug("CLOCK = N/A\n");
@@ -1874,6 +1899,8 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
 static void
 test_oa_exponents(const struct intel_execution_engine2 *e)
 {
+	uint64_t fmt = test_set->perf_oa_format;
+
 	load_helper_init();
 	load_helper_run(HIGH);
 
@@ -1888,7 +1915,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 
 			/* OA unit configuration */
 			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+			DRM_I915_PERF_PROP_OA_FORMAT, fmt,
 			DRM_I915_PERF_PROP_OA_EXPONENT, exponent,
 			DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 			DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -1901,7 +1928,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 			.properties_ptr = to_user_pointer(properties),
 		};
 		uint64_t expected_timestamp_delta = 2ULL << exponent;
-		size_t format_size = get_oa_format(test_set->perf_oa_format).size;
+		size_t format_size = get_oa_format(fmt).size;
 		size_t sample_size = (sizeof(struct drm_i915_perf_record_header) +
 				      format_size);
 		int max_reports = MAX_OA_BUF_SIZE / format_size;
@@ -1965,15 +1992,16 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 
 		__perf_close(stream_fd);
 
-		igt_debug("report%04i ts=%08x hw_id=0x%08x\n", 0,
-			  timer_reports[0].report[1],
+		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
+			  oa_timestamp(timer_reports[0].report, fmt),
 			  oa_report_get_ctx_id(timer_reports[0].report));
 		for (int i = 1; i < n_timer_reports; i++) {
-			uint32_t delta =
-				timer_reports[i].report[1] - timer_reports[i - 1].report[1];
+			uint64_t delta = oa_timestamp_delta(timer_reports[i].report,
+							    timer_reports[i - 1].report,
+							    fmt);
 
-			igt_debug("report%04i ts=%08x hw_id=0x%08x delta=%u %s\n", i,
-				  timer_reports[i].report[1],
+			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
+				  oa_timestamp(timer_reports[i].report, fmt),
 				  oa_report_get_ctx_id(timer_reports[i].report),
 				  delta, expected_report_timing_delta(delta,
 								      expected_timestamp_delta) ? "" : "******");
@@ -2692,13 +2720,14 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -2715,7 +2744,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 	uint8_t *buf = malloc(buf_size);
 	int len;
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	size_t report_size = get_oa_format(test_set->perf_oa_format).size;
+	size_t report_size = get_oa_format(fmt).size;
 	int n_full_oa_reports = oa_buf_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 
@@ -2790,17 +2819,17 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 					igt_debug("report loss, trying again\n");
 					break;
 				case DRM_I915_PERF_RECORD_SAMPLE:
-					igt_debug(" > report ts=%u"
-						  " ts_delta_last_periodic=%8u is_timer=%i ctx_id=%8x nb_periodic=%u\n",
-						  report[1],
-						  n_periodic_reports > 0 ? report[1] - last_periodic_report[1] : 0,
+					igt_debug(" > report ts=%"PRIu64""
+						  " ts_delta_last_periodic=%"PRIu64" is_timer=%i ctx_id=%8x nb_periodic=%u\n",
+						  oa_timestamp(report, fmt),
+						  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
 						  oa_report_is_periodic(oa_exponent, report),
 						  oa_report_get_ctx_id(report),
 						  n_periodic_reports);
 
 					if (first_timestamp == 0)
-						first_timestamp = report[1];
-					last_timestamp = report[1];
+						first_timestamp = oa_timestamp(report, fmt);
+					last_timestamp = oa_timestamp(report, fmt);
 
 					if (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2))
 						break;
@@ -2927,13 +2956,14 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
 		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
@@ -2949,7 +2979,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
 	uint8_t *buf = malloc(buf_size);
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	size_t report_size = get_oa_format(test_set->perf_oa_format).size;
+	size_t report_size = get_oa_format(fmt).size;
 	int n_full_oa_reports = oa_buf_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 
@@ -2962,7 +2992,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 		int len;
 		uint32_t n_periodic_reports;
 		struct drm_i915_perf_record_header *header;
-		uint32_t first_timestamp = 0, last_timestamp = 0;
+		uint64_t first_timestamp = 0, last_timestamp = 0;
 		uint32_t last_periodic_report[64];
 
 		/* Giving enough time for an overflow might help catch whether
@@ -3009,15 +3039,15 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 					break;
 				case DRM_I915_PERF_RECORD_SAMPLE:
 					if (first_timestamp == 0)
-						first_timestamp = report[1];
-					last_timestamp = report[1];
+						first_timestamp = oa_timestamp(report, fmt);
+					last_timestamp = oa_timestamp(report, fmt);
 
-					igt_debug(" > report ts=%8x"
-						  " ts_delta_last_periodic=%s%8u"
+					igt_debug(" > report ts=%"PRIx64""
+						  " ts_delta_last_periodic=%s%"PRIu64""
 						  " is_timer=%i ctx_id=0x%8x\n",
-						  report[1],
+						  oa_timestamp(report, fmt),
 						  oa_report_is_periodic(oa_exponent, report) ? " " : "*",
-						  n_periodic_reports > 0 ? (report[1] - last_periodic_report[1]) : 0,
+						  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
 						  oa_report_is_periodic(oa_exponent, report),
 						  oa_report_get_ctx_id(report));
 
@@ -3047,7 +3077,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 
 		do_ioctl(stream_fd, I915_PERF_IOCTL_DISABLE, 0);
 
-		igt_debug("first ts = %u, last ts = %u\n", first_timestamp, last_timestamp);
+		igt_debug("first ts = %lu, last ts = %lu\n", first_timestamp, last_timestamp);
 
 		igt_debug("%f < %zu < %f\n",
 			  report_size * n_full_oa_reports * 0.45,
@@ -3353,7 +3383,7 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 	 * size amount of data was written.
 	 */
 	igt_assert_eq(report32[0], REPORT_ID);
-	igt_assert_neq(report32[1], 0);
+	igt_assert(oa_timestamp(report32, test_set->perf_oa_format));
 	igt_assert_neq(report32[format.b_off >> 2], 0x80808080);
 	igt_assert_eq(report32[format_size_32], 0x80808080);
 
@@ -3414,7 +3444,7 @@ test_mi_rpc(void)
 	report32 = buf->ptr;
 	dump_report(report32, 64, "mi-rpc");
 	igt_assert_eq(report32[0], 0xdeadbeef); /* report ID */
-	igt_assert_neq(report32[1], 0); /* timestamp */
+	igt_assert(oa_timestamp(report32, test_set->perf_oa_format)); /* timestamp */
 
 	igt_assert_neq(report32[63], 0x80808080); /* end of report */
 	igt_assert_eq(report32[64], 0x80808080); /* after 256 byte report */
@@ -4153,9 +4183,9 @@ static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 	uint32_t context0_id, context1_id;
 	uint32_t *report0_32, *report1_32, *report2_32, *report3_32;
 	uint64_t timestamp0_64, timestamp1_64;
-	uint32_t delta_ts64, delta_oa32;
+	uint64_t delta_ts64, delta_oa32;
 	uint64_t delta_ts64_ns, delta_oa32_ns;
-	uint32_t delta_delta;
+	uint64_t delta_delta;
 	int width = 800;
 	int height = 600;
 #define INVALID_CTX_ID 0xffffffff
@@ -4310,14 +4340,14 @@ static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 	 */
 	report0_32 = dst_buf->ptr;
 	igt_assert_eq(report0_32[0], 0xdeadbeef);
-	igt_assert_neq(report0_32[1], 0);
+	igt_assert(oa_timestamp(report0_32, fmt));
 	ctx0_id = report0_32[2];
 	igt_debug("MI_RPC(start) CTX ID: %u\n", ctx0_id);
 	dump_report(report0_32, 64, "report0_32");
 
 	report1_32 = report0_32 + 64;
 	igt_assert_eq(report1_32[0], 0xbeefbeef);
-	igt_assert_neq(report1_32[1], 0);
+	igt_assert(oa_timestamp(report1_32, fmt));
 	ctx1_id = report1_32[2];
 	igt_debug("CTX ID1: %u\n", ctx1_id);
 	dump_report(report1_32, 64, "report1_32");
@@ -4325,7 +4355,7 @@ static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 	/* Verify that counters in context1 are all zeroes */
 	report2_32 = report0_32 + 128;
 	igt_assert_eq(report2_32[0], 0x00c0ffee);
-	igt_assert_neq(report2_32[1], 0);
+	igt_assert(oa_timestamp(report2_32, fmt));
 	dump_report(report2_32, 64, "report2_32");
 	igt_assert_eq(0, memcmp(&report2_32[4],
 				(uint8_t *) dst_buf->ptr + 2048,
@@ -4333,7 +4363,7 @@ static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 
 	report3_32 = report0_32 + 192;
 	igt_assert_eq(report3_32[0], 0x01c0ffee);
-	igt_assert_neq(report3_32[1], 0);
+	igt_assert(oa_timestamp(report3_32, fmt));
 	dump_report(report3_32, 64, "report3_32");
 	igt_assert_eq(0, memcmp(&report3_32[4],
 				(uint8_t *) dst_buf->ptr + 2048,
@@ -4347,8 +4377,8 @@ static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 			accumulator.deltas[2 + 21],
 			accumulator.deltas[2 + 26]);
 
-	igt_debug("oa_timestamp32 0 = %u\n", report0_32[1]);
-	igt_debug("oa_timestamp32 1 = %u\n", report1_32[1]);
+	igt_debug("oa_timestamp32 0 = %"PRIu64"\n", oa_timestamp(report0_32, fmt));
+	igt_debug("oa_timestamp32 1 = %"PRIu64"\n", oa_timestamp(report1_32, fmt));
 	igt_debug("ctx_id 0 = %u\n", report0_32[2]);
 	igt_debug("ctx_id 1 = %u\n", report1_32[2]);
 
@@ -4363,23 +4393,23 @@ static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 	igt_debug("ts_timestamp64 1 = %"PRIu64"\n", timestamp1_64);
 
 	delta_ts64 = timestamp1_64 - timestamp0_64;
-	delta_oa32 = report1_32[1] - report0_32[1];
+	delta_oa32 = oa_timestamp_delta(report1_32, report0_32, fmt);
 
 	/* Sanity check that we can pass the delta to timebase_scale */
-	igt_assert(delta_ts64 < UINT32_MAX);
 	delta_oa32_ns = timebase_scale(delta_oa32);
 	delta_ts64_ns = cs_timebase_scale(delta_ts64);
 
-	igt_debug("oa32 delta = %u, = %uns\n",
-			delta_oa32, (unsigned)delta_oa32_ns);
-	igt_debug("ts64 delta = %u, = %uns\n",
-			delta_ts64, (unsigned)delta_ts64_ns);
+	igt_debug("oa32 delta = %"PRIu64", = %"PRIu64"ns\n",
+			delta_oa32, delta_oa32_ns);
+	igt_debug("ts64 delta = %"PRIu64", = %"PRIu64"ns\n",
+			delta_ts64, delta_ts64_ns);
 
 	delta_delta = delta_ts64_ns > delta_oa32_ns ?
 		      (delta_ts64_ns - delta_oa32_ns) :
 		      (delta_oa32_ns - delta_ts64_ns);
 	if (delta_delta > 500) {
-		igt_debug("delta_delta exceeds margin, skipping..\n");
+		igt_debug("delta_delta = %"PRIu64". exceeds margin, skipping..\n",
+			  delta_delta);
 		exit(EAGAIN);
 	}
 
-- 
2.36.1
