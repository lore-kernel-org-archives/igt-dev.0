Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8C2A38EA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 18:16:02 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 21so360530ybf.4
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Aug 2022 11:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220804180357.417821-1-alex.hung@amd.com>
In-Reply-To: <20220804180357.417821-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 4 Aug 2022 14:15:50 -0400
Message-ID: <CAJUqKUrWJs-MJHnZ-48d4HSoeFMvpJBZU8Xoz-9nqG5RCc0=ew@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_plane: Check plane format before
 using
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 2:04 PM Alex Hung <alex.hung@amd.com> wrote:
>
> If a plane does not support the format or modifier, skip testing
> for this plane.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index c885a813..3cf3cfd3 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -224,6 +224,9 @@ test_plane_position_with_output(data_t *data,
>         create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
>         igt_plane_set_fb(primary, &primary_fb);
>
> +       if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR))
> +               return;
> +
looks reasonable to me.
>         igt_create_color_fb(data->drm_fd,
>                             64, 64, /* width, height */
>                             DRM_FORMAT_XRGB8888,
> --
> 2.37.1
>
