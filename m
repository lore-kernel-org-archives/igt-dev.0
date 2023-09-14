Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539C710E1A9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 15:13:33 +0000 (UTC)
Message-ID: <bd71e4e9-9ad3-ab68-c366-b27f352e292f@intel.com>
Date: Thu, 14 Sep 2023 20:17:19 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230914140401.11101-1-swati2.sharma@intel.com>
 <20230914140401.11101-6-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230914140401.11101-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/intel/kms_pm_dc: Add XE
 support
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


On Thu-14-09-2023 07:34 pm, Swati Sharma wrote:
> Add XE driver support for kms pm tests.
> 
> v2: -drop unused header
>      -add DRIVER_XE
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/intel/kms_pm_dc.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index e7ba1f919..1e9ca5d6c 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -36,6 +36,8 @@
>   #include "limits.h"
>   #include "time.h"
>   #include "igt_pm.h"
> +#include "xe/xe_query.h"
> +
>   /**
>    * TEST: kms pm dc
>    * Category: Display
> @@ -44,7 +46,7 @@
>    * SUBTEST: dc3co-vpb-simulation
>    * Description: Make sure that system enters DC3CO when PSR2 is active and system
>    *              is in SLEEP state
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dc3co, pm_dc, psr2
>    * Mega feature: Display Power
>    * Test category: functionality test
> @@ -52,7 +54,7 @@
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Test category: functionality test
> @@ -60,14 +62,14 @@
>    * SUBTEST: dc5-dpms-negative
>    * Description: Validate negative scenario of DC5 display engine entry to DC5 state
>    *              while all connectors's DPMS property set to ON
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Test category: functionality test
>    *
>    * SUBTEST: dc5-psr
>    * Description: This test validates display engine entry to DC5 state while PSR is active
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: pm_dc, psr
>    * Mega feature: Display Power
>    * Test category: functionality test
> @@ -75,21 +77,21 @@
>    * SUBTEST: dc6-dpms
>    * Description: Validate display engine entry to DC6 state while all connectors's
>    *              DPMS property set to OFF
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Test category: functionality test
>    *
>    * SUBTEST: dc6-psr
>    * Description: This test validates display engine entry to DC6 state while PSR is active
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: pm_dc, psr
>    * Mega feature: Display Power
>    * Test category: functionality test
>    *
>    * SUBTEST: dc9-dpms
>    * Description: This test validates display engine entry to DC9 state
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Test category: functionality test
> @@ -648,7 +650,7 @@ igt_main
>   	bool is_dgfx;
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>   		igt_require(data.debugfs_fd != -1);
>   		data.debugfs_root_fd = open(igt_debugfs_mount(), O_RDONLY);
> @@ -727,7 +729,7 @@ igt_main
>   
>   	igt_describe("This test validates display engine entry to DC9 state");
>   	igt_subtest("dc9-dpms") {
> -		is_dgfx = gem_has_lmem(data.drm_fd);
> +		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>   		if (!is_dgfx)
>   			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>   				      "PC8+ residencies not supported\n");
