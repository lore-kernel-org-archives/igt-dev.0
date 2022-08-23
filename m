Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7CF11A24C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:20 +0000
Message-Id: <20220823183036.5270-8-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/23] i915/perf: Add support for 64-bit
 counters
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

Add support for 64-bit counters.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 70 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 7 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 5fd143e9..19c33324 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -101,6 +101,8 @@ struct oa_format {
 	int a40_high_off; /* bytes */
 	int a40_low_off;
 	int n_a40;
+	int a64_off;
+	int n_a64;
 	int a_off;
 	int n_a;
 	int first_a;
@@ -455,7 +457,7 @@ max_oa_exponent_for_freq_gt(uint64_t frequency)
 static uint64_t
 oa_exponent_to_ns(int exponent)
 {
-       return 1000000000ULL * (2ULL << exponent) / intel_perf->devinfo.timestamp_frequency;
+	return 1000000000ULL * (2ULL << exponent) / intel_perf->devinfo.timestamp_frequency;
 }
 
 static bool
@@ -658,6 +660,15 @@ gen8_read_40bit_a_counter(const uint32_t *report,
 	return a40_low[a_id] | high;
 }
 
+static uint64_t
+gen12_read_64bit_a_counter(const uint32_t *report, enum drm_i915_oa_format fmt, int a_id)
+{
+	struct oa_format format = get_oa_format(fmt);
+	uint64_t *a64 = (uint64_t *)(((uint8_t *)report) + format.a64_off);
+
+	return a64[a_id];
+}
+
 static uint64_t
 gen8_40bit_a_delta(uint64_t value0, uint64_t value1)
 {
@@ -670,8 +681,8 @@ gen8_40bit_a_delta(uint64_t value0, uint64_t value1)
 static void
 accumulate_uint32(size_t offset,
 		  uint32_t *report0,
-                  uint32_t *report1,
-                  uint64_t *delta)
+		  uint32_t *report1,
+		  uint64_t *delta)
 {
 	uint32_t value0 = *(uint32_t *)(((uint8_t *)report0) + offset);
 	uint32_t value1 = *(uint32_t *)(((uint8_t *)report1) + offset);
@@ -681,10 +692,10 @@ accumulate_uint32(size_t offset,
 
 static void
 accumulate_uint40(int a_index,
-                  uint32_t *report0,
-                  uint32_t *report1,
+		  uint32_t *report0,
+		  uint32_t *report1,
 		  enum drm_i915_oa_format format,
-                  uint64_t *delta)
+		  uint64_t *delta)
 {
 	uint64_t value0 = gen8_read_40bit_a_counter(report0, format, a_index),
 		 value1 = gen8_read_40bit_a_counter(report1, format, a_index);
@@ -692,6 +703,19 @@ accumulate_uint40(int a_index,
 	*delta += gen8_40bit_a_delta(value0, value1);
 }
 
+static void
+accumulate_uint64(int a_index,
+		  const uint32_t *report0,
+		  const uint32_t *report1,
+		  enum drm_i915_oa_format format,
+		  uint64_t *delta)
+{
+	uint64_t value0 = gen12_read_64bit_a_counter(report0, format, a_index),
+		 value1 = gen12_read_64bit_a_counter(report1, format, a_index);
+
+	*delta += (value1 - value0);
+}
+
 static void
 accumulate_reports(struct accumulator *accumulator,
 		   uint32_t *start,
@@ -717,6 +741,11 @@ accumulate_reports(struct accumulator *accumulator,
 				  deltas + idx++);
 	}
 
+	for (int i = 0; i < format.n_a64; i++) {
+		accumulate_uint64(i, start, end, accumulator->format,
+				  deltas + idx++);
+	}
+
 	for (int i = 0; i < format.n_a; i++) {
 		accumulate_uint32(format.a_off + 4 * i,
 				  start, end, deltas + idx++);
@@ -747,6 +776,9 @@ accumulator_print(struct accumulator *accumulator, const char *title)
 
 		for (int i = 0; i < format.n_a40; i++)
 			igt_debug("\tA%u = %"PRIu64"\n", i, deltas[idx++]);
+
+		for (int i = 0; i < format.n_a64; i++)
+			igt_debug("\tA64_%u = %"PRIu64"\n", i, deltas[idx++]);
 	} else {
 		igt_debug("\ttime delta = %"PRIu64"\n", deltas[idx++]);
 	}
@@ -803,7 +835,19 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 		if (undefined_a_counters[j])
 			continue;
 
-		igt_debug("A%d: delta = %"PRIu64"\n", j, delta);
+		igt_debug("A40_%d: delta = %"PRIu64"\n", j, delta);
+		igt_assert(delta <= max_delta);
+	}
+
+	for (int j = 0; j < format.n_a64; j++) {
+		uint64_t delta = 0;
+
+		accumulate_uint64(j, oa_report0, oa_report1, fmt, &delta);
+
+		if (undefined_a_counters[j])
+			continue;
+
+		igt_debug("A64_%d: delta = %"PRIu64"\n", format.first_a + j, delta);
 		igt_assert(delta <= max_delta);
 	}
 
@@ -1368,6 +1412,18 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 			  j, value0, value1, delta);
 	}
 
+	for (int j = 0; j < format.n_a64; j++) {
+		uint64_t value0 = gen12_read_64bit_a_counter(oa_report0, fmt, j);
+		uint64_t value1 = gen12_read_64bit_a_counter(oa_report1, fmt, j);
+		uint64_t delta = value1 - value0;
+
+		if (undefined_a_counters[j])
+			continue;
+
+		igt_debug("A_64%d: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
+			  format.first_a + j, value0, value1, delta);
+	}
+
 	for (int j = 0; j < format.n_a; j++) {
 		uint32_t *a0 = (uint32_t *)(((uint8_t *)oa_report0) +
 					    format.a_off);
-- 
2.25.1
