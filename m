Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D810E497
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 13:23:07 +0000 (UTC)
Date: Mon, 12 Sep 2022 16:23:01 +0300
From: Imre Deak <imre.deak@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Yx8ytepV2brDMFSD@ideak-desk.fi.intel.com>
References: <20220909114911.1852-1-swati2.sharma@intel.com>
 <20220909114911.1852-5-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909114911.1852-5-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/5] tests/i915/i915_pm_dc: Modify
 dc9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 05:19:10PM +0530, Swati Sharma wrote:
> Existing dc9 test is modified. Added new condition,
> runtime_suspended_time value should increases when system
> enters dc9. This condition will be checked for both igfx
> and dgfx whereas existing condition where we wait for
> dc counter to reset is limited only to igfx.
> 
> v3: -changed test design (imre)
> v4: -var name changed (imre)
>     -restricted counter reset condition to dg1 and dg2
>      platforms only (anshuman)
>     -swapped rpm vs dc9 wait order condition (imre)
> v5: -add macro DC9_RESETS_DC_COUNTERS (imre)
>     -combine both polling (imre)
>     -moved is_dgfx() realignment into patch 2/4 (imre)
>     -s/seconds/msecs/ (imre)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 54 ++++++++++++++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index bd4522275..142975e6c 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -31,8 +31,11 @@
>  #include "igt_kmod.h"
>  #include "igt_psr.h"
>  #include "igt_sysfs.h"
> +#include "igt_device.h"
> +#include "igt_device_scan.h"
>  #include "limits.h"
>  #include "time.h"
> +#include "igt_pm.h"
>  
>  /* DC State Flags */
>  #define CHECK_DC5	(1 << 0)
> @@ -43,6 +46,7 @@
>  #define RPM_STATUS "i915_runtime_pm_status"
>  #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>  #define KMS_POLL_DISABLE 0
> +#define DC9_RESETS_DC_COUNTERS(devid) !(IS_DG1(devid) || IS_DG2(devid))

Parens missing around the whole macro definition. 

>  IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>  
> @@ -416,42 +420,58 @@ static bool support_dc6(int debugfs_fd)
>  	return strstr(buf, "DC5 -> DC6 count");
>  }
>  
> -static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_target, int prev_dc, int seconds)
> +static int read_runtime_suspended_time(int drm_fd)
>  {
> -	/*
> -	 * since we do not have DC9 counter,
> -	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
> +	struct pci_device *i915;
> +	int ret;
> +
> +	i915 = igt_device_get_pci_device(drm_fd);
> +	ret = igt_pm_get_runtime_suspended_time(i915);
> +	igt_assert_lte(0, ret);
> +
> +	return ret;
> +}
> +
> +static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rpm, int msecs)
> +{
> +	/* runtime suspended residency should increment once DC9 is achieved;
> +	 * this condition is valid for all platforms.
> +	 * however, resetting of dc5/dc6 counter to check if display engine was in DC9;
> +	 * this condition at present can be skipped for dg1 and dg2 platforms.
>  	 */

The above should follow the multiline comment format.

> -	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
> -			prev_dc, seconds, 100);
> +	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) && (DC9_RESETS_DC_COUNTERS(data->devid) ?
> +			(read_dc_counter(data->debugfs_fd, dc_target) < prev_dc) : true), msecs, 100);

The above condition would be more readable as:

	rpm_time > prev_rpm &&
	(!DC9_RESETS_DC_COUNTERS || dc_counter < prev_dc)

Probably better to change the 100 msec polling interval to 1 sec, to
account for what the sleep(1) you remove later was supposed to
achieve.

With the above changes:
Reviewed-by: Imre Deak <imre.deak@intel.com>

>  }
>  
> -static void check_dc9(data_t *data, int dc_target, int prev_dc)
> +static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_rpm)
>  {
> -	igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc, 3000),
> +	igt_assert_f(dc9_wait_entry(data, dc_target, prev_dc, prev_rpm, 3000),
>  			"DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
>  			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
>  }
>  
>  static void setup_dc9_dpms(data_t *data, int dc_target)
>  {
> -	int prev_dc, sysfs_fd;
> +	int prev_dc, prev_rpm, sysfs_fd;

Let's init prev_dc to avoid passing it further as a random data (even if
it's not used).

>  	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
>  	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
>  	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>  	close(sysfs_fd);
> -	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
> -	setup_dc_dpms(data);
> -	dpms_off(data);
> -	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
> +	if (DC9_RESETS_DC_COUNTERS(data->devid)) {
> +		prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
> +		setup_dc_dpms(data);
> +		dpms_off(data);
> +		igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
>  				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
> -	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
> -	dpms_on(data);
> -	cleanup_dc_dpms(data);
> +		prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
> +		dpms_on(data);
> +		cleanup_dc_dpms(data);
> +	}
> +	prev_rpm = read_runtime_suspended_time(data->drm_fd);
>  	dpms_off(data);
>  	sleep(1); /* wait for counters reset*/
> -	check_dc9(data, dc_target, prev_dc);
> +	check_dc9(data, dc_target, prev_dc, prev_rpm);
>  	dpms_on(data);
>  }
>  
> -- 
> 2.25.1
> 
