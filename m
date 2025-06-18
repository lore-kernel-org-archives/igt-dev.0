Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D685C71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 20:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2351410E1DC;
	Wed, 18 Jun 2025 20:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEdyhWwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8024510E1DC
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 20:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750277223; x=1781813223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2B9LBiVWr4tkpDtPR8WsS/o+JjmX6CtAQ6Z1Z656W0k=;
 b=EEdyhWwDvZP2wYCYYFzizISpMd6Pt4X/RCacdXsRx0kH0rDxlrunD6O5
 zqbk6OhUsGQJ2r2thOypEiWYZKZPnvek3fpHtAMnGGVKOW6PnANVnkg1Q
 rw5Qoz82/wtksD9xv40q57VB7R8ukKLMnIEF+HlsphmJPnEyB+0272q1P
 93buhY5S0dJ9i9VQrE8PZUxomr3R86PtnLA5Q56WgFUbWjK3kA2bcq4ES
 lmDjwMe57gomvNh96nALENbkOdrBQRnrNZ2TQlfU3mV1DTEQwKoL3+hyw
 Z23Z3WqWfBtx6bqC1Qh5+fdGYoac74sgOp4OAmurP9yinWaIu84S3ocM/ A==;
X-CSE-ConnectionGUID: 1eU+DB2WSMeMUrfyWxWe9w==
X-CSE-MsgGUID: ZmO6euTqTBK5KnCtHbxLPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52436513"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52436513"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 13:07:03 -0700
X-CSE-ConnectionGUID: ILGs4ocfRxKAHaBrbrnNCQ==
X-CSE-MsgGUID: YtVDjgSzQyaG821aKderpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150836037"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 13:07:02 -0700
Date: Wed, 18 Jun 2025 22:06:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [PATCH V9 02/36] tests/kms_writeback: Fix kms_writeback for VKMS
Message-ID: <20250618200646.6im5hrnubt4evjfi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com
References: <20250617043631.2920587-1-alex.hung@amd.com>
 <20250617043631.2920587-3-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617043631.2920587-3-alex.hung@amd.com>
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
On 2025-06-16 at 22:35:57 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> VKMS doesn't like us to add buffers with unknown fourcc
> type. Other drivers might behave similarly. Make sure
> we avoid creating 10bpc buffers if they are not supported.

Could you split up vkms patches into separate series?
Why send them with this big colorop one?

Regards,
Kamil

> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  tests/kms_writeback.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 05680837e..8765fda34 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -131,6 +131,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  	height = override_mode.vdisplay;
>  
>  	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
> +			continue;
>  
>  		ret = igt_create_fb(display->drm_fd, width, height,
>  				    fourcc[i], modifier, &input_fb);
> @@ -140,7 +144,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  				    fourcc[i], modifier, &output_fb);
>  		igt_assert_lte(0, ret);
>  
> -		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  		igt_plane_set_fb(plane, &input_fb);
>  		igt_output_set_writeback_fb(output, &output_fb);
>  
> @@ -590,12 +593,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  				      &input_fb);
>  		igt_assert(fb_id >= 0);
>  
> -		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
> -				      mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &input_fb_10bit);
> -		igt_assert(fb_id >= 0);
> +		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {
> +			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
> +					      mode.vdisplay,
> +					      DRM_FORMAT_XRGB2101010,
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      &input_fb_10bit);
> +			igt_assert(fb_id >= 0);
> +		}
>  
>  		igt_plane_set_fb(plane, &input_fb);
>  
> -- 
> 2.43.0
> 
