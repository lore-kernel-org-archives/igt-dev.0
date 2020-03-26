Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744A96E264
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 05:42:59 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 25 Mar 2020 22:42:58 -0700
Message-Id: <0a297819cd4a3fe8fcc9f5f6e03d7d0ee7b4ac3c.1585201183.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/perf: add a test for OA data polling
 reads using "small" buffers
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add a test for OA data non-blocking reads using buffers smaller than
the available data. This test would fail for perf revisions < 5
because poll would block even when data was available. Therefore the
amount of data read was limited by the buffer size and the timer
interval and it was impossible to read all available data. This issue
is fixed in perf revision 5.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off--by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/perf.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/perf.c b/tests/perf.c
index 724f6f809..41e3b4478 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -2265,6 +2265,81 @@ test_polling(void)
 	__perf_close(stream_fd);
 }
 
+static void test_polling_small_buf(void)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(10 * 1000 * 1000); /* 10ms */
+	/* Use a large value for the timer for a large amout of data to accumulate */
+	uint64_t kernel_hrtimer = 400 * 1000 * 1000; /* 400 ms */
+	uint64_t properties[] = {
+		/* Include OA reports in samples */
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+
+		/* Kernel configuration (optional) */
+		DRM_I915_PERF_PROP_POLL_OA_PERIOD, kernel_hrtimer,
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC |
+			I915_PERF_FLAG_DISABLED |
+			I915_PERF_FLAG_FD_NONBLOCK,
+		.num_properties = NUM_PROPERTIES(properties),
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint8_t buf[1024 * 1024];
+	int ret, iterl = 0, iters = 0, large = 0, small = 0;
+	struct timespec tsl = {}, tss = {};
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
+
+	/* First do non blocking reads for 4 seconds using 1 MB buffer */
+	igt_nsec_elapsed(&tsl);
+	igt_until_timeout(4) {
+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
+
+		ret = poll(&pollfd, 1, -1);
+		igt_assert_eq(ret, 1);
+		igt_assert(pollfd.revents & POLLIN);
+
+		ret = read(stream_fd, buf, sizeof(buf));
+		igt_assert(ret > 0);
+		large += ret;
+		iterl++;
+	}
+	igt_debug("Read %d B in %d iterations in %ld ns using 1 MB buffer\n",
+		  large, iterl, igt_nsec_elapsed(&tsl));
+
+	/* Now repeat the read with a 4 KB buffer */
+	igt_nsec_elapsed(&tss);
+	igt_until_timeout(4) {
+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
+
+		ret = poll(&pollfd, 1, -1);
+		igt_assert_eq(ret, 1);
+		igt_assert(pollfd.revents & POLLIN);
+
+		ret = read(stream_fd, buf, 4096);
+		igt_assert(ret > 0);
+		small += ret;
+		iters++;
+	}
+	igt_debug("Read %d B in %d iterations in %ld ns using 4 KB buffer\n",
+		  small, iters, igt_nsec_elapsed(&tss));
+
+	__perf_close(stream_fd);
+
+	/* Check that data read using the two methods is within 20% of each
+	 * other. Differences between the two cases is due to timing coupled
+	 * with granularity of the data reads, but they are still expected to be
+	 * "close".
+	 */
+	igt_assert(abs(large - small) * 100 / ((large + small) / 2) < 20);
+}
+
 static int
 num_valid_reports_captured(struct drm_i915_perf_open_param *param,
 			   int64_t *duration_ns)
@@ -4676,6 +4751,12 @@ igt_main
 	igt_subtest("polling")
 		test_polling();
 
+	igt_describe("Test polled read with buffer size smaller than available data");
+	igt_subtest("polling-small-buf") {
+		igt_require(i915_perf_revision(drm_fd) >= 5);
+		test_polling_small_buf();
+	}
+
 	igt_subtest("short-reads")
 		test_short_reads();
 
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
