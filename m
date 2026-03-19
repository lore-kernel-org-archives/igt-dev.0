Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF69B109024C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 16:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EB710E890;
	Thu, 19 Mar 2026 16:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeZUJCUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8B110E890
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773937091; x=1805473091;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q2eeAw79n6/GcMhm8l61XTIQJMazZxw/ZO+Xjgo6ljg=;
 b=AeZUJCULpIJyqhnYb+G5JLFl5rWSj2nl+NcgHmiSYfq5wF3VHVh3+lgn
 VrWx7wnh/Ay23/wGHOvTTz6GX2F3whAalQcweF7cHz7jlYmMt9XEu24cl
 TkzzwY9xozUpGY3hQNDlicnZa9nmfeMaZDXl3mpMlE6sUJkyOYkJIBSAs
 YwWgT1k+9huXXC9HAzwdyHi3aju/hq6lOKp6ot2XjqsWdgHkBCHPA6Fcs
 UUVmVzCyLuUDOG9pGkaI8FSM1QuiXe6bWQlZnWBTM/+fN6fQ+Lksjw+Vf
 F87ucJl0UUWTk94Jqz5olgevye4APkIjuaa8gpWtFdYmwdu+mZfJktHRM g==;
X-CSE-ConnectionGUID: q/Xc7gZ4SA2msWlnQlnT9A==
X-CSE-MsgGUID: SBSjAPdGSzefPhaiEQO+Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85642790"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="85642790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 09:18:10 -0700
X-CSE-ConnectionGUID: qDoKplB7SriEbyHsMLlhuw==
X-CSE-MsgGUID: MSYnU9TOSgOPoQ3JpOtzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="217030555"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.169])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 09:18:09 -0700
Date: Thu, 19 Mar 2026 18:18:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/prime_vgem: partial conversion to igt_crtc_t *
Message-ID: <abwhvqUW0fGX1-Ju@intel.com>
References: <20260316130113.1274878-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316130113.1274878-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Mar 16, 2026 at 03:01:13PM +0200, Jani Nikula wrote:
> Use igt_crtc_t and use the first CRTC with valid output, instead of hard
> coding 0 and calling it pipe, and pass the crtc pointer around. Clean up
> the relevant parts of the CRTC index and id usage, but limit the
> refactoring to that.
> 
> Note that crtc is initialized during for_each_crtc_with_valid_output(),
> and breaking out of it gives us the first CRTC with valid output.

Looks like that could be replaced with
igt_first_crtc_with_single_output(). But there's plenty of other
stuff that could be done here as well, so I guess leave it all
for later.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> The test is fairly old fashioned, using drmModeGetResources() and ioctls
> directly, and could use a more thorough cleanup.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/prime_vgem.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 6abd2ac53093..ac20ee1cf266 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -908,8 +908,9 @@ static bool has_prime_import(int fd)
>  	return value & DRM_PRIME_CAP_IMPORT;
>  }
>  
> -static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb_id)
> +static bool set_fb_on_crtc(igt_crtc_t *crtc, struct vgem_bo *bo, uint32_t fb_id)
>  {
> +	int fd = crtc->display->drm_fd;
>  	drmModeRes *resources = drmModeGetResources(fd);
>  	struct drm_mode_modeinfo *modes = malloc(4096*sizeof(*modes));
>  	uint32_t encoders[32];
> @@ -939,7 +940,7 @@ static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb
>  			memset(&enc, 0, sizeof(enc));
>  			enc.encoder_id = encoders[e];
>  			drmIoctl(fd, DRM_IOCTL_MODE_GETENCODER, &enc);
> -			if (enc.possible_crtcs & (1 << pipe))
> +			if (enc.possible_crtcs & (1 << crtc->crtc_index))
>  				break;
>  		}
>  		if (e == conn.count_encoders)
> @@ -954,7 +955,7 @@ static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb
>  			continue;
>  
>  		memset(&set, 0, sizeof(set));
> -		set.crtc_id = resources->crtcs[pipe];
> +		set.crtc_id = crtc->crtc_id;
>  		set.fb_id = fb_id;
>  		set.set_connectors_ptr = (uintptr_t)&conn.connector_id;
>  		set.count_connectors = 1;
> @@ -962,18 +963,18 @@ static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb
>  		set.mode_valid = 1;
>  		if (drmIoctl(fd, DRM_IOCTL_MODE_SETCRTC, &set) == 0) {
>  			drmModeFreeResources(resources);
> -			return set.crtc_id;
> +			return true;
>  		}
>  	}
>  
>  	drmModeFreeResources(resources);
> -	return 0;
> +	return false;
>  }
>  
>  static void flip_to_vgem(int i915, int vgem,
>  			 struct vgem_bo *bo,
>  			 uint32_t fb_id,
> -			 uint32_t crtc_id,
> +			 igt_crtc_t *crtc,
>  			 unsigned hang,
>  			 const char *name)
>  {
> @@ -985,13 +986,13 @@ static void flip_to_vgem(int i915, int vgem,
>  
>  	igt_fork(child, 1) { /* Use a child in case we block uninterruptibly */
>  		/* Check we don't block nor flip before the fence is ready */
> -		do_or_die(drmModePageFlip(i915, crtc_id, fb_id,
> +		do_or_die(drmModePageFlip(i915, crtc->crtc_id, fb_id,
>  					  DRM_MODE_PAGE_FLIP_EVENT, &fb_id));
>  		for (int n = 0; n < 5; n++) { /* 5 frames should be <100ms */
>  			igt_assert_f(poll(&pfd, 1, 0) == 0,
>  				     "flip to %s completed whilst busy\n",
>  				     name);
> -			kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
> +			igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
>  		}
>  	}
>  	igt_waitchildren_timeout(2, "flip blocked by waiting for busy vgem fence");
> @@ -1001,12 +1002,12 @@ static void flip_to_vgem(int i915, int vgem,
>  		unsigned long miss;
>  
>  		/* Signal fence at the start of the next vblank */
> -		kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
> +		igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
>  		vgem_fence_signal(vgem, fence);
>  
>  		miss = 0;
>  		igt_until_timeout(5) {
> -			kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
> +			igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
>  			if (poll(&pfd, 1, 0))
>  				break;
>  			miss++;
> @@ -1027,7 +1028,7 @@ static void flip_to_vgem(int i915, int vgem,
>  static void test_flip(int i915, int vgem, unsigned hang)
>  {
>  	drmModeModeInfo *mode = NULL;
> -	uint32_t fb_id[2], handle[2], crtc_id;
> +	uint32_t fb_id[2], handle[2];
>  	igt_display_t display;
>  	igt_output_t *output;
>  	struct vgem_bo bo[2];
> @@ -1070,22 +1071,22 @@ static void test_flip(int i915, int vgem, unsigned hang)
>  		igt_assert(fb_id[i]);
>  	}
>  
> -	igt_require((crtc_id = set_fb_on_crtc(i915, 0, &bo[0], fb_id[0])));
> +	igt_require(set_fb_on_crtc(crtc, &bo[0], fb_id[0]));
>  
>  	/* Bind both fb for use by flipping */
>  	for (int i = 1; i >= 0; i--) {
>  		struct drm_event_vblank vbl;
>  
> -		do_or_die(drmModePageFlip(i915, crtc_id, fb_id[i],
> +		do_or_die(drmModePageFlip(i915, crtc->crtc_id, fb_id[i],
>  					  DRM_MODE_PAGE_FLIP_EVENT, &fb_id[i]));
>  		igt_assert_eq(read(i915, &vbl, sizeof(vbl)), sizeof(vbl));
>  	}
>  
>  	/* Schedule a flip to wait upon the frontbuffer vgem being written */
> -	flip_to_vgem(i915, vgem, &bo[0], fb_id[0], crtc_id, hang, "front");
> +	flip_to_vgem(i915, vgem, &bo[0], fb_id[0], crtc, hang, "front");
>  
>  	/* Schedule a flip to wait upon the backbuffer vgem being written */
> -	flip_to_vgem(i915, vgem, &bo[1], fb_id[1], crtc_id, hang, "back");
> +	flip_to_vgem(i915, vgem, &bo[1], fb_id[1], crtc, hang, "back");
>  
>  	for (int i = 0; i < 2; i++) {
>  		do_or_die(drmModeRmFB(i915, fb_id[i]));
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
