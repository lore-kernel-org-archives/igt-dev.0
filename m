Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F410B10ECF1
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 13:55:55 +0000 (UTC)
Message-ID: <3d26d651-4616-4b5d-1185-4850c01cff72@intel.com>
Date: Fri, 22 Apr 2022 19:25:40 +0530
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220422095907.31901-1-karthik.b.s@intel.com>
 <20220422095907.31901-2-karthik.b.s@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220422095907.31901-2-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_async_flips: Convert
 tests to dynamic
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

On Fri-22-04-2022 03:29 pm, Karthik B S wrote:
> Convert the subtests to dynamic at pipe/output level.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 164 ++++++++++++++++++++--------------------
>   1 file changed, 83 insertions(+), 81 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 335d6818..c00590aa 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -350,56 +350,39 @@ static void test_invalid(data_t *data)
>   	igt_remove_fb(data->drm_fd, &fb);
>   }
>   
> -static enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output)
> -{
> -	enum pipe pipe;
> -
> -	for_each_pipe(display, pipe) {
> -		if (igt_pipe_connector_valid(pipe, output))
> -			return pipe;
> -	}
> -
> -	igt_assert_f(false, "No pipe found for output %s\n",
> -		     igt_output_name(output));
> -}
> -
> -static void test_init(data_t *data)
> +static void test_init(data_t *data, enum pipe pipe)
>   {
>   	int i;
>   	uint32_t width, height;
> -	enum pipe pipe;
>   	igt_plane_t *plane;
>   	static uint32_t prev_output_id;
>   	drmModeModeInfo *mode;
>   
> -	if (!prev_output_id) {
> -		prev_output_id = data->output->id;
> -	} else if (prev_output_id == data->output->id) {
> -		return;
> -	} else {
> -		prev_output_id = data->output->id;
> -		for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> -			igt_remove_fb(data->drm_fd, &data->bufs[i]);
> -	}
> -
> -	igt_display_reset(&data->display);
> -	igt_display_commit(&data->display);
> -
> -	pipe = get_pipe_for_output(&data->display, data->output);
> -
>   	mode = igt_output_get_mode(data->output);
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;

I think, we need to get the mode after igt_display_reset()

>   
> +	igt_display_reset(&data->display);
> +	igt_display_commit(&data->display);
> +
>   	data->crtc_id = data->display.pipes[pipe].crtc_id;
>   	data->refresh_rate = mode->vrefresh;
>   
> -	for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> -		make_fb(data, &data->bufs[i], width, height, i);
> -
>   	igt_output_set_pipe(data->output, pipe);
>   	plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>   
> +	if (prev_output_id != data->output->id) {
> +		prev_output_id = data->output->id;
> +
> +		if (data->bufs[0].fb_id) {
> +			for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> +				igt_remove_fb(data->drm_fd, &data->bufs[i]);
> +		}
> +
> +		for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> +			make_fb(data, &data->bufs[i], width, height, i);
> +	}
> +
>   	igt_plane_set_fb(plane, &data->bufs[0]);
>   	igt_plane_set_size(plane, width, height);
>   
> @@ -566,6 +549,7 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
>   {
>   	int i;
>   	igt_output_t *output;
> +	enum pipe pipe;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -580,75 +564,93 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
>   	igt_describe("Verify the async flip functionality and the fps during async flips");
>   	igt_subtest_group {
>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
> -		igt_subtest("async-flip-with-page-flip-events") {
> -			for_each_connected_output(&data.display, output) {
> -				data.output = output;
> -				test_init(&data);
> -				test_async_flip(&data, false);
> -
> -				if (!data.extended)
> -					break;
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> +			for_each_pipe_static(pipe) {

So, by default we are going to run tests on all pipes with single 
output. With extended flag, we'll run on all pipe/output combinations.

I think its better to limit to single pipe (or) first & last pipes by 
default.

> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
> +						data.output = output;
> +						test_init(&data, pipe);
> +						test_async_flip(&data, false);
> +					}
> +					if (!data.extended)
> +						break;
> +				}
>   			}
>   		}
>   
>   		igt_describe("Alternate between sync and async flips");
> -		igt_subtest("alternate-sync-async-flip") {
> -			for_each_connected_output(&data.display, output) {
> -				data.output = output;
> -				test_init(&data);
> -				test_async_flip(&data, true);
> -
> -				if (!data.extended)
> -					break;
> +		igt_subtest_with_dynamic("alternate-sync-async-flip") {
> +			for_each_pipe_static(pipe) {
> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
> +						data.output = output;
> +						test_init(&data, pipe);
> +						test_async_flip(&data, true);
> +					}
> +					if (!data.extended)
> +						break;
> +				}
>   			}
>   		}
>   
>   
>   		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
> -		igt_subtest("test-time-stamp") {
> -			for_each_connected_output(&data.display, output) {
> -				data.output = output;
> -				test_init(&data);
> -				test_timestamp(&data);
> -
> -				if (!data.extended)
> -					break;
> +		igt_subtest_with_dynamic("test-time-stamp") {
> +			for_each_pipe_static(pipe) {
> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
> +						data.output = output;
> +						test_init(&data, pipe);
> +						test_timestamp(&data);
> +					}
> +					if (!data.extended)
> +						break;
> +				}
>   			}
>   		}
>   
>   		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> -		igt_subtest("test-cursor") {
> -			for_each_connected_output(&data.display, output) {
> -				data.output = output;
> -				test_init(&data);
> -				test_cursor(&data);
> -
> -				if (!data.extended)
> -					break;
> +		igt_subtest_with_dynamic("test-cursor") {
> +			for_each_pipe_static(pipe) {
> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
> +						data.output = output;
> +						test_init(&data, pipe);
> +						test_cursor(&data);
> +					}
> +					if (!data.extended)
> +						break;
> +				}
>   			}
>   		}
>   
>   		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
> -		igt_subtest("invalid-async-flip") {
> -			for_each_connected_output(&data.display, output) {
> -				data.output = output;
> -				test_init(&data);
> -				test_invalid(&data);
> -
> -				if (!data.extended)
> -					break;
> +		igt_subtest_with_dynamic("invalid-async-flip") {
> +			for_each_pipe_static(pipe) {
> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
> +						data.output = output;
> +						test_init(&data, pipe);
> +						test_invalid(&data);
> +					}
> +					if (!data.extended)
> +						break;
> +				}
>   			}
>   		}
>   
>   		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
> -		igt_subtest("crc") {
> -			for_each_connected_output(&data.display, output) {
> -				data.output = output;
> -				test_init(&data);
> -				test_crc(&data);
> -
> -				if (!data.extended)
> -					break;
> +		igt_subtest_with_dynamic("crc") {
> +			for_each_pipe_static(pipe) {
> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
> +						data.output = output;
> +						test_init(&data, pipe);
> +						test_crc(&data);
> +					}
> +					if (!data.extended)
> +							break;
> +				}
>   			}
>   		}
>   
