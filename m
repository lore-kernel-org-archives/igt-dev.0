Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C999310E1F3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 16:51:01 +0000 (UTC)
Date: Wed, 15 Mar 2023 17:50:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230315165040.6ncplojdfpycrvk2@kamilkon-desk1>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-25-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215004648.2100655-25-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 24/31] i915/perf: Run non-zero-reason on
 media engines as well
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-02-14 at 16:46:41 -0800, Umesh Nerlige Ramappa wrote:
> Enable non-zero-reason test to run on media engines as well.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/perf.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 15f9202d..2e902d74 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -2908,18 +2908,23 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
>  }
>  
>  static void
> -test_non_zero_reason(void)
> +test_non_zero_reason(const struct intel_execution_engine2 *e)
>  {
>  	/* ~20 micro second period */
>  	int oa_exponent = max_oa_exponent_for_period_lte(20000);
> +	struct intel_perf_metric_set *test_set = metric_set(e);
> +	uint64_t fmt = test_set->perf_oa_format;
> +	size_t report_size = get_oa_format(fmt).size;
>  	uint64_t properties[] = {
>  		/* Include OA reports in samples */
>  		DRM_I915_PERF_PROP_SAMPLE_OA, true,
>  
>  		/* OA unit configuration */
> -		DRM_I915_PERF_PROP_OA_METRICS_SET, default_test_set->perf_oa_metrics_set,
> -		DRM_I915_PERF_PROP_OA_FORMAT, default_test_set->perf_oa_format,
> +		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
> +		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
>  		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
> +		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, e->class,
> +		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, e->instance,
>  	};
>  	struct drm_i915_perf_open_param param = {
>  		.flags = I915_PERF_FLAG_FD_CLOEXEC,
> @@ -2927,7 +2932,7 @@ test_non_zero_reason(void)
>  		.properties_ptr = to_user_pointer(properties),
>  	};
>  	struct drm_i915_perf_record_header *header;
> -	uint32_t buf_size = 3 * 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
> +	uint32_t buf_size = 3 * 65536 * (report_size + sizeof(struct drm_i915_perf_record_header));
>  	uint8_t *buf = malloc(buf_size);
>  	uint32_t total_len = 0, reports_lost;
>  	const uint32_t *last_report;
> @@ -2972,10 +2977,9 @@ test_non_zero_reason(void)
>  
>  			igt_assert_neq(reason, 0);
>  
> -			if (last_report) {
> -				sanity_check_reports(last_report, report,
> -						     default_test_set->perf_oa_format);
> -			}
> +			if (last_report)
> +				sanity_check_reports(last_report, report, fmt);
> +
>  			last_report = report;
>  			break;
>  		}
> @@ -5797,10 +5801,11 @@ igt_main
>  			test_buffer_fill(e);
>  
>  	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
> -	igt_subtest("non-zero-reason") {
> +	igt_subtest_with_dynamic("non-zero-reason") {
>  		/* Reason field is only available on Gen8+ */
>  		igt_require(intel_gen(devid) >= 8);
> -		test_non_zero_reason();
> +		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
> +			test_non_zero_reason(e);
>  	}
>  
>  	igt_subtest("disabled-read-error")
> -- 
> 2.36.1
> 
