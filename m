Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504DC10E552
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 05:17:03 +0000 (UTC)
Date: Thu, 20 Jul 2023 07:16:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20230720051659.tdw7nkfjhgviz3hk@zkempczy-mobl2>
References: <20230718121443.445343-1-kunal1.joshi@intel.com>
 <20230718121443.445343-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230718121443.445343-2-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: add intel_blt for
 blitter path on xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 05:44:42PM +0530, Kunal Joshi wrote:
> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> Add intel_btl functions for xe driver on blitter path in igt_fb.c.
> This enables tiled framebuffers on xe driver.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 1814e8db1..6ce4b735a 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2763,8 +2763,12 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  
>  	blt->plane_offset = fb->offsets[plane];
>  
> -	blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
> -					     PROT_READ | PROT_WRITE);
> +	if (is_xe_device(fb->fd))
> +		blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
> +					  PROT_READ | PROT_WRITE);
> +	else
> +		blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
> +						     PROT_READ | PROT_WRITE);
>  	return blt;
>  }
>  
> @@ -2838,16 +2842,20 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  	uint64_t ahnd = 0;
>  	const intel_ctx_t *ictx = NULL;
>  	struct intel_execution_engine2 *e;
> -	uint32_t bb;
> +	uint32_t bb, xe_bb;
>  	uint64_t bb_size = 4096;
>  	struct blt_copy_data blt = {};
>  	struct blt_copy_object *src, *dst;
>  	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
> -	uint32_t mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
> -			   ? REGION_LMEM(0) : REGION_SMEM;
> +	uint32_t mem_region;
>  	/* To ignore CC plane */
>  	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
>  	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
> +	intel_ctx_t *xe_ctx;
> +	uint32_t vm, engine;
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
>  
>  	igt_assert_eq(dst_fb->fd, src_fb->fd);
>  	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
> @@ -2857,6 +2865,9 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  
>  	if (is_i915_device(dst_fb->fd) && !gem_has_relocations(dst_fb->fd)) {
>  		igt_require(gem_has_contexts(dst_fb->fd));
> +		mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
> +			? REGION_LMEM(0) : REGION_SMEM;
> +
>  		ictx = intel_ctx_create_all_physical(src_fb->fd);
>  		ctx = gem_context_create(dst_fb->fd);
>  		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
> @@ -2865,6 +2876,19 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  							  &bb,
>  							  &bb_size,
>  							  mem_region) == 0);
> +	} else if(is_xe_device(dst_fb->fd)) {

Minor nit:       ^ missing space after if

BTW I see there're multiple times calling is_xe_device(), maybe it's worth
to add:

bool is_xe = is_xe_device(fd);
bool is_i915 = is_i915_device(fd);

on the very beginning to avoid calling same function?

Anyway, that's not so heavy so decision is yours.

> +		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +		engine = xe_engine_create(dst_fb->fd, vm, &inst, 0);
> +		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, engine, 0, 0, 0);
> +		mem_region = vram_if_possible(dst_fb->fd, 0);
> +
> +		ahnd = intel_allocator_open_full(dst_fb->fd, xe_ctx->vm, 0, 0,
> +						 INTEL_ALLOCATOR_SIMPLE,
> +						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +
> +		bb_size = ALIGN(bb_size + xe_cs_prefetch_size(dst_fb->fd),
> +				xe_get_default_alignment(dst_fb->fd));
> +		xe_bb = xe_bo_create_flags(dst_fb->fd, 0, bb_size, mem_region);
>  	}
>  
>  	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
> @@ -2872,7 +2896,34 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
>  		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
>  
> -		if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
> +		if (is_xe_device(dst_fb->fd)) {
> +			src = blt_fb_init(src_fb, i, mem_region);
> +			dst = blt_fb_init(dst_fb, i, mem_region);
> +
> +			blt_copy_init(src_fb->fd, &blt);
> +			blt.color_depth = blt_get_bpp(src_fb);
> +			blt_set_copy_object(&blt.src, src);
> +			blt_set_copy_object(&blt.dst, dst);
> +
> +			blt_set_object_ext(&ext.src,
> +					   blt_compression_format(&blt, src_fb),
> +					   src_fb->width, src_fb->height,
> +					   SURFACE_TYPE_2D);
> +
> +			blt_set_object_ext(&ext.dst,
> +					   blt_compression_format(&blt, dst_fb),
> +					   dst_fb->width, dst_fb->height,
> +					   SURFACE_TYPE_2D);
> +
> +			pext = &ext;
> +
> +			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
> +
> +			blt_block_copy(src_fb->fd, xe_ctx, NULL, ahnd, &blt, pext);
> +
> +			blt_destroy_object(src_fb->fd, src);
> +			blt_destroy_object(dst_fb->fd, dst);
> +		} else  if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {

Next nit               ^ --- double space

>  			igt_blitter_fast_copy__raw(dst_fb->fd,
>  						   ahnd, ctx, NULL,
>  						   src_fb->gem_handle,
> @@ -2950,6 +3001,14 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  	if (ctx)
>  		gem_context_destroy(dst_fb->fd, ctx);
>  	put_ahnd(ahnd);
> +
> +	if(is_xe_device(dst_fb->fd)) {

And same here, missing space after if.

Rest code looks good for me. Fix nits and got:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +		gem_close(dst_fb->fd, xe_bb);
> +		xe_engine_destroy(dst_fb->fd, engine);
> +		xe_vm_destroy(dst_fb->fd, vm);
> +		free(xe_ctx);
> +	}
> +
>  	intel_ctx_destroy(src_fb->fd, ictx);
>  }
>  
> -- 
> 2.25.1
> 
