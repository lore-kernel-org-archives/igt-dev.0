Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8E110E3D2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 09:04:58 +0000 (UTC)
Message-ID: <467e15bc-84a0-cf99-7601-789a81f59e38@intel.com>
Date: Wed, 17 May 2023 14:34:46 +0530
Content-Language: en-US
To: Arun R Murthy <arun.r.murthy@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230516062206.1064604-1-arun.r.murthy@intel.com>
 <20230516062206.1064604-3-arun.r.murthy@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230516062206.1064604-3-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/kms_async_flips: Split
 test_init()
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


On 5/16/2023 11:52 AM, Arun R Murthy wrote:
> Split the test_init() into two parts: one sets up the mode, the
> other the framebuffers. Will be useful for testing different
> modifiers.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 37 +++++++++++++++++++------------------
>   1 file changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 1c036426..f54bd7ca 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -148,23 +148,31 @@ static void require_monotonic_timestamp(int fd)
>   
>   static void test_init(data_t *data)
>   {
> -	int i;
> -	uint32_t width, height;
> -	igt_plane_t *plane;
> -	static uint32_t prev_output_id;
>   	drmModeModeInfo *mode;
>   
>   	igt_display_reset(&data->display);
>   	igt_display_commit(&data->display);
>   
>   	mode = igt_output_get_mode(data->output);
> -	width = mode->hdisplay;
> -	height = mode->vdisplay;
>   
>   	data->crtc_id = data->display.pipes[data->pipe].crtc_id;
>   	data->refresh_rate = mode->vrefresh;
>   
>   	igt_output_set_pipe(data->output, data->pipe);
> +}
> +
> +static void test_init_fbs(data_t *data)
> +{
> +	int i;
> +	uint32_t width, height;
> +	igt_plane_t *plane;
> +	static uint32_t prev_output_id;
> +	drmModeModeInfo *mode;
> +
> +	mode = igt_output_get_mode(data->output);
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
> +
>   	plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>   
>   	if (prev_output_id != data->output->id) {
> @@ -191,8 +199,6 @@ static void test_async_flip(data_t *data)
>   	long long int fps;
>   	struct timeval start, end, diff;
>   
> -	test_init(data);
> -
>   	gettimeofday(&start, NULL);
>   	frame = 1;
>   	do {
> @@ -287,8 +293,6 @@ static void test_timestamp(data_t *data)
>   	unsigned int seq, seq1;
>   	int ret;
>   
> -	test_init(data);
> -
>   	/*
>   	 * In older platforms(<= gen10), async address update bit is double buffered.
>   	 * So flip timestamp can be verified only from the second flip.
> @@ -346,8 +350,6 @@ static void test_cursor(data_t *data)
>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
>   
> -	test_init(data);
> -
>   	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,
>   			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
>   
> @@ -388,8 +390,6 @@ static void test_invalid(data_t *data)
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
> -	test_init(data);
> -
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   		      I915_FORMAT_MOD_Y_TILED, &fb);
>   
> @@ -493,8 +493,6 @@ static void test_crc(data_t *data)
>   	data->frame_count = 0;
>   	data->flip_pending = false;
>   
> -	test_init(data);
> -
>   	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
>   	igt_paint_color(cr, 0, 0, data->bufs[frame].width, data->bufs[frame].height, 1.0, 0.0, 0.0);
>   	igt_put_cairo_ctx(cr);
> @@ -550,15 +548,18 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_display_t *display = &data->display;
>   
> -	for_each_valid_output_on_pipe(display, data->pipe, data->output) {
> + 	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>   		igt_display_reset(display);
>   
>   		igt_output_set_pipe(data->output, data->pipe);
>   		if (!i915_pipe_output_combo_valid(display))
>   			continue;
>   
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
> +		test_init(data);
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
> +			test_init_fbs(data);
>   			test(data);
> +		}
>   
>   		if (!data->extended)
>   			break;
