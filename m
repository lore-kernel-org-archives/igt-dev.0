Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7580C6E7D5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 00:41:18 +0000 (UTC)
Date: Tue, 24 Nov 2020 16:41:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20201125004116.GC4371@orsosgc001.ra.intel.com>
References: <20201119104630.71385-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119104630.71385-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/perf: verify reason field in
 OA reports is never 0
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

On Thu, Nov 19, 2020 at 12:46:30PM +0200, Lionel Landwerlin wrote:
>We're about to remove the filtering in i915 on 0 reason fields because
>we assume this was a possibility, but it turned out to be a corruption
>in the tail pointer register that made us read cleared data.
>
>This test is here to verify that our assumption hold that the HW never
>produces such reports.
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>---
> tests/i915/perf.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 77 insertions(+)
>
>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>index caeabd623..08c81c5c2 100644
>--- a/tests/i915/perf.c
>+++ b/tests/i915/perf.c
>@@ -2539,6 +2539,76 @@ test_buffer_fill(void)
> 	__perf_close(stream_fd);
> }

I think this logic of reading all the reports and doing a sanity check 
could be reused for some other tests. That could help us refactor the 
perf OA test code. I queues something similar to trybot.
https://patchwork.freedesktop.org/series/84231/

If you feel we can go ahead with that ^, I will post it here. If not, 
here are the comments.

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
>+	uint32_t buf_size = 5 * 65536 * (256 + sizeof(struct drm_i915_perf_record_header));

3 times instead of 5 could be good enough. Thoughts?

>+	uint8_t *buf = malloc(buf_size);
>+	uint32_t total_len = 0;
>+	int len;

igt_assert(buf);

just in case we didn't get the required memory.

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
>+		(len -1 && errno == EINTR))) {

Did you mean?

(len == -1 && errno == EINTR)

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
>+	for (uint32_t offset = 0; offset < total_len; offset += header->size) {
>+		header = (void *) (buf + offset);
>+
>+		switch (header->type) {
>+		case DRM_I915_PERF_RECORD_OA_REPORT_LOST:
Based on some trial runs from my test, I see 40 us or 100 us oa_exponent 
would likely result in no reports lost. On the other hand, setting the 
HEAD/TAIL wrap bits in OASTATUS likely happens only when REPORT LOST 
occurs. Should we check that at least one report was lost here?

			reports_lost++;

>+			break;
>+		case DRM_I915_PERF_RECORD_SAMPLE: {
>+			const uint32_t *report = (void *) (header + 1);
>+			uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) &
>+				OAREPORT_REASON_MASK;
>+
>+			igt_assert_neq(reason, 0);

why not sanity_check_reports?

Thanks,
Umesh

>+			break;
>+		}
>+		case DRM_I915_PERF_RECORD_OA_BUFFER_LOST:
>+			igt_assert(!"unexpected overflow");
>+			break;
>+		}
>+	}
>+
>+
>+	free(buf);
>+}
>+
> static void
> test_enable_disable(void)
> {
>@@ -4882,6 +4952,13 @@ igt_main
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
