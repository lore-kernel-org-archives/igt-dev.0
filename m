Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CC16E13A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Oct 2021 15:55:24 +0000 (UTC)
Date: Fri, 15 Oct 2021 18:55:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YWmkZyN8U7ulWNKa@intel.com>
References: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
 <20211014173934.12375-4-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211014173934.12375-4-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_cursor_crc: use same test
 path for alpha and size tests as all other tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 08:39:34PM +0300, Juha-Pekka Heikkila wrote:
> clean up cursor size change and alpha tests

Still not 100% clear on what exactly is being done. I do see we're
reusing do_single_test() more, which is good.

Anyways, assuming I understood it correctly that this is just
replacing the hand rolled stuff in a bunch of places with
do_single_test() the series is:
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

I would suggest amending the commit message with some actual=20
meat though. Now I mostly had to guess what the "clean up"
mentioned in the commit message involves.

PS.
I guess one reason why I'm also confused is that do_single_test()
is apparently two totally separate functions in disguise. Like
a wolf and a sheep inside a single donkey suit. Would be good
to split that up properly. Would make the rest of the code a
lot more obvious.

>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_cursor_crc.c | 143 +++++++++--------------------------------
>  1 file changed, 31 insertions(+), 112 deletions(-)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 5d0fc513c..513c97153 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -71,7 +71,6 @@ typedef struct {
>  	igt_plane_t *cursor;
>  	cairo_surface_t *surface;
>  	uint32_t devid;
> -	bool hwimageistestimage;
>  	double alpha;
>  } data_t;
> =20
> @@ -446,10 +445,8 @@ static void cleanup_crtc(data_t *data)
>  	igt_pipe_crc_free(data->pipe_crc);
>  	data->pipe_crc =3D NULL;
> =20
> -	if (data->hwimageistestimage) {
> -		cairo_surface_destroy(data->surface);
> -		data->surface =3D NULL;
> -	}
> +	cairo_surface_destroy(data->surface);
> +	data->surface =3D NULL;
> =20
>  	igt_plane_set_fb(data->primary, NULL);
>  	igt_display_commit(display);
> @@ -509,21 +506,18 @@ static void prepare_crtc(data_t *data, igt_output_t=
 *output,
>  	data->curh =3D cursor_h;
>  	data->refresh =3D mode->vrefresh;
> =20
> -	if (data->hwimageistestimage) {
> -		data->surface =3D cairo_image_surface_create(CAIRO_FORMAT_RGB24,
> -							   data->screenw,
> -							   data->screenh);
> +	data->surface =3D cairo_image_surface_create(CAIRO_FORMAT_RGB24,
> +						   data->screenw,
> +						   data->screenh);
> =20
> -		/* store test image as cairo surface */
> -		cr =3D cairo_create(data->surface);
> -		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> -		igt_paint_test_pattern(cr, data->screenw, data->screenh);
> -		cairo_destroy(cr);
> +	/* store test image as cairo surface */
> +	cr =3D cairo_create(data->surface);
> +	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> +	igt_paint_test_pattern(cr, data->screenw, data->screenh);
> +	cairo_destroy(cr);
> =20
> -		/* Set HW cursor buffer in place */
> -		restore_image(data, HWCURSORBUFFER, NULL);
> -	} else
> -		data->surface =3D NULL;
> +	/* Set HW cursor buffer in place */
> +	restore_image(data, HWCURSORBUFFER, NULL);
> =20
>  	igt_pipe_crc_start(data->pipe_crc);
>  }
> @@ -554,63 +548,31 @@ static void create_cursor_fb(data_t *data, int cur_=
w, int cur_h)
>  	igt_put_cairo_ctx(cr);
>  }
> =20
> -static void test_cursor_alpha(data_t *data, double a)
> +static void test_cursor_alpha(data_t *data)
>  {
> -	igt_display_t *display =3D &data->display;
> -	igt_pipe_crc_t *pipe_crc =3D data->pipe_crc;
> -	igt_crc_t crc, ref_crc;
> -	cairo_t *cr;
> -	uint32_t fb_id;
> -	int curw =3D data->curw;
> -	int curh =3D data->curh;
> -
> -	/* Alpha cursor fb with white color */
> -	fb_id =3D igt_create_fb(data->drm_fd, curw, curh,
> -				    DRM_FORMAT_ARGB8888,
> -				    DRM_FORMAT_MOD_LINEAR,
> -				    &data->fb);
> -	igt_assert(fb_id);
> +	igt_crc_t crc;
> =20
>  	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
> -	igt_display_commit(display);
> -
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
> -	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> -	igt_put_cairo_ctx(cr);
> -
> -	/* Hardware Test - enable cursor and get PF CRC */
> +	create_cursor_fb(data, data->curw, data->curh);
>  	cursor_enable(data);
> -	igt_display_commit(display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			display->pipes[data->pipe].crtc_offset);
> -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> +	do_single_test(data, 0, 0, true, &crc);
> =20
>  	cursor_disable(data);
>  	igt_remove_fb(data->drm_fd, &data->fb);
> -
> -	/* Software Test - render cursor in software, drawn it directly on PF */
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBU=
FFER1]);
> -	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> -	igt_put_cairo_ctx(cr);
> -	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER1]);
> -	igt_display_commit(display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			display->pipes[data->pipe].crtc_offset);
> -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> -
> -	/* Compare CRC from Hardware/Software tests */
> -	igt_assert_crc_equal(&crc, &ref_crc);
> +	do_single_test(data, 0, 0, false, &crc);
>  }
> =20
>  static void test_cursor_transparent(data_t *data)
>  {
> -	test_cursor_alpha(data, 0.0);
> -
> +	data->alpha =3D 0.0;
> +	test_cursor_alpha(data);
> +	data->alpha =3D 1.0;
>  }
> =20
>  static void test_cursor_opaque(data_t *data)
>  {
> -	test_cursor_alpha(data, 1.0);
> +	data->alpha =3D 1.0;
> +	test_cursor_alpha(data);
>  }
> =20
>  static void require_cursor_size(data_t *data, int w, int h)
> @@ -669,60 +631,20 @@ static void run_test(data_t *data, void (*testfunc)=
(data_t *), int cursor_w, int
> =20
>  static void test_cursor_size(data_t *data)
>  {
> -	igt_display_t *display =3D &data->display;
> -	igt_pipe_crc_t *pipe_crc =3D data->pipe_crc;
> -	igt_crc_t crc, ref_crc;
> -	cairo_t *cr;
> -	uint32_t fb_id;
> -	int i, size, prevsize =3D 0;
> -	int cursor_max_size =3D data->cursor_max_w;
> -
> -	/* Create a maximum size cursor, then change the size in flight to
> -	 * smaller ones to see that the size is applied correctly
> -	 */
> -	fb_id =3D igt_create_fb(data->drm_fd, cursor_max_size, cursor_max_size,
> -			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
> -			      &data->fb);
> -	igt_assert(fb_id);
> -
> -	/* Use a solid white rectangle as the cursor */
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
> -	igt_paint_color_alpha(cr, 0, 0, cursor_max_size, cursor_max_size, 1.0, =
1.0, 1.0, 1.0);
> -	igt_put_cairo_ctx(cr);
> +	igt_crc_t crc;
> =20
> -	/* Hardware test loop */
> -	for (i =3D 0, size =3D cursor_max_size; size >=3D 64; size /=3D 2, i++)=
 {
> +	for (data->curw =3D data->curh =3D data->cursor_max_w; data->curw >=3D =
64;
> +	     data->curw /=3D 2, data->curh /=3D 2) {
> +		igt_plane_set_fb(data->primary,
> +				 &data->primary_fb[HWCURSORBUFFER]);
> +		create_cursor_fb(data, data->curw, data->curh);
>  		cursor_enable(data);
> -		/* Change size in flight: */
> -		igt_plane_set_size(data->cursor, size, size);
> -		igt_fb_set_size(&data->fb, data->cursor, size, size);
> -		igt_display_commit(display);
> -		igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
> -		igt_display_commit(display);
> -
> -		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> +		do_single_test(data, 0, 0, true, &crc);
> =20
>  		cursor_disable(data);
> -		igt_display_commit(display);
> -
> -		/* Now render the same in software and collect crc */
> -		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONB=
UFFER1]);
> -
> -		/* remove previous cursor sw image */
> -		if (prevsize > 0)
> -			igt_paint_color(cr, 0, 0, prevsize, prevsize, 0.0, 0.0, 0.0);
> -		prevsize =3D size;
> -
> -		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
> -		igt_put_cairo_ctx(cr);
> -		igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER1]=
);
> -		igt_display_commit(display);
> -		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> -
> -		igt_assert_crc_equal(&crc, &ref_crc);
> +		igt_remove_fb(data->drm_fd, &data->fb);
> +		do_single_test(data, 0, 0, false, &crc);
>  	}
> -
> -	igt_remove_fb(data->drm_fd, &data->fb);
>  }
> =20
>  static void test_rapid_movement(data_t *data)
> @@ -790,7 +712,6 @@ static void run_size_tests(data_t *data, enum pipe pi=
pe,
>  				      w, h);
>  		}
>  		create_cursor_fb(data, w, h);
> -		data->hwimageistestimage =3D true;
>  	}
> =20
>  	/* Using created cursor FBs to test cursor support */
> @@ -828,7 +749,6 @@ static void run_tests_on_pipe(data_t *data, enum pipe=
 pipe)
>  		data->pipe =3D pipe;
>  		data->output =3D igt_get_single_output_for_pipe(&data->display, pipe);
>  		igt_require(data->output);
> -		data->hwimageistestimage =3D false;
>  		data->alpha =3D 1.0;
>  	}
> =20
> @@ -851,7 +771,6 @@ static void run_tests_on_pipe(data_t *data, enum pipe=
 pipe)
> =20
>  	igt_fixture {
>  		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> -		data->hwimageistestimage =3D true;
>  	}
> =20
>  	igt_subtest_f("pipe-%s-cursor-dpms", kmstest_pipe_name(pipe)) {
> --=20
> 2.28.0

--=20
Ville Syrj=E4l=E4
Intel
