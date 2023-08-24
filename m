Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C7510E5A0
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 18:05:11 +0000 (UTC)
Date: Thu, 24 Aug 2023 20:05:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230824180501.uwkchvwc5eorcjv5@kamilkon-desk.igk.intel.com>
References: <20230814095654.872-1-mohammed.thasleem@intel.com>
 <20230824210718.7235-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824210718.7235-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Fix dc9-dpms
 test on MTL
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

Hi,

On 2023-08-25 at 02:37:18 +0530, Thasleem, Mohammed wrote:
> From: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
> 
> DC5 counter on MTL is not expected to get reset in DC9 state.

This is fine.

> Add condition to check runtime_suspended_time value to validate
> DC9 dpms test.

I do not see any new condition, I do see you extendeded comment
there. With second sentence removed:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 90fe847fc..13ae31583 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -88,7 +88,7 @@
>  #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>  #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>  #define KMS_POLL_DISABLE 0
> -#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)))
> +#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || IS_METEORLAKE(devid)))
>  
>  IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>  
> @@ -514,7 +514,7 @@ static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rp
>  	 * Runtime suspended residency should increment once DC9 is achieved;
>  	 * this condition is valid for all platforms.
>  	 * However, resetting of dc5/dc6 counter to check if display engine was in DC9;
> -	 * this condition at present can be skipped for dg1 and dg2 platforms.
> +	 * this condition at present can be skipped for dg1, dg2 and MTL platforms.
>  	 */
>  	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) &&
>  			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
> -- 
> 2.34.1
> 
