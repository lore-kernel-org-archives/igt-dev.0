Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14DA89A61
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2019 12:01:07 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 10 Dec 2019 11:53:58 +0000
Message-ID: <cf7bd66da867a40167a4216620b088a92b02963b.camel@intel.com>
References: <1575897543-24266-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1575897543-24266-1-git-send-email-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-ID: <D48FF322A00DD64FA55A0071475D7A17@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Fix user space
 read too slow error
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
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 2019-12-09 at 15:19 +0200, Juha-Pekka Heikkila wrote:
> Having crc running continuously cause this test sometime
> fill crc buffer, fix this problem as well as do some generic
> cleanups.
The difference between this and the previous one is removed gem_sync()
function from restore_image()? 

Maybe we could add note on changes in commit message.

Cheers,
Mika

> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_cursor_crc.c | 109 +++++++++++++++++++++++++------------
> ------------
>  1 file changed, 56 insertions(+), 53 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 6475dea..9542141 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -52,7 +52,6 @@ typedef struct {
>  	struct igt_fb fb;
>  	igt_output_t *output;
>  	enum pipe pipe;
> -	igt_crc_t ref_crc;
>  	int left, right, top, bottom;
>  	int screenw, screenh;
>  	int refresh;
> @@ -60,6 +59,9 @@ typedef struct {
>  	int cursor_max_w, cursor_max_h;
>  	igt_pipe_crc_t *pipe_crc;
>  	unsigned flags;
> +	igt_plane_t *primary;
> +	igt_plane_t *cursor;
> +	cairo_surface_t *surface;
>  } data_t;
>  
>  #define TEST_DPMS (1<<0)
> @@ -89,23 +91,15 @@ static void draw_cursor(cairo_t *cr, int x, int
> y, int cw, int ch, double a)
>  
>  static void cursor_enable(data_t *data)
>  {
> -	igt_output_t *output = data->output;
> -	igt_plane_t *cursor =
> -		igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_CURSOR);
> -
> -	igt_plane_set_fb(cursor, &data->fb);
> -	igt_plane_set_size(cursor, data->curw, data->curh);
> -	igt_fb_set_size(&data->fb, cursor, data->curw, data->curh);
> +	igt_plane_set_fb(data->cursor, &data->fb);
> +	igt_plane_set_size(data->cursor, data->curw, data->curh);
> +	igt_fb_set_size(&data->fb, data->cursor, data->curw, data-
> >curh);
>  }
>  
>  static void cursor_disable(data_t *data)
>  {
> -	igt_output_t *output = data->output;
> -	igt_plane_t *cursor =
> -		igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_CURSOR);
> -
> -	igt_plane_set_fb(cursor, NULL);
> -	igt_plane_set_position(cursor, 0, 0);
> +	igt_plane_set_fb(data->cursor, NULL);
> +	igt_plane_set_position(data->cursor, 0, 0);
>  }
>  
>  static bool chv_cursor_broken(data_t *data, int x)
> @@ -144,37 +138,47 @@ static bool cursor_visible(data_t *data, int x,
> int y)
>  	return true;
>  }
>  
> +static void restore_image(data_t *data)
> +{
> +	cairo_t *cr;
> +
> +	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
> +	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> +	cairo_set_source_surface(cr, data->surface, 0, 0);
> +	cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
> +	cairo_fill(cr);
> +	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
> +	igt_dirty_fb(data->drm_fd, &data->primary_fb);
> +}
> +
>  static void do_single_test(data_t *data, int x, int y)
>  {
>  	igt_display_t *display = &data->display;
>  	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
>  	igt_crc_t crc, ref_crc;
> -	igt_plane_t *cursor =
> -		igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_CURSOR);
>  	cairo_t *cr;
>  	int ret = 0;
>  
>  	igt_print_activity();
>  
>  	/* Hardware test */
> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
> -	igt_paint_test_pattern(cr, data->screenw, data->screenh);
> -	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
> +	restore_image(data);
>  
> +	igt_plane_set_position(data->cursor, x, y);
>  	cursor_enable(data);
> -	igt_plane_set_position(cursor, x, y);
>  
>  	if (chv_cursor_broken(data, x) && cursor_visible(data, x, y)) {
>  		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>  		igt_assert_eq(ret, -EINVAL);
> -		igt_plane_set_position(cursor, 0, y);
> +		igt_plane_set_position(data->cursor, 0, y);
>  
>  		return;
>  	}
>  
>  	igt_display_commit(display);
>  
> -	igt_wait_for_vblank(data->drm_fd, data->pipe);
> +	/* Extra vblank wait is because nonblocking cursor ioctl */
> +	igt_wait_for_vblank_count(data->drm_fd, data->pipe, 2);
>  	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>  
>  	if (data->flags & (TEST_DPMS | TEST_SUSPEND)) {
> @@ -211,39 +215,29 @@ static void do_single_test(data_t *data, int x,
> int y)
>  	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
>  	draw_cursor(cr, x, y, data->curw, data->curh, 1.0);
>  	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
> -	igt_display_commit(display);
> -
> +	igt_dirty_fb(data->drm_fd, &data->primary_fb);
> +	/* Extra vblank wait is because nonblocking cursor ioctl */
>  	igt_wait_for_vblank(data->drm_fd, data->pipe);
> -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
>  
> +	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
>  	igt_assert_crc_equal(&crc, &ref_crc);
> -
> -	/* Clear screen afterwards */
> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
> -	igt_paint_color(cr, 0, 0, data->screenw, data->screenh, 0.0,
> 0.0, 0.0);
> -	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
>  }
>  
>  static void do_fail_test(data_t *data, int x, int y, int expect)
>  {
>  	igt_display_t *display = &data->display;
> -	igt_plane_t *cursor =
> -		igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_CURSOR);
> -	cairo_t *cr;
>  	int ret;
>  
>  	igt_print_activity();
>  
>  	/* Hardware test */
> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
> -	igt_paint_test_pattern(cr, data->screenw, data->screenh);
> -	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
> +	restore_image(data);
>  
>  	cursor_enable(data);
> -	igt_plane_set_position(cursor, x, y);
> +	igt_plane_set_position(data->cursor, x, y);
>  	ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>  
> -	igt_plane_set_position(cursor, 0, 0);
> +	igt_plane_set_position(data->cursor, 0, 0);
>  	cursor_disable(data);
>  	igt_display_commit(display);
>  
> @@ -355,6 +349,11 @@ static void cleanup_crtc(data_t *data)
>  	igt_pipe_crc_free(data->pipe_crc);
>  	data->pipe_crc = NULL;
>  
> +	cairo_surface_destroy(data->surface);
> +
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_display_commit(display);
> +
>  	igt_remove_fb(data->drm_fd, &data->primary_fb);
>  
>  	igt_display_reset(display);
> @@ -365,7 +364,7 @@ static void prepare_crtc(data_t *data,
> igt_output_t *output,
>  {
>  	drmModeModeInfo *mode;
>  	igt_display_t *display = &data->display;
> -	igt_plane_t *primary;
> +	cairo_t *cr;
>  
>  	/* select the pipe we want to use */
>  	igt_output_set_pipe(output, data->pipe);
> @@ -378,8 +377,10 @@ static void prepare_crtc(data_t *data,
> igt_output_t *output,
>  			    0.0, 0.0, 0.0,
>  			    &data->primary_fb);
>  
> -	primary = igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data->primary_fb);
> +	data->primary = igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +	data->cursor = igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_CURSOR);
> +
> +	igt_plane_set_fb(data->primary, &data->primary_fb);
>  
>  	igt_display_commit(display);
>  
> @@ -398,9 +399,15 @@ static void prepare_crtc(data_t *data,
> igt_output_t *output,
>  	data->curh = cursor_h;
>  	data->refresh = mode->vrefresh;
>  
> -	/* get reference crc w/o cursor */
> +	/* store test image as cairo surface */
> +	data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
> data->screenw, data->screenh);
> +
> +	cr = cairo_create(data->surface);
> +	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> +	igt_paint_test_pattern(cr, data->screenw, data->screenh);
> +	cairo_destroy(cr);
> +
>  	igt_pipe_crc_start(data->pipe_crc);
> -	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &data-
> >ref_crc);
>  }
>  
>  static void test_cursor_alpha(data_t *data, double a)
> @@ -521,8 +528,6 @@ static void test_cursor_size(data_t *data)
>  	uint32_t fb_id;
>  	int i, size;
>  	int cursor_max_size = data->cursor_max_w;
> -	igt_plane_t *cursor =
> -		igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_CURSOR);
>  
>  	/* Create a maximum size cursor, then change the size in flight
> to
>  	 * smaller ones to see that the size is applied correctly
> @@ -541,8 +546,8 @@ static void test_cursor_size(data_t *data)
>  	cursor_enable(data);
>  	for (i = 0, size = cursor_max_size; size >= 64; size /= 2, i++)
> {
>  		/* Change size in flight: */
> -		igt_plane_set_size(cursor, size, size);
> -		igt_fb_set_size(&data->fb, cursor, size, size);
> +		igt_plane_set_size(data->cursor, size, size);
> +		igt_fb_set_size(&data->fb, data->cursor, size, size);
>  		igt_display_commit(display);
>  		igt_wait_for_vblank(data->drm_fd, data->pipe);
>  		igt_pipe_crc_get_current(data->drm_fd, pipe_crc,
> &crc[i]);
> @@ -575,26 +580,24 @@ static void test_rapid_movement(data_t *data)
>  	int x = 0, y = 0;
>  	long usec;
>  	igt_display_t *display = &data->display;
> -	igt_plane_t *cursor =
> -		igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_CURSOR);
>  
>  	cursor_enable(data);
>  
>  	gettimeofday(&start, NULL);
>  	for ( ; x < 100; x++) {
> -		igt_plane_set_position(cursor, x, y);
> +		igt_plane_set_position(data->cursor, x, y);
>  		igt_display_commit(display);
>  	}
>  	for ( ; y < 100; y++) {
> -		igt_plane_set_position(cursor, x, y);
> +		igt_plane_set_position(data->cursor, x, y);
>  		igt_display_commit(display);
>  	}
>  	for ( ; x > 0; x--) {
> -		igt_plane_set_position(cursor, x, y);
> +		igt_plane_set_position(data->cursor, x, y);
>  		igt_display_commit(display);
>  	}
>  	for ( ; y > 0; y--) {
> -		igt_plane_set_position(cursor, x, y);
> +		igt_plane_set_position(data->cursor, x, y);
>  		igt_display_commit(display);
>  	}
>  	gettimeofday(&end, NULL);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
