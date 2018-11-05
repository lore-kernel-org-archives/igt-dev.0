Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FA99891DA
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Nov 2018 15:19:40 +0000 (UTC)
Date: Mon, 5 Nov 2018 16:19:29 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181105151929.pefmgc7rltfygaif@flea>
References: <20181102190651.25969-4-ville.syrjala@linux.intel.com>
 <20181102193731.27330-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20181102193731.27330-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] lib/igt_fb: Generalize the slow
 read from gtt mmap handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0573777794=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0573777794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p7pw6ap7na2u5isv"
Content-Disposition: inline


--p7pw6ap7na2u5isv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 02, 2018 at 09:37:31PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Make the handling of slow gtt mmap reads generic, and extend it to
> the pixman converter. Makes the pixman path a bit faster.
>=20
> With testing just XRGB8888 and XBGR8888 on KBL:
> $ time kms_plane --r pixel-format-pipe-A-planes
> - real	0m18,757s
> + real	0m2,635s
>=20
> v2: Use the original src buffer if the malloc fails (Chris)
>     Drop the duplicated comment about things being slow
>=20
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

For the 4 patches,
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--p7pw6ap7na2u5isv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+BfgQAKCRDj7w1vZxhR
xcVrAQCBtPi5/+pI7fsHpYnGDzqZY1KRdKbL78ty2sqVHJQZhgEAwPdfU6EaseAH
GpDedDPKTzeIlwgiwStouBgGmzyRQwQ=
=4h2E
-----END PGP SIGNATURE-----

--p7pw6ap7na2u5isv--

--===============0573777794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0573777794==--
