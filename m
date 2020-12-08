Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Tue, 8 Dec 2020 13:56:33 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <X89p8cxixzgFd8tn@intel.intel>
References: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/2] i915/query: Cross-check engine
 list against execbuf interface
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

> -	/* Check results match the legacy GET_PARAM (where we can). */
> +	/* Confirm the individual engines exist with EXECBUFFER2 */
>  	for (i = 0; i < engines->num_engines; i++) {
>  		struct drm_i915_engine_info *engine =
>  			(struct drm_i915_engine_info *)&engines->engines[i];
> +		I915_DEFINE_CONTEXT_PARAM_ENGINES(p_engines, 1) = {
> +			.engines = { engine->engine }
> +		};
> +		struct drm_i915_gem_context_param param = {
> +			.param = I915_CONTEXT_PARAM_ENGINES,
> +			.value = to_user_pointer(&p_engines),
> +			.size = sizeof(p_engines),
> +		};
> +
> +		struct drm_i915_gem_exec_object2 obj = {};
> +		struct drm_i915_gem_execbuffer2 execbuf = {
> +			.buffers_ptr = to_user_pointer(&obj),
> +			.buffer_count = 1,
> +		};
>  
>  		igt_debug("%u: class=%u instance=%u flags=%llx capabilities=%llx\n",
>  			  i,
> @@ -689,6 +713,15 @@ static void engines(int fd)
>  			  engine->engine.engine_instance,
>  			  engine->flags,
>  			  engine->capabilities);
> +		gem_context_set_param(fd, &param);
> +		igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
> +	}
> +	gem_context_reset_engines(fd, 0);
> +
> +	/* Check results match the legacy GET_PARAM (where we can). */
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct drm_i915_engine_info *engine =
> +			(struct drm_i915_engine_info *)&engines->engines[i];

I would have liked it with one single for loop, perhaps resetting
engines individually.

But this works, as well and I'm not strong with this:

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
