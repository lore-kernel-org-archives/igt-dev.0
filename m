Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14B6E6F2
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Feb 2019 13:42:14 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 606B33A5433
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Feb 2019 14:31:04 +0100 (CET)
Date: Tue, 5 Feb 2019 14:30:41 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190205133041.2joloaleyogbqn3l@flea>
References: <20190205132205.20330-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190205132205.20330-1-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: Fix merge of preliminary
 patches for clearing YUV
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1490736702=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1490736702==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="htsjbch5vhxwaaih"
Content-Disposition: inline


--htsjbch5vhxwaaih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 02:22:05PM +0100, Paul Kocialkowski wrote:
> Preliminary patches for the YUV testing series were broken without
> subsequent patches that fix them when moving things around.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--htsjbch5vhxwaaih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFmQAQAKCRDj7w1vZxhR
xVdKAP4m8Ay96TqbjRdYH1HiVTRO/N61h/2LldeQ0sIUOglahwEAjTgVkx5W+B+u
KqI7e++wj36v/VmBqrf7DTac4em1tAY=
=h/3W
-----END PGP SIGNATURE-----

--htsjbch5vhxwaaih--

--===============1490736702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1490736702==--
