Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 784A46F75D
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:11:24 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:11:23 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111151123.hsinhaxogq76rn7r@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-11-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-11-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 10/21] lib/igt_vc4: Add helper for
 checking T-tiling support on plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1802202359=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1802202359==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jkoiksokujzytzhe"
Content-Disposition: inline


--jkoiksokujzytzhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:21AM +0100, Paul Kocialkowski wrote:
> This introduces a convenience helper for checking whether a plane
> supports T-tiling for a given format.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jkoiksokujzytzhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDiyGwAKCRDj7w1vZxhR
xRW1AP4wQb9w6F7NSWoZYkWIKKg9SR2dPdjXAsuda2SyJS3TpQEA7lj9BtXR9XzJ
TVDoXiFUkT5k2mqKtErAsmw29ZZ8kQo=
=jd7J
-----END PGP SIGNATURE-----

--jkoiksokujzytzhe--

--===============1802202359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1802202359==--
