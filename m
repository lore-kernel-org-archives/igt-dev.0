Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCAC10E370
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 00:05:29 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Tue, 21 Mar 2023 17:05:03 -0700
Message-Id: <20230322000523.3310187-12-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 11/31] i915/perf: Move OA format array
 from stack to heap
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

The OA format size will change based on the specific format used in some
of the tests. In preparation for that, allocated the space required for
the format on heap.

v2: Allocate the correct bytes for OA format (CI failure)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/perf.c | 48 ++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index a2bc6dc1..ebd8e159 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1937,9 +1937,9 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 		uint8_t *buf = calloc(1, buf_size);
 		int ret, n_timer_reports = 0;
 		uint32_t matches = 0;
-		struct {
-			uint32_t report[64];
-		} timer_reports[30];
+#define NUM_TIMER_REPORTS 30
+		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);
+		uint32_t *timer_reports = reports;
 
 		igt_debug("testing OA exponent %d,"
 			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
@@ -1950,7 +1950,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 
 		stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
-		while (n_timer_reports < ARRAY_SIZE(timer_reports)) {
+		while (n_timer_reports < NUM_TIMER_REPORTS) {
 			struct drm_i915_perf_record_header *header;
 
 			while ((ret = read(stream_fd, buf, buf_size)) < 0 &&
@@ -1963,7 +1963,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 			igt_assert(ret > 0);
 
 			for (int offset = 0;
-			     offset < ret && n_timer_reports < ARRAY_SIZE(timer_reports);
+			     offset < ret && n_timer_reports < NUM_TIMER_REPORTS;
 			     offset += header->size) {
 				uint32_t *report;
 
@@ -1985,25 +1985,25 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 				if (!oa_report_is_periodic(exponent, report))
 					continue;
 
-				memcpy(timer_reports[n_timer_reports].report, report,
-				       sizeof(timer_reports[n_timer_reports].report));
+				memcpy(timer_reports, report, format_size);
 				n_timer_reports++;
+				timer_reports += (format_size / 4);
 			}
 		}
 
 		__perf_close(stream_fd);
 
 		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
-			  oa_timestamp(timer_reports[0].report, fmt),
-			  oa_report_get_ctx_id(timer_reports[0].report));
+			  oa_timestamp(&reports[0], fmt),
+			  oa_report_get_ctx_id(&reports[0]));
 		for (int i = 1; i < n_timer_reports; i++) {
-			uint64_t delta = oa_timestamp_delta(timer_reports[i].report,
-							    timer_reports[i - 1].report,
+			uint64_t delta = oa_timestamp_delta(&reports[i],
+							    &reports[i - 1],
 							    fmt);
 
 			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
-				  oa_timestamp(timer_reports[i].report, fmt),
-				  oa_report_get_ctx_id(timer_reports[i].report),
+				  oa_timestamp(&reports[i], fmt),
+				  oa_report_get_ctx_id(&reports[i]),
 				  delta, expected_report_timing_delta(delta,
 								      expected_timestamp_delta) ? "" : "******");
 
@@ -2020,6 +2020,8 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 		 * etc...
 		 */
 		igt_assert_lte(n_timer_reports / 2, matches);
+
+		free(reports);
 	}
 
 	load_helper_stop();
@@ -2741,13 +2743,14 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
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
+	uint32_t *last_periodic_report = malloc(report_size);
 
 	igt_assert(fill_duration < 1000000000);
 
@@ -2757,7 +2760,6 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 		bool overflow_seen;
 		uint32_t n_periodic_reports;
 		uint32_t first_timestamp = 0, last_timestamp = 0;
-		uint32_t last_periodic_report[64];
 
 		do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
 
@@ -2836,8 +2838,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 						break;
 
 					if (oa_report_is_periodic(oa_exponent, report)) {
-						memcpy(last_periodic_report, report,
-						       sizeof(last_periodic_report));
+						memcpy(last_periodic_report, report, report_size);
 						n_periodic_reports++;
 					}
 					break;
@@ -2863,6 +2864,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 			   report_size * n_full_oa_reports * 0.55);
 	}
 
+	free(last_periodic_report);
 	free(buf);
 
 	__perf_close(stream_fd);
@@ -2977,12 +2979,13 @@ test_enable_disable(const struct intel_execution_engine2 *e)
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
+	uint32_t *last_periodic_report = malloc(report_size);
 
 	load_helper_init();
 	load_helper_run(HIGH);
@@ -2994,7 +2997,6 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 		uint32_t n_periodic_reports;
 		struct drm_i915_perf_record_header *header;
 		uint64_t first_timestamp = 0, last_timestamp = 0;
-		uint32_t last_periodic_report[64];
 
 		/* Giving enough time for an overflow might help catch whether
 		 * the OA unit has been enabled even if the driver might at
@@ -3056,8 +3058,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 						break;
 
 					if (oa_report_is_periodic(oa_exponent, report)) {
-						memcpy(last_periodic_report, report,
-						       sizeof(last_periodic_report));
+						memcpy(last_periodic_report, report, report_size);
 
 						/* We want to measure only the
 						 * periodic reports, ctx-switch
@@ -3100,6 +3101,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 		igt_assert_eq(errno, EIO);
 	}
 
+	free(last_periodic_report);
 	free(buf);
 
 	__perf_close(stream_fd);
-- 
2.36.1
