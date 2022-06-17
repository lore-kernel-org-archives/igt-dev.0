Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A99411ACBB
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 11:46:25 +0000 (UTC)
Message-ID: <e104e0ed-45f0-b145-0407-e3d364b6133e@intel.com>
Date: Fri, 17 Jun 2022 17:16:20 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220614064638.43379-1-mohammed.thasleem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220614064638.43379-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Check dc3co
 count to skip the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nischal.varide@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 14-Jun-22 12:16 PM, Mohammed Thasleem wrote:
> dc3co is not enabled in kernel so its required to skip the test.
> Checking counter increment as its allways zero to skip test.

Nitpick: You can re-write commit as
If dc3co is not enabled in driver, counter will always be zero and we 
can simply
skip the test.

Also, put Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4364

With this corrected.
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/i915/i915_pm_dc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 2c2c5086..a780f2cb 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -274,7 +274,8 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>   		usleep(delay);
>   	}
>   
> -	check_dc_counter(data, CHECK_DC3CO, dc3co_prev_cnt);
> +	igt_require_f(dc_state_wait_entry(data->debugfs_fd,
> +		      CHECK_DC3CO, dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
>   }
>   
>   static void require_dc_counter(int debugfs_fd, int dc_flag)

-- 
~Swati Sharma
