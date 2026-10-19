Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8492CCF2D6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 11:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C19C10EC7B;
	Mon, 19 Oct 2026 11:46:33 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0985310EC7A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 11:45:37 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xIlo6-00000004Vco-0DGU; Mon, 19 Oct 2026 14:45:35 +0300
Message-ID: <9c092a0bc661ad3b0cb9d4ff8c7d3e2b0a350f3b.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Mon, 19 Oct 2026 14:45:47 +0300
In-Reply-To: <20261015131616.3172918-3-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-3-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 3/9] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
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
> factor and verify the downscaled framebuffer render correctly
> by verifying via crc.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 145 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 41f56a5ed..4b5730cd1 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -189,6 +189,13 @@
>   * Description: Test for validating max source size.
>   */
> =20
> +/**
> + * SUBTEST: plane-downscale-max-crc
> + * Description: Probe the maximum horizontal and vertical plane downscal=
ing
> + *              factor and verify the downscaled framebuffer render corr=
ectly

Non-blocking nitpick: s/render/renders/=20

Also same thing in the commit message.


> + *              by verifying via crc.
> + */
> +
>  IGT_TEST_DESCRIPTION("Test display plane scaling");
> =20
>  enum scaler_combo_test_type {
> @@ -709,6 +716,35 @@ static const uint64_t modifiers[] =3D {
>  	I915_FORMAT_MOD_4_TILED
>  };
> =20
> +static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t=
 rot,
> +			      int *halign, int *valign)
> +{
> +	bool intel =3D is_intel_device(d->drm_fd);
> +	int disp_ver =3D intel ? intel_display_ver(d->devid) : 0;
> +	int hsub, vsub;
> +
> +	*halign =3D 1;
> +	*valign =3D 1;
> +
> +	if (!igt_format_is_yuv(format))
> +		return;
> +
> +	igt_format_get_subsampling(format, &hsub, &vsub);
> +
> +	/*
> +	 * these must match to intel_plane_check_src_coordinates() in
> +	 * i915/Xe driver
> +	 */
> +	if (intel && disp_ver >=3D 20 && igt_format_is_yuv_semiplanar(format)) =
{

disp_ver will always be 0 if intel is false, so checking intel here
again is not necessary.


> +		*halign =3D 1;
> +		*valign =3D (disp_ver =3D=3D 35) ? 2 : 1;

haligns and valign will already be 1 here, so no need to set them
again.  It would probably be enough and slightly clearer to have only
this?

		if (disp_ver =3D=3D 35)
			*valign =3D 2;

...and do you really need =3D=3D 35 and not >=3D 35?


> +		return;
> +	}
> +
> +	*halign =3D hsub;
> +	*valign =3D vsub;
> +}
> +
>  static int
>  find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
>  			    uint32_t format, uint64_t modifier,
> @@ -790,6 +826,95 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *=
plane,
>  	return best;
>  }
> =20
> +static void
> +test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output=
,
> +		       bool scale_width)
> +{
> +	igt_display_t *display =3D &d->display;
> +	const uint32_t format =3D DRM_FORMAT_XRGB8888;
> +	const uint64_t modifier =3D DRM_FORMAT_MOD_LINEAR;
> +	const int band =3D 64;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t ref_crc, scaled_crc;
> +	drmModeModeInfo *mode;
> +	struct igt_fb ref_fb =3D {}, src_fb =3D {};
> +	igt_plane_t *plane;
> +	int dst_w, dst_h, dst_scaled, max_src;
> +	int halign, valign, align;
> +
> +	cleanup_crtc(d);
> +
> +	igt_require_pipe_crc(d->drm_fd);
> +
> +	igt_output_set_crtc(output, crtc);
> +
> +	/* Preferred mode; the largest advertised one may not be usable. */
> +	mode =3D &output->config.default_mode;
> +	igt_output_override_mode(output, mode);
> +
> +	plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_require(plane);
> +
> +	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
> +	align =3D scale_width ? halign : valign;
> +
> +	/* dst is a thin band spanning the full extent of the scaled axis */
> +	dst_w =3D ALIGN(scale_width ? mode->hdisplay : band, halign);
> +	dst_h =3D ALIGN(scale_width ? band : mode->vdisplay, valign);
> +	dst_scaled =3D scale_width ? dst_w : dst_h;
> +
> +	max_src =3D find_max_downscale_src_size(d, plane, format, modifier,
> +					      scale_width, dst_w, dst_h, align);
> +	skip_if_erange_or_einval(max_src);
> +	igt_require_f(max_src > dst_scaled,
> +		      "No %s downscaling headroom (max src %d, dst %d)\n",
> +		      scale_width ? "horizontal" : "vertical",
> +		      max_src, dst_scaled);
> +
> +	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
> +		 scale_width ? "horizontal" : "vertical",
> +		 max_src, dst_scaled, band);
> +
> +	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	/* Reference: unscaled solid-green framebuffer of the destination size.=
 */
> +	igt_create_color_fb(display->drm_fd, dst_w, dst_h, format, modifier,
> +			    0.0, 1.0, 0.0, &ref_fb);
> +	igt_plane_set_fb(plane, &ref_fb);
> +	igt_fb_set_position(&ref_fb, plane, 0, 0);
> +	igt_fb_set_size(&ref_fb, plane, dst_w, dst_h);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_plane_set_size(plane, dst_w, dst_h);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> +
> +	/* Test: larger solid-green source downscaled into dst rectangle. */
> +	igt_create_color_fb(display->drm_fd,
> +			    scale_width ? max_src : dst_w,
> +			    scale_width ? dst_h : max_src,
> +			    format, modifier, 0.0, 1.0, 0.0, &src_fb);
> +	igt_plane_set_fb(plane, &src_fb);
> +	igt_fb_set_position(&src_fb, plane, 0, 0);
> +	igt_fb_set_size(&src_fb, plane,
> +			scale_width ? max_src : dst_w,
> +			scale_width ? dst_h : max_src);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_plane_set_size(plane, dst_w, dst_h);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_reset_fifo_underrun_reporting(display->drm_fd);
> +
> +	igt_pipe_crc_free(pipe_crc);
> +	igt_remove_fb(display->drm_fd, &ref_fb);
> +	igt_remove_fb(display->drm_fd, &src_fb);
> +
> +	igt_assert_crc_equal(&ref_crc, &scaled_crc);
> +}
> +
>  static uint32_t
>  test_scaler_with_modifier_crtc(data_t *d,
>  			       double sf_plane,
> @@ -1702,6 +1827,26 @@ int igt_main_args("", long_opts, help_str, opt_han=
dler, &data)
>  								 output);
>  			}
>  		}
> +
> +		igt_describe("Probe the maximum horizontal and vertical plane "
> +			     "downscaling factor and verify the downscaled output "
> +			     "matches an unscaled reference using CRCs.");
> +		igt_subtest_with_dynamic("plane-downscale-max-crc") {
> +			for_each_crtc_with_valid_output(&data.display, crtc, output) {
> +				if (!crtc_output_combo_valid(&data.display, crtc, output))
> +					continue;
> +				if (igt_crtc_num_scalers(crtc) < 1)
> +					continue;
> +
> +				igt_dynamic_f("pipe-%s-%s-horizontal",
> +					      igt_crtc_name(crtc), igt_output_name(output))
> +					test_downscale_max_crc(&data, crtc, output, true);
> +
> +				igt_dynamic_f("pipe-%s-%s-vertical",
> +					      igt_crtc_name(crtc), igt_output_name(output))
> +					test_downscale_max_crc(&data, crtc, output, false);
> +			}
> +		}
>  	}
> =20
>  	igt_subtest_group()


--
Cheers,
Luca.
