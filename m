Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02394CCF2E5
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 13:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A1210E53A;
	Mon, 19 Oct 2026 13:09:14 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED13510E53A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 13:08:26 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xIn68-00000004Vld-2qwB; Mon, 19 Oct 2026 16:08:25 +0300
Message-ID: <534b7a9de7ecea402e757c93883348fb95af08ca.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Mon, 19 Oct 2026 16:08:29 +0300
In-Reply-To: <20261015131616.3172918-7-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-7-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 7/9] tests/kms_plane_scaling: add rotated
 plane-*-max-crc subtests
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, 2026-10-15 at 16:16 +0300, Juha-Pekka Heikkila wrote:
> Add rotation as a parameter to the max scaling crc tests. Rotation 180
> is tested for all modifiers; 90 and 270 only for Y tiling as that is
> the only modifier here that is scanned out rotated by 90/270 on any
> platform. With 90/270 the source axes are swapped, so the source
> dimension that is searched for each destination axis is swapped too.
>=20
> Rotated subtests get their own names so a failure tells directly which
> rotation broke.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 239 +++++++++++++++++++++++++-------------
>  1 file changed, 159 insertions(+), 80 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 14298df3c..336dd46d2 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -220,6 +220,44 @@
>   * @4-tiled:    4-tiled
>   */
> =20
> +/**
> + * SUBTEST: plane-%s-max-crc-rotation-180-%s
> + * Description: Probe the maximum horizontal and vertical plane %arg[1]
> + *              factor with the plane rotated by 180 degrees for %arg[2]=
 for
> + *              each supported pixel format and verify the result via cr=
c.
> + *
> + * arg[1]:
> + *
> + * @downscale:  downscaling
> + * @upscale:    upscaling
> + *
> + * arg[2]:
> + *
> + * @linear:     linear
> + * @x-tiled:    X-tiled
> + * @y-tiled:    Y-tiled
> + * @yf-tiled:   Yf-tiled
> + * @4-tiled:    4-tiled
> + */
> +
> +/**
> + * SUBTEST: plane-%s-max-crc-rotation-%s-y-tiled
> + * Description: Probe the maximum horizontal and vertical plane %arg[1]
> + *              factor with the plane rotated by %arg[2] degrees for Y-t=
iled
> + *              for each supported pixel format and verify the result vi=
a
> + *              crc.
> + *
> + * arg[1]:
> + *
> + * @downscale:  downscaling
> + * @upscale:    upscaling
> + *
> + * arg[2]:
> + *
> + * @90:         90
> + * @270:        270
> + */
> +
>  IGT_TEST_DESCRIPTION("Test display plane scaling");
> =20
>  enum scaler_combo_test_type {
> @@ -751,6 +789,16 @@ static const struct {
>  	{ I915_FORMAT_MOD_4_TILED,	"4-tiled" },
>  };
> =20
> +static const struct {
> +	igt_rotation_t rot;
> +	const char *name;
> +} scale_rotations[] =3D {
> +	{ IGT_ROTATION_0,	"" },
> +	{ IGT_ROTATION_90,	"rotation-90-" },
> +	{ IGT_ROTATION_180,	"rotation-180-" },
> +	{ IGT_ROTATION_270,	"rotation-270-" },
> +};
> +
>  static const char *format_name_lower(uint32_t format, char *buf, size_t =
len)
>  {
>  	const char *name =3D igt_format_str(format);
> @@ -830,7 +878,7 @@ static const char *scale_dir_name(enum scale_dir dir)
>  	return dir =3D=3D SCALE_DOWN ? "downscale" : "upscale";
>  }
> =20
> -static int scale_src_cap(data_t *d, enum scale_dir dir, bool scale_width=
,
> +static int scale_src_cap(data_t *d, enum scale_dir dir, bool src_width,
>  			 int dst_scaled, int align)
>  {
>  	drmModeRes *res;
> @@ -841,43 +889,63 @@ static int scale_src_cap(data_t *d, enum scale_dir =
dir, bool scale_width,
> =20
>  	res =3D drmModeGetResources(d->drm_fd);
>  	igt_assert(res);
> -	cap =3D ALIGN_DOWN(scale_width ? res->max_width : res->max_height, alig=
n);
> +	cap =3D ALIGN_DOWN(src_width ? res->max_width : res->max_height, align)=
;
>  	drmModeFreeResources(res);
> =20
>  	return cap;
>  }
> =20
> +struct scale_axis {
> +	const char *name;
> +	bool scale_width;
> +	struct igt_fb fb;
> +	int dst_w, dst_h, dst_scaled, limit;
> +	bool tested, failed;
> +};
> +
> +/* 90/270 rotation swaps which source axis lands on the scaled dst axis.=
 */
> +static bool scale_src_width(const struct scale_axis *a, igt_rotation_t r=
ot)
> +{
> +	return a->scale_width !=3D igt_rotation_90_or_270(rot);
> +}
> +
> +static void scale_src_size(const struct scale_axis *a, igt_rotation_t ro=
t,
> +			   int len, int *w, int *h)
> +{
> +	int fixed =3D a->scale_width ? a->dst_h : a->dst_w;
> +
> +	*w =3D scale_src_width(a, rot) ? len : fixed;
> +	*h =3D scale_src_width(a, rot) ? fixed : len;
> +}
> +
>  static int
>  find_scale_src_limit(data_t *d, igt_plane_t *plane, struct igt_fb *fb,
> -		     enum scale_dir dir, bool scale_width,
> -		     int dst_w, int dst_h, int align, int cap)
> +		     enum scale_dir dir, const struct scale_axis *a,
> +		     igt_rotation_t rot, int align, int cap)
>  {
>  	igt_display_t *display =3D &d->display;
> -	int fixed =3D scale_width ? dst_h : dst_w;
> -	int dst =3D scale_width ? dst_w : dst_h;
> -	int lo, hi, best;
> +	int lo, hi, best, w, h;
>  	int ret;
> =20
>  	igt_assert(align >=3D 1);
> =20
>  	igt_plane_set_fb(plane, fb);
> +	igt_plane_set_rotation(plane, rot);
>  	igt_plane_set_position(plane, 0, 0);
> -	igt_plane_set_size(plane, dst_w, dst_h);
> +	igt_plane_set_size(plane, a->dst_w, a->dst_h);
> =20
>  	/* Baseline: the unscaled 1:1 source must be accepted. */
> -	best =3D ALIGN(dst, align);
> +	best =3D ALIGN(a->dst_scaled, align);
> +	scale_src_size(a, rot, best, &w, &h);
>  	igt_fb_set_position(fb, plane, 0, 0);
> -	igt_fb_set_size(fb, plane,
> -			scale_width ? best : fixed,
> -			scale_width ? fixed : best);
> +	igt_fb_set_size(fb, plane, w, h);
>  	ret =3D igt_display_try_commit_atomic(display,
>  					    DRM_MODE_ATOMIC_TEST_ONLY |
>  					    DRM_MODE_ATOMIC_ALLOW_MODESET,
>  					    NULL);
>  	if (ret) {
>  		igt_debug("Unscaled %dx%d source rejected (ret=3D%d)\n",
> -			  scale_width ? best : fixed,
> -			  scale_width ? fixed : best, ret);
> +			  w, h, ret);
>  		igt_plane_set_fb(plane, NULL);
>  		return ret;
>  	}
> @@ -896,10 +964,9 @@ find_scale_src_limit(data_t *d, igt_plane_t *plane, =
struct igt_fb *fb,
>  		mid =3D (dir =3D=3D SCALE_DOWN) ? ALIGN_DOWN(mid, align) :
>  					    ALIGN(mid, align);
> =20
> +		scale_src_size(a, rot, mid, &w, &h);
>  		igt_fb_set_position(fb, plane, 0, 0);
> -		igt_fb_set_size(fb, plane,
> -				scale_width ? mid : fixed,
> -				scale_width ? fixed : mid);
> +		igt_fb_set_size(fb, plane, w, h);
> =20
>  		ret =3D igt_display_try_commit_atomic(display,
>  						    DRM_MODE_ATOMIC_TEST_ONLY |
> @@ -919,9 +986,9 @@ find_scale_src_limit(data_t *d, igt_plane_t *plane, s=
truct igt_fb *fb,
>  		}
>  	}
> =20
> -	igt_debug("%s limit source %s for dst %dx%d: %d (fixed axis %d)\n",
> -		  scale_dir_name(dir), scale_width ? "width" : "height",
> -		  dst_w, dst_h, best, fixed);
> +	igt_debug("%s %s limit for dst %dx%d rotation %s: %d\n",
> +		  a->name, scale_dir_name(dir), a->dst_w, a->dst_h,
> +		  igt_plane_rotation_name(rot), best);
> =20
>  	igt_plane_set_fb(plane, NULL);
> =20
> @@ -956,17 +1023,10 @@ static void set_legacy_lut(data_t *data, igt_crtc_=
t *crtc,
>  	free(lut);
>  }
> =20
> -struct scale_axis {
> -	const char *name;
> -	bool scale_width;
> -	struct igt_fb fb;
> -	int dst_w, dst_h, dst_scaled, limit;
> -	bool tested, failed;
> -};
> -
>  static void
>  check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *outpu=
t,
> -			uint32_t format, uint64_t modifier, enum scale_dir dir)
> +			uint32_t format, uint64_t modifier, enum scale_dir dir,
> +			igt_rotation_t rot)
>  {
>  	igt_display_t *display =3D &d->display;
>  	const int band =3D 64;
> @@ -978,7 +1038,7 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc,=
 igt_output_t *output,
>  	igt_crc_t ref_crc, scaled_crc;
>  	drmModeModeInfo mode;
>  	igt_plane_t *plane;
> -	int halign, valign;
> +	int halign, valign, dalign;
>  	char limits[128] =3D "";
>  	bool any_tested =3D false;
>  	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
> @@ -1006,32 +1066,32 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *cr=
tc, igt_output_t *output,
>  	plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_require(plane);
> =20
> -	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
> +	yuv_src_alignment(d, format, rot, &halign, &valign);
> +	/* Each dst side is also a source side at 1:1, possibly rotated. */
> +	dalign =3D max(halign, valign);
> =20
>  	/* Search both axes first so the CRC phase only commits known limits. *=
/
>  	for (int i =3D 0; i < ARRAY_SIZE(axes); i++) {
>  		struct scale_axis *a =3D &axes[i];
> -		int align =3D a->scale_width ? halign : valign;
> -		int cap;
> +		bool src_width =3D scale_src_width(a, rot);
> +		int align =3D src_width ? halign : valign;
> +		int cap, w, h;
>  		size_t used;
> =20
>  		/* dst is a thin band spanning the whole scaled axis */
> -		a->dst_w =3D ALIGN(a->scale_width ? mode.hdisplay : band, halign);
> -		a->dst_h =3D ALIGN(a->scale_width ? band : mode.vdisplay, valign);
> +		a->dst_w =3D ALIGN(a->scale_width ? mode.hdisplay : band, dalign);
> +		a->dst_h =3D ALIGN(a->scale_width ? band : mode.vdisplay, dalign);
>  		a->dst_scaled =3D a->scale_width ? a->dst_w : a->dst_h;
> =20
> -		cap =3D scale_src_cap(d, dir, a->scale_width, a->dst_scaled,
> -				    align);
> +		cap =3D scale_src_cap(d, dir, src_width, a->dst_scaled, align);
> =20
>  		/* Every probed and committed source is a crop of this fb. */
> -		igt_create_color_fb(display->drm_fd,
> -				    a->scale_width ? cap : a->dst_w,
> -				    a->scale_width ? a->dst_h : cap,
> -				    format, modifier, 0.0, 1.0, 0.0, &a->fb);
> -
> -		a->limit =3D find_scale_src_limit(d, plane, &a->fb, dir,
> -						a->scale_width, a->dst_w,
> -						a->dst_h, align, cap);
> +		scale_src_size(a, rot, cap, &w, &h);
> +		igt_create_color_fb(display->drm_fd, w, h, format, modifier,
> +				    0.0, 1.0, 0.0, &a->fb);
> +
> +		a->limit =3D find_scale_src_limit(d, plane, &a->fb, dir, a, rot,
> +						align, cap);
>  		if (a->limit < 0 ||
>  		    (dir =3D=3D SCALE_DOWN ? a->limit <=3D a->dst_scaled :
>  					 a->limit >=3D a->dst_scaled)) {
> @@ -1062,32 +1122,35 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *cr=
tc, igt_output_t *output,
>  			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier));
>  	}
> =20
> -	igt_info("Max %s for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT ": %s\n",
> -		 scale_dir_name(dir), IGT_FORMAT_ARGS(format),
> -		 IGT_MODIFIER_ARGS(modifier), limits);
> +	igt_info("Max %s for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
> +		 " rotation %s: %s\n", scale_dir_name(dir),
> +		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> +		 igt_plane_rotation_name(rot), limits);
> =20
>  	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> =20
>  	for (int i =3D 0; i < ARRAY_SIZE(axes); i++) {
>  		struct scale_axis *a =3D &axes[i];
> +		int w, h;
> =20
>  		if (!a->tested)
>  			continue;
> =20
>  		/* Reference: unscaled crop of exactly the destination size. */
> +		scale_src_size(a, rot, a->dst_scaled, &w, &h);
>  		igt_plane_set_fb(plane, &a->fb);
> +		igt_plane_set_rotation(plane, rot);
>  		igt_fb_set_position(&a->fb, plane, 0, 0);
> -		igt_fb_set_size(&a->fb, plane, a->dst_w, a->dst_h);
> +		igt_fb_set_size(&a->fb, plane, w, h);
>  		igt_plane_set_position(plane, 0, 0);
>  		igt_plane_set_size(plane, a->dst_w, a->dst_h);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> =20
>  		/* Test: limit sized crop scaled into the same rectangle. */
> +		scale_src_size(a, rot, a->limit, &w, &h);
>  		igt_fb_set_position(&a->fb, plane, 0, 0);
> -		igt_fb_set_size(&a->fb, plane,
> -				a->scale_width ? a->limit : a->dst_w,
> -				a->scale_width ? a->dst_h : a->limit);
> +		igt_fb_set_size(&a->fb, plane, w, h);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
> =20
> @@ -1120,14 +1183,14 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *cr=
tc, igt_output_t *output,
> =20
>  static void
>  test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
> -		   uint64_t modifier, enum scale_dir dir)
> +		   uint64_t modifier, enum scale_dir dir, igt_rotation_t rot)
>  {
>  	igt_plane_t *plane;
>  	struct igt_vec tested_formats;
>  	uint32_t format;
> =20
>  	plane =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> -	if (!plane)
> +	if (!plane || !igt_plane_has_rotation(plane, rot))
>  		return;
> =20
>  	igt_vec_init(&tested_formats, sizeof(uint32_t));
> @@ -1145,7 +1208,7 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt=
_output_t *output,
>  		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
>  			      igt_output_name(output), fname)
>  			check_one_scale_max_crc(d, crtc, output, format,
> -						modifier, dir);
> +						modifier, dir, rot);
>  	}
> =20
>  	igt_vec_fini(&tested_formats);
> @@ -1795,7 +1858,8 @@ scale_output_for_crtc(data_t *d, igt_crtc_t *crtc)
>  }
> =20
>  static void
> -test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir di=
r)
> +test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir di=
r,
> +			 igt_rotation_t rot)
>  {
>  	igt_crtc_t *crtc;
> =20
> @@ -1803,7 +1867,43 @@ test_scale_max_crc_pipes(data_t *d, uint64_t modif=
ier, enum scale_dir dir)
>  		igt_output_t *output =3D scale_output_for_crtc(d, crtc);
> =20
>  		if (output)
> -			test_scale_max_crc(d, crtc, output, modifier, dir);
> +			test_scale_max_crc(d, crtc, output, modifier, dir,
> +					   rot);
> +	}
> +}
> +
> +static void scale_max_crc_subtests(data_t *d, int r)
> +{
> +	igt_rotation_t rot =3D scale_rotations[r].rot;
> +
> +	for (int m =3D 0; m < ARRAY_SIZE(scale_modifiers); m++) {
> +		uint64_t modifier =3D scale_modifiers[m].modifier;
> +
> +		/* Of these modifiers only Y tiling does 90/270 in practice. */
> +		if (igt_rotation_90_or_270(rot) &&
> +		    modifier !=3D I915_FORMAT_MOD_Y_TILED)
> +			continue;
> +
> +		igt_describe_f("Probe the maximum horizontal and vertical "
> +			       "plane downscaling factor at rotation %s for "
> +			       "each supported pixel format and verify the "
> +			       "downscaled output matches an unscaled "
> +			       "reference using CRCs.",
> +			       igt_plane_rotation_name(rot));
> +		igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s%s",
> +					   scale_rotations[r].name,
> +					   scale_modifiers[m].name)
> +			test_scale_max_crc_pipes(d, modifier, SCALE_DOWN, rot);
> +
> +		igt_describe_f("Probe the maximum horizontal and vertical "
> +			       "plane upscaling factor at rotation %s for "
> +			       "each supported pixel format and verify the "
> +			       "upscaled output matches an unscaled reference "
> +			       "using CRCs.", igt_plane_rotation_name(rot));
> +		igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s%s",
> +					   scale_rotations[r].name,
> +					   scale_modifiers[m].name)
> +			test_scale_max_crc_pipes(d, modifier, SCALE_UP, rot);
>  	}
>  }
> =20
> @@ -2102,29 +2202,8 @@ int igt_main_args("", long_opts, help_str, opt_han=
dler, &data)
>  			}
>  		}
> =20
> -		for (int m =3D 0; m < ARRAY_SIZE(scale_modifiers); m++) {
> -			uint64_t modifier =3D scale_modifiers[m].modifier;
> -
> -			igt_describe("Probe the maximum horizontal and vertical "
> -				     "plane downscaling factor for each supported "
> -				     "pixel format and verify the downscaled "
> -				     "output matches an unscaled reference using "
> -				     "CRCs.");
> -			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
> -						   scale_modifiers[m].name)
> -				test_scale_max_crc_pipes(&data, modifier,
> -							 SCALE_DOWN);
> -
> -			igt_describe("Probe the maximum horizontal and vertical "
> -				     "plane upscaling factor for each supported "
> -				     "pixel format and verify the upscaled "
> -				     "output matches an unscaled reference using "
> -				     "CRCs.");
> -			igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s",
> -						   scale_modifiers[m].name)
> -				test_scale_max_crc_pipes(&data, modifier,
> -							 SCALE_UP);
> -		}
> +		for (int r =3D 0; r < ARRAY_SIZE(scale_rotations); r++)
> +			scale_max_crc_subtests(&data, r);
>  	}
> =20
>  	igt_subtest_group()

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
