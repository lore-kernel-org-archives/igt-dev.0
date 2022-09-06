Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB3810E5B3
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:36:53 +0000 (UTC)
Message-ID: <d302121e-4c23-92ab-e6ed-baf17fa02eb0@intel.com>
Date: Tue, 6 Sep 2022 16:36:45 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-16-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 15/23] i915/perf: Fix CS timestamp vs OA
 timstamp mismatch
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
> CS timestamp can have an additional configuration that shifts the
> timestamp value by a specified number of bits. On DG2, this additional
> configuration is ignored by OA, so OA timestamps are missing the shift.
>
> Add newly defined interface to get the exact OA timestamp frequency so
> that the deltas can be accurately calculated.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   include/drm-uapi/i915_drm.h |  6 ++++++
>   lib/i915/perf.c             |  6 +++++-
>   tests/i915/perf.c           | 37 +++++++++++++++++++++++++++++++++++--
>   3 files changed, 46 insertions(+), 3 deletions(-)
>
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index c7587a0f..11c40811 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -749,6 +749,12 @@ typedef struct drm_i915_irq_wait {
>   /* Query if the kernel supports the I915_USERPTR_PROBE flag. */
>   #define I915_PARAM_HAS_USERPTR_PROBE 56
>   
> +/*
> + * Frequency of the timestamps in OA reports. This used to be the same as the CS
> + * timestamp frequency, but differs on some platforms.
> + */
> +#define I915_PARAM_OA_TIMESTAMP_FREQUENCY 57
> +
>   /* Must be kept compact -- no holes and well documented */
>   
>   typedef struct drm_i915_getparam {
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 3f131aaa..2f24cbd8 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -464,7 +464,11 @@ intel_perf_for_fd(int drm_fd)
>   	close(sysfs_dir_fd);
>   
>   	if (getparam(drm_fd, I915_PARAM_CHIPSET_ID, &device_id) ||
> -	    getparam(drm_fd, I915_PARAM_REVISION, &device_revision) ||
> +	    getparam(drm_fd, I915_PARAM_REVISION, &device_revision))
> +		return NULL;
> +
> +	/* if OA_TIMESTAMP_FREQUENCY is not supported, fall back to CS_TIMESTAMP_FREQUENCY */
> +	if (getparam(drm_fd, I915_PARAM_OA_TIMESTAMP_FREQUENCY, &timestamp_frequency) &&
>   	    getparam(drm_fd, I915_PARAM_CS_TIMESTAMP_FREQUENCY, &timestamp_frequency))
>   		return NULL;
>   
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 3caf7cac..3eb31f3b 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -453,6 +453,29 @@ gen8_read_report_reason(const uint32_t *report)
>   		return "unknown";
>   }
>   
> +static uint32_t
> +cs_timestamp_frequency(int fd)
> +{
> +	struct drm_i915_getparam gp = {};
> +	static uint32_t value = 0;
> +
> +	if (value)
> +		return value;
> +
> +	gp.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY;
> +	gp.value = (int *)(&value);
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp), 0);
> +
> +	return value;
> +}
> +
> +static uint64_t
> +cs_timebase_scale(uint32_t u32_delta)
> +{
> +	return ((uint64_t)u32_delta * NSEC_PER_SEC) / cs_timestamp_frequency(drm_fd);
> +}
> +
>   static uint64_t
>   timebase_scale(uint32_t u32_delta)
>   {
> @@ -543,6 +566,15 @@ oa_report_get_ctx_id(uint32_t *report)
>   	return report[2];
>   }
>   
> +static int
> +oar_unit_default_format(void)
> +{
> +	if (IS_DG2(devid))
> +		return I915_OAR_FORMAT_A32u40_A4u32_B8_C8;
> +
> +	return test_set->perf_oa_format;
> +}
> +
>   /*
>    * Temporary wrapper to distinguish mappings on !llc platforms,
>    * where it seems cache over GEM_MMAP_OFFSET is not flushed before execution.
> @@ -3959,6 +3991,7 @@ again:
>   
>   static void gen12_single_ctx_helper(void)
>   {
> +	uint64_t fmt = oar_unit_default_format();
>   	uint64_t properties[] = {
>   		/* Have a random value here for the context id, but initialize
>   		 * it once you figure out the context ID for the work to be
> @@ -3974,7 +4007,7 @@ static void gen12_single_ctx_helper(void)
>   		 * values.
>   		 */
>   		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
> -		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
> +		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
>   	};
>   	struct drm_i915_perf_open_param param = {
>   		.flags = I915_PERF_FLAG_FD_CLOEXEC,
> @@ -4202,7 +4235,7 @@ static void gen12_single_ctx_helper(void)
>   	/* Sanity check that we can pass the delta to timebase_scale */
>   	igt_assert(delta_ts64 < UINT32_MAX);
>   	delta_oa32_ns = timebase_scale(delta_oa32);
> -	delta_ts64_ns = timebase_scale(delta_ts64);
> +	delta_ts64_ns = cs_timebase_scale(delta_ts64);
>   
>   	igt_debug("oa32 delta = %u, = %uns\n",
>   			delta_oa32, (unsigned)delta_oa32_ns);

