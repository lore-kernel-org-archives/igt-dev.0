Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6A7C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 10:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61AD10E08C;
	Thu,  9 May 2024 10:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cnKKluer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D2D10E08C
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715250974; x=1746786974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m+BpT/5aDO5DQhFfB9W9uVrdD95mAc04M5yOgr30SF8=;
 b=cnKKluer43KLV5L3xtLDVkkvv1UlvY7jXQmrB+zlF71mMcrx1ILr0NSC
 PP2RMUBNtR8KzmIXR/JGmn4blvm/1pMntNJn4AGesVp+8pGmdNhv2vVzd
 J+nn+2BqpMOGVIwbtjHWZxi9iKVZ562ucaqTXMXMKJE1sispSu3FEoLmS
 A5nrzb1iaZTFwB1u+1raeuBfMD7aUNTuZqXFIkBS+/p7u+zTB1IxwyLS8
 Q6JXyDolieK0P4Aju0JLFfQCNavsKCS/de8NPzGYk1nYD6rQsfbaCBXZ6
 UXGhuPLv7RRamfT9u4kQSeL05W5Ca7zYEuhIDFtKEfjsFup3UWYwU0jFW w==;
X-CSE-ConnectionGUID: 8jNOE2piSDKe8p1Ust+c9w==
X-CSE-MsgGUID: C/IUT87oRrCIN7dW1pPrkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11289106"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="11289106"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:36:13 -0700
X-CSE-ConnectionGUID: TgFMCr3TRMCx+ncE+O9prw==
X-CSE-MsgGUID: EpAOiDu8QyS0wXnRUY9aYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="29306165"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:36:12 -0700
Date: Thu, 9 May 2024 12:36:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 6/6] lib/igt_fb: unify intel blitter fb block
 copies between xe and i915
Message-ID: <20240509103608.pw2u452ztelqmik4@zkempczy-mobl2>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-7-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430162939.272990-7-juhapekka.heikkila@gmail.com>
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

On Tue, Apr 30, 2024 at 07:29:39PM +0300, Juha-Pekka Heikkila wrote:
> block copies are almost the same. make them into one helper
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 122 +++++++++++++++++++++------------------------------
>  1 file changed, 50 insertions(+), 72 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5b4670e8d..c46773c8e 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2957,35 +2957,66 @@ static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
>  	intel_ctx_destroy(fd, ictx);
>  }
>  
> +static void do_block_copy(const struct igt_fb *src_fb,
> +			    const struct igt_fb *dst_fb,
> +			    uint32_t mem_region, uint32_t i, uint64_t ahnd,
> +			    uint32_t xe_bb, uint64_t bb_size,
> +			    const intel_ctx_t *ctx,
> +			    struct intel_execution_engine2 *e)
> +{
> +	struct blt_copy_data blt = {};
> +	struct blt_copy_object *src = blt_fb_init(src_fb, i, mem_region);
> +	struct blt_copy_object *dst = blt_fb_init(dst_fb, i, mem_region);

This is dangerous if the blt_fb_init() will return NULL. I would
assert here on in blt_fb_init(). 

> +	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
> +
> +	blt_copy_init(src_fb->fd, &blt);
> +	blt.color_depth = blt_get_bpp(src_fb);
> +	blt_set_copy_object(&blt.src, src);
> +	blt_set_copy_object(&blt.dst, dst);
> +
> +	if (blt_uses_extended_block_copy(src_fb->fd)) {
> +		blt_set_object_ext(&ext.src,
> +				blt_compression_format(&blt, src_fb),
> +				src_fb->width, src_fb->height,
> +				SURFACE_TYPE_2D);
> +
> +		blt_set_object_ext(&ext.dst,
> +				blt_compression_format(&blt, dst_fb),
> +				dst_fb->width, dst_fb->height,
> +				SURFACE_TYPE_2D);
> +		pext = &ext;
> +	}
> +
> +	blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
> +	blt_block_copy(src_fb->fd, ctx, e, ahnd, &blt, pext);
> +
> +	if (e)
> +		gem_sync(src_fb->fd, blt.dst.handle);
> +
> +	blt_destroy_object(src_fb->fd, src);
> +	blt_destroy_object(dst_fb->fd, dst);
> +}
> +

Great, I always vote for reducing code duplication. Just provide
safe guards for the NULL returns here or in blt_fb_init() and respin.

--
Zbigniew

>  static void blitcopy(const struct igt_fb *dst_fb,
>  		     const struct igt_fb *src_fb)
>  {
> -	uint32_t src_tiling, dst_tiling;
> -	uint32_t ctx = 0;
> -	uint64_t ahnd = 0;
> +	uint32_t src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
> +	uint32_t dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
> +	uint32_t ctx = 0, bb, mem_region, vm, exec_queue;
> +	uint64_t ahnd = 0, bb_size = 4096;
>  	const intel_ctx_t *ictx = NULL;
> +	intel_ctx_t *xe_ctx = NULL;
>  	struct intel_execution_engine2 *e;
> -	uint32_t bb, xe_bb;
> -	uint64_t bb_size = 4096;
> -	struct blt_copy_data blt = {};
> -	struct blt_copy_object *src, *dst;
> -	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
> -	uint32_t mem_region;
>  	/* To ignore CC plane */
>  	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
>  	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
> -	intel_ctx_t *xe_ctx;
> -	uint32_t vm, exec_queue;
>  	bool is_xe = is_xe_device(dst_fb->fd);
>  
>  	igt_assert_eq(dst_fb->fd, src_fb->fd);
>  	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
>  
> -	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
> -	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
> -
>  	setup_context_and_memory_region(dst_fb, &ctx, &ahnd, &mem_region,
> -					&vm, &xe_bb, &bb_size, &ictx,
> +					&vm, &bb, &bb_size, &ictx,
>  					&exec_queue, &xe_ctx);
>  
>  	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
> @@ -2994,34 +3025,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
>  
>  		if (is_xe) {
> -			src = blt_fb_init(src_fb, i, mem_region);
> -			dst = blt_fb_init(dst_fb, i, mem_region);
> -
> -			blt_copy_init(src_fb->fd, &blt);
> -			blt.color_depth = blt_get_bpp(src_fb);
> -			blt_set_copy_object(&blt.src, src);
> -			blt_set_copy_object(&blt.dst, dst);
> -
> -			if (blt_uses_extended_block_copy(src_fb->fd)) {
> -				blt_set_object_ext(&ext.src,
> -						blt_compression_format(&blt, src_fb),
> -						src_fb->width, src_fb->height,
> -						SURFACE_TYPE_2D);
> -
> -				blt_set_object_ext(&ext.dst,
> -						blt_compression_format(&blt, dst_fb),
> -						dst_fb->width, dst_fb->height,
> -						SURFACE_TYPE_2D);
> -
> -				pext = &ext;
> -			}
> -
> -			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
> -
> -			blt_block_copy(src_fb->fd, xe_ctx, NULL, ahnd, &blt, pext);
> -
> -			blt_destroy_object(src_fb->fd, src);
> -			blt_destroy_object(dst_fb->fd, dst);
> +			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
> +				      bb, bb_size, xe_ctx, NULL);
>  		} else if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
>  			igt_blitter_fast_copy__raw(dst_fb->fd,
>  						   ahnd, ctx, NULL,
> @@ -3047,35 +3052,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  			}
>  			igt_assert_f(e, "No block copy capable engine found!\n");
>  
> -			src = blt_fb_init(src_fb, i, mem_region);
> -			dst = blt_fb_init(dst_fb, i, mem_region);
> -
> -			blt_copy_init(src_fb->fd, &blt);
> -			blt.color_depth = blt_get_bpp(src_fb);
> -			blt_set_copy_object(&blt.src, src);
> -			blt_set_copy_object(&blt.dst, dst);
> -
> -			if (HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))) {
> -				blt_set_object_ext(&ext.src,
> -						   blt_compression_format(&blt, src_fb),
> -						   src_fb->width, src_fb->height,
> -						   SURFACE_TYPE_2D);
> -
> -				blt_set_object_ext(&ext.dst,
> -						   blt_compression_format(&blt, dst_fb),
> -						   dst_fb->width, dst_fb->height,
> -						   SURFACE_TYPE_2D);
> -
> -				pext = &ext;
> -			}
> -
> -			blt_set_batch(&blt.bb, bb, bb_size, mem_region);
> -
> -			blt_block_copy(src_fb->fd, ictx, e, ahnd, &blt, pext);
> -			gem_sync(src_fb->fd, blt.dst.handle);
> -
> -			blt_destroy_object(src_fb->fd, src);
> -			blt_destroy_object(dst_fb->fd, dst);
> +			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
> +				      bb, bb_size, ictx, e);
>  		} else {
>  			igt_blitter_src_copy(dst_fb->fd,
>  					     ahnd, ctx, NULL,
> -- 
> 2.25.1
> 
