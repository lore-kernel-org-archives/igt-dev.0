Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5DE6E07B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 May 2021 15:41:24 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id t17so1405592ljd.9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 May 2021 08:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210520193402.2297833-1-markyacoub@chromium.org>
In-Reply-To: <20210520193402.2297833-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 27 May 2021 11:41:12 -0400
Message-ID: <CAJUqKUqYpcRW5LhS38gBboqaqzcu=CxVmE8LEftxN7S04DTOXw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_vblank: Turn on hardware before
 testing invalid vblank.
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
Cc: Petri Latvala <petri.latvala@intel.com>, chris@chris-wilson.co.uk, Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

friendly ping

On Thu, May 20, 2021 at 3:34 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> [Why]
> Before any hardware is on, the vblank is off and its ref counter is in
> an initialized state as each driver handles toggling it differently.
> Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 or invalid depending on the
> hardware, without necessarily meaning anything.
>
> [How]
> For invalid_subtest(), active the CRTCs to turn the hardware on so
> DRM_IOCTL_WAIT_VBLANK returns something meaningful.
> ---
>  tests/kms_vblank.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 93b01eba..cb68a2f8 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -475,8 +475,14 @@ static void invalid_subtest(data_t *data, int fd)
>  {
>         union drm_wait_vblank vbl;
>         unsigned long valid_flags;
> +       igt_display_t* display = &data->display;
> +       enum pipe p = 0;
> +       igt_output_t* output;
>
> -       igt_display_require_output_on_pipe(&data->display, 0);
> +       igt_display_require_output_on_pipe(display, p);
> +       data->pipe = p;
> +       for_each_valid_output_on_pipe(display, p, output)
> +               prepare_crtc(data, fd, output);
>
>         /* First check all is well with a simple query */
>         memset(&vbl, 0, sizeof(vbl));
> @@ -511,6 +517,9 @@ static void invalid_subtest(data_t *data, int fd)
>         vbl.request.type |= _DRM_VBLANK_SECONDARY;
>         vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
>         igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> +
> +       for_each_valid_output_on_pipe(display, p, output)
> +               cleanup_crtc(data, fd, output);
>  }
>
>  igt_main
> --
> 2.31.1.818.g46aad6cb9e-goog
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
