Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <bfd0e880-491f-015b-256d-9adb0193e78d@amd.com>
Date: Fri, 26 Nov 2021 11:55:02 -0500
Content-Language: en-US
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-5-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211115094759.520955-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 04/14] tests/kms_color: New subtests for Plane
 gamma
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-11-15 04:47, Bhanuprakash Modem wrote:
> To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
> with a maxed out gamma LUT and verify we have the same CRC as drawing solid
> color rectangles.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 179 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 178 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 775f35964f..b45d66762f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -24,7 +24,34 @@
>  
>  #include "kms_color_helper.h"
>  
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
> +
> +#define MAX_SUPPORTED_PLANES 7
> +#define SDR_PLANE_BASE 3
> +
> +typedef bool (*test_t)(data_t*, igt_plane_t*);
> +
> +static bool is_hdr_plane(const igt_plane_t *plane)
> +{
> +	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;
> +}
> +
> +static bool is_valid_plane(igt_plane_t *plane)
> +{
> +	int index = plane->index;
> +
> +	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> +		return false;
> +
> +	/*
> +	 * Test 1 HDR plane, 1 SDR plane.
> +	 *
> +	 * 0,1,2 HDR planes
> +	 * 3,4,5,6 SDR planes
> +	 *
> +	 */

This seems to be about Intel HW. AMD HW for example does
not have HDR or SDR planes, only one generic plane.

> +	return index >= 0 && index < MAX_SUPPORTED_PLANES;
> +}
>  
>  static void test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
> @@ -638,6 +665,122 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  }
>  #endif
>  
> +static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
> +{
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	drmModePropertyPtr gamma_mode = NULL;
> +	uint32_t i;
> +	bool ret = true;
> +	igt_pipe_crc_t *pipe_crc = NULL;
> +	color_t red_green_blue[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }
> +	};
> +
> +	igt_info("Plane gamma test is running on pipe-%s plane-%s(%s)\n",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +

is_hdr_plane is Intel-specific.

> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
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
> +	igt_plane_set_fb(plane, &fb);
> +
> +	/* Disable Pipe color props. */
> +	disable_ctm(plane->pipe);
> +	disable_degamma(plane->pipe);
> +	disable_gamma(plane->pipe);
> +
> +	disable_plane_ctm(plane);
> +	disable_plane_degamma(plane);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
> +
> +	/* Iterate all supported gamma modes. */
> +	for (i = 0; i < gamma_mode->count_enums; i++) {
> +		igt_crc_t crc_gamma, crc_fullcolors;
> +		segment_data_t *segment_info = NULL;
> +		struct drm_color_lut_ext *lut = NULL;
> +		uint32_t lut_size = 0;
> +
> +		/* Ignore 'no gamma' from enum list. */
> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
> +			continue;
> +

It might still make sense to test that this is doing bypass.

> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
> +
> +		/* Draw solid colors with no gamma transformation. */
> +		disable_plane_gamma(plane);
> +		paint_rectangles(data, mode, red_green_blue, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
> +
> +		/* Draw gradient colors with gamma LUT to remap all
> +		 * values to max red/green/blue.
> +		 */
> +		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
> +				gamma_mode->enums[i].name);
> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
> +		lut = create_max_lut(segment_info);
> +		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
> +
> +		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_gamma);
> +
> +		/* Verify that the CRC of the software computed output is
> +		 * equal to the CRC of the gamma LUT transformation output.
> +		 */
> +		ret &= igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
> +
> +		free(lut);
> +		clear_segment_data(segment_info);
> +	}
> +
> +	disable_plane_gamma(plane);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	igt_pipe_crc_free(pipe_crc);
> +	drmModeFreeProperty(gamma_mode);
> +
> +	return ret;
> +}
> +
>  static void
>  prep_pipe(data_t *data, enum pipe p)
>  {
> @@ -890,6 +1033,37 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe p)
>  		invalid_ctm_matrix_sizes(data, p);
>  }
>  
> +static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
> +{
> +	igt_plane_t *plane;
> +	int count = 0;
> +
> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
> +		if (!is_valid_plane(plane))
> +			continue;
> +
> +		igt_assert(test(data, plane));
> +
> +		count++;
> +	}
> +
> +	igt_require_f(count, "No valid planes found.\n");
> +}
> +
> +static void run_tests_for_plane(data_t *data, enum pipe pipe)
> +{
> +	igt_fixture {
> +		igt_require_pipe(&data->display, pipe);
> +		igt_require_pipe_crc(data->drm_fd);
> +		igt_require(data->display.pipes[pipe].n_planes > 0);
> +		igt_display_require_output_on_pipe(&data->display, pipe);
> +	}
> +
> +	igt_describe("Compare maxed out plane gamma LUT and solid color linear LUT");

I can't seem to see the linear LUT test. This only seems to test
the max LUT.

Harry

> +	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
> +		run_plane_color_test(data, pipe, plane_gamma_test);
> +}
> +
>  igt_main
>  {
>  	data_t data = {};
> @@ -910,6 +1084,9 @@ igt_main
>  
>  		igt_subtest_group
>  			run_invalid_tests_for_pipe(&data, pipe);
> +
> +		igt_subtest_group
> +			run_tests_for_plane(&data, pipe);
>  	}
>  
>  	igt_fixture {
> 
