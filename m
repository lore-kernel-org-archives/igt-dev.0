Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E94CD342F
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 08:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E831710E9C2;
	Tue,  5 May 2026 08:07:34 +0000 (UTC)
X-Greylist: delayed 2377 seconds by postgrey-1.36 at gabe;
 Tue, 05 May 2026 08:07:19 UTC
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EF410E9C2
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 08:07:19 +0000 (UTC)
Received: from 37-219-152-235.nat.bb.dnainternet.fi ([37.219.152.235]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wKABo-00000004rVV-1Rvo; Tue, 05 May 2026 10:27:41 +0300
Message-ID: <2fc6fddd76c5cd00fdb3f8cd6ab7def75a93b008.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Tue, 05 May 2026 10:27:30 +0300
In-Reply-To: <20260424171123.3963793-3-juhapekka.heikkila@gmail.com>
References: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
 <20260424171123.3963793-3-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 2/2] tests/kms_plane: Add test_nv12_tile4_src_y
 planar settings test
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

On Fri, 2026-04-24 at 20:11 +0300, Juha-Pekka Heikkila wrote:
> Add Intel specific dynamic subtest test_nv12_tile4_src_y under
> planar-pixel-format-settings test. This test target dpt
> misconfiguration with specially crafted nv12 framebuffer
> with tile4.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---

Generally the test seems reasonable, but a bit more explanation on what
it is actually testing would be nice.  The commit message doesn't
really mention the actual problem that it is trying to test.


>  tests/kms_plane.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 6c08f1de8..303bd333f 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -61,6 +61,12 @@
>   *              matches a reference XRGB8888 blue fill on Intel hardware=
.
>   * Driver requirement: i915, xe
>   *
> + * SUBTEST: planar-pixel-format-settings@nv12-tile4-src-y
> + * Description: Verify that an NV12 Tile4 framebuffer with src_y=3D1 ren=
ders
> + *              correctly on Intel hardware.  CRC comparison detects
> + *              corruption.
> + * Driver requirement: xe
> + *

Also the description here seems a bit more complete, IMHO.


>   * SUBTEST: plane-position-%s
>   * Description: Verify plane position using two planes to create a %arg[=
1]
>   *
> @@ -1534,6 +1540,92 @@ test_p016_odd_vertical_pan(data_t *data, igt_crtc_=
t *crtc,
>  		     rval, expected_rval);
>  }
> =20
> +/*
> + * test_nv12_tile4_src_y - NV12 Tile4 with src_y=3D1 CRC correctness che=
ck.
> + *
> + * If kernel program wrong UV DPT va, hardware read chroma from
> + * an unmapped page, producing incorrect picture and crc mismatch
> + */
> +static void
> +test_nv12_tile4_src_y(data_t *data, igt_crtc_t *crtc, igt_output_t *outp=
ut)
> +{
> +	igt_plane_t *primary;
> +	struct igt_fb nv12_fb, ref_fb;
> +	igt_crc_t crc, crc_ref;
> +	drmModeModeInfo *mode;
> +
> +	/* required size for this test, do not change! */
> +	const int fb_w =3D 1280, fb_h =3D 768;
> +	int ret;
> +
> +	igt_require_xe(data->drm_fd);
> +	igt_display_reset(&data->display);
> +	igt_output_set_crtc(output, crtc);
> +
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	mode    =3D igt_output_get_mode(output);
> +
> +	igt_require_f(igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +					       I915_FORMAT_MOD_4_TILED),
> +		      "Primary plane does not support NV12 + Tile4\n");
> +
> +	igt_require_f(fb_w <=3D mode->hdisplay && fb_h <=3D mode->vdisplay,
> +		      "Mode %dx%d too small for %dx%d NV12 test FB\n",
> +		      mode->hdisplay, mode->vdisplay, fb_w, fb_h);
> +
> +	igt_create_color_fb(data->drm_fd, fb_w, fb_h,
> +			    DRM_FORMAT_NV12, I915_FORMAT_MOD_4_TILED,
> +			    0.0, 0.0, 1.0, &nv12_fb);
> +
> +	/*
> +	 * src_y =3D 1 - this is trigger for dpt uv offset bug
> +	 */
> +	igt_plane_set_fb(primary, &nv12_fb);
> +	igt_fb_set_position(&nv12_fb, primary, 0, 1);
> +	igt_fb_set_size(&nv12_fb, primary, fb_w, fb_h - 1);
> +	igt_plane_set_position(primary, 0, 0);
> +	igt_plane_set_size(primary, fb_w, fb_h - 1);
> +
> +	ret =3D igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret !=3D 0) {
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &nv12_fb);
> +		igt_skip("NV12 Tile4 src_y=3D1 rejected by kernel (ret=3D%d)\n", ret);
> +	}
> +
> +	data->pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +	set_legacy_lut(data, crtc, LUT_MASK);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +
> +	/*
> +	 * Get reference crc to check above went ok
> +	 */
> +	igt_create_color_fb(data->drm_fd, fb_w, fb_h - 1,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, &ref_fb);
> +	igt_plane_set_fb(primary, &ref_fb);
> +	igt_fb_set_position(&ref_fb, primary, 0, 0);
> +	igt_fb_set_size(&ref_fb, primary, fb_w, fb_h - 1);
> +	igt_plane_set_position(primary, 0, 0);
> +	igt_plane_set_size(primary, fb_w, fb_h - 1);
> +	igt_display_commit_atomic(&data->display,
> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);

Nitpick: maybe it's because I'm not the most familiar person regarding
this, but it would be nice if both setups (this one immediately above
and the one with src_y =3D 1 earlier) would visually match each other, so
it would be easier to see what is actually different between them.=20
Maybe this would even deserve a helper function so it's very clear what
the difference is between the two?


> +
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> +	set_legacy_lut(data, crtc, 0xffff);
> +	igt_pipe_crc_free(data->pipe_crc);
> +	data->pipe_crc =3D NULL;
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit_atomic(&data->display,
> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_remove_fb(data->drm_fd, &nv12_fb);
> +	igt_remove_fb(data->drm_fd, &ref_fb);
> +
> +	igt_assert_crc_equal(&crc_ref, &crc);
> +}
> +
>  static void test_planar_settings(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
> @@ -1562,6 +1654,9 @@ static void test_planar_settings(data_t *data)
> =20
>  	igt_dynamic("p016-odd-vertical-pan")
>  		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
> +
> +	igt_dynamic("nv12-tile4-src-y")
> +		test_nv12_tile4_src_y(data, crtc, output);
>  }
> =20
>  static bool is_pipe_limit_reached(int count)


--
Cheers,
Luca.
