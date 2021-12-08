Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEB46E0DD
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 17:09:08 +0000 (UTC)
Date: Wed, 8 Dec 2021 19:07:52 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbDmaN56Dgn/z6BL@platvala-desk.ger.corp.intel.com>
References: <20211204034919.14779-1-quic_jesszhan@quicinc.com>
 <YbC72sTvptdtvFWs@platvala-desk.ger.corp.intel.com>
 <cbc3485c-61ae-87d0-517b-dce74747c97a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cbc3485c-61ae-87d0-517b-dce74747c97a@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Increase
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

On Wed, Dec 08, 2021 at 08:56:03AM -0800, Jessica Zhang wrote:
> Hi Petri,
>=20
> On 12/8/2021 6:06 AM, Petri Latvala wrote:
> > On Fri, Dec 03, 2021 at 07:49:19PM -0800, Jessica Zhang wrote:
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
> > > Tested-on: Qualcomm RB5 (sdm845)
> > >=20
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   tests/kms_plane_scaling.c | 52 ++++++++++++++++++++++++++++++------=
---
> > >   1 file changed, 41 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > > index 85db11ee..1f0143fc 100644
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
> > > @@ -118,6 +119,30 @@ static void prepare_crtc(data_t *data, igt_outpu=
t_t *output, enum pipe pipe,
> > >   	igt_display_commit2(display, COMMIT_ATOMIC);
> > >   }
> > > +static int try_commit_with_fb_size(int width, int height, igt_rotati=
on_t rot, igt_display_t *display, data_t *d, igt_plane_t *plane, drmModeMod=
eInfo *mode)
> > > +{
> > > +	int ret;
> > > +
> > > +	cleanup_crtc(d);
> > > +
> > > +	/* Check min to full resolution upscaling */
> > > +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> > > +	igt_fb_set_size(&d->fb[0], plane, width, height);
> > > +	igt_plane_set_position(plane, 0, 0);
> > > +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> > > +	igt_plane_set_rotation(plane, rot);
> > > +
> > > +	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> > > +
> > > +	if (!ret) {
> > > +		igt_display_commit2(display, COMMIT_ATOMIC);
> > > +		igt_plane_set_fb(plane, NULL);
> > > +		igt_plane_set_position(plane, 0, 0);
> >=20
> > I don't understand what's done here. If doing a commit fails, do the
> > commit again?
> >=20
> In this method, we'll test if a commit will go through with a specific
> framebuffer (without actually doing the commit) using
> `igt_display_try_commit2()`.

But igt_display_try_commit2() will perform the commit. The only
difference to igt_display_commit2() is whether the error is asserted
or just returned.


--=20
Petri Latvala
