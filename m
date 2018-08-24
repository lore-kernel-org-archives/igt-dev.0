Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 750426E62B
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Aug 2018 07:49:44 +0000 (UTC)
Date: Fri, 24 Aug 2018 09:49:33 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180824074933.qoapg4dzyvzyappa@flea>
References: <cover.85e5bbe6ef5f0fd420e1fc21fc248471b98481e5.1532596850.git-series.maxime.ripard@bootlin.com>
 <cbedc79edb2bcfc1ad2ed89cb86b15bc9088e634.1532596850.git-series.maxime.ripard@bootlin.com>
 <20180823151748.GH5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180823151748.GH5565@intel.com>
Subject: Re: [igt-dev] [PATCH v4 08/13] chamelium: Use preferred mode when
 testing a single mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0845016674=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0845016674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dqnrby334kjmlfwr"
Content-Disposition: inline


--dqnrby334kjmlfwr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Thu, Aug 23, 2018 at 06:17:48PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, Jul 26, 2018 at 12:42:07PM +0200, Maxime Ripard wrote:
> > The current code is testing the first mode in the connector list when i=
t's
> > testing a single mode. While this is arbitrarily chosen, it makes more
> > sense to use the preferred mode reported by the display.
>=20
> The kernel sorts modes such that preferred modes appear before
> non-preferred modes.

Ah, that's good to know. I've dropped that patch then, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dqnrby334kjmlfwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlt/uIwACgkQ0rTAlCFN
r3QH7Q//WxS79SQAPwkypsVdqe/jUBhGG63dMe00HDK/QuNpz9CUsMB6Wuf9jbr1
xAfznk9G4eCnf+XHj+uJ/eLzyQ4/Gxz0ofRW6bzCfMkHuxbpfVj73Mg40WiwCqCY
s9VAgTtG3Gvtc0bL85eXsLH9tTMUntH8CC8djyQHUZ48E4JUhgDMO65aIcKTq5mg
2SseMDQ+Fbh6fIUv7+aiXif3m8aGUc1Qth4ZIfurOcBCRh6HLQorY1wnz8cr0+CX
hmdvqvGTcN0o0v7jSkUSBuKW5yrW6FWG3xTAmIz6KayOvkuxgPXZYRSgKLKrAZtE
DKNyWANmY8Q2YLFmwPre1lwjSd42PPpoSunKlk1tLwaug4nEgBS0M3YUj4kxWnRZ
0s2rtWEs7dNZJODFCv1pzB3kx5d3eEO0RctsTgPIqas/Ngb9BG8D29Oa1wR8rQCs
29Ba5sD4cLWKBsyQpIybxOCsFIijrR0wlT9N5A6oJ9HsPEF63ELJdlgiKFWkcN8F
vXb/chZGtd+Ua00L3B6kwNXD6wfk0lJLh9EzGkAyW26t++of5tU/oE76wjnW9KJM
dVl33YIBUe4DuZkKL3nk1842OE47X5GZxXoUxBxcHUIl9aILeBdo/DTjBgRZjdNT
ZYyKi8yhOLhZYc1iWsFTVuReFVcRdiAei6Naqf5D8J7wBAotXNw=
=XFaB
-----END PGP SIGNATURE-----

--dqnrby334kjmlfwr--

--===============0845016674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0845016674==--
