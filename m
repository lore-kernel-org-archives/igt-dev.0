Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000976EE33
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2020 15:26:30 +0000 (UTC)
Date: Fri, 27 Nov 2020 17:26:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20201127152627.GQ6112@intel.com>
References: <20201125195051.13373-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125195051.13373-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane: optimize pixel
 format tests
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

On Wed, Nov 25, 2020 at 09:50:50PM +0200, Juha-Pekka Heikkila wrote:
> On packed formats there's no need to show separate colors on separate fbs.
> Here augmented path with packed color handling which check colors just on
> one fb.
> =

> This cannot be directly applied to planar yuv formats because of scaler
> use with those formats.

Not entirely sure we can use this for any subsampled format. I guess
the fact that you used horizontal lines does make it work for 4:2:2
formats now, but aren't there potentially (on other hw) packed
YCbCr formats with vertical subsampling?

> =

> On my ICL this drop test execution time from 44.91s to 21.98s
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane.c | 88 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 71 insertions(+), 17 deletions(-)
> =

> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 4ce859fba..749a75eee 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -466,7 +466,8 @@ static void prepare_format_color(data_t *data, enum p=
ipe pipe,
>  				 int width, int height,
>  				 enum igt_color_encoding color_encoding,
>  				 enum igt_color_range color_range,
> -				 const color_t *c, struct igt_fb *fb)
> +				 const color_t *c, struct igt_fb *fb,
> +				 bool singlefbtest)
>  {
>  	cairo_t *cr;
>  =

> @@ -480,6 +481,15 @@ static void prepare_format_color(data_t *data, enum =
pipe pipe,
>  		igt_paint_color(cr, 0, 0, width, height,
>  				c->red, c->green, c->blue);
>  =

> +		if (singlefbtest) {
> +			for (int n =3D 0; n < data->num_colors; n++) {
> +				igt_paint_color(cr, 0, n * 4, fb->width, 2,
> +						data->colors[n].red,
> +						data->colors[n].green,
> +						data->colors[n].blue);
> +			}
> +		}
> +
>  		igt_put_cairo_ctx(cr);
>  	} else {
>  		igt_create_fb_with_bo_size(data->drm_fd,
> @@ -505,6 +515,16 @@ static void prepare_format_color(data_t *data, enum =
pipe pipe,
>  				width, height,
>  				c->red, c->green, c->blue);
>  =

> +		if (singlefbtest) {
> +			int inc =3D format !=3D DRM_FORMAT_XRGB8888 ? data->crop : 0;
> +			for (int n =3D 0; n < data->num_colors; n++) {
> +				igt_paint_color(cr, 0, inc + n * 4, fb->width, 2,
> +						data->colors[n].red,
> +						data->colors[n].green,
> +						data->colors[n].blue);

Seems like a good candidate for a new helper function

And I think I would just make it use extended_colors unconditionally,
and probably render the lines a bit thicker (eg. just
fb->height/num_ext_colors) to make it possible to actually see the
individual lines on high res displays.

> +			}
> +		}
> +
>  		igt_put_cairo_ctx(cr);
>  	}
>  =

> @@ -548,13 +568,35 @@ static void capture_crc(data_t *data, unsigned int =
vblank, igt_crc_t *crc)
>  		      crc->frame, vblank);
>  }
>  =

> -static void capture_format_crcs(data_t *data, enum pipe pipe,
> -				igt_plane_t *plane,
> -				uint32_t format, uint64_t modifier,
> -				int width, int height,
> -				enum igt_color_encoding encoding,
> -				enum igt_color_range range,
> -				igt_crc_t crc[], struct igt_fb *fb)
> +static void capture_format_crcs_packed(data_t *data, enum pipe pipe,
> +				       igt_plane_t *plane,
> +				       uint32_t format, uint64_t modifier,
> +				       int width, int height,
> +				       enum igt_color_encoding encoding,
> +				       enum igt_color_range range,
> +				       igt_crc_t crc[], struct igt_fb *fb)
> +{
> +	struct igt_fb old_fb =3D *fb;
> +	const color_t black =3D { 0.0f, 0.0f, 0.0f };
> +
> +	prepare_format_color(data, pipe, plane, format, modifier,
> +			width, height, encoding, range, &black, fb, true);
> +
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				  NULL);
> +
> +	igt_remove_fb(data->drm_fd, &old_fb);
> +
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
> +}
> +
> +static void capture_format_crcs_planar(data_t *data, enum pipe pipe,
> +				       igt_plane_t *plane,
> +				       uint32_t format, uint64_t modifier,
> +				       int width, int height,
> +				       enum igt_color_encoding encoding,
> +				       enum igt_color_range range,
> +				       igt_crc_t crc[], struct igt_fb *fb)
>  {
>  	unsigned int vblank[ARRAY_SIZE(colors_extended)];
>  	struct drm_event_vblank ev;
> @@ -567,7 +609,7 @@ restart_round:
>  		int ret;
>  =

>  		prepare_format_color(data, pipe, plane, format, modifier,
> -				     width, height, encoding, range, c, fb);
> +				     width, height, encoding, range, c, fb, false);
>  =

>  		if (data->display.is_atomic && i >=3D 1) {
>  			igt_assert(read(data->drm_fd, &ev, sizeof(ev)) =3D=3D sizeof(ev));
> @@ -684,12 +726,20 @@ static bool test_format_plane_colors(data_t *data, =
enum pipe pipe,
>  	int crc_mismatch_count =3D 0;
>  	bool result =3D true;
>  	int i;
> +	bool planar =3D igt_format_is_yuv_semiplanar(format);
>  =

> -	capture_format_crcs(data, pipe, plane, format, modifier,
> -			    width, height, encoding, range, crc, fb);
> +	if (planar)
> +		capture_format_crcs_planar(data, pipe, plane, format, modifier,
> +					   width, height, encoding, range, crc,
> +					   fb);
> +	else
> +		capture_format_crcs_packed(data, pipe, plane, format, modifier,
> +					   width, height, encoding, range, crc,
> +					   fb);
>  =

> -	for (i =3D 0; i < data->num_colors; i++) {
> -		if (!igt_check_crc_equal(&crc[i], &ref_crc[i])) {
> +	for (i =3D 0; i < (planar ? data->num_colors : 1); i++) {

Can't we just make num_colors correct? Ie. make it 1 for packed formats.

> +
> +		if (!igt_check_crc_equal(&crc[i], &ref_crc[i + (planar ? 1 : 0)])) {

This ref_crc indexing is rather ugly. I guess I would add a small helper
for it to at least hide it better.

>  			crc_mismatch_count++;
>  			crc_mismatch_mask |=3D (1 << i);
>  			result =3D false;
> @@ -784,7 +834,7 @@ static bool test_format_plane(data_t *data, enum pipe=
 pipe,
>  	uint32_t format, ref_format;
>  	uint64_t modifier, ref_modifier;
>  	uint64_t width, height;
> -	igt_crc_t ref_crc[ARRAY_SIZE(colors_extended)];
> +	igt_crc_t ref_crc[ARRAY_SIZE(colors_extended) + 1];
>  	bool result =3D true;
>  =

>  	/*
> @@ -843,9 +893,13 @@ static bool test_format_plane(data_t *data, enum pip=
e pipe,
>  		igt_remove_fb(data->drm_fd, &test_fb);
>  	}
>  =

> -	capture_format_crcs(data, pipe, plane, format, modifier,
> -			    width, height, IGT_COLOR_YCBCR_BT709,
> -			    IGT_COLOR_YCBCR_LIMITED_RANGE, ref_crc, &fb);
> +	capture_format_crcs_packed(data, pipe, plane, format, modifier,
> +				   width, height, IGT_COLOR_YCBCR_BT709,
> +				   IGT_COLOR_YCBCR_LIMITED_RANGE, ref_crc, &fb);
> +
> +	capture_format_crcs_planar(data, pipe, plane, format, modifier,
> +				   width, height, IGT_COLOR_YCBCR_BT709,
> +				   IGT_COLOR_YCBCR_LIMITED_RANGE, &ref_crc[1], &fb);
>  =

>  	/*
>  	 * Make sure we have some difference between the colors. This
> -- =

> 2.28.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
