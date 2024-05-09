Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85916C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 10:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1542510E184;
	Thu,  9 May 2024 10:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fk1yecyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29E810E184
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715250491; x=1746786491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TkWaxii6FW4mIKeAovCztjkNw4z/F3lVI68WZX8+6A8=;
 b=fk1yecyjFfl44oW4jqj2vtUBzH7jNkFrXe9lt0QQLJvQu/2IBnYRVujp
 /JQXGWH8s8SHuOH0l9wuFdDcxSJYAWkaI4eZFiKosQ1jVfLwOFvm3WL+S
 SWVY5yYpBwUKDhbBEJydbehXhLjLNm6UtUW7N5rquJfILgBt+KcQveVse
 ZPnv0Mzrljfh9aTS8l0why6jd59x5IMvIxPTff9r/y3eAmqrDMlVs6Avz
 Nu5TM7Apr29oNdHGjHD9c6YVzecz7S1jjpdwnYsY5G2O+DMzdloiF5TDL
 Ef8dKZdK0XksYi8/8tBQ0CjzVGKNz1Ty/OwfnPIgnW1v1/oX/ny3IusMn g==;
X-CSE-ConnectionGUID: xEw5CUg/RmaOtPswCBAu3Q==
X-CSE-MsgGUID: 6TPt6MTGTd6sGud34eTnEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33672732"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="33672732"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:28:11 -0700
X-CSE-ConnectionGUID: VQO3PVM+QxmkEuvpxx27fw==
X-CSE-MsgGUID: rwIKw67cTzWWHsQ4qTtpqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="66639529"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:28:08 -0700
Date: Thu, 9 May 2024 12:28:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 4/6] lib/igt_fb: separate intel blitter context
 setup from blitter function
Message-ID: <20240509102806.ycknq6q7zzglm2ne@zkempczy-mobl2>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-5-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430162939.272990-5-juhapekka.heikkila@gmail.com>
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

On Tue, Apr 30, 2024 at 07:29:37PM +0300, Juha-Pekka Heikkila wrote:
> separate context and memory region setup to setup_context_and_memory_region()
> helper to reduce blitcopy() overall size.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 72 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index b4afcaacb..1730f6394 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2900,6 +2900,44 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
>  	igt_assert_f(0, "unknown compression\n");
>  }
>  
> +static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *ctx,
> +					    uint64_t *ahnd, uint32_t *mem_region,
> +					    uint32_t *vm, uint32_t *bb,
> +					    uint64_t *bb_size,
> +					    const intel_ctx_t **ictx,
> +					    uint32_t *exec_queue,
> +					    intel_ctx_t **xe_ctx)
> +{
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +
> +	if (is_i915_device(fb->fd) && !gem_has_relocations(fb->fd)) {
> +		*ictx = intel_ctx_create_all_physical(fb->fd);
> +		igt_require(gem_has_contexts(fb->fd));

This reverse order of creating and checking ctx is likely a mistake,
isn't it?

> +		*mem_region = HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;

Long line, may you split it to two lines?

--
Zbigniew

> +		*ctx = gem_context_create(fb->fd);
> +		*ahnd = get_reloc_ahnd(fb->fd, *ctx);
> +
> +		igt_assert(__gem_create_in_memory_regions(fb->fd,
> +							  bb,
> +							  bb_size,
> +							  *mem_region) == 0);
> +	} else if (is_xe_device(fb->fd)) {
> +		*vm = xe_vm_create(fb->fd, 0, 0);
> +		*exec_queue = xe_exec_queue_create(fb->fd, *vm, &inst, 0);
> +		*xe_ctx = intel_ctx_xe(fb->fd, *vm, *exec_queue, 0, 0, 0);
> +		*mem_region = vram_if_possible(fb->fd, 0);
> +
> +		*ahnd = intel_allocator_open_full(fb->fd, (*xe_ctx)->vm, 0, 0,
> +						 INTEL_ALLOCATOR_SIMPLE,
> +						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +
> +		*bb_size = xe_bb_size(fb->fd, *bb_size);
> +		*bb = xe_bo_create(fb->fd, 0, *bb_size, *mem_region, 0);
> +	}
> +}
> +
>  static void blitcopy(const struct igt_fb *dst_fb,
>  		     const struct igt_fb *src_fb)
>  {
> @@ -2920,11 +2958,6 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  	intel_ctx_t *xe_ctx;
>  	uint32_t vm, exec_queue;
>  	bool is_xe = is_xe_device(dst_fb->fd);
> -	bool is_i915 = is_i915_device(dst_fb->fd);
> -
> -	struct drm_xe_engine_class_instance inst = {
> -		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> -	};
>  
>  	igt_assert_eq(dst_fb->fd, src_fb->fd);
>  	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
> @@ -2932,32 +2965,9 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
>  	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
>  
> -	if (is_i915 && !gem_has_relocations(dst_fb->fd)) {
> -		igt_require(gem_has_contexts(dst_fb->fd));
> -		mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
> -			? REGION_LMEM(0) : REGION_SMEM;
> -
> -		ictx = intel_ctx_create_all_physical(src_fb->fd);
> -		ctx = gem_context_create(dst_fb->fd);
> -		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
> -
> -		igt_assert(__gem_create_in_memory_regions(src_fb->fd,
> -							  &bb,
> -							  &bb_size,
> -							  mem_region) == 0);
> -	} else if (is_xe) {
> -		vm = xe_vm_create(dst_fb->fd, 0, 0);
> -		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
> -		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
> -		mem_region = vram_if_possible(dst_fb->fd, 0);
> -
> -		ahnd = intel_allocator_open_full(dst_fb->fd, xe_ctx->vm, 0, 0,
> -						 INTEL_ALLOCATOR_SIMPLE,
> -						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> -
> -		bb_size = xe_bb_size(dst_fb->fd, bb_size);
> -		xe_bb = xe_bo_create(dst_fb->fd, 0, bb_size, mem_region, 0);
> -	}
> +	setup_context_and_memory_region(dst_fb, &ctx, &ahnd, &mem_region,
> +					&vm, &xe_bb, &bb_size, &ictx,
> +					&exec_queue, &xe_ctx);
>  
>  	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
>  		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
> -- 
> 2.25.1
> 
