Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C78F6F37E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 09:00:33 +0000 (UTC)
Date: Fri, 14 Dec 2018 10:00:21 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181214090021.62grq75xvmply2tk@flea>
References: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
 <20181213155533.18048-4-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181213155533.18048-4-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 03/12] chamelium: Debug-print CRCs
 when comparing them and dumping frames
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0017135152=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0017135152==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gpna6bfhvejt5nqq"
Content-Disposition: inline


--gpna6bfhvejt5nqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 04:55:24PM +0100, Paul Kocialkowski wrote:
> Add debug prints for the reference and captured CRCs when comparing them
> and dumping them, which can be useful to get an idea of what is going on
> (e.g. specific noise on display cables often only changes one of the
> values that compose the CRC).
>=20
> It's also useful to associate a test debug output with the dumped
> pictures (that have the CRC in their name).
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--gpna6bfhvejt5nqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBNxJQAKCRDj7w1vZxhR
xcd7AP96PEGAI58mpiCUT16xqePL32XXwJyWZbrdbvYdtJ9D7gD/SyRD4knYRUFG
QGZfbZdvCz0a112I6AQytoV16llrPgA=
=3inh
-----END PGP SIGNATURE-----

--gpna6bfhvejt5nqq--

--===============0017135152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0017135152==--
