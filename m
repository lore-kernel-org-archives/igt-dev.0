Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F7910E489
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 11:26:35 +0000 (UTC)
Date: Wed, 2 Nov 2022 12:26:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Message-ID: <Y2JT53HyJy02IvsL@zkempczy-mobl2>
References: <cover.1667378725.git.karolina.drobnik@intel.com>
 <079dfe2db217641b98b740d8f64a2c1cb5b88b33.1667378726.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <079dfe2db217641b98b740d8f64a2c1cb5b88b33.1667378726.git.karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] lib/intel_batchbuffer: Extend
 __intel_bb_create to handle context config
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

On Wed, Nov 02, 2022 at 10:10:57AM +0100, Karolina Drobnik wrote:
> Currently, intel_bb stores context id with no information about the context
> itself. This means that intel batchbuffer can only execute on a fixed set
> of engines with pre-defined indices (so called legacy mode). To accommodate
> contexts with custom engine layouts, save the context configuration in
> intel_bb struct.
> 
> Update function calls to reflect that change.
> 
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_draw.c                  |  2 +-
>  lib/intel_batchbuffer.c         | 52 ++++++++++++++++++++++++---------
>  lib/intel_batchbuffer.h         | 15 ++++++----
>  lib/media_fill.c                |  2 +-
>  tests/i915/api_intel_bb.c       | 12 ++++----
>  tests/i915/gem_ppgtt.c          |  2 +-
>  tests/i915/gem_pxp.c            | 16 +++++-----
>  tests/i915/kms_fence_pin_leak.c |  2 +-
>  tests/i915/perf.c               | 18 ++++++------
>  9 files changed, 75 insertions(+), 46 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 1124cadc..975d65cd 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -780,7 +780,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>  
>  	src = create_buf(fd, cmd_data->bops, &tmp, I915_TILING_NONE);
>  	dst = create_buf(fd, cmd_data->bops, buf, tiling);
> -	ibb = intel_bb_create_with_context(fd, cmd_data->ctx, PAGE_SIZE);
> +	ibb = intel_bb_create_with_context(fd, cmd_data->ctx, NULL, PAGE_SIZE);
>  
>  	rendercopy(ibb, src, 0, 0, rect->w, rect->h, dst, rect->x, rect->y);
>  
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index bb2503bb..6c120b5a 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1304,7 +1304,8 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>  /**
>   * __intel_bb_create:
>   * @i915: drm fd
> - * @ctx: context
> + * @ctx: context id
> + * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>   * @size: size of the batchbuffer
>   * @do_relocs: use relocations or allocator
>   * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
> @@ -1338,12 +1339,17 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>   *
>   * If we do reset with purging caches allocator entries are freed as well.
>   *
> + * __intel_bb_create checks if a context configuration for intel_ctx_t was
> + * passed in. If this is the case, it copies the information over to the
> + * newly created batch buffer.
> + *
>   * Returns:
>   *
>   * Pointer the intel_bb, asserts on failure.
>   */
>  static struct intel_bb *
> -__intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
> +__intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
> +		  uint32_t size, bool do_relocs,
>  		  uint64_t start, uint64_t end,
>  		  uint8_t allocator_type, enum allocator_strategy strategy)
>  {
> @@ -1399,6 +1405,13 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
>  	ibb->ptr = ibb->batch;
>  	ibb->fence = -1;
>  
> +	/* Cache context configuration */
> +	if (cfg) {
> +		ibb->cfg = malloc(sizeof(*cfg));
> +		igt_assert(ibb->cfg);
> +		memcpy(ibb->cfg, cfg, sizeof(*cfg));
> +	}
> +
>  	ibb->gtt_size = gem_aperture_size(i915);
>  	if ((ibb->gtt_size - 1) >> 32)
>  		ibb->supports_48b_address = true;
> @@ -1425,6 +1438,7 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
>   * intel_bb_create_full:
>   * @i915: drm fd
>   * @ctx: context
> + * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>   * @size: size of the batchbuffer
>   * @start: allocator vm start address
>   * @end: allocator vm start address
> @@ -1441,12 +1455,13 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
>   *
>   * Pointer the intel_bb, asserts on failure.
>   */
> -struct intel_bb *intel_bb_create_full(int i915, uint32_t ctx, uint32_t size,
> +struct intel_bb *intel_bb_create_full(int i915, uint32_t ctx,
> +				      const intel_ctx_cfg_t *cfg, uint32_t size,
>  				      uint64_t start, uint64_t end,
>  				      uint8_t allocator_type,
>  				      enum allocator_strategy strategy)
>  {
> -	return __intel_bb_create(i915, ctx, size, false, start, end,
> +	return __intel_bb_create(i915, ctx, cfg, size, false, start, end,
>  				 allocator_type, strategy);
>  }
>  
> @@ -1454,6 +1469,7 @@ struct intel_bb *intel_bb_create_full(int i915, uint32_t ctx, uint32_t size,
>   * intel_bb_create_with_allocator:
>   * @i915: drm fd
>   * @ctx: context
> + * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>   * @size: size of the batchbuffer
>   * @allocator_type: allocator type, SIMPLE, RANDOM, ...
>   *
> @@ -1466,10 +1482,11 @@ struct intel_bb *intel_bb_create_full(int i915, uint32_t ctx, uint32_t size,
>   * Pointer the intel_bb, asserts on failure.
>   */
>  struct intel_bb *intel_bb_create_with_allocator(int i915, uint32_t ctx,
> +						const intel_ctx_cfg_t *cfg,
>  						uint32_t size,
>  						uint8_t allocator_type)
>  {
> -	return __intel_bb_create(i915, ctx, size, false, 0, 0,
> +	return __intel_bb_create(i915, ctx, cfg, size, false, 0, 0,
>  				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
>  }
>  
> @@ -1502,7 +1519,7 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size)
>  {
>  	bool relocs = gem_has_relocations(i915);
>  
> -	return __intel_bb_create(i915, 0, size,
> +	return __intel_bb_create(i915, 0, NULL, size,
>  				 relocs && !aux_needs_softpin(i915), 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
>  				 ALLOC_STRATEGY_HIGH_TO_LOW);
> @@ -1511,21 +1528,24 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size)
>  /**
>   * intel_bb_create_with_context:
>   * @i915: drm fd
> - * @ctx: context
> + * @ctx: context id
> + * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>   * @size: size of the batchbuffer
>   *
> - * Creates bb with context passed in @ctx.
> + * Creates bb with context passed in @ctx and @cfg configuration (when
> + * working with custom engines layout).
>   *
>   * Returns:
>   *
>   * Pointer the intel_bb, asserts on failure.
>   */
>  struct intel_bb *
> -intel_bb_create_with_context(int i915, uint32_t ctx, uint32_t size)
> +intel_bb_create_with_context(int i915, uint32_t ctx,
> +			     const intel_ctx_cfg_t *cfg, uint32_t size)
>  {
>  	bool relocs = gem_has_relocations(i915);
>  
> -	return __intel_bb_create(i915, ctx, size,
> +	return __intel_bb_create(i915, ctx, cfg, size,
>  				 relocs && !aux_needs_softpin(i915), 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
>  				 ALLOC_STRATEGY_HIGH_TO_LOW);
> @@ -1547,7 +1567,7 @@ struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size)
>  {
>  	igt_require(gem_has_relocations(i915));
>  
> -	return __intel_bb_create(i915, 0, size, true, 0, 0,
> +	return __intel_bb_create(i915, 0, NULL, size, true, 0, 0,
>  				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
>  }
>  
> @@ -1555,6 +1575,7 @@ struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size)
>   * intel_bb_create_with_relocs_and_context:
>   * @i915: drm fd
>   * @ctx: context
> + * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>   * @size: size of the batchbuffer
>   *
>   * Creates bb with default context which will disable passing addresses.
> @@ -1565,11 +1586,13 @@ struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size)
>   * Pointer the intel_bb, asserts on failure.
>   */
>  struct intel_bb *
> -intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size)
> +intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx,
> +					const intel_ctx_cfg_t *cfg,
> +					uint32_t size)
>  {
>  	igt_require(gem_has_relocations(i915));
>  
> -	return __intel_bb_create(i915, ctx, size, true, 0, 0,
> +	return __intel_bb_create(i915, ctx, cfg, size, true, 0, 0,
>  				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
>  }
>  
> @@ -1589,7 +1612,7 @@ struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size)
>  {
>  	igt_require(gem_uses_full_ppgtt(i915));
>  
> -	return __intel_bb_create(i915, 0, size, false, 0, 0,
> +	return __intel_bb_create(i915, 0, NULL, size, false, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
>  				 ALLOC_STRATEGY_HIGH_TO_LOW);
>  }
> @@ -1670,6 +1693,7 @@ void intel_bb_destroy(struct intel_bb *ibb)
>  		close(ibb->fence);
>  
>  	free(ibb->batch);
> +	free(ibb->cfg);
>  	free(ibb);
>  }
>  
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 36b6b61d..2c19c39b 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -486,6 +486,9 @@ struct intel_bb {
>  	uint32_t ctx;
>  	uint32_t vm_id;
>  
> +	/* Context configuration */
> +	intel_ctx_cfg_t *cfg;
> +
>  	/* Cache */
>  	void *root;
>  
> @@ -514,18 +517,20 @@ struct intel_bb {
>  };
>  
>  struct intel_bb *
> -intel_bb_create_full(int i915, uint32_t ctx, uint32_t size,
> -		     uint64_t start, uint64_t end,
> +intel_bb_create_full(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
> +		     uint32_t size, uint64_t start, uint64_t end,
>  		     uint8_t allocator_type, enum allocator_strategy strategy);
>  struct intel_bb *
> -intel_bb_create_with_allocator(int i915, uint32_t ctx,
> +intel_bb_create_with_allocator(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
>  			       uint32_t size, uint8_t allocator_type);
>  struct intel_bb *intel_bb_create(int i915, uint32_t size);
>  struct intel_bb *
> -intel_bb_create_with_context(int i915, uint32_t ctx, uint32_t size);
> +intel_bb_create_with_context(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
> +			     uint32_t size);
>  struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size);
>  struct intel_bb *
> -intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size);
> +intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx,
> +					const intel_ctx_cfg_t *cfg, uint32_t size);
>  struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size);
>  void intel_bb_destroy(struct intel_bb *ibb);
>  
> diff --git a/lib/media_fill.c b/lib/media_fill.c
> index d758f1f5..4f8b50e8 100644
> --- a/lib/media_fill.c
> +++ b/lib/media_fill.c
> @@ -309,7 +309,7 @@ __gen11_media_vme_func(int i915,
>  	struct intel_bb *ibb;
>  	uint32_t curbe_buffer, interface_descriptor;
>  
> -	ibb = intel_bb_create_with_context(i915, ctx, PAGE_SIZE);
> +	ibb = intel_bb_create_with_context(i915, ctx, NULL, PAGE_SIZE);
>  	intel_bb_add_intel_buf(ibb, dst, true);
>  	intel_bb_add_intel_buf(ibb, src, false);
>  
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 1f663d2a..a881d6b0 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -183,7 +183,7 @@ static void simple_bb(struct buf_ops *bops, bool use_context)
>  	if (use_context)
>  		gem_require_contexts(i915);
>  
> -	ibb = intel_bb_create_with_allocator(i915, ctx, PAGE_SIZE,
> +	ibb = intel_bb_create_with_allocator(i915, ctx, NULL, PAGE_SIZE,
>  					     INTEL_ALLOCATOR_SIMPLE);
>  	if (debug_bb)
>  		intel_bb_set_debug(ibb, true);
> @@ -202,7 +202,7 @@ static void simple_bb(struct buf_ops *bops, bool use_context)
>  	if (use_context) {
>  		ctx = gem_context_create(i915);
>  		intel_bb_destroy(ibb);
> -		ibb = intel_bb_create_with_context(i915, ctx, PAGE_SIZE);
> +		ibb = intel_bb_create_with_context(i915, ctx, NULL, PAGE_SIZE);
>  		intel_bb_out(ibb, MI_BATCH_BUFFER_END);
>  		intel_bb_ptr_align(ibb, 8);
>  		intel_bb_exec(ibb, intel_bb_offset(ibb),
> @@ -223,7 +223,7 @@ static void bb_with_allocator(struct buf_ops *bops)
>  
>  	igt_require(gem_uses_full_ppgtt(i915));
>  
> -	ibb = intel_bb_create_with_allocator(i915, ctx, PAGE_SIZE,
> +	ibb = intel_bb_create_with_allocator(i915, ctx, NULL, PAGE_SIZE,
>  					     INTEL_ALLOCATOR_SIMPLE);
>  	if (debug_bb)
>  		intel_bb_set_debug(ibb, true);
> @@ -557,7 +557,7 @@ static void object_noreloc(struct buf_ops *bops, enum obj_cache_ops cache_op,
>  
>  	igt_require(gem_uses_full_ppgtt(i915));
>  
> -	ibb = intel_bb_create_with_allocator(i915, 0, PAGE_SIZE, allocator_type);
> +	ibb = intel_bb_create_with_allocator(i915, 0, NULL, PAGE_SIZE, allocator_type);
>  	if (debug_bb)
>  		intel_bb_set_debug(ibb, true);
>  
> @@ -671,7 +671,7 @@ static void blit(struct buf_ops *bops,
>  	if (do_relocs) {
>  		ibb = intel_bb_create_with_relocs(i915, PAGE_SIZE);
>  	} else {
> -		ibb = intel_bb_create_with_allocator(i915, 0, PAGE_SIZE,
> +		ibb = intel_bb_create_with_allocator(i915, 0, NULL, PAGE_SIZE,
>  						     allocator_type);
>  		flags |= I915_EXEC_NO_RELOC;
>  	}
> @@ -1135,7 +1135,7 @@ static void delta_check(struct buf_ops *bops)
>  	uint64_t delta = gem_detect_safe_alignment(i915) + 0x1000;
>  	bool supports_48bit;
>  
> -	ibb = intel_bb_create_with_allocator(i915, 0, PAGE_SIZE,
> +	ibb = intel_bb_create_with_allocator(i915, 0, NULL, PAGE_SIZE,
>  					     INTEL_ALLOCATOR_SIMPLE);
>  	supports_48bit = ibb->supports_48b_address;
>  	if (!supports_48bit)
> diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
> index 0a06e9ec..9673ce22 100644
> --- a/tests/i915/gem_ppgtt.c
> +++ b/tests/i915/gem_ppgtt.c
> @@ -112,7 +112,7 @@ static void fork_rcs_copy(int timeout, uint32_t final,
>  			ctx = gem_context_create(buf_ops_get_fd(dst[child]->bops));
>  
>  		ibb = intel_bb_create_with_context(buf_ops_get_fd(dst[child]->bops),
> -						   ctx, 4096);
> +						   ctx, NULL, 4096);
>  		i = 0;
>  		igt_until_timeout(timeout) {
>  			src = create_bo(dst[child]->bops,
> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> index 65618556..b43273c9 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -457,7 +457,7 @@ static void test_render_baseline(int i915)
>  	/* Perform a regular 3d copy as a control checkpoint */
>  	ret = create_ctx_with_params(i915, false, false, false, false, &ctx);
>  	igt_assert_eq(ret, 0);
> -	ibb = intel_bb_create_with_context(i915, ctx, 4096);
> +	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
>  	igt_assert(ibb);
>  
>  	dstbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_INITCOLOR1);
> @@ -506,7 +506,7 @@ static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int
>  	ret = create_ctx_with_params(i915, true, true, true, false, &ctx);
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> -	ibb = intel_bb_create_with_context(i915, ctx, 4096);
> +	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
>  	igt_assert(ibb);
>  	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
>  
> @@ -567,7 +567,7 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
>  	ret = create_ctx_with_params(i915, true, true, true, false, &ctx);
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> -	ibb = intel_bb_create_with_context(i915, ctx, 4096);
> +	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
>  	igt_assert(ibb);
>  	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
>  
> @@ -655,7 +655,7 @@ static void test_pxp_dmabuffshare_refcnt(void)
>  		ret = create_ctx_with_params(fd[n], true, true, true, false, &ctx[n]);
>  		igt_assert_eq(ret, 0);
>  		igt_assert_eq(get_ctx_protected_param(fd[n], ctx[n]), 1);
> -		ibb[n] = intel_bb_create_with_context(fd[n], ctx[n], 4096);
> +		ibb[n] = intel_bb_create_with_context(fd[n], ctx[n], NULL, 4096);
>  		intel_bb_set_pxp(ibb[n], true, DISPLAY_APPTYPE,
>  				 I915_PROTECTED_CONTENT_DEFAULT_SESSION);
>  
> @@ -820,7 +820,7 @@ static void prepare_exec_assets(int i915, struct simple_exec_assets *data, bool
>  		ret = create_ctx_with_params(i915, false, false, false, false, &(data->ctx));
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(get_ctx_protected_param(i915, data->ctx), ctx_pxp);
> -	data->ibb = intel_bb_create_with_context(i915, data->ctx, 4096);
> +	data->ibb = intel_bb_create_with_context(i915, data->ctx, NULL, 4096);
>  	igt_assert(data->ibb);
>  
>  	data->fencebo = alloc_and_fill_dest_buff(i915, buf_pxp, 4096, 0);
> @@ -900,7 +900,7 @@ static void test_pxp_stale_buf_execution(int i915)
>  	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
> -	ibb2 = intel_bb_create_with_context(i915, ctx2, 4096);
> +	ibb2 = intel_bb_create_with_context(i915, ctx2, NULL, 4096);
>  	igt_assert(ibb2);
>  	intel_bb_remove_intel_buf(data.ibb, data.fencebuf);
>  	intel_bb_add_intel_buf(ibb2, data.fencebuf, true);
> @@ -979,7 +979,7 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
> -	ibb2 = intel_bb_create_with_context(i915, ctx2, 4096);
> +	ibb2 = intel_bb_create_with_context(i915, ctx2, NULL, 4096);
>  	igt_assert(ibb2);
>  	intel_bb_remove_intel_buf(data[1].ibb, data[1].fencebuf);
>  	intel_bb_add_intel_buf(ibb2, data[1].fencebuf, true);
> @@ -1043,7 +1043,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
>  					       fb->plane_bpp[0], 0,
>  					       igt_fb_mod_to_tiling(fb->modifier), 0);
>  
> -	ibb = intel_bb_create_with_context(i915, ctx, 4096);
> +	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
>  	igt_assert(ibb);
>  
>  	ibb->pxp.enabled = true;
> diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
> index f1eac1c6..1972a699 100644
> --- a/tests/i915/kms_fence_pin_leak.c
> +++ b/tests/i915/kms_fence_pin_leak.c
> @@ -62,7 +62,7 @@ static void exec_nop(data_t *data, struct igt_fb *fb, uint32_t ctx)
>  	intel_buf_set_ownership(dst, true);
>  
>  	ibb = intel_bb_create_with_context(buf_ops_get_fd(data->bops),
> -					   ctx, 4096);
> +					   ctx, NULL, 4096);
>  
>  	/* add the reloc to make sure the kernel will think we write to dst */
>  	intel_bb_add_intel_buf(ibb, dst, true);
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 5502a3fb..9ef52690 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -1586,7 +1586,7 @@ static void load_helper_init(void)
>  	lh.context_id = gem_context_create(drm_fd);
>  	igt_assert_neq(lh.context_id, 0xffffffff);
>  
> -	lh.ibb = intel_bb_create_with_context(drm_fd, lh.context_id, BATCH_SZ);
> +	lh.ibb = intel_bb_create_with_context(drm_fd, lh.context_id, NULL, BATCH_SZ);
>  
>  	scratch_buf_init(lh.bops, &lh.dst, 1920, 1080, 0);
>  	scratch_buf_init(lh.bops, &lh.src, 1920, 1080, 0);
> @@ -3011,7 +3011,7 @@ gen12_test_mi_rpc(void)
>  	igt_assert_neq(ctx_id, INVALID_CTX_ID);
>  	properties[1] = ctx_id;
>  
> -	ibb = intel_bb_create_with_context(drm_fd, ctx_id, BATCH_SZ);
> +	ibb = intel_bb_create_with_context(drm_fd, ctx_id, NULL, BATCH_SZ);
>  	buf = intel_buf_create(bops, 4096, 1, 8, 64,
>  			       I915_TILING_NONE, I915_COMPRESSION_NONE);
>  
> @@ -3090,7 +3090,7 @@ test_mi_rpc(void)
>  
>  	ctx_id = gem_context_create(drm_fd);
>  
> -	ibb = intel_bb_create_with_context(drm_fd, ctx_id, BATCH_SZ);
> +	ibb = intel_bb_create_with_context(drm_fd, ctx_id, NULL, BATCH_SZ);
>  	buf = intel_buf_create(bops, 4096, 1, 8, 64,
>  			       I915_TILING_NONE, I915_COMPRESSION_NONE);
>  
> @@ -3217,8 +3217,8 @@ hsw_test_single_ctx_counters(void)
>  		 */
>  		context0_id = gem_context_create(drm_fd);
>  		context1_id = gem_context_create(drm_fd);
> -		ibb0 = intel_bb_create_with_context(drm_fd, context0_id, BATCH_SZ);
> -		ibb1 = intel_bb_create_with_context(drm_fd, context1_id,  BATCH_SZ);
> +		ibb0 = intel_bb_create_with_context(drm_fd, context0_id, NULL, BATCH_SZ);
> +		ibb1 = intel_bb_create_with_context(drm_fd, context1_id, NULL, BATCH_SZ);
>  
>  		igt_debug("submitting warm up render_copy\n");
>  
> @@ -3461,8 +3461,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
>  
>  			context0_id = gem_context_create(drm_fd);
>  			context1_id = gem_context_create(drm_fd);
> -			ibb0 = intel_bb_create_with_context(drm_fd, context0_id, BATCH_SZ);
> -			ibb1 = intel_bb_create_with_context(drm_fd, context1_id, BATCH_SZ);
> +			ibb0 = intel_bb_create_with_context(drm_fd, context0_id, NULL, BATCH_SZ);
> +			ibb1 = intel_bb_create_with_context(drm_fd, context1_id, NULL, BATCH_SZ);
>  
>  			igt_debug("submitting warm up render_copy\n");
>  
> @@ -3866,8 +3866,8 @@ static void gen12_single_ctx_helper(void)
>  
>  	context0_id = gem_context_create(drm_fd);
>  	context1_id = gem_context_create(drm_fd);
> -	ibb0 = intel_bb_create_with_context(drm_fd, context0_id, BATCH_SZ);
> -	ibb1 = intel_bb_create_with_context(drm_fd, context1_id, BATCH_SZ);
> +	ibb0 = intel_bb_create_with_context(drm_fd, context0_id, NULL, BATCH_SZ);
> +	ibb1 = intel_bb_create_with_context(drm_fd, context1_id, NULL, BATCH_SZ);
>  
>  	igt_debug("submitting warm up render_copy\n");
>  
> -- 
> 2.25.1
> 
