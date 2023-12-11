Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD4A10E0A5
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 11:41:58 +0000 (UTC)
Date: Mon, 11 Dec 2023 12:41:49 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe_ioctl: fix default cpu_caching helper
Message-ID: <ZXb1fRlwCW5CJE9U@fdugast-desk.home>
References: <20231211105844.30534-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231211105844.30534-1-matthew.auld@intel.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 10:58:43AM +0000, Matthew Auld wrote:
> The placement and flags were split in some recent refactoring, but looks
> like we forgot to update __xe_default_cpu_caching_from_placement to
> account for flags and placement. In particular we are no longer
> considering the FLAG_SCANOUT here.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/xe/xe_ioctl.c       | 6 +++---
>  lib/xe/xe_ioctl.h       | 2 +-
>  tests/intel/xe_create.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 8b12c0369..cdad3d7e2 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -230,10 +230,10 @@ void xe_vm_destroy(int fd, uint32_t vm)
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
>  }
>  
> -uint16_t __xe_default_cpu_caching_from_placement(int fd, uint32_t placement)
> +uint16_t __xe_default_cpu_caching(int fd, uint32_t placement, uint32_t flags)
>  {
>  	if ((placement & all_memory_regions(fd)) != system_memory(fd) ||
> -	    placement & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> +	    flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>  		/* VRAM placements or scanout should always use WC */
>  		return DRM_XE_GEM_CPU_CACHING_WC;
>  
> @@ -283,7 +283,7 @@ static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t pla
>  uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>  			uint32_t flags, uint32_t *handle)
>  {
> -	uint16_t cpu_caching = __xe_default_cpu_caching_from_placement(fd, placement);
> +	uint16_t cpu_caching = __xe_default_cpu_caching(fd, placement, flags);
>  
>  	return ___xe_bo_create(fd, vm, size, placement, flags, cpu_caching, handle);
>  }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index bbfa40391..c8d46fb29 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -72,7 +72,7 @@ uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t pla
>  				uint32_t flags, uint16_t cpu_caching, uint32_t *handle);
>  uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>  			      uint32_t flags, uint16_t cpu_caching);
> -uint16_t __xe_default_cpu_caching_from_placement(int fd, uint32_t placement);
> +uint16_t __xe_default_cpu_caching(int fd, uint32_t placement, uint32_t flags);
>  int __xe_exec_queue_create(int fd, uint32_t vm,
>  			   struct drm_xe_engine_class_instance *instance,
>  			   uint64_t ext, uint32_t *exec_queue_id);
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 64eadc734..1ed48a5d3 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -32,7 +32,7 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>  	struct drm_xe_gem_create create = {
>  		.vm_id = vm,
>  		.size = size,
> -		.cpu_caching = __xe_default_cpu_caching_from_placement(fd, placement),
> +		.cpu_caching = __xe_default_cpu_caching(fd, placement, 0),
>  		.placement = placement,
>  	};
>  	int ret = 0;
> -- 
> 2.43.0
> 
