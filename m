Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3948810E32F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 13:37:29 +0000 (UTC)
Date: Thu, 30 Nov 2023 14:37:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231130133724.s7jcj7hshl3r34wd@kamilkon-desk.igk.intel.com>
References: <20231124082712.2384183-1-mohammed.thasleem@intel.com>
 <20231129101900.2647416-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231129101900.2647416-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/kms_pm_dc: Add LNL platform
 for dc9-dpms validation
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

Hi Mohammed,
On 2023-11-29 at 15:49:00 +0530, Mohammed Thasleem wrote:
> DC5 counter on disp ver >=14 is not expected to get reset in DC9 state.
> Add LNL patform to use runtime_suspended_time value to validate DC9
> dpms test.
> 
> v2: Update subject and commit message. (Swati)
> 

Add here Swati to Cc:

Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  lib/intel_chipset.h     | 1 +
>  tests/intel/kms_pm_dc.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 1edc8e92c..3f2534519 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -208,6 +208,7 @@ void intel_check_pch(void);
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> +#define AT_LEAST_DISPLAY(devid, x) (intel_get_device_info(devid)->display_ver >= x)

Please send this change in separate patch.

Regards,
Kamil

>  
>  #define IS_GEN2(devid)		IS_GEN(devid, 2)
>  #define IS_GEN3(devid)		IS_GEN(devid, 3)
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 8006e54de..0d5824e67 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -88,7 +88,7 @@
>  #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>  #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>  #define KMS_POLL_DISABLE 0
> -#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || IS_METEORLAKE(devid)))
> +#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
>  
>  IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>  
> @@ -505,7 +505,7 @@ static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rp
>  	 * Runtime suspended residency should increment once DC9 is achieved;
>  	 * this condition is valid for all platforms.
>  	 * However, resetting of dc5/dc6 counter to check if display engine was in DC9;
> -	 * this condition at present can be skipped for dg1, dg2 and MTL platforms.
> +	 * this condition at present can be skipped for dg1, dg2 and MTL+ platforms.
>  	 */
>  	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) &&
>  			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
> -- 
> 2.25.1
> 
