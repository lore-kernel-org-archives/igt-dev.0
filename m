Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAF066E090
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Sep 2018 07:23:19 +0000 (UTC)
Date: Thu, 6 Sep 2018 09:22:45 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180906072245.66ygaloy2wv3e2rr@flea>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
 <646c39734b6dde4b74f215b64f094cddc9e00ebe.1535721136.git-series.maxime.ripard@bootlin.com>
 <20180831134218.GZ5565@intel.com>
 <20180905093549.2sv3ggjp5j6yiihz@flea>
 <20180905101434.GL5565@intel.com>
 <20180905131903.ucuftgtcq4hzze2s@flea>
 <20180905133726.GR5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180905133726.GR5565@intel.com>
Subject: Re: [igt-dev] [PATCH v6 05/13] fb: Fix ARGB8888 color depth
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2083240447=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============2083240447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5dgwrg4e4us3jrj6"
Content-Disposition: inline


--5dgwrg4e4us3jrj6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 04:37:26PM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Sep 05, 2018 at 03:19:03PM +0200, Maxime Ripard wrote:
> > On Wed, Sep 05, 2018 at 01:14:34PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > In the same format list:
> > > >   - RGB565 has a depth of 16
> > > >   - XRGB8888 has a depth of 24
> > > >   - XRGB2101010 has a depth of 30
> > > >   - ARGB8888 has a depth of 32
> > > >=20
> > > > Which seems to indicate that the list indeed meant that the color
> > > > depth is about the color, and that ARGB8888 is wrong.
> > >=20
> > > None of those other things have alpha, so they are still
> > > consistent with the depth=3D=3D32 definition for ARGB888.
> >=20
> > "24 bits almost always uses 8 bits of each of R, G, B. As of 2018
> > 24-bit color depth is used by virtually every computer and phone
> > display and the vast majority of image storage formats. Almost all
> > cases where there are 32 bits per pixel mean that 24 are used for the
> > color, and the remaining 8 are the alpha channel or unused."
> >=20
> > There's 32bpp, but the depth is 24 bits.
> >=20
> > But maybe the X11 legacy says otherwise, I don't know. What's your
> > suggestion then? adding yet another field?
>=20
> Just leave it as is?

I need the actual color depth in order to check whether the conversion
=66rom one format to another would lead to a lesser number of bits per
color, and as such should fall back to a more conservative
pattern. See the later patches in this series.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--5dgwrg4e4us3jrj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluQ1cQACgkQ0rTAlCFN
r3SWgxAAhphKzLY1sOajoEH9CmFWwbcRyaKnfhx3IyC4IjmEgRfrWdWQRmPuzSo/
dL/f8Asrcuvyaahi6HLNGml8YLvgIZRB8dSQl+0IEU4YF8q5BgQJwfV4Y+Yzg9w6
Co9vOd60mHAK59xi2RHffCcZ/ymtPRruz/TG8GQJSJscT29BzXmgTiopdswT9cUW
zm3+8h80U4z24htDR8su4NcfVKBmRff8MM9aPx8ir0H90lS8bTUGqUzwDdVKJf1B
lZ/Y7otUiPaxJJLtiUWbuLL7I2qZ8azG2i1NrFAhgMNe69DgL9qYVgFRY+z2tmkz
ag1l1jX4MtCQ1w3vECjPNeSejwmMdYcGSEp+lf33Vt/Fh3WXnjQi400ISk86zDVE
FGjxxi8ZbYvGJaK3Qv8yc0xazxckO620OQuJAKTJcE+QluDHMHeLhdyj82bbBz6e
xGYTMnQCdh2F89sKJeNP3UifnutS5KRtfnoVE6jDxPlmKgonH+C01df4XcM1R7s5
Qwk6ykUG3E8ZE3SZ0DlM32C75puWsds3xIQLvgDHJlDoGz+E7Hp2r+R1xY/DF5ym
CdGizG82NPUEnKzY2O3VFtF1ylWLpAci0jLefIRkZYtBx+bLgCBX9lhcRK5m1SyH
04KUlEk0akEjZo+RNcXyW46lRKEZUZAbZ3jnd2ql7BHPDtQIHD8=
=xZJT
-----END PGP SIGNATURE-----

--5dgwrg4e4us3jrj6--

--===============2083240447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2083240447==--
