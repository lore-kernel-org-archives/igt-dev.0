Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 18 Mar 2019 18:53:42 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190318215342.koavlq763wilvhum@smtp.gmail.com>
References: <20190316140023.b5gn44gtojoy6iqi@smtp.gmail.com>
 <20190318140108.GL3888@intel.com>
 <20190318213544.gge3iqu7bjrdyhj4@smtp.gmail.com>
 <155294512341.12148.398418988839038376@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <155294512341.12148.398418988839038376@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH V5 i-g-t] tests/kms_flip: Skip VBlank tests in
 modules without VBlank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1707470913=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1707470913==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="663wp2xyufoet5lm"
Content-Disposition: inline


--663wp2xyufoet5lm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/18, Chris Wilson wrote:
> Quoting Rodrigo Siqueira (2019-03-18 21:35:44)
> > On 03/18, Ville Syrj=E4l=E4 wrote:
> > > On Sat, Mar 16, 2019 at 11:00:23AM -0300, Rodrigo Siqueira wrote:
> > > > The kms_flip test relies on VBlank support, and this situation may
> > > > exclude some virtual drivers to take advantage of this set of tests.
> > > > This commit adds a mechanism that checks if a module has VBlank. If=
 the
> > > > target module has VBlank support, kms_flip will run all the VBlank
> > > > tests; otherwise, the VBlank tests will be skipped. Additionally, t=
his
> > > > commit improves the test coverage by checks if the function
> > > > drmWaitVBlank() returns EOPNOTSUPP (i.e., no VBlank support).
> > > >=20
> > > > V4: Replace DRM_VBLANK_ABSOLUTE by DRM_VBLANK_RELATIVE and
> > > > DRM_VBLANK_NEXTONMISS
> > > >=20
> > > > V3: Add documentation (Daniel Vetter)
> > > >=20
> > > > V2: Add new branch coverage to check if VBlank is enabled or not and
> > > > update commit message
> > > >=20
> > > > V1: Chris Wilson
> > > >   - Change function name from igt_there_is_vblank to kms_has_vblank
> > > >   - Move vblank function check from igt_aux to igt_kms
> > > >   - Utilizes memset in dummy_vbl variable
> > > >   - Directly return the result of drmWaitVBlank()
> > > >=20
> > > > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > ---
> > > >  lib/igt_kms.c    | 20 ++++++++++++++++++++
> > > >  lib/igt_kms.h    |  2 ++
> > > >  tests/kms_flip.c | 22 ++++++++++++++++++++++
> > > >  3 files changed, 44 insertions(+)
> > > >=20
> > > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > > > index e1eacc1e..1d2d7188 100644
> > > > --- a/lib/igt_kms.c
> > > > +++ b/lib/igt_kms.c
> > > > @@ -1655,6 +1655,26 @@ void igt_assert_plane_visible(int fd, enum p=
ipe pipe, bool visibility)
> > > >     igt_assert_eq(visible, visibility);
> > > >  }
> > > > =20
> > > > +/**
> > > > + * kms_has_vblank:
> > > > + * @fd: DRM fd
> > > > + *
> > > > + * Get the VBlank errno after an attempt to call drmWaitVBlank(). =
This
> > > > + * function is useful for checking if a driver has support or not =
for VBlank.
> > > > + *
> > > > + * Returns: true if target driver has VBlank support, otherwise re=
turn false.
> > > > + */
> > > > +bool kms_has_vblank(int fd)
> > > > +{
> > > > +   drmVBlank dummy_vbl;
> > > > +
> > > > +   memset(&dummy_vbl, 0, sizeof(drmVBlank));
> > > > +   dummy_vbl.request.type =3D DRM_VBLANK_RELATIVE | DRM_VBLANK_NEX=
TONMISS;
> > >=20
> > > Why the NEXTONMISS?
> >=20
> > I added this flag because I was suspecting that in case of any problem
> > during the kms_has_vblank() execution the flag NEXTONMISS will wait for
> > the next VBlank and avoid to generate problems in the subsequent tests.
>=20
> That is true, and a valid use for using NEXTONMISS if you want to align
> your code to the start of a vblank to avoid overrunning into the next
> vblank.
>=20
> However, that is not the purpose of kms_has_vblank()! Whose only purpose
> is answer the question of whether the device has vblank support, and so
> should be as quick and simple as possible, so the trivial query of the
> current vblank counter.

Nice! Thanks for your answer.

So, I suppose that use DRM_VBLANK_RELATIVE is enough for this case,
right?

> -Chris


--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--663wp2xyufoet5lm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyQE2YACgkQWJzP/com
vP+HFw//dvOkXXBb58VZ4Xjo5jDUILscRKiVmrwBwa6yHIe/Vm4pDH+LQ08RLOV8
mCT2krn4OBQlB7nmegRohK20sskXiO1mOV3LTAdQbFy3zSY2FRs4KVNiSL3jq9Dk
Ns0mlfjH1FqYNJTPYOgvvsJrvUurlWnEoae2stBQbQ6+A1Xxhu1/WdO0jTe3QX2h
L1rO5RhYPpbObcBHtZJZ7qJ1O2YCvGLnlA5FHBih+zq7/OrjvwV68L7rUk8houJB
VBqXFUpIB4u8pRBT5mXJt4FsIFfQbn+ac3DhfM5wdR0ToLQIT2zlNcr9vgR33L56
SZaDaBf5T4r96+E1WAkZWiZq021w8uutJMFWpAjZQWTcm3kRzWgULgjoln/pFyMw
Vz7q72tC8tYm9ifJDqaiZenQtByWPuYEYaCog9h75qhoBU1LhcbqAovZnGjYTE/U
m3jVq0yo5j0m8T9vHxBxfGt7awIbIwRzEMRQzzUD01QNMhhX/LhOspwJfCER668o
Fyv459qXBxVqIqEOGCPVgEu02LgonZrFFO1sqZMxWUeVJ9OWuYnYC7bHFdzZE19r
vzr/qT1NULzpW2i67SWHN+zgjbPc2g21xN5kUafM8voqAcTQisyC6UVDEcFLzMQc
+odK5PAk9kjtbw53jEgpxbuiuRbj/KEHgf2iyGYXHbqvtiEvPAk=
=+m9J
-----END PGP SIGNATURE-----

--663wp2xyufoet5lm--

--===============1707470913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1707470913==--
