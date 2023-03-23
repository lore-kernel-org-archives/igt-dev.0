Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5993C10E041
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 05:03:53 +0000 (UTC)
Message-ID: <f64c1019-002e-e732-7767-32cd63ff99f2@intel.com>
Date: Thu, 23 Mar 2023 10:33:39 +0530
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230322230402.3342787-1-ashutosh.dixit@intel.com>
 <20230322230402.3342787-3-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230322230402.3342787-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/i915_power: Also show
 requested and actual freq's
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



On 3/23/2023 4:34 AM, Ashutosh Dixit wrote:
> When power limits are in effect, in addition to measured power it is also
> important to see the requested and actual freq's and see how they change
> with set power limits. Add this to the test output.
> 
> v2: Display power for each gt (Riana)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/i915/i915_power.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> index f2fd228698a..abf458573ef 100644
> --- a/tests/i915/i915_power.c
> +++ b/tests/i915/i915_power.c
> @@ -5,6 +5,7 @@
>   
>   #include "igt.h"
>   #include "i915/gem.h"
> +#include "igt_sysfs.h"
>   #include "igt_power.h"
>   
>   IGT_TEST_DESCRIPTION("i915 power measurement tests");
> @@ -27,6 +28,7 @@ static void sanity(int i915)
>   	double idle, busy;
>   	igt_spin_t *spin;
>   	uint64_t ahnd;
> +	int dir, gt, req, act;
>   
>   #define DURATION_SEC 2
>   
> @@ -34,6 +36,7 @@ static void sanity(int i915)
>   	igt_require(!igt_power_open(i915, &pwr, "gpu"));
>   	gem_quiescent_gpu(i915);
>   	idle = measure_power(&pwr, DURATION_SEC);
> +	igt_info("Measured idle power: %g mW\n", idle);
>   
>   	/* Busy power */
>   	ctx = intel_ctx_create_all_physical(i915);
> @@ -44,12 +47,17 @@ static void sanity(int i915)
>   	/* Wait till at least one spinner starts */
>   	igt_spin_busywait_until_started(spin);
>   	busy = measure_power(&pwr, DURATION_SEC);
> +	i915_for_each_gt(i915, gt, dir) {
> +		req = igt_sysfs_get_u32(dir, "rps_cur_freq_mhz");
> +		act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
> +		igt_info("gt %d: req MHz: %d, act MHz: %d\n", gt, req, act);
> +	}
>   	igt_free_spins(i915);
>   	put_ahnd(ahnd);
>   	intel_ctx_destroy(i915, ctx);
>   	igt_power_close(&pwr);
>   
> -	igt_info("Measured power: idle: %g mW, busy: %g mW\n", idle, busy);
> +	igt_info("Measured busy power: %g mW\n", busy);
>   	igt_assert(idle >= 0 && busy > 0 && busy > idle);
>   }
>   
