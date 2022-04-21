Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77E910E6B8
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 16:34:44 +0000 (UTC)
Date: Thu, 21 Apr 2022 09:34:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: priyanka.dandamudi@intel.com
Message-ID: <YmGHgOGFd2Xp6VTM@mdroper-desk1.amr.corp.intel.com>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
 <20220421145211.464313-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421145211.464313-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] lib/i915/i915_drm_local : Add
 DRM_I915_QUERY_DISTANCE_INFO query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com,
 krishnaiah.bommu@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 08:22:06PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add distance info query to check if the memory region is reachable or
> not. If memory region is reachable, it gives the distance from the
> memory region to the (class, instance) engine given by the user.
> 
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/i915/i915_drm_local.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index 9a2273c4..1d584020 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -23,6 +23,29 @@ extern "C" {
>  
>  #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
>  
> +#define DRM_I915_QUERY_DISTANCE_INFO 5

DRM_I915_QUERY_HWCONFIG_BLOB has already taken query ID 5 (and
DRM_I915_QUERY_GEOMETRY_SUBSLICES has taken 6).  So the first available
ID is 7.


Matt

> +
> +/**
> + * struct drm_i915_query_distance_info
> + *
> + * Distance info query returns the distance of given (class, instance)
> + * engine to the memory region id passed by the user. If the distance
> + * is -1 it means region is unreachable.
> + */
> +struct drm_i915_query_distance_info {
> +	/** Engine for which distance is queried */
> +	struct i915_engine_class_instance engine;
> +
> +	/** Memory region to be used */
> +	struct drm_i915_gem_memory_class_instance region;
> +
> +	/** Distance to region from engine */
> +	__s32 distance;
> +
> +	/** Must be zero */
> +	__u32 rsvd[3];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
