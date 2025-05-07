Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FDDC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 13:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D492D10E7BD;
	Wed,  7 May 2025 13:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEp9AM9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1F10E7C0
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746622995; x=1778158995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=llQchrs18OPrCTwN7MqK3BYtQNXpfQR3lEQ/Vv09R7M=;
 b=GEp9AM9jlUDGob7WllzPLGle1T68YYveLYMNK3NvPAff1LKPOyTtpmMn
 sVrF+GcG3HZ6Iaamtqt3B+W0+0QL3laHB9aXWYWvMiVA6jlLHqr/bdJnU
 H+5Kq5ckQhxJ1BHzU11YWS74IMWj4DUAucvzf+TlXytNkvo7w8YZilCrH
 IerXq8nWOl3RgBHZyDET8KRQBSzsmmUs4KRvtveKjqhkz62/qdZhMOnE/
 L2MZF7o2QE5tb0D1v8ugorfmh2ppeGCNACUCZC53P4VWAOQukHJBoaG+N
 dIZC258PyDG9BSZxkB/wq3Ku5JFBgygz8Guu+sGY9WVRvpC7pAdWj7yHe Q==;
X-CSE-ConnectionGUID: TFpitbHFSOucvH8Gt9r3VQ==
X-CSE-MsgGUID: RM80RZ/PRSKRUyKu+g051A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59006967"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="59006967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 06:03:14 -0700
X-CSE-ConnectionGUID: a1G2u3fwSuiOA60N+1C35g==
X-CSE-MsgGUID: bkEQjszaSR64mVzlTZl60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136963528"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:03:13 -0700
Date: Wed, 7 May 2025 15:03:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t] tests/kms_plane: Fix crash on fail and print out
 tested formats
Message-ID: <20250507130310.hbbvkbptqzqwdr3t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
References: <20250505104537.35593-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250505104537.35593-1-juhapekka.heikkila@gmail.com>
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

Hi Juha-Pekka,
On 2025-05-05 at 13:45:37 +0300, Juha-Pekka Heikkila wrote:
> Pixel format tests would crash out on failure, let's fix that.
> 
> Earlier tested pixel formats were moved from igt_info to igt_debug, let's put
> igt_info back in place so it's easier for debug time to see what's going on.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Consider to write a little longer explanation, or even change subject,
about how it is fixing anything, as I understand it should fail early
after a CRC mismatch.

Otherwise, with or without more lenghty explanation

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_plane.c | 52 ++++++++++++++++++++++-------------------------
>  1 file changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index d08ec81e4..f7b672c7a 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -887,9 +887,9 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
>  				  igt_crc_t ref_crc[],
>  				  struct igt_fb *fb)
>  {
> -	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> -		  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> -		  kmstest_pipe_name(pipe), plane->index);
> +	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> +		 kmstest_pipe_name(pipe), plane->index);
>  
>  	return test_format_plane_colors(data, pipe, plane,
>  					format, modifier,
> @@ -925,13 +925,13 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
>  						     igt_color_range_to_str(r)))
>  				continue;
>  
> -			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
> -				" (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
> -				IGT_MODIFIER_ARGS(modifier),
> -				igt_color_encoding_to_str(e),
> -				igt_color_range_to_str(r),
> -				kmstest_pipe_name(pipe),
> -				plane->index);
> +			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
> +				 " (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
> +				 IGT_MODIFIER_ARGS(modifier),
> +				 igt_color_encoding_to_str(e),
> +				 igt_color_range_to_str(r),
> +				 kmstest_pipe_name(pipe),
> +				 plane->index);
>  
>  			result &= test_format_plane_colors(data, pipe, plane,
>  							   format, modifier,
> @@ -1029,7 +1029,7 @@ static bool skip_format_mod(data_t *data,
>  	return false;
>  }
>  
> -static bool test_format_plane(data_t *data, enum pipe pipe,
> +static void test_format_plane(data_t *data, enum pipe pipe,
>  			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
>  {
>  	struct igt_fb fb = {};
> @@ -1046,7 +1046,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  	 * No clamping test for cursor plane
>  	 */
>  	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
> -		return true;
> +		return;
>  
>  	igt_vec_init(&tested_formats, sizeof(struct format_mod));
>  
> @@ -1059,7 +1059,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  	} else {
>  		if (!plane->drm_plane) {
>  			igt_debug("Only legacy cursor ioctl supported, skipping cursor plane\n");
> -			return true;
> +			return;
>  		}
>  		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
>  		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &height));
> @@ -1073,9 +1073,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  
>  	igt_pipe_crc_start(data->pipe_crc);
>  
> -	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> -		  IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
> -		  kmstest_pipe_name(pipe), plane->index);
> +	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
> +		 kmstest_pipe_name(pipe), plane->index);
>  
>  	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
>  
> @@ -1107,12 +1107,12 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  			continue;
>  
>  		if (skip_format_mod(data, f.format, f.modifier, &tested_formats)) {
> -			igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
> -				  IGT_MODIFIER_FMT " on %s.%u\n",
> -				  IGT_FORMAT_ARGS(f.format),
> -				  IGT_MODIFIER_ARGS(f.modifier),
> -				  kmstest_pipe_name(pipe),
> -				  plane->index);
> +			igt_info("Skipping format " IGT_FORMAT_FMT " / modifier "
> +				 IGT_MODIFIER_FMT " on %s.%u\n",
> +				 IGT_FORMAT_ARGS(f.format),
> +				 IGT_MODIFIER_ARGS(f.modifier),
> +				 kmstest_pipe_name(pipe),
> +				 plane->index);
>  			continue;
>  		}
>  
> @@ -1149,7 +1149,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  
>  	igt_vec_fini(&tested_formats);
>  
> -	return result;
> +	igt_assert_f(result, "At least one CRC mismatch happened\n");
>  }
>  
>  static bool skip_plane(data_t *data, igt_plane_t *plane)
> @@ -1195,7 +1195,6 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	struct igt_fb primary_fb;
>  	igt_plane_t *primary;
>  	drmModeModeInfo *mode;
> -	bool result;
>  	igt_output_t *output = data->output;
>  	igt_plane_t *plane;
>  
> @@ -1225,12 +1224,11 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  
>  	set_legacy_lut(data, pipe, LUT_MASK);
>  
> -	result = true;
>  	for_each_plane_on_pipe(&data->display, pipe, plane) {
>  		if (skip_plane(data, plane))
>  			continue;
>  		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
> -			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
> +			test_format_plane(data, pipe, output, plane, &primary_fb);
>  	}
>  
>  	test_fini(data);
> @@ -1242,8 +1240,6 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
>  	igt_remove_fb(data->drm_fd, &primary_fb);
> -
> -	igt_assert_f(result, "At least one CRC mismatch happened\n");
>  }
>  
>  static void test_planar_settings(data_t *data)
> -- 
> 2.45.2
> 
