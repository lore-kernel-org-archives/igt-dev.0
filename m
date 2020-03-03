Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E8F6E97C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 22:38:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Mar 2020 14:38:11 -0800
Message-Id: <20200303223813.3866-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/6] tests/perf: new tests for OA interrupt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Those tests verify that the interrupt wakes up userspace waiting on
the perf stream either with poll() or with read().

v2: (Umesh)
- read() will check for reports in OA buffer prior to blocking for new
  reports. This results in occassional 1 or 2 reports being returned in
  the read call instead of the number of reports that the test is
  expecting. Since read behaves as expected, the only way for us to
  block is to call poll prior to read.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 208 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/tests/perf.c b/tests/perf.c
index 37dc1db1..8a64c559 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -456,6 +456,20 @@ oa_exponent_to_ns(int exponent)
        return 1000000000ULL * (2ULL << exponent) / intel_perf->devinfo.timestamp_frequency;
 }
 
+static int
+find_oa_exponent_for_buffer_fill_time(size_t oa_buf_size, size_t report_size, uint64_t fill_time_ns)
+{
+       size_t n_reports = oa_buf_size / report_size;
+
+       for (int e = 1; e < 32; e++) {
+               if (fill_time_ns < oa_exponent_to_ns(e) * n_reports)
+                       return e;
+       }
+
+       igt_assert(!"reached");
+       return -1;
+}
+
 static bool
 oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
 {
@@ -2290,6 +2304,109 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 	__perf_close(stream_fd);
 }
 
+static void
+test_interrupt(uint64_t oa_exponent,
+	       uint64_t kernel_oa_poll_delay,
+	       bool use_interrupt,
+	       bool expect_buffer_lost,
+	       bool use_polling,
+	       uint32_t expect_min_reports)
+{
+	uint64_t properties[] = {
+		/* Include OA reports in samples */
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+		DRM_I915_PERF_PROP_OA_ENABLE_INTERRUPT, use_interrupt,
+
+		/* Kernel configuration */
+		DRM_I915_PERF_PROP_POLL_OA_DELAY, kernel_oa_poll_delay,
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC |
+			I915_PERF_FLAG_DISABLED |
+			(use_polling ? I915_PERF_FLAG_FD_NONBLOCK : 0),
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	struct pollfd pollfd = { .events = POLLIN };
+	struct drm_i915_perf_record_header *header;
+	uint32_t n_reports = 0;
+	bool buffer_lost = false;
+	uint8_t *buf = malloc(MAX_OA_BUF_SIZE);
+	int ret;
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+	pollfd.fd = stream_fd;
+
+	igt_debug("OA period = %s, ",
+		  pretty_print_oa_period(oa_exponent_to_ns(oa_exponent)));
+	igt_debug("OA poll delay = %s, use interrupt = %i, "
+		  "expected min report = %u\n",
+		  pretty_print_oa_period(kernel_oa_poll_delay),
+		  use_interrupt, expect_min_reports);
+
+	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
+
+	while ((ret = poll(&pollfd, 1, -1)) < 0 &&
+	       errno == EINTR)
+		;
+	igt_assert_eq(ret, 1);
+	igt_assert(pollfd.revents & POLLIN);
+
+	while ((ret = read(stream_fd, buf, MAX_OA_BUF_SIZE)) < 0 &&
+	       errno == EINTR)
+		;
+
+	if (ret < 0)
+		igt_debug("Unexpected error when reading after poll = %d\n", errno);
+	igt_assert_neq(ret, -1);
+
+	__perf_close(stream_fd);
+
+	/* For Haswell reports don't contain a well defined reason
+	 * field we so assume all reports to be 'periodic'. For gen8+
+	 * we want to to consider that the HW automatically writes some
+	 * non periodic reports (e.g. on context switch) which might
+	 * lead to more successful read()s than expected due to
+	 * periodic sampling and we don't want these extra reads to
+	 * cause the test to fail...
+	 */
+	for (int offset = 0; offset < ret; offset += header->size) {
+		header = (void *)(buf + offset);
+
+		switch (header->type) {
+		case DRM_I915_PERF_RECORD_SAMPLE:
+			n_reports++;
+			break;
+		case DRM_I915_PERF_RECORD_OA_BUFFER_LOST:
+			buffer_lost = true;
+			break;
+		}
+	}
+
+	igt_debug("Got %i report(s)\n", n_reports);
+
+	igt_assert_eq(buffer_lost, expect_buffer_lost);
+
+	/*
+	 * Leave a 5% error margin for 2 reasons :
+	 *
+	 * - the tail pointer race condition might remove a couple of
+	 *   reports because things have not yet landed in memory.
+	 *
+	 * - the OA unit sometimes drop a writing a report here and
+	 *   there, the algorithm is linked to pressure on memory
+	 *   controller but undocumented.
+	 */
+	igt_assert_lte(expect_min_reports * 0.95, n_reports);
+
+	free(buf);
+}
+
 static void
 test_buffer_fill(void)
 {
@@ -4644,6 +4761,52 @@ igt_main
 			      2 * 1000 * 1000 /* default 2ms hrtimer */);
 	}
 
+	igt_describe("Test blocking read with interrupt and different hrtimer frequencies");
+	igt_subtest("blocking-with-interrupt") {
+		uint64_t target_fill_time = /* 1000ms */ 1000 * 1000 * 1000ul;
+		size_t report_size = get_oa_format(test_set->perf_oa_format).size;
+		uint32_t max_reports = MAX_OA_BUF_SIZE / report_size;
+		int oa_exponent =
+			find_oa_exponent_for_buffer_fill_time(MAX_OA_BUF_SIZE,
+							      report_size, target_fill_time);
+		uint64_t fill_time = oa_exponent_to_ns(oa_exponent) *
+			(MAX_OA_BUF_SIZE / report_size);
+
+		igt_require(i915_perf_revision(drm_fd) >= 5);
+
+		/*
+		 * We should be waken up by the HR timer but too late,
+		 * so we'll loose reports.
+		 */
+		test_interrupt(oa_exponent,
+			       fill_time + fill_time / 2,
+			       false /* interrupt */, true /* loss */, false /* use_polling */,
+			       0);
+
+		/*
+		 * We should get woken up by the HR timer and get the
+		 * appropriate number of report.
+		 */
+		test_interrupt(oa_exponent,
+			       /* 500us */ 500 * 1000,
+			       false /* interrupt */, false /* no loss */, false /* use_polling */,
+			       (500 * 1000 * max_reports) / fill_time);
+
+
+		/* We should be waken up by the interrupt first. */
+		test_interrupt(oa_exponent,
+			       2 * fill_time,
+			       true /* interrupt */, false /* no loss */, false /* use_polling */,
+			       max_reports / 2);
+
+		/* We should be waken up by the HR timer first. */
+		test_interrupt(oa_exponent,
+			       fill_time / 4,
+			       true /* interrupt */, false /* no loss */, false /* use_polling */,
+			       (fill_time / 4) * max_reports / fill_time);
+	}
+
+
 	igt_describe("Test polled read with default hrtimer frequency");
 	igt_subtest("polling") {
 		test_polling(40 * 1000 * 1000 /* 40ms oa period */,
@@ -4663,6 +4826,51 @@ igt_main
 			     2 * 1000 * 1000 /* default 2ms hrtimer */);
 	}
 
+	igt_describe("Test polled read with interrupt and different hrtimer frequencies");
+	igt_subtest("polling-with-interrupt") {
+		uint64_t target_fill_time = /* 1000ms */ 1000 * 1000 * 1000ul;
+		size_t report_size = get_oa_format(test_set->perf_oa_format).size;
+		uint32_t max_reports = MAX_OA_BUF_SIZE / report_size;
+		int oa_exponent =
+			find_oa_exponent_for_buffer_fill_time(MAX_OA_BUF_SIZE,
+							      report_size, target_fill_time);
+		uint64_t fill_time = oa_exponent_to_ns(oa_exponent) *
+			(MAX_OA_BUF_SIZE / report_size);
+
+		igt_require(i915_perf_revision(drm_fd) >= 5);
+
+		/*
+		 * We should be waken up by the HR timer but too late,
+		 * so we'll loose reports.
+		 */
+		test_interrupt(oa_exponent,
+			       fill_time + fill_time / 2,
+			       false /* interrupt */, true /* loss */, true /* use_polling */,
+			       0);
+
+		/*
+		 * We should get woken up by the HR timer and get the
+		 * appropriate number of report.
+		 */
+		test_interrupt(oa_exponent,
+			       /* 500us */ 500 * 1000,
+			       false /* interrupt */, false /* no loss */, true /* use_polling */,
+			       (500 * 1000 * max_reports) / fill_time);
+
+
+		/* We should be waken up by the interrupt first. */
+		test_interrupt(oa_exponent,
+			       2 * fill_time,
+			       true /* interrupt */, false /* no loss */, true /* use_polling */,
+			       max_reports / 2);
+
+		/* We should be waken up by the HR timer first. */
+		test_interrupt(oa_exponent,
+			       fill_time / 4,
+			       true /* interrupt */, false /* no loss */, true /* use_polling */,
+			       (fill_time / 4) * max_reports / fill_time);
+	}
+
 	igt_subtest("short-reads")
 		test_short_reads();
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
