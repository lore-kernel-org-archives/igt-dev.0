Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730366E17E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 15:03:22 +0000 (UTC)
Date: Thu, 12 Dec 2019 17:03:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20191212150319.GP1208@intel.com>
References: <20191211204636.16222-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211204636.16222-1-sunpeng.li@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: Add 10bpc frame buffer
 parameterization to subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sunpeng.li@amd.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 03:46:36PM -0500, sunpeng.li@amd.com wrote:
> From: Leo Li <sunpeng.li@amd.com>
> =

> We'd like to test the hardware pipe's color management with 10bit
> surfaces.

Why exactly? The pipe color management stuff doesn't care what
pixel format the plane used.

> This change parameterizes the hardcoded formats within each
> test, and ennumerates the additional subtests within a for loop. To
> avoid renaming existing tests, the 10bpc tests will have '-10bpc'
> inserted after the pipe name, while the 8bpc test names remain
> unchanged.
> =

> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> ---
>  tests/kms_color.c | 353 ++++++++++++++++++++++++++--------------------
>  1 file changed, 198 insertions(+), 155 deletions(-)
> =

> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index b4b578a7..3c76a0d2 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -52,6 +52,12 @@ typedef struct {
>  	double coeffs[];
>  } gamma_lut_t;
>  =

> +typedef struct {
> +	uint32_t format;
> +	int bpc;
> +	char name[16];
> +} fb_format_t;
> +
>  static void paint_gradient_rectangles(data_t *data,
>  				      drmModeModeInfo *mode,
>  				      color_t *colors,
> @@ -269,7 +275,8 @@ static void disable_prop(igt_pipe_t *pipe, enum igt_a=
tomic_crtc_properties prop)
>   * rectangles with linear degamma LUT.
>   */
>  static void test_pipe_degamma(data_t *data,
> -			      igt_plane_t *primary)
> +			      igt_plane_t *primary,
> +			      uint32_t fb_format)
>  {
>  	igt_output_t *output;
>  	gamma_lut_t *degamma_linear, *degamma_full;
> @@ -301,7 +308,7 @@ static void test_pipe_degamma(data_t *data,
>  		fb_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      fb_format,
>  				      LOCAL_DRM_FORMAT_MOD_NONE,
>  				      &fb);
>  		igt_assert(fb_id);
> @@ -309,7 +316,7 @@ static void test_pipe_degamma(data_t *data,
>  		fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  					      mode->hdisplay,
>  					      mode->vdisplay,
> -					      DRM_FORMAT_XRGB8888,
> +					      fb_format,
>  					      LOCAL_DRM_FORMAT_MOD_NONE,
>  					      &fb_modeset);
>  		igt_assert(fb_modeset_id);
> @@ -356,7 +363,8 @@ static void test_pipe_degamma(data_t *data,
>   * LUT and verify we have the same CRC as drawing solid color rectangles.
>   */
>  static void test_pipe_gamma(data_t *data,
> -			    igt_plane_t *primary)
> +			    igt_plane_t *primary,
> +			    uint32_t fb_format)
>  {
>  	igt_output_t *output;
>  	gamma_lut_t *gamma_full;
> @@ -383,7 +391,7 @@ static void test_pipe_gamma(data_t *data,
>  		fb_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      fb_format,
>  				      LOCAL_DRM_FORMAT_MOD_NONE,
>  				      &fb);
>  		igt_assert(fb_id);
> @@ -391,7 +399,7 @@ static void test_pipe_gamma(data_t *data,
>  		fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  					      mode->hdisplay,
>  					      mode->vdisplay,
> -					      DRM_FORMAT_XRGB8888,
> +					      fb_format,
>  					      LOCAL_DRM_FORMAT_MOD_NONE,
>  					      &fb_modeset);
>  		igt_assert(fb_modeset_id);
> @@ -436,7 +444,8 @@ static void test_pipe_gamma(data_t *data,
>   * with linear legacy gamma LUT.
>   */
>  static void test_pipe_legacy_gamma(data_t *data,
> -				   igt_plane_t *primary)
> +				   igt_plane_t *primary,
> +				   uint32_t fb_format)
>  {
>  	igt_output_t *output;
>  	color_t red_green_blue[] =3D {
> @@ -469,7 +478,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>  		fb_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      fb_format,
>  				      LOCAL_DRM_FORMAT_MOD_NONE,
>  				      &fb);
>  		igt_assert(fb_id);
> @@ -477,7 +486,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>  		fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  					      mode->hdisplay,
>  					      mode->vdisplay,
> -					      DRM_FORMAT_XRGB8888,
> +					      fb_format,
>  					      LOCAL_DRM_FORMAT_MOD_NONE,
>  					      &fb_modeset);
>  		igt_assert(fb_modeset_id);
> @@ -676,7 +685,8 @@ static bool test_pipe_ctm(data_t *data,
>  			  igt_plane_t *primary,
>  			  color_t *before,
>  			  color_t *after,
> -			  double *ctm_matrix)
> +			  double *ctm_matrix,
> +			  uint32_t fb_format)
>  {
>  	const double ctm_identity[] =3D {
>  		1.0, 0.0, 0.0,
> @@ -705,7 +715,7 @@ static bool test_pipe_ctm(data_t *data,
>  		fb_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      fb_format,
>  				      LOCAL_DRM_FORMAT_MOD_NONE,
>  				      &fb);
>  		igt_assert(fb_id);
> @@ -713,7 +723,7 @@ static bool test_pipe_ctm(data_t *data,
>  		fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  					      mode->hdisplay,
>  					      mode->vdisplay,
> -					      DRM_FORMAT_XRGB8888,
> +					      fb_format,
>  					      LOCAL_DRM_FORMAT_MOD_NONE,
>  					      &fb_modeset);
>  		igt_assert(fb_modeset_id);
> @@ -780,7 +790,8 @@ static bool test_pipe_ctm(data_t *data,
>   */
>  #if 0
>  static void test_pipe_limited_range_ctm(data_t *data,
> -					igt_plane_t *primary)
> +					igt_plane_t *primary,
> +					uint32_t fb_format)
>  {
>  	double limited_result =3D 235.0 / 255.0;
>  	color_t red_green_blue_limited[] =3D {
> @@ -821,7 +832,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  		fb_id =3D igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      fb_format,
>  				      LOCAL_DRM_FORMAT_MOD_NONE,
>  				      &fb);
>  		igt_assert(fb_id);
> @@ -829,7 +840,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  		fb_modeset_id =3D igt_create_fb(data->drm_fd,
>  					      mode->hdisplay,
>  					      mode->vdisplay,
> -					      DRM_FORMAT_XRGB8888,
> +					      fb_format,
>  					      LOCAL_DRM_FORMAT_MOD_NONE,
>  					      &fb_modeset);
>  		igt_assert(fb_modeset_id);
> @@ -878,13 +889,18 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>  	igt_pipe_t *pipe;
>  	igt_plane_t *primary;
>  	double delta;
> -	int i;
> +	int i, j;
>  	color_t red_green_blue[] =3D {
>  		{ 1.0, 0.0, 0.0 },
>  		{ 0.0, 1.0, 0.0 },
>  		{ 0.0, 0.0, 1.0 }
>  	};
>  =

> +	fb_format_t fb_formats[] =3D {
> +		{ DRM_FORMAT_XRGB8888, 8 , ""},
> +		{ DRM_FORMAT_XRGB2101010, 10 , "-10bpc"}
> +	};
> +
>  	igt_fixture {
>  		igt_require_pipe_crc(data->drm_fd);
>  =

> @@ -916,162 +932,189 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>  		igt_display_require_output_on_pipe(&data->display, p);
>  	}
>  =

> -	/* We assume an 8bits depth per color for degamma/gamma LUTs
> -	 * for CRC checks with framebuffer references. */
> -	data->color_depth =3D 8;
> -	delta =3D 1.0 / (1 << data->color_depth);
> -
> -	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) {
> -		color_t blue_green_blue[] =3D {
> -			{ 0.0, 0.0, 1.0 },
> -			{ 0.0, 1.0, 0.0 },
> -			{ 0.0, 0.0, 1.0 }
> -		};
> -		double ctm[] =3D { 0.0, 0.0, 0.0,
> -				0.0, 1.0, 0.0,
> -				1.0, 0.0, 1.0 };
> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> -					 blue_green_blue, ctm));
> -	}
> +	/* Iterate over fb formats to test */
> +	for (j =3D 0; j < ARRAY_SIZE(fb_formats); j++) {
> +
> +		fb_format_t *fb_format =3D &fb_formats[j];
> +		data->color_depth =3D fb_format->bpc;
> +		delta =3D 1.0 / (1 << data->color_depth);
> +
> +		igt_subtest_f("pipe-%s%s-ctm-red-to-blue", kmstest_pipe_name(p),
> +			      fb_format->name) {
> +			color_t blue_green_blue[] =3D {
> +				{ 0.0, 0.0, 1.0 },
> +				{ 0.0, 1.0, 0.0 },
> +				{ 0.0, 0.0, 1.0 }
> +			};
> +			double ctm[] =3D { 0.0, 0.0, 0.0,
> +					0.0, 1.0, 0.0,
> +					1.0, 0.0, 1.0 };
> +			igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> +						 blue_green_blue, ctm,
> +						 fb_format->format));
> +		}
>  =

> -	igt_subtest_f("pipe-%s-ctm-green-to-red", kmstest_pipe_name(p)) {
> -		color_t red_red_blue[] =3D {
> -			{ 1.0, 0.0, 0.0 },
> -			{ 1.0, 0.0, 0.0 },
> -			{ 0.0, 0.0, 1.0 }
> -		};
> -		double ctm[] =3D { 1.0, 1.0, 0.0,
> -				0.0, 0.0, 0.0,
> -				0.0, 0.0, 1.0 };
> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> -					 red_red_blue, ctm));
> -	}
> +		igt_subtest_f("pipe-%s%s-ctm-green-to-red",
> +			      kmstest_pipe_name(p), fb_format->name) {
> +			color_t red_red_blue[] =3D {
> +				{ 1.0, 0.0, 0.0 },
> +				{ 1.0, 0.0, 0.0 },
> +				{ 0.0, 0.0, 1.0 }
> +			};
> +			double ctm[] =3D { 1.0, 1.0, 0.0,
> +					0.0, 0.0, 0.0,
> +					0.0, 0.0, 1.0 };
> +			igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> +						 red_red_blue, ctm,
> +						 fb_format->format));
> +		}
>  =

> -	igt_subtest_f("pipe-%s-ctm-blue-to-red", kmstest_pipe_name(p)) {
> -		color_t red_green_red[] =3D {
> -			{ 1.0, 0.0, 0.0 },
> -			{ 0.0, 1.0, 0.0 },
> -			{ 1.0, 0.0, 0.0 }
> -		};
> -		double ctm[] =3D { 1.0, 0.0, 1.0,
> -				0.0, 1.0, 0.0,
> -				0.0, 0.0, 0.0 };
> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> -					 red_green_red, ctm));
> -	}
> +		igt_subtest_f("pipe-%s%s-ctm-blue-to-red", kmstest_pipe_name(p),
> +			      fb_format->name) {
> +			color_t red_green_red[] =3D {
> +				{ 1.0, 0.0, 0.0 },
> +				{ 0.0, 1.0, 0.0 },
> +				{ 1.0, 0.0, 0.0 }
> +			};
> +			double ctm[] =3D { 1.0, 0.0, 1.0,
> +					0.0, 1.0, 0.0,
> +					0.0, 0.0, 0.0 };
> +			igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> +						 red_green_red, ctm,
> +						 fb_format->format));
> +		}
>  =

> -	/* We tests a few values around the expected result because
> -	 * the it depends on the hardware we're dealing with, we can
> -	 * either get clamped or rounded values and we also need to
> -	 * account for odd number of items in the LUTs. */
> -	igt_subtest_f("pipe-%s-ctm-0-25", kmstest_pipe_name(p)) {
> -		color_t expected_colors[] =3D {
> -			{ 0.0, }, { 0.0, }, { 0.0, }
> -		};
> -		double ctm[] =3D { 0.25, 0.0,  0.0,
> -				 0.0,  0.25, 0.0,
> -				 0.0,  0.0,  0.25 };
> -		bool success =3D false;
> -
> -		for (i =3D 0; i < 5; i++) {
> -			expected_colors[0].r =3D
> -				expected_colors[1].g =3D
> -				expected_colors[2].b =3D
> -				0.25 + delta * (i - 2);
> -			success |=3D test_pipe_ctm(data, primary,
> -						 red_green_blue,
> -						 expected_colors, ctm);
> +		/* We tests a few values around the expected result because
> +		 * the it depends on the hardware we're dealing with, we can
> +		 * either get clamped or rounded values and we also need to
> +		 * account for odd number of items in the LUTs. */
> +		igt_subtest_f("pipe-%s%s-ctm-0-25", kmstest_pipe_name(p),
> +			      fb_format->name) {
> +			color_t expected_colors[] =3D {
> +				{ 0.0, }, { 0.0, }, { 0.0, }
> +			};
> +			double ctm[] =3D { 0.25, 0.0,  0.0,
> +					 0.0,  0.25, 0.0,
> +					 0.0,  0.0,  0.25 };
> +			bool success =3D false;
> +
> +			for (i =3D 0; i < 5; i++) {
> +				expected_colors[0].r =3D
> +					expected_colors[1].g =3D
> +					expected_colors[2].b =3D
> +					0.25 + delta * (i - 2);
> +				success |=3D test_pipe_ctm(data, primary,
> +							 red_green_blue,
> +							 expected_colors, ctm,
> +							 fb_format->format);
> +			}
> +			igt_assert(success);
>  		}
> -		igt_assert(success);
> -	}
>  =

> -	igt_subtest_f("pipe-%s-ctm-0-5", kmstest_pipe_name(p)) {
> -		color_t expected_colors[] =3D {
> -			{ 0.0, }, { 0.0, }, { 0.0, }
> -		};
> -		double ctm[] =3D { 0.5, 0.0, 0.0,
> -				 0.0, 0.5, 0.0,
> -				 0.0, 0.0, 0.5 };
> -		bool success =3D false;
> -
> -		for (i =3D 0; i < 5; i++) {
> -			expected_colors[0].r =3D
> -				expected_colors[1].g =3D
> -				expected_colors[2].b =3D
> -				0.5 + delta * (i - 2);
> -			success |=3D test_pipe_ctm(data, primary,
> -						 red_green_blue,
> -						 expected_colors, ctm);
> +		igt_subtest_f("pipe-%s%s-ctm-0-5", kmstest_pipe_name(p),
> +			      fb_format->name) {
> +			color_t expected_colors[] =3D {
> +				{ 0.0, }, { 0.0, }, { 0.0, }
> +			};
> +			double ctm[] =3D { 0.5, 0.0, 0.0,
> +					 0.0, 0.5, 0.0,
> +					 0.0, 0.0, 0.5 };
> +			bool success =3D false;
> +
> +			for (i =3D 0; i < 5; i++) {
> +				expected_colors[0].r =3D
> +					expected_colors[1].g =3D
> +					expected_colors[2].b =3D
> +					0.5 + delta * (i - 2);
> +				success |=3D test_pipe_ctm(data, primary,
> +							 red_green_blue,
> +							 expected_colors, ctm,
> +							 fb_format->format);
> +			}
> +			igt_assert(success);
>  		}
> -		igt_assert(success);
> -	}
>  =

> -	igt_subtest_f("pipe-%s-ctm-0-75", kmstest_pipe_name(p)) {
> -		color_t expected_colors[] =3D {
> -			{ 0.0, }, { 0.0, }, { 0.0, }
> -		};
> -		double ctm[] =3D { 0.75, 0.0,  0.0,
> -				 0.0,  0.75, 0.0,
> -				 0.0,  0.0,  0.75 };
> -		bool success =3D false;
> -
> -		for (i =3D 0; i < 7; i++) {
> -			expected_colors[0].r =3D
> -				expected_colors[1].g =3D
> -				expected_colors[2].b =3D
> -				0.75 + delta * (i - 3);
> -			success |=3D test_pipe_ctm(data, primary,
> -						 red_green_blue,
> -						 expected_colors, ctm);
> +		igt_subtest_f("pipe-%s%s-ctm-0-75", kmstest_pipe_name(p),
> +			      fb_format->name) {
> +			color_t expected_colors[] =3D {
> +				{ 0.0, }, { 0.0, }, { 0.0, }
> +			};
> +			double ctm[] =3D { 0.75, 0.0,  0.0,
> +					 0.0,  0.75, 0.0,
> +					 0.0,  0.0,  0.75 };
> +			bool success =3D false;
> +
> +			for (i =3D 0; i < 7; i++) {
> +				expected_colors[0].r =3D
> +					expected_colors[1].g =3D
> +					expected_colors[2].b =3D
> +					0.75 + delta * (i - 3);
> +				success |=3D test_pipe_ctm(data, primary,
> +							 red_green_blue,
> +							 expected_colors, ctm,
> +							 fb_format->format);
> +			}
> +			igt_assert(success);
>  		}
> -		igt_assert(success);
> -	}
>  =

> -	igt_subtest_f("pipe-%s-ctm-max", kmstest_pipe_name(p)) {
> -		color_t full_rgb[] =3D {
> -			{ 1.0, 0.0, 0.0 },
> -			{ 0.0, 1.0, 0.0 },
> -			{ 0.0, 0.0, 1.0 }
> -		};
> -		double ctm[] =3D { 100.0,   0.0,   0.0,
> -				 0.0,   100.0,   0.0,
> -				 0.0,     0.0, 100.0 };
> -
> -		/* CherryView generates values on 10bits that we
> -		 * produce with an 8 bits per color framebuffer. */
> -		igt_require(!IS_CHERRYVIEW(data->devid));
> -
> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> -					 full_rgb, ctm));
> -	}
> +		igt_subtest_f("pipe-%s%s-ctm-max", kmstest_pipe_name(p),
> +			      fb_format->name) {
> +			color_t full_rgb[] =3D {
> +				{ 1.0, 0.0, 0.0 },
> +				{ 0.0, 1.0, 0.0 },
> +				{ 0.0, 0.0, 1.0 }
> +			};
> +			double ctm[] =3D { 100.0,   0.0,   0.0,
> +					 0.0,   100.0,   0.0,
> +					 0.0,     0.0, 100.0 };
> +
> +			/* CherryView generates values on 10bits that we
> +			 * produce with an 8 bits per color framebuffer. */
> +			igt_require(!IS_CHERRYVIEW(data->devid));
> +
> +			igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> +						 full_rgb, ctm,
> +						 fb_format->format));
> +		}
>  =

> -	igt_subtest_f("pipe-%s-ctm-negative", kmstest_pipe_name(p)) {
> -		color_t all_black[] =3D {
> -			{ 0.0, 0.0, 0.0 },
> -			{ 0.0, 0.0, 0.0 },
> -			{ 0.0, 0.0, 0.0 }
> -		};
> -		double ctm[] =3D { -1.0,  0.0,  0.0,
> -				 0.0, -1.0,  0.0,
> -				 0.0,  0.0, -1.0 };
> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> -					 all_black, ctm));
> -	}
> +		igt_subtest_f("pipe-%s%s-ctm-negative", kmstest_pipe_name(p),
> +			      fb_format->name) {
> +			color_t all_black[] =3D {
> +				{ 0.0, 0.0, 0.0 },
> +				{ 0.0, 0.0, 0.0 },
> +				{ 0.0, 0.0, 0.0 }
> +			};
> +			double ctm[] =3D { -1.0,  0.0,  0.0,
> +					 0.0, -1.0,  0.0,
> +					 0.0,  0.0, -1.0 };
> +			igt_assert(test_pipe_ctm(data, primary, red_green_blue,
> +						 all_black, ctm,
> +						 fb_format->format));
> +		}
>  =

>  #if 0
> -	igt_subtest_f("pipe-%s-ctm-limited-range", kmstest_pipe_name(p))
> -		test_pipe_limited_range_ctm(data, primary);
> +		igt_subtest_f("pipe-%s-ctm-limited-range%s",
> +			      kmstest_pipe_name(p), fb_format->name)
> +			test_pipe_limited_range_ctm(data, primary,
> +						    fb_format->format);
>  #endif
>  =

> -	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
> -		test_pipe_degamma(data, primary);
> +		igt_subtest_f("pipe-%s%s-degamma", kmstest_pipe_name(p),
> +			      fb_format->name)
> +			test_pipe_degamma(data, primary, fb_format->format);
>  =

> -	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
> -		test_pipe_gamma(data, primary);
> +		igt_subtest_f("pipe-%s%s-gamma", kmstest_pipe_name(p),
> +			      fb_format->name)
> +			test_pipe_gamma(data, primary, fb_format->format);
>  =

> -	igt_subtest_f("pipe-%s-legacy-gamma", kmstest_pipe_name(p))
> -		test_pipe_legacy_gamma(data, primary);
> +		igt_subtest_f("pipe-%s%s-legacy-gamma", kmstest_pipe_name(p),
> +			      fb_format->name)
> +			test_pipe_legacy_gamma(data, primary,
> +					       fb_format->format);
>  =

> +	} // End of fb_formats iterator
> +
> +	data->color_depth =3D 8;
>  	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
>  		test_pipe_legacy_gamma_reset(data, primary);
>  =

> -- =

> 2.24.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
