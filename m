Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B82A96E035
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:19:02 +0000 (UTC)
Date: Fri, 25 Jan 2019 15:19:01 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190125141901.6pfqq4farjzumiaj@flea>
References: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
 <20190125140623.10801-10-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190125140623.10801-10-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 09/21] lib/igt_vc4: Add helpers for
 converting linear to T-tiled RGB buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1004441192=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1004441192==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ess3ezvjlbarsn6t"
Content-Disposition: inline


--ess3ezvjlbarsn6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 03:06:11PM +0100, Paul Kocialkowski wrote:
> In order to integrate testing of T-tiled buffers, the easiest path is to
> generate patterns (with the already-existing functions) in linear
> buffers and convert them to T-tiled subsequently.
>=20
> Add helpers to do that conversion, with a first helper that returns the
> memory offset for a given position in a T-tiled buffer and a second
> helper that uses it for converting between framebuffers.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ess3ezvjlbarsn6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEsa1QAKCRDj7w1vZxhR
xYd/AQCx0dxbyFKbZmiPfvpuWbJpSwYAKs49TVBZFU62xIdNqwEA9Wo+IKrkzOCr
7JTzIDr+GXU7NcX1Pf+RE6XXRDjKjAk=
=hMf8
-----END PGP SIGNATURE-----

--ess3ezvjlbarsn6t--

--===============1004441192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1004441192==--
