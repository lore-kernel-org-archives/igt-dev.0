Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4EAC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 07:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046310E051;
	Wed, 14 Aug 2024 07:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2Iz5DXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3DB10E41A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723619445; x=1755155445;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0I4iBmQd/TNJ9YRLJIC8lAU0h18korNiz1YMDewyWEQ=;
 b=R2Iz5DXMNHadxgrlbmI2RVavr8/tlb+wC/s9HWoJvUMmiNG9zlpShZS2
 YRVD+8Gu+astChUBoG24cSIsV+mxIxlLdt3wxfGDKDbsp0Wv8PavJfAjQ
 ZoUW1NkzDBWmzTKQmWsV/IK/7c8pRcrLaAbNF3Y48b8X3fiBIMF13WSfi
 0OlCtmljZn/srdh1AvGcO4pW3TJAlWV7bqkx9rrxM58MVpacSW+e4yBbN
 FTvQS9ThscgezfyK3F42GurWMHpBnjCjKbBACgFNZh1wumreRDRqHJRlu
 p58Qvf64l+PrK0RyIX2fo2KxWZ1Cterwv+tXueMqYwhWpmIDmJ+8rgToU w==;
X-CSE-ConnectionGUID: ijdAPOQmToaq4SYBsamJCg==
X-CSE-MsgGUID: G5JlBefZTPiMozjzuiuO8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32442181"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="32442181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 00:10:45 -0700
X-CSE-ConnectionGUID: HU9wGNPXRRquH+kDQh1vMg==
X-CSE-MsgGUID: YeozAZwPTweh2IR1sTO+Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58557688"
Received: from sbeckman-mobl.ger.corp.intel.com (HELO [10.251.219.110])
 ([10.251.219.110])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 00:10:43 -0700
Message-ID: <a1e22517-77be-4c9d-8115-bc7ce201867e@linux.intel.com>
Date: Wed, 14 Aug 2024 09:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib|tests: Don't dereference engine outside
 for_each_ctx_engine macro
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Please ignore my previous emails on this topic. I underestimated the effort and the potential consequences of the changes I want to make. I have reviewed the code and compile tested it.

On 13.08.2024 14:45, Zbigniew Kempczyński wrote:
> Engine used inside for_each_ctx_engine() macro is valid only inside its
> block as it is accessing local stack memory. Using outside the block works
> by an accident if luckily nothing will overwrite this stack before use.
> Fix found risky usages by using engine only inside the block or do its
> copy.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  lib/igt_fb.c                    |  8 ++++----
>  tests/intel/gem_lmem_swapping.c | 14 ++++++++++----
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ab162a5b74..addff2cfba 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3050,13 +3050,13 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  						   dst_fb->size);
>  		} else if (ahnd && block_copy_ok(src_fb) && block_copy_ok(dst_fb)) {
>  			for_each_ctx_engine(src_fb->fd, ictx, e) {
> -				if (gem_engine_can_block_copy(src_fb->fd, e))
> +				if (gem_engine_can_block_copy(src_fb->fd, e)) {
> +					do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
> +						      bb, bb_size, ictx, e);
>  					break;
> +				}
>  			}
>  			igt_assert_f(e, "No block copy capable engine found!\n");
> -
> -			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
> -				      bb, bb_size, ictx, e);
>  		} else {
>  			igt_blitter_src_copy(dst_fb->fd,
>  					     ahnd, ctx, NULL,
> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> index b8f24742b8..b125261519 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -189,6 +189,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>  {
>  	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
>  	const struct intel_execution_engine2 *e;
> +	struct intel_execution_engine2 ec;
>  	struct blt_copy_data blt = {};
>  	struct blt_copy_batch *cmd;
>  	uint64_t size = 4096;
> @@ -196,8 +197,10 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>  
>  	obj->seed = seed;
>  	for_each_ctx_engine(i915, ctx, e) {
> -		if (gem_engine_can_block_copy(i915, e))
> +		if (gem_engine_can_block_copy(i915, e)) {
> +			ec = *e;
>  			break;
> +		}
>  	}
>  	igt_assert_f(e, "Ctx don't have blt engine\n");
>  
> @@ -224,7 +227,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>  	blt_set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
>  			   SURFACE_TYPE_2D);
>  
> -	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
> +	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
>  	free(cmd);
>  }
>  
> @@ -255,14 +258,17 @@ verify_object_ccs(int i915, const struct object *obj,
>  {
>  	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
>  	const struct intel_execution_engine2 *e;
> +	struct intel_execution_engine2 ec;
>  	struct blt_copy_data blt = {};
>  	struct blt_copy_batch *cmd;
>  	uint64_t size = 4096;
>  	unsigned long j, val, *buf;
>  
>  	for_each_ctx_engine(i915, ctx, e) {
> -		if (gem_engine_can_block_copy(i915, e))
> +		if (gem_engine_can_block_copy(i915, e)) {
> +			ec = *e;
>  			break;
> +		}
>  	}
>  	igt_assert_f(e, "Ctx don't have blt engine\n");
>  
> @@ -284,7 +290,7 @@ verify_object_ccs(int i915, const struct object *obj,
>  	blt_set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
>  			   SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
> -	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
> +	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
>  
>  	buf = gem_mmap__device_coherent(i915, tmp->handle, 0,
>  					obj->size, PROT_READ);
