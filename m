Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59B846E135
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Sep 2018 07:49:54 +0000 (UTC)
Date: Tue, 25 Sep 2018 09:49:43 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180925074943.6m4xkhlcfjcqpsky@flea>
References: <cover.cafc7aee9c887562e8432741cd1f0543ff92121a.1536655647.git-series.maxime.ripard@bootlin.com>
 <3f677ca0606f209a771884169d5fb157e52d4c89.1536655647.git-series.maxime.ripard@bootlin.com>
 <20180919131422.GF5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180919131422.GF5565@intel.com>
Subject: Re: [igt-dev] [PATCH v7 09/14] fb: Add more formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0331110214=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0331110214==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m4cu6dawc5slts3u"
Content-Disposition: inline


--m4cu6dawc5slts3u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2018 at 04:14:22PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Sep 11, 2018 at 10:47:36AM +0200, Maxime Ripard wrote:
> > We're going to need some DRM formats, and we're going to need the igt_fb
> > code to handle them. Since it relies on the format_desc structure to map
> > the DRM fourcc to the pixman and cairo formats, we need to add these new
> > formats to that structure.
> >=20
> > Reviewed-by: Eric Anholt <eric@anholt.net>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 35 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index f83ad0d2679c..425f98e23380 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -72,16 +72,46 @@ static struct format_desc_struct {
> >  	int num_planes;
> >  	int plane_bpp[4];
> >  } format_desc[] =3D {
> > +	{ .name =3D "ARGB1555", .depth =3D 16, .drm_id =3D DRM_FORMAT_ARGB155=
5,
> > +	  .cairo_id =3D CAIRO_FORMAT_INVALID,
> > +	  .pixman_id =3D PIXMAN_a1r5g5b5,
> > +	  .num_planes =3D 1, .plane_bpp =3D { 16, },
> > +	},
> > +	{ .name =3D "XRGB1555", .depth =3D 15, .drm_id =3D DRM_FORMAT_XRGB155=
5,
> > +	  .cairo_id =3D CAIRO_FORMAT_INVALID,
> > +	  .pixman_id =3D PIXMAN_x1r5g5b5,
> > +	  .num_planes =3D 1, .plane_bpp =3D { 16, },
> > +	},
>=20
> I think this is going to mess up the depth->format behaviour that
> bunch of tests expect. So nak on adding .depth to these.

What is your suggestion then?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--m4cu6dawc5slts3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlup6JYACgkQ0rTAlCFN
r3SrkQ//cDJZI6EOBOOGDt8WktUg9ewLr7FvoWcJgFnq55CE9IVCnrZYPpmfw1jf
WWW+PZSHhhycQ0nU3RT1U3+pgQteibfyoHPeO5Jr4LROHE2SddDge1Dgo1cl3ZaP
6q/eFvDTZaUhZcYeRQEFOqhKZfSzLbWxb+rpZ2Dco3cg+WT+XDisaPDoK8QvYqrT
TCWeUJ+Ldg4ZrqBvVNrfXQvvnrhJrMdNYgeC3RUmMCrdOg7TK9q4D5iWv9ZjrMO0
D9RfoxI6mrf5GwbB/KKuGUAJ7oZGsIvzX6CSCp3zXsh0QNkqLsPz5rmKp2H+qQYL
LjjgL4pjsX7nIkwHZMGUzuuP+ZIk+fovFeC7QwPKrBEEoJJJgytc2bOKBi0VJ/TT
5xEw9fxJ8aGM55YAOYC5H5MR8BtW5i3kMyob/0uafuQWTioVa1J1OJCaD7/c6Wd9
Y/XROHgNMJWi79SUJBIFImQyQ6FGt0a1snT4Q9BTypm4Wrdl5OFvJNKCilqCay8m
b24GZ5yAn7SAO/umCuyBYDPEho1f6W1uwuMGzvTrsttNbCaY5vpKIoiSeTjezZ+2
t4ql0RcPrbto7cbz8CSVlpiDoH8UioDsixMW/d0Y4CXH70CEYQI8hg2I4iVLFgT5
/Qs1YVMBzHdtW2bInRkQkm0kY/5+aCZHOJgg57I1ep41R5gIX2Y=
=QoXC
-----END PGP SIGNATURE-----

--m4cu6dawc5slts3u--

--===============0331110214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0331110214==--
