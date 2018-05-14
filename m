Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCB586E04E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 13:17:45 +0000 (UTC)
Date: Mon, 14 May 2018 15:17:34 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180514131734.ms6wvvfo24uip7us@flea>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t 00/12] chamelium: Test the plane formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1956647141=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1956647141==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b6ov5c3cyywpalr5"
Content-Disposition: inline


--b6ov5c3cyywpalr5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 09:46:34AM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here is a first non-RFC version of a serie that aims at starting to test
> the plane formats using the Chamelium over the HDMI. This was tested using
> the vc4 DRM driver found on the RaspberryPi.
>=20
> There's been a number of changes from the RFC thanks to the feedback from
> Eric Anholt.
>=20
> The series now relies mostly on igt_fb, with some decoupling from cairo a=
nd
> a bunch of new helpers to aim at being able to convert igt_fb to arbitrary
> DRM formats. The list of formats have been extended a bit, but is quite
> small at this point. We also rely solely on pixman at the moment to perfo=
rm
> the format conversion.
>=20
> However, since it's now abstracted away from the igt_fb users, we can
> easily add some routines to convert to additional formats if needed. And
> since the code was so close now, it's been integrated into kms_chamelium.

Any comments?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--b6ov5c3cyywpalr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlr5jG0ACgkQ0rTAlCFN
r3RkGw//YyfJAub5MYnNmxM+0oznftRV79JNEfV1lPQTt326kRwObHVFcxWA6U/W
Gt5Jm8R0hr7RD9AyQQCBkYsHx9PryT67UuOuU2FxO/RJQfU6DeCC1Bsh/Qz95Sdx
Rmj415GCYcVc5gR/+LdUC9SHhkCQ0trDQwKZoKsgr0mU9DWpYnuFuYPd7fMOsAPV
ifmLppi5XxIRqeuqkmaz3ohU/lvaN8ojVeAKt+pRhzWkh0HDE9zwJe0hWxegejmb
fBO4e0U/Rj6E2qBoGae5wLDbFAuUchQPnV/iXmsvy8MOe+1NR34tIw/Sokc81PTp
hR32NMb9MRRwIvkUVxZ/eFRPwa08aiqn3al/9Ue21fKzTTwEMFj5W1aLY6MZlI/p
LZyq84iZ29UtRiAxKuaDQskK2muzAm0FMdiYvATpG7pu/JZECeOmQS8s2pV3x7b5
qXErSYT0opM9CApG5VqJXDEJgg3vGhI107kStf0KSkl/nVQUG2gzcIJhLrkPlib9
8T9w7zr6ogGeS7f34Oq+Izf4ztW+VPZLx6jhKm4dsLAJUwJU7jBOBuH85/l9cf7a
biTgmAbw+f3S37T66k6ppXIjD4+1dxLxBY1oAmOi4xxYEmRuyC2BrO4g+dYriitA
uXQU7phh9WEW0n8Nh2m0zChHPnMzbcClJdkY7+dPmzJhf+C1/rQ=
=hdnY
-----END PGP SIGNATURE-----

--b6ov5c3cyywpalr5--

--===============1956647141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1956647141==--
