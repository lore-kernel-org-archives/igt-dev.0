Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F316E119
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 03:07:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue, 10 Mar 2020 03:07:41 +0000
Message-Id: <20200310030741.13164-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] [PATCH i-g-t] test/perf: Add test to verify OA TLB
 invalidation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Run 2 polling tests back to back and compare the number of OA reports
captured. Make sure the number of reports are almost same.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/perf.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/perf.c b/tests/perf.c
index 5e818030..2394adc4 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -2265,6 +2265,97 @@ test_polling(void)
 	__perf_close(stream_fd);
 }
 
+static int
+num_valid_reports_captured(struct drm_i915_perf_open_param *param)
+{
+	uint8_t buf[1024 * 1024];
+	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
+	int64_t test_duration_ns = tick_ns * 5 * 100; /* 5 seconds */
+	int64_t start, end;
+	int num_reports = 0;
+
+	stream_fd = __perf_open(drm_fd, param, true);
+
+	igt_debug("tick length = %dns, test duration = %"PRIu64"ns\n",
+		  (int)tick_ns, test_duration_ns);
+
+	start = get_time();
+	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
+	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
+		struct drm_i915_perf_record_header *header;
+		int ret;
+
+		while ((ret = poll(&pollfd, 1, -1)) < 0 &&
+		       errno == EINTR)
+			;
+		igt_assert_eq(ret, 1);
+		igt_assert(pollfd.revents & POLLIN);
+
+		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
+		       errno == EINTR)
+			;
+
+		/* poll checks if the tail has advanced on the OA buffer, but
+		 * does not check if the reports are valid. On read, the driver
+		 * checks if the reports are valid or not. if none of the
+		 * reports are valid, it returns EAGAIN. EAGAIN should also
+		 * suffice to show that the TLB invalidation failed, but we will
+		 * try for a more concrete check. Ignore read errors here.
+		 */
+		if (ret < 0)
+			continue;
+
+		for (int offset = 0; offset < ret; offset += header->size) {
+			header = (void *)(buf + offset);
+
+			if (header->type == DRM_I915_PERF_RECORD_SAMPLE) {
+				uint32_t *report = (void *)(header + 1);
+
+				if ((report[0] >> OAREPORT_REASON_SHIFT) &
+				    OAREPORT_REASON_TIMER)
+					num_reports++;
+			}
+		}
+	}
+	__perf_close(stream_fd);
+
+	return num_reports;
+}
+
+static void
+gen12_test_oa_tlb_invalidate(void)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(30000000);
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC |
+			I915_PERF_FLAG_DISABLED |
+			I915_PERF_FLAG_FD_NONBLOCK,
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	int num_reports1, num_reports2;
+	
+	/* Capture reports for 5 seconds twice and then make sure you get around
+	 * the same number of reports. In the case of failure, the number of
+	 * reports will vary largely since the beginning of the OA buffer
+	 * will have invalid entries.
+	 */
+	num_reports1 = num_valid_reports_captured(&param);
+	num_reports2 = num_valid_reports_captured(&param);
+
+	igt_debug("num_reports1 = %d, num_reports2 = %d\n", num_reports1, num_reports2);
+	igt_assert(num_reports2 > 0.95 * num_reports1);
+}
+
+
 static void
 test_buffer_fill(void)
 {
@@ -4622,6 +4713,12 @@ igt_main
 		gen8_test_single_ctx_render_target_writes_a_counter();
 	}
 
+	igt_describe("Test OA TLB invalidate");
+	igt_subtest("gen12-oa-tlb-invalidate") {
+		igt_require(intel_gen(devid) >= 12);
+		gen12_test_oa_tlb_invalidate();
+	}
+
 	igt_describe("Measure performance for a specific context using OAR in Gen 12");
 	igt_subtest("gen12-unprivileged-single-ctx-counters") {
 		igt_require(intel_gen(devid) >= 12);
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
