Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 132CE896EC
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jun 2018 14:53:51 +0000 (UTC)
Date: Thu, 14 Jun 2018 16:53:39 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180614145339.r5g2w7nl4iwxylfa@flea>
References: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
 <538851bf02215e84605901cd494ed9a7abd82865.1527171699.git-series.maxime.ripard@bootlin.com>
 <20180524145813.GU23723@intel.com>
 <20180524151904.6ixjbows5m2id7y4@flea>
 <20180524154036.GV23723@intel.com>
 <20180604095403.fvfz5ygb4jfq73m4@flea>
 <20180604101353.GB23723@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180604101353.GB23723@intel.com>
Subject: Re: [igt-dev] [PATCH v3 03/11] fb: Add format conversion routine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0408584964=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0408584964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d243j3brd4v6iu2i"
Content-Disposition: inline


--d243j3brd4v6iu2i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2018 at 01:13:53PM +0300, Ville Syrj=E4l=E4 wrote:
> On Mon, Jun 04, 2018 at 11:54:03AM +0200, Maxime Ripard wrote:
> > On Thu, May 24, 2018 at 06:40:36PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Thu, May 24, 2018 at 05:19:04PM +0200, Maxime Ripard wrote:
> > > > On Thu, May 24, 2018 at 05:58:13PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > > On Thu, May 24, 2018 at 04:24:42PM +0200, Maxime Ripard wrote:
> > > > > > The chamelium format subtests will need to convert the referenc=
e pattern to
> > > > > > the format to be tested on the DRM device.
> > > > > >=20
> > > > > > However, Cairo is very limited when it comes to format, and whi=
le pixman
> > > > > > has much more support for formats, it's still falling short com=
pared to
> > > > > > what DRM exposes, especially on the YUV side.
> > > > >=20
> > > > > We already have the capability to do format conversions automagic=
ally.
> > > > > I'm extending it to handle more YUV stuff here:
> > > > > https://patchwork.freedesktop.org/series/43651/
> > > > >=20
> > > > > Can you hook up the pixman stuff in the same way so that we don't
> > > > > have to any explicit conversion stuff in the tests themselves?
> > > >=20
> > > > I really think that the assumption that cairo will handle it is not=
 a
> > > > proper fit. Cairo support is very limited, just like pixman is to a
> > > > lesser extent, and we should just break the assumption that we will
> > > > get a cairo surface all the time.
> > >=20
> > > Not sure what you're saying here. We don't assume cairo handles all
> > > the formats, well, because it doesn't. We just magically convert
> > > to/from XRGB888 so that cairo doesn't have to handle anything else.
> >=20
> > My point was that from what I can tell from your patches, you allow to
> > create an igt_fb with whatever format we want, and then convert it to
> > XRGB8888 when one calls igt_get_cairo_surface.
> >=20
> > I need something more generic, but even if we simplify to the
> > operation that I need now, I basically needs the exact opposite: to be
> > able to take an XRGB8888 buffer (that is our pattern) and get an
> > igt_fb in an arbitrary format.
>=20
> The current thing (and my patches) converts both ways. Can't get much
> more generic than that.
>=20
> >=20
> > And that buffer cannot be created by cairo,
>=20
> Why not?

In order to have control over the lower bits that would be lost in the
resampling. Let's say you convert the initial XRGB8888 pattern to an
RGB565 one, feed that to the scanout, and capture the frame on the
other end using a chamelium.

The Chamelium will capture a CRC over an XRGB8888 frame internall, and
you will have the CRC of the XRGB8888 pattern. However, since that
pattern was downsampled to RGB565 and the resampled back to 8 bits,
you lost the least significant bits, and without a pattern that was
carefully chosen, the CRCs don't match anymore.

As far as I know, Cairo only allows you to specify a color component
as a float, and tries to map that to a 24bits color components. But
you have no way to force it to use a particular value for the 3 (or
more) lower bits.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--d243j3brd4v6iu2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsigXIACgkQ0rTAlCFN
r3RlzQ/+OizwuVY3UH/LvdxQtIDHmOTcBL2D428QIIQXtHDakJMc2FXqqQU2pdFJ
gjAmk+t0HwT35OlbAGxC3jKU7rdh+0J/FLHKRCoXvvCp4m3BchRomYb0E7orw59d
IvyfPT4MJCJf3SzLS6dGkEn1guc47AnaeDjK8qFWJ08V0qVCWqXmmWlNxthrmkPs
T7TjoFvDJf/pk/4j8PxJILT55ulMnBbgrhQGWR7oWyY6QVi1lyDyaCaSLpR8jg9l
ZeQXe6KmzELBBPDXWleoDKmMwsaAZ7fgA3sU8TF2RKg8gv1+S6I/wK6pr2+271JT
kMCe+bcxtf3lkbZn63Lz0+mlsMBa4Xqsy71Nwc6IVP5QNiAQlaqxuN2vrRYxvpPW
mlr8EIlxfS5yZjcnfLRmE6vJj7Mk60yt+a0te4vaF2cMXnYZ1LBEwNvJHmA3zY/t
ejC8b4EKNHp7GKy06YcieDGzADcM18C9WFA6SZRjozncwgi+zhhO/+iLFf3gNdV6
EDPofWyRsbCVACbaXll15sTASTH6oEnU4v73r4UmEGE3kJy7pF7YzJQWac3juIQl
bD/84SUpbMXTFmctGmDX/+fBzMC1iCnQi/KE7D3QYVuCcXuraT8itsh0OgYxibBl
DcrTej9n13Qj0MKEQMmH6qeO7DbAJ165VcnTdGEirbFLLTBeJiE=
=shdI
-----END PGP SIGNATURE-----

--d243j3brd4v6iu2i--

--===============0408584964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0408584964==--
