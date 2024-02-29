Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF167C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 12:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5957710E0C5;
	Thu, 29 Feb 2024 12:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfSsEEt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0C410E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709210729; x=1740746729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yXJCal+Tp1hJMEFJFTQTY8X0RrhH5roX6RrEvscL4kE=;
 b=DfSsEEt6TDocH7VzvzpEZFk/3EvYkUyj0RVh81b7DJyS3aDYm5sYR/8a
 ecBPhv5mftB3KFojOmP10yEx8hSGry4ABGgUhqUqyTO7/MhLQjiP5Z2pH
 I/DDzasY5+WiE7gnuCi8fvPS8oG3IHT0svysG7ZFiB/fEPePbNPNfJyEw
 rlUStzJAWj19neHS3jDlyBO/4u+4mc0M26QnmKHhIMIFWcGUrXKPsEg12
 Dygp1iQR8l9d0IBszBW7TTcKDbNh5b3CqZgIcYSq9Gd1oQQ40FcareRLb
 GZD9OJJxo+iin8GmFG3Xj4NCAzDKN+8MI7XDtMaFWxAfI8oWxNFnP3RIn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6623316"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6623316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12377392"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:45:27 -0800
Date: Thu, 29 Feb 2024 13:45:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t RESEND v2] lib: Add non-subsampled YUV formats
Message-ID: <20240229124524.3fmoqqmqibbix4ou@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240228-non-ssampled-yuv-v2-1-aa1f948e2aa0@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-non-ssampled-yuv-v2-1-aa1f948e2aa0@riseup.net>
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

Hi Arthur,
On 2024-02-28 at 23:09:45 -0300, Arthur Grillo wrote:
> Add support to NV24, NV42, YUV444 and YVU444 non-subsampled YUV formats.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> Changes in v2:
> - Place DRM_FORMAT_NV24 below DRM_FORMAT_NV16 (Kamil)

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> - Link to v1: https://lore.kernel.org/r/20231228-non-ssampled-yuv-v1-1-06f8e877b566@riseup.net
> ---
>  lib/igt_color_encoding.c |  4 ++++
>  lib/igt_fb.c             | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index a7bd2b22f73b..286784f10bbf 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -139,11 +139,15 @@ static const struct color_encoding_format {
>  	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV21, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_NV24, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_NV42, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV61, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUV420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUV422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVU422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 683eb176b7a4..b860308b1c0c 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -257,6 +257,16 @@ static const struct format_desc_struct {
>  	  .num_planes = 2, .plane_bpp = { 8, 16, },
>  	  .hsub = 2, .vsub = 2,
>  	},
> +	{ .name = "NV24", .depth = -1, .drm_id = DRM_FORMAT_NV24,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 2, .plane_bpp = { 8, 16, },
> +	  .hsub = 1, .vsub = 1,
> +	},
> +	{ .name = "NV42", .depth = -1, .drm_id = DRM_FORMAT_NV42,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 2, .plane_bpp = { 8, 16, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>  	{ .name = "NV61", .depth = -1, .drm_id = DRM_FORMAT_NV61,
>  	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>  	  .num_planes = 2, .plane_bpp = { 8, 16, },
> @@ -292,6 +302,11 @@ static const struct format_desc_struct {
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
>  	  .hsub = 2, .vsub = 1,
>  	},
> +	{ .name = "YU24", .depth = -1, .drm_id = DRM_FORMAT_YUV444,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>  	{ .name = "YV12", .depth = -1, .drm_id = DRM_FORMAT_YVU420,
>  	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> @@ -302,6 +317,11 @@ static const struct format_desc_struct {
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
> @@ -3395,6 +3415,8 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
> @@ -3405,8 +3427,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		params->ay_inc = 1;
>  		params->uv_inc = 1;
>  		break;
> @@ -3436,11 +3460,15 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
>  	case DRM_FORMAT_P016:
> @@ -3468,12 +3496,14 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  	switch (fb->drm_format) {
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1];
>  		params->v_offset = fb->offsets[1] + 1;
>  		break;
>  
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1] + 1;
> @@ -3482,6 +3512,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1];
>  		params->v_offset = fb->offsets[2];
> @@ -3489,6 +3520,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[2];
>  		params->v_offset = fb->offsets[1];
> @@ -4222,14 +4254,18 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_NV12:
>  		case DRM_FORMAT_NV16:
>  		case DRM_FORMAT_NV21:
> +		case DRM_FORMAT_NV24:
> +		case DRM_FORMAT_NV42:
>  		case DRM_FORMAT_NV61:
>  		case DRM_FORMAT_UYVY:
>  		case DRM_FORMAT_VYUY:
>  		case DRM_FORMAT_YUV420:
>  		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>  		case DRM_FORMAT_YUYV:
>  		case DRM_FORMAT_YVU420:
>  		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>  		case DRM_FORMAT_YVYU:
>  			convert_yuv_to_rgb24(cvt);
>  			return;
> @@ -4240,14 +4276,18 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_NV12:
>  		case DRM_FORMAT_NV16:
>  		case DRM_FORMAT_NV21:
> +		case DRM_FORMAT_NV24:
> +		case DRM_FORMAT_NV42:
>  		case DRM_FORMAT_NV61:
>  		case DRM_FORMAT_UYVY:
>  		case DRM_FORMAT_VYUY:
>  		case DRM_FORMAT_YUV420:
>  		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>  		case DRM_FORMAT_YUYV:
>  		case DRM_FORMAT_YVU420:
>  		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>  		case DRM_FORMAT_YVYU:
>  			convert_rgb24_to_yuv(cvt);
>  			return;
> @@ -4820,11 +4860,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
>  	case DRM_FORMAT_P016:
> 
> ---
> base-commit: 0340f23b38ce0fdab61fd0fbe5bc94cd91bcaa0d
> change-id: 20231228-non-ssampled-yuv-e50c1269e225
> 
> Best regards,
> -- 
> Arthur Grillo <arthurgrillo@riseup.net>
> 
