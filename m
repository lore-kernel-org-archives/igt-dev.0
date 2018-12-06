Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 322036E5F3
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Dec 2018 14:30:51 +0000 (UTC)
Date: Thu, 6 Dec 2018 15:30:40 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181206143040.hv33hrzcw2lxom3d@flea>
References: <20181206141132.23349-1-paul.kocialkowski@bootlin.com>
 <20181206141132.23349-5-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181206141132.23349-5-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/9] lib/igt_fb: Add checks on i915 for
 i915-specific tiled buffer allocation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0602539203=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0602539203==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lhj4vd2or46bhni7"
Content-Disposition: inline


--lhj4vd2or46bhni7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2018 at 03:11:27PM +0100, Paul Kocialkowski wrote:
> The code path for allocating tiled buffers has a few i915-specific bits
> without checks for the i915 driver. Add these missing checks.
>=20
> For the map_bo function, initially define the return pointer to
> MAP_FAILED and assert that it's not MAP_FAILED when no mapping function
> was found, in order to provide an understandable error when it occurs.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

You're doing two things in that patch, it should be two patches.

maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lhj4vd2or46bhni7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAkyeQAKCRDj7w1vZxhR
xdprAQC91lAcWKDxoBt/XOnq+WH9gYF2GegQIunfcQa4yKlSfAD/TuX5flslVoJL
Xz8ixj77irdOK3vsK2HdDg0dwCoenwI=
=VABl
-----END PGP SIGNATURE-----

--lhj4vd2or46bhni7--

--===============0602539203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0602539203==--
