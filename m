Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6691F6F75C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:10:32 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:10:31 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111151031.mle3bscqxrs32vny@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-6-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-6-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 05/21] lib/igt_fb: Allow interpreting
 the tile height as a stride equivalent
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0397848159=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0397848159==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4tle2twwc56vkal"
Content-Disposition: inline


--l4tle2twwc56vkal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:16AM +0100, Paul Kocialkowski wrote:
> The VC4 SAND tiling modes are disposed in columns that follow each
> other in memory. The column height defines the number of fixed-width
> lines from the beginning of one column to the other, which may be
> greater than the display height. In this case, the extra lines are
> used as padding and the column height becomes a height-based stride
> equivalent.
>=20
> Support this when calculating the plane size by using the tile height
> directly if it is greater than the plane height. This works better than
> alignment for non-power-of-two cases (no space is wasted) and it is
> equivalent to alignment for power-of-two tile heights.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--l4tle2twwc56vkal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDix5wAKCRDj7w1vZxhR
xWCAAP99eiOgmIaJxe5yeFgFuvfNKbSCTLoseGhOCIRSwuw90gD/WQDHESwKLk95
Xm13O3AJYE2usHJQ3pVFVqZYd/u5EQk=
=NAex
-----END PGP SIGNATURE-----

--l4tle2twwc56vkal--

--===============0397848159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0397848159==--
