Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 14 Feb 2020 15:16:36 -0800
From: "Stimson, Dale B" <dale.b.stimson@intel.com>
Message-ID: <20200214231636.GA64470@dbstims-dev.fm.intel.com>
References: <20200214194016.4054376-1-chris@chris-wilson.co.uk>
 <20200214194016.4054376-3-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214194016.4054376-3-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/i915: Don't confuse param.size
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-02-14 19:40:15, Chris Wilson wrote:
> If the context has no engines, it has no engines -- do not override the
> user's setup.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Dale B Stimson <dale.b.stimson@intel.com>

> ---
>  lib/i915/gem_engine_topology.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index 9daa03df4..ca1c1fdb9 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -195,17 +195,6 @@ static int gem_topology_get_param(int fd,
>  	if (__gem_context_get_param(fd, p))
>  		return -1; /* using default engine map */
>  
> -	if (!p->size)
> -		return 0;
> -
> -	/* size will store the engine count */
> -	p->size = (p->size - sizeof(struct i915_context_param_engines)) /
> -		  (offsetof(struct i915_context_param_engines,
> -			    engines[1]) -
> -		  sizeof(struct i915_context_param_engines));
> -
> -	igt_assert_f(p->size <= GEM_MAX_ENGINES, "unsupported engine count\n");
> -
>  	return 0;
>  }
>  
> @@ -242,7 +231,13 @@ struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id)
>  		query_engine_list(fd, &engine_data);
>  		ctx_map_engines(fd, &engine_data, &param);
>  	} else {
> -		/* param.size contains the engine count */
> +		/* engine count can be inferred from size */
> +		param.size -= sizeof(struct i915_context_param_engines);
> +		param.size /= sizeof(struct i915_engine_class_instance);
> +
> +		igt_assert_f(param.size <= GEM_MAX_ENGINES,
> +			     "unsupported engine count\n");
> +
>  		for (i = 0; i < param.size; i++)
>  			init_engine(&engine_data.engines[i],
>  				    engines.engines[i].engine_class,
> -- 
> 2.25.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
