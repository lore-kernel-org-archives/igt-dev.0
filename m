Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Message-ID: <ab861932-4a49-6475-131d-46e3ab514cdb@amd.com>
Date: Fri, 26 Nov 2021 11:55:04 -0500
Subject: Re: [i-g-t 06/14] tests/kms_color: New subtests for Plane CTM
Content-Language: en-US
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-7-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211115094759.520955-7-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-11-15 04:47, Bhanuprakash Modem wrote:
> To verify plane CTM, draw 3 rectangles using before colors with the
> ctm matrix applied and verify the CRC is equal to using after colors
> with an identify ctm matrix.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 225 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 920a5eaadd..e14b37cb6f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -53,6 +53,77 @@ static bool is_valid_plane(igt_plane_t *plane)
>  	return index >= 0 && index < MAX_SUPPORTED_PLANES;
>  }
>  
> +struct {
> +	const char *test_name;
> +	int iter;
> +	color_t expected_colors[3];
> +	double ctm[9];
> +} ctm_tests[] = {
> +	{"plane-ctm-red-to-blue", 0,
> +					{{ 0.0, 0.0, 1.0 },
> +					 { 0.0, 1.0, 0.0 },
> +					 { 0.0, 0.0, 1.0 }},
> +		{ 0.0, 0.0, 0.0,
> +		  0.0, 1.0, 0.0,
> +		  1.0, 0.0, 1.0 },
> +	},
> +	{"plane-ctm-green-to-red", 0,
> +					{{ 1.0, 0.0, 0.0 },
> +					 { 1.0, 0.0, 0.0 },
> +					 { 0.0, 0.0, 1.0 }},
> +		{ 1.0, 1.0, 0.0,
> +		  0.0, 0.0, 0.0,
> +		  0.0, 0.0, 1.0 },
> +	},
> +	{"plane-ctm-blue-to-red", 0,
> +					{{ 1.0, 0.0, 0.0 },
> +					 { 0.0, 1.0, 0.0 },
> +					 { 1.0, 0.0, 0.0 }},
> +		{ 1.0, 0.0, 1.0,
> +		  0.0, 1.0, 0.0,
> +		  0.0, 0.0, 0.0 },
> +	},
> +	{"plane-ctm-max", 0,
> +					{{ 1.0, 0.0, 0.0 },
> +					 { 0.0, 1.0, 0.0 },
> +					 { 0.0, 0.0, 1.0 }},
> +		{ 100.0, 0.0, 0.0,
> +		  0.0, 100.0, 0.0,
> +		  0.0, 0.0, 100.0 },
> +	},
> +	{"plane-ctm-negative", 0,
> +					{{ 0.0, 0.0, 0.0 },
> +					 { 0.0, 0.0, 0.0 },
> +					 { 0.0, 0.0, 0.0 }},
> +		{ -1.0, 0.0, 0.0,
> +		   0.0, -1.0, 0.0,
> +		   0.0, 0.0, -1.0 },
> +	},
> +	/* We tests a few values around the expected result because
> +	 * it depends on the hardware we're dealing with, we can
> +	 * either get clamped or rounded values and we also need to
> +	 * account for odd number of items in the LUTs.
> +	 */
> +	{"plane-ctm-0-25", 5,
> +					{{ 0.0, }, { 0.0, }, { 0.0, }},
> +		{ 0.25, 0.0,  0.0,
> +		  0.0,  0.25, 0.0,
> +		  0.0,  0.0,  0.25 },
> +	},
> +	{"plane-ctm-0-50", 5,
> +					{{ 0.0, }, { 0.0, }, { 0.0, }},
> +		{ 0.5,  0.0,  0.0,
> +		  0.0,  0.5,  0.0,
> +		  0.0,  0.0,  0.5 },
> +	},
> +	{"plane-ctm-0-75", 7,
> +					{{ 0.0, }, { 0.0, }, { 0.0, }},
> +		{ 0.75, 0.0,  0.0,
> +		  0.0,  0.75, 0.0,
> +		  0.0,  0.0,  0.75 },
> +	},
> +};
> +
>  static void test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
>  {
> @@ -900,6 +971,99 @@ static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
>  	return ret;
>  }
>  
> +static bool test_plane_ctm(data_t *data,
> +			  igt_plane_t *plane,
> +			  color_t *before,
> +			  color_t *after,
> +			  double *ctm_matrix)
> +{
> +	const double ctm_identity[] = {
> +		1.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0,
> +		0.0, 0.0, 1.0
> +	};
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	igt_crc_t crc_software, crc_hardware;
> +	igt_pipe_crc_t *pipe_crc = NULL;
> +	bool ret = true;
> +
> +	igt_info("Plane CTM test is running on pipe-%s plane-%s(%s)\n",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
> +
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd,
> +				  plane->pipe->pipe,
> +				  INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
> +	igt_assert(output);
> +
> +	igt_output_set_pipe(output, plane->pipe->pipe);
> +	mode = igt_output_get_mode(output);
> +
> +	/* Create a framebuffer at the size of the output. */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +			      mode->hdisplay,
> +			      mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      &fb));
> +
> +	igt_plane_set_fb(plane, &fb);
> +
> +	/* Disable Pipe color props. */
> +	disable_degamma(plane->pipe);
> +	disable_gamma(plane->pipe);
> +	disable_ctm(plane->pipe);
> +
> +	disable_plane_gamma(plane);
> +	disable_plane_degamma(plane);
> +	igt_display_commit2(display, display->is_atomic ?
> +				COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	/* Without CTM transformation. */
> +	paint_rectangles(data, mode, after, &fb);
> +	igt_plane_set_fb(plane, &fb);
> +	set_plane_ctm(plane, ctm_identity);
> +	igt_display_commit2(display, display->is_atomic ?
> +				COMMIT_ATOMIC : COMMIT_LEGACY);
> +	igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc_software);
> +
> +	/* With CTM transformation. */
> +	paint_rectangles(data, mode, before, &fb);
> +	igt_plane_set_fb(plane, &fb);
> +	set_plane_ctm(plane, ctm_matrix);
> +	igt_display_commit2(display, display->is_atomic ?
> +				COMMIT_ATOMIC : COMMIT_LEGACY);
> +	igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc_hardware);
> +
> +	/* Verify that the CRC of the software computed ouutput
> +	 * is equal to the CRC of the CTM matrix transformation
> +	 * output.
> +	 */
> +	ret = igt_check_crc_equal(&crc_software, &crc_hardware);
> +
> +	disable_plane_ctm(plane);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	igt_pipe_crc_free(pipe_crc);
> +
> +	return ret;
> +}
> +
>  static void
>  prep_pipe(data_t *data, enum pipe p)
>  {
> @@ -1169,8 +1333,57 @@ static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
>  	igt_require_f(count, "No valid planes found.\n");
>  }
>  
> +static void run_plane_ctm_test(data_t *data,
> +				enum pipe pipe,
> +				color_t *expected,
> +				double *ctm,
> +				int iter)
> +{
> +	igt_plane_t *plane;
> +	bool result;
> +	int i, count = 0;
> +	double delta = 1.0 / (1 << 8);
> +	color_t red_green_blue[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }
> +	};
> +
> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
> +		if (!is_valid_plane(plane))
> +			continue;
> +
> +		result = false;
> +
> +		if (!iter)
> +			result |= test_plane_ctm(data, plane,
> +					red_green_blue, expected,
> +					ctm);
> +
> +		for (i = 0; i < iter; i++) {
> +			expected[0].r =
> +			expected[1].g =
> +			expected[2].b =
> +				ctm[0] + delta * (i - (iter/2));
> +

This bracketing likely depends closely on HW. I am curious if we
can get this to work on various HW.

Harry

> +			result |= test_plane_ctm(data, plane,
> +					red_green_blue,	expected,
> +					ctm);
> +			if (result)
> +				break;
> +		}
> +
> +		igt_assert(result);
> +		count++;
> +	}
> +
> +	igt_require_f(count, "No valid planes found.\n");
> +}
> +
>  static void run_tests_for_plane(data_t *data, enum pipe pipe)
>  {
> +	int i;
> +
>  	igt_fixture {
>  		igt_require_pipe(&data->display, pipe);
>  		igt_require_pipe_crc(data->drm_fd);
> @@ -1186,6 +1399,18 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
>  	igt_subtest_f("pipe-%s-plane-degamma",
>  			kmstest_pipe_name(pipe))
>  		run_plane_color_test(data, pipe, plane_degamma_test);
> +
> +	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
> +		igt_describe("Compare after applying ctm matrix & identity matrix");
> +		igt_subtest_f("pipe-%s-%s",
> +				kmstest_pipe_name(pipe),
> +				ctm_tests[i].test_name) {
> +			run_plane_ctm_test(data, pipe,
> +					ctm_tests[i].expected_colors,
> +					ctm_tests[i].ctm,
> +					ctm_tests[i].iter);
> +		}
> +	}
>  }
>  
>  igt_main
> 
