Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3826F4C7
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 01:12:24 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 11 Jan 2019 01:12:21 +0000
Message-ID: <84e2114d118e294af5801df0882a3b7e762f63d5.camel@intel.com>
References: <20190103143641.20200-1-jose.souza@intel.com>
 <20190103143641.20200-7-jose.souza@intel.com>
 <1b8b803eb063c3754a086f0796d19d696363f7f6.camel@intel.com>
In-Reply-To: <1b8b803eb063c3754a086f0796d19d696363f7f6.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 7/9] tests/psr: Add the same test
 coverage that we have for PSR1 to PSR2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0879313452=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0879313452==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-3aK5/w5JymhdizyWGmCq"

--=-3aK5/w5JymhdizyWGmCq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-01-10 at 15:52 -0800, Dhinakaran Pandiyan wrote:
> On Thu, 2019-01-03 at 06:36 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > The main tests for PSR1 check if hardware tracking is detecting
> > changes in planes when modifing it in different ways and now
> > those tests will also run for PSR2 if supported by source and sink.
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_psr.c | 112
> > +++++++++++++++++++++++++++++++++++++++++++++-
> > --
> >  1 file changed, 105 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> > index 855679b0..d4d38320 100644
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
> > @@ -71,6 +72,7 @@ typedef struct {
> >  	drmModeModeInfo *mode;
> >  	igt_output_t *output;
> >  	bool with_psr_disabled;
> > +	bool supports_psr2;
> >  } data_t;
> > =20
> >  static void create_cursor_fb(data_t *data)
> > @@ -194,12 +196,22 @@ static bool sink_support(data_t *data)
> >  	return data->with_psr_disabled || psr_sink_support(data-
> > > debugfs_fd);
> >  }
> > =20
> > -static bool psr_wait_entry_if_enabled(data_t *data)
> > +static bool sink_support_psr2(data_t *data)
> >  {
> > -	if (data->with_psr_disabled)
> > -		return true;
> > +	return data->with_psr_disabled || psr2_sink_support(data-
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
> > +		if (data->with_psr_disabled)
> > +			return true;
> > +		return psr2_wait_deep_sleep(data->debugfs_fd);
> > +	}
> >  }
>=20
> Unless I am missing something, we can simplify all these changes by
> pushing the PSR mode down through the call chain.
>=20
> =20
> -static bool psr_active(int debugfs_fd, bool check_active)
> +static bool psr_active(int debugfs_fd, enum psr_mode mode, bool
> check_active)
>  {

I added the PSR2 functions with other names to avoid any
misinterpretation as PSR2 could be active in deep sleep state and doing
selective update and in the states between and in the kms_psr2_su we
need to check both states to properly test.
=20
I'm okay in adding the PSR mode to enable(), disable(), sink_support()
and reuse the internal functions too but in the other functions the
code saved is not worth. What do you think DK?

>         bool active;
>         char buf[PSR_STATUS_MAX_LEN];
> +       char *s =3D mode =3D=3D PSR_MODE_2 ? "DEEP_SLEEP" ? "SRDENT";
> =20
>         igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
> buf,
>                                 sizeof(buf));
>         active =3D strstr(buf, "HW Enabled & Active bit: yes\n") &&
> -               (strstr(buf, "SRDENT") || strstr(buf, "SLEEP"));
> +                strstr(buf, s);
>         return check_active ? active : !active;
>  }
> =20
> -bool psr_wait_entry(int debugfs_fd)
> +bool psr_wait_entry(int debugfs_fd, int psr_mode)
>  {
> -       return igt_wait(psr_active(debugfs_fd, true), 500, 20);
> +       return igt_wait(psr_active(debugfs_fd, true, psr_mode), 500,
> 20);
>  }
> =20
> -bool psr_wait_exit(int debugfs_fd)
> +bool psr_wait_exit(int debugfs_fd, int psr_mode)
>  {
>         return igt_wait(psr_active(debugfs_fd, false), 40, 10);
>  }
> diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> index 855679b0..bb90b994 100644
> --- a/tests/kms_psr.c
> +++ b/tests/kms_psr.c
> @@ -199,7 +199,7 @@ static bool psr_wait_entry_if_enabled(data_t
> *data)
>         if (data->with_psr_disabled)
>                 return true;
> =20
> -       return psr_wait_entry(data->debugfs_fd);
> +       return psr_wait_entry(data->debugfs_fd, data->psr_mode);
>  }
> =20
>  static inline void manual(const char *expected)
> @@ -289,7 +289,7 @@ static void run_test(data_t *data)
>                 expected =3D "screen GREEN";
>                 break;
>         }
> -       igt_assert(psr_wait_exit(data->debugfs_fd));
> +       igt_assert(psr_wait_exit(data->debugfs_fd, data->psr_mode));
>         manual(expected);
>  }
>=20
>=20
>=20
> > =20
> >  static inline void manual(const char *expected)
> > @@ -289,11 +301,16 @@ static void run_test(data_t *data)
> >  		expected =3D "screen GREEN";
> >  		break;
> >  	}
> > -	igt_assert(psr_wait_exit(data->debugfs_fd));
> > +
> > +	if (!data->op_psr2)
> > +		igt_assert(psr_wait_exit(data->debugfs_fd));
> > +	else
> > +		igt_assert(psr2_wait_update(data->debugfs_fd));
> >  	manual(expected);
> >  }
> > =20
> > -static void test_cleanup(data_t *data) {
> > +static void test_cleanup(data_t *data)
> > +{
> >  	igt_plane_t *primary;
> > =20
> >  	primary =3D igt_output_get_plane_type(data->output,
> > @@ -304,6 +321,11 @@ static void test_cleanup(data_t *data) {
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
> > @@ -311,6 +333,11 @@ static void setup_test_plane(data_t *data, int
> > test_plane)
> >  	uint32_t white_h, white_v;
> >  	igt_plane_t *primary, *sprite, *cursor;
> > =20
> > +	if (data->op_psr2 && !data->with_psr_disabled) {
> > +		igt_require(data->supports_psr2);
> > +		psr2_enable(data->debugfs_fd);
> > +	}
> > +
> >  	igt_create_color_fb(data->drm_fd,
> >  			    data->mode->hdisplay, data->mode->vdisplay,
> >  			    DRM_FORMAT_XRGB8888,
> > @@ -391,7 +418,7 @@ static int opt_handler(int opt, int opt_index,
> > void *_data)
> >  int main(int argc, char *argv[])
> >  {
> >  	const char *help_str =3D
> > -	       "  --no-psr\tRun test without PSR.";
> > +	       "  --no-psr\tRun test without PSR/PSR2.\n";
> >  	static struct option long_options[] =3D {
> >  		{"no-psr", 0, 0, 'n'},
> >  		{ 0, 0, 0, 0 }
> > @@ -414,6 +441,7 @@ int main(int argc, char *argv[])
> > =20
> >  		igt_require_f(sink_support(&data),
> >  			      "Sink does not support PSR\n");
> > +		data.supports_psr2 =3D sink_support_psr2(&data);
> > =20
> >  		data.bufmgr =3D drm_intel_bufmgr_gem_init(data.drm_fd,
> > 4096);
> >  		igt_assert(data.bufmgr);
> > @@ -428,6 +456,13 @@ int main(int argc, char *argv[])
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
> > @@ -435,6 +470,14 @@ int main(int argc, char *argv[])
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
> > @@ -445,6 +488,17 @@ int main(int argc, char *argv[])
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
> > @@ -455,6 +509,17 @@ int main(int argc, char *argv[])
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
> > @@ -465,6 +530,17 @@ int main(int argc, char *argv[])
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
> > @@ -474,6 +550,16 @@ int main(int argc, char *argv[])
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
> > @@ -485,6 +571,18 @@ int main(int argc, char *argv[])
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
> >  	igt_fixture {
> >  		if (!data.with_psr_disabled)
> >  			psr_disable(data.debugfs_fd);

--=-3aK5/w5JymhdizyWGmCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw37XQACgkQVenbO/mO
WkkNngf+IKY/epjAPtjYHwRcjjPjrfzWsF+LOl4xitqdVCGaCD9M70y1Jm9Z25u0
Ki7xAsITxXIofADX9EP0CsLrz3m5V5bW1H7+4KcTM/pFM5kiRknHFS0PFD8A0AaN
dOskC+S4v9yVC0E9fWETl1jfgbFP0wOE/M0uovSULKv2IBnQckozaKf5iKrBwJLe
2KaD1colYPrJG2bJAYyLW87Cb8cznJC55qIBbu3onBsCs/fOJhEx82ZiFM34Ygsg
flBciUv0X1sKnkD0OgHg0HzPjg8VoAUm29VVxCFBvh3XYRmO6K+neUoz2ExH5Z08
6a13p9yM5NF6tcFgyYu4vGCWC3somg==
=CDsu
-----END PGP SIGNATURE-----

--=-3aK5/w5JymhdizyWGmCq--

--===============0879313452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0879313452==--
