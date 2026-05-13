Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8078CCD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 08:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AEE10E2D7;
	Wed, 13 May 2026 08:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6D/mSmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7FF10E2D7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778661358; x=1810197358;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jK+6x2Lku31PFjd+RZhGIlCFsCrfuhihpog68b/atxk=;
 b=j6D/mSmnU45aOvHqfG9K8syD0bIZUA8i2tIecbx/e5YrBF3XE0hFkOEO
 PmgvADHFy5CH4Mqkgy/0EQ9Hk0Bd26+Esr5Jx6bdqU6DiAC38bWMsDi8/
 x0+KkhFVwjCiDMH+ZgfCsRfb7jLFYIz6xV6IipUQMs08kj6y4BaRVdJ/O
 2E8EO9RxCVtYYDrp4nRqnX9zNyt1ZE6ZnCEc5dVT7DUX3h6Gz1lSHA6Wn
 vl7xKTfPI7351pW79WBIzDUmCIcNVsIjMlDT+kUez+uI9p4p/bUNA7ONq
 IPFkTEIETmwxKs20/loH1SImizWJt/OixbWzPSxQs3VndfMca/4Kbh1Wi w==;
X-CSE-ConnectionGUID: XUvDrAQnTda66OWKnsJfkg==
X-CSE-MsgGUID: t5BnuHPzQwKJ5o7quGL7XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79564338"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79564338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:35:58 -0700
X-CSE-ConnectionGUID: Ad8k+1/oT7qDChazpEooPQ==
X-CSE-MsgGUID: ysMl2QjvSoeKaams7D262w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242978469"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:35:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com, Jeevan B
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] HAX: kms_cursor_legacy: Use
 IGT_FORMAT_MOD_PREFERRED for cursor FBs
In-Reply-To: <20260513061503.645278-3-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260513061503.645278-1-jeevan.b@intel.com>
 <20260513061503.645278-3-jeevan.b@intel.com>
Date: Wed, 13 May 2026 11:35:53 +0300
Message-ID: <1fe9ac6853b6bebc3fbdda98786c6944f66d7f82@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 13 May 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Switch all cursor-related framebuffer creations in
> kms_cursor_legacy to use IGT_FORMAT_MOD_PREFERRED instead of
> DRM_FORMAT_MOD_LINEAR.

Why?

> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 5399ef481..e32d2ac7e 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -373,7 +373,7 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
>  
>  	igt_create_pattern_fb(display->drm_fd,
>  		      mode->hdisplay, mode->vdisplay,
> -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
> +		      DRM_FORMAT_XRGB8888, IGT_FORMAT_MOD_PREFERRED, fb_info);
>  
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, fb_info);
> @@ -579,7 +579,7 @@ static void prepare_flip_test(igt_display_t *display,
>  
>  		igt_skip_on(width <= 64 && height <= 64);
>  		igt_create_color_fb(display->drm_fd, width, height,
> -				    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, 1., 0., .7, cursor_fb2);
> +				    DRM_FORMAT_ARGB8888, IGT_FORMAT_MOD_PREFERRED, 1., 0., .7, cursor_fb2);
>  
>  		arg[0].flags = arg[1].flags = DRM_MODE_CURSOR_BO;
>  		arg[1].handle = cursor_fb2->gem_handle;
> @@ -605,7 +605,7 @@ static void prepare_flip_test(igt_display_t *display,
>  		            crtc->planes[1].type != DRM_PLANE_TYPE_CURSOR);
>  
>  		igt_create_color_pattern_fb(display->drm_fd, prim_fb->width, prim_fb->height,
> -					    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, argb_fb);
> +					    DRM_FORMAT_ARGB8888, IGT_FORMAT_MOD_PREFERRED, .1, .1, .1, argb_fb);
>  	}
>  }
>  
> @@ -652,10 +652,10 @@ static void flip(igt_display_t *display,
>  	}
>  
>  	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height,
> -			    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &cursor_fb);
> +			    DRM_FORMAT_ARGB8888, IGT_FORMAT_MOD_PREFERRED, .5, .5, .5, &cursor_fb);
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	cursor = set_cursor_on_crtc(display, cursor_crtc, &cursor_fb);
>  	populate_cursor_args(display, cursor_crtc, arg, &cursor_fb);
>  
> @@ -769,7 +769,7 @@ static void basic_flip_cursor(igt_display_t *display,
>  	set_fb_on_crtc(display, crtc, output, &fb_info);
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
>  	populate_cursor_args(display, crtc, arg, &cursor_fb);
>  
> @@ -948,7 +948,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>  	set_fb_on_crtc(display, crtc, output, &fb_info);
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
>  	populate_cursor_args(display, crtc, arg, &cursor_fb);
>  
> @@ -1089,7 +1089,7 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
>  	set_fb_on_crtc(display, crtc, output, &fb_info);
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
>  	populate_cursor_args(display, crtc, arg, &cursor_fb);
>  	arg[0].flags |= DRM_MODE_CURSOR_BO;
> @@ -1216,7 +1216,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>  	}
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
>  	populate_cursor_args(display, crtc, arg1, &cursor_fb);
>  
> @@ -1395,7 +1395,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
>  	vrefresh = igt_output_get_mode(output)->vrefresh;
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
>  	populate_cursor_args(display, crtc, arg, &cursor_fb);
>  
> @@ -1513,7 +1513,7 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
>  	}
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  
>  	cursors[0] = set_cursor_on_crtc(display, crtc[0], &cursor_fb);
>  	populate_cursor_args(display, crtc[0], arg[0], &cursor_fb);
> @@ -1628,7 +1628,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>  	set_fb_on_crtc(display, crtc, output, &fb_info);
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	populate_cursor_args(display, crtc, arg, &cursor_fb);
>  
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> @@ -1709,10 +1709,11 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>  	set_fb_on_crtc(display, crtc, output, &fb_info[0]);
>  	plane_primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
> -				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info[1]);
> +				    DRM_FORMAT_XRGB8888, IGT_FORMAT_MOD_PREFERRED, .1, .1, .1,
> +				    &fb_info[1]);
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  	populate_cursor_args(display, crtc, arg, &cursor_fb);
>  
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> @@ -1816,7 +1817,7 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
>  
>  	cursor_width = cursor_height = 64;
>  	igt_create_color_fb(display->drm_fd, cursor_width, cursor_height, DRM_FORMAT_ARGB8888,
> -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
>  
>  	igt_display_commit2(display, COMMIT_ATOMIC);

-- 
Jani Nikula, Intel
