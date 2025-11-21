Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABD2CF9C74
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 08:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFEE10E7F7;
	Fri, 21 Nov 2025 08:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7NFhHfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DA010E7F7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763715391; x=1795251391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FaozCNNN6rvQ4TH/ofurEARi865frqkMRlbapcQf+8s=;
 b=H7NFhHfTVnBP9IfR7C9punHJCga+vz2FLcce0E8X2hb0yfwey0rPrFvg
 NYxpQsfG5r6/uK5+159azWSeOx5Mzf49ZX9E2ff8d24jvhQGtGvg2U0i5
 dPpixXeI7Yuy/0Cb0vxb1n3jqiV9rxXMjeGaRk5tkSEFbMXi8aWq7nGzp
 XgfP6eHDwb0hMATsDmMQKid1IvFgKKK1AaitLAH9IuCce6OZdnmDXdSUT
 /QNLJ1tZQ5MpX6SZJyQsoscuYkYjxnI3ABEoFwDqrC9eofQ4qkPFd3Rly
 Q3bkTEIO2Q/b8qW7cipmWLAkA1XjnAN+fcx5PVja0LCSH7pS0miUdmLAv Q==;
X-CSE-ConnectionGUID: DL/SnZFxTA21IZ9r8AkJLg==
X-CSE-MsgGUID: tZtShIKdR9qf1yUoDhDXAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83427420"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83427420"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:56:31 -0800
X-CSE-ConnectionGUID: C3WbflcHSW67USykRL3Y1Q==
X-CSE-MsgGUID: RNUT8sVOSMWsM/C5Y4g7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196111120"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:56:27 -0800
Date: Fri, 21 Nov 2025 10:56:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Uma <uma.shankar@intel.com>,
 Chaitanya Kumar <chaitanya.kumar.borah@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v2] tests/kms_color: Always use atomic_commit for
 setting color properties
Message-ID: <aSApNt1PwpgrX5E9@intel.com>
References: <20251121075406.2006325-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121075406.2006325-1-jason-jh.lin@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Nov 21, 2025 at 03:53:54PM +0800, Jason-JH Lin wrote:
> When a driver makes use of gamma_lut, degamma_lut, or ctm properties
> from crtc state, these properties are applied only via atomic commit.
> This change ensures all relevant properties are properly synchronized
> to crtc state during testing.
> 
> All upstream drivers that support color management properties also
> support atomic commits, so legacy commit handling in kms_color is no
> longer needed.

Incorrect.

But rather than spreading the current mess even further, I think
what we want is a igt_display_commit() variant that takes care of
the is_atomic check. So add that, blast it over all the existing
places that do the check by hand (with cocci/sed/etc), and
and then look at using it for new stuff like this where it 
probably makes sense to use atomic when available.

> 
> Update the test logic to always use igt_display_commit_atomic with
> DRM_MODE_ATOMIC_ALLOW_MODESET for all color management operations.
> This simplifies code and guarantees correct validation of gamma,
> degamma, and ctm properties.

What do you mean with "guarantees correct validation"? The current
code works just fine AFAIK.

> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_color.c | 47 ++++++++++++++++++++++++-----------------------
>  1 file changed, 24 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index c424083b7fd4..0d2baf8f8aad 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -125,12 +125,12 @@ static bool test_pipe_degamma(data_t *data,
>  	disable_ctm(primary->pipe);
>  	disable_gamma(primary->pipe);
>  	set_degamma(data, primary->pipe, degamma_linear);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	/* Draw solid colors with linear degamma transformation. */
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);

Hmm, I wonder if we could nuke these extra vblank waits. I suppose
there might be a slight issue with the prefill happening before the
new LUT is loaded (on the platforms with a single buffered LUT).
Someone should perhaps spend a few brain cells on this and at least
test how much the test could be sped up by eliminating the extra
vblank waits...

>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> @@ -142,7 +142,7 @@ static bool test_pipe_degamma(data_t *data,
>  	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	set_degamma(data, primary->pipe, degamma_full);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> @@ -156,7 +156,7 @@ static bool test_pipe_degamma(data_t *data,
>  	disable_degamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
>  
> @@ -215,12 +215,12 @@ static bool test_pipe_gamma(data_t *data,
>  	disable_ctm(primary->pipe);
>  	disable_degamma(primary->pipe);
>  	set_gamma(data, primary->pipe, gamma_full);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	/* Draw solid colors with no gamma transformation. */
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> @@ -231,7 +231,7 @@ static bool test_pipe_gamma(data_t *data,
>  	 */
>  	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> @@ -245,7 +245,7 @@ static bool test_pipe_gamma(data_t *data,
>  	disable_gamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
>  
> @@ -312,12 +312,12 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	disable_degamma(primary->pipe);
>  	disable_gamma(primary->pipe);
>  	disable_ctm(primary->pipe);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	/* Draw solid colors with no gamma transformation. */
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> @@ -334,7 +334,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
>  	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> @@ -351,11 +351,11 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  
>  	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
>  
> @@ -384,6 +384,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  	uint16_t *red_lut, *green_lut, *blue_lut;
>  	struct drm_color_lut *lut;
>  	drmModePropertyBlobPtr blob;
> +	igt_display_t *display = &data->display;
>  	igt_output_t *output = data->output;
>  	bool ret = true;
>  
> @@ -399,7 +400,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  	disable_degamma(primary->pipe);
>  	disable_ctm(primary->pipe);
>  	disable_gamma(primary->pipe);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	/*
>  	 * Set a degama & gamma LUT and a CTM using the
> @@ -411,7 +412,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
>  		set_ctm(primary->pipe, ctm_identity);
>  	set_gamma(data, primary->pipe, gamma_zero);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
>  		blob = get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
> @@ -466,7 +467,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  					  primary->pipe->crtc_id,
>  					  legacy_lut_size,
>  					  red_lut, green_lut, blue_lut), 0);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
>  		igt_assert(get_blob(data, primary->pipe,
> @@ -493,7 +494,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  end:
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	free_lut(degamma_linear);
>  	free_lut(gamma_zero);
> @@ -572,12 +573,12 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_debug("color after[2] %f,%f,%f\n", after[2].r, after[2].g, after[2].b);
>  
>  	disable_ctm(primary->pipe);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>  	paint_rectangles(data, mode, after, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	set_ctm(primary->pipe, ctm_identity);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
> @@ -586,7 +587,7 @@ static bool test_pipe_ctm(data_t *data,
>  	paint_rectangles(data, mode, before, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	set_ctm(primary->pipe, ctm_matrix);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_wait_for_vblank(data->drm_fd,
>  			    display->pipes[primary->pipe->pipe].crtc_offset);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
> @@ -600,7 +601,7 @@ static bool test_pipe_ctm(data_t *data,
>  	disable_ctm(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
>  
> @@ -689,7 +690,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
>  		paint_rectangles(data, mode, red_green_blue_limited, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  		igt_wait_for_vblank(data->drm_fd,
>  				display->pipes[primary->pipe->pipe].crtc_offset);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
> @@ -698,7 +699,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
>  		paint_rectangles(data, mode, red_green_blue_full, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  		igt_wait_for_vblank(data->drm_fd,
>  				display->pipes[primary->pipe->pipe].crtc_offset);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
