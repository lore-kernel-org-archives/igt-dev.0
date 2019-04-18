Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Apr 2019 14:05:18 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190418170518.fsjtvduqvvxrxewg@smtp.gmail.com>
References: <20190418140149.rne4jbrpmijrtv3q@smtp.gmail.com>
 <155560190887.7644.3682179601045366401@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <155560190887.7644.3682179601045366401@skylake-alporthouse-com>
Subject: Re: [igt-dev] [RESEND PATCH v6 i-g-t] tests/kms_flip: Skip VBlank
 tests in modules without VBlank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2094630089=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============2094630089==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldcnoyswjv5a6kjl"
Content-Disposition: inline


--ldcnoyswjv5a6kjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/18, Chris Wilson wrote:
> Quoting Rodrigo Siqueira (2019-04-18 15:01:49)
> > +bool kms_has_vblank(int fd)
> > +{
> > +       drmVBlank dummy_vbl;
> > +
> > +       memset(&dummy_vbl, 0, sizeof(drmVBlank));
> > +       dummy_vbl.request.type =3D DRM_VBLANK_RELATIVE;
> > +
> > +       drmWaitVBlank(fd, &dummy_vbl);
> > +       return (errno !=3D EOPNOTSUPP);
>=20
> errno is only set on error. It is conceivably that drmWaitVBlank()
> suceeed but errno is still set to EOPNOTSUPP from an earlier syscall.
> -Chris

Nice catch!

Before I send a V7, how about this fix:

bool kms_has_vblank(int fd)
{
  ...
  errno =3D 0;
  drmWaitVBlank(fd, &dummy_vbl);
  return (errno !=3D EOPNOTSUPP);
}

--
Rodrigo Siqueira
https://siqueira.tech

--ldcnoyswjv5a6kjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAly4rk4ACgkQWJzP/com
vP93lhAAjSkA95UuX1G3GOcvsfnvOsgE1sEgfaRuumebLP6j7l9frDGQipC+l6tc
ZcwUTrntsbGm2icHxK5nle4ha9+hRKla7YqSUp/IAzEfPo+A6N2Il+HSqbk3ZXqf
SpEbofMxQtQv/8vFz+9ebSplAAF+0i9qlQ5EhNSsov2zYmsZK1QGt8oK9uUJrioS
YfaytQH6F83WjbjcBcg330RDuRLUb+24g3XymLlEBHfdZvhbvWCrBD5cJ6dFva/I
s31elViscQ8LHaEHUrP5Rzz5mYFD8I64f/PYDyBpqcOb+n3d5EpaZl6BkHOK5nhF
1TgZJdcss483wIHEmRht2IbjZyBIL3Iigx2QOJ54q+oshO7sQDDuuhuPFrtnPTPO
rKTS0u2MzlOGAku2rxLd/SQtDECnJ6lro6C8/7zkl5rhh6yfodgG9pFUBM5xRL2o
tk7HNaPVPyPfNC9nokQXd+mAfyUA1j9n0TepFTCEvnBp5XSeFdEs8mPZM1S6u6bz
5fw2G+aTrWaQy2V6S64JvH+Atqi89h6wwc6w3wzl6mfX0JKwTZ8WJKD5NT6mhhSm
2vF0zqHKkTMxB0r+IPtEH704ZdIyXwIAtZWP+GxZKRtcKZYuEiksE1GsN8DM/kfO
SRq9gbJXLOSJgoj4ohWSbLA2Hc0x7sKYKrNGlY4dilj0vZhRUwA=
=7894
-----END PGP SIGNATURE-----

--ldcnoyswjv5a6kjl--

--===============2094630089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2094630089==--
