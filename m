Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1127010E031
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 11:24:50 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 16 Mar 2022 11:24:45 +0000
Message-ID: <4662021b163b417d9560af47504a8273@intel.com>
References: <20220316111503.417452-1-bhanuprakash.modem@intel.com>
 <20220316111503.417452-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220316111503.417452-3-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [v7 i-g-t 2/3] tests/kms_color: Add support for
 Deep-Color
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Wednesday, March 16, 2022 4:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: [v7 i-g-t 2/3] tests/kms_color: Add support for Deep-Color
>=20
> Add new subtests to validate deep color.
>=20
> V2:
> * i915 needs atleast gen 11 to support deep-color
> * Add connector name to dynamic subtest
> V3:
> * Fix the usage of "output"
> V4:
> * Set max_bpc prop to default before exiting the subtest
> * Minor cleanups

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c        | 107 ++++++++++++++++++++++++++++++---------
>  tests/kms_color_helper.c |   2 +-
>  tests/kms_color_helper.h |   2 +
>  3 files changed, 86 insertions(+), 25 deletions(-)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c index 854b8f3c31..afff=
174478
> 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -26,10 +26,10 @@
>=20
>  IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>=20
> -static void test_pipe_degamma(data_t *data,
> +static bool test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
>  {
> -	igt_output_t *output;
> +	igt_output_t *output =3D data->output;
>  	igt_display_t *display =3D &data->display;
>  	gamma_lut_t *degamma_linear, *degamma_full;
>  	color_t red_green_blue[] =3D {
> @@ -41,6 +41,7 @@ static void test_pipe_degamma(data_t *data,
>  	struct igt_fb fb_modeset, fb;
>  	igt_crc_t crc_fullgamma, crc_fullcolors;
>  	int fb_id, fb_modeset_id;
> +	bool ret;
>=20
>  	igt_require(igt_pipe_obj_has_prop(primary->pipe,
> IGT_CRTC_DEGAMMA_LUT));
>  	igt_require(igt_pipe_obj_has_prop(primary->pipe,
> IGT_CRTC_GAMMA_LUT)); @@ -48,9 +49,6 @@ static void
> test_pipe_degamma(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
>=20
> -	output =3D igt_get_single_output_for_pipe(&data->display, primary->pipe=
-
> >pipe);
> -	igt_require(output);
> -
>  	igt_output_set_pipe(output, primary->pipe->pipe);
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -58,7 +56,7 @@ static void test_pipe_degamma(data_t *data,
>  	fb_id =3D igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -66,7 +64,7 @@ static void test_pipe_degamma(data_t *data,
>  	fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -99,7 +97,7 @@ static void test_pipe_degamma(data_t *data,
>  	/* Verify that the CRC of the software computed output is
>  	 * equal to the CRC of the degamma LUT transformation output.
>  	 */
> -	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> +	ret =3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma,
> +&crc_fullcolors);
>=20
>  	disable_degamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> @@ -110,16 +108,18 @@ static void test_pipe_degamma(data_t *data,
>=20
>  	free_lut(degamma_linear);
>  	free_lut(degamma_full);
> +
> +	return ret;
>  }
>=20
>  /*
>   * Draw 3 gradient rectangles in red, green and blue, with a maxed out g=
amma
>   * LUT and verify we have the same CRC as drawing solid color rectangles=
.
>   */
> -static void test_pipe_gamma(data_t *data,
> +static bool test_pipe_gamma(data_t *data,
>  			    igt_plane_t *primary)
>  {
> -	igt_output_t *output;
> +	igt_output_t *output =3D data->output;
>  	igt_display_t *display =3D &data->display;
>  	gamma_lut_t *gamma_full;
>  	color_t red_green_blue[] =3D {
> @@ -131,14 +131,12 @@ static void test_pipe_gamma(data_t *data,
>  	struct igt_fb fb_modeset, fb;
>  	igt_crc_t crc_fullgamma, crc_fullcolors;
>  	int fb_id, fb_modeset_id;
> +	bool ret;
>=20
>  	igt_require(igt_pipe_obj_has_prop(primary->pipe,
> IGT_CRTC_GAMMA_LUT));
>=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20
> -	output =3D igt_get_single_output_for_pipe(&data->display, primary->pipe=
-
> >pipe);
> -	igt_require(output);
> -
>  	igt_output_set_pipe(output, primary->pipe->pipe);
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -146,7 +144,7 @@ static void test_pipe_gamma(data_t *data,
>  	fb_id =3D igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -154,7 +152,7 @@ static void test_pipe_gamma(data_t *data,
>  	fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -186,7 +184,7 @@ static void test_pipe_gamma(data_t *data,
>  	/* Verify that the CRC of the software computed output is
>  	 * equal to the CRC of the gamma LUT transformation output.
>  	 */
> -	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> +	ret =3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma,
> +&crc_fullcolors);
>=20
>  	disable_gamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> @@ -196,6 +194,8 @@ static void test_pipe_gamma(data_t *data,
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
>=20
>  	free_lut(gamma_full);
> +
> +	return ret;
>  }
>=20
>  /*
> @@ -439,7 +439,7 @@ static bool test_pipe_ctm(data_t *data,
>  		0.0, 0.0, 1.0
>  	};
>  	gamma_lut_t *degamma_linear, *gamma_linear;
> -	igt_output_t *output;
> +	igt_output_t *output =3D data->output;
>  	bool ret =3D true;
>  	igt_display_t *display =3D &data->display;
>  	drmModeModeInfo *mode;
> @@ -452,9 +452,6 @@ static bool test_pipe_ctm(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
>=20
> -	output =3D igt_get_single_output_for_pipe(&data->display, primary->pipe=
-
> >pipe);
> -	igt_require(output);
> -
>  	igt_output_set_pipe(output, primary->pipe->pipe);
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -462,7 +459,7 @@ static bool test_pipe_ctm(data_t *data,
>  	fb_id =3D igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -470,7 +467,7 @@ static bool test_pipe_ctm(data_t *data,
>  	fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -686,12 +683,15 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>=20
> INTEL_PIPE_CRC_SOURCE_AUTO);
>=20
>  		igt_display_require_output_on_pipe(&data->display, p);
> +		data->output =3D igt_get_single_output_for_pipe(&data->display, p);
> +		igt_require(data->output);
>  	}
>=20
>  	/* We assume an 8bits depth per color for degamma/gamma LUTs
>  	 * for CRC checks with framebuffer references. */
>  	data->color_depth =3D 8;
>  	delta =3D 1.0 / (1 << data->color_depth);
> +	data->drm_format =3D DRM_FORMAT_XRGB8888;
>=20
>  	igt_describe("Check the color transformation from red to blue");
>  	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) { @@ -
> 851,11 +851,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>=20
>  	igt_describe("Verify that degamma LUT transformation works correctly");
>  	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
> -		test_pipe_degamma(data, primary);
> +		igt_assert(test_pipe_degamma(data, primary));
>=20
>  	igt_describe("Verify that gamma LUT transformation works correctly");
>  	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
> -		test_pipe_gamma(data, primary);
> +		igt_assert(test_pipe_gamma(data, primary));
>=20
>  	igt_describe("Verify that legacy gamma LUT transformation works
> correctly");
>  	igt_subtest_f("pipe-%s-legacy-gamma", kmstest_pipe_name(p)) @@ -866,6
> +866,65 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>  	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
>  		test_pipe_legacy_gamma_reset(data, primary);
>=20
> +	igt_describe("Verify that deep color works correctly");
> +	igt_subtest_with_dynamic_f("pipe-%s-deep-color", kmstest_pipe_name(p)) =
{
> +		igt_output_t *output;
> +		color_t blue_green_blue[] =3D {
> +			{ 0.0, 0.0, 1.0 },
> +			{ 0.0, 1.0, 0.0 },
> +			{ 0.0, 0.0, 1.0 }
> +		};
> +		double ctm[] =3D { 0.0, 0.0, 0.0,
> +				0.0, 1.0, 0.0,
> +				1.0, 0.0, 1.0 };
> +
> +		if (is_i915_device(data->drm_fd))
> +			igt_require_f((intel_display_ver(data->devid) >=3D 11),
> +					"At least GEN 11 is required to validate
> Deep-color.\n");
> +
> +		for_each_valid_output_on_pipe(&data->display, p, output) {
> +			drmModeConnector *connector =3D output-
> >config.connector;
> +			uint64_t max_bpc =3D get_max_bpc(output);
> +			bool ret;
> +
> +			if (!max_bpc)
> +				continue;
> +
> +			if (!panel_supports_deep_color(data->drm_fd, connector))
> +				continue;
> +
> +			data->color_depth =3D 10;
> +			data->drm_format =3D DRM_FORMAT_XRGB2101010;
> +			data->output =3D output;
> +			igt_output_set_prop_value(output,
> IGT_CONNECTOR_MAX_BPC, 10);
> +
> +			igt_dynamic_f("gamma-%s", output->name) {
> +				ret =3D test_pipe_gamma(data, primary);
> +
> +				igt_output_set_prop_value(output,
> IGT_CONNECTOR_MAX_BPC, max_bpc);
> +				igt_assert(ret);
> +			}
> +
> +			igt_dynamic_f("degamma-%s", output->name) {
> +				ret =3D test_pipe_degamma(data, primary);
> +
> +				igt_output_set_prop_value(output,
> IGT_CONNECTOR_MAX_BPC, max_bpc);
> +				igt_assert(ret);
> +			}
> +
> +			igt_dynamic_f("ctm-%s", output->name) {
> +				ret =3D test_pipe_ctm(data, primary,
> +						    red_green_blue,
> +						    blue_green_blue, ctm);
> +
> +				igt_output_set_prop_value(output,
> IGT_CONNECTOR_MAX_BPC, max_bpc);
> +				igt_assert(ret);
> +			}
> +
> +			break;
> +		}
> +	}
> +
>  	igt_fixture {
>  		disable_degamma(primary->pipe);
>  		disable_gamma(primary->pipe);
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c index
> 3ea1c4bc9c..3ef124cdce 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -206,7 +206,7 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
>  	uint32_t mask;
>=20
>  	if (is_i915_device(data->drm_fd))
> -		mask =3D ((1 << color_depth) - 1) << 8;
> +		mask =3D ((1 << color_depth) - 1) << (16 - color_depth);
>  	else
>  		mask =3D max_value;
>=20
> diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h index
> 4c38def454..a6665b1fd6 100644
> --- a/tests/kms_color_helper.h
> +++ b/tests/kms_color_helper.h
> @@ -49,7 +49,9 @@ typedef struct {
>  	uint32_t devid;
>  	igt_display_t display;
>  	igt_pipe_crc_t *pipe_crc;
> +	igt_output_t *output;
>=20
> +	uint32_t drm_format;
>  	uint32_t color_depth;
>  	uint64_t degamma_lut_size;
>  	uint64_t gamma_lut_size;
> --
> 2.35.1
