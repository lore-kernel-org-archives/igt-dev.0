Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 849106E8CB
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jan 2019 13:17:33 +0000 (UTC)
Date: Mon, 21 Jan 2019 14:17:12 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190121131712.auueqq6ryacpyfxx@flea>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
 <20190108152001.5367-11-maxime.ripard@bootlin.com>
 <36b5c40afa92dd135d046d150d890f28f252c1f0.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <36b5c40afa92dd135d046d150d890f28f252c1f0.camel@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 11/13] igt: tests: chamelium: Start
 to unify tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1140144020=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1140144020==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dc7ebwu3cu5ckcyv"
Content-Disposition: inline


--dc7ebwu3cu5ckcyv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 10, 2019 at 11:50:35AM +0100, Paul Kocialkowski wrote:
> On Tue, 2019-01-08 at 16:19 +0100, Maxime Ripard wrote:
> > The various tests in kms_chamelium are really variants of one another
> > but share little code.
> >=20
> > In addition to the duplication, this gets in the way of the
> > introduction of more tests, or to be able to run all the tests on all
> > the output, which isn't the case at the moment, with the HDMI and DP
> > tests and the VGA tests being different.
> >=20
> > Start by introducing a check parameter to the do_test_display
> > function, that will tell which test method we want to use to compare
> > the frames.
>=20
> I think we can go even further and unify the assert_foo_or_dump
> functions, which would imply moving enum chamelium_check to
> igt_chamelium. It's probably best to do it in a separate patch though
> and I might have a go at it in the next revision of my plane testing
> series.
>=20
> What do you think?

I don't have a strong opinion on this, so feel free to send that patch
:)

> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>=20
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dc7ebwu3cu5ckcyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEXGVwAKCRDj7w1vZxhR
xZ9HAP9WXBm5i2sd21HNIwT8akJoHN/Dz5M/6rnYDlVqnMrl+QEAgH7byn2iuEQu
iBU8AWz9HPV4LqqPIL6Qjw96bxnohAE=
=ynDQ
-----END PGP SIGNATURE-----

--dc7ebwu3cu5ckcyv--

--===============1140144020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1140144020==--
