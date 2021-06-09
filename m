Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9C6E0D2
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 06:34:06 +0000 (UTC)
Date: Wed, 9 Jun 2021 08:33:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210609063358.GJ6228@zkempczy-mobl2>
References: <20210609043035.102359-1-jason@jlekstrand.net>
 <20210609043035.102359-18-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609043035.102359-18-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 17/93] lib/dummyload: Support intel_ctx_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 11:30:03PM -0500, Jason Ekstrand wrote:
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Read my comment from:

https://patchwork.freedesktop.org/patch/430807/?series=88986&rev=4

--
Zbigniew

> ---
>  lib/igt_dummyload.c | 30 ++++++++++++++++++++++--------


>  lib/igt_dummyload.h |  4 ++++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 784714d6..c7c685b8 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -123,16 +123,28 @@ emit_recursive_batch(igt_spin_t *spin,
>  	addr += random() % addr / 2;
>  	addr &= -4096;
>  
> +	assert(!(opts->ctx && opts->ctx_id));
> +
>  	nengine = 0;
>  	if (opts->engine == ALL_ENGINES) {
>  		struct intel_execution_engine2 *engine;
>  
> -		for_each_context_engine(fd, opts->ctx_id, engine) {
> -			if (opts->flags & IGT_SPIN_POLL_RUN &&
> -			    !gem_class_can_store_dword(fd, engine->class))
> -				continue;
> +		if (opts->ctx) {
> +			for_each_ctx_engine(fd, opts->ctx, engine) {
> +				if (opts->flags & IGT_SPIN_POLL_RUN &&
> +				    !gem_class_can_store_dword(fd, engine->class))
> +					continue;
>  
> -			flags[nengine++] = engine->flags;
> +				flags[nengine++] = engine->flags;
> +			}
> +		} else {
> +			for_each_context_engine(fd, opts->ctx_id, engine) {
> +				if (opts->flags & IGT_SPIN_POLL_RUN &&
> +				    !gem_class_can_store_dword(fd, engine->class))
> +					continue;
> +
> +				flags[nengine++] = engine->flags;
> +			}
>  		}
>  	} else {
>  		flags[nengine++] = opts->engine;
> @@ -325,7 +337,7 @@ emit_recursive_batch(igt_spin_t *spin,
>  
>  	execbuf->buffers_ptr =
>  	       	to_user_pointer(obj + (2 - execbuf->buffer_count));
> -	execbuf->rsvd1 = opts->ctx_id;
> +	execbuf->rsvd1 = opts->ctx ? opts->ctx->id : opts->ctx_id;
>  
>  	if (opts->flags & IGT_SPIN_FENCE_OUT)
>  		execbuf->flags |= I915_EXEC_FENCE_OUT;
> @@ -422,8 +434,10 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
>  		struct intel_execution_engine2 e;
>  		int class;
>  
> -		if (!gem_context_lookup_engine(fd, opts->engine,
> -					       opts->ctx_id, &e)) {
> +		if (opts->ctx) {
> +			class = opts->ctx->cfg.engines[opts->engine].engine_class;
> +		} else if (!gem_context_lookup_engine(fd, opts->engine,
> +						      opts->ctx_id, &e)) {
>  			class = e.class;
>  		} else {
>  			gem_require_ring(fd, opts->engine);
> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
> index ad1ce28c..4534d2ca 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -31,10 +31,12 @@
>  #include "igt_core.h"
>  #include "igt_list.h"
>  #include "i915_drm.h"
> +#include "intel_ctx.h"
>  
>  typedef struct igt_spin {
>  	struct igt_list_head link;
>  
> +
>  	uint32_t handle;
>  	uint32_t poll_handle;
>  
> @@ -62,6 +64,7 @@ typedef struct igt_spin {
>  /**
>   * igt_spin_factory_t:
>   * @ctx_id: GEM context handle
> + * @ctx: intel_ctx_t context wrapper
>   * @dependency: GEM object to depend on
>   * @engine: Flags describing the engine to execute on
>   * @flags: Set of IGT_SPIN_* flags
> @@ -71,6 +74,7 @@ typedef struct igt_spin {
>   */
>  typedef struct igt_spin_factory {
>  	uint32_t ctx_id;
> +	const intel_ctx_t *ctx;
>  	uint32_t dependency;
>  	unsigned int engine;
>  	unsigned int flags;
> -- 
> 2.31.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
