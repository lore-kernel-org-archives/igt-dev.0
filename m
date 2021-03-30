Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587E56E910
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Mar 2021 14:40:41 +0000 (UTC)
Date: Tue, 30 Mar 2021 17:40:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YGM4ZUNzzYKt1xwO@intel.com>
References: <20210324183008.18170-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324183008.18170-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: use flipping
 instead of frontbuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 08:30:08PM +0200, Juha-Pekka Heikkila wrote:
> take out frontbuffer usage from this test as it may fail this test
> on frontbuffer related issues instead of cursor issues
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_cursor_crc.c | 98 +++++++++++++++++++++++-------------------
>  1 file changed, 54 insertions(+), 44 deletions(-)
> =

> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 13d6156c9..d172d703e 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -70,8 +70,8 @@ typedef struct {
>  #define TEST_DPMS (1<<0)
>  #define TEST_SUSPEND (1<<1)
>  =

> -#define FRONTBUFFER 0
> -#define RESTOREBUFFER 1
> +#define HWCURSORBUFFER 0
> +#define SWCOMPARISONBUFFER 1
>  =

>  static void draw_cursor(cairo_t *cr, int x, int y, int cw, int ch, doubl=
e a)
>  {
> @@ -144,22 +144,16 @@ static bool cursor_visible(data_t *data, int x, int=
 y)
>  	return true;
>  }
>  =

> -static void restore_image(data_t *data)
> +static void restore_image(data_t *data, uint32_t buffer)
>  {
>  	cairo_t *cr;
> -	igt_display_t *display =3D &data->display;
>  =

> -	/* rendercopy stripped in igt using cairo */
> -	cr =3D igt_get_cairo_ctx(data->drm_fd,
> -			       &data->primary_fb[FRONTBUFFER]);
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[buffer]);
>  	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>  	cairo_set_source_surface(cr, data->surface, 0, 0);
>  	cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
>  	cairo_fill(cr);
>  	igt_put_cairo_ctx(cr);
> -	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    display->pipes[data->pipe].crtc_offset);
>  }
>  =

>  static void do_single_test(data_t *data, int x, int y)
> @@ -168,13 +162,11 @@ static void do_single_test(data_t *data, int x, int=
 y)
>  	igt_pipe_crc_t *pipe_crc =3D data->pipe_crc;
>  	igt_crc_t crc, ref_crc;
>  	cairo_t *cr;
> -	int ret =3D 0;
> +	int ret =3D 0, hwcursorframe;
>  =

>  	igt_print_activity();
>  =

>  	/* Hardware test */
> -	restore_image(data);
> -
>  	igt_plane_set_position(data->cursor, x, y);
>  	cursor_enable(data);
>  =

> @@ -182,19 +174,21 @@ static void do_single_test(data_t *data, int x, int=
 y)
>  		ret =3D igt_display_try_commit2(display, COMMIT_LEGACY);
>  		igt_assert_eq(ret, -EINVAL);
>  		igt_plane_set_position(data->cursor, 0, y);
> -
>  		return;
>  	}
>  =

>  	igt_display_commit(display);
>  =

> -	/* Extra vblank wait is because nonblocking cursor ioctl */
> -	igt_wait_for_vblank(data->drm_fd,
> -			display->pipes[data->pipe].crtc_offset);
> -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> +	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
> +	igt_display_commit(display);
> +
> +	hwcursorframe =3D kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;
> +	restore_image(data, SWCOMPARISONBUFFER);
>  =

>  	if (data->flags & (TEST_DPMS | TEST_SUSPEND)) {
>  		igt_crc_t crc_after;
> +		/* Extra vblank wait to build full crc before dpms/suspend */
> +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>  		/*
>  		 * stop/start crc to avoid dmesg notifications about userspace
>  		 * reading too slow.
> @@ -220,18 +214,22 @@ static void do_single_test(data_t *data, int x, int=
 y)
>  		igt_assert_crc_equal(&crc, &crc_after);
>  	}
>  =

> -	cursor_disable(data);
> -
>  	/* Now render the same in software and collect crc */
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBU=
FFER]);
>  	draw_cursor(cr, x, y, data->curw, data->curh, 1.0);
>  	igt_put_cairo_ctx(cr);
> +	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
>  	igt_display_commit(display);
> -	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> -	/* Extra vblank wait is because nonblocking cursor ioctl */
> +
> +	cursor_disable(data);
> +	igt_display_commit(display);

Why the double commit?

> +
>  	igt_wait_for_vblank(data->drm_fd,
>  			display->pipes[data->pipe].crtc_offset);

Why is this still here? Ah, legacy commits means cursor doesn't
block. Still a single commit should be fine AFAICS, even if
we need to keep the extra vblank waits.

>  =

> +	if (!(data->flags & (TEST_DPMS | TEST_SUSPEND)))
> +		igt_pipe_crc_get_for_frame(data->drm_fd, pipe_crc, hwcursorframe, &crc=
);

Why are we not just grabbing the crc earlier like we used to?

> +
>  	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
>  	igt_assert_crc_equal(&crc, &ref_crc);
>  }
> @@ -244,8 +242,6 @@ static void do_fail_test(data_t *data, int x, int y, =
int expect)
>  	igt_print_activity();
>  =

>  	/* Hardware test */
> -	restore_image(data);
> -
>  	cursor_enable(data);
>  	igt_plane_set_position(data->cursor, x, y);
>  	ret =3D igt_display_try_commit2(display, COMMIT_LEGACY);
> @@ -367,8 +363,8 @@ static void cleanup_crtc(data_t *data)
>  	igt_plane_set_fb(data->primary, NULL);
>  	igt_display_commit(display);
>  =

> -	igt_remove_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> -	igt_remove_fb(data->drm_fd, &data->primary_fb[RESTOREBUFFER]);
> +	igt_remove_fb(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
> +	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
>  =

>  	igt_display_reset(display);
>  }
> @@ -389,18 +385,18 @@ static void prepare_crtc(data_t *data, igt_output_t=
 *output,
>  			    DRM_FORMAT_XRGB8888,
>  			    LOCAL_DRM_FORMAT_MOD_NONE,
>  			    0.0, 0.0, 0.0,
> -			    &data->primary_fb[FRONTBUFFER]);
> +			    &data->primary_fb[HWCURSORBUFFER]);
>  =

>  	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>  			    DRM_FORMAT_XRGB8888,
>  			    LOCAL_DRM_FORMAT_MOD_NONE,
>  			    0.0, 0.0, 0.0,
> -			    &data->primary_fb[RESTOREBUFFER]);
> +			    &data->primary_fb[SWCOMPARISONBUFFER]);
>  =

>  	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  	data->cursor =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSO=
R);
>  =

> -	igt_plane_set_fb(data->primary, &data->primary_fb[FRONTBUFFER]);
> +	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
>  =

>  	igt_display_commit(display);
>  =

> @@ -428,6 +424,10 @@ static void prepare_crtc(data_t *data, igt_output_t =
*output,
>  	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>  	igt_paint_test_pattern(cr, data->screenw, data->screenh);
>  	cairo_destroy(cr);
> +
> +	/* Set HW cusor buffer in place */
> +	restore_image(data, HWCURSORBUFFER);
> +
>  	igt_pipe_crc_start(data->pipe_crc);
>  }
>  =

> @@ -447,6 +447,15 @@ static void test_cursor_alpha(data_t *data, double a)
>  				    LOCAL_DRM_FORMAT_MOD_NONE,
>  				    &data->fb);
>  	igt_assert(fb_id);
> +
> +	/* empty buffer */
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFER=
]);
> +	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
> +			0.0, 0.0, 0.0);
> +	igt_put_cairo_ctx(cr);
> +	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
> +	igt_display_commit(display);

Why are we rendering this again? Shouldn't this fb remaing unchanged
throughout the test?

> +
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
>  	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
>  	igt_put_cairo_ctx(cr);
> @@ -462,23 +471,17 @@ static void test_cursor_alpha(data_t *data, double =
a)
>  	igt_remove_fb(data->drm_fd, &data->fb);
>  =

>  	/* Software Test - render cursor in software, drawn it directly on PF */
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBU=
FFER]);
>  	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
>  	igt_put_cairo_ctx(cr);
> -
> +	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
>  	igt_display_commit(display);
>  	igt_wait_for_vblank(data->drm_fd,
> -			display->pipes[data->pipe].crtc_offset);
> +			    display->pipes[data->pipe].crtc_offset);
>  	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
>  =

>  	/* Compare CRC from Hardware/Software tests */
>  	igt_assert_crc_equal(&crc, &ref_crc);
> -
> -	/*Clear Screen*/
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> -	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
> -			0.0, 0.0, 0.0);
> -	igt_put_cairo_ctx(cr);
>  }
>  =

>  static void test_cursor_transparent(data_t *data)
> @@ -582,6 +585,11 @@ static void test_cursor_size(data_t *data)
>  			      &data->fb);
>  	igt_assert(fb_id);
>  =

> +	/* empty buffer */
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFER=
]);
> +	igt_paint_color(cr, 0, 0, data->screenw, data->screenh, 0.0, 0.0, 0.0);
> +	igt_put_cairo_ctx(cr);

Another one.

> +
>  	/* Use a solid white rectangle as the cursor */
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
>  	igt_paint_color_alpha(cr, 0, 0, cursor_max_size, cursor_max_size, 1.0, =
1.0, 1.0, 1.0);
> @@ -604,16 +612,18 @@ static void test_cursor_size(data_t *data)
>  	/* Software test loop */
>  	for (i =3D 0, size =3D cursor_max_size; size >=3D 64; size /=3D 2, i++)=
 {
>  		/* Now render the same in software and collect crc */
> -		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> +		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFE=
R]);
>  		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
>  		igt_put_cairo_ctx(cr);

and here.

> -
> +		igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
>  		igt_display_commit(display);
> -		igt_wait_for_vblank(data->drm_fd,
> -				display->pipes[data->pipe].crtc_offset);
>  		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> +
>  		/* Clear screen afterwards */
> -		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> +		igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
> +		igt_display_commit(display);
> +
> +		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFE=
R]);
>  		igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
>  				0.0, 0.0, 0.0);
>  		igt_put_cairo_ctx(cr);

Hmm. This loop is now a bit confusing. We're flipping back
and forth between the two fbs on the primary plane but we
only actually care what happens during the sw side of it.
Might make sense to combine the two loops, grab the crc for
the hw and sw cursor back-to-back, and thus just get
rid of the crc[] array entirely.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
