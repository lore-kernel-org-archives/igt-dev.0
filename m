Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AEACD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 08:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B086710E6B9;
	Wed,  4 Sep 2024 08:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdIbz1Av";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10BA10E6B9
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725436998; x=1756972998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E95DHYv2d/5EVAWTo1aOd8HaL9dwjqBb67ZSQfYCQW8=;
 b=mdIbz1AvdA4hLRDehLn8lW87Kp6hnKYlzotaUcdxa+vRXw0uF+cyuig2
 PAA4wF07ZPVU5ISS5iz8s6Rbqvf/S8acnRTqIGsBZBR19asXNrdgVivvG
 /bZkBfsrSCZ1u8iJAid57CzvfpMXAXeF686xwEpMuUBv/+E+DHukDSiMc
 5OOm1CX224MdqXDsf8aovjcJdPZgc/O70Quwq7gsbPatOXFsUa6EsWlzw
 RsgVY5RHfOjFxDW4NV4/+Z9jtkETkyXtA/tj6QGOd1dz411i8UQtBrHeJ
 c4VWQOJpxqy/ZopZUkjYCrnFcP5Fx0KRpfynVRYczoh+sOvVr2tkEumMR Q==;
X-CSE-ConnectionGUID: O4LB+oUURiegqi4obses7A==
X-CSE-MsgGUID: fIfgu8gFQyWaaPNCf8nlfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="26993003"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="26993003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:03:17 -0700
X-CSE-ConnectionGUID: ONDkn1HGROCTxqDAZtEBXg==
X-CSE-MsgGUID: g3zA9RCQSvS9g5VinDfxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="95980150"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:03:16 -0700
Date: Wed, 4 Sep 2024 10:03:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/intel_batchbuffer: Introduce
 intel_bb_create_with_context_in_region
Message-ID: <20240904080314.trov7v2luayiv4yb@zkempczy-mobl2>
References: <20240904073803.3239-1-dominik.karol.piatkowski@intel.com>
 <20240904073803.3239-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904073803.3239-2-dominik.karol.piatkowski@intel.com>
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

On Wed, Sep 04, 2024 at 09:38:02AM +0200, Dominik Karol Piątkowski wrote:
> This patch extends __intel_bb_create to take memory region as argument,
> making it possible to create batchbuffer in given memory region.
> Existing helper functions preserve original behavior.
> 
> To make use of this extension, intel_bb_create_with_context_in_region
> is introduced, that creates bb with given context in given memory region.
> 
> v2:
>  - Support both i915 and xe in intel_bb_create_with_context_in_region
>  - Extend intel_bb_create_full to use region argument
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/intel_batchbuffer.c | 65 +++++++++++++++++++++++++++++++----------
>  lib/intel_batchbuffer.h |  5 +++-
>  tests/intel/xe_pat.c    |  4 +--
>  3 files changed, 56 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index f91091bc4..72e2a5d38 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -850,6 +850,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>   * @size: size of the batchbuffer
>   * @do_relocs: use relocations or allocator
>   * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
> + * @region: memory region
>   *
>   * intel-bb assumes it will work in one of two modes - with relocations or
>   * with using allocator (currently RELOC and SIMPLE are implemented).
> @@ -893,7 +894,7 @@ static struct intel_bb *
>  __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  		  uint32_t size, bool do_relocs,
>  		  uint64_t start, uint64_t end, uint64_t alignment,
> -		  uint8_t allocator_type, enum allocator_strategy strategy)
> +		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
>  {
>  	struct drm_i915_gem_exec_object2 *object;
>  	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
> @@ -922,7 +923,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  
>  		ibb->alignment = alignment;
>  		ibb->gtt_size = gem_aperture_size(fd);
> -		ibb->handle = gem_create(fd, size);
> +		ibb->handle = gem_create_in_memory_regions(fd, size, region);
>  
>  		if (!ibb->uses_full_ppgtt)
>  			do_relocs = true;
> @@ -954,7 +955,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  
>  		ibb->alignment = alignment;
>  		size = ALIGN(size + xe_cs_prefetch_size(fd), ibb->alignment);
> -		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
> +		ibb->handle = xe_bo_create(fd, 0, size, region,
>  					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  		/* Limit to 48-bit due to MI_* address limitation */
> @@ -1027,12 +1028,13 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>   * @alignment: alignment to use for allocator, zero for default
>   * @allocator_type: allocator type, SIMPLE, RELOC, ...
>   * @strategy: allocation strategy
> + * @region: memory region
>   *
>   * Creates bb with context passed in @ctx, size in @size and allocator type
> - * in @allocator_type. Relocations are set to false because IGT allocator
> - * is used in that case. VM range is passed to allocator (@start and @end)
> - * and allocation @strategy (suggestion to allocator about address allocation
> - * preferences).
> + * in @allocator_type, in memory region passed in @region. Relocations are set
> + * to false because IGT allocator is used in that case. VM range is passed
> + * to allocator (@start and @end) and allocation @strategy (suggestion
> + * to allocator about address allocation preferences).
>   *
>   * Returns:
>   *
> @@ -1042,10 +1044,10 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
>  				      const intel_ctx_cfg_t *cfg, uint32_t size,
>  				      uint64_t start, uint64_t end,
>  				      uint64_t alignment, uint8_t allocator_type,
> -				      enum allocator_strategy strategy)
> +				      enum allocator_strategy strategy, uint64_t region)
>  {
>  	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
> -				 alignment, allocator_type, strategy);
> +				 alignment, allocator_type, strategy, region);
>  }
>  
>  /**
> @@ -1071,7 +1073,8 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
>  						uint8_t allocator_type)
>  {
>  	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
> -				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
>  }
>  
>  static bool aux_needs_softpin(int fd)
> @@ -1111,7 +1114,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)

It is not displayed here as patch context is too small, but there's
line:

bool relocs = is_i915_device(fd) && gem_has_relocations(fd);

I think you should add is_i915 variable like:

bool is_i915 = is_i915_device(fd);
bool relocs = is_i915 && gem_has_relocations(fd);

and don't call is_i915_device(fd) twice.

>  	return __intel_bb_create(fd, 0, 0, NULL, size,
>  				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW,
> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
>  }
>  
>  /**
> @@ -1138,7 +1142,35 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,

Same here.

>  	return __intel_bb_create(fd, ctx, vm, cfg, size,
>  				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW,
> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
> +}
> +
> +/**
> + * intel_bb_create_with_context_in_region:
> + * @fd: drm fd - i915 or xe
> + * @ctx: for i915 context id, for xe engine id
> + * @vm: for xe vm_id, unused for i915
> + * @cfg: intel_ctx configuration, NULL for default context or legacy mode
> + * @size: size of the batchbuffer
> + * @region: memory region
> + *
> + * Creates bb with context passed in @ctx in memory region passed in @memory.
> + *
> + * Returns:
> + *
> + * Pointer the intel_bb, asserts on failure.
> + */
> +struct intel_bb *
> +intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
> +				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region)
> +{
> +	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
> +
> +	return __intel_bb_create(fd, ctx, vm, cfg, size,
> +				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
> +				 INTEL_ALLOCATOR_SIMPLE,
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
>  }
>  
>  /**
> @@ -1158,7 +1190,8 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>  	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
>  
>  	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
> -				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
> +				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> +				 REGION_SMEM);
>  }
>  
>  /**
> @@ -1183,7 +1216,8 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
>  	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
>  
>  	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
> -				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
> +				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> +				 REGION_SMEM);
>  }
>  
>  /**
> @@ -1204,7 +1238,8 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
>  

Please squash with 2/2. Adding vram_if_possible() makes sense here only
if you differentiate between i915 and xe.

With these nits fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW,
> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
>  }
>  
>  static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index cb32206e5..64121011c 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -309,7 +309,7 @@ struct intel_bb *
>  intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
>  		     const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t start,
>  		     uint64_t end, uint64_t alignment, uint8_t allocator_type,
> -		     enum allocator_strategy strategy);
> +		     enum allocator_strategy strategy, uint64_t region);
>  struct intel_bb *
>  intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t vm,
>  			       const intel_ctx_cfg_t *cfg, uint32_t size,
> @@ -318,6 +318,9 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
>  struct intel_bb *
>  intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>  			     const intel_ctx_cfg_t *cfg, uint32_t size);
> +struct intel_bb *
> +intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
> +				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
>  struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size);
>  struct intel_bb *
>  intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 153d9ce1d..b0b3ad8a7 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -384,7 +384,7 @@ static void pat_index_render(struct xe_pat_param *p)
>  	ibb = intel_bb_create_full(fd, 0, 0, NULL, xe_get_default_alignment(fd),
>  				   0, 0, p->size->alignment,
>  				   INTEL_ALLOCATOR_SIMPLE,
> -				   ALLOC_STRATEGY_HIGH_TO_LOW);
> +				   ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));
>  
>  	size = width * height * bpp / 8;
>  	stride = width * 4;
> @@ -479,7 +479,7 @@ static void pat_index_dw(struct xe_pat_param *p)
>  	ibb = intel_bb_create_full(fd, ctx, vm, NULL, xe_get_default_alignment(fd),
>  				   0, 0, p->size->alignment,
>  				   INTEL_ALLOCATOR_SIMPLE,
> -				   ALLOC_STRATEGY_LOW_TO_HIGH);
> +				   ALLOC_STRATEGY_LOW_TO_HIGH, vram_if_possible(fd, 0));
>  
>  	size = width * height * bpp / 8;
>  	stride = width * 4;
> -- 
> 2.34.1
> 
