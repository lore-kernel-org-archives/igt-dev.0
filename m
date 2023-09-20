Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <7981d753-67ab-9d57-7925-77eb6cbe3f81@intel.com>
Date: Wed, 20 Sep 2023 19:34:20 +0530
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
References: <20230918190259.2817143-1-vinay.belgaumkar@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230918190259.2817143-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_freq_api: Set min/max to
 expected values
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



On 9/19/2023 12:32 AM, Vinay Belgaumkar wrote:
> A prior(rps) test leaves the system in a bad state causing failures
> in the basic test. Set min/max to expected values before running it.
> Test will restore values at the end.
> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8670
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/i915_pm_freq_api.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
> index 03bd0d05b..6018692a2 100644
> --- a/tests/intel/i915_pm_freq_api.c
> +++ b/tests/intel/i915_pm_freq_api.c
> @@ -55,7 +55,11 @@ static void test_freq_basic_api(int dirfd, int gt)
>   	rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>   	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>   	rpe = get_freq(dirfd, RPS_RP1_FREQ_MHZ);
> -	igt_debug("GT: %d, RPn: %d, RPe: %d, RP0: %d", gt, rpn, rpe, rp0);
> +	igt_debug("GT: %d, RPn: %d, RPe: %d, RP0: %d\n", gt, rpn, rpe, rp0);
> +
> +	/* Set min/max to RPn, RP0 for baseline behavior */
> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0) > 0);
>   
>   	/*
>   	 * Negative bound tests
> @@ -170,7 +174,7 @@ igt_main
>   		for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
>   			stash_min[gt] = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
>   			stash_max[gt] = get_freq(dirfd, RPS_MAX_FREQ_MHZ);
> -			igt_debug("GT: %d, min: %d, max: %d", gt, stash_min[gt], stash_max[gt]);
> +			igt_debug("GT: %d, min: %d, max: %d\n", gt, stash_min[gt], stash_max[gt]);
>   			igt_pm_ignore_slpc_efficient_freq(i915, dirfd, true);
>   		}
>   		igt_install_exit_handler(restore_sysfs_freq);
