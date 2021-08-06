Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7E86EB9F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 16:39:20 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id l24so6879256qtj.4
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Aug 2021 09:39:20 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id 71sm3095684qkk.26.2021.08.06.09.39.17
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 09:39:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id a93so16281522ybi.1
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Aug 2021 09:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <1628134823-27763-1-git-send-email-maitreye@codeaurora.org>
In-Reply-To: <1628134823-27763-1-git-send-email-maitreye@codeaurora.org>
From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 6 Aug 2021 12:38:38 -0400
Message-ID: <CAOw6vbJvHhxcSEE2pi5g-RX34XH4T49OFHrzVXqQHmA_ycQb-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: check device type
 before calling intel_get_drm_devid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: maitreye <maitreye@codeaurora.org>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>, nganji@codeaurora.org, aravindh@codeaurora.org, abhinavk@codeaurora.org, khsieh@codeaurora.org, Manasi Navare <manasi.d.navare@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 4, 2021 at 11:40 PM maitreye <maitreye@codeaurora.org> wrote:
>
> Check intel device type before calling intel_get_drm_devid
> to avoid incorrect assertion failures while trying to use
> create_bo_for_fb on non-intel targets. Otherwise it leads
> to failures like below :
>
> ./msm_dp_compliance
> found idx of failsafe mode = 17
> (msm_dp_compliance:27338) intel_chipset-CRITICAL: Test assertion failure function
> intel_get_drm_devid, file ../igt-gpu-tools-9999/lib/intel_chipset.c:132:
> (msm_dp_compliance:27338) intel_chipset-CRITICAL:
> Failed assertion: is_i915_device(fd)
> (msm_dp_compliance:27338) intel_chipset-CRITICAL: Last errno: 2,
> No such file or directory
>
> Signed-off-by: maitreye <maitreye@codeaurora.org>
> ---
>  lib/igt_fb.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ab52ea9..583cc9e 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -836,9 +836,11 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
>                  * On ADL_P CCS color planes must be 2MB aligned, until remapping
>                  * support is added for CCS FBs.
>                  */
> -               if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
> -                   is_ccs_modifier(fb->modifier))
> -                       size = ALIGN(size, 2 * 1024 * 1024);
> +               if (is_i915_device(fb->fd)) {
> +                       if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
> +                       is_ccs_modifier(fb->modifier))

Not sure if my email client is rendering incorrectly, but I think you
lost indentation here.

With that fixed,

Reviewed-by: Sean Paul <seanpaul@chromium.org>


>
> +                       size = ALIGN(size,2 * 1024 * 1024);
> +               }
>
>                 return size;
>         }
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
