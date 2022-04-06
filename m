Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ADF10E1F4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 19:36:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d7so3845551edn.11
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Apr 2022 12:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220406191139.31227-1-juhapekka.heikkila@gmail.com>
 <Yk3oF8FCWPHUKk5/@intel.com>
In-Reply-To: <Yk3oF8FCWPHUKk5/@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 6 Apr 2022 22:35:52 +0300
Message-ID: <CAJ=qYWQLw3jd22KWg4phg4rRGa2yb6ugzxn_R9KE7_6ZsteqfA@mail.gmail.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: move start of
 crc calculation past first commit
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

On Wed, Apr 6, 2022 at 10:21 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Apr 06, 2022 at 10:11:39PM +0300, Juha-Pekka Heikkila wrote:
> > First commit may cause modeset which can on some machines take enough
> > time to fill up crc buffer causing crc buffer overflow messages. Moved
> > crc calcualtion start past first commit to avoid these messages.
> >
> > I changed small fb not to be cleared with green color, this seem
> > to take portion of execution time away.
> >
> > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > ---
> >  tests/i915/kms_big_fb.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> > index 8724d6069..6c6d674cb 100644
> > --- a/tests/i915/kms_big_fb.c
> > +++ b/tests/i915/kms_big_fb.c
> > @@ -370,12 +370,12 @@ static bool test_plane(data_t *data)
> >                * rendering pipeline introduces slight differences into
> >                * the result if we try that, and so the crc will not mat=
ch.
> >                */
> > -             igt_pipe_crc_start(data->pipe_crc);
> >               copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
> >                            small_fb->width, small_fb->height);
> >
> >               igt_display_commit2(&data->display, data->display.is_atom=
ic ?
> >                                   COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>
> Is is modesetting multiple pipes here? If not then we seem
> to have a bug somewhere as CRCs should be disabled during
> most of the modeset sequence.

From what I see on those logs where there are comments about crc
buffer overflow there's two pipes set.

>
> > +             igt_pipe_crc_start(data->pipe_crc);
> >               igt_pipe_crc_get_current(data->display.drm_fd, data->pipe=
_crc, &small_crc);
> >
> >               igt_plane_set_fb(plane, big_fb);
> > @@ -420,9 +420,8 @@ static bool test_pipe(data_t *data)
> >       if (igt_rotation_90_or_270(data->rotation))
> >               igt_swap(width, height);
> >
> > -     igt_create_color_fb(data->drm_fd, width, height,
> > -                         data->format, data->modifier,
> > -                         0, 1, 0, &data->small_fb);
> > +     igt_create_fb(data->drm_fd, width, height, data->format,
> > +                   data->modifier, &data->small_fb);
>
> I'd split that into a separate patch.

ok

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
