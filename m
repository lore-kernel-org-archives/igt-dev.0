Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A675CD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 22:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AE210E20F;
	Mon, 11 May 2026 22:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdvNtyzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4EF10E20F
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778536877; x=1810072877;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=+V6AL+u5BC6JoDvLMDtB3sUyuBVJWUhdl6jw9TCU1a0=;
 b=BdvNtyzYNjsRey9dEkRWdpMrdjJWyDOHjfSoTwrIdTj0d8STnNYjoMNN
 LDRyVk0Hn0aAU/YiLNwngxz3frwhqKACez4F2cF0RfTaEDeKZd/3lqDZp
 bmOBJPS7hQ73lzKV69j7NELpRM+TlweNsqyApAX3/aIqWvD2pPM1krhXV
 HONFuY/kvvOTAM8XflpTeOjIO/qdto1HeaoehiVXuzuO3RC8VdgGmcNet
 Bl6Kitd4J5HXZqum02uvm9zchzTvLoTIz1QcGm+EHGT8/IKM0aLyUOJMc
 jhFc4avR3ZsBXQ2SiMkW9hHQPboJmXPK1jy6Bh5Mc92hH9F2XULj3hph8 A==;
X-CSE-ConnectionGUID: MPYM98waToCKDu3E67b8jg==
X-CSE-MsgGUID: HWZYB8icRxaHmkOo8UV7Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90820035"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90820035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 15:01:17 -0700
X-CSE-ConnectionGUID: 3z3dEyHZTSG3pclpK7aABw==
X-CSE-MsgGUID: IQtZLlLKTTWQVwF6aakbMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="236738604"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 15:01:16 -0700
Date: Tue, 12 May 2026 00:01:14 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: igt-dev@lists.freedesktop.org, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: Re: [i-g-t, v2, 2/2] tests/kms_plane: Add test_nv12_tile4_src_y planar
 settings test
In-Reply-To: <20260506184936.76492-3-juhapekka.heikkila@gmail.com>
Message-ID: <68348891-eaa5-848d-bb33-1a62a18c3618@intel.com>
References: <20260506184936.76492-3-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1390377883-1778536561=:541093"
Content-ID: <eb9495e9-82eb-a3a3-5abf-665612415fc0@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1390377883-1778536561=:541093
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <b78cdd6a-6e35-6450-7c24-a16cb6cb39a1@intel.com>

On Wed, 6 May 2026, Juha-Pekka Heikkila wrote:
> Add Intel specific dynamic subtest test_nv12_tile4_src_y under
> planar-pixel-format-settings test. This test target dpt
> misconfiguration with specially crafted nv12 framebuffer
> with tile4.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
> tests/kms_plane.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 91 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 6c08f1de8..983509621 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -61,6 +61,12 @@
>  *              matches a reference XRGB8888 blue fill on Intel hardware.
>  * Driver requirement: i915, xe
>  *
> + * SUBTEST: planar-pixel-format-settings@nv12-tile4-src-y
> + * Description: Verify that an NV12 Tile4 framebuffer with src_y=1 renders
> + *              correctly on Intel hardware.  CRC comparison detects

I think we can drop the superfluous space after "hardware. ".

> + *              corruption.
> + * Driver requirement: xe
> + *
>  * SUBTEST: plane-position-%s
>  * Description: Verify plane position using two planes to create a %arg[1]
>  *
> @@ -1534,6 +1540,88 @@ test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
> 		     rval, expected_rval);
> }
>
> +/*
> + * test_nv12_tile4_src_y - NV12 Tile4 with src_y=1 CRC correctness check.
> + *
> + * If kernel program wrong UV DPT va, hardware read chroma from
> + * an unmapped page, producing incorrect picture and crc mismatch
> + */
> +static void
> +test_nv12_tile4_src_y(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
> +{
> +	igt_plane_t *primary;
> +	struct igt_fb nv12_fb, ref_fb;
> +	igt_crc_t crc, crc_ref;
> +	drmModeModeInfo *mode;
> +
> +	/* required size for this test, do not change! */
> +	const int fb_w = 1280, fb_h = 768;
> +	int ret;
> +
> +	igt_require_xe(data->drm_fd);
> +	igt_display_reset(&data->display);
> +	igt_output_set_crtc(output, crtc);
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	mode    = igt_output_get_mode(output);
> +
> +	igt_require_f(igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +					       I915_FORMAT_MOD_4_TILED),
> +		      "Primary plane does not support NV12 + Tile4\n");
> +
> +	igt_require_f(fb_w <= mode->hdisplay && fb_h <= mode->vdisplay,
> +		      "Mode %dx%d too small for %dx%d NV12 test FB\n",
> +		      mode->hdisplay, mode->vdisplay, fb_w, fb_h);
> +
> +	igt_create_color_fb(data->drm_fd, fb_w, fb_h,
> +			    DRM_FORMAT_NV12, I915_FORMAT_MOD_4_TILED,
> +			    0.0, 0.0, 1.0, &nv12_fb);
> +
> +	/*
> +	 * src_y = 1 - this is trigger for dpt uv offset bug

Somehow it reads easier to me when s/trigger/the trigger/, but I guess
it is a matter of opinion.

> +	 */
> +	igt_plane_set_fb(primary, &nv12_fb);
> +	igt_fb_set_position(&nv12_fb, primary, 0, 1);
> +	igt_fb_set_size(&nv12_fb, primary, fb_w, fb_h - 1);
> +	igt_plane_set_position(primary, 0, 0);
> +	igt_plane_set_size(primary, fb_w, fb_h - 1);
> +
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret != 0) {
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &nv12_fb);
> +		igt_skip("NV12 Tile4 src_y=1 rejected by kernel (ret=%d)\n", ret);
> +	}
> +
> +	data->pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +	set_legacy_lut(data, crtc, LUT_MASK);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +
> +	/*
> +	 * Get reference crc to check above went ok

maybe s/check/check if/ ?

Otherwise looks good to me.

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> +	 */
> +	igt_create_color_fb(data->drm_fd, fb_w, fb_h - 1,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, &ref_fb);
> +	igt_plane_set_fb(primary, &ref_fb);
> +	igt_display_commit_atomic(&data->display,
> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> +	set_legacy_lut(data, crtc, 0xffff);
> +	igt_pipe_crc_free(data->pipe_crc);
> +	data->pipe_crc = NULL;
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
> static void test_planar_settings(data_t *data)
> {
> 	igt_display_t *display = &data->display;
> @@ -1562,6 +1650,9 @@ static void test_planar_settings(data_t *data)
>
> 	igt_dynamic("p016-odd-vertical-pan")
> 		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
> +
> +	igt_dynamic("nv12-tile4-src-y")
> +		test_nv12_tile4_src_y(data, crtc, output);
> }
>
> static bool is_pipe_limit_reached(int count)
>
--8323329-1390377883-1778536561=:541093--
