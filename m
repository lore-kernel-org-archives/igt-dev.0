Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138FAC52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 13:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B035610E356;
	Tue, 13 Aug 2024 13:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c36+66Pe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE7510E35B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723556216; x=1755092216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DoUXmN2cganv4/f/2Li/fsqoSml4BZKpjkBo1dmZwEo=;
 b=c36+66PeuvbCDdfg+GqJm6YVh/VTOeziH/Ja3bl0HcEwzU7TRgZfACGc
 jTHT5YZF7Xzyv//s4kyh9fWIlrr8XyukO4bG6TQayTP2clgGYTW3v1JoN
 PpsRn4m45kV7IEK8V6xE3nodARyqNZF+fA6pIHGisuIIlRe0hT6+bJEst
 o3JQGz0gc7XDC++t114s+5br3T6NOQOeV6y6QEPUZXolkBzNH+nKPo/7b
 YH8jFrbJCMhWpfpg/QmgA11wEoefqUjyyDbxcm21BD4487dRTIg6MQbLY
 W1ZjPbDpYvLqgwSsrMf1tyGKtW/LXftbnGTy0hmkmKFboDMb2sxPmCmXt Q==;
X-CSE-ConnectionGUID: 0IcRNKPjQLGzEDOTN0BUcA==
X-CSE-MsgGUID: kbMHnxppS7ONRrKL9pe4+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33124083"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="33124083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:36:56 -0700
X-CSE-ConnectionGUID: K/3HoiO3R6ClEgN7yFtTTg==
X-CSE-MsgGUID: Z2XNYJ/PS76IQjiSJJN7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58755029"
Received: from ljcornel-mobl.ger.corp.intel.com (HELO [10.251.219.78])
 ([10.251.219.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:36:55 -0700
Message-ID: <e4d675ba-944b-4aa2-9803-edadb2b2f403@linux.intel.com>
Date: Tue, 13 Aug 2024 15:36:50 +0200
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

Please do not apply this patch. I am working on a proper fix.

On 13.08.2024 14:45, Zbigniew Kempczyński wrote:
> Engine used inside for_each_ctx_engine() macro is valid only inside its
> block as it is accessing local stack memory. Using outside the block works
> by an accident if luckily nothing will overwrite this stack before use.
> Fix found risky usages by using engine only inside the block or do its
> copy.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
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
