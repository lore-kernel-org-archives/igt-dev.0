Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 18 Mar 2019 18:35:44 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190318213544.gge3iqu7bjrdyhj4@smtp.gmail.com>
References: <20190316140023.b5gn44gtojoy6iqi@smtp.gmail.com>
 <20190318140108.GL3888@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190318140108.GL3888@intel.com>
Subject: Re: [igt-dev] [PATCH V5 i-g-t] tests/kms_flip: Skip VBlank tests in
 modules without VBlank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1021423897=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1021423897==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gcvpex4hefmpmgpu"
Content-Disposition: inline


--gcvpex4hefmpmgpu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/18, Ville Syrj=E4l=E4 wrote:
> On Sat, Mar 16, 2019 at 11:00:23AM -0300, Rodrigo Siqueira wrote:
> > The kms_flip test relies on VBlank support, and this situation may
> > exclude some virtual drivers to take advantage of this set of tests.
> > This commit adds a mechanism that checks if a module has VBlank. If the
> > target module has VBlank support, kms_flip will run all the VBlank
> > tests; otherwise, the VBlank tests will be skipped. Additionally, this
> > commit improves the test coverage by checks if the function
> > drmWaitVBlank() returns EOPNOTSUPP (i.e., no VBlank support).
> >=20
> > V4: Replace DRM_VBLANK_ABSOLUTE by DRM_VBLANK_RELATIVE and
> > DRM_VBLANK_NEXTONMISS
> >=20
> > V3: Add documentation (Daniel Vetter)
> >=20
> > V2: Add new branch coverage to check if VBlank is enabled or not and
> > update commit message
> >=20
> > V1: Chris Wilson
> >   - Change function name from igt_there_is_vblank to kms_has_vblank
> >   - Move vblank function check from igt_aux to igt_kms
> >   - Utilizes memset in dummy_vbl variable
> >   - Directly return the result of drmWaitVBlank()
> >=20
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  lib/igt_kms.c    | 20 ++++++++++++++++++++
> >  lib/igt_kms.h    |  2 ++
> >  tests/kms_flip.c | 22 ++++++++++++++++++++++
> >  3 files changed, 44 insertions(+)
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index e1eacc1e..1d2d7188 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -1655,6 +1655,26 @@ void igt_assert_plane_visible(int fd, enum pipe =
pipe, bool visibility)
> >  	igt_assert_eq(visible, visibility);
> >  }
> > =20
> > +/**
> > + * kms_has_vblank:
> > + * @fd: DRM fd
> > + *
> > + * Get the VBlank errno after an attempt to call drmWaitVBlank(). This
> > + * function is useful for checking if a driver has support or not for =
VBlank.
> > + *
> > + * Returns: true if target driver has VBlank support, otherwise return=
 false.
> > + */
> > +bool kms_has_vblank(int fd)
> > +{
> > +	drmVBlank dummy_vbl;
> > +
> > +	memset(&dummy_vbl, 0, sizeof(drmVBlank));
> > +	dummy_vbl.request.type =3D DRM_VBLANK_RELATIVE | DRM_VBLANK_NEXTONMIS=
S;
>=20
> Why the NEXTONMISS?

I added this flag because I was suspecting that in case of any problem
during the kms_has_vblank() execution the flag NEXTONMISS will wait for
the next VBlank and avoid to generate problems in the subsequent tests.
However, I was not 100% sure about this decision since this code will
only test the first if condition inside drm_wait_vblank_ioctl().
Additionally, I could not find a good way to test the drmWaitVBlank()
with and without this flag.

Please, correct if I'm wrong. I'm fighting to understand the vblank API.

Thanks for you review :)

> > +
> > +	drmWaitVBlank(fd, &dummy_vbl);
> > +	return (errno !=3D EOPNOTSUPP);
> > +}
> > +
> >  /*
> >   * A small modeset API
> >   */
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 407f3d64..1cc15eea 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -230,6 +230,8 @@ void kmstest_wait_for_pageflip(int fd);
> >  unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
> >  void igt_assert_plane_visible(int fd, enum pipe pipe, bool visibility);
> > =20
> > +bool kms_has_vblank(int fd);
> > +
> >  /*
> >   * A small modeset API
> >   */
> > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > index dfa5a69e..614efc5b 100755
> > --- a/tests/kms_flip.c
> > +++ b/tests/kms_flip.c
> > @@ -71,6 +71,7 @@
> >  #define TEST_SUSPEND		(1 << 26)
> >  #define TEST_BO_TOOBIG		(1 << 28)
> > =20
> > +#define TEST_NO_VBLANK		(1 << 29)
> >  #define TEST_BASIC		(1 << 30)
> > =20
> >  #define EVENT_FLIP		(1 << 0)
> > @@ -126,6 +127,18 @@ struct event_state {
> >  	int seq_step;
> >  };
> > =20
> > +static bool vblank_dependence(int flags)
> > +{
> > +	int vblank_flags =3D TEST_VBLANK | TEST_VBLANK_BLOCK |
> > +			   TEST_VBLANK_ABSOLUTE | TEST_VBLANK_EXPIRED_SEQ |
> > +			   TEST_CHECK_TS | TEST_VBLANK_RACE;
> > +
> > +	if (flags & vblank_flags)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  static float timeval_float(const struct timeval *tv)
> >  {
> >  	return tv->tv_sec + tv->tv_usec / 1000000.0f;
> > @@ -1177,6 +1190,7 @@ static void run_test_on_crtc_set(struct test_outp=
ut *o, int *crtc_idxs,
> >  	unsigned bo_size =3D 0;
> >  	uint64_t tiling;
> >  	int i;
> > +	int vblank =3D true;
> > =20
> >  	switch (crtc_count) {
> >  	case RUN_TEST:
> > @@ -1260,6 +1274,14 @@ static void run_test_on_crtc_set(struct test_out=
put *o, int *crtc_idxs,
> >  	}
> >  	igt_assert(fb_is_bound(o, o->fb_ids[0]));
> > =20
> > +	vblank =3D kms_has_vblank(drm_fd);
> > +	if (!vblank) {
> > +		if (vblank_dependence(o->flags))
> > +			igt_require_f(vblank, "There is no VBlank\n");
> > +		else
> > +			o->flags |=3D TEST_NO_VBLANK;
> > +	}
> > +
> >  	/* quiescent the hw a bit so ensure we don't miss a single frame */
> >  	if (o->flags & TEST_CHECK_TS)
> >  		calibrate_ts(o, crtc_idxs[0]);
> > --=20
> > 2.21.0
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
>=20
> --=20
> Ville Syrj=E4l=E4
> Intel

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--gcvpex4hefmpmgpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyQDzAACgkQWJzP/com
vP+bqBAAyYV5cmvsnDMihV8Vkqo1hyGf7+KCR2YiRqVmdjj431ufMZ7YlXSgubEN
QsI3N89/Dn4aYbaV8Ssj4SPr/tfOAVai9z8u5CCejqw1w0unHgR+p+UUrUrNSYL/
8V9mAXiZWjfZAfWw+gncP80dPr5QR2zkJVK3nrarzwdxWeJ2+1idA7WkXdAq4d0t
u3xXSkcDOykwr0jVz3VNbfvx47iYRFzy57+ofbRXnJdE72v15KC9gJ4lEZQPrHts
y06rX0jsbi7shLnHtk3KJ0oxKMfGe6BopwbbGBLmvMC5mZX9zG69wtjSrYI+SbIv
R3PtVueuKVdGacUflF11VFxf2zX3RVJQhk7eUHO/EtoUZJOlhPJztsP+X1xxKmCz
Z+thdzwJ/WuIyECk1T/Y7731S1hJnVL9TK8sTyrCJrCLuD/xS66ilUdXwxpEDJfV
eiAlAfjXdov2DFDZKNmCg9AiulAVgKVFNL16fn7Fth4fw/t11LFEdoZzv1gobXpM
Ub3mYKvBODIivee3UX4RPAxtBksjiYheKF2r1yMmVWbzYc7nh3BSrBcczUqlT3uI
8HwIGQMT6xRxtdY59tPcSbOzdn/5zeMv5Mm5p+PMQu7sllfRMUSTFVb0sJUvami9
yJqcWFz4qcdhqd+Fes40yg96qCf7jMWuhwZeE2xj4yncqBvwu1g=
=B0MM
-----END PGP SIGNATURE-----

--gcvpex4hefmpmgpu--

--===============1021423897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1021423897==--
