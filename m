Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD921D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 17:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4D210E3F9;
	Mon,  1 Dec 2025 17:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLNAWkOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2F110E3F9
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764609291; x=1796145291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TUnHuXriD6yOSbzDf8F5Y5AcA3TW0fhyoIZC4CyIPp8=;
 b=nLNAWkOiayukW6kRdc0OiYBAFFRJ1dXAJ5oDOK1KDqhkXFGEOXC1Kq9E
 bfDv8wXGPT3vbFaYaF/BCe5HIlKgb9hpwoy5WHcni+9SLeIzRpxUfyY89
 IQWSbptKM/IAIvyM2zxlrxYLptU+hvjK30XK5NUhdHGjXWJdTr+tmEsx+
 ffiFK+9F2OQa0aZKUhjmkOh7b4Ks+jG722mBjXurXWhTi3L41iufwqfvE
 YBjYIKx/XGeu9c86d9IoWhc2Tl6sjIy0nbWbfEIK+2dRoGqJHCeixejE9
 RZtn+lZ2+w3v5P6GepH7l4E8EMcIjPEYtb0m/qav+LdpXtPJqPjty6RPd g==;
X-CSE-ConnectionGUID: ZDNzlVRoSF2LGdr/Dh6SUA==
X-CSE-MsgGUID: D6oKsMLPQQW6pCT+LcUqnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66266898"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66266898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:14:50 -0800
X-CSE-ConnectionGUID: i5lqRP2yTGGWCAkULDjKtA==
X-CSE-MsgGUID: uhzC90RcR0m2x8OmVMmCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193786697"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:14:50 -0800
Date: Mon, 1 Dec 2025 18:14:47 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] intel: Nuke blt_copy_batch::region
Message-ID: <vrleey5khyktouewdeqwdb5yo66xzykzqipvolscpu4nadkv3s@bh7skyz5m24d>
References: <20251128010251.18988-1-ville.syrjala@linux.intel.com>
 <20251128010251.18988-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128010251.18988-2-ville.syrjala@linux.intel.com>
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

On Fri, Nov 28, 2025 at 03:02:49AM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> No idea what this blt_copy_batch::region thing is supposed to
> indicate. It's completely unused, and just confusing everyone
> that calls blt_set_batch(). Nuke it.

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  benchmarks/xe_blt.c             |  2 +-
>  lib/igt_fb.c                    |  2 +-
>  lib/intel_blt.c                 |  5 ++---
>  lib/intel_blt.h                 |  3 +--
>  lib/xe/xe_util.c                |  2 +-
>  tests/intel/gem_ccs.c           | 12 ++++++------
>  tests/intel/gem_exercise_blt.c  |  6 +++---
>  tests/intel/gem_lmem_swapping.c |  4 ++--
>  tests/intel/kms_ccs.c           |  2 +-
>  tests/intel/xe_ccs.c            | 12 ++++++------
>  tests/intel/xe_copy_basic.c     |  4 ++--
>  tests/intel/xe_evict_ccs.c      |  2 +-
>  tests/intel/xe_exercise_blt.c   |  6 +++---
>  tests/intel/xe_pat.c            |  2 +-
>  tests/intel/xe_peer2peer.c      |  4 ++--
>  tests/kms_prime.c               |  2 +-
>  tools/intel_tiling_detect.c     |  2 +-
>  17 files changed, 35 insertions(+), 37 deletions(-)
> 
> diff --git a/benchmarks/xe_blt.c b/benchmarks/xe_blt.c
> index 555178380956..4830cae3cbc5 100644
> --- a/benchmarks/xe_blt.c
> +++ b/benchmarks/xe_blt.c
> @@ -144,7 +144,7 @@ static int src_copy(int xe, const intel_ctx_t *ctx,
>  
>  	blt_set_copy_object(&blt.src, src);
>  	blt_set_copy_object(&blt.dst, dst);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	ret = blt_src_copy(xe, ctx, NULL, ahnd, &blt, height, val, count_value, loop);
>  
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 92883a6186cd..2b4d50531e70 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3092,7 +3092,7 @@ static void do_block_copy(const struct igt_fb *src_fb,
>  		pext = &ext;
>  	}
>  
> -	blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
> +	blt_set_batch(&blt.bb, xe_bb, bb_size);
>  	blt_block_copy(src_fb->fd, ctx, e, ahnd, &blt, pext);
>  
>  	if (e)
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 2b59cc7e90e8..e7dc6db197af 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -2322,11 +2322,10 @@ void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
>  }
>  
>  void blt_set_batch(struct blt_copy_batch *batch,
> -		   uint32_t handle, uint64_t size, uint32_t region)
> +		   uint32_t handle, uint64_t size)
>  {
>  	batch->handle = handle;
>  	batch->size = size;
> -	batch->region = region;
>  }
>  
>  struct blt_copy_object *
> @@ -2609,7 +2608,7 @@ void blt_surface_get_flatccs_data(int fd,
>  				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
>  	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
>  				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> -	blt_set_batch(&surf.bb, bb, bb_size, sysmem);
> +	blt_set_batch(&surf.bb, bb, bb_size);
>  	blt_ctrl_surf_copy(fd, ctx, e, ahnd, &surf);
>  
>  	if (surf.driver == INTEL_DRIVER_XE) {
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index c87178abfb45..72512b3f72a5 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -110,7 +110,6 @@ struct blt_mem_object {
>  
>  struct blt_copy_batch {
>  	uint32_t handle;
> -	uint32_t region;
>  	uint64_t size;
>  };
>  
> @@ -298,7 +297,7 @@ void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
>  		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
>  		  uint16_t x_offset, uint16_t y_offset);
>  void blt_set_batch(struct blt_copy_batch *batch,
> -		   uint32_t handle, uint64_t size, uint32_t region);
> +		   uint32_t handle, uint64_t size);
>  
>  struct blt_copy_object *
>  blt_create_object(const struct blt_copy_data *blt, uint32_t region,
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 6246841e6192..c71bd0162106 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -350,7 +350,7 @@ void xe_fast_copy(int fd,
>  
>  	blt_set_copy_object(&blt.src, &src);
>  	blt_set_copy_object(&blt.dst, &dst);
> -	blt_set_batch(&blt.bb, bb, bb_size, system_memory(fd));
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
>  
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index a84a47cc46c4..68632372d8f5 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -127,7 +127,7 @@ static void surf_copy(int i915,
>  				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
>  	bb_size = 4096;
>  	igt_assert_eq(__gem_create(i915, &bb_size, &bb1), 0);
> -	blt_set_batch(&surf.bb, bb1, bb_size, REGION_SMEM);
> +	blt_set_batch(&surf.bb, bb1, bb_size);
>  	blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
>  	gem_sync(i915, surf.dst.handle);
>  
> @@ -179,7 +179,7 @@ static void surf_copy(int i915,
>  	blt_set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
>  	igt_assert_eq(__gem_create(i915, &bb_size, &bb2), 0);
> -	blt_set_batch(&blt.bb, bb2, bb_size, REGION_SMEM);
> +	blt_set_batch(&blt.bb, bb2, bb_size);
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
>  	gem_sync(i915, blt.dst.handle);
>  	WRITE_PNG(i915, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
> @@ -368,7 +368,7 @@ static void block_copy(int i915,
>  	blt_set_copy_object(&blt.dst, mid);
>  	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, mid_compression_format, width, height, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>  	gem_sync(i915, mid->handle);
> @@ -425,7 +425,7 @@ static void block_copy(int i915,
>  		blt.dst.ptr = mid->ptr;
>  	}
>  
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>  	gem_sync(i915, blt.dst.handle);
>  	WRITE_PNG(i915, run_id, "dst", &blt.dst, width, height, bpp);
> @@ -506,7 +506,7 @@ static void block_multicopy(int i915,
>  	blt_set_object_ext(&ext3.mid, mid_compression_format, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext3.dst, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext3.final, 0, width, height, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt3.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt3.bb, bb, bb_size);
>  
>  	blt_block_copy3(i915, ctx, e, ahnd, &blt3, pext3);
>  	gem_sync(i915, blt3.final.handle);
> @@ -577,7 +577,7 @@ static void block_copy_large(int i915,
>  	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, param.compression_format,
>  			   width, height, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>  	gem_sync(i915, blt.dst.handle);
>  
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
> index 72f3b6b347b3..74388f7f05cf 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -175,7 +175,7 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
>  	blt_set_copy_object(&blt.src, src);
>  	blt_set_copy_object(&blt.mid, mid);
>  	blt_set_copy_object(&blt.dst, dst);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	fast_copy_one_bb(i915, ctx, e, ahnd, &blt);
>  	gem_sync(i915, blt.dst.handle);
> @@ -229,7 +229,7 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
>  	blt.print_bb = param.print_bb;
>  	blt_set_copy_object(&blt.src, src);
>  	blt_set_copy_object(&blt.dst, mid);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	blt_fast_copy(i915, ctx, e, ahnd, &blt);
>  	gem_sync(i915, mid->handle);
> @@ -242,7 +242,7 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
>  	blt.print_bb = param.print_bb;
>  	blt_set_copy_object(&blt.src, mid);
>  	blt_set_copy_object(&blt.dst, dst);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	blt_fast_copy(i915, ctx, e, ahnd, &blt);
>  	gem_sync(i915, blt.dst.handle);
> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> index 6f494b534251..b1f869e432b0 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -207,7 +207,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>  	cmd = calloc(1, sizeof(*cmd));
>  	igt_assert(cmd);
>  	cmd->handle = gem_create_from_pool(i915, &size, region);
> -	blt_set_batch(cmd, cmd->handle, size, region);
> +	blt_set_batch(cmd, cmd->handle, size);
>  
>  	buf = gem_mmap__device_coherent(i915, tmp->handle, 0, obj->size, PROT_WRITE);
>  	gem_set_domain(i915, tmp->handle, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
> @@ -275,7 +275,7 @@ verify_object_ccs(int i915, const struct object *obj,
>  	cmd = calloc(1, sizeof(*cmd));
>  	igt_assert(cmd);
>  	cmd->handle = gem_create_from_pool(i915, &size, region);
> -	blt_set_batch(cmd, cmd->handle, size, region);
> +	blt_set_batch(cmd, cmd->handle, size);
>  
>  	blt_copy_init(i915, &blt);
>  	blt.color_depth = CD_32bit;
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index ab081aa755fa..898d50c8a725 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -592,7 +592,7 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
>  
>  	bb_size = xe_bb_size(fb->fd, SZ_4K);
>  	bb1 = xe_bo_create(fb->fd, 0, bb_size, sysmem, 0);
> -	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
> +	blt_set_batch(&surf.bb, bb1, bb_size);
>  	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
>  	intel_ctx_xe_sync(surf_ctx, true);
>  
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 61cf97d52550..e15cc24468f4 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -144,7 +144,7 @@ static void surf_copy(int xe,
>  				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
>  	bb_size = xe_bb_size(xe, SZ_4K);
>  	bb1 = xe_bo_create(xe, 0, bb_size, sysmem, 0);
> -	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
> +	blt_set_batch(&surf.bb, bb1, bb_size);
>  	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
>  	intel_ctx_xe_sync(ctx, true);
>  
> @@ -215,7 +215,7 @@ static void surf_copy(int xe,
>  	blt_set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
>  	bb2 = xe_bo_create(xe, 0, bb_size, sysmem, 0);
> -	blt_set_batch(&blt.bb, bb2, bb_size, sysmem);
> +	blt_set_batch(&blt.bb, bb2, bb_size);
>  	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
>  	intel_ctx_xe_sync(ctx, true);
>  	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
> @@ -389,7 +389,7 @@ static void block_copy(int xe,
>  	blt_set_copy_object(&blt.dst, mid);
>  	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, mid_compression_format, width, height, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
>  	intel_ctx_xe_sync(ctx, true);
>  
> @@ -450,7 +450,7 @@ static void block_copy(int xe,
>  		blt.dst.ptr = mid->ptr;
>  	}
>  
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
>  	intel_ctx_xe_sync(ctx, true);
>  
> @@ -543,7 +543,7 @@ static void block_multicopy(int xe,
>  	blt_set_object_ext(&ext3.mid, mid_compression_format, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext3.dst, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext3.final, 0, width, height, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt3.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt3.bb, bb, bb_size);
>  
>  	blt_block_copy3(xe, ctx, ahnd, &blt3, pext3);
>  	intel_ctx_xe_sync(ctx, true);
> @@ -619,7 +619,7 @@ static void block_copy_large(int xe,
>  	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, param.compression_format,
>  			   width, height, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
>  	intel_ctx_xe_sync(ctx, true);
>  
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 09cfa470dd74..e24216ee18e4 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -119,7 +119,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	for (i = 0; i < size; i++)
>  		psrc[i] = rand();
>  
> -	blt_set_batch(&mem.bb, bb, bb_size, region);
> +	blt_set_batch(&mem.bb, bb, bb_size);
>  	igt_assert(mem.src.width == mem.dst.width);
>  
>  	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> @@ -190,7 +190,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
>  			   dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> -	blt_set_batch(&mem.bb, bb, bb_size, region);
> +	blt_set_batch(&mem.bb, bb, bb_size);
>  	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
>  
>  	result = (uint8_t *)mem.dst.ptr;
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 7cba378cdb1d..175461a4f5d8 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -94,7 +94,7 @@ static void copy_obj(struct blt_copy_data *blt,
>  	blt_set_copy_object(&blt->dst, dst_obj);
>  	blt_set_object_ext(&ext.src, 0, w, h, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, 0, w, h, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt->bb, bb, bb_size, vram_if_possible(fd, 0));
> +	blt_set_batch(&blt->bb, bb, bb_size);
>  	blt_block_copy(fd, ctx, NULL, ahnd, blt, &ext);
>  	intel_ctx_xe_sync(ctx, true);
>  
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index e24a48abf54a..211605a8b399 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -165,7 +165,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>  	blt_set_copy_object(&blt.src, src);
>  	blt_set_copy_object(&blt.mid, mid);
>  	blt_set_copy_object(&blt.dst, dst);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	fast_copy_one_bb(xe, ctx, ahnd, &blt);
>  
> @@ -217,7 +217,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>  	blt.print_bb = param.print_bb;
>  	blt_set_copy_object(&blt.src, src);
>  	blt_set_copy_object(&blt.dst, mid);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	blt_fast_copy(xe, ctx, NULL, ahnd, &blt);
>  
> @@ -229,7 +229,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>  	blt.print_bb = param.print_bb;
>  	blt_set_copy_object(&blt.src, mid);
>  	blt_set_copy_object(&blt.dst, dst);
> -	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	blt_fast_copy(xe, ctx, NULL, ahnd, &blt);
>  
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 59dfb6b1115f..9e8ab2afcde7 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -297,7 +297,7 @@ static void pat_index_blt(struct xe_pat_param *p)
>  
>  	blt_set_copy_object(&blt.src, &src);
>  	blt_set_copy_object(&blt.dst, &dst);
> -	blt_set_batch(&blt.bb, bb, bb_size, system_memory(fd));
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  
>  	/* Ensure we always see zeroes for the initial KMD zeroing */
>  	blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> index 92cb6a65f515..5cfb986c194e 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -161,7 +161,7 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  	blt_set_copy_object(&im_blt.dst, dst);
>  
>  	bb = xe_bo_create(im_xe, 0, im_bb_size, im_reg, 0);
> -	blt_set_batch(&im_blt.bb, bb, im_bb_size, im_reg);
> +	blt_set_batch(&im_blt.bb, bb, im_bb_size);
>  
>  	blt_fast_copy(im_xe, ctx, NULL, ahnd, &im_blt);
>  
> @@ -250,7 +250,7 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  	blt_set_copy_object(&im_blt.dst, im_dst);
>  
>  	bb = xe_bo_create(im_xe, 0, im_bb_size, im_reg, 0);
> -	blt_set_batch(&im_blt.bb, bb, im_bb_size, im_reg);
> +	blt_set_batch(&im_blt.bb, bb, im_bb_size);
>  
>  	blt_fast_copy(im_xe, ctx, NULL, ahnd, &im_blt);
>  
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index aa3cc386cc05..2f77b5073017 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -322,7 +322,7 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
>  					     vram_if_possible(importer_fd, 0),
>  					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
> -			blt_set_batch(&blt.bb, xe_bb, bb_size, vram_if_possible(importer_fd, 0));
> +			blt_set_batch(&blt.bb, xe_bb, bb_size);
>  			blt_fast_copy(importer_fd, xe_ctx, NULL, ahnd, &blt);
>  
>  			put_offset(ahnd, dst->handle);
> diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
> index 951e2eecd04a..0bc1e202d33c 100644
> --- a/tools/intel_tiling_detect.c
> +++ b/tools/intel_tiling_detect.c
> @@ -142,7 +142,7 @@ static void blt_copy(int fd,
>  	blt_set_copy_object(&blt.dst, dst);
>  	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
> -	blt_set_batch(&blt.bb, bb, bb_size, src_region);
> +	blt_set_batch(&blt.bb, bb, bb_size);
>  	if (fn == BLOCK_COPY)
>  		blt_block_copy(fd, ctx, e, ahnd, &blt, pext);
>  	else if (fn == FAST_COPY)
> -- 
> 2.51.2
> 
