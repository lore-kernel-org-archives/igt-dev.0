Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2E510E02B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 20:10:09 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:10:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWjsGhB-EUVHmAjE@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
 <20231130184536.7-16-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130184536.7-16-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5 15/21] drm-uapi/xe: Crystal Reference Clock
 updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 06:45:30PM +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Crystal Reference Clock updates")
> 
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 11 ++++-------
>  lib/xe/xe_spin.c          |  2 +-
>  tests/intel/xe_query.c    | 35 +++++++++++++++++++++++++++--------
>  3 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 7ac8aaf78..0850e5ee5 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -280,8 +280,8 @@ struct drm_xe_mem_region {
>   * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
>   * .data points to this allocated structure.
>   *
> - * The query returns the engine cycles and the frequency that can
> - * be used to calculate the engine timestamp. In addition the
> + * The query returns the engine cycles, which along with GT's @reference_clock,
> + * can be used to calculate the engine timestamp. In addition the
>   * query returns a set of cpu timestamps that indicate when the command
>   * streamer cycle count was captured.
>   */
> @@ -309,9 +309,6 @@ struct drm_xe_query_engine_cycles {
>  	 */
>  	__u64 engine_cycles;
>  
> -	/** @engine_frequency: Frequency of the engine cycles in Hz. */
> -	__u64 engine_frequency;
> -
>  	/**
>  	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
>  	 * reading the engine_cycles register using the reference clockid set by the
> @@ -382,8 +379,8 @@ struct drm_xe_gt {
>  	__u16 type;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
> -	/** @clock_freq: A clock frequency for timestamp */
> -	__u32 clock_freq;
> +	/** @reference_clock: A clock frequency for timestamp */
> +	__u32 reference_clock;
>  	/**
>  	 * @near_mem_regions: Bit mask of instances from
>  	 * drm_xe_query_mem_regions that are nearest to the current engines
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index deba06f73..243e97047 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -23,7 +23,7 @@ static uint32_t read_timestamp_frequency(int fd, int gt_id)
>  	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
>  	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
>  
> -	return dev->gt_list->gt_list[gt_id].clock_freq;
> +	return dev->gt_list->gt_list[gt_id].reference_clock;
>  }
>  
>  static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 207785a38..7afea9945 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -280,7 +280,7 @@ test_query_gt_list(int fd)
>  	for (i = 0; i < gt_list->num_gt; i++) {
>  		igt_info("type: %d\n", gt_list->gt_list[i].type);
>  		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
> -		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
> +		igt_info("reference_clock: %u\n", gt_list->gt_list[i].reference_clock);
>  		igt_info("near_mem_regions: 0x%016llx\n",
>  		       gt_list->gt_list[i].near_mem_regions);
>  		igt_info("far_mem_regions: 0x%016llx\n",
> @@ -496,6 +496,23 @@ query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *resp)
>  	igt_assert(query.size);
>  }
>  
> +static uint32_t
> +__engine_reference_clock(int fd, int gt_id)
> +{
> +	uint32_t reference_clock = 0;
> +	struct xe_device *xe_dev = xe_device_get(fd);
> +
> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
> +		if (gt == gt_id) {
> +			reference_clock = xe_dev->gt_list->gt_list[gt].reference_clock;
> +			break;
> +		}
> +	}
> +	igt_assert(reference_clock);
> +
> +	return reference_clock;
> +}
> +
>  static void
>  __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  {
> @@ -506,7 +523,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  	int i, usable = 0;
>  	igt_spin_t *spin;
>  	uint64_t ahnd;
> -	uint32_t vm;
> +	uint32_t vm, engine_frequency1, engine_frequency2;

we should probably name this as eng_ref_clock1 and eng_ref_clock2.

'frequency' is the exact word that I was willing to avoid.

but anyway, this is in a place that is not going to cause confusion
and also this can come later, so


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  	struct {
>  		int32_t id;
>  		const char *name;
> @@ -539,28 +556,30 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  		ts2.clockid = clock[index].id;
>  
>  		query_engine_cycles(fd, &ts1);
> +		engine_frequency1 = __engine_reference_clock(fd, hwe->gt_id);
>  		query_engine_cycles(fd, &ts2);
> +		engine_frequency2 = __engine_reference_clock(fd, hwe->gt_id);
>  
>  		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
>  			  ts1.cpu_timestamp,
>  			  ts1.cpu_delta);
> -		igt_debug("[1] engine_ts %llu, freq %llu Hz, width %u\n",
> -			  ts1.engine_cycles, ts1.engine_frequency, ts1.width);
> +		igt_debug("[1] engine_ts %llu, freq %u Hz, width %u\n",
> +			  ts1.engine_cycles, engine_frequency1, ts1.width);
>  
>  		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
>  			  ts2.cpu_timestamp,
>  			  ts2.cpu_delta);
> -		igt_debug("[2] engine_ts %llu, freq %llu Hz, width %u\n",
> -			  ts2.engine_cycles, ts2.engine_frequency, ts2.width);
> +		igt_debug("[2] engine_ts %llu, freq %u Hz, width %u\n",
> +			  ts2.engine_cycles, engine_frequency2, ts2.width);
>  
>  		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
>  
>  		if (ts2.engine_cycles >= ts1.engine_cycles)
>  			delta_cs = (ts2.engine_cycles - ts1.engine_cycles) *
> -				   NSEC_PER_SEC / ts1.engine_frequency;
> +				   NSEC_PER_SEC / engine_frequency1;
>  		else
>  			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
> -				   NSEC_PER_SEC / ts1.engine_frequency;
> +				   NSEC_PER_SEC / engine_frequency1;
>  
>  		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
>  			  delta_cpu, delta_cs);
> -- 
> 2.34.1
> 
