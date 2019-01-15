Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id D945A89AC2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 17:41:39 +0000 (UTC)
Date: Tue, 15 Jan 2019 17:13:01 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190115161301.hieduu4jdxivbrlj@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-19-paul.kocialkowski@bootlin.com>
 <20190111151928.4tym2fgfk4osc4rb@flea>
 <332105994b936f46264e21fe582aeb0567362374.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <332105994b936f46264e21fe582aeb0567362374.camel@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 18/21] lib/igt_frame: Add a
 checkerboard frame comparison method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1847173810=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1847173810==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yxxklmzrhtukftqe"
Content-Disposition: inline


--yxxklmzrhtukftqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2019 at 04:04:16PM +0100, Paul Kocialkowski wrote:
> On Fri, 2019-01-11 at 16:19 +0100, Maxime Ripard wrote:
> > On Fri, Jan 11, 2019 at 10:05:29AM +0100, Paul Kocialkowski wrote:
> > > This introduces a new frame comparison method that was designed for
> > > patterns that follow a checkerboard style. These patterns are made of
> > > consecutive rectangular shapes with alternating solid colors. They are
> > > currently used for some Chamelium-based tests.
> > >=20
> > > The method is particularly adapted for cases where the edges of the
> > > shapes might be blurred (e.g. due to scaling), which makes it impossi=
ble
> > > to use pixel-perfect or CRC-based comparisons to decide whether the
> > > captured frame matches the reference.
> > >=20
> > > Overall, this test will first detect the edges of the pattern and lat=
er
> > > exclude them from comparison. Colors are compared between the referen=
ce
> > > and capture with a low threshold for error. A percentage of the faulty
> > > pixels is calculated and the captured frame is considered invalid if
> > > more than one percent of the pixels are erroneous.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  lib/igt_frame.c | 121 ++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  lib/igt_frame.h |   2 +
> > >  2 files changed, 123 insertions(+)
> > >=20
> > > diff --git a/lib/igt_frame.c b/lib/igt_frame.c
> > > index 6984c02e9912..e0215660ea6e 100644
> > > --- a/lib/igt_frame.c
> > > +++ b/lib/igt_frame.c
> > > @@ -267,3 +267,124 @@ complete:
> > > =20
> > >  	return match;
> > >  }
> > > +
> > > +#define XR24_COLOR_VALUE(data, stride, x, y, c) \
> > > +	*((uint8_t *)(data) + (y) * (stride) + 4 * (x) + (c))
> > > +
> > > +/**
> > > + * igt_check_checkerboard_frame_match:
> > > + * @reference: The reference cairo surface
> > > + * @capture: The captured cairo surface
> > > + *
> > > + * Checks that the reference frame matches the captured frame using a
> > > + * method designed for checkerboard patterns. These patterns are mad=
e of
> > > + * consecutive rectangular shapes with alternating solid colors.
> > > + *
> > > + * The intent of this method is to cover cases where the captured re=
sult is
> > > + * pixel-perfect due to features such as scaling or YUV conversion a=
nd
> >=20
> > is *not* pixel perfect?
>=20
> Woops, good catch!
>=20
> [...]
>=20
> > > diff --git a/lib/igt_frame.h b/lib/igt_frame.h
> > > index 11f96cbea203..f44f57d7ce73 100644
> > > --- a/lib/igt_frame.h
> > > +++ b/lib/igt_frame.h
> > > @@ -38,5 +38,7 @@ void igt_write_compared_frames_to_png(cairo_surface=
_t *reference,
> > >  				      const char *capture_suffix);
> > >  bool igt_check_analog_frame_match(cairo_surface_t *reference,
> > >  				  cairo_surface_t *capture);
> > > +bool igt_check_checkerboard_frame_match(cairo_surface_t *reference,
> > > +					cairo_surface_t *capture);
> >=20
> > Looks good otherwise. I guess it's missing some comments about the
> > algorithm being used though.
>=20
> I tried to include comments where I felt was necessary, but might have
> missed out on some aspects. Or maybe you meant that the documentation
> block does not provide enough detail about the algorithm itself (as
> opposed to what it does)?

Sorry if it wasn't clear enough, that's indeed what I meant.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--yxxklmzrhtukftqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXD4GjQAKCRDj7w1vZxhR
xUYVAPwOv8DkHEOZ797bWHh9t2YqjDf1ZVLDGBGYyPnajRUUugD9ELOpSd9JVbS1
+v0RgDArD8w+htAZ1WAzwNECeI8YEAc=
=0Jbw
-----END PGP SIGNATURE-----

--yxxklmzrhtukftqe--

--===============1847173810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1847173810==--
