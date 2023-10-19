Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A2010E4BB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 10:39:37 +0000 (UTC)
Date: Thu, 19 Oct 2023 12:39:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231019103933.kbwfumzy5cok2r2n@kamilkon-desk.igk.intel.com>
References: <20231018075904.1834634-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231018075904.1834634-1-shawn.c.lee@intel.com>
Subject: Re: [igt-dev] [[PATCH i-g-t]] tests/kms_setmode: disable DRRS if
 eDP support variable refresh rate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lee,
On 2023-10-18 at 15:59:04 +0800, Lee Shawn C wrote:

please correct subject in your patch:

[[PATCH i-g-t]] tests/kms_setmode: disable DRRS if eDP support variable refresh rate
^ ----------- ^

Too many braceses here, should be:
[PATCH i-g-t] tests/kms_setmode: disable DRRS if eDP support variable refresh rate

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
> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/148
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>

Adding Juha-Pekka and Bhanu to Cc.

> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  tests/kms_setmode.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 5fc4421c0080..b6fe3f9c159a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -31,6 +31,7 @@
>  #include <sys/time.h>
>  #include <math.h>
>  #include "xe/xe_query.h"
> +#include "i915/intel_drrs.h"

Keep it sorted alphabetically, also add newline after system
headers:

#include <math.h>

#include "i915/intel_drrs.h"
#include "xe/xe_query.h"

>  /**
>   * TEST: kms setmode
>   * Category: Display
> @@ -651,6 +652,9 @@ retry:
>  					     crtc->fb_info.fb_id, 0, 0, ids,
>  					     crtc->connector_count, &crtc->mode);
>  
> +		if (is_intel_device(drm_fd))

Question for Bhanu or Juha-Pekka: will this work for Xe?
Should this be: 	if (is_i915_device(drm_fd))

Regards,
Kamil

> +			intel_drrs_disable(drm_fd, crtc->pipe_id);
> +
>  		free(ids);
>  
>  		if (ret < 0) {
> -- 
> 2.34.1
> 
