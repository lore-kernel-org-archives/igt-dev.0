Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AFDD33998
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 16:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6A10E50B;
	Mon, 28 Oct 2024 16:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgBf/D+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC40F10E502
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730131674; x=1761667674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ysTsx7KP9NpE/LRKqIjE2m5KVo145z5VbZiQ2DC7SvA=;
 b=CgBf/D+oGXsdOOjxwHlRy1Mr7N/R3bynfwzOSU0AkWUcxl4B0L+zx7h+
 gU1t69bIkAiNZ5OlncI9JIHTYvU2ISpvdJpkVZ7JfQsbbHFI8k1cR46xw
 7gE4/0nQkFZSYaj50f/673xGCO3/O/Fe6mtK+JbBsPszfnCPTZkKs0H2+
 1ZH7hjihSYrcYmQMDM4o4i93U8mnbilG1MtToWDrflQH2yDWt0Aw7iDAK
 yuUPlGrBHgnIWxpD5flLX69yR37jS6ioJ3L1nJA6tQ0TIFbIwy+5oLD0V
 pX4rI1RU9FAwx/NTge7GSTybuK2LDFObjU4DW6UnaVrXqKG3lyfAXMvtk g==;
X-CSE-ConnectionGUID: CDezBEsTR/quUPIfleoeww==
X-CSE-MsgGUID: oC7ofxjcRMquzPSh4epAdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="47216617"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="47216617"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:07:53 -0700
X-CSE-ConnectionGUID: +f1wqCTgRmOMxheajD50gw==
X-CSE-MsgGUID: lWm7tcu3QoqLQ3M3Nptenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81771262"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Oct 2024 09:07:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Oct 2024 18:07:49 +0200
Date: Mon, 28 Oct 2024 18:07:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v6 12/12] lib/igt_fb: Add non sub-sampled YUV formats
Message-ID: <Zx-21REAlrgC3DHs@intel.com>
References: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
 <20240912-kms_fb_stress-dev-v6-12-71e9a65397e9@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912-kms_fb_stress-dev-v6-12-71e9a65397e9@riseup.net>
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

On Thu, Sep 12, 2024 at 09:39:36PM -0300, Arthur Grillo wrote:
> This adds support for the formats:
> - NV24
> - NV42
> - YU24
> - YU42

I would split this into two patches: 2 plane vs. 3 plane

> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  lib/igt_fb.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 7f87d40ed3d6..b1301d08d9f8 100644
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
> @@ -1166,8 +1186,10 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>  		break;
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:

Where's the corresponding stuff for the 2 plane formats?

I was also pondering about using igt_reduce_format() to
make the switch a bit less bloated, but I suppose that
won't work for eg. YUYV vs. UYVY. Maybe it could be used
in some other places though.

>  		igt_assert(ARRAY_SIZE(plane_size) == 3);
>  		memset(ptr + fb->offsets[0],
>  		       full_range ? 0x00 : 0x10,
> @@ -3495,6 +3517,8 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
> @@ -3505,8 +3529,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
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
> @@ -3536,11 +3562,15 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
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
> @@ -3568,12 +3598,14 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
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
> @@ -3582,6 +3614,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1];
>  		params->v_offset = fb->offsets[2];
> @@ -3589,6 +3622,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[2];
>  		params->v_offset = fb->offsets[1];
> @@ -4322,14 +4356,18 @@ static void fb_convert(struct fb_convert *cvt)
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
> @@ -4340,14 +4378,18 @@ static void fb_convert(struct fb_convert *cvt)
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
> @@ -4921,11 +4963,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
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
> -- 
> 2.46.0

-- 
Ville Syrjälä
Intel
