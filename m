Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ADFC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 05:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A336C10E84A;
	Thu,  6 Mar 2025 05:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6uJUG+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A18610E84A
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 05:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741239100; x=1772775100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u7idpXRMiQLXtBWqMEZcaOPnq9Ygr0jS4G2axryvJQU=;
 b=l6uJUG+15ayNEdhLneKWtSW9RPA9muKscekx81Nqgnb8p6U3nEMoGEhx
 qc9KEpC7/1hhKJHnck2nX63aH6umhxxzbmyqjf+rrDC27pBD5vMwTDtwj
 WIjWazmcu3DwzMZcywq0mr4yXyBPQnsjQMiOGCO5W+QSHo4/fjBMfelqI
 n+e7fKHZEheuyoXgic13TfY1WAeXg2fhq7g9qMYueB8UeJRl5ktQYeH/d
 ZkzLljLLIme7OJ4QHg4XrcuQfbdqfju5ewGwMDSLgTK2TzGt58C0/KEgX
 YjE5HkKAzmRWZ/lHn11o4IxmpIqssBrhVFTEHQS5HlKMoIBmMuTOZDxCu A==;
X-CSE-ConnectionGUID: R8dd5rCZS1OFja1vqnm+hA==
X-CSE-MsgGUID: fP+V7PA+QgaPNrKrETriHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41942140"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="41942140"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:31:38 -0800
X-CSE-ConnectionGUID: nBBkrIAtSOqNoHMjZOGQQg==
X-CSE-MsgGUID: h7oEtn+KSA6iAGM6HFOTLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="118919404"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:31:37 -0800
Date: Thu, 6 Mar 2025 06:31:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] lib/intel_blt: Promote blt_bo_copy()
Message-ID: <20250306053133.ssski32xlqqda4ii@zkempczy-mobl2>
References: <20250305135821.37517-1-francois.dugast@intel.com>
 <20250305135821.37517-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305135821.37517-2-francois.dugast@intel.com>
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

On Wed, Mar 05, 2025 at 02:57:56PM +0100, Francois Dugast wrote:
> This function abstracts copy with mem blt. Move it to the library so
> that it can be also be used elsewhere without code duplication.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_blt.c             | 53 +++++++++++++++++++++++++++++++++++++
>  lib/intel_blt.h             |  3 +++
>  tests/intel/xe_copy_basic.c | 36 +------------------------
>  3 files changed, 57 insertions(+), 35 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b2fb3151e..84318a557 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1903,6 +1903,59 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  	return ret;
>  }
>  
> +/**
> + * blt_bo_copy:
> + * @fd: drm fd
> + * @src_handle: handle of the source BO
> + * @dst_handle: handle of the destination BO
> + * @ctx: intel_ctx_t context
> + * @size: BO size
> + * @width: width
> + * @height: height
> + * @region: memory region
> + *
> + * Copy BO with mem blit from @src_handle into @dst_handle.
> + */
> +void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> +		 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
> +{
> +	struct blt_mem_data mem = {};
> +	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> +	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> +						  INTEL_ALLOCATOR_SIMPLE,
> +						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
> +	uint8_t dst_mocs = src_mocs;
> +	uint32_t bb;
> +	int result;
> +
> +	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> +
> +	blt_mem_init(fd, &mem);
> +	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
> +			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> +			   COMPRESSION_DISABLED);
> +	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height,
> +			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> +			   COMPRESSION_DISABLED);
> +	mem.src.ptr = xe_bo_map(fd, src_handle, size);
> +	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> +
> +	blt_set_batch(&mem.bb, bb, bb_size, region);
> +	igt_assert(mem.src.width == mem.dst.width);
> +
> +	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> +	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> +
> +	intel_allocator_bind(ahnd, 0, 0);
> +	munmap(mem.src.ptr, size);
> +	munmap(mem.dst.ptr, size);
> +	gem_close(fd, bb);
> +	put_ahnd(ahnd);
> +
> +	igt_assert_f(!result, "source and destination differ\n");
> +}
> +

Take a look to blt_fast_copy() or blt_block_copy() - they are designed
to use allocator which comes from the user (it might be simple or
reloc) and be driver agnostic. Above assumes xe so this is targetted
usecase of using blitter (mem-copy)? Looking at function name I would
assume it supports both drivers - (see gem|xe_exercise_blt.c).
Above matches imo to xe_util, not to lib/intel_blt.c. And if you want
to have such helper to copy bos I would call it xe_blt_mem_copy().
It suits better what this function does.

--
Zbigniew

>  static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *mem,
>  			     uint8_t fill_data)
>  {
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 5d6191ac9..4357d70eb 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -271,6 +271,9 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  			 uint64_t ahnd,
>  			 const struct blt_mem_data *mem);
>  
> +void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> +		 uint32_t size, uint32_t width, uint32_t height, uint32_t region);
> +
>  int blt_mem_set(int fd, const intel_ctx_t *ctx,
>  			const struct intel_execution_engine2 *e, uint64_t ahnd,
>  			const struct blt_mem_data *mem, uint8_t fill_data);
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index a43842e39..458106b0b 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -44,41 +44,7 @@ static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
>  	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
>  {
> -	struct blt_mem_data mem = {};
> -	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> -	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> -						  INTEL_ALLOCATOR_SIMPLE,
> -						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> -	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
> -	uint8_t dst_mocs = src_mocs;
> -	uint32_t bb;
> -	int result;
> -
> -	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> -
> -	blt_mem_init(fd, &mem);
> -	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
> -			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> -			   COMPRESSION_DISABLED);
> -	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height,
> -			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> -			   COMPRESSION_DISABLED);
> -	mem.src.ptr = xe_bo_map(fd, src_handle, size);
> -	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> -
> -	blt_set_batch(&mem.bb, bb, bb_size, region);
> -	igt_assert(mem.src.width == mem.dst.width);
> -
> -	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> -	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> -
> -	intel_allocator_bind(ahnd, 0, 0);
> -	munmap(mem.src.ptr, size);
> -	munmap(mem.dst.ptr, size);
> -	gem_close(fd, bb);
> -	put_ahnd(ahnd);
> -
> -	igt_assert_f(!result, "source and destination differ\n");
> +	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width, height, region);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
