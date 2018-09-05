Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 319CD6E459
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 13:16:38 +0000 (UTC)
Date: Wed, 5 Sep 2018 15:16:36 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180905131636.g2tp65z5y2b32kbb@flea>
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
Content-Type: multipart/mixed; boundary="===============0924750018=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0924750018==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rpde72bpr5gh3wid"
Content-Disposition: inline


--rpde72bpr5gh3wid
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

I guess we could yes. I'll try to adjust the patches to do that.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rpde72bpr5gh3wid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluP1ygACgkQ0rTAlCFN
r3TPcg/+MkLrGz6L696YO0oGdNxd81O5fLflPopBn4euvmuu34DXI/awmNOffye0
khTJWnOegH4zhPhBuBqtSNvoi/46RqWvEoZgJ6X0Z0e2UDUEVFU0NKiwGUjvcjJJ
FuXdxEu/SQO6r/B4PghGraUk7mF+XzKw4MW3Jqd54BjPlYsLGeheu9yKJXBOUxLV
syDxqgmqXLdig/d6p8RVkGMGKFAh9PyE8zG73QinsY2IKQ5P8Du+yRrKLfYCdqcd
0/9gQX6FP61NA70MrgWhesh2iHK8744fmIE5VFxTdAHEaTHUAkLE3kBvrjyZu/tJ
v4RJqvEdSvrxLmcZ+HSnB/XokNQlLT+TEte6WERtQfMI3E+Gb8bDZ53pR9oyp0ps
8gh8jpNnddI2Ac2DoO4S8CY9DMEsaANlQN3qi0cny3B/LtGgTGsZK3eYAuYP4/jb
Xfnn/FzKG/bQ4GHNMINOuss70m/vOJD+Q6gjihLSiEEsBKRySYC4AjS0+AlO3prv
BNDIBb917SbC+FhfvgMWaEnL2K45LlMV4zZ1tezmg0CRpy29GaDeh6mmBLdy5cVg
9fTLchxm5hFn6/1l1JKC/n/O8VnFa6vm9S4v/W6ppZW6iAbjocn52fKExK2bAfIt
hfpuquK7WHA1ItVNFmNGABDjAVj3ePwMjnD3n71OOqzvsYw31QQ=
=W3OZ
-----END PGP SIGNATURE-----

--rpde72bpr5gh3wid--

--===============0924750018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0924750018==--
