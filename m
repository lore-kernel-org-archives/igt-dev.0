Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B60746E5FE
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:22:26 +0000 (UTC)
Date: Fri, 25 Jan 2019 15:22:15 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190125142215.ghduy3i77t4gpmta@flea>
References: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
 <20190125140623.10801-19-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190125140623.10801-19-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 18/21] lib/igt_frame: Add a
 checkerboard frame comparison method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0383912885=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0383912885==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="43u3tybff7brc6ip"
Content-Disposition: inline


--43u3tybff7brc6ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 03:06:20PM +0100, Paul Kocialkowski wrote:
> This introduces a new frame comparison method that was designed for
> patterns that follow a checkerboard style. These patterns are made of
> consecutive rectangular shapes with alternating solid colors. They are
> currently used for some Chamelium-based tests.
>=20
> The method is particularly adapted for cases where the edges of the
> shapes might be blurred (e.g. due to scaling), which makes it impossible
> to use pixel-perfect or CRC-based comparisons to decide whether the
> captured frame matches the reference.
>=20
> Overall, this test will first detect the edges of the pattern and later
> exclude them from comparison. Colors are compared between the reference
> and capture with a low threshold for error. A percentage of the faulty
> pixels is calculated and the captured frame is considered invalid if
> more than one percent of the pixels are erroneous.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--43u3tybff7brc6ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEsblwAKCRDj7w1vZxhR
xV4+AP47/BsMz2ik1K33ZNijWWNVhzjNPCMCciVvYP7kgqKqcAD9FoRgMGPZAPUt
JRwYAr/VYYiZRb5lsz7VBv2wlH/IwwE=
=jjuu
-----END PGP SIGNATURE-----

--43u3tybff7brc6ip--

--===============0383912885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0383912885==--
