Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C05A9A02
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 23:06:06 +0000 (UTC)
Message-ID: <17a89c2e-5700-d396-5a4c-b528dd920d7c@quicinc.com>
Date: Thu, 4 Aug 2022 16:06:00 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rohith Iyer <quic_rohiiyer@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20220804220235.26076-1-quic_rohiiyer@quicinc.com>
 <20220804220235.26076-4-quic_rohiiyer@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220804220235.26076-4-quic_rohiiyer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v6 3/3] tests/kms_writeback: Enhance
 kms_writeback for custom modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/4/2022 3:02 PM, Rohith Iyer wrote:
> Enhance kms_writeback to add support for the below options:
> - View all writeback modes
> Usage: "./kms_writeback --list-modes"
> 
> - Test a built-in mode from connector list
> Usage: "./kms_writeback --built-in <mode_index>"
> 
> - Test a custom mode from user input
> Usage: "./kms_writeback --custom <mode_parameters>"
> Refer to --help for exact syntax
> 
> - Dump the writeback output buffer to png file
> Usage: "IGT_FRAME_DUMP_PATH=filepath FRAME_PNG_FILE_NAME=filename ./kms_writeback --dump"
> 
> Changes made in V4:
>   - Added header for writeback mode list
>   - Changed built-in mode short option from -s to -b for clarity
> 
> Changes made in V6:
>   - Fixed alignment for function arguments spilling over one line
> 
> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   tests/kms_writeback.c | 173 +++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 153 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 3866345c..82c244ff 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -26,6 +26,7 @@
>   #include <stdbool.h>
>   #include <stdio.h>
>   #include <string.h>
> +#include <limits.h>
>   
>   #include "igt.h"
>   #include "igt_core.h"
> @@ -39,6 +40,17 @@ IGT_TEST_DESCRIPTION(
>      "by using CRC."
>   );
>   
> +typedef struct {
> +	bool builtin_mode;
> +	bool custom_mode;
> +	bool list_modes;
> +	bool dump_check;
> +	int mode_index;
> +	drmModeModeInfo user_mode;
> +} data_t;
> +
> +static data_t data;
> +
>   static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
>   {
>   	drmModePropertyBlobRes *blob = NULL;
> @@ -58,29 +70,15 @@ static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
>   	return blob;
>   }
>   
> -static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
> +static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
> +				    drmModeModeInfo override_mode)
>   {
>   	igt_fb_t input_fb, output_fb;
>   	igt_plane_t *plane;
>   	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>   	int width, height, ret;
> -	drmModeModeInfo override_mode = {
> -		.clock = 25175,
> -		.hdisplay = 640,
> -		.hsync_start = 656,
> -		.hsync_end = 752,
> -		.htotal = 800,
> -		.hskew = 0,
> -		.vdisplay = 480,
> -		.vsync_start = 490,
> -		.vsync_end = 492,
> -		.vtotal = 525,
> -		.vscan = 0,
> -		.vrefresh = 60,
> -		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> -		.name = {"640x480-60"},
> -	};
> +
>   	igt_output_override_mode(output, &override_mode);
>   
>   	width = override_mode.hdisplay;
> @@ -112,6 +110,23 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>   	int i;
>   	enum pipe pipe;
>   
> +	drmModeModeInfo override_mode = {
> +		.clock = 25175,
> +		.hdisplay = 640,
> +		.hsync_start = 656,
> +		.hsync_end = 752,
> +		.htotal = 800,
> +		.hskew = 0,
> +		.vdisplay = 480,
> +		.vsync_start = 490,
> +		.vsync_end = 492,
> +		.vtotal = 525,
> +		.vscan = 0,
> +		.vrefresh = 60,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.name = {"640x480-60"},
> +	};
> +
>   	for (i = 0; i < display->n_outputs; i++) {
>   		igt_output_t *output = &display->outputs[i];
>   
> @@ -121,7 +136,12 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>   		for_each_pipe(display, pipe) {
>   			igt_output_set_pipe(output, pipe);
>   
> -			if (check_writeback_config(display, output)) {
> +			if (data.custom_mode)
> +				override_mode = data.user_mode;
> +			if (data.builtin_mode)
> +				override_mode = output->config.connector->modes[data.mode_index];
> +
> +			if (check_writeback_config(display, output, override_mode)) {
>   				igt_debug("Using connector %u:%s on pipe %d\n",
>   					  output->config.connector->connector_id,
>   					  output->name, pipe);
> @@ -356,7 +376,108 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
>   	igt_remove_fb(output_fb->fd, &second_out_fb);
>   }
>   
> -igt_main
> +static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t *in_fb,
> +			      igt_fb_t *out_fb)
> +{
> +	uint32_t in_fb_color = 0xffff0000;
> +
> +	fill_fb(in_fb, in_fb_color);
> +
> +	igt_plane_set_fb(plane, in_fb);
> +	igt_output_set_writeback_fb(output, out_fb);
> +
> +	igt_display_commit_atomic(output->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (out_fb)
> +		get_and_wait_out_fence(output);
> +}
> +
> +static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
> +			        igt_fb_t *input_fb, drmModeModeInfo *mode)
> +{
> +	cairo_surface_t *fb_surface_out;
> +	char filepath_out[PATH_MAX];
> +	cairo_status_t status;
> +	char *path_name;
> +	char *file_name;
> +	unsigned int fb_id;
> +	igt_fb_t output_fb;
> +
> +	path_name = getenv("IGT_FRAME_DUMP_PATH");
> +	file_name = getenv("FRAME_PNG_FILE_NAME");
> +	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				igt_fb_mod_to_tiling(0), &output_fb);
> +	igt_require(fb_id > 0);
> +
> +	do_single_commit(output, plane, input_fb, &output_fb);
> +
> +	fb_surface_out = igt_get_cairo_surface(display->drm_fd, &output_fb);
> +	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
> +	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
> +	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
> +
> +	igt_remove_fb(display->drm_fd, &output_fb);
> +}
> +
> +static igt_output_t *list_writeback_modes(igt_display_t *display)
> +{
> +	for (int i = 0; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK) {
> +			igt_info("\tname  vref hdis hss hse htot vdis vss vse vtot flags type clock\n");
> +			for (int j = 0; j < output->config.connector->count_modes; j++) {
> +				igt_info("[%d]", j);
> +				kmstest_dump_mode(&output->config.connector->modes[j]);
> +			}
> +			break;
> +		}
> +	}
> +	return NULL;
> +}
> +
> +static int opt_handler(int option, int option_index, void *_data)
> +{
> +	switch (option) {
> +	case 'l':
> +		data.list_modes = true;
> +		break;
> +	case 'b':
> +		data.builtin_mode = true;
> +		data.mode_index = atoi(optarg);
> +		break;
> +	case 'c':
> +		data.custom_mode = true;
> +		if (!igt_parse_mode_string(optarg, &data.user_mode))
> +			return IGT_OPT_HANDLER_ERROR;
> +		break;
> +	case 'd':
> +		data.dump_check = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	" --list-modes | -l List of writeback connector modes\n"
> +	" --built-in | -b Commits a built-in mode\n"
> +	" --custom | -c Commits a custom mode inputted by user"
> +	" <clock MHz>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,"
> +	"<vdisp>,<vsync-start>,<vsync-end>,<vtotal>\n"
> +	" --dump | -d Prints buffer to file location $IGT_FRAME_DUMP_PATH"
> +	"/$FRAME_PNG_FILE_NAME "
> +	"before running dump. Will skip all other tests.\n";
> +
> +static const struct option long_options[] = {
> +	{ .name = "list-modes", .has_arg = false, .val = 'l', },
> +	{ .name = "built-in", .has_arg = true, .val = 'b', },
> +	{ .name = "custom", .has_arg = true, .val = 'c', },
> +	{ .name = "dump", .has_arg = false, .val = 'd', },
> +	{}
> +};
> +
> +igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   {
>   	igt_display_t display;
>   	igt_output_t *output;
> @@ -395,10 +516,19 @@ igt_main
>   				      &input_fb);
>   		igt_assert(fb_id >= 0);
>   		igt_plane_set_fb(plane, &input_fb);
> -	}
>   
> +		if (data.list_modes)
> +			list_writeback_modes(&display);
> +		if (data.dump_check)
> +			commit_and_dump_fb(&display, output, plane, &input_fb, &mode);
> +	}
> +	/*
> +	 * When dump_check or list_modes flag is high, then the following subtests will be skipped
> +	 * as we do not want to do CRC validation.
> +	 */
>   	igt_describe("Check the writeback format");
>   	igt_subtest("writeback-pixel-formats") {
> +		igt_skip_on(data.dump_check || data.list_modes);
>   		drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
>   		const char *valid_chars = "01234568 ABCGNRUVXY";
>   		unsigned int i;
> @@ -421,6 +551,7 @@ igt_main
>   		     "(output framebuffer and fence); this test goes through"
>   		     "the combination of possible bad options");
>   	igt_subtest("writeback-invalid-parameters") {
> +		igt_skip_on(data.dump_check || data.list_modes);
>   		igt_fb_t invalid_output_fb;
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
>   				      mode.vdisplay / 2,
> @@ -436,6 +567,7 @@ igt_main
>   
>   	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
>   	igt_subtest("writeback-fb-id") {
> +		igt_skip_on(data.dump_check || data.list_modes);
>   		igt_fb_t output_fb;
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
>   				      DRM_FORMAT_XRGB8888,
> @@ -450,6 +582,7 @@ igt_main
>   
>   	igt_describe("Check writeback output with CRC validation");
>   	igt_subtest("writeback-check-output") {
> +		igt_skip_on(data.dump_check || data.list_modes);
>   		igt_fb_t output_fb;
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
>   				      DRM_FORMAT_XRGB8888,
