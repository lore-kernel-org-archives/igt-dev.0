Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 5 Jan 2024 12:33:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/perf_pmu: Restore sysfs freq in exit handler
Message-ID: <20240105113330.zyvhe33igdugsakh@kamilkon-desk.igk.intel.com>
References: <20240105011000.138538-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240105011000.138538-1-vinay.belgaumkar@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vinay,
On 2024-01-04 at 17:10:00 -0800, Vinay Belgaumkar wrote:

looks good, there are some nits, first about subject:

[PATCH i-g-t] tests/perf_pmu: Restore sysfs freq in exit handler

s!tests/perf_pmu:!tests/intel/perf_pmu:!
Also you can drop "sysfs", so it will look:

[PATCH i-g-t] tests/intel/perf_pmu: Restore freq in exit handler

> Seeing random issues where this test starts with invalid values.

Btw if issue is it starts with invalid values maybe culprit is in
some previous test, not this one? What about setting freq values
to defaults first? This can be done in separate patch.

I looked into log from test here:
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1438/bat-dg2-11/igt_runner10.txt
and here:
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1438/bat-dg2-11/igt@perf_pmu@frequency@gt0.html

One more thing, why is boost < max? Is it allowed? What about
just restore it to max (or other value?) before testing and
skipping only when min == max? But even then it seems like
restoring defaults should be first step before freq checks.

For more nits see below.

> Ensure that we restore the frequencies in case test exits early
> due to some system issues.
> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/9432
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  tests/intel/perf_pmu.c | 53 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index c6e6a8b77..ceacc1d3d 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -2454,12 +2454,59 @@ static void pmu_read(int i915)
>  		for_each_if((e)->class == I915_ENGINE_CLASS_RENDER) \
>  			igt_dynamic_f("%s", e->name)
>  
> +int fd = -1;
> +uint32_t *stash_min, *stash_max, *stash_boost;
> +
> +static void save_sysfs_freq(int i915)
> +{
> +	int gt, num_gts, sysfs, tmp;
> +
> +	num_gts = igt_sysfs_get_num_gt(i915);
> +
> +	stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> +	stash_max = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> +	stash_boost = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> +
> +	/* Save boost, min and max across GTs */
> +	i915_for_each_gt(i915, tmp, gt) {
> +		sysfs = igt_sysfs_gt_open(i915, gt);
> +		igt_require(sysfs >= 0);
> +
> +		stash_min[gt] = igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz");
> +		stash_max[gt] = igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz");
> +		stash_boost[gt] = igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
> +		igt_debug("GT: %d, min: %d, max: %d, boost:%d\n",
> +			  gt, stash_min[gt], stash_max[gt], stash_boost[gt]);
> +
> +		close(sysfs);
> +	}
> +}
> +
> +static void restore_sysfs_freq(int sig)
> +{
> +	int sysfs, gt, tmp;
> +
> +	/* Restore frequencies */
> +	i915_for_each_gt(fd, tmp, gt) {
> +		sysfs = igt_sysfs_gt_open(fd, gt);
> +		igt_require(sysfs >= 0);
--------^
Don't use require at exit handler, better use continue.

> +
> +		igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", stash_max[gt]));
--------^
Same here.

> +		igt_require(__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", stash_min[gt]));
--------^
Same.

> +		igt_require(__igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", stash_boost[gt]));
--------^
Same.

> +
> +		close(sysfs);
> +	}
> +	free(stash_min);
> +	free(stash_max);

Free also stash_boost.

> +}
> +
>  igt_main
>  {
>  	const struct intel_execution_engine2 *e;
>  	unsigned int num_engines = 0;
>  	const intel_ctx_t *ctx = NULL;
> -	int gt, tmp, fd = -1;
> +	int gt, tmp;
>  	int num_gt = 0;
>  
>  	/**
> @@ -2482,6 +2529,7 @@ igt_main
>  
>  		i915_for_each_gt(fd, tmp, gt)
>  			num_gt++;
> +

Remove this empty line.

Regards,
Kamil

>  	}
>  
>  	igt_describe("Verify i915 pmu dir exists and read all events");
> @@ -2664,6 +2712,9 @@ igt_main
>  	 * Test GPU frequency.
>  	 */
>  	igt_subtest_with_dynamic("frequency") {
> +		save_sysfs_freq(fd);
> +		igt_install_exit_handler(restore_sysfs_freq);
> +
>  		i915_for_each_gt(fd, tmp, gt) {
>  			igt_dynamic_f("gt%u", gt)
>  				test_frequency(fd, gt);
> -- 
> 2.38.1
> 
