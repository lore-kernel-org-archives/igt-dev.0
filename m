Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0959489D44
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 09:52:52 +0000 (UTC)
References: <20200313174235.19440-1-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <85b5ba2a-e818-69de-e720-89d62acfce3d@intel.com>
Date: Mon, 16 Mar 2020 11:52:47 +0200
MIME-Version: 1.0
In-Reply-To: <20200313174235.19440-1-umesh.nerlige.ramappa@intel.com>
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

On 13/03/2020 19:42, Umesh Nerlige Ramappa wrote:
> Run 2 blocking tests back to back and compare the number of OA reports
> captured. Make sure the number of reports are within an acceptable range
> of the expected number of reports.
>
> v2: Drop poll and use blocking IO (Lionel)
> v3: Verify number of expected reports for both tests (Lionel)
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/perf.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
>
> diff --git a/tests/perf.c b/tests/perf.c
> index 5e818030..b757e307 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -2265,6 +2265,92 @@ test_polling(void)
>   	__perf_close(stream_fd);
>   }
>   
> +static int
> +num_valid_reports_captured(struct drm_i915_perf_open_param *param,
> +			   int64_t *duration_ns)
> +{
> +	uint8_t buf[1024 * 1024];
> +	int64_t start, end;
> +	int num_reports = 0;
> +
> +	igt_debug("Expected duration = %lu\n", *duration_ns);
> +
> +	stream_fd = __perf_open(drm_fd, param, true);
> +
> +	start = get_time();
> +	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
> +	for (/* nop */; ((end = get_time()) - start) < *duration_ns; /* nop */) {
> +		struct drm_i915_perf_record_header *header;
> +		int ret;
> +
> +		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
> +		       errno == EINTR)
> +			;
> +
> +		igt_assert(ret > 0);
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
> +	*duration_ns = end - start;
> +
> +	igt_debug("Actual duration = %lu\n", *duration_ns);
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
> +			I915_PERF_FLAG_DISABLED,
> +		.num_properties = sizeof(properties) / 16,
> +		.properties_ptr = to_user_pointer(properties),
> +	};
> +	int num_reports1, num_reports2, num_expected_reports;
> +	int64_t duration;
> +	
> +	/* Capture reports for 5 seconds twice and then make sure you get around
> +	 * the same number of reports. In the case of failure, the number of
> +	 * reports will vary largely since the beginning of the OA buffer
> +	 * will have invalid entries.
> +	 */
> +	duration = 5LL * NSEC_PER_SEC;
> +	num_reports1 = num_valid_reports_captured(&param, &duration);
> +	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent);
> +	igt_debug("expected num reports = %d\n", num_expected_reports);
> +	igt_debug("actual num reports = %d\n", num_reports1);
> +	igt_assert(num_reports1 > 0.95 * num_expected_reports);
> +
> +	duration = 5LL * NSEC_PER_SEC;
> +	num_reports2 = num_valid_reports_captured(&param, &duration);
> +	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent);
> +	igt_debug("expected num reports = %d\n", num_expected_reports);
> +	igt_debug("actual num reports = %d\n", num_reports2);
> +	igt_assert(num_reports2 > 0.95 * num_expected_reports);
> +}
> +
> +
>   static void
>   test_buffer_fill(void)
>   {
> @@ -4622,6 +4708,12 @@ igt_main
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
