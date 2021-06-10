Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2801D6E364
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 15:07:31 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a19so2199187ljq.12
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 08:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210601172936.3785449-1-markyacoub@chromium.org>
 <20210609201542.hhjwxi5gzlprgcjr@outlook.office365.com>
In-Reply-To: <20210609201542.hhjwxi5gzlprgcjr@outlook.office365.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 10 Jun 2021 11:07:17 -0400
Message-ID: <CAJUqKUqZXOCs=ZE3Y8rbKb7=A0yH1gFgCjUexyWq8353m1bGow@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH v2] tests/kms_vblank: Turn on hardware before
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 9, 2021 at 4:15 PM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> On 06/01, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > Before any hardware is on, the vblank is off and its ref counter is in
> > an initialized state as each driver handles toggling it differently.
> > Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 such as on i915, or an invalid
> > integer that doesn't mean much, such as on Zork running Kernel 5.4 due
> > to the kernel workaround that increments the vblank ref count to prevent
> > a get from enabling the interrupt.
> >
> > [How]
> > For invalid_subtest(), active the CRTCs to turn the hardware on so
> > DRM_IOCTL_WAIT_VBLANK returns something meaningful.
> >
> > === Changes from v1 ===
> > 1. Update Commit message
> > 2. Rename variable p to pipe_number
>
> nit:
> When I see changes in history in the commit (git log), it usually looks like:
>
> Changes since v1:
>
> or
>
> v1:
>
> but tbh, I don't think we have this documented anywhere...
>
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> You forget to add your name in the S-o-b.
done. thanks!
>
> Best Regards
>
> > ---
> >  tests/kms_vblank.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> > index 93b01eba..988794c0 100644
> > --- a/tests/kms_vblank.c
> > +++ b/tests/kms_vblank.c
> > @@ -475,8 +475,14 @@ static void invalid_subtest(data_t *data, int fd)
> >  {
> >       union drm_wait_vblank vbl;
> >       unsigned long valid_flags;
> > +     igt_display_t* display = &data->display;
> > +     enum pipe pipe_number = 0;
> > +     igt_output_t* output;
> >
> > -     igt_display_require_output_on_pipe(&data->display, 0);
> > +     igt_display_require_output_on_pipe(display, pipe_number);
> > +     data->pipe = pipe_number;
> > +     for_each_valid_output_on_pipe(display, pipe_number, output)
> > +             prepare_crtc(data, fd, output);
> >
> >       /* First check all is well with a simple query */
> >       memset(&vbl, 0, sizeof(vbl));
> > @@ -511,6 +517,9 @@ static void invalid_subtest(data_t *data, int fd)
> >       vbl.request.type |= _DRM_VBLANK_SECONDARY;
> >       vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
> >       igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> > +
> > +     for_each_valid_output_on_pipe(display, pipe_number, output)
> > +             cleanup_crtc(data, fd, output);
> >  }
> >
> >  igt_main
> > --
> > 2.32.0.rc0.204.g9fa02ecfa5-goog
> >
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
