Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CB610EB5F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 15:28:50 +0000 (UTC)
Message-ID: <14cae113-f0d2-7554-b878-16be48c1ee2c@intel.com>
Date: Fri, 18 Mar 2022 20:58:30 +0530
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220310035439.15304-1-karthik.b.s@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220310035439.15304-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu-10-03-2022 09:24 am, Karthik B S wrote:
> -Convert tests to dynamic

Can we have separate patch for dynamic subtests?

> -Replace drm function call with existing library functions
> -igt_display_reset() before all subtests
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 202 ++++++++++++++++++++++++++++------------
>   1 file changed, 144 insertions(+), 58 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index c658630c..13995700 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -50,7 +50,7 @@ typedef struct {
>   	uint32_t refresh_rate;
>   	struct igt_fb bufs[4];
>   	igt_display_t display;
> -	drmModeConnectorPtr connector;
> +	igt_output_t *output;
>   	unsigned long flip_timestamp_us;
>   	double flip_interval;
>   	igt_pipe_crc_t *pipe_crc;
> @@ -58,24 +58,9 @@ typedef struct {
>   	int flip_count;
>   	int frame_count;
>   	bool flip_pending;
> +	bool extended;
>   } data_t;
>   
> -static drmModeConnectorPtr find_connector_for_modeset(data_t *data)
> -{
> -	igt_output_t *output;
> -	drmModeConnectorPtr ret = NULL;
> -
> -	for_each_connected_output(&data->display, output) {
> -		if (output->config.connector->count_modes > 0) {
> -			ret = output->config.connector;
> -			break;
> -		}
> -	}
> -
> -	igt_assert_f(ret, "Connector NOT found\n");
> -	return ret;
> -}
> -
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>   			 unsigned int tv_usec, void *_data)
>   {
> @@ -129,14 +114,10 @@ static void wait_flip_event(data_t *data)
>   }
>   
>   static void make_fb(data_t *data, struct igt_fb *fb,
> -		    drmModeConnectorPtr connector, int index)
> +		    uint32_t width, uint32_t height, int index)
>   {
> -	uint32_t width, height;
>   	int rec_width;
>   
> -	width = connector->modes[0].hdisplay;
> -	height = connector->modes[0].vdisplay;
> -
>   	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
>   
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> @@ -347,8 +328,8 @@ static void test_invalid(data_t *data)
>   	uint32_t width, height;
>   	struct igt_fb fb;
>   
> -	width = data->connector->modes[0].hdisplay;
> -	height = data->connector->modes[0].vdisplay;
> +	width = data->output->config.connector->modes[0].hdisplay;
> +	height = data->output->config.connector->modes[0].vdisplay;
>   
>   	igt_require(igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
>   					       I915_FORMAT_MOD_Y_TILED));
> @@ -367,31 +348,58 @@ static void test_invalid(data_t *data)
>   	igt_remove_fb(data->drm_fd, &fb);
>   }
>   
> +static enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output)
> +{
> +	enum pipe pipe;
> +
> +	for_each_pipe(display, pipe) {
> +		if (igt_pipe_connector_valid(pipe, output))
> +			return pipe;
> +	}
> +
> +	igt_assert_f(false, "No pipe found for output %s\n",
> +		     igt_output_name(output));
> +}
> +
>   static void test_init(data_t *data)
>   {
> -	drmModeResPtr res;
> -	int i, ret;
> +	int i;
> +	uint32_t width, height;
> +	enum pipe pipe;
> +	igt_plane_t *plane;
> +	static uint32_t prev_output_id;
> +
> +	if (!prev_output_id) {
> +		prev_output_id = data->output->id;
> +	} else if (prev_output_id == data->output->id) {
> +		return;
> +	} else {
> +		prev_output_id = data->output->id;
> +		for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> +			igt_remove_fb(data->drm_fd, &data->bufs[i]);
> +	}
Why do we need this change? will igt_disaplay_reset() change output id info?

>   
> -	res = drmModeGetResources(data->drm_fd);
> -	igt_assert(res);
> +	igt_display_reset(&data->display);
> +	igt_display_commit(&data->display);
>   
> -	kmstest_unset_all_crtcs(data->drm_fd, res);
> +	pipe = get_pipe_for_output(&data->display, data->output);
>   
> -	data->connector = find_connector_for_modeset(data);
> -	data->crtc_id = kmstest_find_crtc_for_connector(data->drm_fd,
> -							res, data->connector, 0);
> +	width = data->output->config.connector->modes[0].hdisplay;
> +	height = data->output->config.connector->modes[0].vdisplay;

igt_output_get_mode(data->output) can give the default mode.

>   
> -	data->refresh_rate = data->connector->modes[0].vrefresh;
> +	data->crtc_id = data->display.pipes[pipe].crtc_id;
> +	data->refresh_rate = data->output->config.connector->modes[0].vrefresh;
>   
>   	for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> -		make_fb(data, &data->bufs[i], data->connector, i);
> +		make_fb(data, &data->bufs[i], width, height, i);
>   
> -	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[0].fb_id, 0, 0,
> -			     &data->connector->connector_id, 1, &data->connector->modes[0]);
> +	igt_output_set_pipe(data->output, pipe);
> +	plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>   
> -	igt_assert(ret == 0);
> +	igt_plane_set_fb(plane, &data->bufs[0]);
> +	igt_plane_set_size(plane, width, height);
>   
> -	drmModeFreeResources(res);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);

We need igt_require(atomic) in igt_fixture to use this.

>   }
>   
>   static void queue_vblank(data_t *data)
> @@ -488,7 +496,7 @@ static void test_crc(data_t *data)
>   	drmModeModeInfoPtr mode;
>   
>   	/* make things faster by using a smallish mode */
> -	mode = &data->connector->modes[0];
> +	mode = &data->output->config.connector->modes[0];
>   	if (mode->hdisplay > 1024 && mode->vdisplay > 786)
>   		mode = igt_std_1024_mode_get(data->refresh_rate);
>   	else
> @@ -503,7 +511,7 @@ static void test_crc(data_t *data)
>   	igt_draw_fill_fb(data->drm_fd, &data->bufs[!frame], 0xff0000ff);
>   
>   	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
> -			     &data->connector->connector_id, 1, mode);
> +			     &data->output->config.connector->connector_id, 1, mode);
>   	free(mode);
>   	igt_assert_eq(ret, 0);
>   
> @@ -541,10 +549,33 @@ static void test_crc(data_t *data)
>   	igt_assert_lt(data->frame_count * 2, data->flip_count);
>   }
>   
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'e':
> +		data->extended = true;
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --extended\t\tRun the extended tests\n";
> +
> +static data_t data;
> +
> +igt_main_args("", long_opts, help_str, opt_handler, &data)

Options are missing in help string. s/""/"e"

>   {
> -	static data_t data;
>   	int i;
> +	igt_output_t *output;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -558,32 +589,84 @@ igt_main
>   
>   	igt_describe("Verify the async flip functionality and the fps during async flips");
>   	igt_subtest_group {
> -		igt_fixture
> -			test_init(&data);
> -
>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
> -		igt_subtest("async-flip-with-page-flip-events")
> -			test_async_flip(&data, false);
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> +			for_each_connected_output(&data.display, output) {
> +				igt_dynamic_f("%s", igt_output_name(output)) {
> +					data.output = output;
> +					test_init(&data);
> +					test_async_flip(&data, false);
> +				}
> +				if (!data.extended)
> +					break;

Are we not missing any coverage? Single output/pipe combo is enough?

AFAIK, aysnc-flips are related pipe and it doesn't matter the connector 
type, so we need to iterate all pipes and get single output using 
igt_get_single_output_for_pipe()

- Bhanu

> +			}
> +		}
>   
>   		igt_describe("Alternate between sync and async flips");
> -		igt_subtest("alternate-sync-async-flip")
> -			test_async_flip(&data, true);
> +		igt_subtest_with_dynamic("alternate-sync-async-flip") {
> +			for_each_connected_output(&data.display, output) {
> +				igt_dynamic_f("%s", igt_output_name(output)) {
> +					data.output = output;
> +					test_init(&data);
> +					test_async_flip(&data, true);
> +				}
> +				if (!data.extended)
> +					break;
> +			}
> +		}
> +
>   
>   		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
> -		igt_subtest("test-time-stamp")
> -			test_timestamp(&data);
> +		igt_subtest_with_dynamic("test-time-stamp") {
> +			for_each_connected_output(&data.display, output) {
> +				igt_dynamic_f("%s", igt_output_name(output)) {
> +					data.output = output;
> +					test_init(&data);
> +					test_timestamp(&data);
> +				}
> +				if (!data.extended)
> +					break;
> +			}
> +		}
>   
>   		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> -		igt_subtest("test-cursor")
> -			test_cursor(&data);
> +		igt_subtest_with_dynamic("test-cursor") {
> +			for_each_connected_output(&data.display, output) {
> +				igt_dynamic_f("%s", igt_output_name(output)) {
> +					data.output = output;
> +					test_init(&data);
> +					test_cursor(&data);
> +				}
> +				if (!data.extended)
> +					break;
> +			}
> +		}
>   
>   		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
> -		igt_subtest("invalid-async-flip")
> -			test_invalid(&data);
> +		igt_subtest_with_dynamic("invalid-async-flip") {
> +			for_each_connected_output(&data.display, output) {
> +				igt_dynamic_f("%s", igt_output_name(output)) {
> +					data.output = output;
> +					test_init(&data);
> +					test_invalid(&data);
> +				}
> +				if (!data.extended)
> +					break;
> +			}
> +		}
>   
>   		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
> -		igt_subtest("crc")
> -			test_crc(&data);
> +		igt_subtest_with_dynamic("crc") {
> +			for_each_connected_output(&data.display, output) {
> +				igt_dynamic_f("%s", igt_output_name(output)) {
> +					data.output = output;
> +					test_init(&data);
> +					test_crc(&data);
> +				}
> +				if (!data.extended)
> +					break;
> +			}
> +		}
>   
>   		igt_fixture {
>   			for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
> @@ -591,6 +674,9 @@ igt_main
>   		}
>   	}
>   
> -	igt_fixture
> +	igt_fixture {
> +		igt_display_reset(&data.display);
> +		igt_display_commit(&data.display);
>   		igt_display_fini(&data.display);
> +	}
>   }
