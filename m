Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446FAC35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 19:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE50010E35D;
	Wed, 19 Mar 2025 19:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJLOOuKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11F210E361
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742411755; x=1773947755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m+3gWPlheKvEY1sv2zpwgveNqlM2nDDREc1CUWjafpw=;
 b=iJLOOuKVn9ODwqLvjtr+XrvSkBFj5VXNoFvYE2RLCDOJIHx/afVX1Grc
 q42UsfUxmMO6uFsYIT6QtfKRyGx2rnpWYUF5Zw2cZJYzoz3sZwgMkZtL7
 To4HEP+Oslex9OFkbXk1GEbN4tQG9x7AzkioUB6AQ1ZR/9X4gu7WFuP2s
 l0dUScAZxJ9CCUUIVzr63Sv8mooHJlnk7+H1BNZMlOv8LukcR8dkTNin5
 priNrvLYUcsSf8bLncz4NTar6bPCppfNSAqy2CWemTAQqAuPoUWjpBbfr
 rl/sv6PH3Gi6nbaEs4ByoxRzOZSu2Z6oc6vwTgrIpMVJj4uqTdqGfORxI A==;
X-CSE-ConnectionGUID: oJAiXk4NT+iF4OKgGFqhaA==
X-CSE-MsgGUID: 0mw4VgD8TcifacaxuVtIXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="68975411"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="68975411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 12:15:54 -0700
X-CSE-ConnectionGUID: 0WwyJhBFRJqowi55T8cR4Q==
X-CSE-MsgGUID: aM+yS+GLQn+jnGf1SV3yfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="153761682"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.29])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 12:15:53 -0700
Date: Wed, 19 Mar 2025 20:15:49 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] lib/intel_blt: Promote blt_bo_copy()
Message-ID: <20250319191549.mws7qpeg54iy3hbr@zkempczy-mobl2>
References: <20250305090743.16894-1-francois.dugast@intel.com>
 <20250305090743.16894-2-francois.dugast@intel.com>
 <b7619b7a4a16255b8261155a2c7efdd89b96f4d8.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7619b7a4a16255b8261155a2c7efdd89b96f4d8.camel@linux.intel.com>
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

On Wed, Mar 19, 2025 at 01:41:37PM +0100, Thomas Hellström wrote:
> On Wed, 2025-03-05 at 10:06 +0100, Francois Dugast wrote:
> > This function abstracts copy with mem blt. Move it to the library so
> > that it can be also be used elsewhere without code duplication.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> LGTM.
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thomas, I'm sorry, but I would like to not merge this change to
intel_blt. Please see my comment to this patch at 6th March.

--
Zbigniew
> 
> > ---
> >  lib/intel_blt.c             | 53
> > +++++++++++++++++++++++++++++++++++++
> >  lib/intel_blt.h             |  3 +++
> >  tests/intel/xe_copy_basic.c | 36 +------------------------
> >  3 files changed, 57 insertions(+), 35 deletions(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index b2fb3151e..84318a557 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1903,6 +1903,59 @@ int blt_mem_copy(int fd, const intel_ctx_t
> > *ctx,
> >  	return ret;
> >  }
> >  
> > +/**
> > + * blt_bo_copy:
> > + * @fd: drm fd
> > + * @src_handle: handle of the source BO
> > + * @dst_handle: handle of the destination BO
> > + * @ctx: intel_ctx_t context
> > + * @size: BO size
> > + * @width: width
> > + * @height: height
> > + * @region: memory region
> > + *
> > + * Copy BO with mem blit from @src_handle into @dst_handle.
> > + */
> > +void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> > const intel_ctx_t *ctx,
> > +		 uint32_t size, uint32_t width, uint32_t height,
> > uint32_t region)
> > +{
> > +	struct blt_mem_data mem = {};
> > +	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> > +	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> > +						 
> > INTEL_ALLOCATOR_SIMPLE,
> > +						 
> > ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> > +	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
> > +	uint8_t dst_mocs = src_mocs;
> > +	uint32_t bb;
> > +	int result;
> > +
> > +	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> > +
> > +	blt_mem_init(fd, &mem);
> > +	blt_set_mem_object(&mem.src, src_handle, size, 0, width,
> > height,
> > +			   region, src_mocs, DEFAULT_PAT_INDEX,
> > M_LINEAR,
> > +			   COMPRESSION_DISABLED);
> > +	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width,
> > height,
> > +			   region, dst_mocs, DEFAULT_PAT_INDEX,
> > M_LINEAR,
> > +			   COMPRESSION_DISABLED);
> > +	mem.src.ptr = xe_bo_map(fd, src_handle, size);
> > +	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> > +
> > +	blt_set_batch(&mem.bb, bb, bb_size, region);
> > +	igt_assert(mem.src.width == mem.dst.width);
> > +
> > +	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> > +	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> > +
> > +	intel_allocator_bind(ahnd, 0, 0);
> > +	munmap(mem.src.ptr, size);
> > +	munmap(mem.dst.ptr, size);
> > +	gem_close(fd, bb);
> > +	put_ahnd(ahnd);
> > +
> > +	igt_assert_f(!result, "source and destination differ\n");
> > +}
> > +
> >  static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct
> > blt_mem_data *mem,
> >  			     uint8_t fill_data)
> >  {
> > diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> > index 5d6191ac9..4357d70eb 100644
> > --- a/lib/intel_blt.h
> > +++ b/lib/intel_blt.h
> > @@ -271,6 +271,9 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
> >  			 uint64_t ahnd,
> >  			 const struct blt_mem_data *mem);
> >  
> > +void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> > const intel_ctx_t *ctx,
> > +		 uint32_t size, uint32_t width, uint32_t height,
> > uint32_t region);
> > +
> >  int blt_mem_set(int fd, const intel_ctx_t *ctx,
> >  			const struct intel_execution_engine2 *e,
> > uint64_t ahnd,
> >  			const struct blt_mem_data *mem, uint8_t
> > fill_data);
> > diff --git a/tests/intel/xe_copy_basic.c
> > b/tests/intel/xe_copy_basic.c
> > index a43842e39..458106b0b 100644
> > --- a/tests/intel/xe_copy_basic.c
> > +++ b/tests/intel/xe_copy_basic.c
> > @@ -44,41 +44,7 @@ static void
> >  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const
> > intel_ctx_t *ctx,
> >  	 uint32_t size, uint32_t width, uint32_t height, uint32_t
> > region)
> >  {
> > -	struct blt_mem_data mem = {};
> > -	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> > -	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> > -						 
> > INTEL_ALLOCATOR_SIMPLE,
> > -						 
> > ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> > -	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
> > -	uint8_t dst_mocs = src_mocs;
> > -	uint32_t bb;
> > -	int result;
> > -
> > -	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> > -
> > -	blt_mem_init(fd, &mem);
> > -	blt_set_mem_object(&mem.src, src_handle, size, 0, width,
> > height,
> > -			   region, src_mocs, DEFAULT_PAT_INDEX,
> > M_LINEAR,
> > -			   COMPRESSION_DISABLED);
> > -	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width,
> > height,
> > -			   region, dst_mocs, DEFAULT_PAT_INDEX,
> > M_LINEAR,
> > -			   COMPRESSION_DISABLED);
> > -	mem.src.ptr = xe_bo_map(fd, src_handle, size);
> > -	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> > -
> > -	blt_set_batch(&mem.bb, bb, bb_size, region);
> > -	igt_assert(mem.src.width == mem.dst.width);
> > -
> > -	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> > -	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> > -
> > -	intel_allocator_bind(ahnd, 0, 0);
> > -	munmap(mem.src.ptr, size);
> > -	munmap(mem.dst.ptr, size);
> > -	gem_close(fd, bb);
> > -	put_ahnd(ahnd);
> > -
> > -	igt_assert_f(!result, "source and destination differ\n");
> > +	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width,
> > height, region);
> >  }
> >  
> >  /**
> 
