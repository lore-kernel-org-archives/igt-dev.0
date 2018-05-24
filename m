Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9207B6E6F7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 May 2018 15:19:05 +0000 (UTC)
Date: Thu, 24 May 2018 17:19:04 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180524151904.6ixjbows5m2id7y4@flea>
References: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
 <538851bf02215e84605901cd494ed9a7abd82865.1527171699.git-series.maxime.ripard@bootlin.com>
 <20180524145813.GU23723@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180524145813.GU23723@intel.com>
Subject: Re: [igt-dev] [PATCH v3 03/11] fb: Add format conversion routine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1961772377=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1961772377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kp4sqmjtgc7rvi33"
Content-Disposition: inline


--kp4sqmjtgc7rvi33
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2018 at 05:58:13PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, May 24, 2018 at 04:24:42PM +0200, Maxime Ripard wrote:
> > The chamelium format subtests will need to convert the reference patter=
n to
> > the format to be tested on the DRM device.
> >=20
> > However, Cairo is very limited when it comes to format, and while pixman
> > has much more support for formats, it's still falling short compared to
> > what DRM exposes, especially on the YUV side.
>=20
> We already have the capability to do format conversions automagically.
> I'm extending it to handle more YUV stuff here:
> https://patchwork.freedesktop.org/series/43651/
>=20
> Can you hook up the pixman stuff in the same way so that we don't
> have to any explicit conversion stuff in the tests themselves?

I really think that the assumption that cairo will handle it is not a
proper fit. Cairo support is very limited, just like pixman is to a
lesser extent, and we should just break the assumption that we will
get a cairo surface all the time.

If we push things further (and we have the intention to do so), we
will have to support proprietary format that are very unlikely to be
supported by cairo at some point.

However, we do intend to support YUV at some point, so reusing the
routines definitely make some sense.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--kp4sqmjtgc7rvi33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsG1+cACgkQ0rTAlCFN
r3S99w/9GC8MKG+TOB5XFaxy6lIlGiHPbjO/2EY6utzTgHkDF7a3AFs6yp8BNNY+
ZWISPWbI6OF+xGNhURZor+r9jnXlU0CcP/1TvCH9JCBacqib838h0zPmDA5BAWUQ
9xm6+xYiGCokjWErX0TKYWoB34mq1WdVLHLsg5zsYC5APiUBurIJCV7Oj+hYcrtK
i7b9FsguzNhMY8TQWLVXMX5l1pq49MLHFyU/RL7ck/TRn2ATKuOF4dA0vtGijXB/
Q98Myngu5t3TKIR5MS7Eua3EudhLHLjACCUyzxfbsnrcadJDLLARBREACDlJ5U8S
zqHJvjya4Dju8qhj+73YAXvugtXdLLyy+4jW4aBc9QGSjiwMeJrR/GVQ0tYmZXfM
gP2fXK76e/hor99an58eRmHzpV/sTI/ddAJPDRC/y8G/gBUKAfbJabZfLAB1KHat
WjMKn9Sl8C8rjgT6sEJdYU+Qup6YSPEoI7tOiXc79GwCqAdFjoUflqSSa3AWIkfq
Gd3r/XBjUUx5peP/GVtkRY2GzycKewvE7fPb/i/SWbq13bfRJlrIuJBV9oW07A/q
QW+SRPSaG32zhDoJ9FB0kgB0BhYnLfsl3hD95M050PxPiNhJb7FEY3KmaKkJ6kxl
p7qExN4iTNDhUzmrjpZjko7VX30nYR9OcEHEm0JJJ7oD47WrrbQ=
=QCga
-----END PGP SIGNATURE-----

--kp4sqmjtgc7rvi33--

--===============1961772377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1961772377==--
