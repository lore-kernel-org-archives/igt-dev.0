Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FF06EA83
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 20:56:44 +0000 (UTC)
Date: Fri, 27 Mar 2020 13:56:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20200327205642.GC9553@orsosgc001.amr.corp.intel.com>
References: <20200327044250.64274-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327044250.64274-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: add a test for OA data
 polling reads using "small" buffers
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 09:42:50PM -0700, Ashutosh Dixit wrote:
>Add a test for OA data non-blocking reads using buffers smaller than
>the available data. This test would fail for perf revisions < 5
>because poll would block even when data was available. Therefore the
>amount of data read was limited by the buffer size and the timer
>interval and it was impossible to read all available data. This issue
>is fixed in perf revision 5.
>
>v2: Complete rewrite, make test fail on existing kernels (Lionel)
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>---
> tests/perf.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 69 insertions(+)
>
>diff --git a/tests/perf.c b/tests/perf.c
>index 724f6f809..3dc757c3b 100644
>--- a/tests/perf.c
>+++ b/tests/perf.c
>@@ -2265,6 +2265,71 @@ test_polling(void)
> 	__perf_close(stream_fd);
> }
>
>+static void test_polling_small_buf(void)
>+{
>+	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
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
>+		.flags = I915_PERF_FLAG_FD_CLOEXEC |
>+			I915_PERF_FLAG_DISABLED |
>+			I915_PERF_FLAG_FD_NONBLOCK,
>+		.num_properties = NUM_PROPERTIES(properties),
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	uint32_t test_duration = 80 * 1000 * 1000;
>+	int sample_size = (sizeof(struct drm_i915_perf_record_header) +
>+				get_oa_format(test_set->perf_oa_format).size);
>+	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
>+	int n_expect_read_bytes = n_expected_reports * sample_size;
>+	uint8_t buf[1024];
>+	int n_bytes_read = 0;
>+	uint32_t n_polls = 0;
>+	struct timespec ts = {};
>+
>+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
>+
>+	igt_nsec_elapsed(&ts);
>+
>+	while (igt_nsec_elapsed(&ts) < test_duration) {
>+		struct timespec poll_wait = {
>+			.tv_sec = 0,
>+			.tv_nsec = (test_duration - igt_nsec_elapsed(&ts)),
>+		};
>+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
>+		int ret;
>+
>+		ret = ppoll(&pollfd, 1, &poll_wait, NULL);

when poll_wait reaches a value less than the default hrtimer poll 
period, poll will start timing out. I think the timeout will itself not 
set the POLLIN event, so that many reports will never be read.

Lionel,

the expected reports calculated here (and in other igt tests) do not 
take context switch reports into account. Do you think we can run into a 
situation where our calculations may go wrong due to large number of 
context switches? thoughts?

Thanks,
Umesh

>+
>+		if (pollfd.revents & POLLIN) {
>+			ret = read(stream_fd, buf, sizeof(buf));
>+			if (ret >= 0)
>+				n_bytes_read += ret;
>+		}
>+
>+		n_polls++;
>+
>+		igt_debug("Elapsed=%lu wait=%lu\n", igt_nsec_elapsed(&ts), poll_wait.tv_nsec);
>+	}
>+
>+	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
>+		  n_bytes_read, n_expect_read_bytes,
>+		  n_bytes_read * 100.0f / n_expect_read_bytes,
>+		  n_polls);
>+
>+	__perf_close(stream_fd);
>+
>+	igt_assert(abs(n_expect_read_bytes - n_bytes_read) < (0.10 * n_expect_read_bytes));
>+}
>+
> static int
> num_valid_reports_captured(struct drm_i915_perf_open_param *param,
> 			   int64_t *duration_ns)
>@@ -4676,6 +4741,10 @@ igt_main
> 	igt_subtest("polling")
> 		test_polling();
>
>+	igt_describe("Test polled read with buffer size smaller than available data");
>+	igt_subtest("polling-small-buf")
>+		test_polling_small_buf();
>+
> 	igt_subtest("short-reads")
> 		test_short_reads();
>
>-- 
>2.25.2
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
