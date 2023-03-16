Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B88210E24B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:27 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:32:53 -0700
Message-Id: <20230316233323.2638668-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 01/31] i915/perf: Add support for 64-bit
 OA formats
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

Newer gen12 platforms introduced 64 bit OA formats that are used by MTL.
Add support to parse reports for 64 bit counters.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index edb922c7..48bd17a5 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -94,6 +94,8 @@ struct oa_format {
 	int a40_high_off; /* bytes */
 	int a40_low_off;
 	int n_a40;
+	int a64_off;
+	int n_a64;
 	int a_off;
 	int n_a;
 	int first_a;
@@ -707,6 +709,15 @@ gen8_read_40bit_a_counter(const uint32_t *report,
 	return a40_low[a_id] | high;
 }
 
+static uint64_t
+xehpsdv_read_64bit_a_counter(const uint32_t *report, enum drm_i915_oa_format fmt, int a_id)
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
@@ -741,6 +752,19 @@ accumulate_uint40(int a_index,
 	*delta += gen8_40bit_a_delta(value0, value1);
 }
 
+static void
+accumulate_uint64(int a_index,
+		  const uint32_t *report0,
+		  const uint32_t *report1,
+		  enum drm_i915_oa_format format,
+		  uint64_t *delta)
+{
+	uint64_t value0 = xehpsdv_read_64bit_a_counter(report0, format, a_index),
+		 value1 = xehpsdv_read_64bit_a_counter(report1, format, a_index);
+
+	*delta += (value1 - value0);
+}
+
 static void
 accumulate_reports(struct accumulator *accumulator,
 		   uint32_t *start,
@@ -766,6 +790,11 @@ accumulate_reports(struct accumulator *accumulator,
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
@@ -796,6 +825,9 @@ accumulator_print(struct accumulator *accumulator, const char *title)
 
 		for (int i = 0; i < format.n_a40; i++)
 			igt_debug("\tA%u = %"PRIu64"\n", i, deltas[idx++]);
+
+		for (int i = 0; i < format.n_a64; i++)
+			igt_debug("\tA64_%u = %"PRIu64"\n", i, deltas[idx++]);
 	} else {
 		igt_debug("\ttime delta = %"PRIu64"\n", deltas[idx++]);
 	}
@@ -852,7 +884,19 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
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
 
@@ -1417,6 +1461,18 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 			  j, value0, value1, delta);
 	}
 
+	for (int j = 0; j < format.n_a64; j++) {
+		uint64_t value0 = xehpsdv_read_64bit_a_counter(oa_report0, fmt, j);
+		uint64_t value1 = xehpsdv_read_64bit_a_counter(oa_report1, fmt, j);
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
2.36.1
