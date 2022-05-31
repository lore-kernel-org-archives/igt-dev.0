Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8992410F8A6
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 08:31:16 +0000 (UTC)
Date: Tue, 31 May 2022 10:31:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YpXSUAV0IE9YKA7N@kamilkon-desk1>
References: <20220531053648.19856-1-karthik.b.s@intel.com>
 <20220531053648.19856-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220531053648.19856-3-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 2/2] tests/kms_async_flips: Test
 Cleanup
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

Hi Karthik,

On 2022-05-31 at 11:06:48 +0530, Karthik B S wrote:
> -Replace drm function call with existing library functions
- ^

Remove '-' from beggining.

> -igt_display_reset() before all subtests
- ^
Same here.

You make a little more than in commit description, imho subject
word "Cleanup" should be "refactoring". I do not know much about
kms itself, so I will not comment on validity of your changes,
only some small nits below. 

> 
> v2: -Move conversion to dynamic subtest to a separate patch (Bhanu)
>     -Use igt_output_get_mode to get default mode (Bhanu)
>     -Add 'is_atomic' check before igt_display_commit2 (Bhanu)
> 
> v3: -Move test_init after the checks to skip subtest (Bhanu)
>     -Update the logic to call make_fb() in test_init()
> 
> v4: -Move patch after patch to convert tests to dynamic to avoid code
>      duplicaton. (Bhanu)
> 
> v5: -Update commit message. (Bhanu)
>     -Move skip checks in the dynamic subtests before the start of the
>      subtest to optimize the test. (Bhanu)
>     -Close drm_fd at the end of the subtest.
> 
> v6: -Fix identation for braces. (Andre)
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_async_flips.c | 169 +++++++++++++++++++++-------------------
>  1 file changed, 91 insertions(+), 78 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 8b545b77..4a0527dc 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -50,7 +50,6 @@ typedef struct {
>  	uint32_t refresh_rate;
>  	struct igt_fb bufs[4];
>  	igt_display_t display;
> -	drmModeConnectorPtr connector;
>  	igt_output_t *output;
>  	unsigned long flip_timestamp_us;
>  	double flip_interval;
> @@ -64,22 +63,6 @@ typedef struct {
>  	bool alternate_sync_async;
>  } data_t;
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
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -133,15 +116,11 @@ static void wait_flip_event(data_t *data)
>  }
>  
>  static void make_fb(data_t *data, struct igt_fb *fb,
> -		    drmModeConnectorPtr connector, int index)
> +		    uint32_t width, uint32_t height, int index)
>  {
> -	uint32_t width, height;
>  	int rec_width;
>  	cairo_t *cr;
>  
> -	width = connector->modes[0].hdisplay;
> -	height = connector->modes[0].vdisplay;
> -
>  	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
>  
>  	if (is_i915_device(data->drm_fd)) {
> @@ -163,13 +142,52 @@ static void require_monotonic_timestamp(int fd)
>  		      "Monotonic timestamps not supported\n");
>  }
>  
> +static void test_init(data_t *data)
> +{
> +	int i;
> +	uint32_t width, height;
> +	igt_plane_t *plane;
> +	static uint32_t prev_output_id;
> +	drmModeModeInfo *mode;
> +
> +	igt_display_reset(&data->display);
> +	igt_display_commit(&data->display);
> +
> +	mode = igt_output_get_mode(data->output);
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
> +
> +	data->crtc_id = data->display.pipes[data->pipe].crtc_id;
> +	data->refresh_rate = mode->vrefresh;
> +
> +	igt_output_set_pipe(data->output, data->pipe);
> +	plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +
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
> +	igt_plane_set_fb(plane, &data->bufs[0]);
> +	igt_plane_set_size(plane, width, height);
> +
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
>  static void test_async_flip(data_t *data)
>  {
>  	int ret, frame;
>  	long long int fps;
>  	struct timeval start, end, diff;
>  
> -	require_monotonic_timestamp(data->drm_fd);
> +	test_init(data);
>  
>  	gettimeofday(&start, NULL);
>  	frame = 1;
> @@ -262,7 +280,7 @@ static void test_timestamp(data_t *data)
>  	unsigned int seq, seq1;
>  	int ret;
>  
> -	require_monotonic_timestamp(data->drm_fd);
> +	test_init(data);
>  
>  	/*
>  	 * In older platforms(<= gen10), async address update bit is double buffered.
> @@ -321,6 +339,8 @@ static void test_cursor(data_t *data)
>  	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
>  	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
>  
> +	test_init(data);
> +
>  	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,
>  			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
>  
> @@ -355,15 +375,13 @@ static void test_invalid(data_t *data)
>  	int ret;
>  	uint32_t width, height;
>  	struct igt_fb fb;
> +	drmModeModeInfo *mode;
>  
> -	/* TODO: support more vendors */
> -	igt_require(is_i915_device(data->drm_fd));
> +	mode = igt_output_get_mode(data->output);
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
>  
> -	width = data->connector->modes[0].hdisplay;
> -	height = data->connector->modes[0].vdisplay;
> -
> -	igt_require(igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
> -					       I915_FORMAT_MOD_Y_TILED));
> +	test_init(data);
>  
>  	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>  		      I915_FORMAT_MOD_Y_TILED, &fb);
> @@ -379,33 +397,6 @@ static void test_invalid(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>  
> -static void test_init(data_t *data)
> -{
> -	drmModeResPtr res;
> -	int i, ret;
> -
> -	res = drmModeGetResources(data->drm_fd);
> -	igt_assert(res);
> -
> -	kmstest_unset_all_crtcs(data->drm_fd, res);
> -
> -	data->connector = find_connector_for_modeset(data);
> -	data->crtc_id = kmstest_find_crtc_for_connector(data->drm_fd,
> -							res, data->connector, 0);
> -
> -	data->refresh_rate = data->connector->modes[0].vrefresh;
> -
> -	for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> -		make_fb(data, &data->bufs[i], data->connector, i);
> -
> -	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[0].fb_id, 0, 0,
> -			     &data->connector->connector_id, 1, &data->connector->modes[0]);
> -
> -	igt_assert(ret == 0);
> -
> -	drmModeFreeResources(res);
> -}
> -
>  static void queue_vblank(data_t *data)
>  {
>  	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
> @@ -491,13 +482,12 @@ static void test_crc(data_t *data)
>  	cairo_t *cr;
>  	int ret;
>  
> -	/* Devices without CRC can't run this test */
> -	igt_require_pipe_crc(data->drm_fd);
> -
>  	data->flip_count = 0;
>  	data->frame_count = 0;
>  	data->flip_pending = false;
>  
> +	test_init(data);
> +
>  	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
>  	igt_paint_color(cr, 0, 0, data->bufs[frame].width, data->bufs[frame].height, 1.0, 0.0, 0.0);
>  
> @@ -505,7 +495,8 @@ static void test_crc(data_t *data)
>  	igt_paint_color(cr, 0, 0, data->bufs[!frame].width, data->bufs[!frame].height, 1.0, 0.0, 0.0);
>  
>  	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
> -			     &data->connector->connector_id, 1, &data->connector->modes[0]);
> +			     &data->output->config.connector->connector_id, 1,
> +			     &data->output->config.connector->modes[0]);
>  	igt_assert_eq(ret, 0);
>  
>  	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
> @@ -577,7 +568,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
>  }
>  
>  static const char help_str[] =
> -"  --e \t\tRun the extended tests\n";
> +	"  --e \t\tRun the extended tests\n";

This should be done correctly in other patch.

>  
>  static data_t data;
>  
> @@ -598,7 +589,7 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
>  	igt_describe("Verify the async flip functionality and the fps during async flips");
>  	igt_subtest_group {
>  		igt_fixture
> -			test_init(&data);
> +			require_monotonic_timestamp(data.drm_fd);

This changed logic of test ?

--
Kamil

>  
>  		igt_describe("Wait for page flip events in between successive asynchronous flips");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> @@ -615,25 +606,47 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
>  		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
>  		igt_subtest_with_dynamic("test-time-stamp")
>  			run_test(&data, test_timestamp);
> +	}
>  
> -		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> -		igt_subtest_with_dynamic("test-cursor")
> -			run_test(&data, test_cursor);
> +	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> +	igt_subtest_with_dynamic("test-cursor") {
> +		/*
> +		 * Intel's PSR2 selective fetch adds other planes to state when
> +		 * necessary, causing the async flip to fail because async flip is not
> +		 * supported in cursor plane.
> +		 */
> +		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd),
> +			      "PSR2 sel fetch causes cursor to be added to primary plane " \
> +			      "pages flips and async flip is not supported in cursor\n");
> +
> +		run_test(&data, test_cursor);
> +	}
>  
> -		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
> -		igt_subtest_with_dynamic("invalid-async-flip")
> -			run_test(&data, test_invalid);
> +	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
> +	igt_subtest_with_dynamic("invalid-async-flip") {
> +		/* TODO: support more vendors */
> +		igt_require(is_i915_device(data.drm_fd));
> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> +						       I915_FORMAT_MOD_Y_TILED));
>  
> -		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
> -		igt_subtest_with_dynamic("crc")
> -			run_test(&data, test_crc);
> +		run_test(&data, test_invalid);
> +	}
>  
> -		igt_fixture {
> -			for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
> -				igt_remove_fb(data.drm_fd, &data.bufs[i]);
> -		}
> +	igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
> +	igt_subtest_with_dynamic("crc") {
> +		/* Devices without CRC can't run this test */
> +		igt_require_pipe_crc(data.drm_fd);
> +
> +		run_test(&data, test_crc);
>  	}
>  
> -	igt_fixture
> +	igt_fixture {
> +		for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
> +			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> +
> +		igt_display_reset(&data.display);
> +		igt_display_commit(&data.display);
>  		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
>  }
> -- 
> 2.22.0
> 
