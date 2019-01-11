Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA2606F7B5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:25:16 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:25:05 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111152505.wjwkirqcij455lvn@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-10-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-10-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 09/21] lib/igt_vc4: Add helpers for
 converting linear to T-tiled RGB buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1420771045=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1420771045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pkmq4kideewo7kgv"
Content-Disposition: inline


--pkmq4kideewo7kgv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:20AM +0100, Paul Kocialkowski wrote:
> In order to integrate testing of T-tiled buffers, the easiest path is to
> generate patterns (with the already-existing functions) in linear
> buffers and convert them to T-tiled subsequently.
>=20
> Add helpers to do that conversion, with a first helper that returns the
> memory offset for a given position in a T-tiled buffer and a second
> helper that uses it for converting between framebuffers.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

I'd really like to plug that in igt_convert. The modifiers are part of
of how an image is represented, so it should really be plugged in
igt_fb_convert, as a second step after the format conversion.

This also applies to your patch 11.

maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--pkmq4kideewo7kgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDi1UQAKCRDj7w1vZxhR
xS/fAQDT6tqEKd16Agzw91Pq/Z6/pkh+xKooAD6tezCAG9P2WwD8CfC6J1aOhfIK
xB1hBM22hf14PTzOXnqNRmIAjoZfVQU=
=xfhx
-----END PGP SIGNATURE-----

--pkmq4kideewo7kgv--

--===============1420771045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1420771045==--
