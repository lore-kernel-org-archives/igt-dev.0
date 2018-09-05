Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFE176E459
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 13:19:04 +0000 (UTC)
Date: Wed, 5 Sep 2018 15:19:03 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180905131903.ucuftgtcq4hzze2s@flea>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
 <646c39734b6dde4b74f215b64f094cddc9e00ebe.1535721136.git-series.maxime.ripard@bootlin.com>
 <20180831134218.GZ5565@intel.com>
 <20180905093549.2sv3ggjp5j6yiihz@flea>
 <20180905101434.GL5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180905101434.GL5565@intel.com>
Subject: Re: [igt-dev] [PATCH v6 05/13] fb: Fix ARGB8888 color depth
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2055046551=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============2055046551==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ahostbkyptyewemy"
Content-Disposition: inline


--ahostbkyptyewemy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 01:14:34PM +0300, Ville Syrj=E4l=E4 wrote:
> > In the same format list:
> >   - RGB565 has a depth of 16
> >   - XRGB8888 has a depth of 24
> >   - XRGB2101010 has a depth of 30
> >   - ARGB8888 has a depth of 32
> >=20
> > Which seems to indicate that the list indeed meant that the color
> > depth is about the color, and that ARGB8888 is wrong.
>=20
> None of those other things have alpha, so they are still
> consistent with the depth=3D=3D32 definition for ARGB888.

"24 bits almost always uses 8 bits of each of R, G, B. As of 2018
24-bit color depth is used by virtually every computer and phone
display and the vast majority of image storage formats. Almost all
cases where there are 32 bits per pixel mean that 24 are used for the
color, and the remaining 8 are the alpha channel or unused."

There's 32bpp, but the depth is 24 bits.

But maybe the X11 legacy says otherwise, I don't know. What's your
suggestion then? adding yet another field?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ahostbkyptyewemy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluP18YACgkQ0rTAlCFN
r3RHghAAibrakyB6PS+tK+u5XoM1b9gIty00Q16UGCHRiRUVEPslRnR8wTqOHhO6
faB0Ebu2Aa1EqxS53rJHEECOfw9QMRRhJ3N7XIJu3V2pnTyRVEvaBr8GyVBUK5i6
+MKaEptUdxeEXbX1VzF5nAgFm2p70xrH8jBp21co0r8XSEW14MCQQoPnfKLNCxPy
15MHbd1mfP7CEJV8XbKujwFrFEcPFJf/MD92K5JziT7fTrZ7xQw0o+CO+UiAE+p+
WgDcwBwTSvHCr2fCcjCvTqvvyB9I9SydsyWFx8cpyR/Oe4taXUw1zg6Cph16lduD
rzlQXvXnE/qjUA37sh4LG1ENo23CiDrOpAyBstp3Z/yo+sHITOY8usDyQQpLgF6N
WxlJHEyuoi/s9/BHURMJ+dfHXRrs0D6FKj5dJwsbbc344ADy7iZu6uGDVx0Q8xBD
FIRN/5ewOlo079D6BwLsLLiOATKYLudMuV+0ew3943rEFNx6wnxmayVbeBgnr5FL
e+O6NDRQD2JP2y/YpQhnBB5iTetCIVwSfsRi9YQ8XLhDuCpoF1Dw3wBtWQjGMIPf
G0/M1x61ELqhpQU/kAz7+aNPhiSNfnOcALklgHu9CxYjDhxxnKzgofRxnmtp/+Vi
vDl1EMIQIW8Fr5RsypX1krW/soFMiMwxR0RprAjtIS5XRcuZNdk=
=P2hT
-----END PGP SIGNATURE-----

--ahostbkyptyewemy--

--===============2055046551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2055046551==--
