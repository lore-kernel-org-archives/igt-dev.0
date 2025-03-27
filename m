Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1B8C3600C
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 10:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8610E8B0;
	Thu, 27 Mar 2025 10:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mcs5ifzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6FB10E029
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743071467; x=1774607467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v8xDLdGLn6qD0aEpX/HmEVGP739M35Cx5p1MKiWXy7o=;
 b=Mcs5ifzfXu3RR8MtFC5E/ypMqVti3vJ8V6r4Oek6nnLlq2hoAfu8bshS
 XAideK/FTVvD9XXvrZR5IOtDDDZjeXpN1WDE2HiswsYB4MhIM0i/AvxsJ
 dYAaMTs9GFZEQSV/Okhdj0mLKetD4EC2iaa9rbn8bJ0yWp1m1BZnsZxys
 hwQPr6qBK5IEnJkiprih6nb95iES3wj5A4X3urDbpFucgGoyQ5MVT1Xuc
 GxVW+S+1nqIisUr2UK8wfv9UtcFKeQ8TgHzT6CNEtnq1kkKzFxI/wjjD3
 3XO5DJPfjZZLRwrInJGh7H2xigsPTDzjgFULuLzk21CDo72k6CqyvIYOi g==;
X-CSE-ConnectionGUID: GF4huEKjRimaJsLeHHLhEw==
X-CSE-MsgGUID: 3OrDrXP4SoCqF1ueDnu6uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48269909"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="48269909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:31:05 -0700
X-CSE-ConnectionGUID: k7fsEAxbQb2G8v1XshqOXg==
X-CSE-MsgGUID: Quy6hrOiT1qdGfeQjARClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125068870"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:31:04 -0700
Date: Thu, 27 Mar 2025 11:31:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v3 2/5] lib/intel_blt: Allow forcing multiple runs
 in blt_mem_copy()
Message-ID: <20250327103101.3ntxm4k2sru2qeos@zkempczy-mobl2>
References: <20250326120623.124595-1-francois.dugast@intel.com>
 <20250326120623.124595-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326120623.124595-3-francois.dugast@intel.com>
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

On Wed, Mar 26, 2025 at 01:02:57PM +0100, Francois Dugast wrote:
> Allowing to run the same copy multiple times presents no functional
> advantage but it can be used to keep the copy functions busy longer
> while other tests are being performed.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_blt.c  | 32 ++++++++++++++++++--------------
>  lib/intel_blt.h  |  3 ++-
>  lib/xe/xe_util.c |  2 +-
>  3 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b2fb3151e..d33cdd911 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1815,10 +1815,10 @@ void blt_mem_init(int fd, struct blt_mem_data *mem)
>  	mem->driver = get_intel_driver(fd);
>  }
>  
> -static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem)
> +static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem, int ncopies)

No, please add emit_bbe here, and loop around in the caller.

>  {
>  	uint64_t dst_offset, src_offset;
> -	int i;
> +	int i, j;
>  	uint32_t *batch;
>  	uint32_t optype;
>  
> @@ -1831,16 +1831,18 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>  	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
>  
>  	i = 0;
> -	batch[i++] = MEM_COPY_CMD | optype;
> -	batch[i++] = mem->src.width - 1;
> -	batch[i++] = mem->src.height - 1;
> -	batch[i++] = mem->src.pitch - 1;
> -	batch[i++] = mem->dst.pitch - 1;
> -	batch[i++] = src_offset;
> -	batch[i++] = src_offset << 32;
> -	batch[i++] = dst_offset;
> -	batch[i++] = dst_offset << 32;
> -	batch[i++] = mem->src.mocs_index << MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
> +	for (j = 0; j < ncopies; j++) {
> +		batch[i++] = MEM_COPY_CMD | optype;
> +		batch[i++] = mem->src.width - 1;
> +		batch[i++] = mem->src.height - 1;
> +		batch[i++] = mem->src.pitch - 1;
> +		batch[i++] = mem->dst.pitch - 1;
> +		batch[i++] = src_offset;
> +		batch[i++] = src_offset << 32;
> +		batch[i++] = dst_offset;
> +		batch[i++] = dst_offset << 32;
> +		batch[i++] = mem->src.mocs_index << MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
> +	}
>  	batch[i++] = MI_BATCH_BUFFER_END;

if (emit_bbe)
	batch[i++] = MI_BATCH_BUFFER_END;


--
Zbigniew

>  
>  	munmap(batch, mem->bb.size);
> @@ -1853,6 +1855,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>   * @e: blitter engine for @ctx
>   * @ahnd: allocator handle
>   * @blt: blitter data for mem-copy.
> + * @ncopies: how many times copy is run, > 1 can be used to stress the copy function
>   *
>   * Function does mem blit between @src and @dst described in @blt object.
>   *
> @@ -1862,7 +1865,8 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>  int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e,
>  		 uint64_t ahnd,
> -		 const struct blt_mem_data *mem)
> +		 const struct blt_mem_data *mem,
> +		 int ncopies)
>  {
>  	struct drm_i915_gem_execbuffer2 execbuf = {};
>  	struct drm_i915_gem_exec_object2 obj[3] = {};
> @@ -1875,7 +1879,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  					  0, mem->dst.pat_index);
>  	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
>  
> -	emit_blt_mem_copy(fd, ahnd, mem);
> +	emit_blt_mem_copy(fd, ahnd, mem, ncopies);
>  
>  	if (mem->driver == INTEL_DRIVER_XE) {
>  		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 5d6191ac9..1c463b35b 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -269,7 +269,8 @@ void blt_mem_init(int fd, struct blt_mem_data *mem);
>  int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  			 const struct intel_execution_engine2 *e,
>  			 uint64_t ahnd,
> -			 const struct blt_mem_data *mem);
> +			 const struct blt_mem_data *mem,
> +			 int ncopies);
>  
>  int blt_mem_set(int fd, const intel_ctx_t *ctx,
>  			const struct intel_execution_engine2 *e, uint64_t ahnd,
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index ba23bd7d8..2d9e67955 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -319,7 +319,7 @@ void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const int
>  	blt_set_batch(&mem.bb, bb, bb_size, region);
>  	igt_assert(mem.src.width == mem.dst.width);
>  
> -	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> +	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, 1);
>  	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
>  
>  	intel_allocator_bind(ahnd, 0, 0);
> -- 
> 2.43.0
> 
