Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8E2C19F4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 14:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562EE112418;
	Wed,  8 May 2024 14:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IL1EJJww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D34112418
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715180046; x=1746716046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9TqoQGs/zDQhX2JZ2N2U7AAHgQPb1QvxVq1uvUePgiE=;
 b=IL1EJJwwihQbmLtQ640CQOt8aT+KJTYlWOQocj3AxB4e6NBYyes/AWJW
 JX5JHRj/JqE2GgVpKw0KY/HwNZpqkNZXj5ih0jruJVQIl+D/Pvy5n9s4S
 RAqa26bvcB2zbOjasvknjBR5/zQQPayGKALqgZbX/tdrZnoEkSOxHC/Q2
 vJcOQMQGxZGGTWnCfcMQ3rX1r3AWXFv86EK7XML4rr6wg31+PjhRqw5lz
 cdFYM70et0oJBGiouTRA+hOKlEtu4bVPPyAdLFHjtFXXH8A1UnQpBH5wl
 fU8lcqCz/TzEpv9PBjIIBUyED42Z7EiVq2CirMzNL/eCH8Bdu4mJl6gXG g==;
X-CSE-ConnectionGUID: YTPSYMIfTGSzuX+7kS+28g==
X-CSE-MsgGUID: acOrGNEFRKq8Kp9FlA3fjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11171360"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11171360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 07:54:05 -0700
X-CSE-ConnectionGUID: siJZfsaPRfKRtfqr1X2ozQ==
X-CSE-MsgGUID: aXV16sufSlGcE7nhaHW1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28895975"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 07:54:05 -0700
Date: Wed, 8 May 2024 16:54:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_fb: fix intel modifiers for fb
 copying on xe driver
Message-ID: <20240508145401.y6mng4gxv4rbsle7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430162939.272990-2-juhapekka.heikkila@gmail.com>
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
On 2024-04-30 at 19:29:34 +0300, Juha-Pekka Heikkila wrote:
> mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
- ^^^^^^
Could you decipher here (or even better as a comment in source and
here) what does 'mc ccs' mean?

> on all platforms with ccs modifiers use engine copy for those.
> Use render engine for x-tile on legacy platforms where x-tile
> would otherwise endup on fastblit patch which is known to have
> limitations.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index cc70cb91c..5df5cb08f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2508,9 +2508,12 @@ static bool blitter_ok(const struct igt_fb *fb)
>  	if (!is_intel_device(fb->fd))
>  		return false;
>  
> -	if ((is_ccs_modifier(fb->modifier) &&
> -	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
> -	     is_gen12_mc_ccs_modifier(fb->modifier))
> +	if ((!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) &&
> +	    is_ccs_modifier(fb->modifier)) ||
> +	    is_gen12_mc_ccs_modifier(fb->modifier) ||
> +	    (!blt_uses_extended_block_copy(fb->fd) &&
> +	    fb->modifier == I915_FORMAT_MOD_X_TILED &&
> +	    is_xe_device(fb->fd)))
>  		return false;
>  
>  	if (is_xe_device(fb->fd))
> @@ -2551,6 +2554,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
>  		return false;
>  
>  	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> +	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
>  	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
>  	       is_gen12_mc_ccs_modifier(fb->modifier);
>  }
> @@ -3062,7 +3066,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
>  		igt_nouveau_delete_bo(&linear->fb);
>  	} else if (is_xe_device(fd)) {
>  		gem_munmap(linear->map, linear->fb.size);
> -		blitcopy(fb, &linear->fb);
> +
> +		if (blit->ibb)
> +			copy_with_engine(blit, fb, &linear->fb);
> +		else
> +			blitcopy(fb, &linear->fb);
> +
>  		gem_close(fd, linear->fb.gem_handle);
>  	} else {
>  		gem_munmap(linear->map, linear->fb.size);
> @@ -3142,7 +3151,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>  
>  		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
>  	} else if (is_xe_device(fd)) {
> -		blitcopy(&linear->fb, fb);
> +		if (blit->ibb)
> +			copy_with_engine(blit, &linear->fb, fb);
> +		else
> +			blitcopy(&linear->fb, fb);

This is repeated code, what about a function like:

copy_with_engine_or_blit(blit, &linear->fb, fb);

Regards,
Kamil

>  
>  		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>  					     linear->fb.size, PROT_READ | PROT_WRITE);
> -- 
> 2.25.1
> 
