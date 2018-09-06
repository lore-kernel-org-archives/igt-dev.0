Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B46996E03F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Sep 2018 12:49:39 +0000 (UTC)
Date: Thu, 6 Sep 2018 14:49:17 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180906124917.bn7siyjeaqafmkpg@flea>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
 <f9e020246e4999bec72c9005e729b87b51391cdb.1535721136.git-series.maxime.ripard@bootlin.com>
 <20180831134110.GY5565@intel.com>
 <20180906114129.6ewtxz5qaehbig4j@flea>
 <20180906121116.GZ5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180906121116.GZ5565@intel.com>
Subject: Re: [igt-dev] [PATCH v6 03/13] fb: Create common function to
 convert frame formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1978364749=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1978364749==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ehay3geq7whhfftg"
Content-Disposition: inline


--ehay3geq7whhfftg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 03:11:16PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, Sep 06, 2018 at 01:41:29PM +0200, Maxime Ripard wrote:
> > On Fri, Aug 31, 2018 at 04:41:10PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Fri, Aug 31, 2018 at 03:12:12PM +0200, Maxime Ripard wrote:
> > > > The current code to convert between two buffer formats is quite tie=
d to the
> > > > cairo surface infrastructure. Since we'll want to reuse it, make th=
at
> > > > function more generic by introducing a common structure that passes=
 all the
> > > > arguments and a common function that will call the right functions =
we
> > > > needed.
> > > >=20
> > > > Reviewed-by: Eric Anholt <eric@anholt.net>
> > > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > > > ---
> > > >  lib/igt_fb.c | 243 ++++++++++++++++++++++++++++++++---------------=
-----
> > > >  1 file changed, 153 insertions(+), 90 deletions(-)
> > > >=20
> > > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > > index 4061fedec0c1..1914233786a5 100644
> > > > --- a/lib/igt_fb.c
> > > > +++ b/lib/igt_fb.c
> > > > @@ -1384,6 +1384,24 @@ struct fb_convert_blit_upload {
> > > >  	struct fb_blit_linear linear;
> > > >  };
> > > > =20
> > > > +struct fb_convert_buf {
> > > > +	void			*ptr;
> > > > +	unsigned int		stride;
> > > > +	unsigned int		size;
> > > > +	uint32_t		fmt;
> > > > +	enum igt_color_encoding	color_encoding;
> > > > +	enum igt_color_range	color_range;
> > > > +	uint32_t		offsets[4];
> > > > +};
> > >=20
> > > I wonder if we can just use igt_fb for that instead of duplicating mo=
st
> > > of it?
> >=20
> > After looking into it again, now I remember why I didn't do what you
> > suggested. In the case where you are in the YUYV path, with a "shadow"
> > buffer being used to perform the cairo operations on top of an YUV
> > buffer, you end up with conversions in create_cairo_surface__convert
> > and destroy_cairo_surface__convert, getting a fb_convert_blit_upload
> > structure as an argument.
> >=20
> > That structure however is used to convert one buffer to the shadow
> > buffer, or the other way around at destroy time. However, a single
> > igt_fb is allocated for that structure, which makes it impossible to
> > assign the second fb in that particular case. All the informations
> > needed to perform the conversion are stored in multiple structures
> > (fb_convert_blit_upload.linear, fb_convert_blit_upload.blit, and the
> > actual igt_fb instance) that we need to aggregate to find the correct
> > conversion parameters.
>=20
> The patch series I mentioned before [1] changes fb_blit_linear to inherit
> from igt_fb. So presumably that should help?
>=20
> [1] https://patchwork.freedesktop.org/series/46876/

Yeah, except that the shadow buffer would still not have a backing
igt_fb, and we would need to assume that all the parameters for that
buffer are the same than for the source, including the offsets and
stride. This looks a bit fragile.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ehay3geq7whhfftg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluRIkwACgkQ0rTAlCFN
r3RPJhAAluhDtjc95eMltsD4YuZb1uoC4Qd5/3XY6jUMyr3Mc/l73/gJL2PEmsdI
uaypRvSM5gcaaZdCXqjQMzIjtsq/CJUwB2Q9tvlsnwqAnz5RjPqfC6BE/7jFe2IA
kiiiB88YUrad9TqoMckf612w3TcuSyiSbsS0QwWUmL6prmPrlsFI/jhFd+gL8POd
T68ACkc/AXdeQmu2Zj0ZPYz22AEigADqRzRr6PTtRzeKrdp5LIdG6hzzQC5l+nOy
w+VItitWJEwtoUQd+CwdeziRfRWYRk/R57zcr/Evx8dfbOYxQ8ahAKrs/aPAWHN8
pG3hYFyNAyUx3nI358V+TTNQlmptPnOqo60PSyWg7y+jzmwY3l22QpRD/+udeIny
842aqF8bga0VMyj//NyBDdxZyMsezn7cwvok6gM/gITBv4hC1GvtmkjHvtCSxKjv
r+Ucr/KwN7Xh88HTth5QHKgFyPBX+a5dSQVaOmSfyiIGY+5/VrVLQiTWH21gNoj3
2YX00ZaU9KYwNB/iJMIsxKIARdzMvbEt8dfh9HQVofl3kAKkruvGT/Rhv0hHsyus
CU35rTntmGuGAM5GfZS4rI3Wxc6kWLedrcV/foZu0wJYtYWnjwlzm35qrqIvBkAb
IZ5e2IUzoU2t2krKeSRm3Bg3rlKW9cUMElhSANE0Vma/mCdxFY0=
=EDeI
-----END PGP SIGNATURE-----

--ehay3geq7whhfftg--

--===============1978364749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1978364749==--
