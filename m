Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72E4C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 13:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F40A10E2A0;
	Tue, 13 Aug 2024 13:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxselEqL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C171810E2A0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723557418; x=1755093418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AB3dKqN0DaFYrCOwkXcdy+QOTACWbGW1IntkXz/uUuQ=;
 b=hxselEqL4fRQHpn7cr3uBrmXwEJH5Nnlql7vcID6BwkmFYi7mkDkTlwy
 5F6oWVoAh4HqhFI2IiCY6Iw35Rwm+gq/pS0H0ghsPBqXs/6Gl2QzapK0d
 Vl+xag3P9UZkioBC1iAXVRjK2Y2V5ZkXJqs6by2yNXeCmqrjYoIdEn0+N
 tUCzKfb9yJcNnPec/VDO2QVL0h6Ttj3eJl5m405Sgyfr57Ri8I/TSMkSM
 /LOq45HSKvdprB/FsjkjvvqkmoTuKLmQB+p2JNSfkvOpWflXGMyF6rzNb
 8hDMWk9eu6RYKtj8QyT004YP+K24ahiETnlmZTywv/FHDx0vJumT6MJJ0 g==;
X-CSE-ConnectionGUID: E8SzA3A1TDqeEB/Aa7qhoA==
X-CSE-MsgGUID: ZWgqZWRRQNiJByrOYAcQpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33103372"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="33103372"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:56:57 -0700
X-CSE-ConnectionGUID: lhiANC7NSZauuZuo6Yl7Qg==
X-CSE-MsgGUID: JjuGx/z5T3+XU720DRbM6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="63351615"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.213])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:56:56 -0700
Date: Tue, 13 Aug 2024 15:56:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib|tests: Don't dereference engine outside
 for_each_ctx_engine macro
Message-ID: <20240813135652.2jhw2edamqjpvk3d@zkempczy-mobl2>
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
 <e4d675ba-944b-4aa2-9803-edadb2b2f403@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4d675ba-944b-4aa2-9803-edadb2b2f403@linux.intel.com>
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

On Tue, Aug 13, 2024 at 03:36:50PM +0200, Peter Senna Tschudin wrote:
> Please do not apply this patch. I am working on a proper fix.

Applying fix stops you from working on a your fix?

--
Zbigniew

> 
> On 13.08.2024 14:45, Zbigniew Kempczyński wrote:
> > Engine used inside for_each_ctx_engine() macro is valid only inside its
> > block as it is accessing local stack memory. Using outside the block works
> > by an accident if luckily nothing will overwrite this stack before use.
> > Fix found risky usages by using engine only inside the block or do its
> > copy.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> >  lib/igt_fb.c                    |  8 ++++----
> >  tests/intel/gem_lmem_swapping.c | 14 ++++++++++----
> >  2 files changed, 14 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index ab162a5b74..addff2cfba 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -3050,13 +3050,13 @@ static void blitcopy(const struct igt_fb *dst_fb,
> >  						   dst_fb->size);
> >  		} else if (ahnd && block_copy_ok(src_fb) && block_copy_ok(dst_fb)) {
> >  			for_each_ctx_engine(src_fb->fd, ictx, e) {
> > -				if (gem_engine_can_block_copy(src_fb->fd, e))
> > +				if (gem_engine_can_block_copy(src_fb->fd, e)) {
> > +					do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
> > +						      bb, bb_size, ictx, e);
> >  					break;
> > +				}
> >  			}
> >  			igt_assert_f(e, "No block copy capable engine found!\n");
> > -
> > -			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
> > -				      bb, bb_size, ictx, e);
> >  		} else {
> >  			igt_blitter_src_copy(dst_fb->fd,
> >  					     ahnd, ctx, NULL,
> > diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> > index b8f24742b8..b125261519 100644
> > --- a/tests/intel/gem_lmem_swapping.c
> > +++ b/tests/intel/gem_lmem_swapping.c
> > @@ -189,6 +189,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
> >  {
> >  	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
> >  	const struct intel_execution_engine2 *e;
> > +	struct intel_execution_engine2 ec;
> >  	struct blt_copy_data blt = {};
> >  	struct blt_copy_batch *cmd;
> >  	uint64_t size = 4096;
> > @@ -196,8 +197,10 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
> >  
> >  	obj->seed = seed;
> >  	for_each_ctx_engine(i915, ctx, e) {
> > -		if (gem_engine_can_block_copy(i915, e))
> > +		if (gem_engine_can_block_copy(i915, e)) {
> > +			ec = *e;
> >  			break;
> > +		}
> >  	}
> >  	igt_assert_f(e, "Ctx don't have blt engine\n");
> >  
> > @@ -224,7 +227,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
> >  	blt_set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
> >  			   SURFACE_TYPE_2D);
> >  
> > -	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
> > +	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
> >  	free(cmd);
> >  }
> >  
> > @@ -255,14 +258,17 @@ verify_object_ccs(int i915, const struct object *obj,
> >  {
> >  	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
> >  	const struct intel_execution_engine2 *e;
> > +	struct intel_execution_engine2 ec;
> >  	struct blt_copy_data blt = {};
> >  	struct blt_copy_batch *cmd;
> >  	uint64_t size = 4096;
> >  	unsigned long j, val, *buf;
> >  
> >  	for_each_ctx_engine(i915, ctx, e) {
> > -		if (gem_engine_can_block_copy(i915, e))
> > +		if (gem_engine_can_block_copy(i915, e)) {
> > +			ec = *e;
> >  			break;
> > +		}
> >  	}
> >  	igt_assert_f(e, "Ctx don't have blt engine\n");
> >  
> > @@ -284,7 +290,7 @@ verify_object_ccs(int i915, const struct object *obj,
> >  	blt_set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
> >  			   SURFACE_TYPE_2D);
> >  	blt_set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
> > -	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
> > +	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
> >  
> >  	buf = gem_mmap__device_coherent(i915, tmp->handle, 0,
> >  					obj->size, PROT_READ);
