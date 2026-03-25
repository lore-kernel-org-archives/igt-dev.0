Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF7A109C036
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 16:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6141C10E7E1;
	Wed, 25 Mar 2026 16:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2LLcsy2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55FB10E7E1
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774455576; x=1805991576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MPuoPJuu8ai9Dq0/lObWqW+xyUKoJJcx2qcJx6B0n6Y=;
 b=M2LLcsy20KPfg1XKjEm+c7nmlRqRd8UtxYG8/KcaNvQAA8rMLIFyqKJR
 hrwMs8ArqRFcxK5ed2I1pYqYSG4dwR5Q1Ut1QK+yh+4AorLM6Qm/t0gpj
 YTORovJlg0lOW8VMrM0nhlSD7yFCyvnd7C2GKUGmB5btIXUOGTrbF8BPN
 J8Ma72fvNcMyr/0v11WG+hDBmvBOlNxaFZ3B+Uw3+UKdjBx7eQdTO+o3e
 lpVAXO3F/CcTDoJEuYycEusDO8jFuQfQ0m2PGQtrsKl2s8K82jmYtJLWb
 /M71sws40OkXGk3lWQDErAUQkuM9wGXzECRg10+3Xqng2qhFPT8PV8RXs Q==;
X-CSE-ConnectionGUID: XHc1YYThSCiNAQ0eNAhJhA==
X-CSE-MsgGUID: eMiTiktbS5qkbyUe06OCIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86875799"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86875799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 09:19:35 -0700
X-CSE-ConnectionGUID: bPTFGf9VTo+5uOMna9Urrg==
X-CSE-MsgGUID: K1y6t69ZRUy5fOg4Rj+v6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221839810"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 09:19:34 -0700
Date: Wed, 25 Mar 2026 17:19:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, Renjun Wang <renjunw0@foxmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_fb: add YUV|YVU-410|411|444 formats
Message-ID: <20260325161906.hnzrowfenvrdrkot@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, Renjun Wang <renjunw0@foxmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260216181610.129209-1-kamil.konieczny@linux.intel.com>
 <294245f1-b410-4374-a90e-bde2303be29e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <294245f1-b410-4374-a90e-bde2303be29e@intel.com>
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

Hi Sharma,,
On 2026-02-17 at 01:29:07 +0530, Sharma, Swati2 wrote:
> Hi Kamil/Renjun
> 
> Overall patch LGTM. Can you add these formats to igt_reduce_format()?

I created an issue in GitLab fdo for this: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/202
so it should help to remember as todo.

> 
> These formats are not supported by i915/xe driver; so can't be validated on
> intel h/w.
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Thank you all, I merged it.

Regards,
Kamil 

> 
> On 16-02-2026 11:46 pm, Kamil Konieczny wrote:
> > From: Renjun Wang <renjunw0@foxmail.com>
> > 
> > Add support for additional YUV and YVU format variants in
> > framebuffer and color encoding handling. Extend format
> > descriptors, color encoding configuration, YUV|YVU buffer
> > clearing, parameter calculation, and format conversions to
> > support 4:1:0, 4:1:1, and 4:4:4 chroma subsampling formats.
> > 
> > Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> > Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> > Reformatted subject, added Cc [Kamil]
> > 
> >   lib/igt_color_encoding.c |  6 ++++
> >   lib/igt_fb.c             | 72 ++++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 78 insertions(+)
> > 
> > diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> > index a7bd2b22f..da56b2b10 100644
> > --- a/lib/igt_color_encoding.c
> > +++ b/lib/igt_color_encoding.c
> > @@ -140,10 +140,16 @@ static const struct color_encoding_format {
> >   	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_NV21, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_NV61, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> > +	{ DRM_FORMAT_YUV410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> > +	{ DRM_FORMAT_YUV411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_YUV420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_YUV422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> > +	{ DRM_FORMAT_YUV444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> > +	{ DRM_FORMAT_YVU410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> > +	{ DRM_FORMAT_YVU411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_YVU422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> > +	{ DRM_FORMAT_YVU444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> >   	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index d59fe133b..fa9220953 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -282,6 +282,16 @@ static const struct format_desc_struct {
> >   	  .num_planes = 1, .plane_bpp = { 16, },
> >   	  .hsub = 2, .vsub = 1,
> >   	},
> > +	{ .name = "YU10", .depth = -1, .drm_id = DRM_FORMAT_YUV410,
> > +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> > +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > +	  .hsub = 4, .vsub = 4,
> > +	},
> > +	{ .name = "YU11", .depth = -1, .drm_id = DRM_FORMAT_YUV411,
> > +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> > +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > +	  .hsub = 4, .vsub = 1,
> > +	},
> >   	{ .name = "YU12", .depth = -1, .drm_id = DRM_FORMAT_YUV420,
> >   	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> >   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > @@ -292,6 +302,21 @@ static const struct format_desc_struct {
> >   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> >   	  .hsub = 2, .vsub = 1,
> >   	},
> > +	{ .name = "YU24", .depth = -1, .drm_id = DRM_FORMAT_YUV444,
> > +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> > +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > +	  .hsub = 1, .vsub = 1,
> > +	},
> > +	{ .name = "YV10", .depth = -1, .drm_id = DRM_FORMAT_YVU410,
> > +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> > +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > +	  .hsub = 4, .vsub = 4,
> > +	},
> > +	{ .name = "YV11", .depth = -1, .drm_id = DRM_FORMAT_YVU411,
> > +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> > +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > +	  .hsub = 4, .vsub = 1,
> > +	},
> >   	{ .name = "YV12", .depth = -1, .drm_id = DRM_FORMAT_YVU420,
> >   	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> >   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > @@ -302,6 +327,11 @@ static const struct format_desc_struct {
> >   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> >   	  .hsub = 2, .vsub = 1,
> >   	},
> > +	{ .name = "YV24", .depth = -1, .drm_id = DRM_FORMAT_YVU444,
> > +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> > +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> > +	  .hsub = 1, .vsub = 1,
> > +	},
> >   	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
> >   	  .cairo_id = CAIRO_FORMAT_RGBA128F, .convert = true,
> >   	  .num_planes = 1, .plane_bpp = { 32, },
> > @@ -1164,10 +1194,16 @@ static void clear_yuv_buffer(struct igt_fb *fb)
> >   			 full_range ? 0x800000008000ULL : 0x800010008000ULL,
> >   			 plane_size[0] / sizeof(uint64_t));
> >   		break;
> > +	case DRM_FORMAT_YUV410:
> > +	case DRM_FORMAT_YUV411:
> >   	case DRM_FORMAT_YUV420:
> >   	case DRM_FORMAT_YUV422:
> > +	case DRM_FORMAT_YUV444:
> > +	case DRM_FORMAT_YVU410:
> > +	case DRM_FORMAT_YVU411:
> >   	case DRM_FORMAT_YVU420:
> >   	case DRM_FORMAT_YVU422:
> > +	case DRM_FORMAT_YVU444:
> >   		igt_assert(ARRAY_SIZE(plane_size) == 3);
> >   		memset(ptr + fb->offsets[0],
> >   		       full_range ? 0x00 : 0x10,
> > @@ -3675,10 +3711,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
> >   		params->uv_inc = 2;
> >   		break;
> > +	case DRM_FORMAT_YUV410:
> > +	case DRM_FORMAT_YUV411:
> >   	case DRM_FORMAT_YUV420:
> >   	case DRM_FORMAT_YUV422:
> > +	case DRM_FORMAT_YUV444:
> > +	case DRM_FORMAT_YVU410:
> > +	case DRM_FORMAT_YVU411:
> >   	case DRM_FORMAT_YVU420:
> >   	case DRM_FORMAT_YVU422:
> > +	case DRM_FORMAT_YVU444:
> >   		params->ay_inc = 1;
> >   		params->uv_inc = 1;
> >   		break;
> > @@ -3709,10 +3751,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
> >   	case DRM_FORMAT_NV16:
> >   	case DRM_FORMAT_NV21:
> >   	case DRM_FORMAT_NV61:
> > +	case DRM_FORMAT_YUV410:
> > +	case DRM_FORMAT_YUV411:
> >   	case DRM_FORMAT_YUV420:
> >   	case DRM_FORMAT_YUV422:
> > +	case DRM_FORMAT_YUV444:
> > +	case DRM_FORMAT_YVU410:
> > +	case DRM_FORMAT_YVU411:
> >   	case DRM_FORMAT_YVU420:
> >   	case DRM_FORMAT_YVU422:
> > +	case DRM_FORMAT_YVU444:
> >   	case DRM_FORMAT_P010:
> >   	case DRM_FORMAT_P012:
> >   	case DRM_FORMAT_P016:
> > @@ -3752,15 +3800,21 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
> >   		params->v_offset = fb->offsets[1];
> >   		break;
> > +	case DRM_FORMAT_YUV410:
> > +	case DRM_FORMAT_YUV411:
> >   	case DRM_FORMAT_YUV420:
> >   	case DRM_FORMAT_YUV422:
> > +	case DRM_FORMAT_YUV444:
> >   		params->y_offset = fb->offsets[0];
> >   		params->u_offset = fb->offsets[1];
> >   		params->v_offset = fb->offsets[2];
> >   		break;
> > +	case DRM_FORMAT_YVU410:
> > +	case DRM_FORMAT_YVU411:
> >   	case DRM_FORMAT_YVU420:
> >   	case DRM_FORMAT_YVU422:
> > +	case DRM_FORMAT_YVU444:
> >   		params->y_offset = fb->offsets[0];
> >   		params->u_offset = fb->offsets[2];
> >   		params->v_offset = fb->offsets[1];
> > @@ -4497,11 +4551,17 @@ static void fb_convert(struct fb_convert *cvt)
> >   		case DRM_FORMAT_NV61:
> >   		case DRM_FORMAT_UYVY:
> >   		case DRM_FORMAT_VYUY:
> > +		case DRM_FORMAT_YUV410:
> > +		case DRM_FORMAT_YUV411:
> >   		case DRM_FORMAT_YUV420:
> >   		case DRM_FORMAT_YUV422:
> > +		case DRM_FORMAT_YUV444:
> >   		case DRM_FORMAT_YUYV:
> > +		case DRM_FORMAT_YVU410:
> > +		case DRM_FORMAT_YVU411:
> >   		case DRM_FORMAT_YVU420:
> >   		case DRM_FORMAT_YVU422:
> > +		case DRM_FORMAT_YVU444:
> >   		case DRM_FORMAT_YVYU:
> >   			convert_yuv_to_rgb24(cvt);
> >   			return;
> > @@ -4515,11 +4575,17 @@ static void fb_convert(struct fb_convert *cvt)
> >   		case DRM_FORMAT_NV61:
> >   		case DRM_FORMAT_UYVY:
> >   		case DRM_FORMAT_VYUY:
> > +		case DRM_FORMAT_YUV410:
> > +		case DRM_FORMAT_YUV411:
> >   		case DRM_FORMAT_YUV420:
> >   		case DRM_FORMAT_YUV422:
> > +		case DRM_FORMAT_YUV444:
> >   		case DRM_FORMAT_YUYV:
> > +		case DRM_FORMAT_YVU410:
> > +		case DRM_FORMAT_YVU411:
> >   		case DRM_FORMAT_YVU420:
> >   		case DRM_FORMAT_YVU422:
> > +		case DRM_FORMAT_YVU444:
> >   		case DRM_FORMAT_YVYU:
> >   			convert_rgb24_to_yuv(cvt);
> >   			return;
> > @@ -5095,9 +5161,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
> >   	case DRM_FORMAT_NV21:
> >   	case DRM_FORMAT_NV61:
> >   	case DRM_FORMAT_YUV420:
> > +	case DRM_FORMAT_YUV410:
> > +	case DRM_FORMAT_YUV411:
> >   	case DRM_FORMAT_YUV422:
> > +	case DRM_FORMAT_YUV444:
> >   	case DRM_FORMAT_YVU420:
> > +	case DRM_FORMAT_YVU410:
> > +	case DRM_FORMAT_YVU411:
> >   	case DRM_FORMAT_YVU422:
> > +	case DRM_FORMAT_YVU444:
> >   	case DRM_FORMAT_P010:
> >   	case DRM_FORMAT_P012:
> >   	case DRM_FORMAT_P016:
