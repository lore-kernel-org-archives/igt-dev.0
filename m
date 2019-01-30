Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB7F897B4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jan 2019 15:25:29 +0000 (UTC)
Date: Wed, 30 Jan 2019 16:25:27 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190130152526.z2wc7gkf6m7wqvlk@flea>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
 <20190125145842.15738-6-maxime.ripard@bootlin.com>
 <9f029deab28e9f40502c4c0f8406d5d3ac5141e2.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9f029deab28e9f40502c4c0f8406d5d3ac5141e2.camel@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 05/13] igt: fb: Refactor dumb buffer
 allocation path
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1740113092=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1740113092==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lwbybcwwlkkcye5p"
Content-Disposition: inline


--lwbybcwwlkkcye5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Jan 29, 2019 at 02:46:55PM -0500, Lyude Paul wrote:
> On Fri, 2019-01-25 at 15:58 +0100, Maxime Ripard wrote:
> > The else condition is not needed, since all the other conditions return
> > when they are done.
> >=20
> > Move the KMS dumb buffer allocation outside of the outer else condition,
> > this will also allow to ease later changes.
> >=20
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 25 +++++++++++++++++--------
> >  1 file changed, 17 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index d69c3fb2d38d..270db8d6dc90 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -557,15 +557,24 @@ static int create_bo_for_fb(struct igt_fb *fb)
> >  			igt_require(driver_has_gem_api);
> >  			return -EINVAL;
> >  		}
> > -	} else {
> > -		fb->is_dumb =3D true;
> > -
> > -		fb->gem_handle =3D kmstest_dumb_create(fd, fb->width, fb-
> > >height,
> > -						     fb->plane_bpp[0],
> > -						     &fb->strides[0], &fb-
> > >size);
> > -
> > -		return fb->gem_handle;
> >  	}
> > +
> > +	/*
> > +	 * The current dumb buffer allocation API doesn't really allow to
> > +	 * specify a custom size or stride. Yet the caller is free to specify
> > +	 * them, so we need to make sure to error out in this case.
> > +	 */
> > +	igt_assert(fb->size =3D=3D 0);
> > +	igt_assert(fb->strides[0] =3D=3D 0);
> > +
> > +	fb->size =3D calc_fb_size(fb);
>=20
> ^ Is this supposed to be part of a seperate patch?

Yeah, definitely, I'll split it in another patch, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lwbybcwwlkkcye5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFHB5gAKCRDj7w1vZxhR
xbFhAQChQ2xs3z0DFDEb+/CYlPS0XLZH2w5GCgjHYCcYEegUJQD/ZqAmfqJyV042
YGMCOcvqfKalGQYqvIH1ICE4WWeFcgA=
=TI8Q
-----END PGP SIGNATURE-----

--lwbybcwwlkkcye5p--

--===============1740113092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1740113092==--
