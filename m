Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F086C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 11:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF41410E048;
	Mon, 19 May 2025 11:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1YaqNH2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217AD10E048
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747653485; x=1779189485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/llJW4vefBYm5brE90bbYs60y0kUAY06qgVcGEwG/Fw=;
 b=B1YaqNH2ftjJ6/oWTfama6GXt7aQQVdB4NqKXbCzmg6eDrDZPHr/VKap
 QyHGF2d0aqqWVoot+RmA3CMmj2R93+H0ESpS9eGDu/nlBScvrYj3ucwHz
 XQ35vCARbIgTIo2p7VKcCMR0QM7i4Eati8UrBEuDDzh/WXNrmg0vD+mGA
 wxX229p3YhfMN2VKd1vkv0wPaJA9Q21S1AcVpzlboklSCgJK5iIEEg9yp
 Q4H+X18Ns4DFaDtcwmcngopkmqXa/hLD5jW6JGoo/q6KwrnuGEaVc11RD
 Oyoe+3/TZrkiijptsBI9MD9ie1BVpVqzXM3ZOItCZ7c5YQ6W8RUjzVhDd Q==;
X-CSE-ConnectionGUID: 3ZuE18x2QGShH5WMXMQaPQ==
X-CSE-MsgGUID: IdsX6c2WTNOJAqs1cCYYVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="66961994"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="66961994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:18:02 -0700
X-CSE-ConnectionGUID: T26ez+DwQM+aqj29f8lN5w==
X-CSE-MsgGUID: nI3KMgIEQXO7NoJ5q/xM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144592265"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.236])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:18:00 -0700
Date: Mon, 19 May 2025 13:17:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/15] lib/intel_cmds_info: rename M to TYPE in
 blt_memop_type
Message-ID: <upchwjdu4kp23jq5lx63z7pyaigzum4hi3r6dzemhnr4phzirw@xr2qlcqc37ld>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-6-zbigniew.kempczynski@intel.com>
 <aCrl77t1TQvHgKmq@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCrl77t1TQvHgKmq@fdugast-desk>
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

On Mon, May 19, 2025 at 10:03:59AM +0200, Francois Dugast wrote:
> On Tue, May 13, 2025 at 08:58:00PM +0200, Zbigniew Kempczyński wrote:
> > Documentation separates type and mode in mem-copy so rename prefix
> > to avoid ambiguity.
> 
> Which documentation?

BSpec command description.

--
Zbigniew

> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_blt.c              | 2 +-
> >  lib/intel_cmds_info.c        | 8 ++++----
> >  lib/intel_cmds_info.h        | 4 ++--
> >  tests/intel/xe_copy_basic.c  | 6 +++---
> >  tests/intel/xe_render_copy.c | 4 ++--
> >  tests/intel/xe_spin_batch.c  | 4 ++--
> >  6 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 7010d3ff7d..33efbf1038 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1827,7 +1827,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
> >  					  0, mem->dst.pat_index);
> >  
> >  	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> > -	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
> > +	optype = mem->src.type == TYPE_MATRIX ? 1 << 17 : 0;
> >  
> >  	i = 0;
> >  	batch[i++] = MEM_COPY_CMD | optype;
> > diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> > index d581edb6eb..3bd5eab653 100644
> > --- a/lib/intel_cmds_info.c
> > +++ b/lib/intel_cmds_info.c
> > @@ -74,13 +74,13 @@ static const struct blt_cmd_info
> >  
> >  static const struct blt_cmd_info
> >  		pvc_mem_copy = BLT_INFO(MEM_COPY,
> > -					BIT(M_LINEAR) |
> > -					BIT(M_MATRIX));
> > +					BIT(TYPE_LINEAR) |
> > +					BIT(TYPE_MATRIX));
> >  
> >  static const struct blt_cmd_info
> >  		pvc_mem_set = BLT_INFO(MEM_SET,
> > -				       BIT(M_LINEAR) |
> > -				       BIT(M_MATRIX));
> > +				       BIT(TYPE_LINEAR) |
> > +				       BIT(TYPE_MATRIX));
> >  
> >  static const struct blt_cmd_info
> >  		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
> > diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> > index 7960e0412e..66f63d7e72 100644
> > --- a/lib/intel_cmds_info.h
> > +++ b/lib/intel_cmds_info.h
> > @@ -20,8 +20,8 @@ enum blt_tiling_type {
> >  };
> >  
> >  enum blt_memop_type {
> > -	M_LINEAR,
> > -	M_MATRIX,
> > +	TYPE_LINEAR,
> > +	TYPE_MATRIX,
> >  };
> >  
> >  enum blt_cmd_type {
> > diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> > index d4300b85c0..a9e9bd2359 100644
> > --- a/tests/intel/xe_copy_basic.c
> > +++ b/tests/intel/xe_copy_basic.c
> > @@ -58,10 +58,10 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
> >  
> >  	blt_mem_init(fd, &mem);
> >  	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
> > -			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> > +			   region, src_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
> >  			   COMPRESSION_DISABLED);
> >  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> > -			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> > +			   region, dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
> >  			   COMPRESSION_DISABLED);
> >  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
> >  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> > @@ -109,7 +109,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
> >  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> >  	blt_mem_init(fd, &mem);
> >  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
> > -			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
> > +			   dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR, COMPRESSION_DISABLED);
> >  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> >  	blt_set_batch(&mem.bb, bb, bb_size, region);
> >  	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
> > diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> > index 9f16537c1e..f0a90e320c 100644
> > --- a/tests/intel/xe_render_copy.c
> > +++ b/tests/intel/xe_render_copy.c
> > @@ -470,10 +470,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
> >  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> >  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
> >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > -			   M_LINEAR, COMPRESSION_DISABLED);
> > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> >  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
> >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > -			   M_LINEAR, COMPRESSION_DISABLED);
> > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> >  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> >  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
> >  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> > diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> > index 4fff34a092..06c5f9d3f9 100644
> > --- a/tests/intel/xe_spin_batch.c
> > +++ b/tests/intel/xe_spin_batch.c
> > @@ -351,10 +351,10 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
> >  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> >  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
> >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > -			   M_LINEAR, COMPRESSION_DISABLED);
> > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> >  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
> >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > -			   M_LINEAR, COMPRESSION_DISABLED);
> > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> >  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> >  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
> >  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> > -- 
> > 2.43.0
> > 
