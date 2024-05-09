Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8F5C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 09:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B1B10E2D8;
	Thu,  9 May 2024 09:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxoivgjV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ED110E2D8
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715248031; x=1746784031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=priAhqrrPMdVxASdZUZFeh4okD3L9fSz0O1OTuNzYok=;
 b=AxoivgjVWKG69zvnQLKpFRf3a/qpekA8Bu4FFvTjP7bVaYZ/rW4TqLRu
 el+Hjq0tdoIS7Zg/5oywxFJvUuTjv63tNTcTNSDoywrguQvN8l3p/EDrA
 uW5dbVYuXXUXfQB8akB5VVIIQaTV0b67ymP8wJtsJ4RucZN3kqpdxN3Y4
 9QCWSrTKzUo6fassimlnh96aoiW8oJZpFsG5dlBQPyWHkBGr0wjPPuJl7
 Y765uSsQ3JNMXzRdFlru+7V6P3m+7XCTr02zoO6u9y/b8ITVVA50PPvh1
 nbuksPbwDdBqnoeRWz4+chMCqCXjAHkeokoIsUzc4vBb519lRyn8xkgE3 Q==;
X-CSE-ConnectionGUID: RG3y9glMS8Wjs2e4XeNz6w==
X-CSE-MsgGUID: ClQPqsG6TTy9iDSf6eDisQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11369575"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="11369575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 02:47:10 -0700
X-CSE-ConnectionGUID: ti7HY15FRBKTiJ1CB9aecg==
X-CSE-MsgGUID: 5wJhztvET7Kwq9fkJs5k7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="33654431"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 02:47:09 -0700
Date: Thu, 9 May 2024 11:47:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_fb: fix intel modifiers for fb
 copying on xe driver
Message-ID: <20240509094706.ibg5mpunk7p4sl2h@zkempczy-mobl2>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Apr 30, 2024 at 07:29:34PM +0300, Juha-Pekka Heikkila wrote:
> mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
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

If I'm not wrong this will switch to vebox copy on TGL and DG1
are other platforms also touched? TGL works both on i915/xe
whereas if I'm not wrong DG1 is i915 only.

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

I've taken a look at the code and blitcopy() which does:

	if (is_xe)
		do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
			      bb, bb_size, xe_ctx, NULL);

uses implicit assumptions regarding mc ccs established in blitter_ok()
and use_enginecopy(). Do you see an option to migrate some
tiling/formats/etc selection logic to intel_cmds_info? I mean I would
like to use some centralized place to keep all the knowledge about
that instead hardcoding conditions around the code.

Anyway, I see no objections to merge as it is, as such refactoring
is time consuming and not necessary at the moment. But if you would
consider to do that in the future it would be great.

From me at the moment:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
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
>  
>  		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>  					     linear->fb.size, PROT_READ | PROT_WRITE);
> -- 
> 2.25.1
> 
