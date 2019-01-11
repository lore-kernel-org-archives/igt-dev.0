Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 001DE6F762
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:19:43 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:19:42 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111151942.xs2klli5czk3zrqe@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-20-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-20-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 19/21] lib/igt_chamelium: Hook-in
 checkerboard comparison method in helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2117802606=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============2117802606==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h7eate5hctfoysok"
Content-Disposition: inline


--h7eate5hctfoysok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:30AM +0100, Paul Kocialkowski wrote:
> This introduces the checkerboard chamelium checking type and hooks the
> call to the associated igt_frame matching helper in the frame match
> chamelium helper.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--h7eate5hctfoysok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDi0DgAKCRDj7w1vZxhR
xWxDAQDS8t8u7OyNjIUkO3Izxead/8U0TYwdZJPa+CHrqOAz6wEAg8820NRdTlDy
XsrSbMUcQrZ+XAekUSFHJIFoDh/JIgM=
=hutc
-----END PGP SIGNATURE-----

--h7eate5hctfoysok--

--===============2117802606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2117802606==--
