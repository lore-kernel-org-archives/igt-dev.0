Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161016E11F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2020 09:15:14 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200519210924.2277459-1-chris@chris-wilson.co.uk>
References: <20200519210924.2277459-1-chris@chris-wilson.co.uk>
Date: Wed, 20 May 2020 12:12:55 +0300
Message-ID: <87h7wb55rc.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Assume unknown hardware just
 works
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> If we don't recognise the hardware, then it can't be any of the known
> broken HW where MI_STORE_DWORD_IMM either uses physical addressing or
> simply fails catastrophic. As it's not known to be broken, assume it
> works.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  lib/igt_gt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index 101627973..3e5eb47db 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -565,6 +565,9 @@ bool gem_class_can_store_dword(int fd, int class)
>  	const struct intel_device_info *info = intel_get_device_info(devid);
>  	const int gen = ffs(info->gen);
>  
> +	if (info->gen == 0) /* unknown, assume it just works */
> +		return true;
> +
>  	if (gen <= 2) /* requires physical addresses */
>  		return false;
>  
> @@ -572,7 +575,7 @@ bool gem_class_can_store_dword(int fd, int class)
>  		return false; /* only supports physical addresses */
>  
>  	if (gen == 6 && class == I915_ENGINE_CLASS_VIDEO)
> -		return false;
> +		return false; /* broken, unbelievably broken */
>  
>  	if (info->is_broadwater)
>  		return false; /* Not sure yet... */
> -- 
> 2.27.0.rc0
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
