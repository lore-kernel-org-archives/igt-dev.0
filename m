Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D646E091
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Feb 2021 14:08:44 +0000 (UTC)
References: <20210205140119.3973877-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <f9eb45bb-7098-b312-b013-fb30a4edd16e@linux.intel.com>
Date: Fri, 5 Feb 2021 14:08:39 +0000
MIME-Version: 1.0
In-Reply-To: <20210205140119.3973877-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Include fresh clients in
 the hide inactive filter
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


On 05/02/2021 14:01, Chris Wilson wrote:
> As a new client does not have a delta for its first sample, treat as
> still as idle and hide it if the user requests not to be shown clients
> with no activity.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tools/intel_gpu_top.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 453f39541..21084185d 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1972,7 +1972,7 @@ print_client(struct client *c, struct engines *engines, double t, int lines,
>   	unsigned int i;
>   
>   	if (output_mode == INTERACTIVE) {
> -		if (filter_idle && !c->total_runtime)
> +		if (filter_idle && (!c->total_runtime || c->samples < 2))
>   			return lines;
>   
>   		lines++;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
