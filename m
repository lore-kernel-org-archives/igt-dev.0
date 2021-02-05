Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666EF6F44C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Feb 2021 14:02:01 +0000 (UTC)
References: <20210205134546.3917382-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <07d0c643-39d5-1292-b902-30c1cf3ddc71@linux.intel.com>
Date: Fri, 5 Feb 2021 14:01:46 +0000
MIME-Version: 1.0
In-Reply-To: <20210205134546.3917382-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: The return of the
 fractional bar
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 05/02/2021 13:45, Chris Wilson wrote:
> Scale the bar_len into the fractional bar before truncating!
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tools/intel_gpu_top.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 5e832eb9a..453f39541 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1098,10 +1098,9 @@ print_percentage_bar(double percent, int max_len, bool numeric)
>   
>   	assert(max_len > 0);
>   
> -	bar_len = ceil(percent * len / 100.0);
> -	if (bar_len > len)
> -		bar_len = len;
> -	bar_len *= w;
> +	bar_len = ceil(w * percent * len / 100.0);
> +	if (bar_len > w * len)
> +		bar_len = w * len;
>   
>   	putchar('|');
>   
> 

Ah I broke this somehow, yet again. Thanks!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
