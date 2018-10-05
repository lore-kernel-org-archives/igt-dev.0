Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id E35A26E846
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Oct 2018 15:24:00 +0000 (UTC)
Date: Fri, 5 Oct 2018 17:23:59 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181005152359.aykjqgwc2zcvcwjk@flea>
References: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
 <ad6325825b4e0c497c3e442e334bc6271db373f7.1538656497.git-series.maxime.ripard@bootlin.com>
 <20181005114203.4ovcbrql3yountf2@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <20181005114203.4ovcbrql3yountf2@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH v8 08/16] igt: Make pixman mandatory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0417978971=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0417978971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eivwmvmq2aaptocv"
Content-Disposition: inline


--eivwmvmq2aaptocv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 05, 2018 at 02:42:03PM +0300, Arkadiusz Hiler wrote:
> On Thu, Oct 04, 2018 at 02:39:01PM +0200, Maxime Ripard wrote:
> > So far, pixman was used exclusively when the Chamelium support was enab=
led.
> >=20
> > However, since we're going to use it as one of the backend to do the
> > igt_fb conversions between formats, we'll need it all the time. Make
> > that explicit.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  README      |  2 +-
> >  meson.build |  9 +++------
> >  2 files changed, 4 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/README b/README
> > index f8ba5c710e81..78d14060dccd 100644
> > --- a/README
> > +++ b/README
> > @@ -145,6 +145,7 @@ the default configuration (package names may vary):
> >  	libcairo2-dev
> >  	libdrm-dev
> >  	libkmod-dev
> > +	libpixman-1-dev
> >  	libpciaccess-dev
> >  	libprocps-dev
> >  	libunwind-dev
> > @@ -157,7 +158,6 @@ The following dependencies are required for buildin=
g chamelium support
> >  (package names may vary):
> > =20
> >  	libxmlrpc-core-c3-dev
> > -	libpixman-1-dev
> >  	libudev-dev
> >  	libglib2.0-dev
> >  	libgsl-dev
> > diff --git a/meson.build b/meson.build
> > index faf1b764d69d..eff35585f619 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -105,6 +105,7 @@ libprocps =3D dependency('libprocps', required : tr=
ue)
> >  libunwind =3D dependency('libunwind', required : true)
> >  libdw =3D dependency('libdw', required : true)
> >  ssl =3D dependency('openssl', required : true)
> > +pixman =3D dependency('pixman-1', required : true)
> > =20
> >  valgrind =3D null_dep
> >  valgrindinfo =3D 'No'
> > @@ -123,16 +124,12 @@ glib =3D dependency('glib-2.0', required : true)
> > =20
> >  gsl =3D null_dep
> >  alsa =3D null_dep
> > -pixman =3D null_dep
> >  if _build_audio or _build_chamelium
> >  	gsl =3D dependency('gsl', required : _audio_required or _chamelium_re=
quired)
> >  endif
> >  if _build_audio
> >  	alsa =3D dependency('alsa', required : _audio_required)
> >  endif
> > -if _build_chamelium
> > -	pixman =3D dependency('pixman-1', required : _chamelium_required)
> > -endif
> > =20
> >  audioinfo =3D 'No'
> >  if _build_audio and alsa.found() and gsl.found()
> > @@ -164,8 +161,8 @@ endif
> > =20
> >  chamelium =3D null_dep
> >  chameliuminfo =3D 'No'
> > -if _build_chamelium and pixman.found() and gsl.found() and xmlrpc.foun=
d() and xmlrpc_util.found() and xmlrpc_client.found()
> > -	chamelium =3D declare_dependency(dependencies : [ pixman, xmlrpc,
> > +if _build_chamelium and gsl.found() and xmlrpc.found() and xmlrpc_util=
=2Efound() and xmlrpc_client.found()
> > +	chamelium =3D declare_dependency(dependencies : [ xmlrpc,
> >  							xmlrpc_util, xmlrpc_client])
> >  	config.set('HAVE_CHAMELIUM', 1)
> >  	chameliuminfo =3D 'Yes'
> > --=20
> > git-series 0.9.1
>=20
>=20
> Squash this in:
>=20
> diff --git a/configure.ac b/configure.ac
> index c75ef284..b80e905e 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -183,6 +183,7 @@ PKG_CHECK_MODULES(XRANDR, xrandr >=3D 1.3, AC_DEFINE(=
HAVE_XRANDR, 1, [Have libXran
>  PKG_CHECK_MODULES(CAIRO, [cairo >=3D 1.12.0])
>  PKG_CHECK_MODULES(LIBUDEV, [libudev])
>  PKG_CHECK_MODULES(GLIB, [glib-2.0])
> +PKG_CHECK_MODULES(PIXMAN, [pixman-1])
>  PKG_CHECK_MODULES(GSL, [gsl], [gsl=3Dyes], [gsl=3Dno])
>  AM_CONDITIONAL(HAVE_GSL, [test "x$gsl" =3D xyes])
> =20
> @@ -206,8 +207,6 @@ if test "x$enable_chamelium" =3D xyes; then
>  			AC_MSG_ERROR([Failed to find xmlrpc, required by chamelium.])
>  		fi
>  	fi
> -	PKG_CHECK_MODULES(PIXMAN, pixman-1, [],
> -			  [AC_MSG_ERROR([Failed to find pixman, required by chamelium.])])
>  	if test x"$gsl" !=3D xyes; then
>  		AC_MSG_ERROR([Failed to find gsl, required by chamelium.])
>  	fi
> diff --git a/lib/meson.build b/lib/meson.build
> index e60e5e02..7e2c9b7a 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -66,6 +66,7 @@ lib_deps =3D [
>  	math,
>  	realtime,
>  	ssl,
> +	pixman,
>  ]
> =20
>  if libdrm_intel.found()
> @@ -79,8 +80,8 @@ if valgrind.found()
>  	lib_deps +=3D valgrind
>  endif
> =20
> -if gsl.found() and pixman.found()
> -	lib_deps +=3D [ gsl, pixman ]
> +if gsl.found()
> +	lib_deps +=3D [ gsl ]
>  	lib_sources +=3D [ 'igt_frame.c', 'igt_audio.c' ]
>  endif

I will, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--eivwmvmq2aaptocv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu3gg4ACgkQ0rTAlCFN
r3ScsA/9GlBFedlGcW/lUsQqvw7wJYkg6gxJfv2CVQDHhm8rKZCPz7DHwgnlLGsA
olCzkszy57aiUAoDnzgB3YovyRsz2+Vzn0zyWNaWgPy0l6Mh2D0D1tbMoIWeYJ8d
GZzNXb1mXDjCX9DypsMdKxR2ykQQdTg3OUMEgUhIB7gwtP4S2R2j9v36EZVJ91HG
ddkaOaj+ZKEuhXyqCqX48hGILS96tjRXXzbN85vnvf/3SPYBEluESF4olwur1tz4
iqYHxWR6rttN8IGQz5WXRu2xA1osc8bZ81oEvI04CIESjlBV3pUNpjwwyYHd/9ZC
MgteMLjRavZGB2DPJvr+jccq9KvaieJbPLwN9rc6WuTbAuqts2Jkgf41pq1o1VnQ
jhuyt4asFrqQQIsWjxtDSZk2vx35pnyZS3kUYLKtpSR7iXygt9M6FQBoPZ5EQ9vJ
zw3dgY2xJrN2gWZhsDv9SoA1uOaUr523BtcnNRKfjqtxNOYzl9P+E56F0YoyFyrT
JR+kLvKszi6H0BxrKVJg3QAg8Ks2EZBY6ixIG8twsS5Q263jLH4I30qKAyRLdGcx
QjcDM3AzMgFhp5+xVOn+odAQTZhrcosKFlqNiSGkpoN12p0DbVY/641Mp6AaObfp
WNJD+BTXT9HzMsNimktY2Lmz88M9AYWpuGK56EHuDh274RZTiXQ=
=+1ee
-----END PGP SIGNATURE-----

--eivwmvmq2aaptocv--

--===============0417978971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0417978971==--
