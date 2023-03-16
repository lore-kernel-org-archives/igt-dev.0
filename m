Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FD810E24B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:29 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:33:00 -0700
Message-Id: <20230316233323.2638668-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 08/31] i915/perf: Treat ticks as 64 bit
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

To support 64 bit OA report headers, treat all ticks as 64 bits.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 79 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 25 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index d86a8d50..0fedd187 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -112,6 +112,7 @@ struct oa_format {
 	int c_off;
 	int n_c;
 	int oa_type;
+	bool report_hdr_64bit;
 };
 
 static struct oa_format hsw_oa_formats[I915_OA_FORMAT_MAX] = {
@@ -231,7 +232,7 @@ static bool *undefined_a_counters;
 static uint64_t oa_exp_1_millisec;
 
 static igt_render_copyfunc_t render_copy = NULL;
-static uint32_t (*read_report_ticks)(const uint32_t *report,
+static uint64_t (*read_report_ticks)(const uint32_t *report,
 				     enum drm_i915_oa_format format);
 static void (*sanity_check_reports)(const uint32_t *oa_report0,
 				    const uint32_t *oa_report1,
@@ -425,7 +426,7 @@ sysfs_read(enum i915_attr_id id)
  * C2 corresponds to a clock counter for the Haswell render basic metric set
  * but it's not included in all of the formats.
  */
-static uint32_t
+static uint64_t
 hsw_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
 {
 	uint32_t *c = (uint32_t *)(((uint8_t *)report) + get_oa_format(format).c_off);
@@ -435,10 +436,41 @@ hsw_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
 	return c[2];
 }
 
-static uint32_t
+static uint64_t
 gen8_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
 {
-	return report[3];
+
+	struct oa_format fmt = get_oa_format(format);
+
+	return fmt.report_hdr_64bit ? *(uint64_t *)&report[6] : report[3];
+}
+
+/*
+ * t0 is a value sampled before t1. width is number of bits used to represent
+ * t0/t1. Normally t1 is greater than t0. In cases where t1 < t0 use this
+ * helper. Since the size of t1/t0 is already 64 bits, no special handling is
+ * needed for width = 64.
+ */
+static uint64_t
+elapsed_delta(uint64_t t1, uint64_t t0, uint32_t width)
+{
+	uint32_t max_bits = sizeof(t1) * 8;
+
+	igt_assert(width <= max_bits);
+
+	if (t1 < t0 && width != max_bits)
+		return ((1ULL << width) - t0) + t1;
+
+	return t1 - t0;
+}
+
+static uint64_t
+oa_tick_delta(const uint32_t *report1,
+	      const uint32_t *report0,
+	      enum drm_i915_oa_format format)
+{
+	return elapsed_delta(read_report_ticks(report1, format),
+			     read_report_ticks(report0, format), 32);
 }
 
 static void
@@ -668,8 +700,8 @@ hsw_sanity_check_render_basic_reports(const uint32_t *oa_report0,
 				      enum drm_i915_oa_format fmt)
 {
 	uint32_t time_delta = timebase_scale(oa_report1[1] - oa_report0[1]);
-	uint32_t clock_delta;
-	uint32_t max_delta;
+	uint64_t clock_delta;
+	uint64_t max_delta;
 	struct oa_format format = get_oa_format(fmt);
 
 	igt_assert_neq(time_delta, 0);
@@ -684,21 +716,19 @@ hsw_sanity_check_render_basic_reports(const uint32_t *oa_report0,
 		clock_delta = (gt_max_freq_mhz *
 			       (uint64_t)time_delta) / 1000;
 	} else {
-		uint32_t ticks0 = read_report_ticks(oa_report0, fmt);
-		uint32_t ticks1 = read_report_ticks(oa_report1, fmt);
 		uint64_t freq;
 
-		clock_delta = ticks1 - ticks0;
+		clock_delta = oa_tick_delta(oa_report1, oa_report0, fmt);
 
-		igt_assert_neq(clock_delta, 0);
+		igt_assert_neq_u64(clock_delta, 0);
 
-		freq = ((uint64_t)clock_delta * 1000) / time_delta;
+		freq = (clock_delta * 1000) / time_delta;
 		igt_debug("freq = %"PRIu64"\n", freq);
 
 		igt_assert(freq <= gt_max_freq_mhz);
 	}
 
-	igt_debug("clock delta = %"PRIu32"\n", clock_delta);
+	igt_debug("clock delta = %"PRIu64"\n", clock_delta);
 
 	/* The maximum rate for any HSW counter =
 	 *   clock_delta * N EUs
@@ -831,7 +861,8 @@ accumulate_reports(struct accumulator *accumulator,
 		accumulate_uint32(4, start, end, deltas + idx++);
 
 		/* clock cycles */
-		accumulate_uint32(12, start, end, deltas + idx++);
+		deltas[idx] += oa_tick_delta(end, start, accumulator->format);
+		idx++;
 	} else {
 		/* timestamp */
 		accumulate_uint32(4, start, end, deltas + idx++);
@@ -904,10 +935,8 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 {
 	struct oa_format format = get_oa_format(fmt);
 	uint32_t time_delta = timebase_scale(oa_report1[1] - oa_report0[1]);
-	uint32_t ticks0 = read_report_ticks(oa_report0, fmt);
-	uint32_t ticks1 = read_report_ticks(oa_report1, fmt);
-	uint32_t clock_delta = ticks1 - ticks0;
-	uint32_t max_delta;
+	uint64_t clock_delta = oa_tick_delta(oa_report1, oa_report0, fmt);
+	uint64_t max_delta;
 	uint64_t freq;
 	uint32_t *rpt0_b = (uint32_t *)(((uint8_t *)oa_report0) +
 					format.b_off);
@@ -920,10 +949,10 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 		  gen8_read_report_reason(oa_report0),
 		  gen8_read_report_reason(oa_report1));
 
-	freq = time_delta ? ((uint64_t)clock_delta * 1000) / time_delta : 0;
+	freq = time_delta ? (clock_delta * 1000) / time_delta : 0;
 	igt_debug("freq = %"PRIu64"\n", freq);
 
-	igt_debug("clock delta = %"PRIu32"\n", clock_delta);
+	igt_debug("clock delta = %"PRIu64"\n", clock_delta);
 
 	max_delta = clock_delta * intel_perf->devinfo.n_eus;
 
@@ -1024,7 +1053,7 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 					    format.c_off);
 		uint32_t delta = c1[j] - c0[j];
 
-		igt_debug("C%d: delta = %"PRIu32", max_delta=%"PRIu32"\n",
+		igt_debug("C%d: delta = %"PRIu32", max_delta=%"PRIu64"\n",
 			  j, delta, max_delta);
 		igt_assert(delta <= max_delta);
 	}
@@ -1516,10 +1545,10 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 	if (IS_HASWELL(devid) && format.n_c == 0) {
 		igt_debug("CLOCK = N/A\n");
 	} else {
-		uint32_t clock0 = read_report_ticks(oa_report0, fmt);
-		uint32_t clock1 = read_report_ticks(oa_report1, fmt);
+		uint64_t clock0 = read_report_ticks(oa_report0, fmt);
+		uint64_t clock1 = read_report_ticks(oa_report1, fmt);
 
-		igt_debug("CLOCK: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
+		igt_debug("CLOCK: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
 			  clock0, clock1, clock1 - clock0);
 	}
 
@@ -1621,9 +1650,9 @@ print_report(uint32_t *report, int fmt)
 	if (IS_HASWELL(devid) && format.n_c == 0) {
 		igt_debug("CLOCK = N/A\n");
 	} else {
-		uint32_t clock = read_report_ticks(report, fmt);
+		uint64_t clock = read_report_ticks(report, fmt);
 
-		igt_debug("CLOCK: %"PRIu32"\n", clock);
+		igt_debug("CLOCK: %"PRIu64"\n", clock);
 	}
 
 	if (intel_gen(devid) >= 8) {
-- 
2.36.1
