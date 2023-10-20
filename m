Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAA310E5BA
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 14:02:47 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507962561adso1193023e87.0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 07:02:47 -0700 (PDT)
Message-ID: <f715dc33-b102-4a76-86bf-38e5eb308487@gmail.com>
Date: Fri, 20 Oct 2023 17:02:37 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Lee Shawn C <shawn.c.lee@intel.com>, igt-dev@lists.freedesktop.org
References: <20231018075904.1834634-1-shawn.c.lee@intel.com>
 <20231019112729.1837000-1-shawn.c.lee@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231019112729.1837000-1-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_setmode: disable DRRS if eDP
 support variable refresh rate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Look ok to me.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 19.10.2023 14.27, Lee Shawn C wrote:
> Below is a failed case while testing kms_setmode.
> 
> CRTC[80] [Pipe A] Mode: 1920x1200@60Hz Connectors: eDP-1[236]
> Expected frametime: 16659us; measured 20824.4us +- 4.799us accuracy 0.01% [0.10 scanlines]
> 
> The expected frame time is 16659us (60Hz refresh rate).
> But kms_setmode report measured time was 20824.4us (48Hz) then
> it failed. We found legacy DRRS mode was active at that time
> then refresh rate fall into lower RR automatically to cause this problem.
> Disable DRRS after crtc setmode can avoid driver switch to lower RR mode
> and get pass for this test as well.
> 
> v2: fix prefix string and sort header file by alphabetical
> 
> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/148
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>   tests/kms_setmode.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 5fc4421c0080..98e49bbf95f9 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -30,7 +30,10 @@
>   #include <string.h>
>   #include <sys/time.h>
>   #include <math.h>
> +
> +#include "i915/intel_drrs.h"
>   #include "xe/xe_query.h"
> +
>   /**
>    * TEST: kms setmode
>    * Category: Display
> @@ -651,6 +654,9 @@ retry:
>   					     crtc->fb_info.fb_id, 0, 0, ids,
>   					     crtc->connector_count, &crtc->mode);
>   
> +		if (is_intel_device(drm_fd))
> +			intel_drrs_disable(drm_fd, crtc->pipe_id);
> +
>   		free(ids);
>   
>   		if (ret < 0) {
