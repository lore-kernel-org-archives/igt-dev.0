Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90119EBFD04
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 06:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391D010E31F;
	Mon, 13 Apr 2026 06:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8yd7lJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99310E31F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776063031; x=1807599031;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eElKsa7Q6ML730+SQevwhd9ZOjDQFJI6l/swGRHxPoU=;
 b=Z8yd7lJnjwAjyxRXOG5BvXjBI2RRnSlFjwA/8hdFAU/78TMdf3SsyBGl
 0fzAR3YY6KhOCeILYCEkDOGe0dP2TEbwW7PC9Bk8Bpyh4XayyXixKqIZt
 w0al3s7EpJ7/I3Jxn2XsT/CxPodvHRvWEH1wma8FgEfFYXtbnjv+lLJ+F
 ns+vzPvu6wB2Txhn5YBqjs78N5kM7gDaMGNZisOj/goIDfwb3WMo/iudq
 rxlRn3fHVpyItqUChs/fE8GluKyZ8SnSOXjug1bSc6psQFnbg6VVQPYCB
 OeYBp1iCrOydGvmumjvfjsNdW3zbrD8lo2Rsa/gtJ9YCsTt7AyxUSLQh6 Q==;
X-CSE-ConnectionGUID: 4AldSLBHSuS8FdIBhvKdDQ==
X-CSE-MsgGUID: MkfHNciuQwmbdHC/sIyPKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76867743"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="76867743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 23:50:30 -0700
X-CSE-ConnectionGUID: SBHqAs9mRNi84j/7YL7i1Q==
X-CSE-MsgGUID: ohTMbPnTRzmacP0EdbKN3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="267689538"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 23:50:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jay Liu <jay.liu@mediatek.com>, igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>, Sharma Swati2 <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Jay Liu
 <jay.liu@mediatek.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/kms_color: Add 10-bit color depth
 support to gamma test for MediaTek
In-Reply-To: <20260413014140.29824-1-jay.liu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260413014140.29824-1-jay.liu@mediatek.com>
Date: Mon, 13 Apr 2026 09:50:23 +0300
Message-ID: <5f9c70dea73dafeed8005e5a70e66db8fc72bbad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 13 Apr 2026, Jay Liu <jay.liu@mediatek.com> wrote:
> 1. Add 10-bit color depth flow to gamma test for MediaTek devices, which only
> support bit-true results with 10-bit data. The test now selects 8-bit or
> 10-bit color depth and framebuffer format based on device type.
>
> 2. To satisfy the legacy gamma test requirements, the MTK Gamma LUT limit
> should be set to 4092, in the current 16-bit LUT design, setting the entry
>  to 0xffd0 ensures the driver maps it correctly to 4092.
>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  tests/kms_color.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..033207368 100644
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
> @@ -322,9 +322,20 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	igt_plane_set_fb(primary, &fb);
>  
>  	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
> -	for (i = 1; i < legacy_lut_size; i++)
> -		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
> -	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
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
> +	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);

This does not compile.

>  	igt_display_commit(&data->display);
>  	igt_wait_for_vblank(primary->crtc);
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

-- 
Jani Nikula, Intel
