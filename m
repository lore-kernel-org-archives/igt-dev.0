Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61AA10E66C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 10:47:13 +0000 (UTC)
Date: Tue, 5 Apr 2022 12:47:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <YkweKqJRFZXfV8Um@zkempczy-mobl2>
References: <20220401074527.15709-1-ramalingam.c@intel.com>
 <20220401074527.15709-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401074527.15709-2-ramalingam.c@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/2] tests/i915/gem_lmem_swapping:
 create batch buffer from obj pool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 01:15:26PM +0530, Ramalingam C wrote:
> Use the gem_create_from_pool() for creating the batch buffers.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Looks good for me.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/i915/gem_lmem_swapping.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 43f0688f30b2..aba713039cfa 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -129,7 +129,7 @@ static void move_to_lmem(int i915,
>  			 const intel_ctx_t *ctx,
>  			 struct object *list,
>  			 unsigned int num,
> -			 uint32_t batch,
> +			 unsigned int region,
>  			 unsigned int engine,
>  			 bool do_oom_test)
>  {
> @@ -140,7 +140,13 @@ static void move_to_lmem(int i915,
>  		.flags = I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT | engine,
>  		.rsvd1 = ctx->id,
>  	};
> -	unsigned int i, ret;
> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> +	unsigned int i, ret, batch;
> +	uint64_t size;
> +
> +	size = 4096;
> +	batch = gem_create_from_pool(i915, &size, region);
> +	gem_write(i915, batch, 0, &bbe, sizeof(bbe));
>  
>  	memset(obj, 0, sizeof(obj));
>  
> @@ -154,6 +160,7 @@ retry:
>  	ret = __gem_execbuf(i915, &eb);
>  	if (do_oom_test && (ret == -ENOMEM || ret == -ENXIO))
>  		goto retry;
> +
>  	igt_assert_eq(ret, 0);
>  }
>  
> @@ -163,10 +170,10 @@ static void __do_evict(int i915,
>  		       struct params *params,
>  		       unsigned int seed)
>  {
> +	uint32_t region_id = INTEL_MEMORY_REGION_ID(region->memory_class,
> +						    region->memory_instance);
>  	const unsigned int max_swap_in = params->count / 100 + 1;
> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	struct object *objects, *obj, *list;
> -	uint32_t batch;
>  	unsigned int engine = 0;
>  	unsigned int i, l;
>  	uint64_t size;
> @@ -174,9 +181,6 @@ static void __do_evict(int i915,
>  	unsigned int num;
>  
>  	size = 4096;
> -	batch = create_bo(i915, &size, region, params->oom_test);
> -
> -	gem_write(i915, batch, 0, &bbe, sizeof(bbe));
>  
>  	objects = calloc(params->count, sizeof(*objects));
>  	igt_assert(objects);
> @@ -203,7 +207,7 @@ static void __do_evict(int i915,
>  		}
>  		obj->handle = create_bo(i915, &obj->size, region, params->oom_test);
>  
> -		move_to_lmem(i915, ctx, objects + i, 1, batch, engine,
> +		move_to_lmem(i915, ctx, objects + i, 1, region_id, engine,
>  			     params->oom_test);
>  		if (params->flags & TEST_VERIFY)
>  			init_object(i915, obj, rand(), params->flags);
> @@ -228,7 +232,8 @@ static void __do_evict(int i915,
>  			idx = (idx + 1) % params->count;
>  		}
>  
> -		move_to_lmem(i915, ctx, list, num, batch, engine, params->oom_test);
> +		move_to_lmem(i915, ctx, list, num, region_id, engine,
> +			     params->oom_test);
>  
>  		if (params->flags & TEST_ENGINES)
>  			engine = (engine + 1) % __num_engines__;
> @@ -248,8 +253,6 @@ static void __do_evict(int i915,
>  
>  	free(list);
>  	free(objects);
> -
> -	gem_close(i915, batch);
>  }
>  
>  static void fill_params(int i915, struct params *params,
> -- 
> 2.20.1
> 
