Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6608A6E920
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jun 2021 16:15:57 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id r16so3850907ljk.9
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Jun 2021 09:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210520193402.2297833-1-markyacoub@chromium.org>
 <8ce2d8e7-b2fc-4ed9-524c-6621776de3da@amd.com>
 <CAJUqKUo86uTY6jJs1tk3U_DPnyUjJu2xod+h7wm8RJ4Lncabsw@mail.gmail.com>
In-Reply-To: <CAJUqKUo86uTY6jJs1tk3U_DPnyUjJu2xod+h7wm8RJ4Lncabsw@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 7 Jun 2021 12:15:43 -0400
Message-ID: <CAJUqKUrMub9931WvqKSy9gQu779VAidL1_=BD_bub5zpeGcQfA@mail.gmail.com>
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
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Cc: Petri Latvala <petri.latvala@intel.com>, chris@chris-wilson.co.uk, igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

friendly ping.

On Tue, Jun 1, 2021 at 1:33 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> On Mon, May 31, 2021 at 2:57 PM Rodrigo Siqueira Jordao
> <Rodrigo.Siqueira@amd.com> wrote:
> >
> > Hi Mark,
> >
> > See my comments inline.
> >
> > On 2021-05-20 3:34 p.m., Mark Yacoub wrote:
> > > From: Mark Yacoub <markyacoub@google.com>
> > >
> > > [Why]
> > > Before any hardware is on, the vblank is off and its ref counter is in
> > > an initialized state as each driver handles toggling it differently.
> > > Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 or invalid depending on the
> > > hardware, without necessarily meaning anything.
> >
> > Maybe you can add some hardware examples here.
> Updated the commit msg in v2.
> >
> > > [How]
> > > For invalid_subtest(), active the CRTCs to turn the hardware on so
> > > DRM_IOCTL_WAIT_VBLANK returns something meaningful.
> >
> > You forgot the `Signed-off-by`.
> >
> > > ---
> > >   tests/kms_vblank.c | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> > > index 93b01eba..cb68a2f8 100644
> > > --- a/tests/kms_vblank.c
> > > +++ b/tests/kms_vblank.c
> > > @@ -475,8 +475,14 @@ static void invalid_subtest(data_t *data, int fd)
> > >   {
> > >       union drm_wait_vblank vbl;
> > >       unsigned long valid_flags;
> > > +     igt_display_t* display = &data->display;
> >
> > Why add this variable instead of just use `&data->display`?
> it's used more than once so thought it would be nice to have it in a var
> >
> > > +     enum pipe p = 0;
> >
> > Why did you add this variable? Improve the readability? If so, I'm not
> > sure that p is better than have 0 here. Or did I miss something?
> not much for readability but cause it's used like 4 times, including
> at the test end so i encapsulated the value in a variable
> >
> > > +     igt_output_t* output;
> > >
> > > -     igt_display_require_output_on_pipe(&data->display, 0);
> > > +     igt_display_require_output_on_pipe(display, p);
> > > +     data->pipe = p;
> > > +     for_each_valid_output_on_pipe(display, p, output)
> > > +             prepare_crtc(data, fd, output);
> > >
> > >       /* First check all is well with a simple query */
> > >       memset(&vbl, 0, sizeof(vbl));
> > > @@ -511,6 +517,9 @@ static void invalid_subtest(data_t *data, int fd)
> > >       vbl.request.type |= _DRM_VBLANK_SECONDARY;
> > >       vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
> > >       igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> > > +
> > > +     for_each_valid_output_on_pipe(display, p, output)
> > > +             cleanup_crtc(data, fd, output);
> > >   }
> >
> > This patch makes sense to me. I tested it in a Raven system (DCN1.0),
> > and everything looks fine to me; however, even without your patch, I see
> > the same result.
> >
> > Btw, thanks a lot for your patch.
> >
> > >   igt_main
> > >
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
