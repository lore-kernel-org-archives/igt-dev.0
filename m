Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id F03466E13F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Nov 2018 07:47:02 +0000 (UTC)
Date: Fri, 16 Nov 2018 08:46:51 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181116074651.iglr47vyqtdgzebv@flea>
References: <20181115165140.21947-1-paul.kocialkowski@bootlin.com>
 <20181115165140.21947-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181115165140.21947-2-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] chamelium: Pass and use stride for
 xr24 pattern paint
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1582376597=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1582376597==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aycclxfbbrccnhkn"
Content-Disposition: inline


--aycclxfbbrccnhkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2018 at 05:51:40PM +0100, Paul Kocialkowski wrote:
> Using the width from the selected mode is not sufficient to correctly
> paint a pattern on the framebuffer memory: the stride also has to be
> taken in account for proper line start alignment.
>=20
> Pass the stride and use it in chamelium_paint_xr24_pattern.

Both patches look fine, but your missing your SoB here.

With that fixed,

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--aycclxfbbrccnhkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+516wAKCRDj7w1vZxhR
xV2+AP90aGzIZX8RupVBJ1M31zIocUQv59xR/NtJ5nclBW2KRwEAzoLGVLE6b0ql
APJ+52c2tQIi8X5Hn+7nRuCF8ZDSsAw=
=MHcd
-----END PGP SIGNATURE-----

--aycclxfbbrccnhkn--

--===============1582376597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1582376597==--
