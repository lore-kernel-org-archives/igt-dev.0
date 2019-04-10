Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CC38940E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 21:07:51 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 10 Apr 2019 21:07:50 +0000
Message-ID: <009dca13e6b2203bf38785792bd0a63bf1aca98a.camel@intel.com>
References: <20190327200331.28602-1-jose.souza@intel.com>
 <20190327200331.28602-7-jose.souza@intel.com>
 <3fb5a106-f71c-c904-30b4-cd11d98067de@linux.intel.com>
In-Reply-To: <3fb5a106-f71c-c904-30b4-cd11d98067de@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 7/8] tests/fbcon_fbt: Do not try to
 open the same driver twice as master
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1320569062=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1320569062==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-pg5TuSLdBDgiK6fnof/b"

--=-pg5TuSLdBDgiK6fnof/b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-09 at 19:55 +0200, Maarten Lankhorst wrote:
> Op 27-03-2019 om 21:03 schreef Jos=C3=A9 Roberto de Souza:
> > If a subtest fail before the teardown_drm() call it will keep the
> > driver open as master causing the test to fail when trying to open
> > the driver again as master, so lets share the drm_info struct and
> > check if driver is already open.
> >=20
> > Starting subtest: psr
> > (kms_fbcon_fbt:5270) CRITICAL: Test assertion failure function
> > subtest, file ../tests/kms_fbcon_fbt.c:259:
> > (kms_fbcon_fbt:5270) CRITICAL: Failed assertion: feature-
> > >wait_until_update(drm.debugfs_fd)
> > Stack trace:
> >   #0 ../lib/igt_core.c:1474 __igt_fail_assert()
> >   #1 ../tests/kms_fbcon_fbt.c:261 subtest()
> >   #2 ../tests/kms_fbcon_fbt.c:316 __real_main309()
> >   #3 ../tests/kms_fbcon_fbt.c:309 main()
> >   #4 ../csu/libc-start.c:325 __libc_start_main()
> >   #5 [_start+0x29]
> >   #6 [<unknown>+0x0]
> > Subtest psr failed.
> > **** DEBUG ****
> > (kms_fbcon_fbt:5270) drmtest-DEBUG: Test requirement passed:
> > !(fd<0)
> > (kms_fbcon_fbt:5270) igt_debugfs-DEBUG: Opening debugfs directory
> > '/sys/kernel/debug/dri/1'
> > (kms_fbcon_fbt:5270) DEBUG: Test requirement passed: drm->res
> > (kms_fbcon_fbt:5270) igt_kms-DEBUG: VT: graphics mode set (mode was
> > 0x0)
> > (kms_fbcon_fbt:5270) DEBUG: Test requirement passed: feature-
> > >supported_on_chipset(drm.debugfs_fd)
> > (kms_fbcon_fbt:5270) CRITICAL: Test assertion failure function
> > subtest, file ../tests/kms_fbcon_fbt.c:259:
> > (kms_fbcon_fbt:5270) CRITICAL: Failed assertion: feature-
> > >wait_until_update(drm.debugfs_fd)
> > (kms_fbcon_fbt:5270) igt_core-INFO: Stack trace:
> > (kms_fbcon_fbt:5270) igt_core-INFO:   #0 ../lib/igt_core.c:1474
> > __igt_fail_assert()
> > (kms_fbcon_fbt:5270) igt_core-INFO:   #1
> > ../tests/kms_fbcon_fbt.c:261 subtest()
> > (kms_fbcon_fbt:5270) igt_core-INFO:   #2
> > ../tests/kms_fbcon_fbt.c:316 __real_main309()
> > (kms_fbcon_fbt:5270) igt_core-INFO:   #3
> > ../tests/kms_fbcon_fbt.c:309 main()
> > (kms_fbcon_fbt:5270) igt_core-INFO:   #4 ../csu/libc-start.c:325
> > __libc_start_main()
> > (kms_fbcon_fbt:5270) igt_core-INFO:   #5 [_start+0x29]
> > (kms_fbcon_fbt:5270) igt_core-INFO:   #6 [<unknown>+0x0]
> > ****  END  ****
> > Subtest psr: FAIL (0.845s)
> > Starting subtest: fbc-suspend
> > Test requirement not met in function igt_device_set_master, file
> > ../lib/igt_device.c:55:
> > Test requirement: __igt_device_set_master(fd) =3D=3D 0
> > Can't become DRM master, please check if no other DRM client is
> > running.
> > Subtest fbc-suspend: SKIP (0.001s)
> > Starting subtest: psr-suspend
> > Test requirement not met in function igt_device_set_master, file
> > ../lib/igt_device.c:55:
> > Test requirement: __igt_device_set_master(fd) =3D=3D 0
> > Can't become DRM master, please check if no other DRM client is
> > running.
> > Subtest psr-suspend: SKIP (0.000s)
> >=20
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_fbcon_fbt.c | 55 +++++++++++++++++++++++++------------
> > ------
> >  1 file changed, 32 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > index 2f158e2f..66f214c5 100644
> > --- a/tests/kms_fbcon_fbt.c
> > +++ b/tests/kms_fbcon_fbt.c
> > @@ -60,6 +60,9 @@ static void setup_drm(struct drm_info *drm)
> >  {
> >  	int i;
> > =20
> > +	if (drm->fd >=3D 0)
> > +		return;
> > +
> >  	drm->fd =3D drm_open_driver_master(DRIVER_INTEL);
> >  	drm->debugfs_fd =3D igt_debugfs_dir(drm->fd);
> > =20
> > @@ -85,6 +88,7 @@ static void teardown_drm(struct drm_info *drm)
> > =20
> >  	drmModeFreeResources(drm->res);
> >  	igt_assert(close(drm->fd) =3D=3D 0);
> > +	drm->fd =3D -1;
> >  }
> > =20
> >  static bool fbc_supported_on_chipset(int debugfs_fd)
> > @@ -242,51 +246,50 @@ struct feature {
> >  	.enable =3D psr_debugfs_enable,
> >  };
> > =20
> > -static void subtest(struct feature *feature, bool suspend)
> > +static void subtest(struct drm_info *drm, struct feature *feature,
> > bool suspend)
> >  {
> > -	struct drm_info drm;
> >  	struct igt_fb fb;
> > =20
> > -	setup_drm(&drm);
> > +	setup_drm(drm);
> > =20
> > -	igt_require(feature->supported_on_chipset(drm.debugfs_fd));
> > +	igt_require(feature->supported_on_chipset(drm->debugfs_fd));
> > =20
> > -	disable_features(drm.debugfs_fd);
> > -	feature->enable(drm.debugfs_fd);
> > +	disable_features(drm->debugfs_fd);
> > +	feature->enable(drm->debugfs_fd);
> > =20
> > -	kmstest_unset_all_crtcs(drm.fd, drm.res);
> > +	kmstest_unset_all_crtcs(drm->fd, drm->res);
> >  	wait_user("Modes unset.");
> > -	igt_assert(feature->wait_until_update(drm.debugfs_fd));
> > +	igt_assert(feature->wait_until_update(drm->debugfs_fd));
> > =20
> > -	set_mode_for_one_screen(&drm, &fb, feature-
> > >connector_possible_fn);
> > +	set_mode_for_one_screen(drm, &fb, feature-
> > >connector_possible_fn);
> >  	wait_user("Screen set.");
> > -	igt_assert(feature->wait_until_enabled(drm.debugfs_fd));
> > +	igt_assert(feature->wait_until_enabled(drm->debugfs_fd));
> > =20
> >  	if (suspend) {
> >  		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> >  					      SUSPEND_TEST_NONE);
> >  		sleep(5);
> > -		igt_assert(feature-
> > >wait_until_enabled(drm.debugfs_fd));
> > +		igt_assert(feature->wait_until_enabled(drm-
> > >debugfs_fd));
> >  	}
> > =20
> > -	igt_remove_fb(drm.fd, &fb);
> > -	teardown_drm(&drm);
> > +	igt_remove_fb(drm->fd, &fb);
> > +	teardown_drm(drm);
> > =20
> >  	/* Wait for fbcon to restore itself. */
> >  	sleep(3);
> > =20
> >  	wait_user("Back to fbcon.");
> > -	igt_assert(feature->wait_until_update(drm.debugfs_fd));
> > +	igt_assert(feature->wait_until_update(drm->debugfs_fd));
> > =20
> >  	if (suspend) {
> >  		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> >  					      SUSPEND_TEST_NONE);
> >  		sleep(5);
> > -		igt_assert(feature->wait_until_update(drm.debugfs_fd));
> > +		igt_assert(feature->wait_until_update(drm-
> > >debugfs_fd));
> >  	}
> >  }
> > =20
> > -static void setup_environment(void)
> > +static void setup_environment(struct drm_info *drm)
> >  {
> >  	int drm_fd;
> > =20
> > @@ -300,26 +303,32 @@ static void setup_environment(void)
> >  	 */
> >  	bind_fbcon(true);
> >  	fbcon_blink_enable(true);
> > +
> > +	drm->fd =3D -1;
> >  }
> > =20
> > -static void teardown_environment(void)
> > +static void teardown_environment(struct drm_info *drm)
> >  {
> > +	if (drm->fd >=3D 0)
> > +		teardown_drm(drm);
> >  }
> > =20
> >  igt_main
> >  {
> > +	struct drm_info drm =3D {};
> drm =3D { .fd =3D -1 }; ?

Thanks

> > +
> >  	igt_fixture
> > -		setup_environment();
> > +		setup_environment(&drm);
> > =20
> >  	igt_subtest("fbc")
> > -		subtest(&fbc, false);
> > +		subtest(&drm, &fbc, false);
> >  	igt_subtest("psr")
> > -		subtest(&psr, false);
> > +		subtest(&drm, &psr, false);
> >  	igt_subtest("fbc-suspend")
> > -		subtest(&fbc, true);
> > +		subtest(&drm, &fbc, true);
> >  	igt_subtest("psr-suspend")
> > -		subtest(&psr, true);
> > +		subtest(&drm, &psr, true);
> > =20
> >  	igt_fixture
> > -		teardown_environment();
> > +		teardown_environment(&drm);
> >  }
>=20
>=20

--=-pg5TuSLdBDgiK6fnof/b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyuWukACgkQVenbO/mO
WklcJwf7BxDBZlo7g6f+WcULkpQGjUcYeuCjqtGCH7kOC07ylC9FcT203aKzHEH+
EgKe9nV3dKCxpjV2UxI9gu7be3CIHBRXPYq+8WW4pIeTS+iSQDvaIii9kT009tRe
JR0jFtf/CD4gBJf0QL/B9fqb3Ur2EiQSDPC1IUy03Z4p7BGNH1DdDA0yEqtkZuDS
a7Av8ptu58Kruj2knf0DsIsH9slAW9sTk5y2tWpsZy9RsN3GGmhjdCfxhj7d1SlL
XjI9pqfMgk8J8BmCFUMvdb1FHrkzwJH8wI3ze1oi41C8xSmENRH0nmzsfmLotiNa
BWtey9IKSG9xtFhF4fmtq0ojBDYxcw==
=BizS
-----END PGP SIGNATURE-----

--=-pg5TuSLdBDgiK6fnof/b--

--===============1320569062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1320569062==--
