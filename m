Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7C4E6E035
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:18:27 +0000 (UTC)
Date: Fri, 25 Jan 2019 15:18:26 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190125141826.7kg3s7npmo3gu7lk@flea>
References: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
 <20190125140623.10801-9-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190125140623.10801-9-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 08/21] lib/igt_fb: Add a helper to
 fill-in the available DRM formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2061311008=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============2061311008==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o56kj5xsiduhulew"
Content-Disposition: inline


--o56kj5xsiduhulew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 03:06:10PM +0100, Paul Kocialkowski wrote:
> Introduce a helper to allocate and fill-in a list of available DRM
> formats, which is useful for picking one at random in tests.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--o56kj5xsiduhulew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEsasgAKCRDj7w1vZxhR
xRZkAQC63YLkysaIJDt17F9WRYjQG6RlfF3FsoWrLMmK02DyVQEAy3YWRGBoKEMf
by3gFhllsEkSB5tCd0oArIuGBuPTIAM=
=BAJk
-----END PGP SIGNATURE-----

--o56kj5xsiduhulew--

--===============2061311008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2061311008==--
