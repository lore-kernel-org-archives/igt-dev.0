Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D9FC54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68D810E9F1;
	Thu, 22 May 2025 14:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="af+Rek8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644D810E9F1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747923366; x=1779459366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Yxs1AtjKFR8Wd1J6ZxumkhrAgHngr+Xh0uKffYlwHRg=;
 b=af+Rek8Qa8dqf7+oC/IAzBlImUe8/LCCEtF+Tu2nf0SNFe5zM2HWzSub
 /zPU2hUSkgYrEIACSfJBXu+i39BO877ltX7RrHy6ECQAiNIDNSyYPZ1sp
 tl0g0lt2/fNi0eFT7rKnawkJsIrKVkz9dg3/Tks69FJpy4UOKOuZKfT5f
 dDVxnp+iDJNbs/fo3kXI50a25pKnKTvywfuJ25nA1AgZrnqB7uKWDl8gJ
 L7/smUdl7P3vj63SjmJ4WsPj4nWTTro0KQfSzPTQWBe2JSXPOhNY6cDcf
 itL6Vy4baK0k5Re/9hhM9lgpkrbqctpplm9a/XnbI5pjz217HC5z0ysw9 A==;
X-CSE-ConnectionGUID: g3klRpRhSHyjLyT46LQJdg==
X-CSE-MsgGUID: ltiTiSliQ9GnExBJnKgsEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60592799"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="60592799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:16:04 -0700
X-CSE-ConnectionGUID: ngArgHg2RJGfxpg0i2MniA==
X-CSE-MsgGUID: QIEnRbDCTtG2WAlWebfCjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141165339"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:16:02 -0700
Date: Thu, 22 May 2025 16:15:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/15] tests/xe_copy_basic: replace size to rect
 which keeps objects geometry
Message-ID: <qwamenqmoy36xhxlr4q6vxhhhk5bkv677rs2gl3xfzuydsfkpd@4kibj7f466cs>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-11-zbigniew.kempczynski@intel.com>
 <aC8THxeHA6Zurcxe@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aC8THxeHA6Zurcxe@fdugast-desk>
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

On Thu, May 22, 2025 at 02:05:51PM +0200, Francois Dugast wrote:
> On Tue, May 13, 2025 at 08:58:05PM +0200, Zbigniew Kempczyński wrote:
> > Testing byte/page + linear/matrix mem-copy requires passing different
> > pitch/width/height so replace simple size to geometry.
> > 
> > Change mem-copy and mem-set to use rect instead of size for
> > copying bytes.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_copy_basic.c | 44 +++++++++++++++++++++++--------------
> >  1 file changed, 28 insertions(+), 16 deletions(-)
> > 
> > diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> > index f252d29fd4..7bec248b06 100644
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
> > +	uint32_t blocksize = rect->mode ? pitch << 8 : pitch;
> 
> Is this assuming enum values for MODE_BYTE and MODE_PAGE? Better use
> explicit comparison with: rect->mode == MODE_PAGE ?

Agree. Explicit comparison shows my intention.
> 
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
> > +				 { 0, 0x369, 0x1 },
> 
> Any reason for using 0x1 here, unlike for others? What about the mode?

I missed 0x1, it should be 1 to be consistent.

Regarding mode - before I've splitted series I had one single patch
where I changed everything (imagine squash of the series you're
reviewing). On the beginning I didn't exactly knew what I will change
so when everything was already written division to patches required
rework to introduce changes partially. That's why MODE_PAGE may
exists a little bit earlier than it was used. I tried to keep progression
here as much as possible so maybe I'm not consistent about this.

--
Zbigniew

> 
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
