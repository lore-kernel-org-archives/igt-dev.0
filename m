Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC84010E3FE
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 18:39:34 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3487d84e477so231037977b3.6
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 11:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
 <f3ffbe22-8054-e51b-5aef-c2d30bd4f767@gmail.com>
In-Reply-To: <f3ffbe22-8054-e51b-5aef-c2d30bd4f767@gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 15 Sep 2022 11:39:26 -0700
Message-ID: <CAJs_Fx7LWKbzcpKmhQSnbh4iNhq56-0CVz4o2zczyaorWGDF1w@mail.gmail.com>
To: juhapekka.heikkila@gmail.com
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

On Thu, Sep 15, 2022 at 11:02 AM Juha-Pekka Heikkila
<juhapekka.heikkila@gmail.com> wrote:
>
> Hi Jessica,
>
> On 15.9.2022 1.58, Jessica Zhang wrote:
> > Wait an extra vblank for legacy cursor ioctl to finish.
> >
> > Extra vblank wait is needed for both HW and SW test as the legacy cursor
> > ioctl is called in both cases.
> >
> > Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.
> >
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >
> > [1] https://patchwork.freedesktop.org/series/105999/
> > ---
> >   tests/kms_cursor_crc.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index 53f18f4f1add..272dcb7fa0a4 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -202,8 +202,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> >               igt_display_commit(display);
> >
> >               /* Extra vblank wait is because nonblocking cursor ioctl */
> > -             igt_wait_for_vblank(data->drm_fd,
> > -                             display->pipes[data->pipe].crtc_offset);
> > +             igt_wait_for_vblank_count(data->drm_fd,
> > +                             display->pipes[data->pipe].crtc_offset, 2);
>
> It will take more than one frame on your target device for non blocking
> cursor commit to settle? This cannot be right, even if this somehow was
> the case you are breaking this test for everyone else.

It is possible, depending on timing, kthread scheduling, etc, for a
legacy cursor to end up getting applied to the next frame.

How is this breaking the test for anyone else?

BR,
-R

> >
> >               igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
> >
> > @@ -243,8 +243,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> >               igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
> >
> >               igt_display_commit(display);
> > -             igt_wait_for_vblank(data->drm_fd,
> > -                             display->pipes[data->pipe].crtc_offset);
> > +             igt_wait_for_vblank_count(data->drm_fd,
> > +                             display->pipes[data->pipe].crtc_offset, 2);
>
> This change make even less sense to me than above. There's nothing
> cursor plane related on this part of test. You are saying flipping
> normal framebuffers on non cursor plane take also more than one frame on
> your target device? It sound like vblank counting is somehow broken on
> your target device if these changes together fix something.
>
> /Juha-Pekka
>
> >
> >               igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> >               igt_assert_crc_equal(&crc, hwcrc);
>
