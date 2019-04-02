Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744FF6E35B
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 21:41:28 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 2 Apr 2019 21:41:06 +0000
Message-ID: <61f488639507c83c8d22914306361046bcd08a49.camel@intel.com>
References: <20190402205902.2245-1-jose.souza@intel.com>
 <20190402205902.2245-2-jose.souza@intel.com>
 <a98c6a80b98d2c9b557e0cdc2de2ef47fb43a03a.camel@intel.com>
In-Reply-To: <a98c6a80b98d2c9b557e0cdc2de2ef47fb43a03a.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/frontbuffer_tracking:
 Assert the status of other features on stridechange subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0502043001=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0502043001==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-cJiE4WEtz4Ba2V07pQzQ"

--=-cJiE4WEtz4Ba2V07pQzQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-02 at 14:24 -0700, Dhinakaran Pandiyan wrote:
> On Tue, 2019-04-02 at 13:59 -0700, Jos=C3=A9 Roberto de Souza wrote:
> > As explained in c1edee186d18 ("tests/frontbuffer_tracking: Do not
> > assert FBC state after a page flip changing stride") after changing
> > the plane stride there is the possibility that CFB will not be big
> > enough to keep FBC enabled, that is why do_assertions() is called
> > with DONT_ASSERT_FEATURE_STATUS but DONT_ASSERT_FEATURE_STATUS is
> > overkill and will not check the status of the other features like
> > PSR
> > and DRRS when running combined feature tests and possibly hiding
> > bugs.
> >=20
> > So lets add a new flag that will only not assert FBC.
>=20
> You are adding this flag to be only used in stridechange_subtest().
> But, is
> stride change even relevant for PSR and DRRS? I didn't think so.
> While harmless,
> I don't see any much value in asserting PSR and DRRS stay enabled.

I'm also not aware of any case that would prevent PSR or DRRS to be
enabled but that is why we have the tests, to catch missing details
from spec, regressions and bugs.

Without this change we are not testing the other features states in
this tests:

fbcpsr-stridechange
fbcdrrs-stridechange
fbcpsrdrrs-stridechange

>=20
>=20
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_frontbuffer_tracking.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tests/kms_frontbuffer_tracking.c
> > b/tests/kms_frontbuffer_tracking.c
> > index caef6755..ee13b138 100644
> > --- a/tests/kms_frontbuffer_tracking.c
> > +++ b/tests/kms_frontbuffer_tracking.c
> > @@ -1509,6 +1509,7 @@ static void do_flush(const struct test_mode
> > *t)
> > =20
> >  #define DONT_ASSERT_CRC			(1 << 0)
> >  #define DONT_ASSERT_FEATURE_STATUS	(1 << 1)
> > +#define DONT_ASSERT_FBC_STATUS		(1 << 12)
> > =20
> >  #define FBC_ASSERT_FLAGS		(0xF << 2)
> >  #define ASSERT_FBC_ENABLED		(1 << 2)
> > @@ -1539,7 +1540,7 @@ static int adjust_assertion_flags(const
> > struct test_mode
> > *t, int flags)
> >  			flags |=3D ASSERT_DRRS_HIGH;
> >  	}
> > =20
> > -	if ((t->feature & FEATURE_FBC) =3D=3D 0)
> > +	if ((t->feature & FEATURE_FBC) =3D=3D 0 || (flags &
> > DONT_ASSERT_FBC_STATUS))
> >  		flags &=3D ~FBC_ASSERT_FLAGS;
> >  	if ((t->feature & FEATURE_PSR) =3D=3D 0)
> >  		flags &=3D ~PSR_ASSERT_FLAGS;
> > @@ -2910,7 +2911,7 @@ static void stridechange_subtest(const struct
> > test_mode
> > *t)
> >  	fill_fb_region(&params->primary, COLOR_PRIM_BG);
> > =20
> >  	set_mode_for_params(params);
> > -	do_assertions(DONT_ASSERT_FEATURE_STATUS);
> > +	do_assertions(DONT_ASSERT_FBC_STATUS);
> > =20
> >  	/* Go back to the fb that can have FBC. */
> >  	params->primary.fb =3D old_fb;
> > @@ -2920,7 +2921,7 @@ static void stridechange_subtest(const struct
> > test_mode
> > *t)
> >  	/* This operation is the same as above, but with the planes
> > API. */
> >  	params->primary.fb =3D new_fb;
> >  	set_prim_plane_for_params(params);
> > -	do_assertions(DONT_ASSERT_FEATURE_STATUS);
> > +	do_assertions(DONT_ASSERT_FBC_STATUS);
> > =20
> >  	params->primary.fb =3D old_fb;
> >  	set_prim_plane_for_params(params);
> > @@ -2932,7 +2933,7 @@ static void stridechange_subtest(const struct
> > test_mode
> > *t)
> >  	 */
> >  	rc =3D drmModePageFlip(drm.fd, drm.display.pipes[params-
> > >pipe].crtc_id,
> > new_fb->fb_id, 0, NULL);
> >  	igt_assert(rc =3D=3D -EINVAL || rc =3D=3D 0);
> > -	do_assertions(rc ? 0 : DONT_ASSERT_FEATURE_STATUS);
> > +	do_assertions(rc ? 0 : DONT_ASSERT_FBC_STATUS);
> >  }
> > =20
> >  /**

--=-cJiE4WEtz4Ba2V07pQzQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyj1vEACgkQVenbO/mO
WkkDZgf7BiSnkDFNZ7CJ6HwVvt7VHnuvwUPDSFmf8tum2e/cfhsCHWu1hV2NIxZB
6op+cPIUVwASVcGzR44PAVNkcdc8VdUMVKWyR+Ht6aEOcc+16PDetv0oxBrqjgQU
R8Yp1LBb8eJ6sLDnBEm8cKReWe+R9f7jgYwIKDaZy8ULotZHzeaIgzw6WgbQZeyK
yS/HpJ1CxRxmCszcYhbTFwCqIY2rnakv268y3/IAtLPBWbsbHMGZ50/gIQyU4JbH
aQV5EJXEcIXfuCF/3vHwyyZiS8JORKpWssV7DDoQrwjko3JPacbjgsKgwDg06RTk
Z1/tTpuPBJh/Tdr4KOoS0XysRA0myQ==
=xv0n
-----END PGP SIGNATURE-----

--=-cJiE4WEtz4Ba2V07pQzQ--

--===============0502043001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0502043001==--
