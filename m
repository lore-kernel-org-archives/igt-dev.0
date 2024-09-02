Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E71CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 21:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB6610E307;
	Mon,  2 Sep 2024 21:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld531hNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59ED10E307
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725312849; x=1756848849;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+onR75rCtAHcGGPBtEIWrZv4bq2ufSKATp1J8PLLGMY=;
 b=Ld531hNcCcKCBYxHecMcgDk96sCMpMyob98/hgW/xQoghVq6XBJILcXe
 O5S3WspkX+t8ZW+ofYkImEZJJp/izsDlmuGE5Wi2sK+UyWhelLjcjNPWS
 f8gk5iPeIcX9LjL0HQPBLyox3iBdm6RyryMtW1GOd6/w6mbF5v1qQh0p9
 1PcvY+l25yMced+I5Om1e380bJctpbeQADQKW3WbCaySEBXxCB3/omWOK
 b8jN7jE4E/hoBA2w5dAm1EFVrvWx0daAhxrO93jLUYHkjASnkjZebfDE3
 pZoZKU02YzgwtvmnqQ4J9y4VfKKtGPgDEgZ6xDcrZvj/oD1kMpNr/WmKc w==;
X-CSE-ConnectionGUID: TMywM2pRQ4aX5O6VRGcY+w==
X-CSE-MsgGUID: dYYhs9kQTjy4/bUJ2yCoSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34503447"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="34503447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 14:34:09 -0700
X-CSE-ConnectionGUID: wZTQUxuhSbq2YCv49QA3GQ==
X-CSE-MsgGUID: RxmtdBIYSPiMMp6v/WXV1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="69340259"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.105])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 14:34:07 -0700
Date: Mon, 2 Sep 2024 23:34:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/1] lib/intel_batchbuffer: Introduce
 intel_bb_create_with_context_in_memory
Message-ID: <20240902213405.khfs7ibnnayib7ac@zkempczy-mobl2>
References: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
 <20240902114656.9779-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902114656.9779-2-dominik.karol.piatkowski@intel.com>
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

On Mon, Sep 02, 2024 at 01:46:56PM +0200, Dominik Karol Piątkowski wrote:
> This patch extends __intel_bb_create to take memory region as argument,
> making it possible to create batchbuffer in non-vram memory on GPUs
> that have vram. Existing helper functions preserve original behavior.
> 
> To make use of this extension, intel_bb_create_with_context_in_memory
> is introduced, that creates bb with given context in given memory
> region.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/intel_batchbuffer.c | 48 +++++++++++++++++++++++++++++++++--------
>  lib/intel_batchbuffer.h |  3 +++
>  2 files changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index f91091bc4..4c6fea4dd 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -850,6 +850,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>   * @size: size of the batchbuffer
>   * @do_relocs: use relocations or allocator
>   * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
> + * @memory: memory region bitmask, unused for i915

Use region as an argument. And support both i915 and xe.

>   *
>   * intel-bb assumes it will work in one of two modes - with relocations or
>   * with using allocator (currently RELOC and SIMPLE are implemented).
> @@ -893,7 +894,7 @@ static struct intel_bb *
>  __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  		  uint32_t size, bool do_relocs,
>  		  uint64_t start, uint64_t end, uint64_t alignment,
> -		  uint8_t allocator_type, enum allocator_strategy strategy)
> +		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t memory)
>  {
>  	struct drm_i915_gem_exec_object2 *object;
>  	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
> @@ -954,7 +955,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  
>  		ibb->alignment = alignment;
>  		size = ALIGN(size + xe_cs_prefetch_size(fd), ibb->alignment);
> -		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
> +		ibb->handle = xe_bo_create(fd, 0, size, memory,
>  					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  		/* Limit to 48-bit due to MI_* address limitation */
> @@ -1045,7 +1046,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
>  				      enum allocator_strategy strategy)
>  {
>  	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
> -				 alignment, allocator_type, strategy);
> +				 alignment, allocator_type, strategy, vram_if_possible(fd, 0));
>  }
>  
>  /**
> @@ -1071,7 +1072,8 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
>  						uint8_t allocator_type)
>  {
>  	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
> -				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
> +				 vram_if_possible(fd, 0));

Regarding driver use REGION_LMEM(0) for i915 and vram_if_possible(fd, 0) for xe.

>  }
>  
>  static bool aux_needs_softpin(int fd)
> @@ -1111,7 +1113,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
>  	return __intel_bb_create(fd, 0, 0, NULL, size,
>  				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));

Ditto.

>  }
>  
>  /**
> @@ -1138,7 +1140,33 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>  	return __intel_bb_create(fd, ctx, vm, cfg, size,
>  				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));

Ditto.

> +}
> +
> +/**
> + * intel_bb_create_with_context_in_memory:

s/memory/region/

> + * @fd: drm fd - xe
> + * @ctx: engine id
> + * @vm: vm_id
> + * @size: size of the batchbuffer
> + * @memory: memory region bitmask

s/memory/region/

> + *
> + * Creates bb with context passed in @ctx in memory region passed in @memory.
> + *
> + * Returns:
> + *
> + * Pointer the intel_bb, asserts on failure.
> + */
> +struct intel_bb *
> +intel_bb_create_with_context_in_memory(int fd, uint32_t ctx, uint32_t vm, uint32_t size,
> +				       uint64_t memory)
> +{
> +	igt_require(is_xe_device(fd));

No, please support both drivers here.

> +
> +	return __intel_bb_create(fd, ctx, vm, 0, size,
> +				 0, 0, 0, 0,
> +				 INTEL_ALLOCATOR_SIMPLE,
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, memory);
>  }
>  
>  /**
> @@ -1158,7 +1186,8 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>  	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
>  
>  	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
> -				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
> +				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> +				 vram_if_possible(fd, 0));

This is incorrect, vram_if_possible(fd, 0) is valid only for i915, so
putting it as an argument is confusing. Check igt_require() on the
beginning of the function.

>  }
>  
>  /**
> @@ -1183,7 +1212,8 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
>  	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
>  
>  	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
> -				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
> +				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> +				 vram_if_possible(fd, 0));

Ditto.

>  }
>  
>  /**
> @@ -1204,7 +1234,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
>  
>  	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));

igt_require() on this function should be allowed only on i915 as
calling it on xe gives undefined behavior.

--
Zbigniew

>  }
>  
>  static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index cb32206e5..152cda4d0 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -318,6 +318,9 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
>  struct intel_bb *
>  intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>  			     const intel_ctx_cfg_t *cfg, uint32_t size);
> +struct intel_bb *
> +intel_bb_create_with_context_in_memory(int fd, uint32_t ctx, uint32_t vm, uint32_t size,
> +				       uint64_t memory);
>  struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size);
>  struct intel_bb *
>  intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
> -- 
> 2.34.1
> 
