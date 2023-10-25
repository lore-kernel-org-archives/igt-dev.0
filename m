Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC810E615
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 08:30:08 +0000 (UTC)
Message-ID: <963156b8-615d-e267-be70-83230b3cc77e@intel.com>
Date: Wed, 25 Oct 2023 13:59:44 +0530
Content-Language: en-US
To: Lee Shawn C <shawn.c.lee@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231022140959.1874333-1-shawn.c.lee@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231022140959.1874333-1-shawn.c.lee@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_flip: disable DRRS if eDP support
 variable refresh rate
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


On Sun-22-10-2023 07:39 pm, Lee Shawn C wrote:
> Just like https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/148.
> 
> kms_flip used the same way to calculate frametime. It may have chance
> to encounter this issue and get unexpected frame time due to DUT at
> low RR mode. So disable DRRS after crtc setmode can avoid driver switch
> to lower RR mode automatically to avoid this problem.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>   tests/kms_flip.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 2c60cdf6db64..fc7cee0501c4 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -30,6 +30,7 @@
>   #include "config.h"
>   
>   #include "igt.h"
> +#include "i915/intel_drrs.h"
>   
>   #include <cairo.h>
>   #include <errno.h>
> @@ -911,6 +912,9 @@ static int set_mode(struct test_output *o, uint32_t fb, int x, int y)
>   				     conn, count, mode);
>   		if (ret)
>   			return ret;
> +
> +		if (is_intel_device(drm_fd))
> +			intel_drrs_disable(drm_fd, o->pipe);

LGTM

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

>   	}
>   
>   	return 0;
