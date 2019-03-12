Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F11989E1D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 14:18:36 +0000 (UTC)
Date: Tue, 12 Mar 2019 16:18:31 +0200
From: Marius Vlad <marius.vlad@collabora.com>
Message-ID: <20190312141831.GA11883@xpredator>
References: <20190216182959.8760-1-marius.vlad@collabora.com>
 <20190312134346.GC2665@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190312134346.GC2665@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Add zpos plane
 property.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0631571844=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, Marius Vlad <marius.vlad0@gmail.com>, p.zabel@pengutronix.de
List-ID: <igt-dev@lists.freedesktop.org>


--===============0631571844==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 02:43:46PM +0100, Daniel Vetter wrote:
> On Sat, Feb 16, 2019 at 08:29:58PM +0200, Marius Vlad wrote:
> > From: Marius Vlad <marius.vlad0@gmail.com>
> >=20
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>=20
> Since you already have a pile of igt patches merged, want commit rights?
> From a quick look you don't have access to the gitlab repo yet.
Sure! marius.vlad0 is my username on fdo gitlab.

Thanks!
>=20
> Cheers, Daniel
> > ---
> >  lib/igt_kms.c | 1 +
> >  lib/igt_kms.h | 1 +
> >  2 files changed, 2 insertions(+)
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 85a911e1..87fa5bff 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -177,6 +177,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLA=
NE_PROPS] =3D {
> >  	[IGT_PLANE_COLOR_RANGE] =3D "COLOR_RANGE",
> >  	[IGT_PLANE_PIXEL_BLEND_MODE] =3D "pixel blend mode",
> >  	[IGT_PLANE_ALPHA] =3D "alpha",
> > +	[IGT_PLANE_ZPOS] =3D "zpos",
> >  };
> > =20
> >  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D {
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 679d4e84..227fa020 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -272,6 +272,7 @@ enum igt_atomic_plane_properties {
> >         IGT_PLANE_COLOR_RANGE,
> >         IGT_PLANE_PIXEL_BLEND_MODE,
> >         IGT_PLANE_ALPHA,
> > +       IGT_PLANE_ZPOS,
> >         IGT_NUM_PLANE_PROPS
> >  };
> > =20
> > --=20
> > 2.19.2
> >=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAlyHv7QACgkQ9jQS5glH
1u+Blw//SLs2VoQnS5zNNBNruGpsxKZVU1BOsFo1msBoQfesR6lZi3DzITrgZdES
Whq5bbIWb3c23Pk9KkSTm6cRfJSXE1CTlyDZZ+RO0yzGEdncx9G85fbILdDUlTIB
8GUwOzrD0Yncal8e/MHX5nW816GlQowOEyDPb/lmqiIG9LOPiVzwWC8KzTMLyIm7
Kzz2LHsRHroKC93wyJpMrfTlXxES02/1J3HODaEfkEAqXpE1vwdUDC/n/P249vGg
mmo47l9F4gseuOhAdFaslPzYC0Z/1qmKmgGIvEvC3fI8F0nNLLH8Ja1MrTWw5wbY
pltsR1KwfNRMoTTemrjLO8P17lXWETnskeTYmzxKb+IXCjjIXMlXyVO88FOEf9r5
/Yljvcjb+3FXR3dKmBawH6j9I/4n0umnQVNfZvRUBTbZTaik/9Yg6XVrcS8PnIFy
f/ZlePx+BYP3wsivXov5IMJtnLcLR2ueYe/oiHQLHOQbCcoIjNl/SpIZj104bRpr
q6M4wk2dhfqgzJUascpz3ZEIDPkkqIH+YVX0zpzwXBLCeHv+xNaSliymmrulUazs
KQv6u5GS04Acsq4SinRusYEuc7Bt4ANjhf7+ix8Zv3BJYFvXtst5NtIITjv5X5zn
OlZqFojlqBvzbENtoq0cYuQIPA2jVGDWYv+rCGLtDbgmgMlYqP8=
=0kFz
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

--===============0631571844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0631571844==--
