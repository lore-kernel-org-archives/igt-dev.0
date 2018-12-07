Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F9946E6F6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Dec 2018 09:13:01 +0000 (UTC)
Date: Fri, 7 Dec 2018 10:12:50 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181207091250.bj2ugmaih5wkn3gp@flea>
References: <20181207090146.4686-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181207090146.4686-1-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: Add a check on stride
 alignment for pixman conversion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0451080596=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0451080596==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mkkpcav73blt75wb"
Content-Disposition: inline


--mkkpcav73blt75wb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, 2018 at 10:01:46AM +0100, Paul Kocialkowski wrote:
> Pixman requires buffer strides the be aligned to 32-bit words in order
> to create internal representations of buffers. If this condition is not
> met, it will fail and IGT will not be able to report the error cause,
> making it hard to debug the issue.
>=20
> Add an explicit check in our code prior to calling pixman when
> converting buffer so that the error can be understood if it occurs.

Missing SoB.

Otherwise,
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mkkpcav73blt75wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAo5kgAKCRDj7w1vZxhR
xfUpAP0RsojSuk6AZGrNreKywXXIQLXinnowtS05Q7xvLm4m4AD+OjZH4tqe1Jva
1GsIlUS4V7jeh5zuVpXeo81lgIZzYgM=
=3w7C
-----END PGP SIGNATURE-----

--mkkpcav73blt75wb--

--===============0451080596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0451080596==--
