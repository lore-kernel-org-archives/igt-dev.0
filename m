Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id A20826F383
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 09:03:22 +0000 (UTC)
Date: Fri, 14 Dec 2018 10:03:21 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181214090321.pyoyjeozuacjkt5h@flea>
References: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
 <20181213155533.18048-7-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181213155533.18048-7-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 06/12] lib/igt_fb: Add support for
 allocating T-tiled VC4 buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1453098583=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1453098583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlsxxopujl5bdmlb"
Content-Disposition: inline


--rlsxxopujl5bdmlb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 04:55:27PM +0100, Paul Kocialkowski wrote:
> This introduces the required bits for allocating buffers with a T-tiled
> disposition, that is specific to the VC4. It includes calculating the
> top-tile width and creating a buffer object with the VC4-specific
> helper. The tiling flag is set to the buffer object so that this can
> be reused for GPU tests if needed later.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rlsxxopujl5bdmlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBNx2QAKCRDj7w1vZxhR
xWT6AQCMujtDhPYk6mit6MV8MzQJ/wkFWew8t0av5hT5uLl1sQD/Ya3YCLrKHxYx
D82EWWN9O4toVYE/eaY1Xwt7uw9emgQ=
=DmN7
-----END PGP SIGNATURE-----

--rlsxxopujl5bdmlb--

--===============1453098583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1453098583==--
