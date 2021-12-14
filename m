Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23DD10E671
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Dec 2021 09:44:25 +0000 (UTC)
Date: Tue, 14 Dec 2021 11:43:44 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbhnUK2awwSiSYYd@platvala-desk.ger.corp.intel.com>
References: <20211209002716.209-1-quic_jesszhan@quicinc.com>
 <YbHn/Vc69yVCevzZ@platvala-desk.ger.corp.intel.com>
 <1d8e0747-d1dd-2085-2f22-86d431b5906a@quicinc.com>
 <YbLvn+yuMiCeDaAU@platvala-desk.ger.corp.intel.com>
 <7c0b3d0c-5c5f-b3a0-f519-2c8fb2a99dd0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7c0b3d0c-5c5f-b3a0-f519-2c8fb2a99dd0@quicinc.com>
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

On Mon, Dec 13, 2021 at 04:50:26PM -0800, Jessica Zhang wrote:
>=20
>=20
> On 12/9/2021 10:11 PM, Petri Latvala wrote:
> > On Thu, Dec 09, 2021 at 12:54:58PM -0800, Jessica Zhang wrote:
> > >=20
> > >=20
> > > On 12/9/2021 3:26 AM, Petri Latvala wrote:
> > > > On Wed, Dec 08, 2021 at 04:27:16PM -0800, Jessica Zhang wrote:
> > > > > Catch edge cases where driver doesn't support larger scale factor=
s or
> > > > > pipe doesn't support scaling.
> > > > >=20
> > > > > Currently, a 20x20 framebuffer is passed in to be upscaled. Howev=
er,
> > > > > this will cause issues with other drivers as they may not support=
 larger
> > > > > scale factors or may not support scaling at all for certain plane=
s.
> > > > >=20
> > > > > This avoids failures due to invalid scale factor by trying
> > > > > the original 20x20 framebuffer commit, then trying to commit larg=
er
> > > > > framebuffers up to and including unity scale.
> > > > >=20
> > > > > Changes since V1:
> > > > > - try_commit_with_fb_size: Changed igt_try_commit2 to
> > > > >     igt_display_try_commit_atomic instead to avoid redundant comm=
its
> > > > > - try_commit_with_fb_size: Moved calls to clear framebuffer to ou=
tside
> > > > >     of success condition and moved cleanup_crtc back to outside o=
f method
> > > > >=20
> > > > > Tested-on: Qualcomm RB5 (sdm845)
> > > > >=20
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    tests/kms_plane_scaling.c | 55 +++++++++++++++++++++++++++++++=
+-------
> > > > >    1 file changed, 46 insertions(+), 9 deletions(-)
> > > > >=20
> > > > > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > > > > index 85db11ee..971c1532 100644
> > > > > --- a/tests/kms_plane_scaling.c
> > > > > +++ b/tests/kms_plane_scaling.c
> > > > > @@ -1,5 +1,6 @@
> > > > >    /*
> > > > >     * Copyright =A9 2013,2014 Intel Corporation
> > > > > + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All right=
s reserved.
> > > > >     *
> > > > >     * Permission is hereby granted, free of charge, to any person=
 obtaining a
> > > > >     * copy of this software and associated documentation files (t=
he "Software"),
> > > > > @@ -118,6 +119,32 @@ static void prepare_crtc(data_t *data, igt_o=
utput_t *output, enum pipe pipe,
> > > > >    	igt_display_commit2(display, COMMIT_ATOMIC);
> > > > >    }
> > > > > +static int try_commit_with_fb_size(int width, int height, igt_ro=
tation_t rot,
> > > > > +		                            igt_display_t *display, data_t *d,
> > > > > +                                   igt_plane_t *plane,
> > > > > +		                            drmModeModeInfo *mode)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	/* Check min to full resolution upscaling */
> > > > > +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> > > > > +	igt_fb_set_size(&d->fb[0], plane, width, height);
> > > > > +	igt_plane_set_position(plane, 0, 0);
> > > > > +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> > > > > +	igt_plane_set_rotation(plane, rot);
> > > > > +
> > > > > +	ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_=
TEST_ONLY |
> > > > > +		                                DRM_MODE_ATOMIC_ALLOW_MODESET,=
 NULL);
> > > > > +
> > > > > +	if (!ret)
> > > > > +		igt_display_commit2(display, COMMIT_ATOMIC);
> > > >=20
> > > > Now this looks more understandable but I still have one "why"
> > > > remaining: Why test_only the commit if you're anyway going to perfo=
rm
> > > > the commit? You could just have this as one try_commit, without
> > > > test_only, and let it perform it, as there's nothing done different=
ly
> > > > here based on success/failure.
> > > >=20
> > > The original intention was to test that a commit will go through befo=
re
> > > actually doing the commit. This way, the test would be more optimized=
 since
> > > we would only perform a commit when we know it will succeed. Otherwis=
e, in a
> > > worst case scenario, we'd be performing 3 or 4 commits per pipe/forma=
t for a
> > > subtest like pipe-*-scaler-with-pixel-format.
> >=20
> > But the kernel does the same checks for TEST_ONLY as for actually
> > doing the commit. For this kind of optimization assertion I have to
> > ask for some numbers to prove it's saving time enough to be worth of
> > the more complicated code.
> >=20
> > Doing a TEST_ONLY commit followed by doing the same commit without
> > TEST_ONLY surely is slower when the commit will succeed at least.
> >=20
>=20
> Sorry if this wasn't clear in my previous reply -- I'm focusing on
> optimizing for cases where scaling a 20x20 buffer isn't supported and for
> failure cases. For example, if we just call try_commit, we would be doing=
 3
> commits per format per pipe in cases where the driver only supports unity
> scale. Since TEST_ONLY will only perform a check without performing an
> actual commit [1], wouldn't it be more optimal to only perform a commit if
> the commit will succeed in cases like this?

Check the other functions called from there,
drm_atomic_nonblocking_commit and drm_atomic_commit. They call
drm_atomic_check_only to check if the commit would succeed.

Which is my point: TEST_ONLY flag is for cases where you just want to
verify the validness of a commit without ever (!) executing it. If
you're going to execute it after checking, just try to execute it,
that's faster. It will flow through the same code to check for
failure.


--=20
Petri Latvala
