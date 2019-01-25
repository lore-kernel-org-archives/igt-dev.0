Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F3C86E035
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:17:58 +0000 (UTC)
Date: Fri, 25 Jan 2019 15:17:56 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190125141756.omkv4m3z3qxpvtsy@flea>
References: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
 <20190125140623.10801-5-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190125140623.10801-5-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 04/21] lib/igt_fb: Add support for
 VC4 SAND tiling modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0577970142=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0577970142==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l3ifjoosqqppbdtw"
Content-Disposition: inline


--l3ifjoosqqppbdtw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 03:06:06PM +0100, Paul Kocialkowski wrote:
> This introduces support for the VC4 SAND tiling modes, that take a
> specific parameter indicating their column height. This parameter acts
> as a height-based stride equivalent, that shall be equal or greater
> than the displayed height.
>=20
> The parameter is extracted and returned as tile height so that enough
> memory can be reserved for column heights containing extra padding.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--l3ifjoosqqppbdtw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEsalAAKCRDj7w1vZxhR
xduNAP9gVdF1kr/AykaI3PiM6etqaJWqx0hUCgF6jB0L4PzM5QD8DeEWc3WHakMg
LrDzr3/3gFSynogX4kGqzOTg7rplbgU=
=fsjw
-----END PGP SIGNATURE-----

--l3ifjoosqqppbdtw--

--===============0577970142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0577970142==--
