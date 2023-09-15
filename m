Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F21310E660
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 18:00:18 +0000 (UTC)
Date: Fri, 15 Sep 2023 20:00:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230915180013.enr3dmzas57sgsci@kamilkon-desk.igk.intel.com>
References: <20230914201809.1804-1-nirmoy.das@intel.com>
 <20230914201809.1804-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914201809.1804-2-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_gt: Add
 gem_engine_can_block_ggtt_binder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com, oak.zeng@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,

On 2023-09-14 at 22:18:07 +0200, Nirmoy Das wrote:
> On MTL GGTT updates happens through MI_UPDATE_GGTT command.
> Add a method to detect if a engine can block ggtt binder.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_gt.c | 15 +++++++++++++++
>  lib/igt_gt.h |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index a24a566c7..aa5e75b07 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -659,3 +659,18 @@ int gem_execbuf_flags_to_engine_class(unsigned int flags)
>  		igt_assert(0);
>  	}
>  }
> +
> +/**
> + * gem_engine_can_block_ggtt_binder:
> + * @fd: open i915 drm file descriptor
> + * @engine: engine to be assessed
> + *
> + * Detect if the platform needs blitter based GGTT
> + * updates.
> + */
> +bool gem_engine_can_block_ggtt_binder(int fd,
> +		const struct intel_execution_engine2 *engine)
> +{
> +	return IS_METEORLAKE(intel_get_drm_devid(fd)) &&
> +		engine->class == I915_ENGINE_CLASS_COPY;
> +}
> diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> index 3d10349e4..d0c5510b1 100644
> --- a/lib/igt_gt.h
> +++ b/lib/igt_gt.h
> @@ -83,5 +83,7 @@ extern const struct intel_execution_engine2 {
>  } intel_execution_engines2[];
>  
>  int gem_execbuf_flags_to_engine_class(unsigned int flags);
> +bool gem_engine_can_block_ggtt_binder(int fd,
> +		const struct intel_execution_engine2 *engine);
>  
>  #endif /* IGT_GT_H */
> -- 
> 2.41.0
> 
