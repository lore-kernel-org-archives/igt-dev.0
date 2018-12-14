Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 250796F37C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 09:03:44 +0000 (UTC)
Date: Fri, 14 Dec 2018 10:03:42 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181214090342.skiyculqdw5do2eb@flea>
References: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
 <20181213155533.18048-8-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181213155533.18048-8-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 07/12] lib/igt_vc4: Add helpers for
 converting linear to T-tiled XRGB buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0150086611=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0150086611==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ivyj4wwvofev4jre"
Content-Disposition: inline


--ivyj4wwvofev4jre
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 04:55:28PM +0100, Paul Kocialkowski wrote:
> In order to integrate testing of T-tiled buffers, the easiest path is to
> generate patterns (with the already-existing functions) in linear
> buffers and convert them to T-tiled subsequently.
>=20
> Add helpers to do that conversion, with a first helper that returns the
> memory offset for a given position in a T-tiled buffer and a second
> helper that uses it for converting between framebuffers.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ivyj4wwvofev4jre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBNx7gAKCRDj7w1vZxhR
xVEdAQCEDDMdbQTHSZs+Lgwdi3hKTz96COJUDT5NGF5gYWbs3wD/Wixrnnt2Abh1
io86uxPz9Ji4wkLuQuMH8v28QcAS1A4=
=5qMS
-----END PGP SIGNATURE-----

--ivyj4wwvofev4jre--

--===============0150086611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0150086611==--
