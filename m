Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB2210E205
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 13:32:59 +0000 (UTC)
Message-ID: <722a1c33-d384-4f9c-8652-3d09b8dca950@intel.com>
Date: Fri, 24 Nov 2023 19:02:55 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220422002230.19535-1-mohammed.thasleem@intel.com>
 <20231124082712.2384183-1-mohammed.thasleem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231124082712.2384183-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/kms_pm_dc: Fix dc9-dpms
 test on LNL
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

Hi Thasleem,

First of all, this patch is not fixing dc9-dpms test.
Rephrase your subject line.

On 24-Nov-23 1:57 PM, Mohammed Thasleem wrote:
> DC5 counter on disp ver >=14 is not expected to get reset in DC9 state.
> Add condition to check runtime_suspended_time value to validate
> DC9 dpms test.

Also, you are not adding any condition, you are just adding platform to 
existing condition.

Please fix both subject and commit message.

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   lib/intel_chipset.h     | 1 +
>   tests/intel/kms_pm_dc.c | 4 ++--
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 1edc8e92c..3f2534519 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -208,6 +208,7 @@ void intel_check_pch(void);
>   
>   #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>   #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> +#define AT_LEAST_DISPLAY(devid, x) (intel_get_device_info(devid)->display_ver >= x)
>   
>   #define IS_GEN2(devid)		IS_GEN(devid, 2)
>   #define IS_GEN3(devid)		IS_GEN(devid, 3)
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index a3c7c4018..6990f91a2 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -107,7 +107,7 @@
>   #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>   #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>   #define KMS_POLL_DISABLE 0
> -#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || IS_METEORLAKE(devid)))
> +#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
>   
>   IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>   
> @@ -524,7 +524,7 @@ static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rp
>   	 * Runtime suspended residency should increment once DC9 is achieved;
>   	 * this condition is valid for all platforms.
>   	 * However, resetting of dc5/dc6 counter to check if display engine was in DC9;
> -	 * this condition at present can be skipped for dg1, dg2 and MTL platforms.
> +	 * this condition at present can be skipped for dg1, dg2 and MTL+ platforms.
>   	 */
>   	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) &&
>   			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
