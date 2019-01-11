Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B532D6F762
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:20:04 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:20:03 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111152003.ks76fvw5mt7k7kmg@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-21-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-21-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 20/21] chamelium: Move the YUV tests
 over to the checkerboard checking method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1540443653=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1540443653==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7moob4d2nogo5axe"
Content-Disposition: inline


--7moob4d2nogo5axe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:31AM +0100, Paul Kocialkowski wrote:
> Now that the checkerboard frame checking method is available through
> the frame match helper, make use of it in YUV tests to increase the
> reliability of the results.
>=20
> The analog test tends to provide false positives, which are properly
> detected by the checkerboard method in most instances.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7moob4d2nogo5axe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDi0IwAKCRDj7w1vZxhR
xSbuAQDfOlrUbmT0+N5dDFv+nnwlJ4Ns/6OKIxkqB6mLMJ6WEwD7BQAH8ohhENtg
GNSkAnhia8A4tEvOB4Wn18IW59pP+wU=
=Asnz
-----END PGP SIGNATURE-----

--7moob4d2nogo5axe--

--===============1540443653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1540443653==--
