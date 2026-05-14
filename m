Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAD4CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 14:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D21810F203;
	Thu, 14 May 2026 14:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sgrb3R8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52D310F203
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 14:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778768420; x=1810304420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qM0gtOjflc9lWKcZMu0pBVrJGNSugLocEXjmq9sYhI4=;
 b=Sgrb3R8yBHdq9UVc3JLVWNZL1NZsl8o1apiyT4wB5GxeI2phpdhlHxYz
 B1dWClBi2ShVIVSc+nnt7iSBh/O0I6xX/oQu8QELaARJalPrcRPx7ITBT
 r0/OSzSkLsMVTd+OXouZy+hlfCCQzu3KiNkcQEdtvYpiCmSXpnwkBLhxC
 Pq3GcCChulMY/KgCTF36VbrxR4tb+MYoA3oFMIiAV7+8Biea+n05g9eDk
 5zUJ8zdXu1GKpQbHzXp6MmQrxB1X4C7hqhulPgASjKvZuTMRtaMkWcgl/
 V0LtSGOUfHtVBBcWaI74rwVS6cu5RBgGi+/cMZkeZIDCmvCdI7QKQq7E8 g==;
X-CSE-ConnectionGUID: ZJyRhDAfTfa0VMV+/K5Vlg==
X-CSE-MsgGUID: umPEtNiJQyS8AIY1XBEOBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102381745"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="102381745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 07:20:19 -0700
X-CSE-ConnectionGUID: tLiU1ftOSACtJjtKpW646A==
X-CSE-MsgGUID: JWXeR8hRQWO3uLFv3cSekw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:20:18 -0700
Date: Thu, 14 May 2026 16:20:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_blt: Replace CANONICAL() with
 xe_canonical_va() for Xe driver
Message-ID: <20260514142000.oi2urqlhrxyrypdj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <20260508123534.819730-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508123534.819730-1-dnyaneshwar.bhadane@intel.com>
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

Hi Dnyaneshwar,
On 2026-05-08 at 18:05:34 +0530, Dnyaneshwar Bhadane wrote:
> The CANONICAL() macro uses a hardcoded bit width (48) for address
> canonicalization, which is incorrect on platforms where the GPU virtual
> address space differs. Replace CANONICAL() with xe_canonical_va() in the
> Xe driver path, which queries the actual va_bits from the kernel via
> xe_va_bits().
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  lib/intel_blt.c | 28 +++++++++++++++++++---------
>  lib/intel_ctx.c |  3 ++-
>  2 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 2b59cc7e9..77965e932 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -768,8 +768,13 @@ static void fill_data(struct gen12_block_copy_data *data,
>  	data->dw03.dst_x2 = blt->dst.x2;
>  	data->dw03.dst_y2 = blt->dst.y2;
>  
> -	data->dw04.dst_address_lo = dst_offset;
> -	data->dw05.dst_address_hi = dst_offset >> 32;
> +	if (blt->driver == INTEL_DRIVER_XE) {
> +		data->dw04.dst_address_lo = (uint32_t) (xe_canonical_va(blt->fd, dst_offset));
> +		data->dw05.dst_address_hi = (uint32_t) (xe_canonical_va(blt->fd, dst_offset) >> 32);
> +	} else {
> +		data->dw04.dst_address_lo = dst_offset;
> +		data->dw05.dst_address_hi = dst_offset >> 32;
> +	}

Please make it shorter:
	if (blt->driver == INTEL_DRIVER_XE)
		dst_offset = xe_canonical_va(blt->fd, dst_offset);

	data->dw04.dst_address_lo = dst_offset;
	data->dw05.dst_address_hi = dst_offset >> 32;

>  
>  	data->dw06.dst_x_offset = blt->dst.x_offset;
>  	data->dw06.dst_y_offset = blt->dst.y_offset;
> @@ -793,8 +798,13 @@ static void fill_data(struct gen12_block_copy_data *data,
>  			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
>  	}
>  
> -	data->dw09.src_address_lo = src_offset;
> -	data->dw10.src_address_hi = src_offset >> 32;
> +	if (blt->driver == INTEL_DRIVER_XE) {
> +		data->dw09.src_address_lo = (uint32_t) (xe_canonical_va(blt->fd, src_offset));
> +		data->dw10.src_address_hi = (uint32_t) (xe_canonical_va(blt->fd, src_offset) >> 32);
> +	} else {
> +		data->dw09.src_address_lo = src_offset;
> +		data->dw10.src_address_hi = src_offset >> 32;
> +	}

Same here, make it shorter.

Rest looks good.

Regards,
Kamil

>  
>  	data->dw11.src_x_offset = blt->src.x_offset;
>  	data->dw11.src_y_offset = blt->src.y_offset;
> @@ -1091,7 +1101,7 @@ int blt_block_copy(int fd,
>  	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
>  
>  	if (blt->driver == INTEL_DRIVER_XE) {
> -		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> +		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>  	} else {
>  		obj[0].offset = CANONICAL(dst_offset);
>  		obj[1].offset = CANONICAL(src_offset);
> @@ -1456,7 +1466,7 @@ int blt_ctrl_surf_copy(int fd,
>  	emit_blt_ctrl_surf_copy(fd, ahnd, surf, 0, true);
>  
>  	if (surf->driver == INTEL_DRIVER_XE) {
> -		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> +		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>  	} else {
>  		obj[0].offset = CANONICAL(dst_offset);
>  		obj[1].offset = CANONICAL(src_offset);
> @@ -1827,7 +1837,7 @@ int blt_fast_copy(int fd,
>  	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
>  
>  	if (blt->driver == INTEL_DRIVER_XE) {
> -		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> +		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>  	} else {
>  		obj[0].offset = CANONICAL(dst_offset);
>  		obj[1].offset = CANONICAL(src_offset);
> @@ -2180,7 +2190,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  	emit_blt_mem_copy(fd, ahnd, mem, 0, true);
>  
>  	if (mem->driver == INTEL_DRIVER_XE) {
> -		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> +		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>  	} else {
>  		obj[0].offset = CANONICAL(dst_offset);
>  		obj[1].offset = CANONICAL(src_offset);
> @@ -2287,7 +2297,7 @@ int blt_mem_set(int fd, const intel_ctx_t *ctx,
>  	emit_blt_mem_set(fd, ahnd, mem, fill_data);
>  
>  	if (mem->driver == INTEL_DRIVER_XE) {
> -		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> +		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>  	} else {
>  		obj[0].offset = CANONICAL(dst_offset);
>  		obj[1].offset = CANONICAL(bb_offset);
> diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
> index 30325b906..ca0cd43d9 100644
> --- a/lib/intel_ctx.c
> +++ b/lib/intel_ctx.c
> @@ -11,6 +11,7 @@
>  #include "intel_ctx.h"
>  #include "ioctl_wrappers.h"
>  #include "xe/xe_ioctl.h"
> +#include "xe/xe_util.h"
>  
>  /**
>   * SECTION:intel_ctx
> @@ -430,7 +431,7 @@ int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offse
>  		.exec_queue_id = ctx->exec_queue,
>  		.syncs = (uintptr_t)syncs,
>  		.num_syncs = 2,
> -		.address = bb_offset,
> +		.address = xe_canonical_va(ctx->fd, bb_offset),
>  		.num_batch_buffer = 1,
>  	};
>  	uint32_t sync_in = ctx->sync_in;
> -- 
> 2.54.0
> 
