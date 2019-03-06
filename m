Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 6 Mar 2019 18:40:27 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190306214027.bm2d4luyocawmbzj@smtp.gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
 <f721ca0d8367607136e076b1870c4cbcbecb8848.1551712108.git.rodrigosiqueiramelo@gmail.com>
 <7c52359d-89ba-d6a1-b812-7060d89ef42b@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <7c52359d-89ba-d6a1-b812-7060d89ef42b@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] kms_flip: Standardize return value
 for fb_is_bound
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1072085676=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1072085676==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ktexcuoiorrok35m"
Content-Disposition: inline


--ktexcuoiorrok35m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/06, Maarten Lankhorst wrote:
> Op 04-03-2019 om 16:32 schreef Rodrigo Siqueira:
> > The function fb_is_bound() mix integer value with booleans for handling
> > the return value. This commit standardizes the return value of
> > fb_is_bound() for using only booleans.
> >
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  tests/kms_flip.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > index de3ab600..abfdd363 100755
> > --- a/tests/kms_flip.c
> > +++ b/tests/kms_flip.c
> > @@ -947,8 +947,7 @@ static void paint_flip_mode(struct igt_fb *fb, bool=
 odd_frame)
> >  	igt_put_cairo_ctx(drm_fd, fb, cr);
> >  }
> > =20
> > -static int
> > -fb_is_bound(struct test_output *o, int fb)
> > +static bool fb_is_bound(struct test_output *o, int fb)
> >  {
> >  	int n;
> > =20
> > @@ -958,7 +957,7 @@ fb_is_bound(struct test_output *o, int fb)
> >  		};
> > =20
> >  		if (drmIoctl(drm_fd, DRM_IOCTL_MODE_GETCRTC, &mode))
> > -			return 0;
> > +			return false;
> > =20
> >  		if (!mode.mode_valid || mode.fb_id !=3D fb)
> >  			return false;
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
>=20
> Nice cleanup. Hope we can eventually convert kms_flip to igt_display at s=
ome point for readability.

Hi Petri and Maarten,

First of all, thanks for your review and the clarification in the patch
4 (I really missed the ret =3D 0, thanks for highlight this case :)

Maarten, could you give some extra details about the idea of converting
kms_flip to igt_display? Could you point out some links or code
reference? I'm just curious to know a little more about this subject.

Best Regards
Rodrigo Siqueira

> For all except patch 4:
>=20
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>=20
> :)
>


--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--ktexcuoiorrok35m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyAPkoACgkQWJzP/com
vP9BaQ/8DytratfA9Fv8bE3do7ZMbznzF4rRj2In2QgaBm+PhoiPQRx8OI+jPfQJ
njFMV/h4Num5S8xOPzNVWKqgTOkZQOEQJqoKsDWgk6jqTcbaGld2J9Lxp7/lDMOU
pXjCSoQVup/lF/FBeLiC9O/bHCHcqaB64DQ/05WS4rd+AMz2d9Y8z+I3iNc4QZHg
xfKm7goBf1qX6dqwtfmvKRjcTzicY4AWoSpivu0qA+J2q6CZ4CGhO5lU/xDB6r8W
jT3tiuh5oP6rM/f2EHmUK/WpQvrqkOTcH1vkTedHqhwNQfpH6t2dTTLGG89tADa8
FGAk56mKKirJGL1gYsOjx9+oK9vqQBlD9OSPUKjiXU82m2TCtmU15OqHU9sNxQRE
Q/ERI/XLD4qnQaCwUoQt/ChnEA0+Xd9WTIUlO+qH63oYPCWw5PtRZEnPvKZKLs5Q
CxEPKR4FEhFBrKuiqzSQ2M9pPMJd05luKGhBv5b02VkXyCch8mwsD9FDFZTH5PJO
6CP8ojPFA/d+sT26vdQS6A/bOQ01L82acILgivFwbpkivaV73pICOBYdYxoLiwTE
xsn7YessFDnNUgzSLckYeFxsFcZnUqgDvQzVhdxl+8dVZR5X61iy9+BURz4MviI+
7sMfCtafg6Pa8ScG5GuA49Nvj1gx9fGZ4Mnl/0O2B9MccjtL1Lw=
=whwh
-----END PGP SIGNATURE-----

--ktexcuoiorrok35m--

--===============1072085676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1072085676==--
