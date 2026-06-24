Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AF9CDB471
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 11:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AFF10E06A;
	Wed, 24 Jun 2026 11:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAiNiEpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2008D10EEAF
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782300335; x=1813836335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DCZ/kg2IsvxTjpIwAhdiIZtWKwivsctKI00HAssF1H0=;
 b=kAiNiEpJEFP3a4M34CFcrSAerBzuuj9RKThKP+29Ig4drYmKGjAtO7lS
 CQspr50JHxv2u3b9Sr3OQZVM7+bQz3oCkOiW4kApCvEGMRtV3y8MfhiZ2
 8IqkVo95G6+fP/OkTJ5MwShrNHLQR/R3bYyPia16SwBJXu1YJI910R8LR
 UvvAKZQ0BMFvpcOkCjAQJY83PqagfYwvbxpsK5dv9ccdyNT25HjynnCsV
 EILrmv3ndlcT0PwZcize9CsMIDrsVJfSfuv43F6KfRk+/su1B2yFOJuYU
 Llaf7cGYKGCpYP48tYgIysJ2jfBWD+VTY2vuyLGniVmGSWt+Yx1QcYema w==;
X-CSE-ConnectionGUID: TT0tr1S3RaGMqgSF0+jlTw==
X-CSE-MsgGUID: saWy2RZiRwKH+0WIossS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="85613981"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="85613981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:25:34 -0700
X-CSE-ConnectionGUID: aOqfo6hHRFafU6BUbNkNCg==
X-CSE-MsgGUID: h6UU+DlmQ8KCNuKmFWW7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="273503984"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 04:25:32 -0700
Date: Wed, 24 Jun 2026 13:25:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jay Liu <jay.liu@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Sharma Swati2 <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 1/1] tests/kms_color: Add 10-bit color depth support
 to gamma test for MediaTek
Message-ID: <20260624112516.6x73qw3zpuol5zrb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jay Liu <jay.liu@mediatek.com>, igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Sharma Swati2 <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260606090557.8879-1-jay.liu@mediatek.com>
 <20260606090557.8879-2-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260606090557.8879-2-jay.liu@mediatek.com>
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

Hi Jay,
On 2026-06-06 at 17:05:36 +0800, Jay Liu wrote:
> MediaTek display hardware has specific color processing requirements that
> differ from other vendors. This patch addresses two key aspects:
> 
> 1. MediaTek devices require a 10-bit color pipeline to achieve bit-accurate
>    (bit-true) gamma test results. Unlike other devices that work correctly
>    with 8-bit color depth (DRM_FORMAT_XRGB8888), MediaTek hardware needs
>    10-bit color depth (DRM_FORMAT_XRGB2101010) to properly validate gamma
>    LUT operations without precision loss.
> 
> 2. MediaTek's Gamma LUT maps 10-bit input data (0-1023) to 12-bit output
>    (0-4095). When gamma correction is disabled, the hardware defaults to
>    outputting 4092 for maximum input values. To pass the legacy gamma test
>    which expects consistent behavior, the LUT maximum entry must be set to
>    0xffd0 (which maps to 4092 in 12-bit) instead of 0xffff. This ensures
>    the test produces bit-true results matching the hardware behavior.
> 
> The test now automatically detects MediaTek devices and applies the
> appropriate color depth and LUT configuration.
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>

Thank you all, I merged this.



Regards,
Kamil

> ---
>  tests/kms_color.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..dc3432df5 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -265,6 +265,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	drmModeCrtc *drm_crtc;
>  	uint32_t i, legacy_lut_size;
>  	uint16_t *red_lut, *green_lut, *blue_lut;
> +	uint16_t lut_value;
>  	drmModeModeInfo *mode = data->mode;
>  	struct igt_fb fb_modeset, fb;
>  	igt_crc_t crc_fullgamma, crc_fullcolors;
> @@ -288,7 +289,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	fb_id = igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -296,7 +297,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	fb_modeset_id = igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -321,9 +322,22 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  
> +	/*
> +	 * The MediaTek Gamma LUT maps 10bit input data to 12bit output.
> +	 * In this test case, the maximum input value is 1023.
> +	 * When the Gamma function is disabled, the data defaults to a 4092 output.
> +	 * To achieve bit true results, the Gamma LUT maximum must be set to 4092.
> +	 * Note that 0xffd0 represents 16-bit, which maps to 4092 in 12-bit depth.
> +	 */
> +	if (is_mtk_device(data->drm_fd))
> +		lut_value = 0xffd0;
> +	else
> +		lut_value = 0xffff;
> +
>  	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
>  	for (i = 1; i < legacy_lut_size; i++)
> -		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
> +		red_lut[i] = green_lut[i] = blue_lut[i] = lut_value;
> +
>  	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>  	igt_display_commit(&data->display);
> @@ -752,14 +766,17 @@ static void
>  run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>  				 bool (*test_t)(data_t*, igt_plane_t*))
>  {
> +	bool depth_10bit = is_mtk_device(data->drm_fd);
> +
>  	test_setup(data, crtc);
>  
>  	/*
> -	 * We assume an 8bits depth per color for degamma/gamma LUTs
> +	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
>  	 * for CRC checks with framebuffer references.
> +	 * MediaTek requires 10-bit pipeline for accurate (bit true) color processing.
>  	 */
> -	data->color_depth = 8;
> -	data->drm_format = DRM_FORMAT_XRGB8888;
> +	data->color_depth = depth_10bit ? 10 : 8;
> +	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>  	data->mode = igt_output_get_mode(data->output);
>  
>  	igt_require(crtc_output_combo_valid(data, crtc));
> -- 
> 2.45.2
> 
