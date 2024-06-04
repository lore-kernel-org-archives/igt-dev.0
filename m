Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F99FC25B7E
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 07:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F1D10E3A0;
	Tue,  4 Jun 2024 07:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXENbusd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3603810E3A0
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717487011; x=1749023011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uZMBvL6WexVAoa6sjsBR++7xEQDZgDWFby6h/fakQ8w=;
 b=eXENbusdfWdU0kqAgEJOdQRcVf6sb4AXeMLA4HCJNwSFpIl4H2igo/Ky
 ktW3s2piGLRoesM9wM9sWrJpRLSD+n8oQvM4fnmAl+NTPhN5R3P3Aarim
 2UgvTDCauC74XxKQmF+dALNJK4RZy/pwy4FIfcaidFDpfhy+pUU6sIvqT
 FmSQe15eqzDROXb7aShRt+yaZ8ORKaPrB6GkbxoZ1/DkN1ycvq8yn5nfC
 NVEePaxI667lFS2iIGLXU4hswPk7txsIUyHU6Z2wttExn2hWEzIq3zxjY
 yuVfWtwuqw205RvS+X3HjyL6Y97yTzr0i/cd0iCigmCzZ1hB6VkHesDRB w==;
X-CSE-ConnectionGUID: 9HuQQ5iASfSgKHWC4g/k9Q==
X-CSE-MsgGUID: 4WvBDvIFR6uOC4kQyAs7OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24590632"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24590632"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:43:30 -0700
X-CSE-ConnectionGUID: gl5GC6ktTfCX1A24KrEoFA==
X-CSE-MsgGUID: Z4mJFECHSJyzcIYbioT9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="42083790"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:43:30 -0700
Date: Tue, 4 Jun 2024 09:43:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 3/5] lib/igt_fb: separate intel blitter context
 setup from blitter function
Message-ID: <20240604074326.bzyuhxvbbepbfmbx@zkempczy-mobl2>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
 <20240530142346.1511811-4-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530142346.1511811-4-juhapekka.heikkila@gmail.com>
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

On Thu, May 30, 2024 at 05:23:44PM +0300, Juha-Pekka Heikkila wrote:
> separate context and memory region setup to setup_context_and_memory_region()

s/separate/Separate/

With that nit fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> helper to reduce blitcopy() overall size.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 73 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 42 insertions(+), 31 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 588144579..e225b9090 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2900,6 +2900,45 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
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
> +		igt_require(gem_has_contexts(fb->fd));
> +		*ictx = intel_ctx_create_all_physical(fb->fd);
> +		*mem_region = HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ?
> +			REGION_LMEM(0) : REGION_SMEM;
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
> @@ -2920,11 +2959,6 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
> @@ -2932,32 +2966,9 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
> 2.43.2
> 
