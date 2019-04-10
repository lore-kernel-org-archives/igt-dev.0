Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8838955D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 22:04:59 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 10 Apr 2019 22:04:57 +0000
Message-ID: <c4182f9ceb960f6dc1460425668c023eb4a25a10.camel@intel.com>
References: <20190327200331.28602-1-jose.souza@intel.com>
 <20190327200331.28602-3-jose.souza@intel.com>
 <7072ad27249640cedf321b6a851fd2a882572165.camel@intel.com>
 <d169656121aaa1fdb0450569ae59a90f31663c25.camel@intel.com>
 <C56C55B681623645A065C9EE352337D61A268BE4@ORSMSX109.amr.corp.intel.com>
In-Reply-To: <C56C55B681623645A065C9EE352337D61A268BE4@ORSMSX109.amr.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/8] tests/fbcon_fbt: Add
 wait_until_update() callback to features
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0323207859=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0323207859==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-1WhD92qipnkd2Raj2aVG"

--=-1WhD92qipnkd2Raj2aVG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-04-10 at 13:42 -0700, Pandiyan, Dhinakaran wrote:
> > -----Original Message-----
> > From: Souza, Jose
> > Sent: Wednesday, April 10, 2019 1:32 PM
> > To: igt-dev@lists.freedesktop.org; Pandiyan, Dhinakaran
> > <dhinakaran.pandiyan@intel.com>
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [igt-dev] [PATCH i-g-t v2 3/8] tests/fbcon_fbt: Add
> > wait_until_update() callback to features
> >=20
> > On Tue, 2019-04-09 at 14:41 -0700, Dhinakaran Pandiyan wrote:
> > > On Wed, 2019-03-27 at 13:03 -0700, Jos=C3=A9 Roberto de Souza wrote:
> > > > Lets be more explicit and add and implement a callback to check
> > > > if
> > > > feature had a state update, that is what some points of the
> > > > test
> > > > want to test.
> > > >=20
> > > > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > > > ---
> > > >  tests/kms_fbcon_fbt.c | 19 ++++++++++++++++---
> > > >  1 file changed, 16 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > > > index
> > > > a9d91839..9ab1d630 100644
> > > > --- a/tests/kms_fbcon_fbt.c
> > > > +++ b/tests/kms_fbcon_fbt.c
> > > > @@ -130,6 +130,11 @@ static bool fbc_wait_until_enabled(int
> > > > debugfs_fd)
> > > >  	return r;
> > > >  }
> > > >=20
> > > > +static bool fbc_wait_until_update(int debugfs) {
> > > > +	return !fbc_wait_until_enabled(debugfs); }
> > > > +
> > > >  typedef bool (*connector_possible_fn)(drmModeConnectorPtr
> > > > connector);
> > > >=20
> > > >  static void set_mode_for_one_screen(struct drm_info *drm,
> > > > struct
> > > > igt_fb *fb, @@ -196,6 +201,11 @@ static bool
> > > > psr_supported_on_chipset(int
> > > > debugfs_fd)
> > > >  	return psr_sink_support(debugfs_fd, PSR_MODE_1);  }
> > > >=20
> > > > +static bool psr_wait_until_update(int debugfs_fd) {
> > > > +	return !psr_wait_until_enabled(debugfs_fd);
> > > > +}
> > > > +
> > > >  static void disable_features(int debugfs_fd)  {
> > > >  	igt_set_module_param_int("enable_fbc", 0); @@ -215,16
> > > > +225,19
> > @@
> > > > static inline void psr_debugfs_enable(int
> > > > debugfs_fd)
> > > >  struct feature {
> > > >  	bool (*supported_on_chipset)(int debugfs_fd);
> > > >  	bool (*wait_until_enabled)(int debugfs_fd);
> > > > +	bool (*wait_until_update)(int debugfs_fd);
> > > >  	bool (*connector_possible_fn)(drmModeConnectorPtr
> > > > connector);
> > > >  	void (*enable)(int debugfs_fd);
> > > >  } fbc =3D {
> > > >  	.supported_on_chipset =3D fbc_supported_on_chipset,
> > > >  	.wait_until_enabled =3D fbc_wait_until_enabled,
> > > > +	.wait_until_update =3D fbc_wait_until_update,
> > > >  	.connector_possible_fn =3D connector_can_fbc,
> > > >  	.enable =3D fbc_modparam_enable,
> > > >  }, psr =3D {
> > > >  	.supported_on_chipset =3D psr_supported_on_chipset,
> > > >  	.wait_until_enabled =3D psr_wait_until_enabled,
> > > > +	.wait_until_update =3D psr_wait_until_update,
> > > >  	.connector_possible_fn =3D connector_can_psr,
> > > >  	.enable =3D psr_debugfs_enable,
> > > >  };
> > > > @@ -243,7 +256,7 @@ static void subtest(struct feature
> > > > *feature,
> > > > bool suspend)
> > > >=20
> > > >  	kmstest_unset_all_crtcs(drm.fd, drm.res);
> > > >  	wait_user("Modes unset.");
> > > > -	igt_assert(!feature-
> > > > >wait_until_enabled(drm.debugfs_fd));
> > > > +	igt_assert(feature->wait_until_update(drm.debugfs_fd));
> > > I believe the intention here is to test if PSR and FBC got
> > > disabled
> > > when pipes are disabled.
> >=20
> > Yeah, here pipes will be disable so all the features, so here
> > should we
> > keep: igt_assert(!feature->wait_until_enabled(drm.debugfs_fd));
> Yup.
>=20
> > > >  	set_mode_for_one_screen(&drm, &fb, feature-
> > > > > connector_possible_fn);
> > > >  	wait_user("Screen set.");
> > > > @@ -263,13 +276,13 @@ static void subtest(struct feature
> > > > *feature,
> > > > bool
> > > > suspend)
> > > >  	sleep(3);
> > > >=20
> > > >  	wait_user("Back to fbcon.");
> > > > -	igt_assert(!feature-
> > > > >wait_until_enabled(drm.debugfs_fd));
> > > > +	igt_assert(feature->wait_until_update(drm.debugfs_fd));
> > > >=20
> > > And here, I believe the expectation is that fbcon leads to
> > > frontbuffer
> > > invalidate and thus disabling PSR and FBC.
> >=20
> > It will disable PSR while doing the full modeset but in fbcon PSR
> > will be
> > enabled between cursor blinks, that is why we need to check for
> > update
> > here.
> >=20
> I understand, I have seen that myself. Not sure at what point it
> changed from
> fbcon completely disabling PSR and FBC with frontbuffer_invalidate()
> to the current
> behavior. iirc we just get frontbuffer_flush() now. TBH, I don't
> understand fbcon that
> well.
>=20
> What's the origin value in frontbuffer_invalidate/flush()? Do we get
> flips for=20
> cursor blinks? Or is it a fronbuffer_invalidate() followed by a
> frontbuffer_flush()?

Origin is =3D 4(ORIGIN_DIRTYFB) and it is only intel_psr_flush() calls so
we just poke cursor registers to force a PSR exit.

>=20
> -DK
>=20
> > > >  	if (suspend) {
> > > >  		igt_system_suspend_autoresume(SUSPEND_STATE_MEM
> > > > ,
> > > >  					      SUSPEND_TEST_NONE
> > > > );
> > > >  		sleep(5);
> > > > -		igt_assert(!feature-
> > > > > wait_until_enabled(drm.debugfs_fd));
> > > > +		igt_assert(feature-
> > > > >wait_until_update(drm.debugfs_fd));
> > > >  	}
> > > >  }
> > > >=20

--=-1WhD92qipnkd2Raj2aVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyuaIMACgkQVenbO/mO
WknMrggAqSY1Jf72C4eED0fBme60H3w5kXb2IvLCks9tTgy63Gf1HqgVEdbAEaKO
yGekd/mcPwCes9XxD2dJGo+LRWcQXdHK8aBXarIx/ZR9pocUiDvuSriMaJ/+qfT6
PJ1OJ8kfSKOX46/vD/MOcz/mmY3ydVYpculv0WlApNjL3odB9mbUE0PG3eToO9Wj
P9IvAUFuJlzclbOb3i5MiufAZV0Pf+vkQYWkUQ6XBMag8776mI1DLXy2ZZAEj2uK
aZlfg9a6pz3DbIiOFRhAhCKDJkia5YYmN2BgplKZrFaXFOnspcbSxLWmzopyGZJK
489zMmUACr+l0KTzcKNSBfhXTlthpw==
=akcz
-----END PGP SIGNATURE-----

--=-1WhD92qipnkd2Raj2aVG--

--===============0323207859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0323207859==--
