Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1910E06D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 05:03:56 +0000 (UTC)
Message-ID: <41b2060a-329c-44d1-a176-ff3e268c2571@intel.com>
Date: Tue, 14 Nov 2023 10:33:45 +0530
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231114045224.622841-1-sujaritha.sundaresan@intel.com>
 <20231114045224.622841-6-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231114045224.622841-6-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v3 5/6] tests/intel: Print drpc info for
 rc6_residency test
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



On 11/14/2023 10:22 AM, Sujaritha Sundaresan wrote:
> Add dprc debug dump to help assertain if we are hitting
> genuine rc6 failures.
> 
> v3: Fix review comments (Riana)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/i915_pm_rc6_residency.c | 51 ++++++++++++++++++++++-------
>   1 file changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index 0f427687d..5687852cb 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -36,6 +36,7 @@
>   #include "i915/gem.h"
>   #include "i915/gem_create.h"
>   #include "igt.h"
> +#include "igt_debugfs.h"
>   #include "igt_perf.h"
>   #include "igt_power.h"
>   #include "igt_sysfs.h"
> @@ -63,6 +64,8 @@
>   #define RC6P_ENABLED	2
>   #define RC6PP_ENABLED	4
>   
> +char *drpc;
> +
>   static int sysfs;
>   
>   struct residencies {
> @@ -230,14 +233,25 @@ static uint64_t pmu_read_single(int fd)
>   	return __pmu_read_single(fd, NULL);
>   }
>   
> -#define __assert_within_epsilon(x, ref, tol_up, tol_down) \
> -	igt_assert_f((x) <= (ref) * (1.0 + (tol_up)/100.) && \
> -		     (x) >= (ref) * (1.0 - (tol_down)/100.), \
> -		     "'%s' != '%s' (%.3g not within +%d%%/-%d%% tolerance of %.3g)\n",\
> -		     #x, #ref, (double)(x), (tol_up), (tol_down), (double)(ref))
> +#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
> +	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
> +		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
> +		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n %s\n",\
> +		     #x, #ref, (double)(x), \
> +		     (tol_up) * 100.0, (tol_down) * 100.0, \
> +		     (double)(ref), debug_data)
> +
> +#define assert_within_epsilon(x, ref, tolerance, debug_data) \
> +	__assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
> +
> +static char *get_drpc(int i915, int gt_id)
> +{
> +	int gt_dir;
>   
> -#define assert_within_epsilon(x, ref, tolerance) \
> -	__assert_within_epsilon(x, ref, tolerance, tolerance)
> +	gt_dir = igt_debugfs_gt_dir(i915, gt_id);
> +	igt_assert(gt_dir != -1);
> +	return igt_sysfs_get(gt_dir, "drpc");
> +}
>   
>   static bool __pmu_wait_for_rc6(int fd)
>   {
> @@ -414,7 +428,9 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
>   			idle, (idle * 1e9) / slept);
>   	}
> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
> +	drpc = get_drpc(i915, gt);
> +
> +	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>   
>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   
> @@ -450,7 +466,12 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   		igt_assert(cycles >= SLEEP_DURATION);
>   
>   		/* While very nearly idle, expect full RC6 */
> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
> +		drpc = get_drpc(i915, gt);
> +
> +		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
> +
> +		free(drpc);
> +		drpc = NULL;
>   	}
>   
>   	munmap(done, 4096);
> @@ -503,7 +524,9 @@ static void rc6_fence(int i915, unsigned int gt)
>   			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
>   			idle, (idle * 1e9) / slept);
>   	}
> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
> +	drpc = get_drpc(i915, gt);
> +
> +	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>   
>   	/* Submit but delay execution, we should be idle and conserving power */
>   	ctx = intel_ctx_create_for_gt(i915, gt);
> @@ -544,8 +567,13 @@ static void rc6_fence(int i915, unsigned int gt)
>   
>   		close(timeline);
>   
> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
> +		drpc = get_drpc(i915, gt);
> +
> +		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
>   		gem_quiescent_gpu(i915);
> +
> +		free(drpc);
> +		drpc = NULL;
>   	}
>   	put_ahnd(ahnd);
>   	intel_ctx_destroy(i915, ctx);
> @@ -642,6 +670,7 @@ igt_main
>   	}
>   
>   	igt_fixture {
> +		free(drpc);
>   		drm_close_driver(i915);
>   	}
>   }
