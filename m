Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EC86E02F
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 22:29:55 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 27 Mar 2020 15:29:54 -0700
Message-Id: <20200327222954.66936-1-ashutosh.dixit@intel.com>
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

v2: Complete rewrite, make test fail on existing kernels (Lionel)

v3: Use infinite ppoll timeout (Umesh)
    Increase mismatch tolerance to 20% (Ashutosh)

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/perf.c b/tests/perf.c
index 442d89fbe..6c0b2ee7f 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -2284,6 +2284,65 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 	__perf_close(stream_fd);
 }
 
+static void test_polling_small_buf(void)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
+	uint64_t properties[] = {
+		/* Include OA reports in samples */
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC |
+			I915_PERF_FLAG_DISABLED |
+			I915_PERF_FLAG_FD_NONBLOCK,
+		.num_properties = NUM_PROPERTIES(properties),
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t test_duration = 80 * 1000 * 1000;
+	int sample_size = (sizeof(struct drm_i915_perf_record_header) +
+				get_oa_format(test_set->perf_oa_format).size);
+	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
+	int n_expect_read_bytes = n_expected_reports * sample_size;
+	uint8_t buf[1024];
+	int n_bytes_read = 0;
+	uint32_t n_polls = 0;
+	struct timespec ts = {};
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
+
+	igt_nsec_elapsed(&ts);
+
+	while (igt_nsec_elapsed(&ts) < test_duration) {
+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
+		int ret;
+
+		ret = ppoll(&pollfd, 1, NULL, NULL);
+
+		if (pollfd.revents & POLLIN) {
+			ret = read(stream_fd, buf, sizeof(buf));
+			if (ret >= 0)
+				n_bytes_read += ret;
+		}
+
+		n_polls++;
+	}
+
+	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
+		  n_bytes_read, n_expect_read_bytes,
+		  n_bytes_read * 100.0f / n_expect_read_bytes,
+		  n_polls);
+
+	__perf_close(stream_fd);
+
+	igt_assert(abs(n_expect_read_bytes - n_bytes_read) < (0.20 * n_expect_read_bytes));
+}
+
 static int
 num_valid_reports_captured(struct drm_i915_perf_open_param *param,
 			   int64_t *duration_ns)
@@ -4919,6 +4978,10 @@ igt_main
 			     2 * 1000 * 1000 /* default 2ms hrtimer */);
 	}
 
+	igt_describe("Test polled read with buffer size smaller than available data");
+	igt_subtest("polling-small-buf")
+		test_polling_small_buf();
+
 	igt_subtest("short-reads")
 		test_short_reads();
 
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
