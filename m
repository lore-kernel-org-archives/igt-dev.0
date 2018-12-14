Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A7D86F37B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 08:58:37 +0000 (UTC)
Date: Fri, 14 Dec 2018 09:58:25 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181214085825.26lahqk7rzlnc4vu@flea>
References: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
 <20181213155533.18048-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181213155533.18048-2-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 01/12] chamelium: Pass dimensions
 instead of mode to pattern generation helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1087290846=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1087290846==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7vo6c6b7gfvffejw"
Content-Disposition: inline


--7vo6c6b7gfvffejw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 04:55:22PM +0100, Paul Kocialkowski wrote:
> In order to reuse the pattern generation helper for overlay planes,
> let's provide the pattern generation helper with the explicit dimensions
> instead of the mode (that only applies to the primary plane).
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7vo6c6b7gfvffejw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBNwsQAKCRDj7w1vZxhR
xYmvAQDKhnGl3bHEiVryj0VlszSs9xclBb7mKzzngWTY7zpx6QD9E/A2ZCEiapgq
Rm77CyBHx7UuZ9XRwIr64WRuJTDMoAA=
=4+e9
-----END PGP SIGNATURE-----

--7vo6c6b7gfvffejw--

--===============1087290846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1087290846==--
