Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E511BCD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 11:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB8810E417;
	Fri, 15 May 2026 11:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2NfQd4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A45A10E417
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778844836; x=1810380836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tFOVi9456E/8SUHyLBoizloi0blFznNhCPGMbkMDdVU=;
 b=m2NfQd4ySq6oiouMiZ/CUsTTDv7aV7y4/XW9esnhZXcnkSjdCgIC1gqG
 3NVr4z1eKDjaTTHPSdiKCU2s0flEqetug4aZCUJj1WvlXl4gvap8XIlop
 eE73AnrkiLhluhIWf7rBZre+SeMFckXwsei6DD+blrZrROfknxpzFUCCe
 k4u40nwVUKIt8d+15lQgOeILoL/xbeHcfgGrypvr9aHZvOnb4q3n5UXc4
 9MKiJvMAPgnaP6naxGQa+74/iI9n5PGraPQnixhWO4iQ3uspu79TuuqLA
 gIcJThwCu9mw5VgEWPOq3zyu+0GGARxGVmDyhU6/ChgNDyfx53LXMIByq w==;
X-CSE-ConnectionGUID: EWcGk1RyQzCEq8Xt6KAJ8Q==
X-CSE-MsgGUID: cG5GCNBVQbqErrffKkvSCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79779240"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79779240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 04:33:56 -0700
X-CSE-ConnectionGUID: tgbxxYTHQYShJrENmL4IAw==
X-CSE-MsgGUID: 3/yBvLPIS161w/0qwpusKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="237810425"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:33:54 -0700
Date: Fri, 15 May 2026 13:33:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jay Liu <jay.liu@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Swati2 Sharma <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_color: Add 10-bit color depth
 support to gamma test for MediaTek
Message-ID: <20260515113351.ac5j4c2ra4w4g75l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jay Liu <jay.liu@mediatek.com>, igt-dev@lists.freedesktop.org,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Swati2 Sharma <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260420134348.21855-1-jay.liu@mediatek.com>
 <20260420134348.21855-2-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420134348.21855-2-jay.liu@mediatek.com>
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
On 2026-04-20 at 21:43:25 +0800, Jay Liu wrote:
> 1. Add 10-bit color depth flow to gamma test for MediaTek devices, which only support bit-true
> results with 10-bit data. The test now selects 8-bit or 10-bit color depth and framebuffer
> format based on device type.
> 
> 2. To satisfy the legacy gamma test requirements, the MTK Gamma LUT limit should be set to
> 4092, in the current 16-bit LUT design, setting the entry to 0xffd0 ensures the driver maps
> it correctly to 4092.
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  tests/kms_color.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..35b0106b7 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -288,7 +288,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	fb_id = igt_create_fb(data->drm_fd,
>  			      mode->hdisplay,
>  			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &fb);
>  	igt_assert(fb_id);
> @@ -296,7 +296,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	fb_modeset_id = igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);
>  	igt_assert(fb_modeset_id);
> @@ -322,8 +322,19 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	igt_plane_set_fb(primary, &fb);
>  
>  	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
> -	for (i = 1; i < legacy_lut_size; i++)
> -		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
> +	for (i = 1; i < legacy_lut_size; i++) {
> +		/*
> +		 * The Medaitek Gamma LUT maps 10bit input data to 12bit output.
> +		 * In this test case, the maximum input value is 1023.
> +		 * When the Gamma function is disabled, the data defaults to a 4092 output.
> +		 * To achieve bit true results, the Gamma LUT maximum must be set to 4092.
> +		 * Note that 0xFFFD0 represents 16-bit,which maps to 4092 in 12-bit depth.
> +		 */
> +		if (is_mtk_device(data->drm_fd))
> +			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffd0;
> +		else
> +			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
> +	}

imho you could move is_mtk() before for loop, so it will be short,
like 
	{
	typeof(red_lut[0]) lut_val = 0xffff; /* default */

	/* your comment here */
	if (is_mtk_device(data->drm_fd))
		lut_val = 0xffd0;
	
	for (i = 1; i < legacy_lut_size; i++)
		red_lut[i] = green_lut[i] = blue_lut[i] = lut_val;
	}

Regards,
Kamil

>  	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>  	igt_display_commit(&data->display);
> @@ -752,14 +763,22 @@ static void
>  run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>  				 bool (*test_t)(data_t*, igt_plane_t*))
>  {
> +	bool is_mtk = false;
> +
>  	test_setup(data, crtc);
>  
> +	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
> +	if (is_mtk_device(data->drm_fd))
> +		is_mtk = true;
> +
>  	/*
> -	 * We assume an 8bits depth per color for degamma/gamma LUTs
> +	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
>  	 * for CRC checks with framebuffer references.
>  	 */
> -	data->color_depth = 8;
> -	data->drm_format = DRM_FORMAT_XRGB8888;
> +
> +	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
> +	data->color_depth = is_mtk ? 10 : 8;
> +	data->drm_format = is_mtk ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>  	data->mode = igt_output_get_mode(data->output);
>  
>  	igt_require(crtc_output_combo_valid(data, crtc));
> -- 
> 2.46.0
> 
