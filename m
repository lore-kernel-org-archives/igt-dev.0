Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADD089CD4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 09:39:34 +0000 (UTC)
Date: Tue, 26 Feb 2019 10:39:27 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190226093927.naj4jtpsbl7v3d2h@flea>
References: <20190226093044.32478-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190226093044.32478-1-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t] autotools: Always build VC4 helpers
 with the library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1156126137=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1156126137==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ffx7z2nqoue3gznw"
Content-Disposition: inline


--ffx7z2nqoue3gznw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 10:30:44AM +0100, Paul Kocialkowski wrote:
> With recent changes to the igt_fb code, VC4 support is now integrated
> in common helpers. As a result, VC4 helpers have to be built as part
> of the library.
>=20
> This is already the case with meson, but VC4 support was removed from
> autotools. Bring it back unconditionally to match meson behaviour.
>=20
> This fixes a build error with autotools.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ffx7z2nqoue3gznw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXHUJTwAKCRDj7w1vZxhR
xWv9AQCffB4J8aFrhscKNlODao2kjUHZdfBJMsZHe4TCt1scRgD+O9IyxlQQSGb7
RpKARyET/oDeFCcOeD2VW1tZa9x5eQw=
=26Qm
-----END PGP SIGNATURE-----

--ffx7z2nqoue3gznw--

--===============1156126137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1156126137==--
