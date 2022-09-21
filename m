Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3857F10E917
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 21:48:06 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3450990b0aeso78904587b3.12
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 14:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220920222816.154-1-quic_jesszhan@quicinc.com>
 <ca2720da-6198-0a23-1906-f0a506841cd7@quicinc.com>
In-Reply-To: <ca2720da-6198-0a23-1906-f0a506841cd7@quicinc.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 21 Sep 2022 14:47:58 -0700
Message-ID: <CAJs_Fx5ts1d5821Nyh4C+bHdU3==Bmfwd5YeuNmJ+y-rwJEDnw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_crc: Wait extra
 vblank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 12:52 PM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> Adding Ville
>
> On 9/20/2022 3:28 PM, Jessica Zhang wrote:
> > Wait an extra vblank for legacy cursor ioctl to finish.
> >
> > Extra vblank wait is needed for both HW and SW test as the legacy cursor
> > ioctl is called in both cases.
> >
> > Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.
> >
> > Changes since V1:
> > - Only wait for an extra vblank for MSM driver
> >
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>
> CI is happy with this one, this LGTM,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Rob Clark <robdclark@chromium.org>

>
> >
> > [1] https://patchwork.freedesktop.org/series/105999/
> > ---
> >   tests/kms_cursor_crc.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index 53f18f4f1add..7c1f74be568d 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -185,6 +185,7 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> >       igt_pipe_crc_t *pipe_crc = data->pipe_crc;
> >       igt_crc_t crc;
> >       int ret = 0, swbufidx;
> > +     int vblank_wait_count = is_msm_device(data->drm_fd) ? 2 : 1;
> >
> >       igt_print_activity();
> >
> > @@ -202,8 +203,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> >               igt_display_commit(display);
> >
> >               /* Extra vblank wait is because nonblocking cursor ioctl */
> > -             igt_wait_for_vblank(data->drm_fd,
> > -                             display->pipes[data->pipe].crtc_offset);
> > +             igt_wait_for_vblank_count(data->drm_fd,
> > +                             display->pipes[data->pipe].crtc_offset, vblank_wait_count);
> >
> >               igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
> >
> > @@ -243,8 +244,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> >               igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
> >
> >               igt_display_commit(display);
> > -             igt_wait_for_vblank(data->drm_fd,
> > -                             display->pipes[data->pipe].crtc_offset);
> > +             igt_wait_for_vblank_count(data->drm_fd,
> > +                             display->pipes[data->pipe].crtc_offset, vblank_wait_count);
> >
> >               igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> >               igt_assert_crc_equal(&crc, hwcrc);
