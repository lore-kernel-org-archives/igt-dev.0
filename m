Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3381C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 17:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927A610E04B;
	Fri, 14 Feb 2025 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC4671WD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6EA10E04B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739554225; x=1771090225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5KQ9KdF4tNjAtZUkSkQoUf3nh4JpVq43AFWxuN9i5DM=;
 b=aC4671WDAVn7lW1+V6uc+FA0ISWD9R/sfayw8+uMGlK3gIXkQArzojpx
 ZCi/4/XZNmuks9dPewmGv1q1M6OzIDBy1h2n+0sXgCQy953lQupf9LAFm
 6L81aeSqQnbnK66YOWWj1oSZ24BaJ9eVDIyHSXO3SQELT2osq/nziCRg2
 yT1+9PmvHHeUC4nuP4CzLa6LQnp7+EBMLj1JdH63dSxDlVYyux5N6+r9P
 ndshz/xSzJ8ZisUb3J2y0P5rnW9HNI2U8lUzAomewjU67yiUqCVYuMBqN
 pVbqbStkNYVe8bhuF0PzbcD5gvcY4V0LzqiHUgr71U9uP/8nZp5JFetsW Q==;
X-CSE-ConnectionGUID: oqqQ+KMzTVSb5RrfklfYmg==
X-CSE-MsgGUID: al87Q2SBSDiKGLeRBFHjOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44076539"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="44076539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:30:25 -0800
X-CSE-ConnectionGUID: azic1sSWT/empmZB9mDD5g==
X-CSE-MsgGUID: x2f/7HXOT/W40H3RG5a4HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113711653"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 14 Feb 2025 09:30:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Feb 2025 19:30:22 +0200
Date: Fri, 14 Feb 2025 19:30:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
Message-ID: <Z699roJnvD0kO4Ne@intel.com>
References: <20250214161011.363157-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214161011.363157-1-swati2.sharma@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Feb 14, 2025 at 09:40:11PM +0530, Swati Sharma wrote:
> This tests is currently disabled since CRC computed on Intel
> hardware seems to include data on the lower bits, this is
> preventing us to CRC checks.
> 
> Let's try to enable it back and check behavior on newer Intel
> platforms.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
>  1 file changed, 93 insertions(+), 73 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 4b71d3dd3..c3b285b4e 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -58,6 +58,7 @@
>   * @0-75:           for 0.75 transparency
>   * @blue-to-red:    from blue to red
>   * @green-to-red:   from green to red
> + * @limited-range:  with identity matrix
>   * @max:            for maximum transparency
>   * @negative:       for negative transparency
>   * @red-to-blue:    from red to blue
> @@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
>   * This test is currently disabled as the CRC computed on Intel hardware seems
>   * to include data on the lower bits, this is preventing us to CRC checks.
>   */
> -#if 0
> -static void test_pipe_limited_range_ctm(data_t *data,
> +static bool test_pipe_limited_range_ctm(data_t *data,
>  					igt_plane_t *primary)
>  {
>  	double limited_result = 235.0 / 255.0;
> -	static const color_t red_green_blue_limited[] = {
> +	color_t red_green_blue_limited[] = {
>  		{ limited_result, 0.0, 0.0 },
>  		{ 0.0, limited_result, 0.0 },
> -		{ 0.0, 0.0, limited_result },
> +		{ 0.0, 0.0, limited_result }
>  	};

This whole thing is fundementally broken. We can't generate
limited range output without using the CSC post offsets,
which are not exposed via the current CTM uapi.

> -	static const color_t red_green_blue_full[] = {
> +	color_t red_green_blue_full[] = {
>  		{ 0.5, 0.0, 0.0 },
>  		{ 0.0, 0.5, 0.0 },
> -		{ 0.0, 0.0, 0.5 },
> -	};
> -	static const double ctm[] = {
> -		1.0, 0.0, 0.0,
> -		0.0, 1.0, 0.0,
> -		0.0, 0.0, 1.0,
> +		{ 0.0, 0.0, 0.5 }
>  	};
> +	double ctm[] = { 1.0, 0.0, 0.0,
> +			0.0, 1.0, 0.0,
> +			0.0, 0.0, 1.0 };
>  	gamma_lut_t *degamma_linear, *gamma_linear;
> -	igt_output_t *output;
> -	bool has_broadcast_rgb_output = false;
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	struct igt_fb fb_modeset, fb;
> +	int fb_id, fb_modeset_id;
> +	igt_crc_t crc_full, crc_limited;
>  	igt_display_t *display = &data->display;
> +	bool ret = false;
> +
> +	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
>  
>  	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
>  
> -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
> -		drmModeModeInfo *mode;
> -		struct igt_fb fb_modeset, fb;
> -		igt_crc_t crc_full, crc_limited;
> -		int fb_id, fb_modeset_id;
> -
> -		if (!igt_output_has_prop(output, IGT_CONNECTOR_BROADCAST_RGB))
> -			continue;
> -
> -		has_broadcast_rgb_output = true;
> +	igt_output_set_pipe(output, primary->pipe->pipe);
>  
> -		igt_output_set_pipe(output, primary->pipe->pipe);
> -		mode = igt_output_get_mode(output);
> +	/* Create a framebuffer at the size of the output. */
> +	fb_id = igt_create_fb(data->drm_fd,
> +			      mode->hdisplay,
> +			      mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      &fb);
> +	igt_assert(fb_id);
>  
> -		/* Create a framebuffer at the size of the output. */
> -		fb_id = igt_create_fb(data->drm_fd,
> +	fb_modeset_id = igt_create_fb(data->drm_fd,
>  				      mode->hdisplay,
>  				      mode->vdisplay,
>  				      DRM_FORMAT_XRGB8888,
>  				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb);
> -		igt_assert(fb_id);
> -
> -		fb_modeset_id = igt_create_fb(data->drm_fd,
> -					      mode->hdisplay,
> -					      mode->vdisplay,
> -					      DRM_FORMAT_XRGB8888,
> -					      DRM_FORMAT_MOD_LINEAR,
> -					      &fb_modeset);
> -		igt_assert(fb_modeset_id);
> -		igt_plane_set_fb(primary, &fb_modeset);
> +				      &fb_modeset);
> +	igt_assert(fb_modeset_id);
> +	igt_plane_set_fb(primary, &fb_modeset);
>  
> -		set_degamma(data, primary->pipe, degamma_linear);
> -		set_gamma(data, primary->pipe, gamma_linear);
> -		set_ctm(primary->pipe, ctm);
> -
> -		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
> -		paint_rectangles(data, mode, red_green_blue_limited, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> -		igt_wait_for_vblank(data->drm_fd,
> -				display->pipes[primary->pipe->pipe].crtc_offset);
> -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
> -
> -		/* Set the output into limited range. */
> -		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
> -		paint_rectangles(data, mode, red_green_blue_full, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> -		igt_wait_for_vblank(data->drm_fd,
> -				display->pipes[primary->pipe->pipe].crtc_offset);
> -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
> -
> -		/* And reset.. */
> -		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
> -		igt_plane_set_fb(primary, NULL);
> -		igt_output_set_pipe(output, PIPE_NONE);
> -
> -		/* Verify that the CRC of the software computed output is
> -		 * equal to the CRC of the CTM matrix transformation output.
> -		 */
> -		igt_assert_crc_equal(&crc_full, &crc_limited);
> +	set_degamma(data, primary->pipe, degamma_linear);
> +	set_gamma(data, primary->pipe, gamma_linear);
> +	set_ctm(primary->pipe, ctm);
>  
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_remove_fb(data->drm_fd, &fb_modeset);
> -	}
> +	igt_output_set_prop_value(output,
> +				  IGT_CONNECTOR_BROADCAST_RGB,
> +				  BROADCAST_RGB_FULL);
> +	paint_rectangles(data, mode, red_green_blue_limited, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit(&data->display);
> +	igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[primary->pipe->pipe].crtc_offset);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
> +
> +	/* Set the output into limited range. */
> +	igt_output_set_prop_value(output,
> +				  IGT_CONNECTOR_BROADCAST_RGB,
> +				  BROADCAST_RGB_16_235);
> +	paint_rectangles(data, mode, red_green_blue_full, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit(&data->display);
> +	igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[primary->pipe->pipe].crtc_offset);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
> +
> +	/* And reset.. */
> +	igt_output_set_prop_value(output,
> +				  IGT_CONNECTOR_BROADCAST_RGB,
> +				  BROADCAST_RGB_FULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit(&data->display);
> +
> +	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_full, &crc_limited);
>  
>  	free_lut(gamma_linear);
>  	free_lut(degamma_linear);
>  
> -	igt_require(has_broadcast_rgb_output);
> +	return ret;
>  }
> -#endif
>  
>  static void
>  prep_pipe(data_t *data, enum pipe p)
> @@ -1000,6 +991,25 @@ run_invalid_tests_for_pipe(data_t *data)
>  	}
>  }
>  
> +static void
> +run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
> +		bool (*test_t)(data_t*, igt_plane_t*))
> +{
> +	test_setup(data, p);
> +
> +	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
> +
> +	data->color_depth = 8;
> +	data->drm_format = DRM_FORMAT_XRGB8888;
> +	data->mode = igt_output_get_mode(data->output);
> +
> +	igt_require(pipe_output_combo_valid(data, p));
> +
> +	igt_assert(test_t(data, data->primary));
> +
> +	test_cleanup(data);
> +}
> +
>  static void
>  run_tests_for_pipe(data_t *data)
>  {
> @@ -1156,6 +1166,16 @@ run_tests_for_pipe(data_t *data)
>  		}
>  	}
>  
> +	igt_describe("Compare after applying ctm matrix & identity matrix");
> +	igt_subtest_with_dynamic("ctm-limited-range") {
> +		for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +				       igt_output_name(data->output))
> +				run_limited_range_ctm_test_for_pipe(data, pipe,
> +								    test_pipe_limited_range_ctm);
> +			}
> +		}
> +
>  	igt_fixture
>  		igt_require(data->display.is_atomic);
>  
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
