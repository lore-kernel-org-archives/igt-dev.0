Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598246F075
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Dec 2018 19:55:59 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 13 Dec 2018 19:55:56 +0000
Message-ID: <4bade5516928106a1819f29ce70749b6d2c8ea93.camel@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
 <20181204230944.7753-6-jose.souza@intel.com>
 <4cb025e2311ccec6d00d101a5e61b73310840919.camel@intel.com>
In-Reply-To: <4cb025e2311ccec6d00d101a5e61b73310840919.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] tests/psr: Add the same test
 coverage that we have for PSR1 to PSR2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2077204343=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2077204343==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-ICrYDOSmp0xMfskMmWxX"

--=-ICrYDOSmp0xMfskMmWxX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-12-11 at 17:20 -0800, Dhinakaran Pandiyan wrote:
> On Tue, 2018-12-04 at 15:09 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > The main tests for PSR1 check if hardware tracking is detecting
> > changes in planes when modifing it in different ways and now
> > those tests will also run for PSR2 if supported by source and sink.
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_psr.c | 118
> > +++++++++++++++++++++++++++++++++++++++++++++-
> > --
> >  1 file changed, 111 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> > index 116fe409..d87b8ea1 100644
> > --- a/tests/kms_psr.c
> > +++ b/tests/kms_psr.c
> > @@ -60,6 +60,7 @@ typedef struct {
> >  	int drm_fd;
> >  	int debugfs_fd;
> >  	enum operations op;
> > +	bool op_psr2;
> >  	uint32_t devid;
> >  	uint32_t crtc_id;
> >  	igt_display_t display;
> > @@ -71,6 +72,8 @@ typedef struct {
> >  	drmModeModeInfo *mode;
> >  	igt_output_t *output;
> >  	bool with_psr_disabled;
> > +	bool with_psr2_disabled;
> Do we need this? Is there a use case running PSR2 tests with PSR1
> enabled?=20

Huum yeah, I will drop the with_psr2_disabled.

>=20
>=20
> > +	bool supports_psr2;
> >  } data_t;
> > =20
> >  static void create_cursor_fb(data_t *data)
> > @@ -194,12 +197,22 @@ static bool sink_support(data_t *data)
> >  	return data->with_psr_disabled || psr_supported(data-
> > > debugfs_fd);
> >  }
> > =20
> > -static bool psr_wait_entry_if_enabled(data_t *data)
> > +static bool sink_support_psr2(data_t *data)
> >  {
> > -	if (data->with_psr_disabled)
> > -		return true;
> > +	return data->with_psr2_disabled || psr2_supported(data-
> > > debugfs_fd);
> > +}
> > =20
> > -	return psr_wait_entry(data->debugfs_fd);
> > +static bool psr_wait_entry_if_enabled(data_t *data)
> > +{
> > +	if (!data->op_psr2) {
> > +		if (data->with_psr_disabled)
> > +			return true;
> > +		return psr_wait_entry(data->debugfs_fd);
> > +	} else {
> > +		if (data->with_psr2_disabled)
> > +			return true;
> > +		return psr2_wait_deep_sleep(data->debugfs_fd);
> > +	}
> >  }
> > =20
> >  static inline void manual(const char *expected)
> > @@ -289,11 +302,16 @@ static void run_test(data_t *data)
> >  		expected =3D "screen GREEN";
> >  		break;
> >  	}
> > -	igt_assert(psr_wait_exit(data->debugfs_fd));
> > +
> > +	if (!data->op_psr2)
> > +		igt_assert(psr_wait_exit(data->debugfs_fd));
> > +	else
> > +		igt_assert(psr2_wait_update(data->debugfs_fd));
> Move the PSR1/PSR2 logic inside psr_wait_exit() ?

Again I would like to keep psr and psr2 functions, it is more easy to
read.

>=20
> >  	manual(expected);
> >  }
> > =20
> > -static void test_cleanup(data_t *data) {
> > +static void test_cleanup(data_t *data)
> > +{
> >  	igt_plane_t *primary;
> > =20
> >  	primary =3D igt_output_get_plane_type(data->output,
> > @@ -304,6 +322,11 @@ static void test_cleanup(data_t *data) {
> > =20
> >  	igt_remove_fb(data->drm_fd, &data->fb_green);
> >  	igt_remove_fb(data->drm_fd, &data->fb_white);
> > +
> > +	/* switch to PSR1 again */
> > +	if (data->op_psr2 && !data->with_psr_disabled)
> > +		psr_enable(data->debugfs_fd);
> > +	data->op_psr2 =3D false;
> >  }
> > =20
> >  static void setup_test_plane(data_t *data, int test_plane)
> > @@ -311,6 +334,11 @@ static void setup_test_plane(data_t *data, int
> > test_plane)
> >  	uint32_t white_h, white_v;
> >  	igt_plane_t *primary, *sprite, *cursor;
> > =20
> > +	if (data->op_psr2 && !data->with_psr_disabled) {
> > +		igt_require(data->supports_psr2);//op_psr2 is set in
> > case this fails?
> > +		psr2_enable(data->debugfs_fd);
> > +	}
> > +
> >  	igt_create_color_fb(data->drm_fd,
> >  			    data->mode->hdisplay, data->mode->vdisplay,
> >  			    DRM_FORMAT_XRGB8888,
> > @@ -381,6 +409,9 @@ static int opt_handler(int opt, int opt_index,
> > void *_data)
> >  	case 'n':
> >  		data->with_psr_disabled =3D true;
> >  		break;
> > +	case 'm':
> > +		data->with_psr2_disabled =3D true;
> > +		break;
> >  	default:
> >  		igt_assert(0);
> >  	}
> > @@ -391,9 +422,11 @@ static int opt_handler(int opt, int opt_index,
> > void *_data)
> >  int main(int argc, char *argv[])
> >  {
> >  	const char *help_str =3D
> > -	       "  --no-psr\tRun test without PSR.";
> > +	       "  --no-psr\tRun test without PSR.\n"
> > +	       "  --no-psr2\tRun test without PSR2.";
> >  	static struct option long_options[] =3D {
> >  		{"no-psr", 0, 0, 'n'},
> > +		{"no-psr2", 0, 0, 'm'},
> >  		{ 0, 0, 0, 0 }
> >  	};
> >  	data_t data =3D {};
> > @@ -414,6 +447,7 @@ int main(int argc, char *argv[])
> > =20
> >  		igt_require_f(sink_support(&data),
> >  			      "Sink does not support PSR\n");
> > +		data.supports_psr2 =3D sink_support_psr2(&data);
> > =20
> >  		data.bufmgr =3D drm_intel_bufmgr_gem_init(data.drm_fd,
> > 4096);
> >  		igt_assert(data.bufmgr);
> > @@ -428,6 +462,13 @@ int main(int argc, char *argv[])
> >  		test_cleanup(&data);
> >  	}
> > =20
> > +	igt_subtest("psr2_basic") {
> > +		data.op_psr2 =3D true;
> > +		setup_test_plane(&data, DRM_PLANE_TYPE_PRIMARY);
> > +		igt_assert(psr_wait_entry_if_enabled(&data));
> > +		test_cleanup(&data);
> > +	}
> > +
> >  	igt_subtest("no_drrs") {
> >  		setup_test_plane(&data, DRM_PLANE_TYPE_PRIMARY);
> >  		igt_assert(psr_wait_entry_if_enabled(&data));
> > @@ -435,6 +476,14 @@ int main(int argc, char *argv[])
> >  		test_cleanup(&data);
> >  	}
> > =20
> > +	igt_subtest("psr2_no_drrs") {
> > +		data.op_psr2 =3D true;
> > +		setup_test_plane(&data, DRM_PLANE_TYPE_PRIMARY);
> > +		igt_assert(psr_wait_entry_if_enabled(&data));
> > +		igt_assert(drrs_disabled(&data));
> > +		test_cleanup(&data);
> > +	}
> > +
> >  	for (op =3D PAGE_FLIP; op <=3D RENDER; op++) {
> >  		igt_subtest_f("primary_%s", op_str(op)) {
> >  			data.op =3D op;
> > @@ -445,6 +494,17 @@ int main(int argc, char *argv[])
> >  		}
> >  	}
> > =20
> > +	for (op =3D PAGE_FLIP; op <=3D RENDER; op++) {
> > +		igt_subtest_f("psr2_primary_%s", op_str(op)) {
> > +			data.op_psr2 =3D true;
> > +			data.op =3D op;
> > +			setup_test_plane(&data,
> > DRM_PLANE_TYPE_PRIMARY);
> > +			igt_assert(psr_wait_entry_if_enabled(&data));
> > +			run_test(&data);
> > +			test_cleanup(&data);
> > +		}
> > +	}
> > +
> >  	for (op =3D MMAP_GTT; op <=3D PLANE_ONOFF; op++) {
> >  		igt_subtest_f("sprite_%s", op_str(op)) {
> >  			data.op =3D op;
> > @@ -455,6 +515,17 @@ int main(int argc, char *argv[])
> >  		}
> >  	}
> > =20
> > +	for (op =3D MMAP_GTT; op <=3D PLANE_ONOFF; op++) {
> > +		igt_subtest_f("psr2_sprite_%s", op_str(op)) {
> > +			data.op_psr2 =3D true;
> > +			data.op =3D op;
> > +			setup_test_plane(&data,
> > DRM_PLANE_TYPE_OVERLAY);
> > +			igt_assert(psr_wait_entry_if_enabled(&data));
> > +			run_test(&data);
> > +			test_cleanup(&data);
> > +		}
> > +	}
> > +
> >  	for (op =3D MMAP_GTT; op <=3D PLANE_ONOFF; op++) {
> >  		igt_subtest_f("cursor_%s", op_str(op)) {
> >  			data.op =3D op;
> > @@ -465,6 +536,17 @@ int main(int argc, char *argv[])
> >  		}
> >  	}
> > =20
> > +	for (op =3D MMAP_GTT; op <=3D PLANE_ONOFF; op++) {
> > +		igt_subtest_f("psr2_cursor_%s", op_str(op)) {
> > +			data.op_psr2 =3D true;
> > +			data.op =3D op;
> > +			setup_test_plane(&data, DRM_PLANE_TYPE_CURSOR);
> > +			igt_assert(psr_wait_entry_if_enabled(&data));
> > +			run_test(&data);
> > +			test_cleanup(&data);
> > +		}
> > +	}
> > +
> >  	igt_subtest_f("dpms") {
> >  		data.op =3D RENDER;
> >  		setup_test_plane(&data, DRM_PLANE_TYPE_PRIMARY);
> > @@ -474,6 +556,16 @@ int main(int argc, char *argv[])
> >  		test_cleanup(&data);
> >  	}
> > =20
> > +	igt_subtest_f("psr2_dpms") {
> > +		data.op_psr2 =3D true;
> > +		data.op =3D RENDER;
> > +		setup_test_plane(&data, DRM_PLANE_TYPE_PRIMARY);
> > +		igt_assert(psr_wait_entry_if_enabled(&data));
> > +		dpms_off_on(&data);
> > +		run_test(&data);
> > +		test_cleanup(&data);
> > +	}
> > +
> >  	igt_subtest_f("suspend") {
> >  		data.op =3D PLANE_ONOFF;
> >  		setup_test_plane(&data, DRM_PLANE_TYPE_CURSOR);
> > @@ -485,6 +577,18 @@ int main(int argc, char *argv[])
> >  		test_cleanup(&data);
> >  	}
> > =20
> > +	igt_subtest_f("psr2_suspend") {
> > +		data.op_psr2 =3D true;
> > +		data.op =3D PLANE_ONOFF;
> > +		setup_test_plane(&data, DRM_PLANE_TYPE_CURSOR);
> > +		igt_assert(psr_wait_entry_if_enabled(&data));
> > +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > +					      SUSPEND_TEST_NONE);
> > +		igt_assert(psr_wait_entry_if_enabled(&data));
> > +		run_test(&data);
> > +		test_cleanup(&data);
> > +	}
> > +
> How about using a loop to iterate PSR1 and PSR2 modes?

Having a test for PSR and PSR2 is better to keep track of bug and for
us to fix, so we know for sure in what PSR version it is failling.

> >  	igt_fixture {
> >  		if (!data.with_psr_disabled)
> >  			psr_disable(data.debugfs_fd);

--=-ICrYDOSmp0xMfskMmWxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlwSuUcACgkQVenbO/mO
Wkk2FggAtg2EE5ZRjR6XA38GpKInXFnNwsfzbLfXfkDrWe6KqXfYyH6PIIWVJuoK
MJ3xSkcFr+MhZSE6MI7gwaH6kLCsKBhSriw/6/8MXQZ7peAiChsiAM6ZtrB6laFj
6pWgY85La0zHrWOxYqQPmbTNiiqKdrLL6Oj4UMv6oRaprcaop3rEpzoBFoBLNwUQ
4z4nSKSrPPcD2W/TSbdwm2Irb8UeAelqFl5gp3PJBiuBG8/MN3jYb94WgvgVFtYl
PnCZpxiYq5Okx/tGciihJ4ZgpNmPh25Dfv3FvKkDgG7k0svwNXD+OD79PwWnaS/2
YsoBAfTQhtZpFZyrT+famCzzjj/w+A==
=lTQF
-----END PGP SIGNATURE-----

--=-ICrYDOSmp0xMfskMmWxX--

--===============2077204343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2077204343==--
