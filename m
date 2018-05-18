Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 646306EC61
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 07:26:36 +0000 (UTC)
Date: Fri, 18 May 2018 09:26:25 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180518072625.sbsyax3b2hyi4v4j@flea>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <eee519ed1db1474de03941c3009228b88224a716.1524555464.git-series.maxime.ripard@bootlin.com>
 <9aee563e1f348763ce6f85510b4b034c1851e52e.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <9aee563e1f348763ce6f85510b4b034c1851e52e.camel@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/12] chamelium: Change our pattern for
 a custom one
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1477070801=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1477070801==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5pmjxfotvjsb3rdz"
Content-Disposition: inline


--5pmjxfotvjsb3rdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2018 at 04:24:40PM +0200, Paul Kocialkowski wrote:
> On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> > The current pattern being used is the one generated through the
> > igt_create_color_pattern_fb.
> >=20
> > However, in order to deal with multiple formats and the upsampling /
> > downsampling issues that might arise from converting back and forth bet=
ween
> > formats, we will need to have a pattern with quite precise color values,
> > and without any shades or gradient of colors.
> >=20
> > The easiest way to do that will be to only use values that would have t=
he
> > same part on the common most significant bits (5, to deal with the most
> > formats) and have the same bit repeated on the least significant bits t=
hat
> > are going to be dropped and / or padded when converting between formats.
> >=20
> > Pixman will fill the lowest bits with 1, and our hardware is able to
> > support that, so the easiest is to just use all 1's for our components =
in
> > order to still be able to compute the CRCs.
>=20
> I understand the issue at hand, the proposed solution and I agree that
> it an easy way to deal with the issues introduced by up/downsampling.
>=20
> However, it all other cases (where the color bpp is the same for the
> source and destination formats), I think we should definitely use a
> complex pattern with gradients (igt_create_color_pattern_fb) in order to
> increase the coverage of the tests (gradients are something we
> definitely want to make sure are displayed correctly).

Testing a gradient and expecting a pixel-perfect result is pretty
difficult, even on a digital signal like HDMI. It would assume that
there's no loss in color depth between the plane and the final
connector. And you have two boards on your desk that break that
assumption :)

I guess this would work fine for setup that have an HDMI encoder as
part of the video pipeline. But if you don't, and you have to use a
bridge, then it starts to fall apart, since the bridge might very well
be connected to the upstream encoder through a bus with a lower color
depth than the signal will output. And the worst part is that this is
not exposed to the userspace, so you cannot just fallback to a simpler
pattern if you fall into that case.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--5pmjxfotvjsb3rdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlr+gCAACgkQ0rTAlCFN
r3SppA/9GSxMfXvqXDZAA/uTrUuXgdw/USo4ISR2lfvECBtvZdO+anwlGgCCxZ18
co/pcENo9UWY2jWj3DIPkiNww6Kw/K0N/GQziZ2wk73WjUj7jtONOjsRcKGOw1n2
d2puM+aqhLKcNEYbHmb+jKRi6dBuXXRvF6sreJIP5jbwNQVL9ws42hv39mRCEK9o
TmSKJlmy/AsiSeDh8Jse3aOJhWz4qPUnqDDNwDZ4LL2QL3/PrhfKFwzhmZMZKH92
c7aYyVDVYiHA/ISfgsakNsg5kKbpwrNWXlN6Epsh+bUsjteBK0+aFIowqHI0v+mu
g/ZsEYtAVzXtdDInRU9+CV6L/IoFmvovf8TckbCk4cy1j1aeGTgv19fyiGFQnvzA
hzYFXSYhaNnTT1kLV1lm6tSCU3zxxl31wP9uWfeI9MIrq6KqgT0GDc0E5nYrvgHB
9BTf4pokYw3UvbsYAOUm7qCX9miuNbbATSorUHinY4MweVJTMwNTNu45ZY6IeV6p
b8J4IQ2LGe9JAehcrU7GSyaNWe9hN1XfC5+qBL9pNIsox5aIzf7NdEmm9mVTyXJP
6ezDuoy8UOA37KEEoENZkJ6Kg0+38bx0IIB7kR/48lpjfpjfBhXkc9GdrOhHA+34
tzRAQGl6dHOj8L8qsMO+Gt0ENHoFiyQ3Ybg7a5S+quuGRB3ghcc=
=PrV6
-----END PGP SIGNATURE-----

--5pmjxfotvjsb3rdz--

--===============1477070801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1477070801==--
