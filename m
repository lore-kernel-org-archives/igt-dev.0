Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E83B6E1E0
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 20:08:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b9so3421636wrs.1
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Apr 2021 13:08:52 -0700 (PDT)
Date: Thu, 8 Apr 2021 22:08:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YG9i0GW06owUYoFs@phenom.ffwll.local>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
 <20210401021243.4147604-7-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401021243.4147604-7-jason@jlekstrand.net>
Subject: Re: [igt-dev] [RFC 06/30] lib/igt_spin: Support intel_ctx_t
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

On Wed, Mar 31, 2021 at 09:12:19PM -0500, Jason Ekstrand wrote:
> ---
>  lib/igt_dummyload.c | 30 ++++++++++++++++++++++--------
>  lib/igt_dummyload.h |  4 ++++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 5a11ec4e..ac83b331 100644
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

I'm assuming at the end of the series we'll have a patch to ditch this
transition code?
-Daniel

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
> index aee72da8..b26a7b7d 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -32,9 +32,12 @@
>  #include "igt_list.h"
>  #include "i915_drm.h"
>  
> +struct intel_ctx;
> +
>  typedef struct igt_spin {
>  	struct igt_list_head link;
>  
> +
>  	uint32_t handle;
>  	uint32_t poll_handle;
>  
> @@ -61,6 +64,7 @@ typedef struct igt_spin {
>  
>  struct igt_spin_factory {
>  	uint32_t ctx_id;
> +	const struct intel_ctx *ctx;
>  	uint32_t dependency;
>  	unsigned int engine;
>  	unsigned int flags;
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
