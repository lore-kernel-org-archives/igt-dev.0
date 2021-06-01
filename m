Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1330189467
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jun 2021 19:21:34 +0000 (UTC)
Date: Tue, 1 Jun 2021 12:29:55 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210601192953.GA3791@labuser-Z97X-UD5H>
References: <20210601034608.11735-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601034608.11735-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_joiner: Add dual display
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 09:16:08AM +0530, Karthik B S wrote:
> Add subtest to verify modeset on 2 big joiner outputs simultaneously.
> 
> Also, create fb only once and use it across all the subtests to optimize
> the timings.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

So here since you are creating a single frame buffer and sending that across 2 connected outputs,
you are basically simulating the clone case across 2 display outputs right?

So in case 1st output is 8K that uses bigjoiner and 2nd output is 10K hypothetically it will create
a fb of 10K size but since you set the fb size differently based on the mode on each connected display
it will reconfigure the fb and plane size per display output.

Is that correct? It will work with the above scenario right even with single fb?

If the above is true, rest of the logic looks good. 
With that:

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi


> ---
>  tests/kms_big_joiner.c | 120 +++++++++++++++++++++++++++++------------
>  1 file changed, 87 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/kms_big_joiner.c b/tests/kms_big_joiner.c
> index 31397202..98a6fc77 100644
> --- a/tests/kms_big_joiner.c
> +++ b/tests/kms_big_joiner.c
> @@ -34,9 +34,11 @@ typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
>  	struct igt_fb fb;
> -	int mode_number;
>  	int n_pipes;
> -	uint32_t big_joiner_output_id;
> +	struct output_data {
> +		uint32_t id;
> +		int mode_number;
> +	} big_joiner_output[2];
>  } data_t;
>  
>  static void test_invalid_modeset(data_t *data)
> @@ -44,32 +46,25 @@ static void test_invalid_modeset(data_t *data)
>  	drmModeModeInfo *mode;
>  	igt_display_t *display = &data->display;
>  	igt_output_t *output, *big_joiner_output = NULL, *second_output = NULL;
> -	int width = 0, height = 0, i, ret;
> +	int i, ret;
>  	igt_pipe_t *pipe;
>  	igt_plane_t *plane;
>  
>  	for_each_connected_output(display, output) {
>  		mode = &output->config.connector->modes[0];
>  
> -		if (data->big_joiner_output_id == output->id) {
> -			mode = &output->config.connector->modes[data->mode_number];
> +		if (data->big_joiner_output[0].id == output->id) {
>  			big_joiner_output = output;
>  		} else if (second_output == NULL) {
>  			second_output = output;
>  		}
> -
> -		width = max(width, mode->hdisplay);
> -		height = max(height, mode->vdisplay);
>  	}
>  
> -	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -			      LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
> -
>  	for_each_pipe(display, i) {
>  		if (i < (data->n_pipes - 1)) {
>  			igt_output_set_pipe(big_joiner_output, i);
>  
> -			mode = &big_joiner_output->config.connector->modes[data->mode_number];
> +			mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
>  			igt_output_override_mode(big_joiner_output, mode);
>  
>  			pipe = &display->pipes[i];
> @@ -131,7 +126,7 @@ static void test_invalid_modeset(data_t *data)
>  
>  			igt_output_set_pipe(big_joiner_output, i);
>  
> -			mode = &big_joiner_output->config.connector->modes[data->mode_number];
> +			mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
>  			igt_output_override_mode(big_joiner_output, mode);
>  
>  			pipe = &display->pipes[i];
> @@ -159,8 +154,6 @@ static void test_invalid_modeset(data_t *data)
>  			igt_output_override_mode(big_joiner_output, NULL);
>  		}
>  	}
> -
> -	igt_remove_fb(data->drm_fd, &data->fb);
>  }
>  
>  static void test_basic_modeset(data_t *data)
> @@ -168,28 +161,22 @@ static void test_basic_modeset(data_t *data)
>  	drmModeModeInfo *mode;
>  	igt_output_t *output, *big_joiner_output = NULL;
>  	igt_display_t *display = &data->display;
> -	int width = 0, height = 0, i;
> +	int i;
>  	igt_pipe_t *pipe;
>  	igt_plane_t *plane;
>  
>  	for_each_connected_output(display, output) {
> -		if (data->big_joiner_output_id == output->id) {
> -			mode = &output->config.connector->modes[data->mode_number];
> +		if (data->big_joiner_output[0].id == output->id) {
>  			big_joiner_output = output;
> -			width = mode->hdisplay;
> -			height = mode->vdisplay;
>  			break;
>  		}
>  	}
>  
> -	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -			      LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
> -
>  	for_each_pipe(display, i) {
>  		if (i < (data->n_pipes - 1)) {
>  			igt_output_set_pipe(big_joiner_output, i);
>  
> -			mode = &big_joiner_output->config.connector->modes[data->mode_number];
> +			mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
>  			igt_output_override_mode(big_joiner_output, mode);
>  
>  			pipe = &display->pipes[i];
> @@ -206,17 +193,69 @@ static void test_basic_modeset(data_t *data)
>  			igt_display_commit2(display, COMMIT_ATOMIC);
>  		}
>  	}
> +}
> +
> +static void test_dual_display(data_t *data)
> +{
> +	drmModeModeInfo *mode;
> +	igt_output_t *output, *big_joiner_output[2];
> +	igt_display_t *display = &data->display;
> +	igt_pipe_t *pipe;
> +	igt_plane_t *plane;
> +	int count = 0;
> +
> +	for_each_connected_output(display, output) {
> +		if (data->big_joiner_output[count].id == output->id) {
> +			big_joiner_output[count] = output;
> +			count++;
> +		}
>  
> -	igt_remove_fb(data->drm_fd, &data->fb);
> +		if (count > 1)
> +			break;
> +	}
> +
> +	igt_output_set_pipe(big_joiner_output[0], PIPE_A);
> +	igt_output_set_pipe(big_joiner_output[1], PIPE_C);
> +
> +	/* Set up first big joiner output on Pipe A*/
> +	mode = &big_joiner_output[0]->config.connector->modes[data->big_joiner_output[0].mode_number];
> +	igt_output_override_mode(big_joiner_output[0], mode);
> +
> +	pipe = &display->pipes[PIPE_A];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(plane, &data->fb);
> +	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +	/* Set up second big joiner output on Pipe C*/
> +	mode = &big_joiner_output[1]->config.connector->modes[data->big_joiner_output[1].mode_number];
> +	igt_output_override_mode(big_joiner_output[1], mode);
> +
> +	pipe = &display->pipes[PIPE_C];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(plane, &data->fb);
> +	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* Clean up */
> +	igt_output_set_pipe(big_joiner_output[0], PIPE_NONE);
> +	igt_output_set_pipe(big_joiner_output[1], PIPE_NONE);
> +	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[PIPE_A], DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[PIPE_C], DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
>  }
>  
>  igt_main
>  {
>  	data_t data;
> -	bool big_joiner_mode_found = false;
>  	igt_output_t *output;
>  	drmModeModeInfo *mode;
> -	int valid_output = 0, i;
> +	int valid_output = 0, i, count = 0;
> +	uint16_t width = 0, height = 0;
>  
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> @@ -225,13 +264,16 @@ igt_main
>  		igt_display_require(&data.display, data.drm_fd);
>  
>  		for_each_connected_output(&data.display, output) {
> -			if (!big_joiner_mode_found) {
> +			if (count < 2) {
>  				for (i = 0; i < output->config.connector->count_modes; i++) {
>  					mode = &output->config.connector->modes[i];
>  					if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
> -						big_joiner_mode_found = true;
> -						data.mode_number = i;
> -						data.big_joiner_output_id = output->id;
> +						data.big_joiner_output[count].mode_number = i;
> +						data.big_joiner_output[count].id = output->id;
> +						count++;
> +
> +						width = max(width, mode->hdisplay);
> +						height = max(height, mode->vdisplay);
>  						break;
>  					}
>  				}
> @@ -243,7 +285,10 @@ igt_main
>  		for_each_pipe(&data.display, i)
>  			data.n_pipes++;
>  
> -		igt_require_f(big_joiner_mode_found, "No output with 5k+ mode found\n");
> +		igt_require_f(count > 0, "No output with 5k+ mode found\n");
> +
> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +				      LOCAL_DRM_FORMAT_MOD_NONE, &data.fb);
>  	}
>  
>  	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> @@ -257,6 +302,15 @@ igt_main
>  		test_invalid_modeset(&data);
>  	}
>  
> -	igt_fixture
> +	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
> +	igt_subtest("2x-modeset") {
> +		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> +		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
> +		test_dual_display(&data);
> +	}
> +
> +	igt_fixture {
> +		igt_remove_fb(data.drm_fd, &data.fb);
>  		igt_display_fini(&data.display);
> +	}
>  }
> -- 
> 2.22.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
