Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778CE10E49B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 09:01:56 +0000 (UTC)
Date: Tue, 7 Jun 2022 11:01:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yp8T83Uq1BA3MHdR@kamilkon-desk1>
References: <20220607083201.116570-1-zbigniew.kempczynski@intel.com>
 <20220607083201.116570-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607083201.116570-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/i915/gem_exec_schedule:
 Execute spinner in valid context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-06-07 at 10:32:00 +0200, Zbigniew Kempczyński wrote:
> Running spinner in default context is not correct because it can
> contain less engines than spinner expect. Fix this by setting
> two contexts with identical set of engines.
> 
> Fixes: semaphore-noskip and u-semaphore-noskip
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_exec_schedule.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index 43d9d06c09..db3637e88a 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -1200,16 +1200,17 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>  	const struct intel_execution_engine2 *outer, *inner;
> -	const intel_ctx_t *ctx;
> +	const intel_ctx_t *ctx0, *ctx1;
>  	uint64_t ahnd;
>  
>  	igt_require(gen >= 6); /* MI_STORE_DWORD_IMM convenience */
>  
> -	ctx = intel_ctx_create(i915, cfg);
> -	ahnd = get_reloc_ahnd(i915, ctx->id);
> +	ctx0 = intel_ctx_create(i915, cfg);
> +	ctx1 = intel_ctx_create(i915, cfg);
> +	ahnd = get_reloc_ahnd(i915, ctx0->id);
>  
> -	for_each_ctx_engine(i915, ctx, outer) {
> -	for_each_ctx_engine(i915, ctx, inner) {
> +	for_each_ctx_engine(i915, ctx0, outer) {
> +	for_each_ctx_engine(i915, ctx0, inner) {
>  		struct drm_i915_gem_exec_object2 obj[3];
>  		struct drm_i915_gem_execbuffer2 eb;
>  		uint32_t handle, *cs, *map;
> @@ -1219,10 +1220,10 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
>  		    !gem_class_can_store_dword(i915, inner->class))
>  			continue;
>  
> -		chain = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
> +		chain = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx0,
>  				       .engine = outer->flags, .flags = flags);
>  
> -		spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
> +		spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx0,
>  				      .engine = inner->flags, .flags = flags);
>  		igt_spin_end(spin); /* we just want its address for later */
>  		gem_sync(i915, spin->handle);
> @@ -1256,7 +1257,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
>  		memset(&eb, 0, sizeof(eb));
>  		eb.buffer_count = 3;
>  		eb.buffers_ptr = to_user_pointer(obj);
> -		eb.rsvd1 = ctx->id;
> +		eb.rsvd1 = ctx1->id;
>  		eb.flags = inner->flags;
>  		gem_execbuf(i915, &eb);
>  
> @@ -1269,6 +1270,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
>  		eb.buffer_count = 2;
>  		eb.buffers_ptr = to_user_pointer(obj);
>  		eb.flags = inner->flags;
> +		eb.rsvd1 = ctx0->id;
>  		gem_execbuf(i915, &eb);
>  
>  		igt_spin_set_timeout(chain, NSEC_PER_SEC / 100);
> @@ -1280,7 +1282,8 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
>  	}
>  	}
>  
> -	intel_ctx_destroy(i915, ctx);
> +	intel_ctx_destroy(i915, ctx0);
> +	intel_ctx_destroy(i915, ctx1);
>  	put_ahnd(ahnd);
>  }
>  
> -- 
> 2.32.0
> 
