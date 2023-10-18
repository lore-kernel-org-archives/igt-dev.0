Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E857310E037
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 17:04:22 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-57d086365f7so3937894eaf.0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 10:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231018075904.1834634-1-shawn.c.lee@intel.com>
In-Reply-To: <20231018075904.1834634-1-shawn.c.lee@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 18 Oct 2023 13:04:11 -0400
Message-ID: <CAJUqKUp2tCj4n+pnzFwFwFJjvKZJ-9y=QWCcUnZ3CVw55OuNeA@mail.gmail.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [[PATCH i-g-t]] tests/kms_setmode: disable DRRS if
 eDP support variable refresh rate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 4:05=E2=80=AFAM Lee Shawn C <shawn.c.lee@intel.com>=
 wrote:
>
> Below is a failed case while testing kms_setmode.
>
> CRTC[80] [Pipe A] Mode: 1920x1200@60Hz Connectors: eDP-1[236]
> Expected frametime: 16659us; measured 20824.4us +- 4.799us accuracy 0.01%=
 [0.10 scanlines]
>
> The expected frame time is 16659us (60Hz refresh rate).
> But kms_setmode report measured time was 20824.4us (48Hz) then
> it failed. We found legacy DRRS mode was active at that time
> then refresh rate fall into lower RR automatically to cause this problem.
> Disable DRRS after crtc setmode can avoid driver switch to lower RR mode

Is it okay for the driver to do so? Would it be that the driver should
not do that if it wasn't asked?
Thanks,
-Mark

> and get pass for this test as well.
>
> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/148
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
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
>  /**
>   * TEST: kms setmode
>   * Category: Display
> @@ -651,6 +652,9 @@ retry:
>                                              crtc->fb_info.fb_id, 0, 0, i=
ds,
>                                              crtc->connector_count, &crtc=
->mode);
>
> +               if (is_intel_device(drm_fd))
> +                       intel_drrs_disable(drm_fd, crtc->pipe_id);
> +
>                 free(ids);
>
>                 if (ret < 0) {
> --
> 2.34.1
>
