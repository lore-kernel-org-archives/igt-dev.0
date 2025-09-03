Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A148CA1011
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 16:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEB510E903;
	Wed,  3 Sep 2025 16:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yzh9EZnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E422B10E903
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756918299; x=1788454299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sI3Vl7Z2gebaGgnM9C0p4iZaSjErjynSCG8pMDhdZIU=;
 b=Yzh9EZnYwSxe4NT/FoHvlpWJEBR91UpRfDPRjPieeeo1LElQPSX4UFk/
 ksU4gM41nBwPsUJDEtGEbLJQM04QYARvIhSBJSwq4iJ+BODP2zSejbweG
 633Ku2Y2edqf+Olo+FayC2URAdR+xvfJShxM4qgYzZoF3c8g24w0O2b1Q
 XWBSUJFy/jZ+nR9Q+xEguk0fCIJxufv7NOXFtytKfW3luiLiegb/H9PUw
 ZHRvgYCfMJqWNAeYvR4LCgN4+R5Sz83vghOt5jO7U3axCHFJsR+KdPitP
 he9rXzSwtovXwJNjRD1Kmmkl/dLAvTxi3LLRdSFvmTvqaWyqJjfAzXFIH A==;
X-CSE-ConnectionGUID: TbbOiBMQTjC/i1R12p6ISw==
X-CSE-MsgGUID: x4P7afp9TImmG28btR/qTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59176996"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59176996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 09:51:39 -0700
X-CSE-ConnectionGUID: 20jRTx4mQdqIQvdrcltqGg==
X-CSE-MsgGUID: 3Y0y7f+2RESDPivSpYn1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170934946"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 09:51:38 -0700
Date: Wed, 3 Sep 2025 18:51:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH V10 16/30] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
Message-ID: <20250903165135.c34nledhi7pr6wei@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com,
 Karthik B S <karthik.b.s@intel.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-17-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815040659.3321102-17-alex.hung@amd.com>
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

Hi Alex,
On 2025-08-14 at 22:06:45 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> The function is able to handle any non-planar format. It's been
> tested for XRGB8888 and XRGB2101010 so far but should work
> for a wider range of formats.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/igt_fb.c        |   4 --

Please split this patch into lib change and test.
Also imho lib change could be squashed into first igt_copy_fb()

+cc Karthik

Regards,
Kamil

>  tests/kms_colorop.c | 138 +++++++++++++++++++++++++-------------------
>  2 files changed, 78 insertions(+), 64 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 8c8436e94..b3474781d 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2182,10 +2182,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
>  	if (src->num_planes != 1)
>  		return -EINVAL;
>  
> -	/* TODO expand for other formats */
> -	if (src->drm_format != DRM_FORMAT_XRGB8888)
> -		return -EINVAL;
> -
>  	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
>  			      src->modifier, fb);
>  
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 77d8c6bfa..7ac74c536 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -380,60 +380,28 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
>  }
>  
>  static void colorop_plane_test(igt_display_t *display,
> +			       igt_output_t *output,
> +			       igt_plane_t *plane,
> +			       igt_fb_t *input_fb,
> +			       igt_fb_t *output_fb,
>  			       __u32 fourcc_in,
>  			       __u32 fourcc_out,
>  			       kms_colorop_t *colorops[])
>  {
>  	igt_colorop_t *color_pipeline = NULL;
> -	igt_output_t *output;
> -	igt_plane_t *plane;
> -	igt_fb_t input_fb;
>  	igt_fb_t sw_transform_fb;
> -	igt_fb_t output_fb;
> -	drmModeModeInfo mode;
> -	unsigned int fb_id;
>  	igt_crc_t input_crc, output_crc;
> +	int res;
>  
> -	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
> -	igt_require(output);
> -
> -	if (output->use_override_mode)
> -		memcpy(&mode, &output->override_mode, sizeof(mode));
> -	else
> -		memcpy(&mode, &output->config.default_mode, sizeof(mode));
> -
> -	/* create input fb */
> -	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_assert(plane);
> -
> -	fb_id = igt_create_color_pattern_fb(display->drm_fd,
> -					mode.hdisplay, mode.vdisplay,
> -					fourcc_in, DRM_FORMAT_MOD_LINEAR,
> -					0.2, 0.2, 0.2, &input_fb);
> -	igt_assert(fb_id >= 0);
> -	igt_plane_set_fb(plane, &input_fb);
> -#if DUMP_FBS
> -	igt_dump_fb(display, &input_fb, ".", "input");
> -#endif
> -
> -	/* create output fb */
> -	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
> -				fourcc_in,
> -				igt_fb_mod_to_tiling(0),
> -				&output_fb);
> -	igt_require(fb_id > 0);
> -
> -	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
> -
> -	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> +	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
>  
>  	/* reset color pipeline*/
>  
>  	set_color_pipeline_bypass(plane);
>  
>  	/* Commit */
> -	igt_plane_set_fb(plane, &input_fb);
> -	igt_output_set_writeback_fb(output, &output_fb);
> +	igt_plane_set_fb(plane, input_fb);
> +	igt_output_set_writeback_fb(output, output_fb);
>  
>  	igt_display_commit_atomic(output->display,
>  				DRM_MODE_ATOMIC_ALLOW_MODESET,
> @@ -441,14 +409,15 @@ static void colorop_plane_test(igt_display_t *display,
>  	get_and_wait_out_fence(output);
>  
>  	/* Compare input and output buffers. They should be equal here. */
> -	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
> +	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
>  
>  	igt_assert_crc_equal(&input_crc, &output_crc);
>  
>  	/* create sw transformed buffer */
> +	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
> +	igt_assert_lte(0, res);
>  
> -	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
> -	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
> +	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
>  
>  	apply_transforms(colorops, &sw_transform_fb);
>  #if DUMP_FBS
> @@ -469,7 +438,7 @@ static void colorop_plane_test(igt_display_t *display,
>  		set_color_pipeline(display, plane, colorops, color_pipeline);
>  	}
>  
> -	igt_output_set_writeback_fb(output, &output_fb);
> +	igt_output_set_writeback_fb(output, output_fb);
>  
>  	/* commit COLOR_PIPELINE */
>  	igt_display_commit_atomic(display,
> @@ -477,28 +446,24 @@ static void colorop_plane_test(igt_display_t *display,
>  				NULL);
>  	get_and_wait_out_fence(output);
>  #if DUMP_FBS
> -	igt_dump_fb(display, &output_fb, ".", "output");
> +	igt_dump_fb(display, output_fb, ".", "output");
>  #endif
>  
>  	/* compare sw transformed and KMS transformed FBs */
> -	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
> +	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
>  
>  	/* reset color pipeline*/
>  	set_color_pipeline_bypass(plane);
>  
>  	/* Commit */
> -	igt_plane_set_fb(plane, &input_fb);
> -	igt_output_set_writeback_fb(output, &output_fb);
> +	igt_plane_set_fb(plane, input_fb);
> +	igt_output_set_writeback_fb(output, output_fb);
>  
>  	igt_display_commit_atomic(output->display,
>  				DRM_MODE_ATOMIC_ALLOW_MODESET,
>  				NULL);
>  	get_and_wait_out_fence(output);
>  
> -	/* cleanup */
> -	detach_crtc(display, output);
> -	igt_remove_fb(display->drm_fd, &input_fb);
> -	igt_remove_fb(display->drm_fd, &output_fb);
>  }
>  
>  igt_main
> @@ -550,21 +515,74 @@ igt_main
>  		igt_display_require(&display, display.drm_fd);
>  
>  		igt_require(display.is_atomic);
> -
>  	}
>  
>  	for (j = 0; j < ARRAY_SIZE(formats); j++) {
> -		for (i = 0; i < ARRAY_SIZE(tests); i++) {
> -			igt_describe("Check color ops on a plane");
> -			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
> -				colorop_plane_test(&display,
> -						   formats[j].fourcc_in,
> -						   formats[j].fourcc_out,
> -						   tests[i].colorops);
> +		igt_output_t *output;
> +		igt_plane_t *plane;
> +		igt_fb_t input_fb, output_fb;
> +		unsigned int fb_id;
> +		drmModeModeInfo mode;
> +
> +		igt_subtest_group {
> +			igt_fixture {
> +				output = kms_writeback_get_output(&display,
> +								  formats[j].fourcc_in,
> +								  formats[j].fourcc_out);
> +				igt_require(output);
> +
> +				if (output->use_override_mode)
> +					memcpy(&mode, &output->override_mode, sizeof(mode));
> +				else
> +					memcpy(&mode, &output->config.default_mode, sizeof(mode));
> +
> +				/* create input fb */
> +				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +				igt_assert(plane);
> +				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> +
> +				fb_id = igt_create_color_pattern_fb(display.drm_fd,
> +								mode.hdisplay, mode.vdisplay,
> +								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
> +								0.2, 0.2, 0.2, &input_fb);
> +				igt_assert(fb_id >= 0);
> +				igt_plane_set_fb(plane, &input_fb);
> +#if DUMP_FBS
> +				igt_dump_fb(&display, &input_fb, ".", "input");
> +#endif
> +
> +				/* create output fb */
> +				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> +							formats[j].fourcc_in,
> +							igt_fb_mod_to_tiling(0),
> +							&output_fb);
> +				igt_require(fb_id > 0);
> +			}
> +
> +			for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +				igt_describe("Check color ops on a plane");
> +				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
> +					colorop_plane_test(&display,
> +							output,
> +							plane,
> +							&input_fb,
> +							&output_fb,
> +							formats[j].fourcc_in,
> +							formats[j].fourcc_out,
> +							tests[i].colorops);
> +			}
> +
> +			igt_fixture {
> +				detach_crtc(&display, output);
> +				igt_remove_fb(display.drm_fd, &input_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +
> +			}
>  		}
>  	}
>  	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
>  	igt_fixture {
>  		igt_display_fini(&display);
> +		drm_close_driver(display.drm_fd);
>  	}
>  }
> -- 
> 2.43.0
> 
