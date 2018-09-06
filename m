Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9690589B18
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Sep 2018 11:41:30 +0000 (UTC)
Date: Thu, 6 Sep 2018 13:41:29 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180906114129.6ewtxz5qaehbig4j@flea>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
 <f9e020246e4999bec72c9005e729b87b51391cdb.1535721136.git-series.maxime.ripard@bootlin.com>
 <20180831134110.GY5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180831134110.GY5565@intel.com>
Subject: Re: [igt-dev] [PATCH v6 03/13] fb: Create common function to
 convert frame formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0602582757=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0602582757==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2zlt74k2mppqwrx3"
Content-Disposition: inline


--2zlt74k2mppqwrx3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 04:41:10PM +0300, Ville Syrj=E4l=E4 wrote:
> On Fri, Aug 31, 2018 at 03:12:12PM +0200, Maxime Ripard wrote:
> > The current code to convert between two buffer formats is quite tied to=
 the
> > cairo surface infrastructure. Since we'll want to reuse it, make that
> > function more generic by introducing a common structure that passes all=
 the
> > arguments and a common function that will call the right functions we
> > needed.
> >=20
> > Reviewed-by: Eric Anholt <eric@anholt.net>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 243 ++++++++++++++++++++++++++++++++--------------------
> >  1 file changed, 153 insertions(+), 90 deletions(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 4061fedec0c1..1914233786a5 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -1384,6 +1384,24 @@ struct fb_convert_blit_upload {
> >  	struct fb_blit_linear linear;
> >  };
> > =20
> > +struct fb_convert_buf {
> > +	void			*ptr;
> > +	unsigned int		stride;
> > +	unsigned int		size;
> > +	uint32_t		fmt;
> > +	enum igt_color_encoding	color_encoding;
> > +	enum igt_color_range	color_range;
> > +	uint32_t		offsets[4];
> > +};
>=20
> I wonder if we can just use igt_fb for that instead of duplicating most
> of it?

After looking into it again, now I remember why I didn't do what you
suggested. In the case where you are in the YUYV path, with a "shadow"
buffer being used to perform the cairo operations on top of an YUV
buffer, you end up with conversions in create_cairo_surface__convert
and destroy_cairo_surface__convert, getting a fb_convert_blit_upload
structure as an argument.

That structure however is used to convert one buffer to the shadow
buffer, or the other way around at destroy time. However, a single
igt_fb is allocated for that structure, which makes it impossible to
assign the second fb in that particular case. All the informations
needed to perform the conversion are stored in multiple structures
(fb_convert_blit_upload.linear, fb_convert_blit_upload.blit, and the
actual igt_fb instance) that we need to aggregate to find the correct
conversion parameters.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--2zlt74k2mppqwrx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluRElgACgkQ0rTAlCFN
r3QVuBAAkKvX+Mp0XzU/6L8+FPCVItWS690xUGn5MUZjVFVJYaGqeZPiDf0gdF78
JM7fsScikbBzTR7SzT+qhEUlZm0gtOKq/eWJzJa3EXTeglRan5DqJS8wwLVA9NlA
VMlqk7cuD1D3GlMVLQXa4aht2aDq/Pu8a7Grdh5OBtZiNyGy0rE+RCBBwjarmLop
JPJK4EPoOt1tOoEPvxwFtVMOVJfRyRk9Q1xZEHkrvSNmgFk/NNMp9t3wWakUapEL
FweaXdJfk6mDd0cfWKkKGuF4ld1OHh3tm/Pe2srJPTcjy8c3NLWXmmJaQdx3yFkI
xAQANrio3d2GV9u5QDq4+9oxx9szvHl5v0op72aD8HXxsBq8hRTtsXieyA75QAYu
DtJyUBYOzgsRry7DtM+v7oEJgT4k9TgxalgO3hBPuwaafuJnY/u/IBAKpl+IgkQY
r8ex9x1ZFJoeIXt62i/OiUkNCS8ZmlJAE7bbCfVw2Fb0nVYzbHK5NSLt2h8VtbTo
KqnOX8trpMaUh7fHyNcXic2x30uSpZ1gEBG6YBZZrtOkh9P8baw3muVG0liXCyJw
UllvPSh0DfRTwZ2lVYH71k6B90AbD2VKRRHK1cBiDCAqZF/Astbm3M0mm+GwkRgx
fiTjo6jhBz3Xp1fTgsfQXH2QYAyYUnGnM37L9lxXQ2AjSuprArk=
=b867
-----END PGP SIGNATURE-----

--2zlt74k2mppqwrx3--

--===============0602582757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0602582757==--
