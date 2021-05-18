Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6BE6EAB4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 May 2021 08:12:29 +0000 (UTC)
Date: Tue, 18 May 2021 10:12:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210518081222.GD4341@zkempczy-mobl2>
References: <20210423214853.876911-1-jason@jlekstrand.net>
 <20210423214853.876911-14-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423214853.876911-14-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 13/89] lib/i915/gem_engine_topology: Add
 an iterator for intel_ctx_t (v2)
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

On Fri, Apr 23, 2021 at 04:47:37PM -0500, Jason Ekstrand wrote:
> v2 (Jason Ekstrand):
>  - Add documentation
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  lib/i915/gem_engine_topology.c | 69 ++++++++++++++++++++++++++++++++++
>  lib/i915/gem_engine_topology.h | 29 +++++++++++++-
>  2 files changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index 6bceb909..ac707cb3 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -39,6 +39,47 @@
>   *
>   * This helper library contains functions used for querying and dealing
>   * with engines in GEM contexts.
> + *
> + * Combined with intel_ctx_t, these helpers give a pretty standard pattern
> + * for testing every engine in a device:
> + * |[<!-- language="C" -->
> + *	const struct intel_execution_engine2 *e;
> + *	const intel_ctx_t *ctx = intel_ctx_create_all_physical(fd);
> + *
> + *	igt_subtest_with_dynamic("basic") {
> + *		for_each_ctx_engine(fd, ctx, e) {
> + *			igt_dynamic_f("%s", e->name)
> + *			run_ctx_test(fd, ctx, e);
> + *		}
> + *	}
> + * ]|
> + * This pattern works regardless of whether or not the engines topology API
> + * is available and regardless of whether or not your platform supports
> + * contexts.  If engines are unavailable, it falls back to a legacy context
> + * and if contexts are unavailable, intel_ctx_create_all_physial() will

                                                            ^^^^^^^ - typo


> + * return a wrapper around ctx0.
> + *
> + * If, for some reason, you want to create a second identical context to
> + * use with your engine iterator, duplicating the context is easy:
> + * |[<!-- language="C" -->
> + *	const intel_ctx_t *ctx2 = intel_ctx_create(fd, &ctx->cfg);
> + * ]|
> + *
> + * If you want each subtest to always create its own contexts, there are
> + * also iterators which work only on a context config.  As long as all
> + * contexts are created from that config, or from one with an identical set
> + * of engines, the iterator will be valid for those contexts.
> + * |[<!-- language="C" -->
> + *	const struct intel_execution_engine2 *e;
> + *	intel_ctx_cfg_t cfg = intel_ctx_cfg_all_physical(fd);
> + *
> + *	igt_subtest_with_dynamic("basic") {
> + *		for_each_ctx_cfg_engine(fd, &cfg, e) {
> + *			igt_dynamic_f("%s", e->name)
> + *			run_ctx_cfg_test(fd, &cfg, e);
> + *		}
> + *	}
> + * ]|
>   */
>  
>  /*
> @@ -256,6 +297,34 @@ struct intel_engine_data intel_engine_list_of_physical(int fd)
>  	return intel_engine_list_for_static(fd);
>  }
>  
> +/**
> + * intel_engine_list_for_ctx_cfg:
> + * @fd: open i915 drm file descriptor
> + * @cfg: Context config
> + *
> + * Returns the list of all engines in the context config
> + */
> +struct intel_engine_data
> +intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg)
> +{

I would add igt_assert(cfg) here especially we expect not-null
cfg pointer here.

> +	if (fd >= 0 && cfg->num_engines) {
> +		struct intel_engine_data engine_data = { };
> +		int i;
> +
> +		engine_data.nengines = cfg->num_engines;
> +		for (i = 0; i < cfg->num_engines; i++)
> +			init_engine(&engine_data.engines[i],
> +				    cfg->engines[i].engine_class,
> +				    cfg->engines[i].engine_instance,
> +				    i);

What's the reason of passing incrementing value here? It's confusing
especially it is not correspond to legacy engine ids. 

--
Zbigniew

> +
> +		return engine_data;
> +	} else {
> +		/* This is a legacy context */
> +		return intel_engine_list_for_static(fd);
> +	}
> +}
> +
>  static int gem_topology_get_param(int fd,
>  				  struct drm_i915_gem_context_param *p)
>  {
> diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
> index bd93e410..92d9a479 100644
> --- a/lib/i915/gem_engine_topology.h
> +++ b/lib/i915/gem_engine_topology.h
> @@ -26,8 +26,7 @@
>  
>  #include "igt_gt.h"
>  #include "i915_drm.h"
> -
> -#define GEM_MAX_ENGINES		I915_EXEC_RING_MASK + 1
> +#include "intel_ctx.h"
>  
>  int __gem_query_engines(int fd,
>  			struct drm_i915_query_engine_info *query_engines,
> @@ -51,6 +50,7 @@ struct intel_engine_data {
>  
>  bool gem_has_engine_topology(int fd);
>  struct intel_engine_data intel_engine_list_of_physical(int fd);
> +struct intel_engine_data intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg);
>  struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id);
>  
>  /* iteration functions */
> @@ -81,6 +81,31 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
>  #define __for_each_static_engine(e__) \
>  	for ((e__) = intel_execution_engines2; (e__)->name[0]; (e__)++)
>  
> +/**
> + * for_each_ctx_cfg_engine
> + * @fd__: open i915 drm file descriptor
> + * @ctx_cfg__: Intel context config
> + * @e__: struct intel_execution_engine2 iterator
> + *
> + * Iterates over each physical engine in the context config
> + */
> +#define for_each_ctx_cfg_engine(fd__, ctx_cfg__, e__) \
> +	for (struct intel_engine_data i__##e__ = \
> +			intel_engine_list_for_ctx_cfg(fd__, ctx_cfg__); \
> +	     ((e__) = intel_get_current_engine(&i__##e__)); \
> +	     intel_next_engine(&i__##e__))
> +
> +/**
> + * for_each_ctx_engine
> + * @fd__: open i915 drm file descriptor
> + * @ctx__: Intel context wrapper
> + * @e__: struct intel_execution_engine2 iterator
> + *
> + * Iterates over each physical engine in the context
> + */
> +#define for_each_ctx_engine(fd__, ctx__, e__) \
> +	for_each_ctx_cfg_engine(fd__, &(ctx__)->cfg, e__)
> +
>  #define for_each_context_engine(fd__, ctx__, e__) \
>  	for (struct intel_engine_data i__ = intel_init_engine_list(fd__, ctx__); \
>  	     ((e__) = intel_get_current_engine(&i__)); \
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
