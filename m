Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602610E548
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 05:59:21 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 16 Mar 2022 05:59:15 +0000
Message-ID: <754a12f5cd2a4d0ca7df8612a9668f2c@intel.com>
References: <20220208041233.2202854-1-bhanuprakash.modem@intel.com>
 <20220217155457.2427855-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220217155457.2427855-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [v4 i-g-t 2/3] tests/kms_color: Add support for
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
> Sent: Thursday, February 17, 2022 9:25 PM
> To: igt-dev@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [v4 i-g-t 2/3] tests/kms_color: Add support for Deep-Color
>=20
> Add new subtests to validate deep color.
>=20
> V2:
> * i915 needs atleast gen 11 to support deep-color
> * Add connector name to dynamic subtest
> V3:
> * Fix the usage of "output"
>=20
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c        | 96 +++++++++++++++++++++++++++++-----------
>  tests/kms_color_helper.c |  2 +-
>  tests/kms_color_helper.h |  2 +
>  3 files changed, 72 insertions(+), 28 deletions(-)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c index 854b8f3c31..6cc4=
456159
> 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -29,7 +29,6 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level=
");
> static void test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
>  {
> -	igt_output_t *output;
>  	igt_display_t *display =3D &data->display;
>  	gamma_lut_t *degamma_linear, *degamma_full;
>  	color_t red_green_blue[] =3D {
> @@ -48,17 +47,14 @@ static void test_pipe_degamma(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
>=20
> -	output =3D igt_get_single_output_for_pipe(&data->display, primary->pipe=
-
> >pipe);
> -	igt_require(output);
> -
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> -	mode =3D igt_output_get_mode(output);
> +	igt_output_set_pipe(data->output, primary->pipe->pipe);
> +	mode =3D igt_output_get_mode(data->output);
>=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -66,7 +62,7 @@ static void test_pipe_degamma(data_t *data,
>  	fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -103,7 +99,7 @@ static void test_pipe_degamma(data_t *data,
>=20
>  	disable_degamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset); @@ -119,7 +115,6 @@ static
> void test_pipe_degamma(data_t *data,  static void test_pipe_gamma(data_t =
*data,
>  			    igt_plane_t *primary)
>  {
> -	igt_output_t *output;
>  	igt_display_t *display =3D &data->display;
>  	gamma_lut_t *gamma_full;
>  	color_t red_green_blue[] =3D {
> @@ -136,17 +131,14 @@ static void test_pipe_gamma(data_t *data,
>=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20
> -	output =3D igt_get_single_output_for_pipe(&data->display, primary->pipe=
-
> >pipe);
> -	igt_require(output);
> -
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> -	mode =3D igt_output_get_mode(output);
> +	igt_output_set_pipe(data->output, primary->pipe->pipe);
> +	mode =3D igt_output_get_mode(data->output);
>=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -154,7 +146,7 @@ static void test_pipe_gamma(data_t *data,
>  	fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -190,7 +182,7 @@ static void test_pipe_gamma(data_t *data,
>=20
>  	disable_gamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset); @@ -439,7 +431,6 @@ static
> bool test_pipe_ctm(data_t *data,
>  		0.0, 0.0, 1.0
>  	};
>  	gamma_lut_t *degamma_linear, *gamma_linear;
> -	igt_output_t *output;
>  	bool ret =3D true;
>  	igt_display_t *display =3D &data->display;
>  	drmModeModeInfo *mode;
> @@ -452,17 +443,14 @@ static bool test_pipe_ctm(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
>=20
> -	output =3D igt_get_single_output_for_pipe(&data->display, primary->pipe=
-
> >pipe);
> -	igt_require(output);
> -
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> -	mode =3D igt_output_get_mode(output);
> +	igt_output_set_pipe(data->output, primary->pipe->pipe);
> +	mode =3D igt_output_get_mode(data->output);
>=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -470,7 +458,7 @@ static bool test_pipe_ctm(data_t *data,
>  	fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -516,7 +504,7 @@ static bool test_pipe_ctm(data_t *data,
>  	ret &=3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_software,
> &crc_hardware);
>=20
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
>=20
> @@ -686,12 +674,14 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>=20
> INTEL_PIPE_CRC_SOURCE_AUTO);
>=20
>  		igt_display_require_output_on_pipe(&data->display, p);
> +		data->output =3D igt_get_single_output_for_pipe(&data->display, p);
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
> 866,6 +856,58 @@ run_tests_for_pipe(data_t *data, enum pipe p)
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
> +
> +			if (!is_max_bpc_supported(output))
> +				continue;
> +
> +			if (!is_panel_supports_deep_color(data->drm_fd,
> connector))
> +				continue;
> +
> +			data->color_depth =3D 10;
> +			data->drm_format =3D DRM_FORMAT_XRGB2101010;
> +			data->output =3D output;
> +			igt_output_set_prop_value(output,
> IGT_CONNECTOR_MAX_BPC, 10);
> +
> +			igt_dynamic_f("gamma-%s", output->name) {
> +				igt_output_set_pipe(data->output, PIPE_NONE);
> +				test_pipe_gamma(data, primary);
> +			}
> +
> +			igt_dynamic_f("degamma-%s", output->name) {
> +				igt_output_set_pipe(data->output, PIPE_NONE);
> +				test_pipe_degamma(data, primary);
> +			}
> +
> +			igt_dynamic_f("ctm-%s", output->name) {
> +				igt_output_set_pipe(data->output, PIPE_NONE);
> +				igt_assert(test_pipe_ctm(data, primary,
> +							 red_green_blue,
> +							 blue_green_blue, ctm));
> +			}
> +
> +			igt_output_set_prop_value(output,
> IGT_CONNECTOR_MAX_BPC, 12);

Should we not get the max bpc supported and set to default what was set ear=
lier. It may not be set to 12
earlier so would be good to restore the value set earlier.

> +			break;
> +		}
> +	}
> +
>  	igt_fixture {
>  		disable_degamma(primary->pipe);
>  		disable_gamma(primary->pipe);
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c index
> 6b3af02b00..b0abe5507e 100644
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
> 992087ac9c..4e381a1c28 100644
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
> 2.35.0
