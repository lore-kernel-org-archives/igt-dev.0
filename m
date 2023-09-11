Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C5510E311
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 15:01:30 +0000 (UTC)
Message-ID: <af67e09f-723d-cc3d-0dbd-05768a83fa0c@intel.com>
Date: Mon, 11 Sep 2023 20:30:15 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
 <20230908175039.1291593-6-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230908175039.1291593-6-swati2.sharma@intel.com>
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

Hi Swati,

On Fri-08-09-2023 11:20 pm, Swati Sharma wrote:
> Add XE driver support for kms pm tests.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index cbb419e12..63999e813 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -36,6 +36,9 @@
>   #include "limits.h"
>   #include "time.h"
>   #include "igt_pm.h"
> +#include "xe/xe_ioctl.h"

This headerfile is not required.

> +#include "xe/xe_query.h"
> +
>   /**
>    * TEST: kms pm dc
>    * Category: Display
> @@ -44,7 +47,7 @@
>    * SUBTEST: dc3co-vpb-simulation
>    * Description: Make sure that system enters DC3CO when PSR2 is active and system
>    *              is in SLEEP state
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dc3co, pm_dc, psr2
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -53,7 +56,7 @@
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -62,7 +65,7 @@
>    * SUBTEST: dc5-dpms-negative
>    * Description: Validate negative scenario of DC5 display engine entry to DC5 state
>    *              while all connectors's DPMS property set to ON
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -70,7 +73,7 @@
>    *
>    * SUBTEST: dc5-psr
>    * Description: This test validates display engine entry to DC5 state while PSR is active
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: pm_dc, psr
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -79,7 +82,7 @@
>    * SUBTEST: dc6-dpms
>    * Description: Validate display engine entry to DC6 state while all connectors's
>    *              DPMS property set to OFF
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -87,7 +90,7 @@
>    *
>    * SUBTEST: dc6-psr
>    * Description: This test validates display engine entry to DC6 state while PSR is active
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: pm_dc, psr
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -95,7 +98,7 @@
>    *
>    * SUBTEST: dc9-dpms
>    * Description: This test validates display engine entry to DC9 state
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -734,7 +737,7 @@ igt_main

Still, it is i915 specific only, since you are trying to open i915 
device. Probably, you need a change as below:

-     data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+     data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);

- Bhanu

>   
>   	igt_describe("This test validates display engine entry to DC9 state");
>   	igt_subtest("dc9-dpms") {
> -		is_dgfx = gem_has_lmem(data.drm_fd);
> +		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>   		if (!is_dgfx)
>   			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>   				      "PC8+ residencies not supported\n");
