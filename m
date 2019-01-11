Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 361C16F761
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:17:08 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:17:06 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111151706.o553w7acb7qjvq2s@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-18-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-18-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 17/21] lib/igt_chamelium: Generalize
 the frame match helper with check type
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0212571248=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0212571248==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ovvxyy5cvpo4s4ni"
Content-Disposition: inline


--ovvxyy5cvpo4s4ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:28AM +0100, Paul Kocialkowski wrote:
> In prevision of adding support for another type of frame matching,
> rename chamelium_assert_analog_frame_match_or_dump to drop the
> analog part and feed it the check type. This way, the bulk of the
> helper can apply to other frame matching types.
>=20
> This requires moving the chamelium_check enum from the test to the
> common chamelium header.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ovvxyy5cvpo4s4ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDizcgAKCRDj7w1vZxhR
xUMfAQDzOWrhydaokFdtq675L3B3SqdU+4bhTZ0m0Kez7je8QgD/TK2isB6iEodQ
JbNku8D45TlWI45UI+612fkPjTKiAgw=
=ZJry
-----END PGP SIGNATURE-----

--ovvxyy5cvpo4s4ni--

--===============0212571248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0212571248==--
