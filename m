Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFEF6E97A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 22:38:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Mar 2020 14:38:12 -0800
Message-Id: <20200303223813.3866-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/perf: add flush data ioctl test
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

Ensure we have proper behavior for the new I915_PERF_IOCTL_FLUSH_DATA.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/tests/perf.c b/tests/perf.c
index 8a64c559..890fe41f 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -4098,6 +4098,129 @@ gen12_test_single_ctx_render_target_writes_a_counter(void)
 	} while (WEXITSTATUS(child_ret) == EAGAIN);
 }
 
+/*
+ * Verifies that the I915_PERF_IOCTL_FLUSH_DATA ioctl forces the
+ * i915-perf driver to look at the available data in the OA buffer.
+ */
+static void
+test_flush_data(void)
+{
+	size_t report_size = get_oa_format(test_set->perf_oa_format).size;
+	int oa_exponent =
+		find_oa_exponent_for_buffer_fill_time(MAX_OA_BUF_SIZE,
+						      report_size,
+						      500 * 1000 * 1000 /* 500ms */);
+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	size_t oa_buf_size = MAX_OA_BUF_SIZE;
+	int n_full_oa_reports = oa_buf_size / report_size;
+	uint64_t fill_duration = n_full_oa_reports * oa_period;
+	uint64_t properties[] = {
+		/* Include OA reports in samples */
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+		DRM_I915_PERF_PROP_OA_ENABLE_INTERRUPT, true,
+
+		/* Kernel configuration */
+		DRM_I915_PERF_PROP_POLL_OA_DELAY, 0,
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC |
+		         I915_PERF_FLAG_FD_NONBLOCK |
+		         I915_PERF_FLAG_DISABLED,
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	struct pollfd pollfd = { .events = POLLIN };
+	struct drm_i915_perf_record_header *header;
+	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
+	uint8_t *buf = malloc(buf_size);
+	uint32_t n_reports = 0, expected_reports, min_reports, max_reports;
+	int ret;
+
+	expected_reports = n_full_oa_reports / 5;
+	min_reports = expected_reports - expected_reports * 0.05;
+	max_reports = expected_reports + expected_reports * 0.05;
+
+	stream_fd = __perf_open(drm_fd, &param, false /* prevent_pm */);
+	pollfd.fd = stream_fd;
+
+	igt_debug("Fill duration for %s\n", pretty_print_oa_period(fill_duration));
+	igt_debug("Polling for %s\n", pretty_print_oa_period(fill_duration / 5));
+
+	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
+
+	/*
+	 * Wait for a fifth the fill duration, no data should be
+	 * available through poll()/read().
+	 */
+	while ((ret = poll(&pollfd, 1, fill_duration / (5 * 1000 * 1000))) < 0 &&
+	       errno == EINTR)
+		;
+
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(pollfd.revents, 0);
+
+	while ((ret = read(stream_fd, buf, MAX_OA_BUF_SIZE)) < 0 &&
+	       errno == EINTR)
+		;
+
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EAGAIN);
+
+	/* Now force the driver to look at the head/tail pointers. */
+	ret = igt_ioctl(stream_fd, I915_PERF_IOCTL_FLUSH_DATA, 0);
+
+	/* Is this supported on this kernel? */
+	igt_skip_on(ret == -1 && errno == EINVAL);
+
+	/* Now poll() should report available data. */
+	while ((ret = poll(&pollfd, 1, 0)) < 0 &&
+	       errno == EINTR)
+		;
+
+	igt_assert_eq(ret, 1);
+	igt_assert(pollfd.revents & POLLIN);
+
+	/* And we should be able to read it. */
+	while ((ret = read(stream_fd, buf, MAX_OA_BUF_SIZE)) < 0 &&
+	       errno == EINTR)
+		;
+
+	igt_assert_lte(report_size, ret);
+
+	for (int offset = 0; offset < ret; offset += header->size) {
+		header = (void *)(buf + offset);
+
+		switch (header->type) {
+		case DRM_I915_PERF_RECORD_SAMPLE:
+			n_reports++;
+			break;
+		case DRM_I915_PERF_RECORD_OA_BUFFER_LOST:
+			igt_assert(!"unexpected overflow");
+			break;
+		}
+	}
+
+	igt_debug("Got %i report(s), expected range [%u, %u]\n",
+		  n_reports, min_reports, max_reports);
+
+	/*
+	 * Verify that we get about a third of the OA buffer full of
+	 * report as we've waited for a third of the time it teakes to
+	 * fill the buffer.
+	 */
+	igt_assert_lte(n_reports, max_reports);
+	igt_assert_lte(min_reports, n_reports);
+
+	free(buf);
+
+	__perf_close(stream_fd);
+}
+
 static unsigned long rc6_residency_ms(void)
 {
 	return sysfs_read("power/rc6_residency_ms");
@@ -4871,6 +4994,13 @@ igt_main
 			       (fill_time / 4) * max_reports / fill_time);
 	}
 
+	igt_describe("Test flush data to capture all reports in interrupt mode with hrtimer disabled");
+	igt_subtest("flush-data") {
+		igt_require(i915_perf_revision(drm_fd) >= 6);
+
+		test_flush_data();
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
