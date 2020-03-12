Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0236EAB8
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 13:28:22 +0000 (UTC)
References: <20200310190024.6627-1-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <3cb5c86f-af13-5243-00fd-55192022933d@intel.com>
Date: Thu, 12 Mar 2020 15:28:20 +0200
MIME-Version: 1.0
In-Reply-To: <20200310190024.6627-1-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] test/perf: Add test to verify OA TLB
 invalidation
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/03/2020 21:00, Umesh Nerlige Ramappa wrote:
> Run 2 polling tests back to back and compare the number of OA reports
> captured. Make sure the number of reports are almost same.
>
> v2: Add timeout to poll (Lionel)
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/perf.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
>
> diff --git a/tests/perf.c b/tests/perf.c
> index 5e818030..fea9da1c 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -2265,6 +2265,99 @@ test_polling(void)
>   	__perf_close(stream_fd);
>   }
>   
> +static int
> +num_valid_reports_captured(struct drm_i915_perf_open_param *param)
> +{
> +	uint8_t buf[1024 * 1024];
> +	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
> +#define DURATION_SEC 5 /* 5 seconds */
> +	int64_t test_duration_ns = tick_ns * DURATION_SEC * 100;


Why do you need ticks? poll work in milliseconds.

Can't we stick on milliseconds or nanoseconds?


> +	int64_t start, end;
> +	int num_reports = 0;
> +
> +	stream_fd = __perf_open(drm_fd, param, true);
> +
> +	igt_debug("tick length = %dns, test duration = %"PRIu64"ns\n",
> +		  (int)tick_ns, test_duration_ns);
> +
> +	start = get_time();
> +	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
> +	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
> +		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
> +		struct drm_i915_perf_record_header *header;
> +		int ret;
> +
> +		/* we do not want to wait longer than the test duration here */
> +		while ((ret = poll(&pollfd, 1, DURATION_SEC * 1000)) < 0 &&
> +		       errno == EINTR)


You need to deduct the remaining time for the poll.

Otherwise you depending on how you're synced with the kernel timeout you 
might capture one more timeout period than what you need for 5s.


You could use ppoll if you want more precise timings.


> +			;
> +		igt_assert_eq(ret, 1);
> +		igt_assert(pollfd.revents & POLLIN);
> +
> +		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
> +		       errno == EINTR)
> +			;
> +
> +		/* poll checks if the tail has advanced on the OA buffer, but
> +		 * does not check if the reports are valid. On read, the driver
> +		 * checks if the reports are valid or not. if none of the
> +		 * reports are valid, it returns EAGAIN. EAGAIN should also
> +		 * suffice to show that the TLB invalidation failed, but we will
> +		 * try for a more concrete check. Ignore read errors here.
> +		 */
> +		if (ret < 0)
> +			continue;
> +
> +		for (int offset = 0; offset < ret; offset += header->size) {
> +			header = (void *)(buf + offset);
> +
> +			if (header->type == DRM_I915_PERF_RECORD_SAMPLE) {
> +				uint32_t *report = (void *)(header + 1);
> +
> +				if ((report[0] >> OAREPORT_REASON_SHIFT) &
> +				    OAREPORT_REASON_TIMER)
> +					num_reports++;
> +			}
> +		}
> +	}
> +	__perf_close(stream_fd);
> +
> +	return num_reports;
> +}
> +
> +static void
> +gen12_test_oa_tlb_invalidate(void)
> +{
> +	int oa_exponent = max_oa_exponent_for_period_lte(30000000);
> +	uint64_t properties[] = {
> +		DRM_I915_PERF_PROP_SAMPLE_OA, true,
> +
> +		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
> +		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
> +		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
> +	};
> +	struct drm_i915_perf_open_param param = {
> +		.flags = I915_PERF_FLAG_FD_CLOEXEC |
> +			I915_PERF_FLAG_DISABLED |
> +			I915_PERF_FLAG_FD_NONBLOCK,
> +		.num_properties = sizeof(properties) / 16,
> +		.properties_ptr = to_user_pointer(properties),
> +	};
> +	int num_reports1, num_reports2;
> +	
> +	/* Capture reports for 5 seconds twice and then make sure you get around
> +	 * the same number of reports. In the case of failure, the number of
> +	 * reports will vary largely since the beginning of the OA buffer
> +	 * will have invalid entries.
> +	 */


I think a better approach would be to estimate how many reports you 
should get for 5s and then verify that both captures are within a delta 
of that expectation.

That way if we fail twice the number of reports we should be getting, 
we'll be notified.


-Lionel


> +	num_reports1 = num_valid_reports_captured(&param);
> +	num_reports2 = num_valid_reports_captured(&param);
> +
> +	igt_debug("num_reports1 = %d, num_reports2 = %d\n", num_reports1, num_reports2);
> +	igt_assert(num_reports2 > 0.95 * num_reports1);
> +}
> +
> +
>   static void
>   test_buffer_fill(void)
>   {
> @@ -4622,6 +4715,12 @@ igt_main
>   		gen8_test_single_ctx_render_target_writes_a_counter();
>   	}
>   
> +	igt_describe("Test OA TLB invalidate");
> +	igt_subtest("gen12-oa-tlb-invalidate") {
> +		igt_require(intel_gen(devid) >= 12);
> +		gen12_test_oa_tlb_invalidate();
> +	}
> +
>   	igt_describe("Measure performance for a specific context using OAR in Gen 12");
>   	igt_subtest("gen12-unprivileged-single-ctx-counters") {
>   		igt_require(intel_gen(devid) >= 12);


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
