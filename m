Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748726E906
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jun 2021 16:13:14 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id u18so2827230lju.12
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Jun 2021 09:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160232.941852-1-markyacoub@chromium.org>
In-Reply-To: <20210413160232.941852-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 7 Jun 2021 12:13:02 -0400
Message-ID: <CAJUqKUrXr90ntQRCznp_DxFgp-zNavf2uSUxtncVykhm4Up=xQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] lib/igt_fb: Support Tile Size for AMD non
 linear modifiers.
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Sean Paul <seanpaul@chromium.org>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

friendly ping.

On Tue, Apr 13, 2021 at 12:02 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> Calculate the width and height of the tile on amdgpu when the modifier
> is not linear.
>
> Cc: bas@basnieuwenhuizen.nl
> Cc: daniel.vetter@ffwll.ch
> Signed-off-by: markyacoub@chromium.org
> ---
>  lib/igt_fb.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 4ded7e78..3d1fdae5 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -396,6 +396,19 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>                 vc4_modifier_param = fourcc_mod_broadcom_param(modifier);
>                 modifier = fourcc_mod_broadcom_mod(modifier);
>         }
> +       // For all non-linear modifiers, AMD uses 64 KiB tiles
> +       else if (IS_AMD_FMT_MOD(modifier)) {
> +               igt_require_amdgpu(fd);
> +               const int bytes_per_pixel = fb_bpp / 8;
> +               const int format_log2 = log2(bytes_per_pixel);
> +               const int pixel_log2 = log2(64 * 1024) - format_log2;
> +               const int width_log2 = (pixel_log2 + 1) / 2;
> +               const int height_log2 = pixel_log2 - width_log2;
> +
> +               *width_ret = 1 << width_log2;
> +               *height_ret = 1 << height_log2;
> +               return;
> +       }
>
>         switch (modifier) {
>         case LOCAL_DRM_FORMAT_MOD_NONE:
> --
> 2.31.1.295.g9ea45b61b8-goog
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
