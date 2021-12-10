Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4C10E22D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 06:12:29 +0000 (UTC)
Date: Fri, 10 Dec 2021 08:11:43 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbLvn+yuMiCeDaAU@platvala-desk.ger.corp.intel.com>
References: <20211209002716.209-1-quic_jesszhan@quicinc.com>
 <YbHn/Vc69yVCevzZ@platvala-desk.ger.corp.intel.com>
 <1d8e0747-d1dd-2085-2f22-86d431b5906a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1d8e0747-d1dd-2085-2f22-86d431b5906a@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_scaling: Increase
 buffer size if driver doesn't support larger scale factors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_khsieh@quicinc.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 12:54:58PM -0800, Jessica Zhang wrote:
>=20
>=20
> On 12/9/2021 3:26 AM, Petri Latvala wrote:
> > On Wed, Dec 08, 2021 at 04:27:16PM -0800, Jessica Zhang wrote:
> > > Catch edge cases where driver doesn't support larger scale factors or
> > > pipe doesn't support scaling.
> > >=20
> > > Currently, a 20x20 framebuffer is passed in to be upscaled. However,
> > > this will cause issues with other drivers as they may not support lar=
ger
> > > scale factors or may not support scaling at all for certain planes.
> > >=20
> > > This avoids failures due to invalid scale factor by trying
> > > the original 20x20 framebuffer commit, then trying to commit larger
> > > framebuffers up to and including unity scale.
> > >=20
> > > Changes since V1:
> > > - try_commit_with_fb_size: Changed igt_try_commit2 to
> > >    igt_display_try_commit_atomic instead to avoid redundant commits
> > > - try_commit_with_fb_size: Moved calls to clear framebuffer to outside
> > >    of success condition and moved cleanup_crtc back to outside of met=
hod
> > >=20
> > > Tested-on: Qualcomm RB5 (sdm845)
> > >=20
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   tests/kms_plane_scaling.c | 55 ++++++++++++++++++++++++++++++++----=
---
> > >   1 file changed, 46 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > > index 85db11ee..971c1532 100644
> > > --- a/tests/kms_plane_scaling.c
> > > +++ b/tests/kms_plane_scaling.c
> > > @@ -1,5 +1,6 @@
> > >   /*
> > >    * Copyright =A9 2013,2014 Intel Corporation
> > > + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights re=
served.
> > >    *
> > >    * Permission is hereby granted, free of charge, to any person obta=
ining a
> > >    * copy of this software and associated documentation files (the "S=
oftware"),
> > > @@ -118,6 +119,32 @@ static void prepare_crtc(data_t *data, igt_outpu=
t_t *output, enum pipe pipe,
> > >   	igt_display_commit2(display, COMMIT_ATOMIC);
> > >   }
> > > +static int try_commit_with_fb_size(int width, int height, igt_rotati=
on_t rot,
> > > +		                            igt_display_t *display, data_t *d,
> > > +                                   igt_plane_t *plane,
> > > +		                            drmModeModeInfo *mode)
> > > +{
> > > +	int ret;
> > > +
> > > +	/* Check min to full resolution upscaling */
> > > +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> > > +	igt_fb_set_size(&d->fb[0], plane, width, height);
> > > +	igt_plane_set_position(plane, 0, 0);
> > > +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> > > +	igt_plane_set_rotation(plane, rot);
> > > +
> > > +	ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST=
_ONLY |
> > > +		                                DRM_MODE_ATOMIC_ALLOW_MODESET, NUL=
L);
> > > +
> > > +	if (!ret)
> > > +		igt_display_commit2(display, COMMIT_ATOMIC);
> >=20
> > Now this looks more understandable but I still have one "why"
> > remaining: Why test_only the commit if you're anyway going to perform
> > the commit? You could just have this as one try_commit, without
> > test_only, and let it perform it, as there's nothing done differently
> > here based on success/failure.
> >=20
> The original intention was to test that a commit will go through before
> actually doing the commit. This way, the test would be more optimized sin=
ce
> we would only perform a commit when we know it will succeed. Otherwise, i=
n a
> worst case scenario, we'd be performing 3 or 4 commits per pipe/format fo=
r a
> subtest like pipe-*-scaler-with-pixel-format.

But the kernel does the same checks for TEST_ONLY as for actually
doing the commit. For this kind of optimization assertion I have to
ask for some numbers to prove it's saving time enough to be worth of
the more complicated code.

Doing a TEST_ONLY commit followed by doing the same commit without
TEST_ONLY surely is slower when the commit will succeed at least.


--=20
Petri Latvala
