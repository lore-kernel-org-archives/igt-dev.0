Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B0E36E8C3
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jan 2019 13:10:39 +0000 (UTC)
Date: Mon, 21 Jan 2019 14:10:37 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190121131037.vy4hbdjwbut2nob2@flea>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
 <20190108152001.5367-7-maxime.ripard@bootlin.com>
 <096a36349f86ee387a8cc60f42d493f538baef12.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <096a36349f86ee387a8cc60f42d493f538baef12.camel@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 07/13] igt: fb: Account for all
 planes bpp
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1718999546=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1718999546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c6opt64lly3c6alo"
Content-Disposition: inline


--c6opt64lly3c6alo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 11:21:24AM +0100, Paul Kocialkowski wrote:
> On Tue, 2019-01-08 at 16:19 +0100, Maxime Ripard wrote:
> > When allocating a dumb buffer for a format with multiple plane, we need=
 to
> > account for all plane's bpp in order to allocate the proper size.
> >=20
> > Let's add all the planes bpp and use the result to allocate our buffer.
>=20
> As discussed off-list, this approach doesn't work well when multiple
> planes and sub-sampling are involved, causing over-allocation.
>=20
> For instance, NV12 requires at least width * height * 1.5.
> The bpp for the second plane is 16 but with four times less pixels due
> to sub-sampling. Here, this would amount to width * height * 3 at
> least, so over-allocating.
>=20
> I think dividing each plane's bpp by the sub-sampling before adding it
> should work (with a round-up division to be on the safe side for cases
> where bpp cannot be exactly dividided by hsub * vsub in the future).
>=20
> What do you think?

It sounds great, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--c6opt64lly3c6alo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEXEzQAKCRDj7w1vZxhR
xfdQAP4ofRms+P8hq0L565rDG/Ua4x9vfYpUGdDjn2ADxxhM9QD/YrCq13ZlgR4l
0disJo6RDTxWsnhz5Gj/RKk93r9a4wg=
=OCzA
-----END PGP SIGNATURE-----

--c6opt64lly3c6alo--

--===============1718999546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1718999546==--
