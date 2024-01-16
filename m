Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96810E0C5
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 15:56:16 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-50e835800adso11196328e87.0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 07:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20240110200434.218120-1-robdclark@gmail.com>
 <20240111133659.xvhekkoisi44vk3f@kamilkon-desk.igk.intel.com>
 <CAF6AEGu4SHNRu0wZ2XZoe-5BZjjiHkZZRT49z_RvyVdvHmaoBA@mail.gmail.com>
 <20240116094251.wyqyhmpdeebrx5sx@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240116094251.wyqyhmpdeebrx5sx@kamilkon-desk.igk.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Jan 2024 07:55:02 -0800
Message-ID: <CAF6AEGss5DgJxGHJjUgaK_mABPxThycqTjmemjFfSAiQvH_nzQ@mail.gmail.com>
Subject: Re: [PATCH] tests/kms_universal_plane: Re-work expectations for
 non-intel hw
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 juha-pekka.heikkila@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 1:43=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2024-01-11 at 09:30:08 -0800, Rob Clark wrote:
> > On Thu, Jan 11, 2024 at 5:37=E2=80=AFAM Kamil Konieczny
> > <kamil.konieczny@linux.intel.com> wrote:
> > >
> > > Hi Rob,
> > > On 2024-01-10 at 12:04:34 -0800, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > The expectation assumptions do not fit for non-intel hw.  So re-wor=
k the
> > > > expectations and add msm support.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  tests/kms_universal_plane.c | 102 +++++++++++++++++++++++++-------=
----
> > > >  1 file changed, 72 insertions(+), 30 deletions(-)
> > > >
> > > > diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plan=
e.c
> > > > index 6a39f93cc5aa..3158ff816046 100644
> > > > --- a/tests/kms_universal_plane.c
> > > > +++ b/tests/kms_universal_plane.c
> > > > @@ -402,8 +402,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, =
igt_output_t *output)
> > > >       sanity_test_t test =3D { .data =3D data };
> > > >       igt_plane_t *primary;
> > > >       drmModeModeInfo *mode;
> > > > -     int i;
> > > > -     int expect =3D 0;
> > >
> > > Could you keep this var?
> > >
> > > > +     int i, ret;
> > > >
> > > >       igt_output_set_pipe(output, pipe);
> > > >       mode =3D igt_output_get_mode(output);
> > > > @@ -418,43 +417,86 @@ sanity_test_pipe(data_t *data, enum pipe pipe=
, igt_output_t *output)
> > > >
> > > >       /*
> > > >        * Try to use universal plane API to set primary plane that
> > > > -      * doesn't cover CRTC (should fail on pre-gen9 and succeed on
> > > > -      * gen9+).
> > > > +      * doesn't cover CRTC.
> > > >        */
> > > >       igt_plane_set_fb(primary, &test.undersized_fb);
> > > > -     if (is_intel_device(data->drm_fd))
> > > > -             expect =3D (data->display_ver < 9) ? -EINVAL : 0;
> > > > -     igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNI=
VERSAL) =3D=3D expect);
> > > > +     ret =3D igt_display_try_commit2(&data->display, COMMIT_UNIVER=
SAL);
> > > > +
> > > > +     if (is_intel_device(data->drm_fd)) {
> > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > +             if (data->display_ver < 9)
> > > > +                     igt_assert_eq(ret, -EINVAL);
> > > > +             else
> > > > +                     igt_assert_eq(ret, 0);
> > > > +     } else if (is_msm_device(data->drm_fd)) {
> > > > +             /* Should be supported on all gens: */
> > > > +             igt_assert_eq(ret, 0);
> > > > +     } else {
> > > > +             igt_assert_eq(ret, 0);
> > > > +     }
> > >
> > > The old code above should work on msm, why do you changed it?
> >
> > The reason for this change, and several other similar but (for msm)
> > non-functionally-changing hunks was to document the expectations for
> > msm and to give folks working on other drivers a guide about where to
> > insert their specific expectations.
> >
> > The alternative, I think, if we don't want to keep adding driver
> > specifics is to just change all cases to allow either success or the
> > correct error code.
> >
> > BR,
> > -R
> >
>
> imho we should leave it as is and introduce changes when they will be
> needed and keep lines of code low. If someone will have other error
> it can be instroduced with before:
>
> if (is_intel_device(data->drm_fd))
>   expect =3D (data->display_ver < 9) ? -EINVAL : 0;
> else if (is_msm_device(data->drm_fd))

The problem with (and the reason I removed) the expect variable
approach is that it can't deal with two possible results.  And short
of enumerating every single different device, I don't think there is a
good way to know the exact expected device.  But changing things to
allow either success or checking for the expected errno would be
possible.

> As this is display code I will add Juha-Pekka to Cc.
>
> > > > -             expect =3D (data->display_ver < 9) ? -EINVAL : 0;
> > > > -     igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNI=
VERSAL) =3D=3D expect);
> > > > +     ret =3D igt_display_try_commit2(&data->display, COMMIT_UNIVER=
SAL);
>
> > >
> > > >
> > > > -     /* Same as above, but different plane positioning. */
> > > > +     /* Same as above, but different plane positioning: */
> > >
> > > Drop this change.
> > >
> > > >       igt_plane_set_position(primary, 100, 100);
> > > > -     igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNI=
VERSAL) =3D=3D expect);
> > > > +     ret =3D igt_display_try_commit2(&data->display, COMMIT_UNIVER=
SAL);
> > > > +
> > > > +     if (is_intel_device(data->drm_fd)) {
> > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > +             if (data->display_ver < 9)
> > > > +                     igt_assert_eq(ret, -EINVAL);
> > > > +             else
> > > > +                     igt_assert_eq(ret, 0);
> > > > +     } else if (is_msm_device(data->drm_fd)) {
> > > > +             /* Should be supported on all gens: */
> > > > +             igt_assert_eq(ret, 0);
> > > > +     } else {
> > > > +             igt_assert_eq(ret, 0);
> > > > +     }
> > >
> > > Same here, old code should just work for msm.
> > >
> > > >
> > > >       igt_plane_set_position(primary, 0, 0);
> > > >
> > > > -     /* Try to use universal plane API to scale down (should fail =
on pre-gen9) */
> > > > -     if (is_intel_device(data->drm_fd))
> > > > -             expect =3D (data->display_ver < 9) ? -ERANGE : 0;
> > >
> > > Please keep this if(...) expect =3D ...
> > > for a reason which follows.
> > >
> > > > -     igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->=
plane_id,
> > > > -                                output->config.crtc->crtc_id,
> > > > -                                test.oversized_fb.fb_id, 0,
> > > > -                                0, 0,
> > > > -                                mode->hdisplay + 100,
> > > > -                                mode->vdisplay + 100,
> > > > -                                IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > -                                IGT_FIXED(mode->hdisplay,0),
> > > > -                                IGT_FIXED(mode->vdisplay,0)) =3D=
=3D expect);
> > > > +     /* Try to use universal plane API to scale down */
> > > > +     ret =3D drmModeSetPlane(data->drm_fd, primary->drm_plane->pla=
ne_id,
> > > > +                           output->config.crtc->crtc_id,
> > > > +                           test.oversized_fb.fb_id, 0,
> > > > +                           0, 0,
> > > > +                           mode->hdisplay + 100,
> > > > +                           mode->vdisplay + 100,
> > > > +                           IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > +                           IGT_FIXED(mode->hdisplay,0),
> > > > +                           IGT_FIXED(mode->vdisplay,0));
> > > > +
> > > > +     if (is_intel_device(data->drm_fd)) {
> > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > +             if (data->display_ver < 9)
> > > > +                     igt_assert_eq(ret, -ERANGE);
> > > > +             else
> > > > +                     igt_assert_eq(ret, 0);
> > >
> > > Or just simple
> > >                         igt_assert_eq(ret, expect);
> > >
> > > > +     } else {
> > > > +             /* Could succeed or fail with -ERANGE depending on hw=
 limits: */
> > > > +             igt_assert((ret =3D=3D 0) || (ret =3D=3D -ERANGE));
>
> Could you read/discover those limits and check for actual
> expected error?

Not really, other than doing atomic-test commits.  Because of the way
this all turns into atomic test+commit on the driver side, I'm not
sure if that really adds value compared to just allowing each of these
to return zero or expected error code.

BR,
-R

> Regards,
> Kamil
>
> > > > +     }
> > >
> > > This is a real change, it relaxed checks for non-intel HW.
> > > imho we should ask others, for example amd developers if that is ok
> > > for them.
> > >
> > > >
> > > >       /* Try to use universal plane API to scale up (should fail on=
 pre-gen9) */
> > > > -     igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->=
plane_id,
> > > > -                                output->config.crtc->crtc_id,
> > > > -                                test.oversized_fb.fb_id, 0,
> > > > -                                0, 0,
> > > > -                                mode->hdisplay,
> > > > -                                mode->vdisplay,
> > > > -                                IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > -                                IGT_FIXED(mode->hdisplay - 100,0),
> > > > -                                IGT_FIXED(mode->vdisplay - 100,0))=
 =3D=3D expect);
> > > > +     ret =3D drmModeSetPlane(data->drm_fd, primary->drm_plane->pla=
ne_id,
> > > > +                           output->config.crtc->crtc_id,
> > > > +                           test.oversized_fb.fb_id, 0,
> > > > +                           0, 0,
> > > > +                           mode->hdisplay,
> > > > +                           mode->vdisplay,
> > > > +                           IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > +                           IGT_FIXED(mode->hdisplay - 100,0),
> > > > +                           IGT_FIXED(mode->vdisplay - 100,0));
> > > > +
> > > > +     if (is_intel_device(data->drm_fd)) {
> > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > +             if (data->display_ver < 9)
> > > > +                     igt_assert_eq(ret, -ERANGE);
> > > > +             else
> > > > +                     igt_assert_eq(ret, 0);
> > >
> > > Same here, just simple:
> > >                         igt_assert_eq(ret, expect);
> > >
> > > Regards,
> > > Kamil
> > >
> > > > +     } else {
> > > > +             /* Could succeed or fail with -ERANGE depending on hw=
 limits: */
> > > > +             igt_assert((ret =3D=3D 0) || (ret =3D=3D -ERANGE));
> > > > +     }
> > > >
> > > >       /* Find other crtcs and try to program our primary plane on t=
hem */
> > > >       for (i =3D 0; i < test.moderes->count_crtcs; i++)
> > > > --
> > > > 2.43.0
> > > >
