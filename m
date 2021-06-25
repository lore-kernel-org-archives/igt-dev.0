Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612846ED88
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jun 2021 13:03:26 +0000 (UTC)
References: <20210624122248.903530-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <00fe482b-75fc-35da-9e37-254f8c2f5aa3@linux.intel.com>
Date: Fri, 25 Jun 2021 14:03:20 +0100
MIME-Version: 1.0
In-Reply-To: <20210624122248.903530-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [i-g-t] i915/gem_exec_fair: Extend icl ctx timestamp
 w/a to gen11
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 24/06/2021 13:22, Tejas Upadhyay wrote:
> 80ns timestamp interval identified for icl also applies to
> gen11 platforms. igt@gem_exec_fair@basic-deadline is
> passing with the change on ehl and jsl.
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>   tests/i915/gem_exec_fair.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index 628f4df2..45237574 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -98,16 +98,11 @@ static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
>   	return (x + y - 1) / y;
>   }
>   
> -static bool is_icelake(int i915)
> -{
> -	return intel_get_device_info(intel_get_drm_devid(i915))->is_icelake;
> -}
> -
>   static uint64_t ns_to_ctx_ticks(int i915, uint64_t ns)
>   {
>   	int f = read_timestamp_frequency(i915);
> -	if (is_icelake(i915))
> -		f = 12500000; /* icl!!! are you feeling alright? CTX vs CS */
> +	if (intel_gen(intel_get_drm_devid(i915)) == 11)
> +		f = 12500000; /* gen11!!! are you feeling alright? CTX vs CS */
>   	return div64_u64_round_up(ns * f, NSEC64);
>   }
>   
> 

Same as the kernel patch, okay, I can push this one as well.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
