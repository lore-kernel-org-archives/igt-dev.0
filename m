Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6545910E37A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 09:15:44 +0000 (UTC)
Message-ID: <d5dbbb0d-3cf2-f7e5-0fc4-3736aae8b714@intel.com>
Date: Fri, 3 Jun 2022 14:45:26 +0530
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220530083913.23871-1-karthik.b.s@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220530083913.23871-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_big_joiner: Convert test
 to dynamic
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

On Mon-30-05-2022 02:09 pm, Karthik B S wrote:
> Covert the tests to dynamic subtests at pipe level.
> 
> v2: -Use separate variables for planes in dual_display test. (Bhanu)
>      -Add igt_require(display.is_atomic) in fixture. (Bhanu)
>      -Remove redundant check in loop. (Bhanu)
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/i915/kms_big_joiner.c | 234 +++++++++++++++++++-----------------
>   1 file changed, 125 insertions(+), 109 deletions(-)
> 
> diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
> index d7fa2e53..7d400616 100644
> --- a/tests/i915/kms_big_joiner.c
> +++ b/tests/i915/kms_big_joiner.c
> @@ -35,6 +35,8 @@ typedef struct {
>   	igt_display_t display;
>   	struct igt_fb fb;
>   	int n_pipes;
> +	enum pipe pipe1;
> +	enum pipe pipe2;
>   	struct output_data {
>   		uint32_t id;
>   		int mode_number;
> @@ -46,10 +48,12 @@ static void test_invalid_modeset(data_t *data)
>   	drmModeModeInfo *mode;
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output, *big_joiner_output = NULL, *second_output = NULL;
> -	int i, ret;
> +	int ret;
>   	igt_pipe_t *pipe;
>   	igt_plane_t *plane;
>   
> +	igt_display_reset(display);
> +
>   	for_each_connected_output(display, output) {
>   		mode = &output->config.connector->modes[0];
>   
> @@ -60,100 +64,92 @@ static void test_invalid_modeset(data_t *data)
>   		}
>   	}
>   
> -	for_each_pipe(display, i) {
> -		if (i < (data->n_pipes - 1)) {
> -			igt_output_set_pipe(big_joiner_output, i);
> +	igt_output_set_pipe(big_joiner_output, data->pipe1);
>   
> -			mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
> -			igt_output_override_mode(big_joiner_output, mode);
> +	mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
> +	igt_output_override_mode(big_joiner_output, mode);
>   
> -			pipe = &display->pipes[i];
> -			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe1];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -			igt_plane_set_fb(plane, &data->fb);
> -			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(plane, &data->fb);
> +	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   
> -			igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -			igt_output_set_pipe(second_output, i + 1);
> +	igt_output_set_pipe(second_output, data->pipe2);
>   
> -			mode = igt_output_get_mode(second_output);
> +	mode = igt_output_get_mode(second_output);
>   
> -			pipe = &display->pipes[i + 1];
> -			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe2];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -			igt_plane_set_fb(plane, &data->fb);
> -			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(plane, &data->fb);
> +	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   
> -			/* This commit is expectd to fail as this pipe is being used for big joiner */
> -			ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> -							    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -			igt_assert_lt(ret, 0);
> +	/* This commit is expectd to fail as this pipe is being used for big joiner */
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_lt(ret, 0);
>   
> -			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> -			igt_output_set_pipe(second_output, PIPE_NONE);
> +	igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +	igt_output_set_pipe(second_output, PIPE_NONE);
>   
> -			pipe = &display->pipes[i];
> -			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe1];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -			/*
> -			 * Do not explicitly set the plane of the second output to NULL,
> -			 * as it is the adjacent pipe to the big joiner output and
> -			 * setting the big joiner plane to NULL will take care of this.
> -			 */
> -			igt_plane_set_fb(plane, NULL);
> -			igt_display_commit2(display, COMMIT_ATOMIC);
> -			igt_output_override_mode(big_joiner_output, NULL);
> -		}
> -	}
> +	/*
> +	 * Do not explicitly set the plane of the second output to NULL,
> +	 * as it is the adjacent pipe to the big joiner output and
> +	 * setting the big joiner plane to NULL will take care of this.
> +	 */
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_output_override_mode(big_joiner_output, NULL);
>   
> -	for_each_pipe(display, i) {
> -		if (i < (data->n_pipes - 1)) {
> -			igt_output_set_pipe(second_output, i + 1);
> +	igt_output_set_pipe(second_output, data->pipe2);
>   
> -			mode = igt_output_get_mode(second_output);
> +	mode = igt_output_get_mode(second_output);
>   
> -			pipe = &display->pipes[i + 1];
> -			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe2];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -			igt_plane_set_fb(plane, &data->fb);
> -			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(plane, &data->fb);
> +	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   
> -			igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -			igt_output_set_pipe(big_joiner_output, i);
> +	igt_output_set_pipe(big_joiner_output, data->pipe1);
>   
> -			mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
> -			igt_output_override_mode(big_joiner_output, mode);
> +	mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
> +	igt_output_override_mode(big_joiner_output, mode);
>   
> -			pipe = &display->pipes[i];
> -			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe1];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -			igt_plane_set_fb(plane, &data->fb);
> -			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(plane, &data->fb);
> +	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   
> -			/* This commit is expected to fail as the adjacent pipe is already in use*/
> -			ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> -							    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -			igt_assert_lt(ret, 0);
> +	/* This commit is expected to fail as the adjacent pipe is already in use*/
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_lt(ret, 0);
>   
> -			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> -			igt_output_set_pipe(second_output, PIPE_NONE);
> -			igt_plane_set_fb(plane, NULL);
> +	igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +	igt_output_set_pipe(second_output, PIPE_NONE);
> +	igt_plane_set_fb(plane, NULL);
>   
> -			pipe = &display->pipes[i + 1];
> -			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -			igt_plane_set_fb(plane, NULL);
> +	pipe = &display->pipes[data->pipe2];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(plane, NULL);
>   
> -			igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -			igt_output_override_mode(big_joiner_output, NULL);
> -		}
> -	}
> +	igt_output_override_mode(big_joiner_output, NULL);
>   }
>   
>   static void test_basic_modeset(data_t *data)
> @@ -161,10 +157,11 @@ static void test_basic_modeset(data_t *data)
>   	drmModeModeInfo *mode;
>   	igt_output_t *output, *big_joiner_output = NULL;
>   	igt_display_t *display = &data->display;
> -	int i;
>   	igt_pipe_t *pipe;
>   	igt_plane_t *plane;
>   
> +	igt_display_reset(display);
> +
>   	for_each_connected_output(display, output) {
>   		if (data->big_joiner_output[0].id == output->id) {
>   			big_joiner_output = output;
> @@ -172,27 +169,23 @@ static void test_basic_modeset(data_t *data)
>   		}
>   	}
>   
> -	for_each_pipe(display, i) {
> -		if (i < (data->n_pipes - 1)) {
> -			igt_output_set_pipe(big_joiner_output, i);
> +	igt_output_set_pipe(big_joiner_output, data->pipe1);
>   
> -			mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
> -			igt_output_override_mode(big_joiner_output, mode);
> +	mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
> +	igt_output_override_mode(big_joiner_output, mode);
>   
> -			pipe = &display->pipes[i];
> -			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe1];
> +	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -			igt_plane_set_fb(plane, &data->fb);
> -			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(plane, &data->fb);
> +	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   
> -			igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> -			igt_plane_set_fb(plane, NULL);
> -			igt_display_commit2(display, COMMIT_ATOMIC);
> -		}
> -	}
> +	igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
>   static void test_dual_display(data_t *data)
> @@ -201,9 +194,11 @@ static void test_dual_display(data_t *data)
>   	igt_output_t *output, *big_joiner_output[2];
>   	igt_display_t *display = &data->display;
>   	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
> +	igt_plane_t *plane1, *plane2;
>   	int count = 0;
>   
> +	igt_display_reset(display);
> +
>   	for_each_connected_output(display, output) {
>   		if (data->big_joiner_output[count].id == output->id) {
>   			big_joiner_output[count] = output;
> @@ -214,38 +209,38 @@ static void test_dual_display(data_t *data)
>   			break;
>   	}
>   
> -	igt_output_set_pipe(big_joiner_output[0], PIPE_A);
> -	igt_output_set_pipe(big_joiner_output[1], PIPE_C);
> +	igt_output_set_pipe(big_joiner_output[0], data->pipe1);
> +	igt_output_set_pipe(big_joiner_output[1], data->pipe2);
>   
>   	/* Set up first big joiner output on Pipe A*/
>   	mode = &big_joiner_output[0]->config.connector->modes[data->big_joiner_output[0].mode_number];
>   	igt_output_override_mode(big_joiner_output[0], mode);
>   
> -	pipe = &display->pipes[PIPE_A];
> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe1];
> +	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -	igt_plane_set_fb(plane, &data->fb);
> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(plane1, &data->fb);
> +	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>   
>   	/* Set up second big joiner output on Pipe C*/
>   	mode = &big_joiner_output[1]->config.connector->modes[data->big_joiner_output[1].mode_number];
>   	igt_output_override_mode(big_joiner_output[1], mode);
>   
> -	pipe = &display->pipes[PIPE_C];
> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	pipe = &display->pipes[data->pipe2];
> +	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> -	igt_plane_set_fb(plane, &data->fb);
> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(plane2, &data->fb);
> +	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>   
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	/* Clean up */
>   	igt_output_set_pipe(big_joiner_output[0], PIPE_NONE);
>   	igt_output_set_pipe(big_joiner_output[1], PIPE_NONE);
> -	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[PIPE_A], DRM_PLANE_TYPE_PRIMARY), NULL);
> -	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[PIPE_C], DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_plane_set_fb(plane1, NULL);
> +	igt_plane_set_fb(plane2, NULL);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> @@ -254,14 +249,16 @@ igt_main
>   	data_t data;
>   	igt_output_t *output;
>   	drmModeModeInfo *mode;
> -	int valid_output = 0, i, count = 0;
> +	int valid_output = 0, i, count = 0, j = 0;
>   	uint16_t width = 0, height = 0;
> +	enum pipe pipe_seq[IGT_MAX_PIPES];
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
>   
>   		for_each_connected_output(&data.display, output) {
>   			if (count < 2) {
> @@ -282,8 +279,11 @@ igt_main
>   		}
>   
>   		data.n_pipes = 0;
> -		for_each_pipe(&data.display, i)
> +		for_each_pipe(&data.display, i) {
>   			data.n_pipes++;
> +			pipe_seq[j] = i;
> +			j++;
> +		}
>   
>   		igt_require_f(count > 0, "No output with 5k+ mode found\n");
>   
> @@ -292,21 +292,37 @@ igt_main
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest("basic")
> -		test_basic_modeset(&data);
> +	igt_subtest_with_dynamic("basic") {
> +		for (i = 0; i < data.n_pipes - 1; i++) {
> +			data.pipe1 = pipe_seq[i];
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> +				test_basic_modeset(&data);
> +		}
> +	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
> -	igt_subtest("invalid-modeset") {
> +	igt_subtest_with_dynamic("invalid-modeset") {
>   		igt_require_f(valid_output > 1, "No valid Second output found\n");
> -		test_invalid_modeset(&data);
> +		for (i = 0; i < data.n_pipes - 1; i++) {
> +			data.pipe1 = pipe_seq[i];
> +			data.pipe2 = pipe_seq[i + 1];
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]),
> +						    kmstest_pipe_name(pipe_seq[i + 1]))
> +				test_invalid_modeset(&data);
> +		}
>   	}
>   
>   	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
> -	igt_subtest("2x-modeset") {
> +	igt_subtest_with_dynamic("2x-modeset") {
>   		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
>   		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
> -		test_dual_display(&data);
> +		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
> +			data.pipe1 = pipe_seq[i];
> +			data.pipe2 = pipe_seq[i + 2];
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
> +				test_dual_display(&data);
> +		}
>   	}
>   
>   	igt_fixture {
