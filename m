Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B7DC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 10:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0286F10E029;
	Thu, 27 Mar 2025 10:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBlZe9Ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F0B10E029
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743071371; x=1774607371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wD753Gv2S2+4IRKvoQvJ581lMDeS4VmMQz204zq2MRI=;
 b=PBlZe9HtihBRgqh1RpTZcTaXz/QdF0tJ6dK8cO1J8UUlb6IwkJxy7lib
 VX12KCRzAWr3sSQaMkDbtYQE5jVMubp08bpstTMWcBzDAzZK+aWi/sqO8
 1PCo+Jx1jOLTJVTK9MFyneLKzrXAysNXI7jjcW6OUxMDVKio3zXDmOqg2
 dRn/HEcl7rpjU1IS+N31EmQ3dOIWPO8BQWIayDRk0yoixzNYwizHyKvR5
 Am2oNb8NW5DNFEEkuLeSeoRkmzNyCHunNZ3ePKEtPRc4OvSCNos1xFK20
 KN5NcOzxbHc1Zik0ZwwPDsG+YQjxAjgNJN4TN9BbkxD6tUhdULbYLhTNS w==;
X-CSE-ConnectionGUID: 1kyJDZcPT7u9L4ayFEazDQ==
X-CSE-MsgGUID: yeasE4j6S5Kl2JZdDfKuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44410582"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44410582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:29:28 -0700
X-CSE-ConnectionGUID: 77nRR56zSmiW53bt7jnBXg==
X-CSE-MsgGUID: xw+1x8wSQ+GEKQRptkNYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="156034747"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:29:26 -0700
Date: Thu, 27 Mar 2025 11:29:23 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v3 1/5] lib/xe/xe_util: Promote xe_blt_mem_copy()
Message-ID: <20250327102923.j7kz7uobesmnu2no@zkempczy-mobl2>
References: <20250326120623.124595-1-francois.dugast@intel.com>
 <20250326120623.124595-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326120623.124595-2-francois.dugast@intel.com>
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

On Wed, Mar 26, 2025 at 01:02:56PM +0100, Francois Dugast wrote:
> This function abstracts copy with mem blt. Move it to xe_util so
> that it can be also be used elsewhere without code duplication.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/xe/xe_util.c            | 55 +++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_util.h            |  3 ++
>  tests/intel/xe_copy_basic.c | 36 +-----------------------
>  3 files changed, 59 insertions(+), 35 deletions(-)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 06b378ce0..ba23bd7d8 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -7,6 +7,8 @@
>  #include "igt_core.h"
>  #include "igt_syncobj.h"
>  #include "igt_sysfs.h"
> +#include "intel_blt.h"
> +#include "intel_mocs.h"
>  #include "intel_pat.h"
>  
>  #include "xe/xe_ioctl.h"
> @@ -275,3 +277,56 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
>  
>  	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
>  }
> +
> +/**
> + * xe_blt_mem_copy:
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
> +void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> +		     uint32_t size, uint32_t width, uint32_t height, uint32_t region)

I would rename this to xe_blt_mem_copy_and_compare(), but returning
true/false to the caller and assert there.

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

Just return result here as a boolean.

> +}
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 06ebd3c2a..550c62101 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -49,4 +49,7 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
>  
>  uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t ns);
>  
> +void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> +		     uint32_t size, uint32_t width, uint32_t height, uint32_t region);
> +
>  #endif /* XE_UTIL_H */
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index a43842e39..b7cee6f62 100644
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
> +	xe_blt_mem_copy(fd, src_handle, dst_handle, ctx, size, width, height, region);

And assert here.

>  }
>  
>  /**
> -- 
> 2.43.0
> 
