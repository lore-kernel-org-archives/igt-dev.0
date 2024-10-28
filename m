Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B018AD33990
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 15:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309AF10E4F6;
	Mon, 28 Oct 2024 15:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gi/ec2dB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8EE10E4F6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730129693; x=1761665693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kYRP+P5SpZc8IWMlk2Y4mEcsbB5fujAGAjlQWiW8a8U=;
 b=Gi/ec2dBHb0odsCY5u82PLRQHywyHqxC7c2zMKmzYAdDmvS53Y4HpWlT
 kcdJzvHKvdabF51dXNdSleFTwUKjoZqSkMcIovIVvNRnkCV7JC32w13AX
 6bAiiQ4kCBW50hfXHAoNo4MR5sh/d5qjJcAHtxH/19qayBH9c7zi3lEby
 gr6pQFx2N7yPlUPr2CdXN8LNVOFqyM9RhqrKa735KUd1ZvdzATqPCcM/v
 OrP1RhXmD1UM/3u3GSMQt6CVFN+7y88ZJF0Q35SYnwMGnmuBHXumK6+DK
 Qbb9kljnZCG71vvyW9++O+4mbC1sXFSsLoKmUfVJYMsejtcIoogWAh/8R A==;
X-CSE-ConnectionGUID: WEyxj04NRra1YJjBx8NRag==
X-CSE-MsgGUID: sQlRR80ZRK2AfjOI2j/vFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29867566"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29867566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 08:34:53 -0700
X-CSE-ConnectionGUID: jtH3cYJ8QoKXQrzzGE+Atw==
X-CSE-MsgGUID: 2fqcUrgHQTmN4b6PZRsFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="82074728"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:34:51 -0700
Date: Mon, 28 Oct 2024 16:34:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v6 12/12] lib/igt_fb: Add non sub-sampled YUV formats
Message-ID: <20241028153447.ry5huwcy7nve4zwq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
 <20240912-kms_fb_stress-dev-v6-12-71e9a65397e9@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912-kms_fb_stress-dev-v6-12-71e9a65397e9@riseup.net>
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
On 2024-09-12 at 21:39:36 -0300, Arthur Grillo wrote:
> This adds support for the formats:
> - NV24
> - NV42
> - YU24
> - YU42
> 

Please add here to Cc devs found with help of 'git blame':
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Maybe consider also sending this patch as separate one,
now it was 'hidden' in patchwork within a benchmark series.

Regards,
Kamil

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
> 
