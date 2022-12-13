Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914B110E1BE
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 11:39:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id g14so2980979ljh.10
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 03:39:38 -0800 (PST)
Date: Tue, 13 Dec 2022 13:39:22 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Message-ID: <20221213133922.0e98c219@eldfell>
In-Reply-To: <20221212192425.387971-2-harry.wentland@amd.com>
References: <20221212192425.387971-1-harry.wentland@amd.com>
 <20221212192425.387971-2-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.EaCQRVdGJ4O1Z.VpTa7C8.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_hdr: Add test for output
 Colorspace
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>, igt-dev@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/.EaCQRVdGJ4O1Z.VpTa7C8.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Dec 2022 14:24:24 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> The drm_connector Colorspace property needs a test.
> This adds a Colorspace switch test, similar to the
> bpc switch.
>=20
> Currently this will only work on amdgpu. Other drivers
> will need to provide a debugfs to readback the currently
> set Colorspace in order to pass the test.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Hung <Alex.Hung@amd.com>
> ---
>  lib/igt_kms.c   |  51 +++++++++++++++++
>  lib/igt_kms.h   |   6 ++
>  tests/kms_hdr.c | 143 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 200 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b4a98ae176e1..15fe49b3f55c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -640,6 +640,7 @@ const char * const igt_connector_prop_names[IGT_NUM_C=
ONNECTOR_PROPS] =3D {
>  	[IGT_CONNECTOR_LINK_STATUS] =3D "link-status",
>  	[IGT_CONNECTOR_MAX_BPC] =3D "max bpc",
>  	[IGT_CONNECTOR_HDR_OUTPUT_METADATA] =3D "HDR_OUTPUT_METADATA",
> +	[IGT_CONNECTOR_COLORSPACE] =3D "Colorspace",
>  	[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS] =3D "WRITEBACK_PIXEL_FORMATS",
>  	[IGT_CONNECTOR_WRITEBACK_FB_ID] =3D "WRITEBACK_FB_ID",
>  	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] =3D "WRITEBACK_OUT_FENCE_PTR",
> @@ -2272,6 +2273,10 @@ static void igt_output_reset(igt_output_t *output)
>  		igt_output_set_prop_value(output,
>  					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
> =20
> +	if (igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
> +		igt_output_set_prop_enum(output,
> +					  IGT_CONNECTOR_COLORSPACE, "Default");
> +
>  	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID))
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, 0);
>  	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR))=
 {
> @@ -2296,6 +2301,7 @@ static void igt_output_reset(igt_output_t *output)
>   * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
>   *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
>   *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
> + *   %IGT_CONNECTOR_COLORSPACE (if applicable)
>   * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
>   * - igt_output_override_mode() to default.
>   *
> @@ -5801,6 +5807,51 @@ bool igt_check_output_bpc_equal(int drmfd, enum pi=
pe pipe,
>  	return (current =3D=3D bpc);
>  }
> =20
> +
> +/*
> + * igt_get_pipe_current_colorspace:
> + * @drmfd: A drm file descriptor
> + * @pipe: Display pipe
> + *
> + * Returns: The current colorspace from the crtc debugfs.
> + */
> +void igt_get_pipe_current_colorspace(int drmfd, enum pipe pipe,
> +				     char *colorspace, int size)
> +{
> +	char debugfs_name[30];
> +	int fd, res;
> +
> +	fd =3D igt_debugfs_pipe_dir(drmfd, pipe, O_RDONLY);
> +	igt_assert(fd >=3D 0);
> +
> +	/* TODO add support for other drivers */
> +	if (is_amdgpu_device(drmfd))
> +		strcpy(debugfs_name, "amdgpu_current_colorspace");
> +
> +	res =3D igt_debugfs_simple_read(fd, debugfs_name, colorspace, size);
> +	igt_require(res > 0);
> +
> +	close(fd);
> +}
> +
> +/*
> + * igt_assert_output_bpc_equal:
> + * @drmfd: A drm file descriptor
> + * @pipe: Display pipe
> + * @output_name: Name of the libdrm connector we're going to use
> + * @bpc: BPC to compare with max & current bpc
> + *
> + * Assert if crtc's current bpc is not matched with the requested one.

Hi,

forgot to rewrite the doc comment.


> + */
> +void igt_assert_output_colorspace_equal(int drmfd, enum pipe pipe,
> +					const char *colorspace)
> +{
> +	char buf[35];
> +
> +	igt_get_pipe_current_colorspace(drmfd, pipe, buf, sizeof(buf));
> +	igt_assert(strcmp(colorspace, buf) =3D=3D 0);
> +}
> +
>  /*
>   * igt_max_bpc_constraint
>   * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 7a00d204545e..136292929fab 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -152,6 +152,7 @@ enum igt_atomic_connector_properties {
>         IGT_CONNECTOR_LINK_STATUS,
>         IGT_CONNECTOR_MAX_BPC,
>         IGT_CONNECTOR_HDR_OUTPUT_METADATA,
> +       IGT_CONNECTOR_COLORSPACE,
>         IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS,
>         IGT_CONNECTOR_WRITEBACK_FB_ID,
>         IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
> @@ -991,6 +992,11 @@ void igt_assert_output_bpc_equal(int drmfd, enum pip=
e pipe,
>  bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>  				char *output_name, unsigned int bpc);
> =20
> +void igt_get_pipe_current_colorspace(int drmfd, enum pipe pipe,
> +				     char *colorspace, int size);
> +void igt_assert_output_colorspace_equal(int drmfd, enum pipe pipe,
> +					const char *colorspace);
> +
>  int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
>  int sort_drm_modes_by_clk_asc(const void *a, const void *b);
>  int sort_drm_modes_by_res_dsc(const void *a, const void *b);
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 655c3e14f7ef..b656dc7a7ed5 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -244,6 +244,145 @@ static void test_bpc_switch(data_t *data, uint32_t =
flags)
>  	}
>  }
> =20
> +/*
> + * List of all DP and HDMI colorspaces from drm_connector.c
> + *
> + * We purposely omit "Default" since driver behavior varies
> + * and there is no good way to test for it.
> + */
> +static const char *colorspaces[] =3D {
> +	/* Standard Definition Colorimetry based on CEA 861 */
> +	"SMPTE_170M_YCC",
> +	"BT709_YCC",
> +	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> +	"XVYCC_601",
> +	/* High Definition Colorimetry based on IEC 61966-2-4 */
> +	"XVYCC_709",
> +	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
> +	"SYCC_601",
> +	/* Colorimetry based on IEC 61966-2-5 [33] */
> +	"opYCC_601",
> +	/* Colorimetry based on IEC 61966-2-5 */
> +	"opRGB",
> +	/* Colorimetry based on ITU-R BT.2020 */
> +	"BT2020_CYCC",
> +	/* Colorimetry based on ITU-R BT.2020 */
> +	"BT2020_RGB",
> +	/* Colorimetry based on ITU-R BT.2020 */
> +	"BT2020_YCC",
> +	/* Added as part of Additional Colorimetry Extension in 861.G */
> +	"DCI-P3_RGB_D65",
> +	"DCI-P3_RGB_Theater",
> +	/* For Default case, driver will set the colorspace */
> +	"RGB_Wide_Gamut_Fixed_Point",

What default case?

> +	/* Colorimetry based on scRGB (IEC 61966-2-2) */
> +	"RGB_Wide_Gamut_Floating_Point",
> +	"BT601_YCC",
> +	NULL
> +};
> +
> +/* Prints the colorspace name on the framebuffer */
> +static void draw_colorspace(igt_fb_t *fb, const char* colorspace)
> +{
> +	cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> +
> +	igt_paint_color(cr, 0, 0, fb->width, 50, 1.0, 1.0, 1.0);
> +	cairo_move_to(cr, fb->width / 2, 20);
> +	cairo_set_font_size(cr, 12);
> +	igt_cairo_printf_line(cr, align_hcenter, 0, "%s", colorspace);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +
> +static void test_colorspace_switch_on_output(data_t *data, enum pipe pip=
e,
> +				      igt_output_t *output,
> +				      uint32_t flags)
> +{
> +	igt_display_t *display =3D &data->display;
> +	// igt_crc_t ref_crc, new_crc;
> +	igt_fb_t afb;
> +	int afb_id, ret;
> +
> +	/* 10-bit formats are slow, so limit the size. */
> +	afb_id =3D igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0,=
 &afb);
> +	igt_assert(afb_id);
> +
> +	draw_hdr_pattern(&afb);
> +
> +	/* Plane may be required to fit fullscreen. Check it here and allow
> +	 * smaller plane size in following tests.
> +	 */

I don't understand the code here. Is there some kind of assumption that
the hardware is always capable of scaling a 512x512 FB to whatever CRTC
size is?

I would have expected to see an allocation of FB with CRTC size.


Thanks,
pq

> +	igt_plane_set_fb(data->primary, &afb);
> +	igt_plane_set_size(data->primary, data->w, data->h);
> +	ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONL=
Y, NULL);
> +	if (!ret) {
> +		data->w =3D afb.width;
> +		data->h =3D afb.height;
> +	}
> +
> +	/* require Colorspace prop */
> +	igt_require(igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE));
> +
> +	/* Get enum values for colorspace */
> +	/* for each value set colorspace */
> +	for (int i =3D 0; colorspaces[i]; i++) {
> +		if (igt_output_try_prop_enum(output, IGT_CONNECTOR_COLORSPACE, colorsp=
aces[i])) {
> +			igt_info("Testing colorspace %s on %s\n",
> +				 colorspaces[i],
> +				 igt_output_name(output));
> +			draw_colorspace(&afb, colorspaces[i]);
> +			igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, colorspace=
s[i]);
> +			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NUL=
L);
> +			/* get and check current colorspace */
> +			igt_assert_output_colorspace_equal(data->fd, pipe, colorspaces[i]);
> +		}
> +	}
> +
> +	igt_info("Testing bad colorspace on %s\n",
> +			igt_output_name(output));
> +	draw_colorspace(&afb, "bad");
> +	igt_require(!igt_output_try_prop_enum(output, IGT_CONNECTOR_COLORSPACE,=
 "bad"));
> +
> +	/* revert back to "Default" */
> +	igt_info("Testing colorspace %s on %s\n",
> +			"Default",
> +			igt_output_name(output));
> +	draw_colorspace(&afb, "Default");
> +	igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, "Default");
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	test_fini(data);
> +	igt_remove_fb(data->fd, &afb);
> +}
> +
> +static void test_colorspace_switch(data_t *data, uint32_t flags)
> +{
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output;
> +
> +	for_each_connected_output(display, output) {
> +		enum pipe pipe;
> +
> +		for_each_pipe(display, pipe) {
> +			if (igt_pipe_connector_valid(pipe, output)) {
> +				prepare_test(data, output, pipe);
> +
> +				data->mode =3D igt_output_get_mode(output);
> +				data->w =3D data->mode->hdisplay;
> +				data->h =3D data->mode->vdisplay;
> +
> +				igt_dynamic_f("pipe-%s-%s",
> +					      kmstest_pipe_name(pipe), output->name)
> +					test_colorspace_switch_on_output(data, pipe, output, flags);
> +
> +				/* One pipe is enough */
> +				break;
> +			}
> +		}
> +	}
> +}
> +
>  static bool cta_block(const char *edid_ext)
>  {
>  	/*
> @@ -599,6 +738,10 @@ igt_main
>  	igt_subtest_with_dynamic("bpc-switch-suspend")
>  		test_bpc_switch(&data, TEST_SUSPEND);
> =20
> +	igt_describe("Tests switching Colorspace property, .i.e., the display c=
olorimetry");
> +	igt_subtest_with_dynamic("colorspace-switch")
> +		test_colorspace_switch(&data, TEST_NONE);
> +
>  	igt_describe("Tests entering and exiting HDR mode");
>  	igt_subtest_with_dynamic("static-toggle")
>  		test_hdr(&data, TEST_NONE);


--Sig_/.EaCQRVdGJ4O1Z.VpTa7C8.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOYZGoACgkQI1/ltBGq
qqf1uA/+Mg71nQ8GKRfUh2p2tjYrvPoGssBqEbQCtfak1OijYCb7iDUL2DMHaB0D
/HfJdRwYFgMhg+d41dqmf66RX1V/17+GizgKsyGgLtyXiIOMFmsHccnqL0GvmOJX
ChQEcTBXNQuaLaDXAsXSsOkIJbaCDKU38cEgpNMHU5nlZoe6GE7Y689s1A/Oqj/b
bB5UPpQc0nGQMAlXeqmwQL+5RuGob3+5AMGG6OtRcC+hxxOxeGGNLuxXa5uhWH4q
dIFBLofPIor8KextvL0QV2X5p8SLCOcGNQmtyE0D/sm+1QeUs0+JJvuLPQL9Wiu8
7KP5TCX+qRkS5xGAW8z3+DTzAG4/asOFw78HPhZ8TzD9YcmsJk1bWLi1S9MRgt1E
aCMnzN5Hcfjn/h0Nsk2Wm9t9PJcQbv1HWE9TBBj5fvzENelaiDUxegeHfmbUhfCd
sBKvkp8sLtPzFeIC0LsPswrjS4WsjEveGZJKYS90MfZaqWL69gn0eDZfLtxedubH
4zZ6kDRsgDpluDNdzi42SxZrhQhT2k4hn+3qnT6bb/Dc5DYt17pGzKxgwXToOlfI
H6SDZlUjfpOdnH7CkwGV4+7vr41a7d5edOCVN8FQ5o74uWvMFbUeZr99++Sw96qy
QtfuLap2DdoXjsjCLVR5DNGQvH6kD0g//GqW8A4Ci09YCSWLMvA=
=u4NF
-----END PGP SIGNATURE-----

--Sig_/.EaCQRVdGJ4O1Z.VpTa7C8.--
