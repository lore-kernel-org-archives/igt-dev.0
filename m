Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EC110E498
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 13:32:28 +0000 (UTC)
Date: Tue, 7 Mar 2023 14:32:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230307133223.edu4bprpas3ta7lr@kamilkon-desk1>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-12-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215004648.2100655-12-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 11/31] i915/perf: Move OA format array
 from stack to heap
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

Hi Umesh,

On 2023-02-14 at 16:46:28 -0800, Umesh Nerlige Ramappa wrote:
> The OA format size will change based on the specific format used in some
> of the tests. In preparation for that, allocated the space required for
> the format on heap.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  tests/i915/perf.c | 48 ++++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index e9613dc9..add41f7d 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -1950,9 +1950,9 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
>  		uint8_t *buf = calloc(1, buf_size);
>  		int ret, n_timer_reports = 0;
>  		uint32_t matches = 0;
> -		struct {
> -			uint32_t report[64];
> -		} timer_reports[30];
> +#define NUM_TIMER_REPORTS 30
> +		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);

I assume that format_size is size in bytes.

> +		uint32_t *timer_reports = reports;
>  
>  		igt_debug("testing OA exponent %d,"
>  			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
> @@ -1963,7 +1963,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
>  
>  		stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>  
> -		while (n_timer_reports < ARRAY_SIZE(timer_reports)) {
> +		while (n_timer_reports < NUM_TIMER_REPORTS) {
>  			struct drm_i915_perf_record_header *header;
>  
>  			while ((ret = read(stream_fd, buf, buf_size)) < 0 &&
> @@ -1976,7 +1976,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
>  			igt_assert(ret > 0);
>  
>  			for (int offset = 0;
> -			     offset < ret && n_timer_reports < ARRAY_SIZE(timer_reports);
> +			     offset < ret && n_timer_reports < NUM_TIMER_REPORTS;
>  			     offset += header->size) {
>  				uint32_t *report;
>  
> @@ -1998,25 +1998,25 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
>  				if (!oa_report_is_periodic(exponent, report))
>  					continue;
>  
> -				memcpy(timer_reports[n_timer_reports].report, report,
> -				       sizeof(timer_reports[n_timer_reports].report));
> +				memcpy(timer_reports, report, format_size);
>  				n_timer_reports++;
> +				timer_reports += (format_size / 4);
--------------------------------------------------------------- ^
imho better: / sizeof(*timer_reports)

				timer_reports += (format_size / sizeof(*timer_reports));

With or without this,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
 
>  			}
>  		}
>  
>  		__perf_close(stream_fd);
>  
>  		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
> -			  oa_timestamp(timer_reports[0].report, fmt),
> -			  oa_report_get_ctx_id(timer_reports[0].report));
> +			  oa_timestamp(&reports[0], fmt),
> +			  oa_report_get_ctx_id(&reports[0]));
>  		for (int i = 1; i < n_timer_reports; i++) {
> -			uint64_t delta = oa_timestamp_delta(timer_reports[i].report,
> -							    timer_reports[i - 1].report,
> +			uint64_t delta = oa_timestamp_delta(&reports[i],
> +							    &reports[i - 1],
>  							    fmt);
>  
>  			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
> -				  oa_timestamp(timer_reports[i].report, fmt),
> -				  oa_report_get_ctx_id(timer_reports[i].report),
> +				  oa_timestamp(&reports[i], fmt),
> +				  oa_report_get_ctx_id(&reports[i]),
>  				  delta, expected_report_timing_delta(delta,
>  								      expected_timestamp_delta) ? "" : "******");
>  
> @@ -2033,6 +2033,8 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
>  		 * etc...
>  		 */
>  		igt_assert_lte(n_timer_reports / 2, matches);
> +
> +		free(reports);
>  	}
>  
>  	load_helper_stop();
> @@ -2754,13 +2756,14 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
>  		.properties_ptr = to_user_pointer(properties),
>  	};
>  	struct drm_i915_perf_record_header *header;
> -	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
> +	size_t report_size = get_oa_format(fmt).size;
> +	int buf_size = 65536 * (report_size + sizeof(struct drm_i915_perf_record_header));
>  	uint8_t *buf = malloc(buf_size);
>  	int len;
>  	size_t oa_buf_size = MAX_OA_BUF_SIZE;
> -	size_t report_size = get_oa_format(fmt).size;
>  	int n_full_oa_reports = oa_buf_size / report_size;
>  	uint64_t fill_duration = n_full_oa_reports * oa_period;
> +	uint32_t *last_periodic_report = malloc(report_size / 4);
>  
>  	igt_assert(fill_duration < 1000000000);
>  
> @@ -2770,7 +2773,6 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
>  		bool overflow_seen;
>  		uint32_t n_periodic_reports;
>  		uint32_t first_timestamp = 0, last_timestamp = 0;
> -		uint32_t last_periodic_report[64];
>  
>  		do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
>  
> @@ -2849,8 +2851,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
>  						break;
>  
>  					if (oa_report_is_periodic(oa_exponent, report)) {
> -						memcpy(last_periodic_report, report,
> -						       sizeof(last_periodic_report));
> +						memcpy(last_periodic_report, report, report_size);
>  						n_periodic_reports++;
>  					}
>  					break;
> @@ -2876,6 +2877,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
>  			   report_size * n_full_oa_reports * 0.55);
>  	}
>  
> +	free(last_periodic_report);
>  	free(buf);
>  
>  	__perf_close(stream_fd);
> @@ -2990,12 +2992,13 @@ test_enable_disable(const struct intel_execution_engine2 *e)
>  				  (ARRAY_SIZE(properties) / 2) - 2,
>  		.properties_ptr = to_user_pointer(properties),
>  	};
> -	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
> +	size_t report_size = get_oa_format(fmt).size;
> +	int buf_size = 65536 * (report_size + sizeof(struct drm_i915_perf_record_header));
>  	uint8_t *buf = malloc(buf_size);
>  	size_t oa_buf_size = MAX_OA_BUF_SIZE;
> -	size_t report_size = get_oa_format(fmt).size;
>  	int n_full_oa_reports = oa_buf_size / report_size;
>  	uint64_t fill_duration = n_full_oa_reports * oa_period;
> +	uint32_t *last_periodic_report = malloc(report_size / 4);
>  
>  	load_helper_init();
>  	load_helper_run(HIGH);
> @@ -3007,7 +3010,6 @@ test_enable_disable(const struct intel_execution_engine2 *e)
>  		uint32_t n_periodic_reports;
>  		struct drm_i915_perf_record_header *header;
>  		uint64_t first_timestamp = 0, last_timestamp = 0;
> -		uint32_t last_periodic_report[64];
>  
>  		/* Giving enough time for an overflow might help catch whether
>  		 * the OA unit has been enabled even if the driver might at
> @@ -3069,8 +3071,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
>  						break;
>  
>  					if (oa_report_is_periodic(oa_exponent, report)) {
> -						memcpy(last_periodic_report, report,
> -						       sizeof(last_periodic_report));
> +						memcpy(last_periodic_report, report, report_size);
>  
>  						/* We want to measure only the
>  						 * periodic reports, ctx-switch
> @@ -3113,6 +3114,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
>  		igt_assert_eq(errno, EIO);
>  	}
>  
> +	free(last_periodic_report);
>  	free(buf);
>  
>  	__perf_close(stream_fd);
> -- 
> 2.36.1
> 
