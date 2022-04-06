Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21D510E1F4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 19:09:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g20so3804680edw.6
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Apr 2022 12:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220406130058.25378-1-juhapekka.heikkila@gmail.com>
 <Yk2bZ5WZmXMEcnVn@intel.com>
In-Reply-To: <Yk2bZ5WZmXMEcnVn@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 6 Apr 2022 22:09:36 +0300
Message-ID: <CAJ=qYWSViDvTbi6FxV9ox-ykgxamatBaVW5b21yjaed36tR=Yw@mail.gmail.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: take out test
 only flag for try commit in inner loop
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 6, 2022 at 4:53 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Apr 06, 2022 at 04:00:58PM +0300, Juha-Pekka Heikkila wrote:
> > This will cause try commit to do modeset which could cause crc buffer
> > overflow in later commit. I changed small fb not to be cleared with
> > green color so there will be no unnecessary green flashes, this seem
> > to also take portion of execution time away.
> >
> > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > ---
> >  tests/i915/kms_big_fb.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> > index 8724d6069..7c9bb5d2a 100644
> > --- a/tests/i915/kms_big_fb.c
> > +++ b/tests/i915/kms_big_fb.c
> > @@ -348,8 +348,7 @@ static bool test_plane(data_t *data)
> >                */
> >               if (i =3D=3D 0 && data->display.is_atomic &&
> >                   igt_display_try_commit_atomic(&data->display,
> > -                                               DRM_MODE_ATOMIC_ALLOW_M=
ODESET |
> > -                                               DRM_MODE_ATOMIC_TEST_ON=
LY,
> > +                                               DRM_MODE_ATOMIC_ALLOW_M=
ODESET,
> >                                                 NULL) !=3D 0) {
>
> The point here is to validate that the plane configuration is valid,
> if not we skip the test. Doing a real commit here doesn't make sense.
>
> If there's some step that's too slow while we have the crc capture
> enabled, then we should try do that step before we enable the crc
> capture. A modeset should not cause a crc buffer overflow in itself
> since it stops the crc capture for the duration of the modeset.
> But looking at the code it looks like it should be possible to
> reorder igt_pipe_crc_start() and copy_pattern(). I guess it would
> even be possible to do the igt_pipe_crc_start() after the commit.

Yea, I was trying to be clever with this, I did figure try commit will
anyway talk about failure if commit is not good for given machine.
I did soon after sending the patch realize this is not the change we'd
want here in any case because now small fb copying go to frontbuffer,
probably that is what caused those ci failures for this patch along
with first igt_display_commit2 being noop hence crc failure.

As is this part is causing those dmesg failures like this for example
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1055/fi-bwr-2160/igt@kms_bi=
g_fb@linear-64bpp-rotate-0.html

I did go measure where the time is spent from test perspective and it
is in the first commit, even on my icl with edp time spent on that
commit was multiple of what was spend on following rounds.

>
> >                       if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION)=
)
> >                               igt_plane_set_rotation(plane, IGT_ROTATIO=
N_0);
> > @@ -420,9 +419,8 @@ static bool test_pipe(data_t *data)
> >       if (igt_rotation_90_or_270(data->rotation))
> >               igt_swap(width, height);
> >
> > -     igt_create_color_fb(data->drm_fd, width, height,
> > -                         data->format, data->modifier,
> > -                         0, 1, 0, &data->small_fb);
> > +     igt_create_fb(data->drm_fd, width, height,
> > +                   data->format, data->modifier, &data->small_fb);
>
> I probably made it look obnoxious to make sure it's easy to spot
> should the rendercopy fails somehow.

I was thinking if it was something about bigfb related things but I
thought we anyway have other rendercopy tests and if rendercopy would
fail here it should still produce incorrect crcs as small fbs should
work. You think it would be better left green?

I'll send another patch for the test, it has this change for removal
of green in it.

/Juha-Pekka

>
> >
> >       igt_output_set_pipe(data->output, data->pipe);
> >
> > --
> > 2.28.0
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
