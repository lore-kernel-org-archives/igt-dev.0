Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E517C25B7E
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 08:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B0388284;
	Tue,  4 Jun 2024 08:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABZ4c/p7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2936D10E43D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717488758; x=1749024758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iRW+4QuOI89O1ad43dFeL9Nbcr/LkrA/o9061OhfY0E=;
 b=ABZ4c/p7ommZAsVc47HIrdtgk8uitjr5D25gQ63V/TCpdywaxpp1GQ3L
 hgk8rlEQ3NdQgAC61tuifYOKQD9JffpqV17WOp4+7xImpZqsH70R8nSwa
 lBO1Um8cl3CzAtlTVN37bm1FvVSGmTDRiLaQR8yurAZHPg7oE9UyAEIyS
 93koPykmePMhW/scVZ0qiJdWxn3tWg/VziUI3KXRw5Ds/K5GjVdOXkBJt
 Jyf8BCAzrLScMdZdnSWIoF1+qxLH9iGx7ycxtaJmkWYGMCZA1yGcgkSvq
 FgrS6w+f4TMKyUsuh9TRAULiMJ3zFFOFx+yvvb07J9rG81LPqTyyg2DqB g==;
X-CSE-ConnectionGUID: QG+oxWgOQryCAC97cqZ4IQ==
X-CSE-MsgGUID: f2OhieLdTMu3i2SGaCmK1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13898053"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="13898053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:12:36 -0700
X-CSE-ConnectionGUID: tHwjcvFCTCykjYaXCFq+kA==
X-CSE-MsgGUID: ygh9rF+0T1icPktwZiXPmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="67985082"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:12:34 -0700
Date: Tue, 4 Jun 2024 10:12:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 5/5] lib/igt_fb: unify intel blitter fb block
 copies between xe and i915
Message-ID: <20240604081231.ww57g4a7xzeuhtlt@zkempczy-mobl2>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
 <20240530142346.1511811-6-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530142346.1511811-6-juhapekka.heikkila@gmail.com>
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

On Thu, May 30, 2024 at 05:23:46PM +0300, Juha-Pekka Heikkila wrote:
> block copies are almost the same. make them into one helper
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 124 +++++++++++++++++++++------------------------------
>  1 file changed, 52 insertions(+), 72 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index d8608ef08..a1b798e7f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2958,35 +2958,68 @@ static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
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
> +	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
> +
> +	igt_assert(src && dst);
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

At this moment I won't complain too much about two intel_ctx_t *
variables as I'm responsible for this un-const mess for xe.

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
> @@ -2995,34 +3028,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
> @@ -3048,35 +3055,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
> 2.43.2
> 

Nice! Less code is better and definitely more readable.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

