Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5386F06F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Dec 2018 19:53:10 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 13 Dec 2018 19:53:08 +0000
Message-ID: <dfb9b86533ce9b20415b378764daacf7645d73fc.camel@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
 <20181204230944.7753-2-jose.souza@intel.com>
 <bd07357c764996f11be4b7d266b6491ca11142d9.camel@intel.com>
In-Reply-To: <bd07357c764996f11be4b7d266b6491ca11142d9.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] tests: Share the code handling PSR
 debugfs parsing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0624830856=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0624830856==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-mSdYYfsvv/GYVpjBcIT+"

--=-mSdYYfsvv/GYVpjBcIT+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-12-11 at 15:06 -0800, Dhinakaran Pandiyan wrote:
> On Tue, 2018-12-04 at 15:09 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > The same code checking if sink supports PSR was spread into 3
> > tests,
> > better move it to lib and reuse.
> Agreed.
>=20
> > Also kms_fbcon_fbt was doing its own handling to wait for PSR to
> > get
> > enabled while it is already available in lib.
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c                    |  9 +++++++++
> >  lib/igt_psr.h                    |  1 +
> >  tests/kms_fbcon_fbt.c            | 26 ++------------------------
> >  tests/kms_frontbuffer_tracking.c |  8 +-------
> >  tests/kms_psr.c                  |  8 +-------
> >  5 files changed, 14 insertions(+), 38 deletions(-)
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index c7bc523c..d68f4b49 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -131,3 +131,12 @@ bool psr_disable(int debugfs_fd)
> >  {
> >  	return psr_set(debugfs_fd, false);
> >  }
> > +
> > +bool psr_supported(int debugfs_fd)
> psr_sink_support() in order to be descriptive about what support we
> are
> referring to.

Done

>=20
> > +{
> > +	char buf[PSR_STATUS_MAX_LEN];
> > +
> > +	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
> > +				sizeof(buf));
> > +	return strstr(buf, "Sink_Support: yes\n");
> > +}
> > diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> > index b9693822..a4fcf325 100644
> > --- a/lib/igt_psr.h
> > +++ b/lib/igt_psr.h
> > @@ -32,5 +32,6 @@ bool psr_wait_entry(int debugfs_fd);
> >  bool psr_wait_exit(int debugfs_fd);
> >  bool psr_enable(int debugfs_fd);
> >  bool psr_disable(int debugfs_fd);
> > +bool psr_supported(int debugfs_fd);
> > =20
> >  #endif
> > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > index 24d3ad90..32407709 100644
> > --- a/tests/kms_fbcon_fbt.c
> > +++ b/tests/kms_fbcon_fbt.c
> > @@ -168,19 +168,6 @@ static void set_mode_for_one_screen(struct
> > drm_info *drm, struct igt_fb *fb,
> >  	igt_assert_eq(rc, 0);
> >  }
> > =20
> > -static bool psr_supported_on_chipset(int debugfs_fd)
> > -{
> > -	char buf[256];
> > -	int ret;
> > -
> > -	ret =3D igt_debugfs_simple_read(debugfs_fd,
> > "i915_edp_psr_status",
> > -				      buf, sizeof(buf));
> > -	if (ret < 0)
> > -		return false;
> > -
> > -	return strstr(buf, "Sink_Support: yes\n");
> > -}
> > -
> >  static bool connector_can_psr(drmModeConnectorPtr connector)
> >  {
> >  	return (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP);
> > @@ -195,18 +182,9 @@ static void psr_print_status(int debugfs_fd)
> >  	igt_debug("PSR status: %s\n", buf);
> >  }
> > =20
> > -static bool psr_is_enabled(int debugfs_fd)
> > -{
> > -	char buf[256];
> > -
> > -	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
> > -				sizeof(buf));
> > -	return strstr(buf, "\nHW Enabled & Active bit: yes\n");
> > -}
> > -
> >  static bool psr_wait_until_enabled(int debugfs_fd)
> >  {
> > -	bool r =3D igt_wait(psr_is_enabled(debugfs_fd), 5000, 1);
> > +	bool r =3D psr_wait_entry(debugfs_fd);
> Please split this change.

Done and changing commit message from this patch

>=20
> > =20
> >  	psr_print_status(debugfs_fd);
> >  	return r;
> > @@ -239,7 +217,7 @@ struct feature {
> >  	.connector_possible_fn =3D connector_can_fbc,
> >  	.enable =3D fbc_modparam_enable,
> >  }, psr =3D {
> > -	.supported_on_chipset =3D psr_supported_on_chipset,
> > +	.supported_on_chipset =3D psr_supported,
> >  	.wait_until_enabled =3D psr_wait_until_enabled,
> >  	.connector_possible_fn =3D connector_can_psr,
> >  	.enable =3D psr_debugfs_enable,
> > diff --git a/tests/kms_frontbuffer_tracking.c
> > b/tests/kms_frontbuffer_tracking.c
> > index 276ef83c..c419557e 100644
> > --- a/tests/kms_frontbuffer_tracking.c
> > +++ b/tests/kms_frontbuffer_tracking.c
> > @@ -1419,13 +1419,7 @@ static void teardown_fbc(void)
> > =20
> >  static bool psr_sink_has_support(void)
> >  {
> > -	char buf[256];
> > -
> > -	debugfs_read("i915_edp_psr_status", buf);
> > -	if (*buf =3D=3D '\0') /* !HAS_PSR -> -ENODEV*/
> > -		return false;
> > -
> > -	return strstr(buf, "Sink_Support: yes\n");
> > +	return psr_supported(drm.debugfs);
> Suggest inlining at the only call site.

Done

>=20
> >  }
> > =20
> >  static void setup_psr(void)
> > diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> > index d00e552f..116fe409 100644
> > --- a/tests/kms_psr.c
> > +++ b/tests/kms_psr.c
> > @@ -191,13 +191,7 @@ static void fill_render(data_t *data, uint32_t
> > handle, unsigned char color)
> > =20
> >  static bool sink_support(data_t *data)
> >  {
> > -	char buf[512];
> > -
> > -	igt_debugfs_simple_read(data->debugfs_fd,
> > "i915_edp_psr_status",
> > -			 buf, sizeof(buf));
> > -
> > -	return data->with_psr_disabled ||
> > -		strstr(buf, "Sink_Support: yes\n");
> > +	return data->with_psr_disabled || psr_supported(data-
> > > debugfs_fd);
> >  }
> > =20
> >  static bool psr_wait_entry_if_enabled(data_t *data)

--=-mSdYYfsvv/GYVpjBcIT+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlwSuKEACgkQVenbO/mO
WknK0wf9FYtcdW/GdnIr6z76+s8F/o9awrSpeRljQnNejywVrs8qO4rufUhVBf0K
rBEnVS3FxN20Ev12loKEpSnRofqjb0rmhljxN1RfRP13auSk3BKfns8gua2TXNkr
J6qynv3bXtKI9Wpk0MY/mc5QgCynR7FwFm4IcLoa7ncCu3Rxh/fv1XDfJM9iL44w
n/pRGJuphF1EKE2jUlS/u/Iji2B/+H8NRyMxRTMPI8vIg23GDKNqbd6z1Gy0hWvY
LnFt+R9DCdcaGhuDoiyI5fse/crA2hJp6qhNEdOMnP6P9dIyknp4LHeFdnLfYmLA
Sd3eezoqoov6LNLiGhQl4c8WtzLguQ==
=ZUWS
-----END PGP SIGNATURE-----

--=-mSdYYfsvv/GYVpjBcIT+--

--===============0624830856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0624830856==--
