Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0EDC3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 19:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF9010E0BD;
	Wed, 28 May 2025 19:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUNKnDaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207A10E69D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748460491; x=1779996491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4aOnqu28XKZ4JRVGUxyDXjkA6GI+Tu2Znr7DDuzYsVo=;
 b=CUNKnDaqr+kuwn4tl/wspO4UNHg2YLNBYx1i220Lxh0RlTHCg0sc4OM6
 5i37PZ1wOUnRcIiKW7k1h0ncwZ5zlvJo2mP6kT4ospl7Iub4mnj5LqwIG
 jivRelq8Iyatm6QxxbxDaNFmzpvDq037z1usjCYiqBUwoxjk7kVgjQ/L1
 d85Nyo13LMI9MtY8PHhOqU984TqCtuHNfZCtDpuoHvg2cPkdZ/bZAenVD
 PT4hl85J9rhcG9sHw+bMSP5MrbnsgacyXm/U9Y0ivAXC8XGEZd46IySlW
 oQTeZLC0z7pNIrtgpHbqThLVn8NdU6NgxZGsEzpJUe2jx3Db3kCJw92KM Q==;
X-CSE-ConnectionGUID: mT2aGTMnR5aQTHEeWcxXzA==
X-CSE-MsgGUID: 23P2Ncv0R7ag71WWP3PPHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50561112"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50561112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 12:28:10 -0700
X-CSE-ConnectionGUID: NMYMFsmuRiWRLMTsvU9ioA==
X-CSE-MsgGUID: Oj8HfPDyTOWEXgaqrOtB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148105551"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 12:28:08 -0700
Date: Wed, 28 May 2025 21:28:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 06/11] tests/xe_copy_basic: replace size to rect
 which keeps objects geometry
Message-ID: <lc2yc2h2wt4ng7b5qwtk6ov33rsrfpfuhe3hydmvyxgskw7c2r@s64ojlixtd52>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-7-zbigniew.kempczynski@intel.com>
 <aDYPMzy72-iLS9a6@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDYPMzy72-iLS9a6@fdugast-desk>
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

On Tue, May 27, 2025 at 09:15:14PM +0200, Francois Dugast wrote:
> On Fri, May 23, 2025 at 10:01:21AM +0200, Zbigniew Kempczyński wrote:
> > Testing byte/page + linear/matrix mem-copy requires passing different
> > pitch/width/height so replace simple size to geometry.
> > 
> > Change mem-copy and mem-set to use rect instead of size for
> > copying bytes.
> > 
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/intel/xe_copy_basic.c | 44 +++++++++++++++++++++++--------------
> >  1 file changed, 28 insertions(+), 16 deletions(-)
> > 
> > diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> > index f252d29fd4..569f250cc4 100644
> > --- a/tests/intel/xe_copy_basic.c
> > +++ b/tests/intel/xe_copy_basic.c
> > @@ -19,6 +19,13 @@
> >  
> >  #define MEM_FILL 0x8b
> >  
> > +struct rect {
> > +	uint32_t pitch;
> > +	uint32_t width;
> > +	uint32_t height;
> > +	enum blt_memop_mode mode;
> > +};
> > +
> >  /**
> >   * TEST: Test to validate copy commands on xe
> >   * Category: Core
> > @@ -42,7 +49,9 @@
> >   */
> >  static void
> >  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> > -	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
> > +	 enum blt_memop_type type, enum blt_memop_mode mode,
> > +	 uint32_t size, uint32_t pitch,
> > +	 uint32_t width, uint32_t height, uint32_t region)
> 
> What is the point of adding those arguments here if they are not used
> in mem_copy()? Should this be part of patch #8?

You're right. I need to fix patches division because these arguments
are not used here. I'm going to fix this in the next revision.

Thank you for spotting this in the review.

--
Zbigniew

> 
> >  {
> >  	struct blt_mem_copy_data mem = {};
> >  	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> > @@ -125,13 +134,15 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
> >  	munmap(mem.dst.ptr, size);
> >  }
> >  
> > -static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t region)
> > +static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t region)
> >  {
> >  	struct drm_xe_engine_class_instance inst = {
> >  		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> >  	};
> > -	uint32_t src_handle, dst_handle, vm, exec_queue, src_size, dst_size;
> > -	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
> > +	uint32_t src_handle, dst_handle, vm, exec_queue;
> > +	uint32_t pitch = rect->pitch ?: rect->width;
> > +	uint32_t blocksize = rect->mode == MODE_PAGE ? pitch << 8 : pitch;
> > +	uint32_t bo_size = ALIGN(blocksize * rect->height, xe_get_default_alignment(fd));
> >  	intel_ctx_t *ctx;
> >  
> >  	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> > @@ -140,13 +151,11 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
> >  	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
> >  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> >  
> > -	src_size = bo_size;
> > -	dst_size = bo_size;
> > -
> >  	if (cmd == MEM_COPY)
> > -		mem_copy(fd, src_handle, dst_handle, ctx, src_size, size, 1, region);
> > +		mem_copy(fd, src_handle, dst_handle, ctx, TYPE_LINEAR, rect->mode,
> > +			 bo_size, pitch, rect->width, rect->height, region);
> >  	else if (cmd == MEM_SET)
> > -		mem_set(fd, dst_handle, ctx, dst_size, size, 1, MEM_FILL, region);
> > +		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
> >  
> >  	gem_close(fd, src_handle);
> >  	gem_close(fd, dst_handle);
> > @@ -160,7 +169,10 @@ igt_main
> >  	int fd;
> >  	struct igt_collection *set, *regions;
> >  	uint32_t region;
> > -	uint64_t size[] = {0xFD, 0x369, 0x3FFF, 0xFFFE};
> > +	struct rect linear[] = { { 0, 0xfd, 1 },
> > +				 { 0, 0x369, 1 },
> > +				 { 0, 0x3fff, 1 },
> > +				 { 0, 0xfffe, 1 } };
> >  
> >  	igt_fixture {
> >  		fd = drm_open_driver(DRIVER_XE);
> > @@ -170,22 +182,22 @@ igt_main
> >  					       DRM_XE_MEM_REGION_CLASS_VRAM);
> >  	}
> >  
> > -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> > -		igt_subtest_f("mem-copy-linear-0x%"PRIx64"", size[i]) {
> > +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> > +		igt_subtest_f("mem-copy-linear-0x%x", linear[i].width) {
> >  			igt_require(blt_has_mem_copy(fd));
> >  			for_each_variation_r(regions, 1, set) {
> >  				region = igt_collection_get_value(regions, 0);
> > -				copy_test(fd, size[i], MEM_COPY, region);
> > +				copy_test(fd, &linear[i], MEM_COPY, region);
> >  			}
> >  		}
> >  	}
> >  
> > -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> > -		igt_subtest_f("mem-set-linear-0x%"PRIx64"", size[i]) {
> > +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> > +		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
> >  			igt_require(blt_has_mem_set(fd));
> >  			for_each_variation_r(regions, 1, set) {
> >  				region = igt_collection_get_value(regions, 0);
> > -				copy_test(fd, size[i], MEM_SET, region);
> > +				copy_test(fd, &linear[i], MEM_SET, region);
> >  			}
> >  		}
> >  	}
> > -- 
> > 2.43.0
> > 
