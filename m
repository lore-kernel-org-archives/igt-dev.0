Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CCACCF2DE
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 13:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8692E10ED00;
	Mon, 19 Oct 2026 13:05:14 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804810ECFE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 13:04:25 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xIn2F-00000004Vkj-01dp; Mon, 19 Oct 2026 16:04:23 +0300
Message-ID: <5d63e99459588530ff5b258488d8c67c0eb9aacb.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Mon, 19 Oct 2026 16:04:26 +0300
In-Reply-To: <20261015131616.3172918-4-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-4-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 4/9] tests/kms_plane_scaling: change
 plane-downscale-max-crc to do variations
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
> Probe the maximum horizontal and vertical plane downscaling
> factor for modifiers for each supported pixel format and verify
> downscaled framebuffer renders correctly using crc.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 381 ++++++++++++++++++++++++++++++--------
>  1 file changed, 307 insertions(+), 74 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 4b5730cd1..3b187220f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -32,6 +32,7 @@
> =20
>  #include "igt.h"
>  #include "igt_vec.h"
> +#include <ctype.h>
>  #include <math.h>
> =20
>  /**
> @@ -190,10 +191,18 @@
>   */
> =20
>  /**
> - * SUBTEST: plane-downscale-max-crc
> + * SUBTEST: plane-downscale-max-crc-%s
>   * Description: Probe the maximum horizontal and vertical plane downscal=
ing
> - *              factor and verify the downscaled framebuffer render corr=
ectly
> - *              by verifying via crc.
> + *              factor for %arg[1] for each supported pixel format and v=
erify
> + *              the downscaled framebuffer renders correctly via crc.
> + *
> + * arg[1]:
> + *
> + * @linear:     linear
> + * @x-tiled:    X-tiled
> + * @y-tiled:    Y-tiled
> + * @yf-tiled:   Yf-tiled
> + * @4-tiled:    4-tiled
>   */
> =20
>  IGT_TEST_DESCRIPTION("Test display plane scaling");
> @@ -716,6 +725,29 @@ static const uint64_t modifiers[] =3D {
>  	I915_FORMAT_MOD_4_TILED
>  };
> =20
> +static const struct {
> +	uint64_t modifier;
> +	const char *name;
> +} downscale_modifiers[] =3D {
> +	{ DRM_FORMAT_MOD_LINEAR,	"linear" },
> +	{ I915_FORMAT_MOD_X_TILED,	"x-tiled" },
> +	{ I915_FORMAT_MOD_Y_TILED,	"y-tiled" },
> +	{ I915_FORMAT_MOD_Yf_TILED,	"yf-tiled" },
> +	{ I915_FORMAT_MOD_4_TILED,	"4-tiled" },
> +};
> +
> +static const char *format_name_lower(uint32_t format, char *buf, size_t =
len)
> +{
> +	const char *name =3D igt_format_str(format);
> +	size_t i;
> +
> +	for (i =3D 0; i < len - 1 && name[i]; i++)
> +		buf[i] =3D tolower(name[i]);
> +	buf[i] =3D '\0';
> +
> +	return buf;
> +}
> +
>  static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t=
 rot,
>  			      int *halign, int *valign)
>  {
> @@ -826,93 +858,249 @@ find_max_downscale_src_size(data_t *d, igt_plane_t=
 *plane,
>  	return best;
>  }
> =20
> +static bool downscale_format_wanted(data_t *d, igt_plane_t *plane,
> +				    uint32_t format, uint64_t modifier,
> +				    struct igt_vec *tested_formats)
> +{
> +	uint32_t reduced;
> +
> +	if (!igt_fb_supported_format(format))
> +		return false;
> +
> +	if (!igt_plane_has_format_mod(plane, format, modifier))
> +		return false;
> +
> +	if (!can_scale(d, format))
> +		return false;
> +
> +	/* Test each format "class" only once unless --extended was given. */
> +	if (!d->extended) {
> +		reduced =3D igt_reduce_format(format);
> +
> +		if (igt_vec_index(tested_formats, &reduced) >=3D 0)
> +			return false;
> +
> +		igt_vec_push(tested_formats, &reduced);
> +	}
> +
> +	return true;
> +}
> +
> +#define LUT_MASK 0xf800
> +
> +static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
> +			   uint16_t mask)
> +{
> +	drmModeCrtc *drm_crtc;
> +	uint16_t *lut;
> +	int i, lut_size;
> +
> +	drm_crtc =3D drmModeGetCrtc(data->drm_fd, crtc->crtc_id);
> +	lut_size =3D drm_crtc->gamma_size;
> +	drmModeFreeCrtc(drm_crtc);
> +
> +	/* Skip if legacy LUT is not supported: */
> +	if (!lut_size)
> +		return;
> +
> +	lut =3D malloc(sizeof(uint16_t) * lut_size);
> +
> +	for (i =3D 0; i < lut_size; i++)
> +		lut[i] =3D (i * 0xffff / (lut_size - 1)) & mask;
> +
> +	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, crtc->crtc_id,
> +					  lut_size, lut, lut, lut), 0);
> +
> +	free(lut);
> +}
> +
> +struct scale_axis {
> +	const char *name;
> +	bool scale_width;
> +	int dst_w, dst_h, dst_scaled, limit;
> +	bool tested, failed;
> +};
> +
>  static void
> -test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output=
,
> -		       bool scale_width)
> +check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *o=
utput,
> +			    uint32_t format, uint64_t modifier)
>  {
>  	igt_display_t *display =3D &d->display;
> -	const uint32_t format =3D DRM_FORMAT_XRGB8888;
> -	const uint64_t modifier =3D DRM_FORMAT_MOD_LINEAR;
>  	const int band =3D 64;
> +	struct scale_axis axes[] =3D {
> +		{ .name =3D "horizontal", .scale_width =3D true },
> +		{ .name =3D "vertical", .scale_width =3D false },
> +	};
>  	igt_pipe_crc_t *pipe_crc;
>  	igt_crc_t ref_crc, scaled_crc;
> -	drmModeModeInfo *mode;
> -	struct igt_fb ref_fb =3D {}, src_fb =3D {};
> +	drmModeModeInfo mode;
>  	igt_plane_t *plane;
> -	int dst_w, dst_h, dst_scaled, max_src;
> -	int halign, valign, align;
> +	int halign, valign;
> +	char limits[128] =3D "";
> +	bool any_tested =3D false;
> +	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
> +	bool mask_lut =3D is_intel_device(d->drm_fd) &&
> +			intel_display_ver(d->devid) < 14;
> =20
>  	cleanup_crtc(d);
> +	/*
> +	 * commit below will significantly slow the test down but is required
> +	 * to make the test show all possible expected problems.
> +	 */
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> =20
>  	igt_require_pipe_crc(d->drm_fd);
> =20
>  	igt_output_set_crtc(output, crtc);
> =20
> +	if (mask_lut)
> +		set_legacy_lut(d, crtc, LUT_MASK);
> +
>  	/* Preferred mode; the largest advertised one may not be usable. */
> -	mode =3D &output->config.default_mode;
> -	igt_output_override_mode(output, mode);
> +	mode =3D output->config.default_mode;
> +	igt_output_override_mode(output, &mode);
> =20
>  	plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_require(plane);
> =20
>  	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
> -	align =3D scale_width ? halign : valign;
> =20
> -	/* dst is a thin band spanning the full extent of the scaled axis */
> -	dst_w =3D ALIGN(scale_width ? mode->hdisplay : band, halign);
> -	dst_h =3D ALIGN(scale_width ? band : mode->vdisplay, valign);
> -	dst_scaled =3D scale_width ? dst_w : dst_h;
> +	/* Search both axes first so the CRC phase only commits known limits. *=
/
> +	for (int i =3D 0; i < ARRAY_SIZE(axes); i++) {
> +		struct scale_axis *a =3D &axes[i];
> +		size_t used;
> +
> +		/* dst is a thin band spanning the whole scaled axis */
> +		a->dst_w =3D ALIGN(a->scale_width ? mode.hdisplay : band, halign);
> +		a->dst_h =3D ALIGN(a->scale_width ? band : mode.vdisplay, valign);
> +		a->dst_scaled =3D a->scale_width ? a->dst_w : a->dst_h;
> +
> +		a->limit =3D find_max_downscale_src_size(d, plane, format,
> +						       modifier,
> +						       a->scale_width,
> +						       a->dst_w, a->dst_h,
> +						       a->scale_width ?
> +						       halign : valign);
> +		if (a->limit < 0 || a->limit <=3D a->dst_scaled) {
> +			igt_debug("No %s downscaling headroom "
> +				  "(max src %d, dst %d)\n",
> +				  a->name, a->limit, a->dst_scaled);
> +			continue;
> +		}
> +
> +		a->tested =3D true;
> +		any_tested =3D true;
> +
> +		used =3D strlen(limits);
> +		snprintf(limits + used, sizeof(limits) - used,
> +			 "%s%s src %d -> dst %d (%.2fx)", used ? ", " : "",
> +			 a->name, a->limit, a->dst_scaled,
> +			 (double)a->limit / a->dst_scaled);
> +	}
> =20
> -	max_src =3D find_max_downscale_src_size(d, plane, format, modifier,
> -					      scale_width, dst_w, dst_h, align);
> -	skip_if_erange_or_einval(max_src);
> -	igt_require_f(max_src > dst_scaled,
> -		      "No %s downscaling headroom (max src %d, dst %d)\n",
> -		      scale_width ? "horizontal" : "vertical",
> -		      max_src, dst_scaled);
> +	if (!any_tested) {
> +		if (mask_lut)
> +			set_legacy_lut(d, crtc, 0xffff);
> +		igt_skip("No downscaling headroom on either axis for "
> +			 IGT_FORMAT_FMT " " IGT_MODIFIER_FMT "\n",
> +			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier));
> +	}
> =20
> -	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
> -		 scale_width ? "horizontal" : "vertical",
> -		 max_src, dst_scaled, band);
> +	igt_info("Max downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
> +		 ": %s\n", IGT_FORMAT_ARGS(format),
> +		 IGT_MODIFIER_ARGS(modifier), limits);
> =20
>  	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> =20
> -	/* Reference: unscaled solid-green framebuffer of the destination size.=
 */
> -	igt_create_color_fb(display->drm_fd, dst_w, dst_h, format, modifier,
> -			    0.0, 1.0, 0.0, &ref_fb);
> -	igt_plane_set_fb(plane, &ref_fb);
> -	igt_fb_set_position(&ref_fb, plane, 0, 0);
> -	igt_fb_set_size(&ref_fb, plane, dst_w, dst_h);
> -	igt_plane_set_position(plane, 0, 0);
> -	igt_plane_set_size(plane, dst_w, dst_h);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> -
> -	/* Test: larger solid-green source downscaled into dst rectangle. */
> -	igt_create_color_fb(display->drm_fd,
> -			    scale_width ? max_src : dst_w,
> -			    scale_width ? dst_h : max_src,
> -			    format, modifier, 0.0, 1.0, 0.0, &src_fb);
> -	igt_plane_set_fb(plane, &src_fb);
> -	igt_fb_set_position(&src_fb, plane, 0, 0);
> -	igt_fb_set_size(&src_fb, plane,
> -			scale_width ? max_src : dst_w,
> -			scale_width ? dst_h : max_src);
> -	igt_plane_set_position(plane, 0, 0);
> -	igt_plane_set_size(plane, dst_w, dst_h);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -	igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
> +	for (int i =3D 0; i < ARRAY_SIZE(axes); i++) {
> +		struct scale_axis *a =3D &axes[i];
> +		struct igt_fb ref_fb =3D {}, src_fb =3D {};
> +
> +		if (!a->tested)
> +			continue;
> +
> +		/* Reference: unscaled solid-green fb of the dst size. */
> +		igt_create_color_fb(display->drm_fd, a->dst_w, a->dst_h,
> +				    format, modifier, 0.0, 1.0, 0.0, &ref_fb);
> +		igt_plane_set_fb(plane, &ref_fb);
> +		igt_fb_set_position(&ref_fb, plane, 0, 0);
> +		igt_fb_set_size(&ref_fb, plane, a->dst_w, a->dst_h);
> +		igt_plane_set_position(plane, 0, 0);
> +		igt_plane_set_size(plane, a->dst_w, a->dst_h);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> +
> +		/* Test: larger solid-green source downscaled into dst. */
> +		igt_create_color_fb(display->drm_fd,
> +				    a->scale_width ? a->limit : a->dst_w,
> +				    a->scale_width ? a->dst_h : a->limit,
> +				    format, modifier, 0.0, 1.0, 0.0, &src_fb);
> +		igt_plane_set_fb(plane, &src_fb);
> +		igt_fb_set_position(&src_fb, plane, 0, 0);
> +		igt_fb_set_size(&src_fb, plane,
> +				a->scale_width ? a->limit : a->dst_w,
> +				a->scale_width ? a->dst_h : a->limit);
> +		igt_plane_set_position(plane, 0, 0);
> +		igt_plane_set_size(plane, a->dst_w, a->dst_h);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
> +
> +		igt_plane_set_fb(plane, NULL);
> +		igt_remove_fb(display->drm_fd, &ref_fb);
> +		igt_remove_fb(display->drm_fd, &src_fb);
> +
> +		a->failed =3D !igt_check_crc_equal(&ref_crc, &scaled_crc);
> +		if (a->failed)
> +			igt_critical("CRC mismatch on %s downscale\n", a->name);
> +	}
> =20
> -	igt_plane_set_fb(plane, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> =20
>  	igt_reset_fifo_underrun_reporting(display->drm_fd);
> =20
>  	igt_pipe_crc_free(pipe_crc);
> -	igt_remove_fb(display->drm_fd, &ref_fb);
> -	igt_remove_fb(display->drm_fd, &src_fb);
> =20
> -	igt_assert_crc_equal(&ref_crc, &scaled_crc);
> +	if (mask_lut)
> +		set_legacy_lut(d, crtc, 0xffff);
> +
> +	igt_assert_f(!(axes[0].failed || axes[1].failed) ||
> +		     igt_skip_crc_compare,
> +		     "%s%s%s downscale CRC mismatch\n",
> +		     axes[0].failed ? axes[0].name : "",
> +		     axes[0].failed && axes[1].failed ? " and " : "",
> +		     axes[1].failed ? axes[1].name : "");
> +}
> +
> +static void
> +test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output=
,
> +		       uint64_t modifier)
> +{
> +	igt_plane_t *plane;
> +	struct igt_vec tested_formats;
> +	uint32_t format;
> +
> +	plane =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> +	igt_require(plane);
> +
> +	igt_vec_init(&tested_formats, sizeof(uint32_t));
> +
> +	for_each_plane_format(plane, format) {
> +		char fname[32];
> +
> +		if (!downscale_format_wanted(d, plane, format, modifier,
> +					     &tested_formats))
> +			continue;
> +
> +		format_name_lower(format, fname, sizeof(fname));
> +
> +		/* Per-format dynamics keep dmesg within the log budget. */
> +		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(output), fname)
> +			check_one_downscale_max_crc(d, crtc, output, format,
> +						    modifier);
> +	}
> +
> +	igt_vec_fini(&tested_formats);
>  }
> =20
>  static uint32_t
> @@ -1533,6 +1721,49 @@ crtc_output_combo_valid(igt_display_t *display, ig=
t_crtc_t *crtc,
>  	return ret;
>  }
> =20
> +static bool
> +find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
> +			    igt_output_t **found_output)
> +{
> +	igt_display_t *display =3D &d->display;
> +	igt_crtc_t *crtc;
> +	igt_output_t *output;
> +	uint64_t best_area =3D 0;
> +
> +	*found_crtc =3D NULL;
> +	*found_output =3D NULL;
> +
> +	for_each_crtc_with_valid_output(display, crtc, output) {
> +		drmModeModeInfo *mode;
> +		uint64_t area;
> +
> +		if (!crtc_output_combo_valid(display, crtc, output))
> +			continue;
> +		if (igt_crtc_num_scalers(crtc) < 1)
> +			continue;
> +
> +		mode =3D &output->config.default_mode;
> +		area =3D (uint64_t)mode->hdisplay * mode->vdisplay;
> +		if (area <=3D best_area)
> +			continue;
> +
> +		best_area =3D area;
> +		*found_crtc =3D crtc;
> +		*found_output =3D output;
> +	}
> +
> +	if (!*found_crtc)
> +		return false;
> +
> +	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
> +		  "downscale testing\n",
> +		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
> +		  (*found_output)->config.default_mode.hdisplay,
> +		  (*found_output)->config.default_mode.vdisplay);
> +
> +	return true;
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *_data)
>  {
>  	data_t *data =3D _data;
> @@ -1828,23 +2059,25 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  			}
>  		}
> =20
> -		igt_describe("Probe the maximum horizontal and vertical plane "
> -			     "downscaling factor and verify the downscaled output "
> -			     "matches an unscaled reference using CRCs.");
> -		igt_subtest_with_dynamic("plane-downscale-max-crc") {
> -			for_each_crtc_with_valid_output(&data.display, crtc, output) {
> -				if (!crtc_output_combo_valid(&data.display, crtc, output))
> -					continue;
> -				if (igt_crtc_num_scalers(crtc) < 1)
> -					continue;
> -
> -				igt_dynamic_f("pipe-%s-%s-horizontal",
> -					      igt_crtc_name(crtc), igt_output_name(output))
> -					test_downscale_max_crc(&data, crtc, output, true);
> -
> -				igt_dynamic_f("pipe-%s-%s-vertical",
> -					      igt_crtc_name(crtc), igt_output_name(output))
> -					test_downscale_max_crc(&data, crtc, output, false);
> +		for (int m =3D 0; m < ARRAY_SIZE(downscale_modifiers); m++) {
> +			uint64_t modifier =3D downscale_modifiers[m].modifier;
> +
> +			igt_describe("Probe the maximum horizontal and vertical "
> +				     "plane downscaling factor for each supported "
> +				     "pixel format and verify the downscaled "
> +				     "output matches an unscaled reference using "
> +				     "CRCs.");
> +			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
> +						   downscale_modifiers[m].name) {
> +				igt_crtc_t *sel_crtc;
> +				igt_output_t *sel_output;
> +
> +				igt_require(find_native_res_crtc_output(&data,
> +									&sel_crtc,
> +									&sel_output));
> +
> +				test_downscale_max_crc(&data, sel_crtc,
> +						       sel_output, modifier);
>  			}
>  		}
>  	}

This looks fine to me, but it could be squashed with 3/9.  But maybe
it's a bit easier to review them in isolation? Not a blocker, so:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
