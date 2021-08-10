Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2040B89F4F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 08:46:10 +0000 (UTC)
Date: Tue, 10 Aug 2021 11:48:50 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YRI9ch5fTTyoihUN@platvala-desk.ger.corp.intel.com>
References: <20210810081440.21803-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210810081440.21803-1-janusz.krzysztofik@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/intel_memory_region: Add missing
 forward declaration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Turko <andrzej.turko@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 10:14:40AM +0200, Janusz Krzysztofik wrote:
> Intel memory region header declares some functions with a pointer to a
> structure defined elsewhere as one of their arguments.  Forward declare
> that structure to avoid compiler warnings.
> 
> ../lib/i915/intel_memory_region.h:69:19: warning: ‘struct drm_i915_gem_memory_class_instance’ declared inside parameter list will not be visible outside of this definition or declaration
>    69 |            struct drm_i915_gem_memory_class_instance *mem_regions,
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../lib/i915/intel_memory_region.h:73:15: warning: ‘struct drm_i915_gem_memory_class_instance’ declared inside parameter list will not be visible outside of this definition or declaration
>    73 |        struct drm_i915_gem_memory_class_instance *mem_regions,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/i915/intel_memory_region.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index e9d1d66d4..8cd18ea0e 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -62,6 +62,8 @@ uint8_t gem_get_lmem_region_count(int fd);
>  
>  bool gem_has_lmem(int fd);
>  
> +struct drm_i915_gem_memory_class_instance;
> +


You want to avoid an #include <i915_drm.h> ?


-- 
Petri Latvala



>  int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t size,
>  				       struct drm_i915_gem_memory_class_instance *mem_regions,
>  				       int num_regions);
> -- 
> 2.25.1
> 
