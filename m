Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C5210E159
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 02:24:02 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-333a4a5d495so203077877b3.10
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 19:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 14 Sep 2022 19:23:54 -0700
Message-ID: <CAJs_Fx4uU_htVg5V57wZeYGNLLKW=j7-uO6EYw=_5Tmn77H=DA@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_crc: Wait extra
 vblank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Having dealt with emulating legacy cursor updates on hw that doesn't
really provide non-vsync'd updates this is the right thing to do..
trying to provide frame accurate updates with legacy cursor in the
mix, and without dropping fps, is a losing proposition so let's just
update the tests to reflect reality on the ground

a-b

BR,
-R

On Wed, Sep 14, 2022 at 3:58 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Wait an extra vblank for legacy cursor ioctl to finish.
>
> Extra vblank wait is needed for both HW and SW test as the legacy cursor
> ioctl is called in both cases.
>
> Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>
> [1] https://patchwork.freedesktop.org/series/105999/
> ---
>  tests/kms_cursor_crc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 53f18f4f1add..272dcb7fa0a4 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -202,8 +202,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>                 igt_display_commit(display);
>
>                 /* Extra vblank wait is because nonblocking cursor ioctl */
> -               igt_wait_for_vblank(data->drm_fd,
> -                               display->pipes[data->pipe].crtc_offset);
> +               igt_wait_for_vblank_count(data->drm_fd,
> +                               display->pipes[data->pipe].crtc_offset, 2);
>
>                 igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
>
> @@ -243,8 +243,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>                 igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
>
>                 igt_display_commit(display);
> -               igt_wait_for_vblank(data->drm_fd,
> -                               display->pipes[data->pipe].crtc_offset);
> +               igt_wait_for_vblank_count(data->drm_fd,
> +                               display->pipes[data->pipe].crtc_offset, 2);
>
>                 igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>                 igt_assert_crc_equal(&crc, hwcrc);
> --
> 2.31.0
>
