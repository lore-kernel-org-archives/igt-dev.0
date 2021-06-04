Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06FC6F8A3
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 18:50:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id i9so15476130lfe.13
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Jun 2021 11:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <1622176025-12499-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1622176025-12499-1-git-send-email-vidya.srinivas@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 4 Jun 2021 14:50:12 -0400
Message-ID: <CAJUqKUpEJZXGLcktaS8Jaaf-N0pPpjKP0Fi4UjmBx+Zs_DrvdQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_big_fb: Wait for vblank
 before collecting CRC
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 28, 2021 at 12:36 AM Vidya Srinivas
<vidya.srinivas@intel.com> wrote:
>
> Without wait for vblank, CRC mismatch is seen
> between big and small CRC on few Gen11 systems.
>
Tested on ChromeOS on JSL (Drawlat).
Tested-by: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_big_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index b35727a09bd0..f90363c3beb2 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -254,6 +254,7 @@ static void unset_lut(data_t *data)
>  static bool test_plane(data_t *data)
>  {
>         igt_plane_t *plane = data->plane;
> +       igt_display_t *display = &data->display;
>         struct igt_fb *small_fb = &data->small_fb;
>         struct igt_fb *big_fb = &data->big_fb;
>         int w = data->big_fb_width - small_fb->width;
> @@ -337,16 +338,17 @@ static bool test_plane(data_t *data)
>                 igt_display_commit2(&data->display, data->display.is_atomic ?
>                                     COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>
> -
> +               igt_wait_for_vblank(data->drm_fd, display->pipes[data->pipe].crtc_offset);
>                 igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
>
>                 igt_plane_set_fb(plane, big_fb);
>                 igt_fb_set_position(big_fb, plane, x, y);
>                 igt_fb_set_size(big_fb, plane, small_fb->width, small_fb->height);
> +
>                 igt_plane_set_size(plane, data->width, data->height);
>                 igt_display_commit2(&data->display, data->display.is_atomic ?
>                                     COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> -
> +               igt_wait_for_vblank(data->drm_fd, display->pipes[data->pipe].crtc_offset);
>                 igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
>
>                 igt_plane_set_fb(plane, NULL);
> --
> 2.7.4
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
