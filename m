Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3906E066
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 21:43:33 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 17 Jan 2019 21:43:31 +0000
Message-ID: <d8ac76bb30c656a9b20783c186b4f333faa62d00.camel@intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
 <20190112014607.13446-10-jose.souza@intel.com>
 <d647571565b99ec07e4a72d3f90e9c573cc6284b.camel@intel.com>
In-Reply-To: <d647571565b99ec07e4a72d3f90e9c573cc6284b.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 10/10] tests/psr: Add the same test
 coverage that we have for PSR1 to PSR2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1281989845=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1281989845==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-BaynPgMRuRj9KWpC8sd8"

--=-BaynPgMRuRj9KWpC8sd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-01-15 at 22:44 -0800, Dhinakaran Pandiyan wrote:
> On Fri, 2019-01-11 at 17:46 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > The main tests for PSR1 check if hardware tracking is detecting
> > changes in planes when modifing it in different ways and now
> > those tests will also run for PSR2 if supported by source and sink.
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_psr.c | 119 ++++++++++++++++++++++++++++++++++++++++++++
> > ----
> >  1 file changed, 110 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> > index 8f2ef89c..b2202cd3 100644
> > --- a/tests/kms_psr.c
> > +++ b/tests/kms_psr.c
> > @@ -61,6 +61,7 @@ typedef struct {
> >  	int debugfs_fd;
> >  	enum operations op;
> >  	int test_plane_id;
> > +	enum psr_mode op_psr_mode;
> >  	uint32_t devid;
> >  	uint32_t crtc_id;
> >  	igt_display_t display;
> > @@ -72,6 +73,7 @@ typedef struct {
> >  	drmModeModeInfo *mode;
> >  	igt_output_t *output;
> >  	bool with_psr_disabled;
> > +	bool supports_psr2;
> >  } data_t;
> > =20
> >  static void create_cursor_fb(data_t *data)
> > @@ -190,10 +192,10 @@ static void fill_render(data_t *data,
> > uint32_t
> > handle, unsigned char color)
> >  	gem_bo_busy(data->drm_fd, handle);
> >  }
> > =20
> > -static bool sink_support(data_t *data)
> > +static bool sink_support(data_t *data, enum psr_mode mode)
> >  {
> >  	return data->with_psr_disabled ||
> > -	       psr_sink_support(data->debugfs_fd, PSR_MODE_1);
> > +	       psr_sink_support(data->debugfs_fd, mode);
> >  }
> > =20
> >  static bool psr_wait_entry_if_enabled(data_t *data)
> > @@ -201,7 +203,23 @@ static bool psr_wait_entry_if_enabled(data_t
> > *data)
> >  	if (data->with_psr_disabled)
> >  		return true;
> > =20
> > -	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1);
> > +	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode);
> > +}
> > +
> > +static bool psr_wait_update_if_enabled(data_t *data)
> > +{
> > +	if (data->with_psr_disabled)
> > +		return true;
> > +
> > +	return psr_wait_update(data->debugfs_fd, data->op_psr_mode);
> > +}
> > +
> > +static bool psr_enable_if_enabled(data_t *data)
> This function name is quite confusing. What do you think of using
> macros like this
>=20
> #define PSR_WAIT_ENTRY(data, mode)
> 	return data->with_psr_disabled || psr_wait_entry(data-
> > debugfs_fd, mode);
> ...


I'm happy with both approaches but I guess we can change that in a
patch on top of this one.

>=20
>=20
> > +{
> > +	if (data->with_psr_disabled)
> > +		return true;
> > +
> > +	return psr_enable(data->debugfs_fd, data->op_psr_mode);
> >  }
> > =20
> >  static inline void manual(const char *expected)
> > @@ -291,7 +309,7 @@ static void run_test(data_t *data)
> >  		expected =3D "screen GREEN";
> >  		break;
> >  	}
> > -	igt_assert(psr_wait_update(data->debugfs_fd, PSR_MODE_1));
> > +	igt_assert(psr_wait_update_if_enabled(data));
> >  	manual(expected);
> >  }
> > =20
> > @@ -369,6 +387,7 @@ static void setup_test_plane(data_t *data, int
> > test_plane)
> > =20
> >  static void test_setup(data_t *data)
> >  {
> > +	psr_enable_if_enabled(data);
> >  	setup_test_plane(data, data->test_plane_id);
> >  	igt_assert(psr_wait_entry_if_enabled(data));
> >  }
> > @@ -399,7 +418,7 @@ static int opt_handler(int opt, int opt_index,
> > void *_data)
> >  int main(int argc, char *argv[])
> >  {
> >  	const char *help_str =3D
> > -	       "  --no-psr\tRun test without PSR.";
> > +	       "  --no-psr\tRun test without PSR/PSR2.";
> >  	static struct option long_options[] =3D {
> >  		{"no-psr", 0, 0, 'n'},
> >  		{ 0, 0, 0, 0 }
> > @@ -417,12 +436,15 @@ int main(int argc, char *argv[])
> >  		kmstest_set_vt_graphics_mode();
> >  		data.devid =3D intel_get_drm_devid(data.drm_fd);
> > =20
> > -		if (!data.with_psr_disabled)
> > -			psr_enable(data.debugfs_fd, PSR_MODE_1);
> > -
> > -		igt_require_f(sink_support(&data),
> > +		igt_require_f(sink_support(&data, PSR_MODE_1),
> >  			      "Sink does not support PSR\n");
> > =20
> > +		if (sink_support(&data, PSR_MODE_2)) {
> > +			data.op_psr_mode =3D PSR_MODE_2;
> > +			psr_enable_if_enabled(&data);
> There is another enable in test_setup() that the PSR2 subtests call.
> Why do we need two?

Here I'm enabling by hand to check if source and sink support PSR2 so
data.supports_psr2 is set with the right value and we skip the PSR2
tests when not supported.


>=20
> > +			data.supports_psr2 =3D
> > psr_wait_entry_if_enabled(&data);
> > +		}
> > +
> >  		data.bufmgr =3D drm_intel_bufmgr_gem_init(data.drm_fd,
> > 4096);
> >  		igt_assert(data.bufmgr);
> >  		drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
> > @@ -431,12 +453,31 @@ int main(int argc, char *argv[])
> >  	}
> > =20
> >  	igt_subtest("basic") {
> > +		data.op_psr_mode =3D PSR_MODE_1;
> > +		data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> > +		test_setup(&data);
> > +		test_cleanup(&data);
> > +	}
> Run this in a loop (PSR_MODE_1...PSR_MODE_2) instead of repeating the
> same calls?=20

I think have separated tests is better because CI reports will show
what version of PSR has a regression, we can run specific tests while
debuging...

>=20
> > +
> > +	igt_subtest("psr2_basic") {
> > +		igt_require(data.supports_psr2);
> We don't have to generate this subtest if the sink does not support
> PSR2. kms_frontbuffer_tracking generates subtests dynamically, we can
> use the same approach here.
>=20
> > +		data.op_psr_mode =3D PSR_MODE_2;
> >  		data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> >  		test_setup(&data);
> >  		test_cleanup(&data);
> >  	}
> > =20
> >  	igt_subtest("no_drrs") {
> > +		data.op_psr_mode =3D PSR_MODE_1;
> > +		data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> > +		test_setup(&data);
> > +		igt_assert(drrs_disabled(&data));
> > +		test_cleanup(&data);
> > +	}
> > +
> > +	igt_subtest("psr2_no_drrs") {
> > +		igt_require(data.supports_psr2);
> > +		data.op_psr_mode =3D PSR_MODE_2;
> >  		data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> >  		test_setup(&data);
> >  		igt_assert(drrs_disabled(&data));
> > @@ -445,6 +486,17 @@ int main(int argc, char *argv[])
> > =20
> >  	for (op =3D PAGE_FLIP; op <=3D RENDER; op++) {
> >  		igt_subtest_f("primary_%s", op_str(op)) {
> > +			data.op_psr_mode =3D PSR_MODE_1;
> > +			data.op =3D op;
> > +			data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> > +			test_setup(&data);
> > +			run_test(&data);
> > +			test_cleanup(&data);
> > +		}
> > +
> > +		igt_subtest_f("psr2_primary_%s", op_str(op)) {
> > +			igt_require(data.supports_psr2);
> > +			data.op_psr_mode =3D PSR_MODE_2;
> >  			data.op =3D op;
> >  			data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> >  			test_setup(&data);
> > @@ -455,6 +507,18 @@ int main(int argc, char *argv[])
> > =20
> >  	for (op =3D MMAP_GTT; op <=3D PLANE_ONOFF; op++) {
> >  		igt_subtest_f("sprite_%s", op_str(op)) {
> > +			igt_require(data.supports_psr2);
> > +			data.op_psr_mode =3D PSR_MODE_1;
> > +			data.op =3D op;
> > +			data.test_plane_id =3D DRM_PLANE_TYPE_OVERLAY;
> > +			test_setup(&data);
> > +			run_test(&data);
> > +			test_cleanup(&data);
> > +		}
> > +
> > +		igt_subtest_f("psr2_sprite_%s", op_str(op)) {
> > +			igt_require(data.supports_psr2);
> > +			data.op_psr_mode =3D PSR_MODE_2;
> >  			data.op =3D op;
> >  			data.test_plane_id =3D DRM_PLANE_TYPE_OVERLAY;
> >  			test_setup(&data);
> > @@ -465,6 +529,17 @@ int main(int argc, char *argv[])
> > =20
> >  	for (op =3D MMAP_GTT; op <=3D PLANE_ONOFF; op++) {
> >  		igt_subtest_f("cursor_%s", op_str(op)) {
> > +			data.op_psr_mode =3D PSR_MODE_1;
> > +			data.op =3D op;
> > +			data.test_plane_id =3D DRM_PLANE_TYPE_CURSOR;
> > +			test_setup(&data);
> > +			run_test(&data);
> > +			test_cleanup(&data);
> > +		}
> > +
> > +		igt_subtest_f("psr2_cursor_%s", op_str(op)) {
> > +			igt_require(data.supports_psr2);
> > +			data.op_psr_mode =3D PSR_MODE_2;
> >  			data.op =3D op;
> >  			data.test_plane_id =3D DRM_PLANE_TYPE_CURSOR;
> >  			test_setup(&data);
> > @@ -474,6 +549,18 @@ int main(int argc, char *argv[])
> >  	}
> > =20
> >  	igt_subtest_f("dpms") {
> > +		data.op_psr_mode =3D PSR_MODE_1;
> > +		data.op =3D RENDER;
> > +		data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> > +		test_setup(&data);
> > +		dpms_off_on(&data);
> > +		run_test(&data);
> > +		test_cleanup(&data);
> > +	}
> > +
> > +	igt_subtest_f("psr2_dpms") {
> > +		igt_require(data.supports_psr2);
> > +		data.op_psr_mode =3D PSR_MODE_2;
> >  		data.op =3D RENDER;
> >  		data.test_plane_id =3D DRM_PLANE_TYPE_PRIMARY;
> >  		test_setup(&data);
> > @@ -483,6 +570,20 @@ int main(int argc, char *argv[])
> >  	}
> > =20
> >  	igt_subtest_f("suspend") {
> > +		data.op_psr_mode =3D PSR_MODE_1;
> > +		data.op =3D PLANE_ONOFF;
> > +		data.test_plane_id =3D DRM_PLANE_TYPE_CURSOR;
> > +		test_setup(&data);
> > +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > +					      SUSPEND_TEST_NONE);
> > +		igt_assert(psr_wait_entry_if_enabled(&data));
> > +		run_test(&data);
> > +		test_cleanup(&data);
> > +	}
> > +
> > +	igt_subtest_f("psr2_suspend") {
> > +		igt_require(data.supports_psr2);
> > +		data.op_psr_mode =3D PSR_MODE_2;
> >  		data.op =3D PLANE_ONOFF;
> >  		data.test_plane_id =3D DRM_PLANE_TYPE_CURSOR;
> >  		test_setup(&data);

--=-BaynPgMRuRj9KWpC8sd8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxA9wIACgkQVenbO/mO
Wkk4dQgApKtoartTI1SbN2UmF/RQXXDdoCNCnsmOj8EjInJgPCLc3+8H6BiIRb9N
3eWmG7CIXX/6+3csMqc67e+YRslUU53iaMKaaOSje5yIeFeODbjRbow2U38je0L4
t9jsor3bAnFbkbf+UGrfRIRQE9igO8Yt3SbmPTNj0siv183i/0yCdfYRF+CSCmiF
bdNxTIA20GKN0TsFOoeo0yVFinvRF7rd4UKqLs8XAqhERnGAohtp3Zg4uPDOq3e0
fsJ0PE201jzgaDJv5PxK9aQOuXQoabcrLXqbh7eOLpShW4ZvMbSRMIsmgUPBbnlA
gTwP5v80wKxOnejZn6B4XDo1xG5jPQ==
=qadH
-----END PGP SIGNATURE-----

--=-BaynPgMRuRj9KWpC8sd8--

--===============1281989845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1281989845==--
