Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FC93880B0
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:21:43 +0000 (UTC)
Date: Fri, 25 Jan 2019 15:21:32 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190125142132.lsesk7hetbrp2yt5@flea>
References: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
 <20190125140623.10801-13-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190125140623.10801-13-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 12/21] lib/igt_fb: Support converting
 to VC4 modifiers in igt_fb_convert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1736676286=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1736676286==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ayook3ckwe2rphdl"
Content-Disposition: inline


--ayook3ckwe2rphdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 03:06:14PM +0100, Paul Kocialkowski wrote:
> This pipes-in support for the VC4 modifiers that we have conversion
> helpers for. A new temporary linear framebuffer is introduced, that
> is either freed later or copied to the destination framebuffer
> pointer.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ayook3ckwe2rphdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEsbbAAKCRDj7w1vZxhR
xc4eAQDNkyw2GL/ZHHOKvGw52RxeVe6D8FrQAOQuiseT/+fqPgEAtoq/wNSk02X+
2VF16pyG+x3g83kF+OAYk67XeBA1ZQ8=
=VenF
-----END PGP SIGNATURE-----

--ayook3ckwe2rphdl--

--===============1736676286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1736676286==--
