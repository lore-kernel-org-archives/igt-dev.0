Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AFF6E016
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jan 2019 15:38:32 +0000 (UTC)
Date: Wed, 30 Jan 2019 16:38:28 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190130153828.4gd5mr546spvamgx@flea>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
 <20190125145842.15738-8-maxime.ripard@bootlin.com>
 <45cfa144bcb2366a54a1ec3128f71baeee61e6fb.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <45cfa144bcb2366a54a1ec3128f71baeee61e6fb.camel@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 07/13] igt: fb: Don't pass the stride
 when allocating a dumb, multi-planar buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0200556786=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0200556786==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f7xlogrcu44duzct"
Content-Disposition: inline


--f7xlogrcu44duzct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Jan 29, 2019 at 03:08:10PM -0500, Lyude Paul wrote:
> On Fri, 2019-01-25 at 15:58 +0100, Maxime Ripard wrote:
> > The dumb buffer allocation API only considers a single plane, and even
> > though allocating multi-planar buffers through it is allowed, the strid=
e it
> > gives back is the the width times the bpp passed as an argument.
> >=20
> > That doesn't work in our case, since the bpp is going to be the one we =
give
> > as an argument, but split over three planes so the stride doesn't match
> > anymore.
> >=20
> > A proper fix for this would be to have a better dumb buffer allocation =
API,
> > but for the time being, let's do it that way.
> >=20
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 1c52aebb674e..048d274e5d36 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -530,6 +530,7 @@ static int create_bo_for_fb(struct igt_fb *fb)
> >  {
> >  	const struct format_desc_struct *fmt =3D lookup_drm_format(fb-
> > >drm_format);
> >  	unsigned int plane, bpp;
> > +	unsigned *strides =3D &fb->strides[0];
> >  	int fd =3D fb->fd;
> > =20
> >  	if (fb->tiling || fb->size || fb->strides[0] || igt_format_is_yuv(fb-
> > >drm_format)) {
> > @@ -575,8 +576,22 @@ static int create_bo_for_fb(struct igt_fb *fb)
> >  				    plane ? fmt->hsub * fmt->vsub : 1);
> > =20
> >  	fb->is_dumb =3D true;
> > +
> > +	/*
> > +	 * We can't really pass the stride array here since the dumb
> > +	 * buffer allocation is assuming that it operates on one
> > +	 * plane, and therefore will calculate the stride as if each
> > +	 * pixels were stored on a single plane.
>=20
> nitpick: s/each pixels were/each pixel was/
>=20
> > +	 *
> > +	 * This might cause issues at some point on drivers that would
> > +	 * change the stride of YUV buffers, but we haven't
> > +	 * encountered any yet.
> > +	 */
> Is it possible to add an igt_assert to check for this? Either way, with t=
hose
> changes:

I'm not sure we can test this actually. If we don't pass any pointer,
then we don't get a stride back, and if we do then we will always get
a stride that is wrong for what we're trying to do :/

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--f7xlogrcu44duzct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFHE9AAKCRDj7w1vZxhR
xXDbAQDzbfXYfkdw9JJaDSF65FU1klpi3UrsmO9NIRyP5hja5QEA04rZb59e7dpz
jYlUB6iP4WcfXvT8cVSo/CGFVesUEAQ=
=UilZ
-----END PGP SIGNATURE-----

--f7xlogrcu44duzct--

--===============0200556786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0200556786==--
