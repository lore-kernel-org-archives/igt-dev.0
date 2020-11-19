Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D446E558
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 10:46:38 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 19 Nov 2020 12:46:30 +0200
Message-Id: <20201119104630.71385-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/perf: verify reason field in OA
 reports is never 0
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

We're about to remove the filtering in i915 on 0 reason fields because
we assume this was a possibility, but it turned out to be a corruption
in the tail pointer register that made us read cleared data.

This test is here to verify that our assumption hold that the HW never
produces such reports.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index caeabd623..08c81c5c2 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2539,6 +2539,76 @@ test_buffer_fill(void)
 	__perf_close(stream_fd);
 }
 
+static void
+test_non_zero_reason(void)
+{
+	/* ~10 micro second period */
+	int oa_exponent = max_oa_exponent_for_period_lte(10000);
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
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	struct drm_i915_perf_record_header *header;
+	uint32_t buf_size = 5 * 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
+	uint8_t *buf = malloc(buf_size);
+	uint32_t total_len = 0;
+	int len;
+
+	igt_debug("Ready to read about %u bytes\n", buf_size);
+
+	load_helper_init();
+	load_helper_run(HIGH);
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+
+	while (total_len < (buf_size - sizeof(struct drm_i915_perf_record_header)) &&
+	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
+		(len -1 && errno == EINTR))) {
+		if (len > 0)
+			total_len += len;
+	}
+
+	__perf_close(stream_fd);
+
+	load_helper_stop();
+	load_helper_fini();
+
+	igt_debug("Got %u bytes\n", total_len);
+
+	for (uint32_t offset = 0; offset < total_len; offset += header->size) {
+		header = (void *) (buf + offset);
+
+		switch (header->type) {
+		case DRM_I915_PERF_RECORD_OA_REPORT_LOST:
+			break;
+		case DRM_I915_PERF_RECORD_SAMPLE: {
+			const uint32_t *report = (void *) (header + 1);
+			uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) &
+				OAREPORT_REASON_MASK;
+
+			igt_assert_neq(reason, 0);
+			break;
+		}
+		case DRM_I915_PERF_RECORD_OA_BUFFER_LOST:
+			igt_assert(!"unexpected overflow");
+			break;
+		}
+	}
+
+
+	free(buf);
+}
+
 static void
 test_enable_disable(void)
 {
@@ -4882,6 +4952,13 @@ igt_main
 	igt_subtest("buffer-fill")
 		test_buffer_fill();
 
+	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
+	igt_subtest("non-zero-reason") {
+		/* Reason field is only available on Gen8+ */
+		igt_require(intel_gen(devid) >= 8);
+		test_non_zero_reason();
+	}
+
 	igt_subtest("disabled-read-error")
 		test_disabled_read_error();
 	igt_subtest("non-sampling-read-error")
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
