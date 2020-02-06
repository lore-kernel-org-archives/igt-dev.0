Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA2F6EA45
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 11:53:27 +0000 (UTC)
Date: Thu, 6 Feb 2020 13:53:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200206115322.GN13686@intel.com>
References: <20200206020944.338033-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206020944.338033-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/kms_frontbuffer_tracking: Add
 tiling to test_mode
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
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 05, 2020 at 06:09:41PM -0800, Jos=E9 Roberto de Souza wrote:
> This will allow us to do tests with different tile types, for now
> all tests will continue to run with the default X tiling.
> =

> It also allow user to run all tests with liner tiling when set by
> parameter.
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_frontbuffer_tracking.c | 122 ++++++++++++++++++++-----------
>  1 file changed, 78 insertions(+), 44 deletions(-)
> =

> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tra=
cking.c
> index 2c765c34..63b5d12d 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -130,6 +130,14 @@ struct test_mode {
>  		FLIP_COUNT,
>  	} flip;
>  =

> +	enum tile_type {
> +		TILE_LINEAR =3D 0,
> +		TILE_X,
> +		TILE_Y,
> +		TILE_COUNT,
> +		TILE_DEFAULT =3D TILE_X,
> +	} tile;

Looks totally redundant. What's the point of this enum?

> +
>  	enum igt_draw_method method;
>  };
>  =

> @@ -235,7 +243,7 @@ struct {
>  	int only_pipes;
>  	int shared_fb_x_offset;
>  	int shared_fb_y_offset;
> -	uint64_t tiling;
> +	enum tile_type tiling;
>  } opt =3D {
>  	.check_status =3D true,
>  	.check_crc =3D true,
> @@ -248,7 +256,7 @@ struct {
>  	.only_pipes =3D PIPE_COUNT,
>  	.shared_fb_x_offset =3D 248,
>  	.shared_fb_y_offset =3D 500,
> -	.tiling =3D LOCAL_I915_FORMAT_MOD_X_TILED,
> +	.tiling =3D TILE_DEFAULT,
>  };
>  =

>  struct modeset_params {
> @@ -443,13 +451,26 @@ static bool init_modeset_cached_params(void)
>  	return true;
>  }
>  =

> +static uint64_t tile_to_modifier(enum tile_type tile)
> +{
> +	switch (tile) {
> +	case TILE_LINEAR:
> +		return LOCAL_DRM_FORMAT_MOD_NONE;
> +	case TILE_X:
> +		return LOCAL_I915_FORMAT_MOD_X_TILED;
> +	case TILE_Y:
> +		return LOCAL_I915_FORMAT_MOD_Y_TILED;
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
>  static void create_fb(enum pixel_format pformat, int width, int height,
> -		      uint64_t tiling, int plane, struct igt_fb *fb)
> +		      enum tile_type tile, int plane, struct igt_fb *fb)
>  {
>  	uint32_t format;
> -	uint64_t size;
> +	uint64_t size, modifier;
>  	unsigned int stride;
> -	uint64_t tiling_for_size;
>  =

>  	switch (pformat) {
>  	case FORMAT_RGB888:
> @@ -479,19 +500,14 @@ static void create_fb(enum pixel_format pformat, in=
t width, int height,
>  		igt_assert(false);
>  	}
>  =

> -	/* We want all frontbuffers with the same width/height/format to have
> -	 * the same size regardless of tiling since we want to properly exercise
> -	 * the Kernel's specific tiling-checking code paths without accidentally
> -	 * hitting size-checking ones first. */
> -	if (plane =3D=3D PLANE_CUR)
> -		tiling_for_size =3D LOCAL_DRM_FORMAT_MOD_NONE;
> -	else
> -		tiling_for_size =3D opt.tiling;
> +	modifier =3D tile_to_modifier(tile);
>  =

> -	igt_calc_fb_size(drm.fd, width, height, format, tiling_for_size, &size,
> +	igt_warn_on(plane =3D=3D PLANE_CUR && tile !=3D TILE_LINEAR);
> +
> +	igt_calc_fb_size(drm.fd, width, height, format, modifier, &size,
>  			 &stride);
>  =

> -	igt_create_fb_with_bo_size(drm.fd, width, height, format, tiling,
> +	igt_create_fb_with_bo_size(drm.fd, width, height, format, modifier,
>  				   IGT_COLOR_YCBCR_BT709,
>  				   IGT_COLOR_YCBCR_LIMITED_RANGE,
>  				   fb, size, stride);
> @@ -593,7 +609,7 @@ static void fill_fb(struct igt_fb *fb, enum color eco=
lor)
>   * We do it vertically instead of the more common horizontal case in ord=
er to
>   * avoid super huge strides not supported by FBC.
>   */
> -static void create_shared_fb(enum pixel_format format)
> +static void create_shared_fb(enum pixel_format format, enum tile_type ti=
le)
>  {
>  	int prim_w, prim_h, scnd_w, scnd_h, offs_w, offs_h, big_w, big_h;
>  	struct screen_fbs *s =3D &fbs[format];
> @@ -620,7 +636,7 @@ static void create_shared_fb(enum pixel_format format)
>  =

>  	big_h =3D prim_h + scnd_h + offs_h + opt.shared_fb_y_offset;
>  =

> -	create_fb(format, big_w, big_h, opt.tiling, PLANE_PRI, &s->big);
> +	create_fb(format, big_w, big_h, tile, PLANE_PRI, &s->big);
>  }
>  =

>  static void destroy_fbs(enum pixel_format format)
> @@ -642,7 +658,7 @@ static void destroy_fbs(enum pixel_format format)
>  	igt_remove_fb(drm.fd, &s->big);
>  }
>  =

> -static void create_fbs(enum pixel_format format)
> +static void create_fbs(enum pixel_format format, enum tile_type tile)
>  {
>  	struct screen_fbs *s =3D &fbs[format];
>  =

> @@ -652,30 +668,29 @@ static void create_fbs(enum pixel_format format)
>  	s->initialized =3D true;
>  =

>  	create_fb(format, prim_mode_params.mode->hdisplay,
> -		  prim_mode_params.mode->vdisplay, opt.tiling, PLANE_PRI,
> +		  prim_mode_params.mode->vdisplay, tile, PLANE_PRI,
>  		  &s->prim_pri);
>  	create_fb(format, prim_mode_params.cursor.w,
>  		  prim_mode_params.cursor.h, LOCAL_DRM_FORMAT_MOD_NONE,
>  		  PLANE_CUR, &s->prim_cur);
>  	create_fb(format, prim_mode_params.sprite.w,
> -		  prim_mode_params.sprite.h, opt.tiling, PLANE_SPR,
> -		  &s->prim_spr);
> +		  prim_mode_params.sprite.h, tile, PLANE_SPR, &s->prim_spr);
>  =

> -	create_fb(format, offscreen_fb.w, offscreen_fb.h, opt.tiling, PLANE_PRI,
> +	create_fb(format, offscreen_fb.w, offscreen_fb.h, tile, PLANE_PRI,
>  		  &s->offscreen);
>  =

> -	create_shared_fb(format);
> +	create_shared_fb(format, tile);
>  =

>  	if (!scnd_mode_params.output)
>  		return;
>  =

>  	create_fb(format, scnd_mode_params.mode->hdisplay,
> -		  scnd_mode_params.mode->vdisplay, opt.tiling, PLANE_PRI,
> +		  scnd_mode_params.mode->vdisplay, tile, PLANE_PRI,
>  		  &s->scnd_pri);
>  	create_fb(format, scnd_mode_params.cursor.w, scnd_mode_params.cursor.h,
>  		  LOCAL_DRM_FORMAT_MOD_NONE, PLANE_CUR, &s->scnd_cur);
>  	create_fb(format, scnd_mode_params.sprite.w, scnd_mode_params.sprite.h,
> -		  opt.tiling, PLANE_SPR, &s->scnd_spr);
> +		  tile, PLANE_SPR, &s->scnd_spr);
>  }
>  =

>  static void __set_prim_plane_for_params(struct modeset_params *params)
> @@ -1175,7 +1190,7 @@ static void collect_crc(igt_crc_t *crc)
>  	igt_pipe_crc_collect_crc(pipe_crc, crc);
>  }
>  =

> -static void init_blue_crc(enum pixel_format format)
> +static void init_blue_crc(enum pixel_format format, enum tile_type tile)
>  {
>  	struct igt_fb blue;
>  =

> @@ -1183,7 +1198,7 @@ static void init_blue_crc(enum pixel_format format)
>  		return;
>  =

>  	create_fb(format, prim_mode_params.mode->hdisplay,
> -		  prim_mode_params.mode->vdisplay, opt.tiling, PLANE_PRI,
> +		  prim_mode_params.mode->vdisplay, tile, PLANE_PRI,
>  		  &blue);
>  =

>  	fill_fb(&blue, COLOR_PRIM_BG);
> @@ -1209,7 +1224,7 @@ static void init_blue_crc(enum pixel_format format)
>  	blue_crcs[format].initialized =3D true;
>  }
>  =

> -static void init_crcs(enum pixel_format format,
> +static void init_crcs(enum pixel_format format, enum tile_type tile,
>  		      struct draw_pattern_info *pattern)
>  {
>  	int r, r_;
> @@ -1223,7 +1238,7 @@ static void init_crcs(enum pixel_format format,
>  =

>  	for (r =3D 0; r < pattern->n_rects; r++)
>  		create_fb(format, prim_mode_params.mode->hdisplay,
> -			  prim_mode_params.mode->vdisplay, opt.tiling,
> +			  prim_mode_params.mode->vdisplay, tile,
>  			  PLANE_PRI, &tmp_fbs[r]);
>  =

>  	for (r =3D 0; r < pattern->n_rects; r++)
> @@ -1288,7 +1303,7 @@ static void setup_modeset(void)
>  	offscreen_fb.fb =3D NULL;
>  	offscreen_fb.w =3D 1024;
>  	offscreen_fb.h =3D 1024;
> -	create_fbs(FORMAT_DEFAULT);
> +	create_fbs(FORMAT_DEFAULT, opt.tiling);
>  }
>  =

>  static void teardown_modeset(void)
> @@ -1749,7 +1764,7 @@ static void set_crtc_fbs(const struct test_mode *t)
>  {
>  	struct screen_fbs *s =3D &fbs[t->format];
>  =

> -	create_fbs(t->format);
> +	create_fbs(t->format, t->tile);
>  =

>  	switch (t->fbs) {
>  	case FBS_INDIVIDUAL:
> @@ -1809,9 +1824,9 @@ static void prepare_subtest_data(const struct test_=
mode *t,
>  	if (need_modeset)
>  		igt_display_commit(&drm.display);
>  =

> -	init_blue_crc(t->format);
> +	init_blue_crc(t->format, t->tile);
>  	if (pattern)
> -		init_crcs(t->format, pattern);
> +		init_crcs(t->format, t->tile, pattern);
>  =

>  	need_modeset =3D enable_features_for_test(t);
>  	if (need_modeset)
> @@ -2290,7 +2305,7 @@ static void flip_subtest(const struct test_mode *t)
>  	prepare_subtest(t, pattern);
>  =

>  	create_fb(t->format, params->primary.fb->width, params->primary.fb->hei=
ght,
> -		  opt.tiling, t->plane, &fb2);
> +		  t->tile, t->plane, &fb2);
>  	fill_fb(&fb2, bg_color);
>  	orig_fb =3D params->primary.fb;
>  =

> @@ -2336,7 +2351,7 @@ static void fliptrack_subtest(const struct test_mod=
e *t, enum flip_type type)
>  	prepare_subtest(t, pattern);
>  =

>  	create_fb(t->format, params->primary.fb->width, params->primary.fb->hei=
ght,
> -		  opt.tiling, t->plane, &fb2);
> +		  t->tile, t->plane, &fb2);
>  	fill_fb(&fb2, COLOR_PRIM_BG);
>  	orig_fb =3D params->primary.fb;
>  =

> @@ -2494,7 +2509,7 @@ static void fullscreen_plane_subtest(const struct t=
est_mode *t)
>  	prepare_subtest(t, pattern);
>  =

>  	rect =3D pattern->get_rect(&params->primary, 0);
> -	create_fb(t->format, rect.w, rect.h, opt.tiling, t->plane,
> +	create_fb(t->format, rect.w, rect.h, t->tile, t->plane,
>  		  &fullscreen_fb);
>  	/* Call pick_color() again since PRI and SPR may not support the same
>  	 * pixel formats. */
> @@ -2567,7 +2582,7 @@ static void scaledprimary_subtest(const struct test=
_mode *t)
>  	old_fb =3D reg->fb;
>  =

>  	create_fb(t->format, reg->fb->width, reg->fb->height,
> -		  opt.tiling, t->plane, &new_fb);
> +		  t->tile, t->plane, &new_fb);
>  	fill_fb(&new_fb, COLOR_BLUE);
>  =

>  	igt_draw_rect_fb(drm.fd, drm.bufmgr, NULL, &new_fb, t->method,
> @@ -2662,7 +2677,7 @@ static void modesetfrombusy_subtest(const struct te=
st_mode *t)
>  	prepare_subtest(t, NULL);
>  =

>  	create_fb(t->format, params->primary.fb->width, params->primary.fb->hei=
ght,
> -		  opt.tiling, t->plane, &fb2);
> +		  t->tile, t->plane, &fb2);
>  	fill_fb(&fb2, COLOR_PRIM_BG);
>  =

>  	start_busy_thread(params->primary.fb);
> @@ -2762,7 +2777,7 @@ static void farfromfence_subtest(const struct test_=
mode *t)
>  	prepare_subtest(t, pattern);
>  	target =3D pick_target(t, params);
>  =

> -	create_fb(t->format, params->mode->hdisplay, max_height, opt.tiling,
> +	create_fb(t->format, params->mode->hdisplay, max_height, t->tile,
>  		  t->plane, &tall_fb);
>  =

>  	fill_fb(&tall_fb, COLOR_PRIM_BG);
> @@ -2838,7 +2853,7 @@ static void badstride_subtest(const struct test_mod=
e *t)
>  	old_fb =3D params->primary.fb;
>  =

>  	create_fb(t->format, params->primary.fb->width + 4096, params->primary.=
fb->height,
> -		  opt.tiling, t->plane, &wide_fb);
> +		  t->tile, t->plane, &wide_fb);
>  	igt_assert(wide_fb.strides[0] > 16384);
>  =

>  	fill_fb(&wide_fb, COLOR_PRIM_BG);
> @@ -3018,7 +3033,7 @@ static void basic_subtest(const struct test_mode *t)
>  	prepare_subtest(t, pattern);
>  =

>  	create_fb(t->format, params->primary.fb->width, params->primary.fb->hei=
ght,
> -		  opt.tiling, t->plane, &fb2);
> +		  t->tile, t->plane, &fb2);
>  	fb1 =3D params->primary.fb;
>  =

>  	for (r =3D 0, method =3D 0; method < IGT_DRAW_METHOD_COUNT; method++, r=
++) {
> @@ -3093,10 +3108,12 @@ static int opt_handler(int option, int option_ind=
ex, void *data)
>  		break;
>  	case 'l':
>  		if (!strcmp(optarg, "x"))
> -			opt.tiling =3D LOCAL_I915_FORMAT_MOD_X_TILED;
> +			opt.tiling =3D TILE_X;
>  		else if (!strcmp(optarg, "y"))
> -			opt.tiling =3D LOCAL_I915_FORMAT_MOD_Y_TILED;
> -		else {
> +			opt.tiling =3D TILE_Y;
> +		else if (!strcmp(optarg, "l")) {
> +			opt.tiling =3D TILE_LINEAR;
> +		} else {
>  			igt_warn("Bad tiling value: %s\n", optarg);
>  			return IGT_OPT_HANDLER_ERROR;
>  		}
> @@ -3228,9 +3245,24 @@ static const char *flip_str(enum flip_type flip)
>  	}
>  }
>  =

> +static const char *tile_str(enum tile_type tile)
> +{
> +	switch (tile) {
> +	case TILE_LINEAR:
> +		return "linear";
> +	case TILE_X:
> +		return "x";
> +	case TILE_Y:
> +		return "y";
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
>  #define TEST_MODE_ITER_BEGIN(t) \
>  	t.format =3D FORMAT_DEFAULT;					   \
>  	t.flip =3D FLIP_PAGEFLIP;						   \
> +	t.tile =3D opt.tiling;						   \
>  	for (t.feature =3D 0; t.feature < FEATURE_COUNT; t.feature++) {	   \
>  	for (t.pipes =3D 0; t.pipes < PIPE_COUNT; t.pipes++) {		   \
>  	for (t.screen =3D 0; t.screen < SCREEN_COUNT; t.screen++) {	   \
> @@ -3288,6 +3320,7 @@ igt_main_args("", long_options, help_str, opt_handl=
er, NULL)
>  			/* Make sure nothing is using these values. */
>  			t.flip =3D -1;
>  			t.method =3D -1;
> +			t.tile =3D opt.tiling;
>  =

>  			igt_subtest_f("%s-%s-rte",
>  				      feature_str(t.feature),
> @@ -3472,6 +3505,7 @@ igt_main_args("", long_options, help_str, opt_handl=
er, NULL)
>  	t.feature =3D FEATURE_DEFAULT;
>  	t.format =3D FORMAT_DEFAULT;
>  	t.flip =3D FLIP_PAGEFLIP;
> +	t.tile =3D opt.tiling;
>  	igt_subtest("basic") {
>  		igt_require_gem(drm.fd);
>  		basic_subtest(&t);
> -- =

> 2.25.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
