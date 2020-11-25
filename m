Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E61989823
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 22:35:43 +0000 (UTC)
Date: Wed, 25 Nov 2020 14:35:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20201125223537.GA73672@orsosgc001.ra.intel.com>
References: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
 <20201125112540.426554-4-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125112540.426554-4-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] tests/i915/perf: verify reason
 field in OA reports is never 0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 01:25:40PM +0200, Lionel Landwerlin wrote:
>We're about to remove the filtering in i915 on 0 reason fields because
>we assume this was a possibility, but it turned out to be a corruption
>in the tail pointer register that made us read cleared data.
>
>This test is here to verify that our assumption hold that the HW never
>produces such reports.
>
>v2: Fix len checking (Umesh)
>    Count report lost events (Umesh)
>    Check report sanity (Umesh)
>    Limit test to 3 times the OA buffer (Umesh)
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>---
> tests/i915/perf.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 90 insertions(+)
>
>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>index 811067aad..2d442df96 100644
>--- a/tests/i915/perf.c
>+++ b/tests/i915/perf.c
>@@ -2550,6 +2550,89 @@ test_buffer_fill(void)
> 	__perf_close(stream_fd);
> }
>
>+static void
>+test_non_zero_reason(void)
>+{
>+	/* ~10 micro second period */
>+	int oa_exponent = max_oa_exponent_for_period_lte(10000);
>+	uint64_t properties[] = {
>+		/* Include OA reports in samples */
>+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
>+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
>+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
>+	};
>+	struct drm_i915_perf_open_param param = {
>+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
>+		.num_properties = sizeof(properties) / 16,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	struct drm_i915_perf_record_header *header;
>+	uint32_t buf_size = 3 * 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
>+	uint8_t *buf = malloc(buf_size);
>+	uint32_t total_len = 0, reports_lost;
>+	const uint32_t *last_report;
>+	int len;
>+
>+	igt_assert(buf);

nit: Looks like sanity check will log the report0/report1 pointers. We 
could log the buf pointer here so we get a sense of the report index 
that failed.

Either ways, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks for adding this test,
Umesh
>+
>+	igt_debug("Ready to read about %u bytes\n", buf_size);
>+
>+	load_helper_init();
>+	load_helper_run(HIGH);
>+
>+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+
>+	while (total_len < (buf_size - sizeof(struct drm_i915_perf_record_header)) &&
>+	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
>+		(len == -1 && errno == EINTR))) {
>+		if (len > 0)
>+			total_len += len;
>+	}
>+
>+	__perf_close(stream_fd);
>+
>+	load_helper_stop();
>+	load_helper_fini();
>+
>+	igt_debug("Got %u bytes\n", total_len);
>+
>+	last_report = NULL;
>+	reports_lost = 0;
>+	for (uint32_t offset = 0; offset < total_len; offset += header->size) {
>+		header = (void *) (buf + offset);
>+
>+		switch (header->type) {
>+		case DRM_I915_PERF_RECORD_OA_REPORT_LOST:
>+			reports_lost++;
>+			break;
>+		case DRM_I915_PERF_RECORD_SAMPLE: {
>+			const uint32_t *report = (void *) (header + 1);
>+			uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) &
>+				OAREPORT_REASON_MASK;
>+
>+			igt_assert_neq(reason, 0);
>+
>+			if (last_report) {
>+				sanity_check_reports(last_report, report,
>+						     test_set->perf_oa_format);
>+			}
>+			last_report = report;
>+			break;
>+		}
>+		case DRM_I915_PERF_RECORD_OA_BUFFER_LOST:
>+			igt_assert(!"unexpected overflow");
>+			break;
>+		}
>+	}
>+
>+	igt_debug("Got %u report lost events\n", reports_lost);
>+
>+	free(buf);
>+}
>+
> static void
> test_enable_disable(void)
> {
>@@ -4893,6 +4976,13 @@ igt_main
> 	igt_subtest("buffer-fill")
> 		test_buffer_fill();
>
>+	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
>+	igt_subtest("non-zero-reason") {
>+		/* Reason field is only available on Gen8+ */
>+		igt_require(intel_gen(devid) >= 8);
>+		test_non_zero_reason();
>+	}
>+
> 	igt_subtest("disabled-read-error")
> 		test_disabled_read_error();
> 	igt_subtest("non-sampling-read-error")
>-- 
>2.29.2
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
