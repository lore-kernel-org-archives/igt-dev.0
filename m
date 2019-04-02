Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BEA6E4BB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 19:47:37 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 2 Apr 2019 19:47:35 +0000
Message-ID: <b0bcbb0809c6e804159c19a09a519e2d40abafca.camel@intel.com>
References: <20190328222827.18099-1-jose.souza@intel.com>
 <20190328222827.18099-2-jose.souza@intel.com>
 <b69af2b37aa12ee8831ea5ab5a2b6bd943d8f727.camel@intel.com>
In-Reply-To: <b69af2b37aa12ee8831ea5ab5a2b6bd943d8f727.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/frontbuffer_tracking: Assert
 the status of other features on stridechange subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1458408454=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1458408454==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-5zhB1uWPo8Z2mwE7dTEY"

--=-5zhB1uWPo8Z2mwE7dTEY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-02 at 12:26 -0700, Dhinakaran Pandiyan wrote:
> On Thu, 2019-03-28 at 15:28 -0700, Jos=C3=A9 Roberto de Souza wrote:
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
> >=20
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_frontbuffer_tracking.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tests/kms_frontbuffer_tracking.c
> > b/tests/kms_frontbuffer_tracking.c
> > index 087fc473..0dcde097 100644
> > --- a/tests/kms_frontbuffer_tracking.c
> > +++ b/tests/kms_frontbuffer_tracking.c
> > @@ -1527,6 +1527,7 @@ static void do_flush(const struct test_mode
> > *t)
> > =20
> >  #define DONT_ASSERT_CRC			(1 << 0)
> >  #define DONT_ASSERT_FEATURE_STATUS	(1 << 1)
> > +#define DONT_ASSERT_FBC_STATUS		(1 << 12)
> > =20
> >  #define FBC_ASSERT_FLAGS		(0xF << 2)
> >  #define ASSERT_FBC_ENABLED		(1 << 2)
> > @@ -1557,7 +1558,7 @@ static int adjust_assertion_flags(const
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
> > @@ -2928,7 +2929,7 @@ static void stridechange_subtest(const struct
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
> > @@ -2938,7 +2939,7 @@ static void stridechange_subtest(const struct
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
> > @@ -2950,7 +2951,7 @@ static void stridechange_subtest(const struct
> > test_mode
> > *t)
> >  	 */
> >  	rc =3D drmModePageFlip(drm.fd, drm.display.pipes[params-
> > >pipe].crtc_id,
> > new_fb->fb_id, 0, NULL);
> >  	igt_assert(rc =3D=3D -EINVAL || rc =3D=3D 0);
> > -	do_assertions(DONT_ASSERT_FEATURE_STATUS);
> > +	do_assertions(DONT_ASSERT_FBC_STATUS);
>=20
> Isn't this the same as
> (DONT_ASSERT_FEATURE_STATUS || ASSERT_PSR_ENABLED ||
> ASSERT_DRRS_HIGH)?

This would work as ASSERT_PSR_ENABLED and ASSERT_DRRS_HIGH would be
cleared when running this test without this features but have
DONT_ASSERT_FEATURE_STATUS with ASSERT_PSR_ENABLED and ASSERT_DRRS_HIGH
is contradictory to each other.

>=20
> Explicit about what features are asserted but is verbose.
>=20
> > =20
> >  /**

--=-5zhB1uWPo8Z2mwE7dTEY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyjvFYACgkQVenbO/mO
WkmpQAf7BFOOwPwAHjSzuD5IMBhkT2opIOSfjz3MjWnfIqil2pmk+YP3RxLvfNIv
Yw6PrX3Ay8muCF5XkftqwpQLk4+/YAVUOyM4+ys4Lxjf9R+Ewq+5AThPjnwMnd3J
/ssDUE7RkRG1Yc8iQPsd5ym37UPJ8MQB9SyliqJ5dnd6GA66waJR8M9GQ3z1prAn
dWOXsPCrX0VCjzTW50moGdkNORqp8GN+nQYGc3oNvQAYA4z0cKpvnru+xoeAUwUn
WKnAzC3gZvHqOfs76DNdMEMH5eWYStS2WrybTPRALowPh2slF6o3NxrRN0ZIW5/W
u7qfmkVhh0+gjXUtmmQsB/80vlgxmQ==
=/A05
-----END PGP SIGNATURE-----

--=-5zhB1uWPo8Z2mwE7dTEY--

--===============1458408454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1458408454==--
