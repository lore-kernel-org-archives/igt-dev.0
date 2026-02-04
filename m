Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D66E95392
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 13:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FCF10E29E;
	Wed,  4 Feb 2026 13:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ilq+l+6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4534110E088
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770210272; x=1801746272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3THdCR4jbbArnyUO3LCwP03KiO3brlroOrqfqHrLmA0=;
 b=Ilq+l+6UiyhozY6aspz+6Wq0pIsPr1yhHyKIwvE3lp/K8XfosBoGQTLN
 5gXlWtvL87fixkxF+tfKHgYfEecVezIMf1IDwH5jdEETOKhNzlDLyhTK3
 Xoq/4ktonFOqSexHQf2vZLYFJ686brv0fC+TagIbHRxL+IO9At9ksVGRd
 5R0iEubJhn5/li0kJYZEJ28NleIUeMXNiCb6ShfEmBrLLLavNY3cy2Kaj
 md6JU76ARrmxQudgZpB3pbcM+fZEUA5fsEPVDwrPJFF/k+qgYRelg3Iz8
 Hv0cIY/lC6aSjzSUNU7nSv64AdwZSOVp4qza2BLcKE7jKx6IXIY3GR/Kw w==;
X-CSE-ConnectionGUID: FAlm3OIAR/2RDo5hfMc7ww==
X-CSE-MsgGUID: iVQmiT9TROC4fQ/GBkU8Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88817030"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="88817030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 05:04:32 -0800
X-CSE-ConnectionGUID: ghDKyxCmQBmr9NZux051dg==
X-CSE-MsgGUID: cvs6NJK+Q5ee/uMPuXlNuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="240842447"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:04:31 -0800
Date: Wed, 4 Feb 2026 14:04:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Renjun Wang <renjunw0@foxmail.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_fb: add YUV410 YUV411 YUV444 YVU410 YVU411
 YVU444 formats
Message-ID: <20260204130428.6s4ibbktaevgrv7a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Renjun Wang <renjunw0@foxmail.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <tencent_C9CEB3AD0E497CB0B666DD6B2E9389C56708@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_C9CEB3AD0E497CB0B666DD6B2E9389C56708@qq.com>
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

Hi Renjun,
On 2026-02-01 at 10:45:42 +0800, Renjun Wang wrote:

imho subject could be shorter:

[PATCH i-g-t] lib/igt_fb: add YUV4* formats

but it not strong opinion.

+cc Karthik and Swati, same here,
someone from KMS dev team needs to resend it for testing and give r-b.
Q for Karthik or Swati: do we need to block new formats in our
Intel blocklists?

Regards,
Kamil

> Add support for additional YUV format variants in framebuffer and color
> encoding handling. Extend format descriptors, color encoding configuration,
> YUV buffer clearing, parameter calculation, and format conversions to support
> 4:1:0, 4:1:1, and 4:4:4 chroma subsampling formats.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>  lib/igt_color_encoding.c |  6 ++++
>  lib/igt_fb.c             | 72 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index a7bd2b22f..da56b2b10 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -140,10 +140,16 @@ static const struct color_encoding_format {
>  	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV21, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV61, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUV420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUV422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVU422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index d59fe133b..fa9220953 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -282,6 +282,16 @@ static const struct format_desc_struct {
>  	  .num_planes = 1, .plane_bpp = { 16, },
>  	  .hsub = 2, .vsub = 1,
>  	},
> +	{ .name = "YU10", .depth = -1, .drm_id = DRM_FORMAT_YUV410,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 4,
> +	},
> +	{ .name = "YU11", .depth = -1, .drm_id = DRM_FORMAT_YUV411,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 1,
> +	},
>  	{ .name = "YU12", .depth = -1, .drm_id = DRM_FORMAT_YUV420,
>  	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> @@ -292,6 +302,21 @@ static const struct format_desc_struct {
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
>  	  .hsub = 2, .vsub = 1,
>  	},
> +	{ .name = "YU24", .depth = -1, .drm_id = DRM_FORMAT_YUV444,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 1, .vsub = 1,
> +	},
> +	{ .name = "YV10", .depth = -1, .drm_id = DRM_FORMAT_YVU410,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 4,
> +	},
> +	{ .name = "YV11", .depth = -1, .drm_id = DRM_FORMAT_YVU411,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 1,
> +	},
>  	{ .name = "YV12", .depth = -1, .drm_id = DRM_FORMAT_YVU420,
>  	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> @@ -302,6 +327,11 @@ static const struct format_desc_struct {
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
>  	  .hsub = 2, .vsub = 1,
>  	},
> +	{ .name = "YV24", .depth = -1, .drm_id = DRM_FORMAT_YVU444,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>  	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
>  	  .cairo_id = CAIRO_FORMAT_RGBA128F, .convert = true,
>  	  .num_planes = 1, .plane_bpp = { 32, },
> @@ -1164,10 +1194,16 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>  			 full_range ? 0x800000008000ULL : 0x800010008000ULL,
>  			 plane_size[0] / sizeof(uint64_t));
>  		break;
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		igt_assert(ARRAY_SIZE(plane_size) == 3);
>  		memset(ptr + fb->offsets[0],
>  		       full_range ? 0x00 : 0x10,
> @@ -3675,10 +3711,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  		params->uv_inc = 2;
>  		break;
>  
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		params->ay_inc = 1;
>  		params->uv_inc = 1;
>  		break;
> @@ -3709,10 +3751,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
>  	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
>  	case DRM_FORMAT_P016:
> @@ -3752,15 +3800,21 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  		params->v_offset = fb->offsets[1];
>  		break;
>  
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1];
>  		params->v_offset = fb->offsets[2];
>  		break;
>  
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[2];
>  		params->v_offset = fb->offsets[1];
> @@ -4497,11 +4551,17 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_NV61:
>  		case DRM_FORMAT_UYVY:
>  		case DRM_FORMAT_VYUY:
> +		case DRM_FORMAT_YUV410:
> +		case DRM_FORMAT_YUV411:
>  		case DRM_FORMAT_YUV420:
>  		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>  		case DRM_FORMAT_YUYV:
> +		case DRM_FORMAT_YVU410:
> +		case DRM_FORMAT_YVU411:
>  		case DRM_FORMAT_YVU420:
>  		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>  		case DRM_FORMAT_YVYU:
>  			convert_yuv_to_rgb24(cvt);
>  			return;
> @@ -4515,11 +4575,17 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_NV61:
>  		case DRM_FORMAT_UYVY:
>  		case DRM_FORMAT_VYUY:
> +		case DRM_FORMAT_YUV410:
> +		case DRM_FORMAT_YUV411:
>  		case DRM_FORMAT_YUV420:
>  		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>  		case DRM_FORMAT_YUYV:
> +		case DRM_FORMAT_YVU410:
> +		case DRM_FORMAT_YVU411:
>  		case DRM_FORMAT_YVU420:
>  		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>  		case DRM_FORMAT_YVYU:
>  			convert_rgb24_to_yuv(cvt);
>  			return;
> @@ -5095,9 +5161,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
>  	case DRM_FORMAT_NV21:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
>  	case DRM_FORMAT_P016:
> -- 
> 2.47.3
> 
