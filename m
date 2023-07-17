Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 17 Jul 2023 14:53:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <ZLWOJ+EDk1jyBk37@intel.com>
References: <20230717165318.831766-1-tvrtko.ursulin@linux.intel.com>
 <20230717171219.832728-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717171219.832728-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915_pm_rps: Fix test after
 silent conflict
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 06:12:19PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> A silent conflict sneaked in as I was merging
> d86ca7e17b58 ("tests/i915_pm_rps: Exercise sysfs thresholds") in a way
> that igt_sysfs_set_u32 has became a function returning void.
> 
> Assert is now built-in so drop it from the test.
> 
> v2:
>  * Fix invalid value test.
>  * Assert new values after write while at it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: d86ca7e17b58 ("tests/i915_pm_rps: Exercise sysfs thresholds")
> Reference: 54dc25efaf10 ("lib/igt_sysfs: add asserting helpers for read/write operations")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/i915_pm_rps.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index 68bb99d62c19..15c74cc703c2 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -988,6 +988,28 @@ static igt_spin_t *spin_sync_gt(int i915, uint64_t ahnd, unsigned int gt,
>  	return __igt_sync_spin(i915, ahnd, *ctx, &e);
>  }
>  
> +static void sysfs_fail_set_u32(int dir, const char *attr, uint32_t set)
> +{
> +	u32 old, new;
> +	bool ret;
> +
> +	old = igt_sysfs_get_u32(dir, attr);
> +	ret = __igt_sysfs_set_u32(dir, attr, set);
> +	igt_assert_eq(ret, false);
> +	new = igt_sysfs_get_u32(dir, attr);
> +	igt_assert_eq(old, new);
> +}
> +
> +static void sysfs_set_u32(int dir, const char *attr, uint32_t set)
> +{
> +	u32 new;
> +
> +	igt_sysfs_set_u32(dir, attr, set);
> +
> +	new = igt_sysfs_get_u32(dir, attr);
> +	igt_assert_eq(set, new);
> +}
> +
>  #define TEST_IDLE 0x1
>  #define TEST_PARK 0x2
>  static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
> @@ -1010,8 +1032,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
>  	igt_require(def_up && def_down);
>  
>  	/* Check invalid percentages are rejected */
> -	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", 101), false);
> -	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", 101), false);
> +	sysfs_fail_set_u32(sysfs, "rps_up_threshold_pct", 101);
> +	sysfs_fail_set_u32(sysfs, "rps_down_threshold_pct", 101);
>  
>  	/*
>  	 * Invent some random up-down thresholds, but always include 0 and 100
> @@ -1034,8 +1056,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
>  	/* Exercise the thresholds with a GPU load to trigger park/unpark etc */
>  	for (i = 0; i < points; i++) {
>  		igt_info("Testing thresholds up %u%% and down %u%%...\n", ta[i], tb[i]);
> -		igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", ta[i]), true);
> -		igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", tb[i]), true);
> +		sysfs_set_u32(sysfs, "rps_up_threshold_pct", ta[i]);
> +		sysfs_set_u32(sysfs, "rps_down_threshold_pct", tb[i]);
>  
>  		if (flags & TEST_IDLE) {
>  			gem_quiescent_gpu(i915);
> @@ -1069,8 +1091,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
>  	gem_quiescent_gpu(i915);
>  
>  	/* Restore defaults */
> -	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", def_up), true);
> -	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", def_down), true);
> +	sysfs_set_u32(sysfs, "rps_up_threshold_pct", def_up);
> +	sysfs_set_u32(sysfs, "rps_down_threshold_pct", def_down);
>  
>  	free(ta);
>  	free(tb);
> -- 
> 2.39.2
> 
