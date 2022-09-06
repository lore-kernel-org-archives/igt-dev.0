Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF74E10E699
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 14:08:42 +0000 (UTC)
Message-ID: <1d488a84-e6b0-3590-422b-ac4abaa970aa@intel.com>
Date: Tue, 6 Sep 2022 17:08:34 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-15-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 14/23] i915/perf: Add a test for
 non-power-of-2 oa reports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 23/08/2022 21:30, Umesh Nerlige Ramappa wrote:
> Some OA report sizes are no longer a power of 2. Verify that such
> reports can be correctly read across the OA buffer boundaries.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


It seems you've disabled the load helper to avoid checking the content 
of the report?

I think the A counters should still be defined same as before and we 
could still check their value.


> ---
>   tests/i915/perf.c | 34 +++++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index d601eb36..3caf7cac 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -2681,7 +2681,7 @@ test_buffer_fill(void)
>   }
>   
>   static void
> -test_non_zero_reason(void)
> +test_multi_buffer_fills(uint64_t format, uint64_t oa_buf_size, bool load)
>   {
>   	/* ~20 micro second period */
>   	int oa_exponent = max_oa_exponent_for_period_lte(20000);
> @@ -2691,7 +2691,7 @@ test_non_zero_reason(void)
>   
>   		/* OA unit configuration */
>   		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
> -		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
> +		DRM_I915_PERF_PROP_OA_FORMAT, format,
>   		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
>   	};
>   	struct drm_i915_perf_open_param param = {
> @@ -2700,7 +2700,9 @@ test_non_zero_reason(void)
>   		.properties_ptr = to_user_pointer(properties),
>   	};
>   	struct drm_i915_perf_record_header *header;
> -	uint32_t buf_size = 3 * 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
> +	size_t report_size = get_oa_format(format).size;
> +	uint32_t buf_size = 3 * (oa_buf_size / report_size) *
> +		(report_size + sizeof(struct drm_i915_perf_record_header));
>   	uint8_t *buf = malloc(buf_size);
>   	uint32_t total_len = 0, reports_lost;
>   	const uint32_t *last_report;
> @@ -2710,8 +2712,10 @@ test_non_zero_reason(void)
>   
>   	igt_debug("Ready to read about %u bytes\n", buf_size);
>   
> -	load_helper_init();
> -	load_helper_run(HIGH);
> +	if (load) {
> +		load_helper_init();
> +		load_helper_run(HIGH);
> +	}
>   
>   	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>   
> @@ -2724,8 +2728,10 @@ test_non_zero_reason(void)
>   
>   	__perf_close(stream_fd);
>   
> -	load_helper_stop();
> -	load_helper_fini();
> +	if (load) {
> +		load_helper_stop();
> +		load_helper_fini();
> +	}
>   
>   	igt_debug("Got %u bytes\n", total_len);
>   
> @@ -2747,7 +2753,7 @@ test_non_zero_reason(void)
>   
>   			if (last_report) {
>   				sanity_check_reports(last_report, report,
> -						     test_set->perf_oa_format);
> +						     format);
>   			}
>   			last_report = report;
>   			break;
> @@ -5137,6 +5143,14 @@ igt_main
>   	igt_subtest("oa-formats")
>   		test_oa_formats();
>   
> +	igt_describe("Test OA buffer for non power of 2 report sizes");
> +	igt_subtest("non-power-of-2-oa-formats") {
> +		igt_require(IS_DG2(devid));
> +		test_multi_buffer_fills(I915_OA_FORMAT_A38u64_R2u64_B8_C8,
> +					MAX_OA_BUF_SIZE,
> +					false);
> +	}


We could actually iterator over non power of 2 report sizes :


for (unsigned r = 0; r < ARRAY_SIZE(gen12_oa_formats); r++) {

     if (__builtin_popcount(gen12_oa_formats[r].size) == 1)

         continue;

     igt_describe("Test OA buffer for %s format", 
gen12_oa_formats[r].name);

     igt_subtest_f("oa-format-%s", gen12_oa_formats[r].name) {

         igt_require(intel_gen(devid) >= 12);

         test_multi_buffer_fills(r, MAX_OA_BUF_SIZE, false);

     }

}


> +
>   	igt_subtest("invalid-oa-exponent")
>   		test_invalid_oa_exponent();
>   	igt_subtest("low-oa-exponent-permissions")
> @@ -5156,7 +5170,9 @@ igt_main
>   	igt_subtest("non-zero-reason") {
>   		/* Reason field is only available on Gen8+ */
>   		igt_require(intel_gen(devid) >= 8);
> -		test_non_zero_reason();
> +		test_multi_buffer_fills(test_set->perf_oa_format,
> +					MAX_OA_BUF_SIZE,
> +					true);
>   	}
>   
>   	igt_subtest("disabled-read-error")

