Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CDACD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 08:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C905A113266;
	Wed, 10 Apr 2024 08:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DybRNBri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F272010E8BB
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 08:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712738017; x=1744274017;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UDVALz8EdlsBaa1iZYEA9Sz+svycXHNWSTsiWD6M6P0=;
 b=DybRNBrilJaxi00OlOayK7YWXnTwUtDRd2ewGK/yZSIIOvpO3H7THuRy
 XCZKvGjrMeYSnLjmB9U/3SF+pI7BjQjIaq3u+NSLwZk49vwVJG1ZCE70g
 Py1cF0l5dP1tauEjkZ0/d7LKW+SeDETVvANgMaxI9JM18itbSsSYqMWPz
 7QA82QKLeS+BIzifdhL0ROvPCAheF5vG5OB+I8ophvJCIAkhMmG4La8Oh
 WkDZrzOdybhqGtILf43Thp5bl550Dyxzz3D4pE5QCn2+8B6BITIZwXvNS
 BpivVRrlolslEWCs0DOWaF6hOubXsYXX9PBe314Nz9XB6XCMz2AdoCDSz A==;
X-CSE-ConnectionGUID: WCh35Bx+QBm07yFZYHylJg==
X-CSE-MsgGUID: lHe4UCmYR3mQzynELDocsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30567676"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="30567676"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:33:35 -0700
X-CSE-ConnectionGUID: Nc/kgyWqSl66TqwI+q9agQ==
X-CSE-MsgGUID: 4blyFZsUSGeM4JQsXydB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57921988"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:33:34 -0700
Date: Wed, 10 Apr 2024 10:33:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/intel_blt: Add functions which extract and
 check object ccs data
Message-ID: <20240410083331.pgu4aunpcefh4zkt@zkempczy-mobl2>
References: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
 <20240329091655.1347862-2-zbigniew.kempczynski@intel.com>
 <94371ee6-82a9-40a8-b29b-9ef459f3ac6a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94371ee6-82a9-40a8-b29b-9ef459f3ac6a@intel.com>
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

On Fri, Mar 29, 2024 at 02:31:36PM +0100, Karolina Stolarek wrote:
> On 29.03.2024 10:16, Zbigniew Kempczyński wrote:
> > In tests which use compression we did very naive check in which we
> > compare source and destination surface. For linear we could expect
> > differences are related to compression, unfortunately for tiled data
> > this attitude is not appropriate due to natural data layout difference.
> > 
> > Lets add helpers to extract surface ccs data and check if such
> > surface is compressed. Function which extracts ccs data is defined
> > as public to dump such data to png in the future.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> > Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > ---
> >   lib/intel_blt.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++
> >   lib/intel_blt.h |  11 +++++
> >   2 files changed, 127 insertions(+)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index fe0a45cb8e..fa8e61732c 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -2094,6 +2094,122 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
> >   		 obj->x1, obj->y1, obj->x2, obj->y2);
> >   }
> > +/**
> > + * blt_surface_get_flatccs_data:
> > + * @fd: drm fd
> > + * @ctx: intel_ctx_t context
> > + * @e: blitter engine for @ctx
> > + * @ahnd: allocator handle
> > + * @obj: object from which flatccs data will be extracted
> > + *
> > + * Function executes ctrl-surf-copy to extract object ccs data from flatccs
> > + * area. Memory for the result ccs data are allocated in the function and must
> > + * be freed by the caller.
> > + */
> > +void blt_surface_get_flatccs_data(int fd,
> > +				  intel_ctx_t *ctx,
> > +				  const struct intel_execution_engine2 *e,
> > +				  uint64_t ahnd,
> > +				  const struct blt_copy_object *obj,
> > +				  uint32_t **ccsptr, uint64_t *sizeptr)
> > +{
> > +	struct blt_ctrl_surf_copy_data surf = {};
> > +	uint32_t bb, ccs, *ccsmap;
> > +	uint64_t bb_size, ccssize = obj->size / CCS_RATIO(fd);
> > +	uint32_t *ccscopy;
> > +	uint32_t sysmem;
> > +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> > +	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
> > +
> > +	igt_assert(ccsptr != NULL);
> > +	igt_assert(sizeptr != NULL);
> 
> I think we can drop these "!= NULL"

Ack.

> 
> > +
> > +	blt_ctrl_surf_copy_init(fd, &surf);
> > +
> > +	ccscopy = (uint32_t *)malloc(ccssize);
> > +	igt_assert(ccscopy);
> > +
> > +	if (surf.driver == INTEL_DRIVER_XE) {
> > +		uint16_t cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
> 
> sysmem is undefined here, I'd move the definition from below to here (i.e.,
> to the line before cpu_caching).

Eh, well spotted. I've added xe path first and most variables were
defined on the function beginning. When I've extended and added
i915 path I've missed that.

> 
> Apart from that, the patch looks good (+ one nit below). I haven't test it
> on my machine, but I trust you played with your changes to verify their
> correctness :)

I've tested it on xe/xe2 machines and I didn't notice any issues.

> 
> > +		uint64_t ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
> > +
> > +		if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && obj->compression) {
> > +			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
> > +			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> > +		}
> > +		sysmem = system_memory(fd);
> > +		ccs = xe_bo_create_caching(fd, 0, ccs_bo_size, sysmem, 0, cpu_caching);
> > +		bb_size = xe_bb_size(fd, SZ_4K);
> > +		bb = xe_bo_create(fd, 0, bb_size, sysmem, 0);
> > +	} else {
> > +		sysmem = REGION_SMEM;
> > +		ccs = gem_create(fd, ccssize);
> > +		bb_size = 4096;
> > +		igt_assert_eq(__gem_create(fd, &bb_size, &bb), 0);
> > +	}
> > +	blt_set_ctrl_surf_object(&surf.src, obj->handle, obj->region, obj->size,
> > +				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
> > +	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
> > +				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> > +	blt_set_batch(&surf.bb, bb, bb_size, sysmem);
> > +	blt_ctrl_surf_copy(fd, ctx, e, ahnd, &surf);
> > +
> > +	if (surf.driver == INTEL_DRIVER_XE) {
> > +		intel_ctx_xe_sync(ctx, true);
> > +		ccsmap = xe_bo_map(fd, ccs, surf.dst.size);
> > +	} else {
> > +		gem_sync(fd, surf.dst.handle);
> > +		ccsmap = gem_mmap__device_coherent(fd, ccs, 0, surf.dst.size,
> > +						   PROT_READ | PROT_WRITE);
> > +	}
> > +	memcpy(ccscopy, ccsmap, ccssize);
> 
> The promised nit -- how about adding a blank line after else to improve
> readability? That would probably also mean adding one for "surf.driver ==
> INTEL_DRIVER_XE" else to keep it consistent.

I guess you mean INTEL_DRIVER_I915. I didn't added it explicitly as
get_intel_driver asserts on different values.

According to blank line, sure, I'll add it.

--
Zbigniew

> 
> All the best,
> Karolina
> 
> > +	munmap(ccsmap, surf.dst.size);
> > +
> > +	gem_close(fd, ccs);
> > +	gem_close(fd, bb);
> > +	put_offset(ahnd, ccs);
> > +	put_offset(ahnd, bb);
> > +	if (surf.driver == INTEL_DRIVER_XE)
> > +		intel_allocator_bind(ahnd, 0, 0);
> > +
> > +	*ccsptr = ccscopy;
> > +	*sizeptr = ccssize;
> > +}
> > +
> > +/**
> > + * blt_surface_is_compressed:
> > + * @fd: drm fd
> > + * @ctx: intel_ctx_t context
> > + * @e: blitter engine for @ctx
> > + * @ahnd: allocator handle
> > + * @obj: object to check
> > + *
> > + * Function extracts object ccs data and check it contains any non-zero
> > + * value what means surface is compressed. Returns true if it is, otherwise
> > + * false.
> > + */
> > +bool blt_surface_is_compressed(int fd,
> > +			       intel_ctx_t *ctx,
> > +			       const struct intel_execution_engine2 *e,
> > +			       uint64_t ahnd,
> > +			       const struct blt_copy_object *obj)
> > +{
> > +	uint64_t size;
> > +	uint32_t *ptr;
> > +	bool is_compressed = false;
> > +
> > +	blt_surface_get_flatccs_data(fd, ctx, e, ahnd, obj, &ptr, &size);
> > +	for (int i = 0; i < size / sizeof(*ptr); i++) {
> > +		if (ptr[i] != 0) {
> > +			is_compressed = true;
> > +			break;
> > +		}
> > +	}
> > +	free(ptr);
> > +
> > +	return is_compressed;
> > +}
> > +
> >   /**
> >    * blt_surface_to_png:
> >    * @fd: drm fd
> > diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> > index 1f6c713596..d9c4d107f1 100644
> > --- a/lib/intel_blt.h
> > +++ b/lib/intel_blt.h
> > @@ -311,6 +311,17 @@ void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
> >   			      uint8_t mocs_index, uint8_t pat_index,
> >   			      enum blt_access_type access_type);
> > +void blt_surface_get_flatccs_data(int fd,
> > +				  intel_ctx_t *ctx,
> > +				  const struct intel_execution_engine2 *e,
> > +				  uint64_t ahnd,
> > +				  const struct blt_copy_object *obj,
> > +				  uint32_t **ccsptr, uint64_t *sizeptr);
> > +bool blt_surface_is_compressed(int fd,
> > +			       intel_ctx_t *ctx,
> > +			       const struct intel_execution_engine2 *e,
> > +			       uint64_t ahnd,
> > +			       const struct blt_copy_object *obj);
> >   void blt_surface_info(const char *info,
> >   		      const struct blt_copy_object *obj);
> >   void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
