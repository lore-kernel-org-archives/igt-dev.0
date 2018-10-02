Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9322D895EE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Oct 2018 14:58:00 +0000 (UTC)
Date: Tue, 2 Oct 2018 16:57:44 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181002145744.jt2ko5vhu7k77c2o@flea>
References: <cover.cafc7aee9c887562e8432741cd1f0543ff92121a.1536655647.git-series.maxime.ripard@bootlin.com>
 <2a7b88e3a05afa4b8c8661a59a87e9d668cf5a07.1536655647.git-series.maxime.ripard@bootlin.com>
 <20181001092658.GB17124@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20181001092658.GB17124@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH v7 07/14] fb: Add support for conversions
 through pixman
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1717231367=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Boris Brezillon <boris.brezillon@bootlin.com>, Eric Anholt <eric@anholt.net>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1717231367==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="al3opo3dffgpj2zm"
Content-Disposition: inline


--al3opo3dffgpj2zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Petri,

On Mon, Oct 01, 2018 at 12:26:58PM +0300, Petri Latvala wrote:
> On Tue, Sep 11, 2018 at 10:47:34AM +0200, Maxime Ripard wrote:
> > Pixman allows for much more conversions than cairo, and we don't want to
> > open code conversions routine for the common formats.
> >=20
> > Let's plug pixman in our conversion function so that we can benefit fro=
m it
> > when possible.
> >=20
> > Reviewed-by: Eric Anholt <eric@anholt.net>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 53 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 624fddbd465b..64370e01c1d6 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -29,6 +29,7 @@
> >  #include <math.h>
> >  #include <wchar.h>
> >  #include <inttypes.h>
> > +#include <pixman.h>
> > =20
>=20
> Currently pixman is only there if you enable chamelium. Doing this
> requires making it mandatory, doing some refactoring on meson.build
> and configure.ac. And README.

Ah, right. I'll fix that.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--al3opo3dffgpj2zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluzh2cACgkQ0rTAlCFN
r3QJbQ/+I127mi28C9foJES5qHjj2xIYkGwf91zkge74v2l33is+HJwQXhXqs4/K
YjVcYSy4uwqbdFC0rATphrZ2Ea3YPxoQOS0Rt6oPB5MJY9LDl82jlRorvZie7ELf
zv8F2mm85ldFqtnjYuwg6n1CzatMhg04xXYD1vcR/GCcJ7hJs7nk1UMSDBTmNGDb
HmNBTqNVGPmp+SfTUlCF7OWWc0msd7e2I6OmZTrb6Pvf+jHyWKYY0nOi8UcK7aoV
VPEKW5C383Qo8JiYmIDoBURcLRSGDPjf51wxhLGAhvVDgwZwcMDzo8tyYwEq6/tf
+a67D+E2NuiDayvwypAojoApxCL8hcNrCwC0f83VI/poc4q0l514VoaJNGa5bCuR
QkX45ixXxFJtQI8V2rEAOcoSdKzYZRYG/ebjl800ieQp/d2eQI8lD2on9pcGuDyX
S2kEKgjytxtYmQl0YIcszeal6TnkDXzAE95z2IyNPJCW1O7IPJicfiJtd+Y9E+9W
xKJGLQPyOnjgIPAwhKguAGj614g+3T/OJjXRtmZ24g86BESFQnMMFJZKWWn1cAdc
nETT4jAy48rRhOqC1Zh302KdzN3/RwM2lthtmiN8kvBkubhIP2I61+0Y1jtL5v43
eGAEr6QThUbp7Z32EtBVlhSohImOu8Qt0JzzNDC6cRSSyLuUC9s=
=ZnBv
-----END PGP SIGNATURE-----

--al3opo3dffgpj2zm--

--===============1717231367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1717231367==--
