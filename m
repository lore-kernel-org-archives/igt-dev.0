Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D16D2C56A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A32F10E699;
	Tue, 22 Oct 2024 15:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wv10dbKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC8210E699
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729609591; x=1761145591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8ZYr+JxUDjqVIt0i+HkyYWvGKn47MYljIwlRfmdRKiA=;
 b=Wv10dbKyaPkiMzXZYW24MfW3rX5DEGcJewkQVd1V/yu3/Y2MWeuIO+Ca
 R1J2bTz1QVfRolMBcRDfartDvDZycNpAaxxFBD+KzkQXn8U0454xOnjP9
 mQ4T2Anq0a2KfQavJOZ8nbh7OYllwADdnP5OmVwPUJJeLHMlJhPMNaCqb
 Boiu0XCNMc4qo1WBKF+wtUfMXkU+Wxcc/Obq49RQ4sXmKCBrmtYAKRUSN
 aqrxIt3foulWAnGkV/CMFte7ZmTy5OCuMCv1kJFK0Wks1hdW9BvBoHoi/
 jwr/z1GZAXBDz+1uL9UODywFmHRlYT27HNjMbjvKizEL7qln5b7pF/UXG w==;
X-CSE-ConnectionGUID: xXZ450MTQFuTolkFiRUi+A==
X-CSE-MsgGUID: AnGw4MLNQO+0IWo6m+unqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29260632"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="29260632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:06:31 -0700
X-CSE-ConnectionGUID: d2okj1l2QkGzyGU/qGsN/A==
X-CSE-MsgGUID: R+TUwNuwTfupPcY8djtOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="83880414"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:06:28 -0700
Date: Tue, 22 Oct 2024 17:06:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v6 12/12] lib/igt_fb: Add non sub-sampled YUV formats
Message-ID: <20241022150615.imklm36tysilf62x@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
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
--- ^^^^
YV24

Please add also that last two are matched into DRM YUV444/YVU444

Regards,
Kamil

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
