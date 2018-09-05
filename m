Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01B9F8901E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 09:36:00 +0000 (UTC)
Date: Wed, 5 Sep 2018 11:35:49 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180905093549.2sv3ggjp5j6yiihz@flea>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
 <646c39734b6dde4b74f215b64f094cddc9e00ebe.1535721136.git-series.maxime.ripard@bootlin.com>
 <20180831134218.GZ5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180831134218.GZ5565@intel.com>
Subject: Re: [igt-dev] [PATCH v6 05/13] fb: Fix ARGB8888 color depth
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1423868222=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1423868222==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iwfp76pxiuckfu5y"
Content-Disposition: inline


--iwfp76pxiuckfu5y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 04:42:18PM +0300, Ville Syrj=E4l=E4 wrote:
> On Fri, Aug 31, 2018 at 03:12:14PM +0200, Maxime Ripard wrote:
> > The ARGB8888 has been listed as having a 32 bits depth, while it actual=
ly
> > is a 24 bits format. Fix this.
>=20
> I think 32 is the more usual definition for this.

Isn't color depth about the color itself? I guess alpha wouldn't apply
in this case.

In the same format list:
  - RGB565 has a depth of 16
  - XRGB8888 has a depth of 24
  - XRGB2101010 has a depth of 30
  - ARGB8888 has a depth of 32

Which seems to indicate that the list indeed meant that the color
depth is about the color, and that ARGB8888 is wrong.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--iwfp76pxiuckfu5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPo3QACgkQ0rTAlCFN
r3Q2XBAAmofkb1QTC2WJCkVRMiXxoBLr3lHzvzE1QTN5MPmVUFdSSZBR+DMhnDaT
k1k74SimU5YZoQ12vUNlxkL96leIxymKCaAIwVgAwki6yJNG9G+XZxEv77a53jpH
uUhOeXOZu8BDRiX6Uyni8M2BEcCCfrJj6GbfxkUyP4xkgdwoXfd76eVlxMGJwTf+
kMJRzZvgT732AJAW7fSoVfhiLA3avVdxzXgTTjS42ZeoHejRazyMrVBE3T5npQFV
zCEdR+oNYsOtoNsgK+Sdr0LVps2bsJu2AzN1IsVsls9oI9ve1MZN6xNbUYw4EwVj
lqhvFlmLcKW7i+txEV0Dh806jxbTtlVu3eSPrO58vk3xDUeAquIrvIFwBZHSvMn7
tw3B+4BJ9n29jSEN3cpk/OZ1hElQUEYtD3ziCpp8DeEhZuI2NgofTCrOYFqWmBLg
sbGBwlRM7YXKI/xidfDeSNPs3CgbxluJqkufVHKBurhYkaoE3wNcD62iWIhGKui7
pk0tsHDdKq6JVkQtHMeuEdVgveM3Fnwm5yT25aSZb/cPLaCwaHjqKgJSsdI5RY4y
EP98NyorS7vB/QB8mwLXtcDC3/qIeyCqTUmMkB8/3GDn4H1x5FIA3e9H75351Otu
nCkpFwBmd1CzX+TbOLSjgWpWAmdTxF0ZZT5DxMHqk39iKIjiPiA=
=Elfa
-----END PGP SIGNATURE-----

--iwfp76pxiuckfu5y--

--===============1423868222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1423868222==--
