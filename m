Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2968D6E0A4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Sep 2018 07:33:37 +0000 (UTC)
Date: Thu, 13 Sep 2018 09:33:36 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180913073335.juz6aqai4xgnod3f@flea>
References: <20180911142923.20314-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20180911142923.20314-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_fb: Don't use blitter for
 large buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0124042229=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0124042229==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rrrw7ddjyzxfybf3"
Content-Disposition: inline


--rrrw7ddjyzxfybf3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2018 at 05:29:23PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> The blitter stride is limited to <32k. Fall back to gtt mmap if we're
> about to exceed that.
>=20
> This won't work for Yf as the fence doesn't know about Yf. So for that
> case we'd need to use cpu mmap and (de)tile manually. For now just
> pretend that there is no problem.
>=20
> v2: Throw in some warnings for gtt mmap vs. yf tiling (Chris)
>=20
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> #v1

If we (still?) aim at running igt on anything else than intel
hardware, shouldn't we remove i915-specific code from the generic
code, instead of having more of those creeping in?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rrrw7ddjyzxfybf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluaEs8ACgkQ0rTAlCFN
r3Tt+Q/+MpU/lLkzoaYRV3n5VbPZSFEbBvHm2eJVfpbipViNE3zKtUT17syvmY6K
kIpDMXD7ky2GX4bIIojVbOlRE/8Apk23RSGTaTj646Zv+PRy0eKjz9p6hg8rdTJx
n8UMK1dvufRua5jWB7OqfnksCin12LGe1qG7sIlWMabjlBs3V2wDTfQq8nJLA+dF
l8QlJdcxMR6rDOVyUpePOmu9CBUNKrP+PPz0wX017WXxb1nYCz2mAhptcM76dhxn
wjlEZTv7I1MAs9Sk3zQ59DeUNDOAX9CcT6+WCoeB3aj2qUCctBkZHLbLX4pzupnc
eEN+K/FEXuLoceAv1APkiOTeJh935d9n6t7e5mGktzCEGMZowhbcxRIiFxIGAkQj
JEDF/wEcTM9CIBBZR070xiCQHLhS+xYqGc4nkAu2/UutcI1WJZVkWaOLZ1OnU7Yv
IOmOXpZitQH1jpzIYGAhBdIsxZpFVKg8Tno53xhldE/aYdL7y9gtltKF6v7uFNrT
qc+DuxsgewCkKykZsHqPhBXIadxdCYiO4nwCLaDra6+tVTIcXPd7SjOwXPvTs1Av
P9c4gH2DyaF6AUU/+Qt4wKp8vsazdeTaGBscATQ9DanKOPM9J4PLIfk5hN6JNVuw
eaztU2IkwA8GzfrExtIN+fmHeNRN/l+fft2uVbTFbT6ISQY43lc=
=D5pN
-----END PGP SIGNATURE-----

--rrrw7ddjyzxfybf3--

--===============0124042229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0124042229==--
