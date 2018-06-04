Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E5B96E94E
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jun 2018 09:54:05 +0000 (UTC)
Date: Mon, 4 Jun 2018 11:54:03 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180604095403.fvfz5ygb4jfq73m4@flea>
References: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
 <538851bf02215e84605901cd494ed9a7abd82865.1527171699.git-series.maxime.ripard@bootlin.com>
 <20180524145813.GU23723@intel.com>
 <20180524151904.6ixjbows5m2id7y4@flea>
 <20180524154036.GV23723@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180524154036.GV23723@intel.com>
Subject: Re: [igt-dev] [PATCH v3 03/11] fb: Add format conversion routine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0597011953=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0597011953==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="33umljp5qs7j2csp"
Content-Disposition: inline


--33umljp5qs7j2csp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2018 at 06:40:36PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, May 24, 2018 at 05:19:04PM +0200, Maxime Ripard wrote:
> > On Thu, May 24, 2018 at 05:58:13PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Thu, May 24, 2018 at 04:24:42PM +0200, Maxime Ripard wrote:
> > > > The chamelium format subtests will need to convert the reference pa=
ttern to
> > > > the format to be tested on the DRM device.
> > > >=20
> > > > However, Cairo is very limited when it comes to format, and while p=
ixman
> > > > has much more support for formats, it's still falling short compare=
d to
> > > > what DRM exposes, especially on the YUV side.
> > >=20
> > > We already have the capability to do format conversions automagically.
> > > I'm extending it to handle more YUV stuff here:
> > > https://patchwork.freedesktop.org/series/43651/
> > >=20
> > > Can you hook up the pixman stuff in the same way so that we don't
> > > have to any explicit conversion stuff in the tests themselves?
> >=20
> > I really think that the assumption that cairo will handle it is not a
> > proper fit. Cairo support is very limited, just like pixman is to a
> > lesser extent, and we should just break the assumption that we will
> > get a cairo surface all the time.
>=20
> Not sure what you're saying here. We don't assume cairo handles all
> the formats, well, because it doesn't. We just magically convert
> to/from XRGB888 so that cairo doesn't have to handle anything else.

My point was that from what I can tell from your patches, you allow to
create an igt_fb with whatever format we want, and then convert it to
XRGB8888 when one calls igt_get_cairo_surface.

I need something more generic, but even if we simplify to the
operation that I need now, I basically needs the exact opposite: to be
able to take an XRGB8888 buffer (that is our pattern) and get an
igt_fb in an arbitrary format.

And that buffer cannot be created by cairo, so relying on the
destroy_cairo_surface__convert to convert it back from XRGB8888 to
whatever format doesn't work.

So yeah, we can't really rely on cairo in this particuliar case, and
the buffer conversions need be to made explicit.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--33umljp5qs7j2csp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsVDDsACgkQ0rTAlCFN
r3T3QA/+IZ2oba4sy048alLIJ3Soa5JEuWQNZtMBH45YaZxEUauBRin+D/pjeB9q
mCdwb9rPFkKniIMYf39YdhufLYdJT/QVi6Ho6Wftk696vxt8HYxkUAU1Xs6VTUxH
r2eQUldT9rxv4344Pom94r0CMCXMcbH7yYUNKgIoW9D5dmQUnU9nF7jQpB0D1t4I
n+Clk66gROkfIi3j8CKBQQBk7BQUkPYq399oKXFaePOz9ljDe+pbNwuMuh1OmrMZ
8oKUBwXe7RHdbcr6wJNZOdl25ldWKJTU9xueKllnaAGp1Jmr2Q8bAUy/NzMckGz8
rEedye1KDYYW/9ba4yNyENS68tnM8o62lYXC7GsSyjqmvBaVbU963nanZWEZHjNg
iZwS/SfBXLAha3LiCEudXoyKGqTQywyFD+b88drdVVQ0k7Vo2BBp4zLPXFJLsTeW
iQJXCxTXhLyaQxlt4egOSP3bCr5e/6rsgquPJfsxq4gSHZXkYY6qwUfIPPawZuHr
YZ3SBGahE2+UxE6oQV+9Uieh29Q8IbeMGpQISlvk6mfgmS/OKXDV6Xz6U2SR9o96
C3CQ4K9vkNfF/aXahbIMfNl9iVKmWwoep8qk1K0RZxtfFbm1/vHPCKcRw0b37S9O
g3GBG8/pgb2eDUfY/QpTYPADX/qXrmc2XD/1oMy3fTuHFI7cLsI=
=E1rf
-----END PGP SIGNATURE-----

--33umljp5qs7j2csp--

--===============0597011953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0597011953==--
