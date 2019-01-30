Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D64B6E5EF
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jan 2019 15:06:13 +0000 (UTC)
Date: Wed, 30 Jan 2019 16:06:08 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190130150608.2ejsnb6gtculsm4c@flea>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
 <20190125145842.15738-4-maxime.ripard@bootlin.com>
 <20190129200736.GI20097@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190129200736.GI20097@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 03/13] igt: fb: generic YUV
 convertion function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2012483028=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============2012483028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vpebupabbuyq5sth"
Content-Disposition: inline


--vpebupabbuyq5sth
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Tue, Jan 29, 2019 at 10:07:36PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Jan 25, 2019 at 03:58:32PM +0100, Maxime Ripard wrote:
> > The current way we work when we want to support a new YUV format to IGT=
, we
> > also need to add new function to convert to and from XRGB8888.
> >=20
> > This doesn't really scale however, and creates a lot of code to maintai=
n.
> > In order to work around this, create a generic function to convert to R=
GB
> > and one to convert from RGB.
> >=20
> > The only thing that is needed now is to add new parameters, and that's =
it.
>=20
> What's the performance impact of this?

I just measured one test on a old laptop we have here (with an i7 4600U):

The first run is with the current code (note that the message is wrong
and its milliseconds, not seconds):

=2E/build/tests/kms_plane --run-subtest pixel-format-pipe-a-planes=20
IGT-Version: 1.23-g1c1612bd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
Starting subtest: pixel-format-pipe-A-planes
Testing format XR24 (0x34325258) on A.0
Testing format RG16 (0x36314752) on A.0
Testing format XR30 (0x30335258) on A.0
Testing format XR24 (0x34325258) on A.1
Testing format YUYV (0x56595559) on A.1
took 79.655000 seconds to execute
took 76.913000 seconds to execute
took 77.148000 seconds to execute
took 76.004000 seconds to execute
took 77.223000 seconds to execute
took 76.348000 seconds to execute
took 74.939000 seconds to execute
took 76.563000 seconds to execute
Testing format YVYU (0x55595659) on A.1
took 75.744000 seconds to execute
took 76.446000 seconds to execute
took 75.803000 seconds to execute
took 76.711000 seconds to execute
took 75.568000 seconds to execute
took 78.681000 seconds to execute
took 77.757000 seconds to execute
took 76.557000 seconds to execute
Testing format UYVY (0x59565955) on A.1
took 77.667000 seconds to execute
took 76.608000 seconds to execute
took 77.551000 seconds to execute
took 76.773000 seconds to execute
took 77.498000 seconds to execute
took 72.944000 seconds to execute
took 72.988000 seconds to execute
took 77.015000 seconds to execute
Testing format VYUY (0x59555956) on A.1
took 77.795000 seconds to execute
took 72.955000 seconds to execute
took 72.945000 seconds to execute
took 77.114000 seconds to execute
took 77.893000 seconds to execute
took 72.930000 seconds to execute
took 72.949000 seconds to execute
took 73.089000 seconds to execute
Testing format AR24 (0x34325241) on A.2
Subtest pixel-format-pipe-A-planes: SUCCESS (12.297s)

This is the same test, with the new conversion code:

=2E/build/tests/kms_plane --run-subtest pixel-format-pipe-a-planes=20
IGT-Version: 1.23-gec936cad (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
Starting subtest: pixel-format-pipe-A-planes
Testing format XR24 (0x34325258) on A.0
Testing format RG16 (0x36314752) on A.0
Testing format XR30 (0x30335258) on A.0
Testing format XR24 (0x34325258) on A.1
Testing format YUYV (0x56595559) on A.1
took 79.515000 seconds to execute
took 79.751000 seconds to execute
took 79.271000 seconds to execute
took 75.816000 seconds to execute
took 75.774000 seconds to execute
took 79.381000 seconds to execute
took 78.029000 seconds to execute
took 78.134000 seconds to execute
Testing format YVYU (0x55595659) on A.1
took 78.705000 seconds to execute
took 78.814000 seconds to execute
took 78.498000 seconds to execute
took 78.636000 seconds to execute
took 78.821000 seconds to execute
took 78.706000 seconds to execute
took 78.662000 seconds to execute
took 78.800000 seconds to execute
Testing format UYVY (0x59565955) on A.1
took 78.731000 seconds to execute
took 78.949000 seconds to execute
took 79.031000 seconds to execute
took 79.433000 seconds to execute
took 77.495000 seconds to execute
took 79.217000 seconds to execute
took 78.766000 seconds to execute
took 78.944000 seconds to execute
Testing format VYUY (0x59555956) on A.1
took 74.723000 seconds to execute
took 79.081000 seconds to execute
took 78.154000 seconds to execute
took 78.163000 seconds to execute
took 78.282000 seconds to execute
took 78.346000 seconds to execute
took 78.326000 seconds to execute
took 78.272000 seconds to execute
Testing format AR24 (0x34325241) on A.2
Subtest pixel-format-pipe-A-planes: SUCCESS (13.881s)

So it looks like we're losing 2-3ms per conversion (on a 1920x1080
frame). It seems pretty negligible to me, but you're the jugde here :)

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vpebupabbuyq5sth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFG9YAAKCRDj7w1vZxhR
xZ6fAP9fW6Kmshbd1F2oI3b/HME/o7sHWy5O0OPQ112EDGVf5QD/csG8hqTBoMkC
6BQv849GvExqHFVAVj5s6dwBF4iF+QM=
=mCI6
-----END PGP SIGNATURE-----

--vpebupabbuyq5sth--

--===============2012483028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2012483028==--
