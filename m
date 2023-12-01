Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D8310E0E0
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 10:38:23 +0000 (UTC)
Date: Fri, 1 Dec 2023 11:38:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231201103819.52y3mj5ehg6xxnhg@kamilkon-desk.igk.intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
 <20231130184536.7-7-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231130184536.7-7-francois.dugast@intel.com>
Subject: Re: [igt-dev] [PATCH v5 06/21] drm-uapi/xe: Separate bo_create
 placement from flags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Francois,
On 2023-11-30 at 18:45:21 +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Align with kernel commit ("drm/xe/uapi: Separate bo_create placement from flags")
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/gem_wsim.c              |  2 +-
>  include/drm-uapi/xe_drm.h          |  9 ++++---
>  lib/igt_draw.c                     |  2 +-
>  lib/igt_fb.c                       |  6 ++---
>  lib/intel_batchbuffer.c            |  4 +--
>  lib/intel_blt.c                    |  4 +--
>  lib/intel_bufops.c                 |  2 +-
>  lib/xe/xe_ioctl.c                  | 39 +++++++++++++++--------------
>  lib/xe/xe_ioctl.h                  | 17 +++++++------
>  lib/xe/xe_query.c                  | 21 ----------------
>  lib/xe/xe_query.h                  |  1 -
>  lib/xe/xe_spin.c                   |  4 +--
>  tests/intel/api_intel_allocator.c  |  2 +-
>  tests/intel/kms_big_fb.c           |  6 ++---
>  tests/intel/kms_ccs.c              |  2 +-
>  tests/intel/xe_ccs.c               | 12 ++++-----
>  tests/intel/xe_copy_basic.c        |  8 +++---
>  tests/intel/xe_create.c            |  6 ++---
>  tests/intel/xe_dma_buf_sync.c      |  2 +-
>  tests/intel/xe_drm_fdinfo.c        |  6 ++---
>  tests/intel/xe_evict.c             | 22 ++++++++++------
>  tests/intel/xe_evict_ccs.c         |  5 ++--
>  tests/intel/xe_exec_balancer.c     |  6 ++---
>  tests/intel/xe_exec_basic.c        |  5 ++--
>  tests/intel/xe_exec_compute_mode.c |  2 +-
>  tests/intel/xe_exec_fault_mode.c   |  4 +--
>  tests/intel/xe_exec_reset.c        | 11 ++++----
>  tests/intel/xe_exec_store.c        |  6 ++---
>  tests/intel/xe_exec_threads.c      |  6 ++---
>  tests/intel/xe_exercise_blt.c      |  4 +--
>  tests/intel/xe_intel_bb.c          |  2 +-
>  tests/intel/xe_mmap.c              | 40 ++++++++++++++++--------------
>  tests/intel/xe_noexec_ping_pong.c  |  2 +-
>  tests/intel/xe_pat.c               | 14 +++++------
>  tests/intel/xe_perf_pmu.c          |  4 +--
>  tests/intel/xe_pm.c                | 10 ++++----
>  tests/intel/xe_pm_residency.c      |  2 +-
>  tests/intel/xe_prime_self_import.c | 18 +++++++-------
>  tests/intel/xe_spin_batch.c        |  2 +-
>  tests/intel/xe_vm.c                | 22 ++++++++--------
>  tests/intel/xe_waitfence.c         | 22 ++++++++--------
>  tests/kms_addfb_basic.c            |  2 +-
>  tests/kms_getfb.c                  |  2 +-
>  43 files changed, 181 insertions(+), 187 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 47692e94f..eb9fd6266 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1746,7 +1746,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  	w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
>  			   xe_get_default_alignment(fd));
>  	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size,
> -				    vram_if_possible(fd, eq->hwe_list[0].gt_id) |
> +				    vram_if_possible(fd, eq->hwe_list[0].gt_id),
>  				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
>  	w->xe.exec.address =
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 2b6dfe326..01e0587dc 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -500,8 +500,11 @@ struct drm_xe_gem_create {
>  	 */
>  	__u64 size;
>  
> -#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
> -#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
> +	/** @placement: A mask of memory instances of where BO can be placed. */
> +	__u32 placement;
> +
> +#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
> +#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
>  /*
>   * When using VRAM as a possible placement, ensure that the corresponding VRAM
>   * allocation will always use the CPU accessible part of VRAM. This is important
> @@ -517,7 +520,7 @@ struct drm_xe_gem_create {
>   * display surfaces, therefore the kernel requires setting this flag for such
>   * objects, otherwise an error is thrown on small-bar systems.
>   */
> -#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
> +#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>  	/**
>  	 * @flags: Flags, currently a mask of memory instances of where BO can
>  	 * be placed
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 23d918575..6d0bcb997 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -801,7 +801,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>  	else
>  		tmp.handle = xe_bo_create(fd, 0,
>  					  ALIGN(tmp.size, xe_get_default_alignment(fd)),
> -					  vram_if_possible(fd, 0) |
> +					  vram_if_possible(fd, 0),
>  					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	tmp.stride = rect->w * pixel_size;
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 14f38a913..907464273 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1207,8 +1207,8 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
>  			igt_assert(err == 0 || err == -EOPNOTSUPP);
>  		} else if (is_xe_device(fd)) {
>  			fb->gem_handle = xe_bo_create(fd, 0, fb->size,
> -						      vram_if_possible(fd, 0)
> -						      | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +						      vram_if_possible(fd, 0),
> +						      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		} else if (is_vc4_device(fd)) {
>  			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
>  
> @@ -2907,7 +2907,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  
>  		bb_size = ALIGN(bb_size + xe_cs_prefetch_size(dst_fb->fd),
>  				xe_get_default_alignment(dst_fb->fd));
> -		xe_bb = xe_bo_create(dst_fb->fd, 0, bb_size, mem_region);
> +		xe_bb = xe_bo_create(dst_fb->fd, 0, bb_size, mem_region, 0);
>  	}
>  
>  	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index b3afb2230..c9fe744f5 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -958,7 +958,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  
>  		ibb->alignment = alignment;
>  		size = ALIGN(size, ibb->alignment);
> -		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0) |
> +		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>  					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  		/* Limit to 48-bit due to MI_* address limitation */
> @@ -1425,7 +1425,7 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
>  		ibb->handle = gem_create(ibb->fd, ibb->size);
>  	else
>  		ibb->handle = xe_bo_create(ibb->fd, 0, ibb->size,
> -					   vram_if_possible(ibb->fd, 0) |
> +					   vram_if_possible(ibb->fd, 0),
>  					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	/* Reacquire offset for RELOC and SIMPLE */
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 94e6afcd5..1116c978e 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1802,13 +1802,13 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>  	obj->size = size;
>  
>  	if (blt->driver == INTEL_DRIVER_XE) {
> -		uint64_t flags = region;
> +		uint64_t flags = 0;
>  
>  		if (create_mapping && region != system_memory(blt->fd))
>  			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  
>  		size = ALIGN(size, xe_get_default_alignment(blt->fd));
> -		handle = xe_bo_create(blt->fd, 0, size, flags);
> +		handle = xe_bo_create(blt->fd, 0, size, region, flags);
>  	} else {
>  		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
>  							  &size, region) == 0);
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index b9dc0ab96..46eba3fb4 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -923,7 +923,7 @@ static void __intel_buf_init(struct buf_ops *bops,
>  				igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
>  		} else {
>  			size = ALIGN(size, xe_get_default_alignment(bops->fd));
> -			buf->handle = xe_bo_create(bops->fd, 0, size, region);
> +			buf->handle = xe_bo_create(bops->fd, 0, size, region, 0);
>  		}
>  	}
>  
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 1d51eb60f..ace2376bb 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -230,10 +230,10 @@ void xe_vm_destroy(int fd, uint32_t vm)
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
>  }
>  
> -uint16_t __xe_default_cpu_caching_from_flags(int fd, uint32_t flags)
> +uint16_t __xe_default_cpu_caching_from_placement(int fd, uint32_t placement)
>  {
> -	if ((flags & all_memory_regions(fd)) != system_memory(fd) ||
> -	    flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> +	if ((placement & all_memory_regions(fd)) != system_memory(fd) ||
> +	    placement & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>  		/* VRAM placements or scanout should always use WC */
>  		return DRM_XE_GEM_CPU_CACHING_WC;
>  
> @@ -252,12 +252,13 @@ static bool vram_selected(int fd, uint32_t selected_regions)
>  	return false;
>  }
>  
> -static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> -				      uint16_t cpu_caching, uint32_t *handle)
> +static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +				uint32_t flags, uint16_t cpu_caching, uint32_t *handle)
>  {
>  	struct drm_xe_gem_create create = {
>  		.vm_id = vm,
>  		.size = size,
> +		.placement = placement,
>  		.flags = flags,
>  		.cpu_caching = cpu_caching,
>  	};
> @@ -267,7 +268,7 @@ static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t fla
>  	 * In case vram_if_possible returned system_memory,
>  	 * visible VRAM cannot be requested through flags
>  	 */
> -	if (!vram_selected(fd, flags))
> +	if (!vram_selected(fd, placement))
>  		create.flags &= ~DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  
>  	err = igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
> @@ -279,36 +280,36 @@ static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t fla
>  
>  }
>  
> -uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> -			      uint32_t *handle)
> +uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +			uint32_t flags, uint32_t *handle)
>  {
> -	uint16_t cpu_caching = __xe_default_cpu_caching_from_flags(fd, flags);
> +	uint16_t cpu_caching = __xe_default_cpu_caching_from_placement(fd, placement);
>  
> -	return ___xe_bo_create(fd, vm, size, flags, cpu_caching, handle);
> +	return ___xe_bo_create(fd, vm, size, placement, flags, cpu_caching, handle);
>  }
>  
> -uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags)
> +uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +		      uint32_t flags)
>  {
>  	uint32_t handle;
>  
> -	igt_assert_eq(__xe_bo_create(fd, vm, size, flags, &handle), 0);
> +	igt_assert_eq(__xe_bo_create(fd, vm, size, placement, flags, &handle), 0);
>  
>  	return handle;
>  }
>  
> -uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> -				uint16_t cpu_caching, uint32_t *handle)
> +uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +				uint32_t flags, uint16_t cpu_caching, uint32_t *handle)
>  {
> -	return ___xe_bo_create(fd, vm, size, flags, cpu_caching,
> -				     handle);
> +	return ___xe_bo_create(fd, vm, size, placement, flags, cpu_caching, handle);
>  }
>  
> -uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> -			      uint16_t cpu_caching)
> +uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +			      uint32_t flags, uint16_t cpu_caching)
>  {
>  	uint32_t handle;
>  
> -	igt_assert_eq(__xe_bo_create_caching(fd, vm, size, flags,
> +	igt_assert_eq(__xe_bo_create_caching(fd, vm, size, placement, flags,
>  					     cpu_caching, &handle), 0);
>  
>  	return handle;
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 1d1cd2ced..32b34b15a 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -64,14 +64,15 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			    uint32_t bo, struct drm_xe_sync *sync,
>  			    uint32_t num_syncs);
>  void xe_vm_destroy(int fd, uint32_t vm);
> -uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> -			      uint32_t *handle);
> -uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags);
> -uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> -				uint16_t cpu_caching, uint32_t *handle);
> -uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> -			      uint16_t cpu_caching);
> -uint16_t __xe_default_cpu_caching_from_flags(int fd, uint32_t flags);
> +uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +			uint32_t flags, uint32_t *handle);
> +uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +		      uint32_t flags);
> +uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +				uint32_t flags, uint16_t cpu_caching, uint32_t *handle);
> +uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
> +			      uint32_t flags, uint16_t cpu_caching);
> +uint16_t __xe_default_cpu_caching_from_placement(int fd, uint32_t placement);
>  uint32_t xe_exec_queue_create(int fd, uint32_t vm,
>  			  struct drm_xe_engine_class_instance *instance,
>  			  uint64_t ext);
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 760a150db..fa17b46b6 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -408,27 +408,6 @@ static uint64_t __xe_visible_vram_size(int fd, int gt)
>  	return xe_dev->visible_vram_size[gt];
>  }
>  
> -/**
> - * visible_vram_memory:
> - * @fd: xe device fd
> - * @gt: gt id
> - *
> - * Returns vram memory bitmask for xe device @fd and @gt id, with
> - * DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM also set, to ensure that CPU access is
> - * possible.
> - */
> -uint64_t visible_vram_memory(int fd, int gt)
> -{
> -	/*
> -	 * TODO: Keep it backwards compat for now. Fixup once the kernel side
> -	 * has landed.
> -	 */
> -	if (__xe_visible_vram_size(fd, gt))
> -		return vram_memory(fd, gt) | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> -	else
> -		return vram_memory(fd, gt); /* older kernel */
> -}
> -
>  /**
>   * vram_if_possible:
>   * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 4dd0ad573..be92ec5ed 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -80,7 +80,6 @@ unsigned int xe_number_gt(int fd);
>  uint64_t all_memory_regions(int fd);
>  uint64_t system_memory(int fd);
>  uint64_t vram_memory(int fd, int gt);
> -uint64_t visible_vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);
>  struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
>  struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 270b58bf5..91bc6664d 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -220,7 +220,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
>  	}
>  
>  	spin->handle = xe_bo_create(fd, spin->vm, bo_size,
> -				    vram_if_possible(fd, 0) |
> +				    vram_if_possible(fd, 0),
>  				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	xe_spin = xe_bo_map(fd, spin->handle, bo_size);
>  	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
> @@ -299,7 +299,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id) |
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	spin = xe_bo_map(fd, bo, 0x1000);
>  
> diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
> index 72285092a..b2e6770fe 100644
> --- a/tests/intel/api_intel_allocator.c
> +++ b/tests/intel/api_intel_allocator.c
> @@ -471,7 +471,7 @@ static void __simple_allocs(int fd)
>  		size = (rand() % 4 + 1) * 0x1000;
>  		if (is_xe)
>  			handles[i] = xe_bo_create(fd, 0, size,
> -						  system_memory(fd));
> +						  system_memory(fd), 0);
>  		else
>  			handles[i] = gem_create(fd, size);
>  
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 1f48a0d7d..3eb43515a 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -781,7 +781,7 @@ test_size_overflow(data_t *data)
>  		bo = xe_bo_create(data->drm_fd, 0,
>  				  ALIGN(((1ULL << 32) - 4096),
>  					xe_get_default_alignment(data->drm_fd)),
> -				  vram_if_possible(data->drm_fd, 0));
> +				  vram_if_possible(data->drm_fd, 0), 0);
>  	igt_require(bo);
>  
>  	ret = __kms_addfb(data->drm_fd, bo,
> @@ -825,7 +825,7 @@ test_size_offset_overflow(data_t *data)
>  		bo = xe_bo_create(data->drm_fd, 0,
>  				  ALIGN(((1ULL << 32) - 4096),
>  					xe_get_default_alignment(data->drm_fd)),
> -				  vram_if_possible(data->drm_fd, 0));
> +				  vram_if_possible(data->drm_fd, 0), 0);
>  	igt_require(bo);
>  
>  	offsets[0] = 0;
> @@ -889,7 +889,7 @@ test_addfb(data_t *data)
>  	else
>  		bo = xe_bo_create(data->drm_fd, 0,
>  				  ALIGN(size, xe_get_default_alignment(data->drm_fd)),
> -				  vram_if_possible(data->drm_fd, 0));
> +				  vram_if_possible(data->drm_fd, 0), 0);
>  	igt_require(bo);
>  
>  	if (is_i915_device(data->drm_fd) && intel_display_ver(data->devid) < 4)
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 7a99da14e..74bc78477 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -453,7 +453,7 @@ static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plan
>  		bad_ccs_bo = is_i915_device(data->drm_fd) ?
>  				gem_create(data->drm_fd, fb.size) :
>  				xe_bo_create(data->drm_fd, 0, fb.size,
> -					     vram_if_possible(data->drm_fd, 0) |
> +					     vram_if_possible(data->drm_fd, 0),
>  					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		f.handles[ccs_plane] = bad_ccs_bo;
>  	}
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 7198d04a1..77d3020bc 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -103,8 +103,8 @@ static void surf_copy(int xe,
>  
>  	igt_assert(mid->compression);
>  	ccscopy = (uint32_t *) malloc(ccssize);
> -	ccs = xe_bo_create(xe, 0, ccssize, sysmem);
> -	ccs2 = xe_bo_create(xe, 0, ccssize, sysmem);
> +	ccs = xe_bo_create(xe, 0, ccssize, sysmem, 0);
> +	ccs2 = xe_bo_create(xe, 0, ccssize, sysmem, 0);
>  
>  	blt_ctrl_surf_copy_init(xe, &surf);
>  	surf.print_bb = param.print_bb;
> @@ -113,7 +113,7 @@ static void surf_copy(int xe,
>  	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
>  				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
>  	bb_size = xe_get_default_alignment(xe);
> -	bb1 = xe_bo_create(xe, 0, bb_size, sysmem);
> +	bb1 = xe_bo_create(xe, 0, bb_size, sysmem, 0);
>  	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
>  	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
>  	intel_ctx_xe_sync(ctx, true);
> @@ -168,7 +168,7 @@ static void surf_copy(int xe,
>  	blt_set_copy_object(&blt.dst, dst);
>  	blt_set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
> -	bb2 = xe_bo_create(xe, 0, bb_size, sysmem);
> +	bb2 = xe_bo_create(xe, 0, bb_size, sysmem, 0);
>  	blt_set_batch(&blt.bb, bb2, bb_size, sysmem);
>  	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
>  	intel_ctx_xe_sync(ctx, true);
> @@ -299,7 +299,7 @@ static void block_copy(int xe,
>  	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	int result;
>  
> -	bb = xe_bo_create(xe, 0, bb_size, region1);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
>  
>  	if (!blt_uses_extended_block_copy(xe))
>  		pext = NULL;
> @@ -421,7 +421,7 @@ static void block_multicopy(int xe,
>  	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	int result;
>  
> -	bb = xe_bo_create(xe, 0, bb_size, region1);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
>  
>  	if (!blt_uses_extended_block_copy(xe))
>  		pext3 = NULL;
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index cbadf9f5c..d9c059e4d 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -53,7 +53,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	uint32_t bb;
>  	int result;
>  
> -	bb = xe_bo_create(fd, 0, bb_size, region);
> +	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
>  	blt_mem_init(fd, &mem);
>  	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
> @@ -105,7 +105,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	uint32_t bb;
>  	uint8_t *result;
>  
> -	bb = xe_bo_create(fd, 0, bb_size, region);
> +	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  	blt_mem_init(fd, &mem);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
>  			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
> @@ -135,8 +135,8 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
>  	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
>  	intel_ctx_t *ctx;
>  
> -	src_handle = xe_bo_create(fd, 0, bo_size, region);
> -	dst_handle = xe_bo_create(fd, 0, bo_size, region);
> +	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> +	dst_handle = xe_bo_create(fd, 0, bo_size, region, 0);
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>  	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index bb55a15e1..c5097f086 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -18,14 +18,14 @@
>  
>  #define PAGE_SIZE 0x1000
>  
> -static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> +static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>  		       uint32_t *handlep)
>  {
>  	struct drm_xe_gem_create create = {
>  		.vm_id = vm,
>  		.size = size,
> -		.flags = flags,
> -		.cpu_caching = __xe_default_cpu_caching_from_flags(fd, flags),
> +		.cpu_caching = __xe_default_cpu_caching_from_placement(fd, placement),
> +		.placement = placement,
>  	};
>  	int ret = 0;
>  
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index 9318647af..aeb4c4995 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -120,7 +120,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  			xe_get_default_alignment(fd[0]));
>  	for (i = 0; i < n_bo; ++i) {
>  		bo[i] = xe_bo_create(fd[0], 0, bo_size,
> -				     vram_if_possible(fd[0], hwe0->gt_id) |
> +				     vram_if_possible(fd[0], hwe0->gt_id),
>  				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
>  		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 8f737a533..6bca5a6f1 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -85,7 +85,7 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
>  		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
>  		pre_size = info.region_mem[memregion->instance + 1].active;
>  
> -		bo = xe_bo_create(fd, vm, bo_size, region);
> +		bo = xe_bo_create(fd, vm, bo_size, region, 0);
>  		data = xe_bo_map(fd, bo, bo_size);
>  
>  		for (i = 0; i < N_EXEC_QUEUES; i++) {
> @@ -185,7 +185,7 @@ static void test_shared(int xe)
>  		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
>  		pre_size = info.region_mem[memregion->instance + 1].shared;
>  
> -		bo = xe_bo_create(xe, 0, BO_SIZE, region);
> +		bo = xe_bo_create(xe, 0, BO_SIZE, region, 0);
>  
>  		flink.handle = bo;
>  		ret = igt_ioctl(xe, DRM_IOCTL_GEM_FLINK, &flink);
> @@ -232,7 +232,7 @@ static void test_total_resident(int xe)
>  		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
>  		pre_size = info.region_mem[memregion->instance + 1].shared;
>  
> -		handle = xe_bo_create(xe, vm, BO_SIZE, region);
> +		handle = xe_bo_create(xe, vm, BO_SIZE, region, 0);
>  		xe_vm_bind_sync(xe, vm, handle, 0, addr, BO_SIZE);
>  
>  		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index a9d501d5f..436a2be02 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -101,16 +101,19 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  			if (flags & MULTI_VM) {
>  				__bo = bo[i] = xe_bo_create(fd, 0,
>  							    bo_size,
> -							    visible_vram_memory(fd, eci->gt_id));
> +							    vram_memory(fd, eci->gt_id),
> +							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			} else if (flags & THREADED) {
>  				__bo = bo[i] = xe_bo_create(fd, vm,
>  							    bo_size,
> -							    visible_vram_memory(fd, eci->gt_id));
> +							    vram_memory(fd, eci->gt_id),
> +							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			} else {
>  				__bo = bo[i] = xe_bo_create(fd, _vm,
>  							    bo_size,
> -							    visible_vram_memory(fd, eci->gt_id) |
> -							    system_memory(fd));
> +							    vram_memory(fd, eci->gt_id) |
> +							    system_memory(fd),
> +							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			}
>  		} else {
>  			__bo = bo[i % (n_execs / 2)];
> @@ -277,16 +280,19 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>  			if (flags & MULTI_VM) {
>  				__bo = bo[i] = xe_bo_create(fd, 0,
>  							    bo_size,
> -							    visible_vram_memory(fd, eci->gt_id));
> +							    vram_memory(fd, eci->gt_id),
> +							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			} else if (flags & THREADED) {
>  				__bo = bo[i] = xe_bo_create(fd, vm,
>  							    bo_size,
> -							    visible_vram_memory(fd, eci->gt_id));
> +							    vram_memory(fd, eci->gt_id),
> +							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			} else {
>  				__bo = bo[i] = xe_bo_create(fd, _vm,
>  							    bo_size,
> -							    visible_vram_memory(fd, eci->gt_id) |
> -							    system_memory(fd));
> +							    vram_memory(fd, eci->gt_id) |
> +							    system_memory(fd),
> +							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			}
>  		} else {
>  			__bo = bo[i % (n_execs / 2)];
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 35a588521..0c775e5f4 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -82,7 +82,8 @@ static void copy_obj(struct blt_copy_data *blt,
>  	w = src_obj->x2;
>  	h = src_obj->y2;
>  
> -	bb = xe_bo_create(fd, 0, bb_size, visible_vram_memory(fd, 0));
> +	bb = xe_bo_create(fd, 0, bb_size, vram_memory(fd, 0),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	blt->color_depth = CD_32bit;
>  	blt->print_bb = params.print_bb;
> @@ -275,7 +276,7 @@ static void evict_single(int fd, int child, const struct config *config)
>  
>  		if (config->flags & TEST_SIMPLE) {
>  			big_obj = xe_bo_create(fd, vm, kb_left * SZ_1K,
> -					       vram_memory(fd, 0));
> +					       vram_memory(fd, 0), 0);
>  			break;
>  		}
>  
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 388bb6185..fa3d7a338 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -70,7 +70,7 @@ static void test_all_active(int fd, int gt, int class)
>  	bo_size = sizeof(*data) * num_placements;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>  
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
> @@ -225,7 +225,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		}
>  		memset(data, 0, bo_size);
>  	} else {
> -		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
> +		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(fd, bo, bo_size);
>  	}
> @@ -454,7 +454,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  			igt_assert(data);
>  		}
>  	} else {
> -		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
> +		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(fd, bo, bo_size);
>  	}
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index ca287b2e5..23acdd434 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -136,11 +136,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	} else {
>  		uint32_t bo_flags;
>  
> -		bo_flags = vram_if_possible(fd, eci->gt_id) | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		if (flags & DEFER_ALLOC)
>  			bo_flags |= DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING;
>  
> -		bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size, bo_flags);
> +		bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size,
> +				  vram_if_possible(fd, eci->gt_id), bo_flags);
>  		if (!(flags & DEFER_BIND))
>  			data = xe_bo_map(fd, bo, bo_size);
>  	}
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 07a27fd29..98a98256e 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -142,7 +142,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		}
>  	} else {
>  		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> -				  bo_size, vram_if_possible(fd, eci->gt_id) |
> +				  bo_size, vram_if_possible(fd, eci->gt_id),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(fd, bo, bo_size);
>  	}
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index bfd61c4ea..3eb448ef4 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -153,11 +153,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		if (flags & PREFETCH)
>  			bo = xe_bo_create(fd, 0, bo_size,
>  					  all_memory_regions(fd) |
> -					  vram_if_possible(fd, 0) |
> +					  vram_if_possible(fd, 0),
>  					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		else
>  			bo = xe_bo_create(fd, 0, bo_size,
> -					  vram_if_possible(fd, eci->gt_id) |
> +					  vram_if_possible(fd, eci->gt_id),
>  					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(fd, bo, bo_size);
>  	}
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 3affb19ae..d8b8e0355 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -51,7 +51,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>  			xe_get_default_alignment(fd));
>  
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id) |
> +			  vram_if_possible(fd, eci->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  
> @@ -182,7 +182,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
>  
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
> @@ -370,7 +370,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  			xe_get_default_alignment(fd));
>  
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id) | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> @@ -537,7 +538,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  			xe_get_default_alignment(fd));
>  
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id) |
> +			  vram_if_possible(fd, eci->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  	memset(data, 0, bo_size);
> @@ -664,7 +665,7 @@ static void submit_jobs(struct gt_thread_data *t)
>  	uint32_t bo;
>  	uint32_t *data;
>  
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0) |
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  	data[0] = MI_BATCH_BUFFER_END;
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 884183202..9ee5edeb4 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -82,7 +82,7 @@ static void store(int fd)
>  
>  	hw_engine = xe_hw_engine(fd, 1);
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, hw_engine->gt_id) |
> +			  vram_if_possible(fd, hw_engine->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
> @@ -152,7 +152,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	for (i = 0; i < count; i++) {
>  		bo[i] = xe_bo_create(fd, vm, bo_size,
> -				     vram_if_possible(fd, eci->gt_id) |
> +				     vram_if_possible(fd, eci->gt_id),
>  				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
>  		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
> @@ -238,7 +238,7 @@ static void store_all(int fd, int gt, int class)
>  			xe_get_default_alignment(fd));
>  
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, 0) |
> +			  vram_if_possible(fd, 0),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index ebc41dadd..f37fc612a 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -107,7 +107,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		}
>  	} else {
>  		bo = xe_bo_create(fd, vm, bo_size,
> -				  vram_if_possible(fd, gt) |
> +				  vram_if_possible(fd, gt),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(fd, bo, bo_size);
>  	}
> @@ -309,7 +309,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		}
>  	} else {
>  		bo = xe_bo_create(fd, 0, bo_size,
> -				  vram_if_possible(fd, eci->gt_id) |
> +				  vram_if_possible(fd, eci->gt_id),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(fd, bo, bo_size);
>  	}
> @@ -513,7 +513,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		}
>  	} else {
>  		bo = xe_bo_create(fd, vm, bo_size,
> -				  vram_if_possible(fd, eci->gt_id) |
> +				  vram_if_possible(fd, eci->gt_id),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(fd, bo, bo_size);
>  	}
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index 9c69be3ef..655e9a3ea 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -125,7 +125,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>  	uint32_t bb, width = param.width, height = param.height;
>  	int result;
>  
> -	bb = xe_bo_create(xe, 0, bb_size, region1);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
>  
>  	blt_copy_init(xe, &bltinit);
>  	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
> @@ -184,7 +184,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>  	uint32_t width = param.width, height = param.height;
>  	int result;
>  
> -	bb = xe_bo_create(xe, 0, bb_size, region1);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
>  
>  	blt_copy_init(xe, &blt);
>  	src = blt_create_object(&blt, region1, width, height, bpp, 0,
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index 618e9ea77..6663731d9 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -397,7 +397,7 @@ static void create_in_region(struct buf_ops *bops, uint64_t region)
>  		intel_bb_set_debug(ibb, true);
>  
>  	size = xe_min_page_size(xe, system_memory(xe));
> -	handle = xe_bo_create(xe, 0, size, system_memory(xe));
> +	handle = xe_bo_create(xe, 0, size, system_memory(xe), 0);
>  	intel_buf_init_full(bops, handle, &buf,
>  			    width/4, height, 32, 0,
>  			    I915_TILING_NONE, 0,
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 831c7ddda..d5ca21b7a 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -45,14 +45,14 @@
>   * @vram-system:	system vram
>   */
>  static void
> -test_mmap(int fd, uint32_t flags)
> +test_mmap(int fd, uint32_t placement, uint32_t flags)
>  {
>  	uint32_t bo;
>  	void *map;
>  
> -	igt_require_f(flags, "Device doesn't support such memory region\n");
> +	igt_require_f(placement, "Device doesn't support such memory region\n");
>  
> -	bo = xe_bo_create(fd, 0, 4096, flags);
> +	bo = xe_bo_create(fd, 0, 4096, placement, flags);
>  
>  	map = xe_bo_map(fd, bo, 4096);
>  	strcpy(map, "Write some data to the BO!");
> @@ -73,7 +73,7 @@ static void test_bad_flags(int fd)
>  	uint64_t size = xe_get_default_alignment(fd);
>  	struct drm_xe_gem_mmap_offset mmo = {
>  		.handle = xe_bo_create(fd, 0, size,
> -				       vram_if_possible(fd, 0) |
> +				       vram_if_possible(fd, 0),
>  				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
>  		.flags = -1u,
>  	};
> @@ -94,7 +94,7 @@ static void test_bad_extensions(int fd)
>  	struct xe_user_extension ext;
>  	struct drm_xe_gem_mmap_offset mmo = {
>  		.handle = xe_bo_create(fd, 0, size,
> -				       vram_if_possible(fd, 0) |
> +				       vram_if_possible(fd, 0),
>  				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
>  	};
>  
> @@ -116,7 +116,7 @@ static void test_bad_object(int fd)
>  	uint64_t size = xe_get_default_alignment(fd);
>  	struct drm_xe_gem_mmap_offset mmo = {
>  		.handle = xe_bo_create(fd, 0, size,
> -				       vram_if_possible(fd, 0) |
> +				       vram_if_possible(fd, 0),
>  				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
>  	};
>  
> @@ -163,12 +163,14 @@ static void test_small_bar(int fd)
>  
>  	/* 2BIG invalid case */
>  	igt_assert_neq(__xe_bo_create(fd, 0, visible_size + 4096,
> -				      visible_vram_memory(fd, 0), &bo),
> +				      vram_memory(fd, 0),
> +				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				      &bo),
>  		       0);
>  
>  	/* Normal operation */
> -	bo = xe_bo_create(fd, 0, visible_size / 4,
> -			  visible_vram_memory(fd, 0));
> +	bo = xe_bo_create(fd, 0, visible_size / 4, vram_memory(fd, 0),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	mmo = xe_bo_mmap_offset(fd, bo);
>  	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
>  	igt_assert(map != MAP_FAILED);
> @@ -180,8 +182,9 @@ static void test_small_bar(int fd)
>  
>  	/* Normal operation with system memory spilling */
>  	bo = xe_bo_create(fd, 0, visible_size,
> -			  visible_vram_memory(fd, 0) |
> -			  system_memory(fd));
> +			  vram_memory(fd, 0) |
> +			  system_memory(fd),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	mmo = xe_bo_mmap_offset(fd, bo);
>  	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
>  	igt_assert(map != MAP_FAILED);
> @@ -192,8 +195,7 @@ static void test_small_bar(int fd)
>  	gem_close(fd, bo);
>  
>  	/* Bogus operation with SIGBUS */
> -	bo = xe_bo_create(fd, 0, visible_size + 4096,
> -			  vram_memory(fd, 0));
> +	bo = xe_bo_create(fd, 0, visible_size + 4096, vram_memory(fd, 0), 0);
>  	mmo = xe_bo_mmap_offset(fd, bo);
>  	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
>  	igt_assert(map != MAP_FAILED);
> @@ -202,7 +204,7 @@ static void test_small_bar(int fd)
>  	gem_close(fd, bo);
>  }
>  
> -static void assert_caching(int fd, uint64_t flags, uint16_t cpu_caching, bool fail)
> +static void assert_caching(int fd, uint64_t placement, uint16_t cpu_caching, bool fail)
>  {
>  	uint64_t size = xe_get_default_alignment(fd);
>  	uint64_t mmo;
> @@ -210,7 +212,7 @@ static void assert_caching(int fd, uint64_t flags, uint16_t cpu_caching, bool fa
>  	uint32_t *map;
>  	bool ret;
>  
> -	ret = __xe_bo_create_caching(fd, 0, size, flags, cpu_caching, &handle);
> +	ret = __xe_bo_create_caching(fd, 0, size, placement, 0, cpu_caching, &handle);
>  	igt_assert(ret == fail);
>  
>  	if (fail)
> @@ -258,13 +260,15 @@ igt_main
>  		fd = drm_open_driver(DRIVER_XE);
>  
>  	igt_subtest("system")
> -		test_mmap(fd, system_memory(fd));
> +		test_mmap(fd, system_memory(fd), 0);
>  
>  	igt_subtest("vram")
> -		test_mmap(fd, visible_vram_memory(fd, 0));
> +		test_mmap(fd, vram_memory(fd, 0),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	igt_subtest("vram-system")
> -		test_mmap(fd, visible_vram_memory(fd, 0) | system_memory(fd));
> +		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	igt_subtest("bad-flags")
>  		test_bad_flags(fd);
> diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
> index 88ef39783..5e3349247 100644
> --- a/tests/intel/xe_noexec_ping_pong.c
> +++ b/tests/intel/xe_noexec_ping_pong.c
> @@ -71,7 +71,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
>  				  (unsigned int) vm[i]);
>  
>  			bo[i][j] = xe_bo_create(fd, vm[i], bo_size,
> -						vram_memory(fd, 0));
> +						vram_memory(fd, 0), 0);
>  			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
>  				   bo_size, NULL, 0);
>  		}
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 98bd5e471..48a4a0f04 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -82,7 +82,7 @@ static void pat_index_all(int fd)
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  
> -	bo = xe_bo_create_caching(fd, 0, size, all_memory_regions(fd),
> +	bo = xe_bo_create_caching(fd, 0, size, all_memory_regions(fd), 0,
>  				  DRM_XE_GEM_CPU_CACHING_WC);
>  
>  	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
> @@ -131,7 +131,7 @@ static void pat_index_all(int fd)
>  
>  	/* coh_none is never allowed with cpu_caching WB. */
>  
> -	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd),
> +	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd), 0,
>  				  DRM_XE_GEM_CPU_CACHING_WB);
>  
>  	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
> @@ -239,7 +239,7 @@ static void pat_index_blt(struct xe_pat_param *p)
>  					 p->size->alignment);
>  
>  	bb_size = xe_get_default_alignment(fd);
> -	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd));
> +	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
>  
>  	size = width * height * bpp / 8;
>  	stride = width * 4;
> @@ -554,7 +554,7 @@ static void prime_self_import_coh(void)
>  	fd1 = drm_open_driver(DRIVER_XE);
>  	fd2 = drm_open_driver(DRIVER_XE);
>  
> -	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1),
> +	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1), 0,
>  					  DRM_XE_GEM_CPU_CACHING_WC);
>  
>  	dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
> @@ -587,7 +587,7 @@ static void prime_self_import_coh(void)
>  	 * object as the dst.
>  	 */
>  
> -	src_handle = xe_bo_create_caching(fd2, 0, size, system_memory(fd2),
> +	src_handle = xe_bo_create_caching(fd2, 0, size, system_memory(fd2), 0,
>  					  DRM_XE_GEM_CPU_CACHING_WB);
>  
>  	p.fd = fd2;
> @@ -672,7 +672,7 @@ static void prime_external_import_coh(void)
>  	 * coherent PAT index, where the imported object is the dst.
>  	 */
>  
> -	src_handle = xe_bo_create_caching(fd2, 0, size, system_memory(fd2),
> +	src_handle = xe_bo_create_caching(fd2, 0, size, system_memory(fd2), 0,
>  					  DRM_XE_GEM_CPU_CACHING_WB);
>  
>  	p.fd = fd2;
> @@ -821,7 +821,7 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
>  	else
>  		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>  
> -	return xe_bo_create_caching(fd, 0, size, r | flags, cpu_caching);
> +	return xe_bo_create_caching(fd, 0, size, r, flags, cpu_caching);
>  }
>  
>  /**
> diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
> index 9f1627727..e825ff5a3 100644
> --- a/tests/intel/xe_perf_pmu.c
> +++ b/tests/intel/xe_perf_pmu.c
> @@ -103,7 +103,7 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
>  
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  
>  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> @@ -223,7 +223,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
>  	bo_size = sizeof(*data) * num_placements;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>  
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt));
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt), 0);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	for (i = 0; i < num_placements; i++) {
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 9fd3527f7..2e5c61b59 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -272,7 +272,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
>  
>  	bo = xe_bo_create(device.fd_xe, vm, bo_size,
> -			  vram_if_possible(device.fd_xe, eci->gt_id) |
> +			  vram_if_possible(device.fd_xe, eci->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(device.fd_xe, bo, bo_size);
>  
> @@ -381,15 +381,15 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  		.data = 0,
>  	};
>  	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
> -	uint32_t bo, flags;
> +	uint32_t bo, placement;
>  	int handle, i;
>  	bool active;
>  	void *map;
>  
>  	igt_require(xe_has_vram(device.fd_xe));
>  
> -	flags = vram_memory(device.fd_xe, 0);
> -	igt_require_f(flags, "Device doesn't support vram memory region\n");
> +	placement = vram_memory(device.fd_xe, 0);
> +	igt_require_f(placement, "Device doesn't support vram memory region\n");
>  
>  	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  	igt_assert_neq(query.size, 0);
> @@ -410,7 +410,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	threshold = vram_used_mb + (SIZE / 1024 /1024);
>  	igt_require(threshold < vram_total_mb);
>  
> -	bo = xe_bo_create(device.fd_xe, 0, SIZE, flags);
> +	bo = xe_bo_create(device.fd_xe, 0, SIZE, placement, 0);
>  	map = xe_bo_map(device.fd_xe, bo, SIZE);
>  	memset(map, 0, SIZE);
>  	munmap(map, SIZE);
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 40a1693b8..6c9a95429 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -101,7 +101,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>  	bo_size = xe_get_default_alignment(fd);
>  
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, hwe->gt_id) |
> +			  vram_if_possible(fd, hwe->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  	syncobj = syncobj_create(fd, 0);
> diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
> index 2c2f2898c..9a263d326 100644
> --- a/tests/intel/xe_prime_self_import.c
> +++ b/tests/intel/xe_prime_self_import.c
> @@ -105,7 +105,7 @@ static void test_with_fd_dup(void)
>  	fd1 = drm_open_driver(DRIVER_XE);
>  	fd2 = drm_open_driver(DRIVER_XE);
>  
> -	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
> +	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
>  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
> @@ -139,9 +139,9 @@ static void test_with_two_bos(void)
>  	fd1 = drm_open_driver(DRIVER_XE);
>  	fd2 = drm_open_driver(DRIVER_XE);
>  
> -	handle1 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
> +	handle1 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
>  			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	handle2 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
> +	handle2 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
>  			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
> @@ -178,7 +178,7 @@ static void test_with_one_bo_two_files(void)
>  	fd2 = drm_open_driver(DRIVER_XE);
>  
>  	handle_orig = xe_bo_create(fd1, 0, bo_size,
> -				   vram_if_possible(fd1, 0) |
> +				   vram_if_possible(fd1, 0),
>  				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
>  
> @@ -211,7 +211,7 @@ static void test_with_one_bo(void)
>  	fd1 = drm_open_driver(DRIVER_XE);
>  	fd2 = drm_open_driver(DRIVER_XE);
>  
> -	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
> +	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
>  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	dma_buf_fd = prime_handle_to_fd(fd1, handle);
> @@ -299,7 +299,7 @@ static void *thread_fn_reimport_vs_close(void *p)
>  	fds[0] = drm_open_driver(DRIVER_XE);
>  
>  	handle = xe_bo_create(fds[0], 0, bo_size,
> -			      vram_if_possible(fds[0], 0) |
> +			      vram_if_possible(fds[0], 0),
>  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	fds[1] = prime_handle_to_fd(fds[0], handle);
> @@ -343,7 +343,7 @@ static void *thread_fn_export_vs_close(void *p)
>  	igt_until_timeout(g_time_out) {
>  		/* We want to race gem close against prime export on handle one.*/
>  		handle = xe_bo_create(fd, 0, bo_size,
> -				      vram_if_possible(fd, 0) |
> +				      vram_if_possible(fd, 0),
>  				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		if (handle != 1)
>  			gem_close(fd, handle);
> @@ -441,7 +441,7 @@ static void test_llseek_size(void)
>  		int bufsz = xe_get_default_alignment(fd) << i;
>  
>  		handle = xe_bo_create(fd, 0, bufsz,
> -				      vram_if_possible(fd, 0) |
> +				      vram_if_possible(fd, 0),
>  				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		dma_buf_fd = prime_handle_to_fd(fd, handle);
>  
> @@ -471,7 +471,7 @@ static void test_llseek_bad(void)
>  	fd = drm_open_driver(DRIVER_XE);
>  
>  	handle = xe_bo_create(fd, 0, bo_size,
> -			      vram_if_possible(fd, 0) |
> +			      vram_if_possible(fd, 0),
>  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	dma_buf_fd = prime_handle_to_fd(fd, handle);
>  
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index c1b161f9c..6abe700da 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -169,7 +169,7 @@ static void xe_spin_fixed_duration(int fd)
>  	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0));
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
>  							ALLOC_STRATEGY_LOW_TO_HIGH);
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index bfdeb4543..749e2a51d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -53,7 +53,7 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
>  	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
>  			   xe_get_default_alignment(fd));
>  	batch_bo = xe_bo_create(fd, vm, batch_size,
> -				vram_if_possible(fd, 0) |
> +				vram_if_possible(fd, 0),
>  				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	batch_map = xe_bo_map(fd, batch_bo, batch_size);
>  
> @@ -118,7 +118,7 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
>  		vms = malloc(sizeof(*vms) * n_addrs);
>  		igt_assert(vms);
>  	}
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0) |
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	map = xe_bo_map(fd, bo, bo_size);
>  	memset(map, 0, bo_size);
> @@ -270,7 +270,7 @@ static void test_partial_unbinds(int fd)
>  {
>  	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>  	size_t bo_size = 3 * xe_get_default_alignment(fd);
> -	uint32_t bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0));
> +	uint32_t bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>  	uint64_t unbind_size = bo_size / 3;
>  	uint64_t addr = 0x1a0000;
>  
> @@ -319,7 +319,7 @@ static void unbind_all(int fd, int n_vmas)
>  	};
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0));
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>  
>  	for (i = 0; i < n_vmas; ++i)
>  		xe_vm_bind_async(fd, vm, 0, bo, 0, addr + i * bo_size,
> @@ -426,7 +426,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  
>  	for (i = 0; i < n_bo; ++i) {
>  		bo[i] = xe_bo_create(fd, vm, bo_size,
> -				     vram_if_possible(fd, eci->gt_id) |
> +				     vram_if_possible(fd, eci->gt_id),
>  				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data[i] = xe_bo_map(fd, bo[i], bo_size);
>  	}
> @@ -606,7 +606,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id) |
> +			  vram_if_possible(fd, eci->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
> @@ -788,7 +788,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  			xe_get_default_alignment(fd));
>  
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id) |
> +			  vram_if_possible(fd, eci->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
> @@ -988,7 +988,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  			    xe_visible_vram_size(fd, 0));
>  
>  		bo = xe_bo_create(fd, vm, bo_size,
> -				  vram_if_possible(fd, eci->gt_id) |
> +				  vram_if_possible(fd, eci->gt_id),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		map = xe_bo_map(fd, bo, bo_size);
>  	}
> @@ -1283,7 +1283,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  		igt_assert(map != MAP_FAILED);
>  	} else {
>  		bo = xe_bo_create(fd, vm, bo_size,
> -				  vram_if_possible(fd, eci->gt_id) |
> +				  vram_if_possible(fd, eci->gt_id),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		map = xe_bo_map(fd, bo, bo_size);
>  	}
> @@ -1587,9 +1587,9 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  		igt_assert(map0 != MAP_FAILED);
>  		igt_assert(map1 != MAP_FAILED);
>  	} else {
> -		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
> +		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
>  		map0 = xe_bo_map(fd, bo0, bo_size);
> -		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
> +		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
>  		map1 = xe_bo_map(fd, bo1, bo_size);
>  	}
>  	memset(map0, 0, bo_size);
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index eaef0185f..0169f4b9c 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -22,8 +22,6 @@
>   * Description: Test waitfences functionality
>   */
>  
> -#define MY_FLAG	vram_if_possible(fd, 0)
> -
>  uint64_t wait_fence = 0;
>  
>  static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> @@ -96,19 +94,19 @@ waitfence(int fd, enum waittype wt)
>  	int64_t timeout;
>  
>  	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> -	bo_1 = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
> +	bo_1 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
> -	bo_2 = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
> +	bo_2 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_2, 0, 0xc0000000, 0x40000, 2);
> -	bo_3 = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
> +	bo_3 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_3, 0, 0x180000000, 0x40000, 3);
> -	bo_4 = xe_bo_create(fd, vm, 0x10000, MY_FLAG);
> +	bo_4 = xe_bo_create(fd, vm, 0x10000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_4, 0, 0x140000000, 0x10000, 4);
> -	bo_5 = xe_bo_create(fd, vm, 0x100000, MY_FLAG);
> +	bo_5 = xe_bo_create(fd, vm, 0x100000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_5, 0, 0x100000000, 0x100000, 5);
> -	bo_6 = xe_bo_create(fd, vm, 0x1c0000, MY_FLAG);
> +	bo_6 = xe_bo_create(fd, vm, 0x1c0000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_6, 0, 0xc0040000, 0x1c0000, 6);
> -	bo_7 = xe_bo_create(fd, vm, 0x10000, MY_FLAG);
> +	bo_7 = xe_bo_create(fd, vm, 0x10000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
>  
>  	if (wt == RELTIME) {
> @@ -173,7 +171,7 @@ invalid_flag(int fd)
>  
>  	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>  
> -	bo = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
> +	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  
>  	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
>  
> @@ -198,7 +196,7 @@ invalid_ops(int fd)
>  
>  	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>  
> -	bo = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
> +	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  
>  	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
>  
> @@ -223,7 +221,7 @@ invalid_engine(int fd)
>  
>  	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>  
> -	bo = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
> +	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  
>  	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
>  
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 1e34eaa54..41d36732a 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -307,7 +307,7 @@ static void invalid_tests(int fd)
>  			handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
>  		} else {
>  			igt_require(xe_has_vram(fd));
> -			handle = xe_bo_create(fd, 0, size, system_memory(fd));
> +			handle = xe_bo_create(fd, 0, size, system_memory(fd), 0);
>  		}
>  
>  		f.handles[0] = handle;
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index 2d93a032d..bb9679bc9 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -210,7 +210,7 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
>  	if (is_i915_device(fd))
>  		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
>  	else
> -		add.handles[0] = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0));
> +		add.handles[0] = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0), 0);
>  	igt_require(add.handles[0] != 0);
>  
>  	if (!HAS_FLATCCS(devid))
> -- 
> 2.34.1
> 
