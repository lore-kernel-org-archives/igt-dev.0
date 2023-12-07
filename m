Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A995A10E977
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 19:59:51 +0000 (UTC)
Date: Thu, 7 Dec 2023 14:59:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [igt-dev] [RFC PATCH 3/3] drm-uapi/xe: Uniform async vs sync
 handling
Message-ID: <ZXIkKY6_faWn3z2K@intel.com>
References: <20231207060351.438855-1-matthew.brost@intel.com>
 <20231207060351.438855-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207060351.438855-4-matthew.brost@intel.com>
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

On Wed, Dec 06, 2023 at 10:03:51PM -0800, Matthew Brost wrote:
> Align with commit ("drm/xe/uapi: Uniform async vs sync handling")
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  benchmarks/gem_wsim.c                | 13 +++---
>  include/drm-uapi/xe_drm.h            | 70 +++++++++++++++++-----------
>  lib/igt_fb.c                         |  2 +-
>  lib/intel_batchbuffer.c              |  7 ++-
>  lib/intel_compute.c                  |  2 +-
>  lib/intel_ctx.c                      |  4 +-
>  lib/xe/xe_ioctl.c                    | 57 +++++++++-------------
>  lib/xe/xe_ioctl.h                    |  9 +---
>  lib/xe/xe_query.c                    |  3 +-
>  lib/xe/xe_spin.c                     |  8 ++--
>  lib/xe/xe_util.c                     |  4 +-
>  tests/intel/xe_access_counter.c      |  2 +-
>  tests/intel/xe_ccs.c                 |  4 +-
>  tests/intel/xe_copy_basic.c          |  2 +-
>  tests/intel/xe_create.c              |  6 +--
>  tests/intel/xe_dma_buf_sync.c        |  4 +-
>  tests/intel/xe_drm_fdinfo.c          |  8 ++--
>  tests/intel/xe_evict.c               | 37 +++++++--------
>  tests/intel/xe_evict_ccs.c           |  2 +-
>  tests/intel/xe_exec_balancer.c       | 19 ++++----
>  tests/intel/xe_exec_basic.c          | 16 +++----
>  tests/intel/xe_exec_compute_mode.c   | 11 ++---
>  tests/intel/xe_exec_fault_mode.c     |  9 ++--
>  tests/intel/xe_exec_queue_property.c |  2 +-
>  tests/intel/xe_exec_reset.c          | 27 +++++------
>  tests/intel/xe_exec_store.c          | 18 +++----
>  tests/intel/xe_exec_threads.c        | 26 +++++------
>  tests/intel/xe_exercise_blt.c        |  2 +-
>  tests/intel/xe_huc_copy.c            |  2 +-
>  tests/intel/xe_intel_bb.c            |  2 +-
>  tests/intel/xe_noexec_ping_pong.c    |  6 +--
>  tests/intel/xe_pat.c                 |  4 +-
>  tests/intel/xe_perf_pmu.c            | 12 ++---
>  tests/intel/xe_pm.c                  |  6 +--
>  tests/intel/xe_pm_residency.c        |  4 +-
>  tests/intel/xe_spin_batch.c          |  4 +-
>  tests/intel/xe_vm.c                  | 62 ++++++++++++------------
>  tests/intel/xe_waitfence.c           |  8 ++--
>  38 files changed, 232 insertions(+), 252 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index e937e10279..9146149e87 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1760,7 +1760,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  	w->xe.exec.exec_queue_id = eq->id;
>  	w->xe.exec.num_batch_buffer = 1;
>  	/* always at least one out fence */
> -	w->xe.exec.num_syncs = 1;
> +	w->xe.exec.syncs.num_syncs = 1;
>  	/* count syncs */
>  	for_each_dep(dep, w->data_deps) {
>  		int dep_idx = w->idx + dep->target;
> @@ -1768,7 +1768,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
>  		igt_assert(wrk->steps[dep_idx].type == BATCH);
>  
> -		w->xe.exec.num_syncs++;
> +		w->xe.exec.syncs.num_syncs++;
>  	}
>  	for_each_dep(dep, w->fence_deps) {
>  		int dep_idx = w->idx + dep->target;
> @@ -1777,9 +1777,9 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  		igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
>  			   wrk->steps[dep_idx].type == BATCH);
>  
> -		w->xe.exec.num_syncs++;
> +		w->xe.exec.syncs.num_syncs++;
>  	}
> -	w->xe.syncs = calloc(w->xe.exec.num_syncs, sizeof(*w->xe.syncs));
> +	w->xe.syncs = calloc(w->xe.exec.syncs.num_syncs, sizeof(*w->xe.syncs));
>  	/* fill syncs */
>  	i = 0;
>  	/* out fence */
> @@ -1801,7 +1801,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
>  		w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>  	}
> -	w->xe.exec.syncs = to_user_pointer(w->xe.syncs);
> +	w->xe.exec.syncs.syncs = to_user_pointer(w->xe.syncs);
>  }
>  
>  static bool set_priority(uint32_t ctx_id, int prio)
> @@ -2037,8 +2037,7 @@ static void xe_vm_create_(struct xe_vm *vm)
>  	uint32_t flags = 0;
>  
>  	if (vm->compute_mode)
> -		flags |= DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -			 DRM_XE_VM_CREATE_FLAG_LR_MODE;
> +		flags |= DRM_XE_VM_CREATE_FLAG_LR_MODE;
>  
>  	vm->id = xe_vm_create(fd, flags, 0);
>  }
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 590f7b7af4..fd8172fe2d 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _XE_DRM_H_
> -#define _XE_DRM_H_
> +#ifndef _UAPI_XE_DRM_H_
> +#define _UAPI_XE_DRM_H_
>  
>  #include "drm.h"
>  
> @@ -39,7 +39,7 @@ extern "C" {
>   * redefine the interface more easily than an ever growing struct of
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
> - * the boundary with pointers encapsulated inside u64.
> + * the __user boundary with pointers encapsulated inside u64.

Please do not copy the header directly.
Instead do something like:
make headers_install  INSTALL_HDR_PATH=/tmp/blah
cp /tmp/blah/include/drm/xe_drm.h ./include/drm-uapi/xe_drm.h

with this fixed,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>   *
>   * Example chaining:
>   *
> @@ -141,8 +141,7 @@ struct drm_xe_engine_class_instance {
>  	 * Kernel only classes (not actual hardware engine class). Used for
>  	 * creating ordered queues of VM bind operations.
>  	 */
> -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
> -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>  	__u16 engine_class;
>  
>  	__u16 engine_instance;
> @@ -660,7 +659,6 @@ struct drm_xe_vm_create {
>  	 * still enable recoverable pagefaults if supported by the device.
>  	 */
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
> -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
>  	/*
>  	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
>  	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> @@ -668,7 +666,7 @@ struct drm_xe_vm_create {
>  	 * The xe driver internally uses recoverable pagefaults to implement
>  	 * this.
>  	 */
> -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
> +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
>  	/** @flags: Flags */
>  	__u32 flags;
>  
> @@ -736,6 +734,12 @@ struct drm_xe_vm_bind_op {
>  	 *
>  	 * Note: For userptr and externally imported dma-buf the kernel expects
>  	 * either 1WAY or 2WAY for the @pat_index.
> +	 *
> +	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD restrictions
> +	 * on the @pat_index. For such mappings there is no actual memory being
> +	 * mapped (the address in the PTE is invalid), so the various PAT memory
> +	 * attributes likely do not apply.  Simply leaving as zero is one
> +	 * option (still a valid pat_index).
>  	 */
>  	__u16 pat_index;
>  
> @@ -770,12 +774,11 @@ struct drm_xe_vm_bind_op {
>  	__u32 op;
>  
>  #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
>  	 * than deferring the MAP to the page fault handler.
>  	 */
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  	/*
>  	 * When the NULL flag is set, the page tables are setup with a special
>  	 * bit which indicates writes are dropped and all reads return zero.  In
> @@ -783,7 +786,7 @@ struct drm_xe_vm_bind_op {
>  	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
>  	 * intended to implement VK sparse bindings.
>  	 */
> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> @@ -801,6 +804,27 @@ struct drm_xe_vm_bind_op {
>  	__u64 reserved[3];
>  };
>  
> +/**
> + * struct drm_xe_syncs - In / out syncs for IOCTLs.
> + */
> +struct drm_xe_syncs {
> +	/** @num_syncs: amount of syncs to wait on */
> +	__u32 num_syncs;
> +
> +	/*
> +	 * Block in IOCTL until operation complete, num_syncs MBZ if set.
> +	 */
> +#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> +	/** @flags: Sync flags */
> +	__u32 flags;
> +
> +	/** @syncs: pointer to struct drm_xe_sync array */
> +	__u64 syncs;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  struct drm_xe_vm_bind {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -832,14 +856,8 @@ struct drm_xe_vm_bind {
>  		__u64 vector_of_binds;
>  	};
>  
> -	/** @pad: MBZ */
> -	__u32 pad2;
> -
> -	/** @num_syncs: amount of syncs to wait on */
> -	__u32 num_syncs;
> -
> -	/** @syncs: pointer to struct drm_xe_sync array */
> -	__u64 syncs;
> +	/** @syncs: syncs for bind */
> +	struct drm_xe_syncs syncs;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -968,14 +986,14 @@ struct drm_xe_exec {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	/** @exec_queue_id: Exec queue ID for the batch buffer */
>  	__u32 exec_queue_id;
>  
> -	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> -	__u32 num_syncs;
> -
> -	/** @syncs: Pointer to struct drm_xe_sync array. */
> -	__u64 syncs;
> +	/** @syncs: syncs for exec */
> +	struct drm_xe_syncs syncs;
>  
>  	/**
>  	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> @@ -989,8 +1007,8 @@ struct drm_xe_exec {
>  	 */
>  	__u16 num_batch_buffer;
>  
> -	/** @pad: MBZ */
> -	__u16 pad[3];
> +	/** @pad2: MBZ */
> +	__u16 pad2[3];
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -1117,4 +1135,4 @@ struct drm_xe_wait_user_fence {
>  }
>  #endif
>  
> -#endif /* _XE_DRM_H_ */
> +#endif /* _UAPI_XE_DRM_H_ */
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 907464273c..68abe9169e 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2896,7 +2896,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  							  &bb_size,
>  							  mem_region) == 0);
>  	} else if (is_xe) {
> -		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +		vm = xe_vm_create(dst_fb->fd, 0, 0);
>  		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
>  		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
>  		mem_region = vram_if_possible(dst_fb->fd, 0);
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 472c881298..b790d3ed9d 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -967,7 +967,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  
>  		if (!vm) {
>  			igt_assert_f(!ctx, "No vm provided for engine");
> -			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +			vm = xe_vm_create(fd, 0, 0);
>  		}
>  
>  		ibb->uses_full_ppgtt = true;
> @@ -1347,9 +1347,8 @@ static void __unbind_xe_objects(struct intel_bb *ibb)
>  	if (ibb->num_objects > 1) {
>  		struct drm_xe_vm_bind_op *bind_ops;
>  		uint32_t op = DRM_XE_VM_BIND_OP_UNMAP;
> -		uint32_t flags = DRM_XE_VM_BIND_FLAG_ASYNC;
>  
> -		bind_ops = xe_alloc_bind_ops(ibb, op, flags, 0);
> +		bind_ops = xe_alloc_bind_ops(ibb, op, 0, 0);
>  		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
>  				 ibb->num_objects, syncs, 2);
>  		free(bind_ops);
> @@ -2395,7 +2394,7 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>  
>  	syncs[0].handle = syncobj_create(ibb->fd, 0);
>  	if (ibb->num_objects > 1) {
> -		bind_ops = xe_alloc_bind_ops(ibb, DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_ASYNC, 0);
> +		bind_ops = xe_alloc_bind_ops(ibb, DRM_XE_VM_BIND_OP_MAP, 0, 0);
>  		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
>  				 ibb->num_objects, syncs, 1);
>  		free(bind_ops);
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 0beab471b5..b3189db2f7 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -82,7 +82,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv)
>  		else
>  			engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
>  
> -		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +		execenv->vm = xe_vm_create(fd, 0, 0);
>  		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
>  								 engine_class);
>  	}
> diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
> index b43dd63919..0221a1d6fd 100644
> --- a/lib/intel_ctx.c
> +++ b/lib/intel_ctx.c
> @@ -428,8 +428,8 @@ int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offse
>  	};
>  	struct drm_xe_exec exec = {
>  		.exec_queue_id = ctx->exec_queue,
> -		.syncs = (uintptr_t)syncs,
> -		.num_syncs = 2,
> +		.syncs.syncs = (uintptr_t)syncs,
> +		.syncs.num_syncs = 2,
>  		.address = bb_offset,
>  		.num_batch_buffer = 1,
>  	};
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 761e91eb3a..cd3880cdc5 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -68,7 +68,7 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			    uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, bo, 0, 0, 0,
> -			    DRM_XE_VM_BIND_OP_UNMAP_ALL, DRM_XE_VM_BIND_FLAG_ASYNC,
> +			    DRM_XE_VM_BIND_OP_UNMAP_ALL, 0,
>  			    sync, num_syncs, 0, 0);
>  }
>  
> @@ -81,8 +81,8 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
>  		.vm_id = vm,
>  		.num_binds = num_bind,
>  		.vector_of_binds = (uintptr_t)bind_ops,
> -		.num_syncs = num_syncs,
> -		.syncs = (uintptr_t)sync,
> +		.syncs.num_syncs = num_syncs,
> +		.syncs.syncs = (uintptr_t)sync,
>  		.exec_queue_id = exec_queue,
>  	};
>  
> @@ -106,8 +106,10 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		.bind.op = op,
>  		.bind.flags = flags,
>  		.bind.prefetch_mem_region_instance = prefetch_region,
> -		.num_syncs = num_syncs,
> -		.syncs = (uintptr_t)sync,
> +		.syncs.num_syncs = num_syncs,
> +		.syncs.syncs = (uintptr_t)sync,
> +		.syncs.flags = num_syncs == 0 ?
> +			DRM_XE_SYNCS_FLAG_WAIT_FOR_OP : 0,
>  		.exec_queue_id = exec_queue,
>  		.bind.pat_index = (pat_index == DEFAULT_PAT_INDEX) ?
>  			intel_get_pat_idx_wb(fd) : pat_index,
> @@ -129,29 +131,13 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  				   DEFAULT_PAT_INDEX, ext), 0);
>  }
>  
> -void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> -		uint64_t addr, uint64_t size,
> -		struct drm_xe_sync *sync, uint32_t num_syncs)
> -{
> -	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
> -			    DRM_XE_VM_BIND_OP_MAP, 0, sync, num_syncs, 0, 0);
> -}
> -
> -void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
> -		  uint64_t addr, uint64_t size,
> -		  struct drm_xe_sync *sync, uint32_t num_syncs)
> -{
> -	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
> -			    DRM_XE_VM_BIND_OP_UNMAP, 0, sync, num_syncs, 0, 0);
> -}
> -
>  void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,
>  			  uint64_t addr, uint64_t size,
>  			  struct drm_xe_sync *sync, uint32_t num_syncs,
>  			  uint32_t region)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
> -			    DRM_XE_VM_BIND_OP_PREFETCH, DRM_XE_VM_BIND_FLAG_ASYNC,
> +			    DRM_XE_VM_BIND_OP_PREFETCH, 0,
>  			    sync, num_syncs, region, 0);
>  }
>  
> @@ -160,7 +146,7 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		      struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
> -			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_ASYNC, sync,
> +			    DRM_XE_VM_BIND_OP_MAP, 0, sync,
>  			    num_syncs, 0, 0);
>  }
>  
> @@ -169,8 +155,10 @@ void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
>  {
>  	struct drm_xe_vm_bind bind = {
>  		.vm_id = vm,
> -		.num_syncs = num_syncs,
> -		.syncs = (uintptr_t)sync,
> +		.syncs.num_syncs = num_syncs,
> +		.syncs.syncs = (uintptr_t)sync,
> +		.syncs.flags = num_syncs == 0 ?
> +			DRM_XE_SYNCS_FLAG_WAIT_FOR_OP : 0,
>  		.exec_queue_id = exec_queue,
>  	};
>  
> @@ -183,7 +171,7 @@ void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t b
>  			    uint32_t flags)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
> -			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_ASYNC | flags,
> +			    DRM_XE_VM_BIND_OP_MAP, flags,
>  			    sync, num_syncs, 0, 0);
>  }
>  
> @@ -192,7 +180,7 @@ void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			      struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
> -			    DRM_XE_VM_BIND_OP_MAP_USERPTR, DRM_XE_VM_BIND_FLAG_ASYNC,
> +			    DRM_XE_VM_BIND_OP_MAP_USERPTR, 0,
>  			    sync, num_syncs, 0, 0);
>  }
>  
> @@ -202,8 +190,8 @@ void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t exec_queue,
>  				    uint32_t num_syncs, uint32_t flags)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
> -			    DRM_XE_VM_BIND_OP_MAP_USERPTR, DRM_XE_VM_BIND_FLAG_ASYNC |
> -			    flags, sync, num_syncs, 0, 0);
> +			    DRM_XE_VM_BIND_OP_MAP_USERPTR, flags,
> +			    sync, num_syncs, 0, 0);
>  }
>  
>  void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
> @@ -211,7 +199,7 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
> -			    DRM_XE_VM_BIND_OP_UNMAP, DRM_XE_VM_BIND_FLAG_ASYNC, sync,
> +			    DRM_XE_VM_BIND_OP_UNMAP, 0, sync,
>  			    num_syncs, 0, 0);
>  }
>  
> @@ -328,11 +316,10 @@ uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t place
>  	return handle;
>  }
>  
> -uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async)
> +uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext)
>  {
>  	struct drm_xe_engine_class_instance instance = {
> -		.engine_class = async ? DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC :
> -			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
> +		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
>  	};
>  	struct drm_xe_exec_queue_create create = {
>  		.extensions = ext,
> @@ -447,8 +434,8 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
>  {
>  	struct drm_xe_exec exec = {
>  		.exec_queue_id = exec_queue,
> -		.syncs = (uintptr_t)sync,
> -		.num_syncs = num_syncs,
> +		.syncs.syncs = (uintptr_t)sync,
> +		.syncs.num_syncs = num_syncs,
>  		.address = addr,
>  		.num_batch_buffer = 1,
>  	};
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index a302418544..b2806a680a 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -25,12 +25,6 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			  uint64_t offset, uint64_t addr, uint64_t size,
>  			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
>  			  uint32_t num_syncs, uint32_t prefetch_region, uint64_t ext);
> -void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> -		uint64_t addr, uint64_t size,
> -		struct drm_xe_sync *sync, uint32_t num_syncs);
> -void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
> -		  uint64_t addr, uint64_t size,
> -		  struct drm_xe_sync *sync, uint32_t num_syncs);
>  void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			  uint64_t offset, uint64_t addr, uint64_t size,
>  			  struct drm_xe_sync *sync, uint32_t num_syncs,
> @@ -78,8 +72,7 @@ uint16_t __xe_default_cpu_caching_from_placement(int fd, uint32_t placement);
>  uint32_t xe_exec_queue_create(int fd, uint32_t vm,
>  			  struct drm_xe_engine_class_instance *instance,
>  			  uint64_t ext);
> -uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext,
> -				   bool async);
> +uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
>  uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
>  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
>  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index fa2b490794..2bccdb1661 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -311,8 +311,7 @@ bool xe_supports_faults(int fd)
>  	bool supports_faults;
>  
>  	struct drm_xe_vm_create create = {
> -		.flags = DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> +		.flags = DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>  	};
>  
>  	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 243e970475..b478f40fc5 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -195,8 +195,8 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(&sync),
>  	};
>  
>  	igt_assert(ahnd);
> @@ -293,8 +293,8 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(&sync),
>  	};
>  
>  	vm = xe_vm_create(fd, 0, 0);
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index ba8eece71f..e4c97c3a65 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -118,7 +118,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(int xe,
>  {
>  	struct drm_xe_vm_bind_op *bind_ops, *ops;
>  	struct xe_object *obj;
> -	uint32_t num_objects = 0, i = 0, op, flags;
> +	uint32_t num_objects = 0, i = 0, op, flags = 0;
>  
>  	igt_list_for_each_entry(obj, obj_list, link)
>  		num_objects++;
> @@ -137,11 +137,9 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(int xe,
>  
>  		if (obj->bind_op == XE_OBJECT_BIND) {
>  			op = DRM_XE_VM_BIND_OP_MAP;
> -			flags = DRM_XE_VM_BIND_FLAG_ASYNC;
>  			ops->obj = obj->handle;
>  		} else {
>  			op = DRM_XE_VM_BIND_OP_UNMAP;
> -			flags = DRM_XE_VM_BIND_FLAG_ASYNC;
>  		}
>  
>  		ops->op = op;
> diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
> index 8966bfc9c8..91367f5606 100644
> --- a/tests/intel/xe_access_counter.c
> +++ b/tests/intel/xe_access_counter.c
> @@ -39,7 +39,7 @@ igt_main
>  
>  	igt_subtest("invalid-param") {
>  		struct drm_xe_engine_class_instance instance = {
> -			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
> +			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
>  		 };
>  
>  		int ret;
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 77d3020bc7..e9df5c2ef1 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -345,7 +345,7 @@ static void block_copy(int xe,
>  		uint32_t vm, exec_queue;
>  
>  		if (config->new_ctx) {
> -			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +			vm = xe_vm_create(xe, 0, 0);
>  			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
>  			surf_ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
>  			surf_ahnd = intel_allocator_open(xe, surf_ctx->vm,
> @@ -553,7 +553,7 @@ static void block_copy_test(int xe,
>  				      copyfns[copy_function].suffix) {
>  				uint32_t sync_bind, sync_out;
>  
> -				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +				vm = xe_vm_create(xe, 0, 0);
>  				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
>  				sync_bind = syncobj_create(xe, 0);
>  				sync_out = syncobj_create(xe, 0);
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index d9c059e4d9..1bde876cd2 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -137,7 +137,7 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
>  
>  	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
>  	dst_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
>  
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index bbdddc7c9b..c3c57d11bc 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -55,7 +55,7 @@ static void create_invalid_size(int fd)
>  	uint32_t handle;
>  	int ret;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  
>  	xe_for_each_mem_region(fd, memreg, region) {
>  		memregion = xe_mem_region(fd, region);
> @@ -141,7 +141,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
>  
>  	fd = drm_reopen_driver(fd);
>  	num_engines = xe_number_engines(fd);
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  
>  	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
>  	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
> @@ -208,7 +208,7 @@ static void create_massive_size(int fd)
>  	uint32_t handle;
>  	int ret;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  
>  	xe_for_each_mem_region(fd, memreg, region) {
>  		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index eca3a5e95b..e81410d97a 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -150,7 +150,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  		};
>  		struct drm_xe_exec exec = {
>  			.num_batch_buffer = 1,
> -			.syncs = to_user_pointer(sync),
> +			.syncs.syncs = to_user_pointer(sync),
>  		};
>  		struct xe_spin_opts spin_opts = { .addr = addr + spin_offset, .preempt = true };
>  		uint32_t syncobj;
> @@ -189,7 +189,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  		sync[1].handle = syncobj_create(fd[1], 0);
>  		exec.exec_queue_id = exec_queue[1];
>  		exec.address = batch_addr;
> -		exec.num_syncs = 2;
> +		exec.syncs.num_syncs = 2;
>  		xe_exec(fd[1], &exec);
>  
>  		/* Verify exec blocked on spinner / prime BO */
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index fd6c07410a..8855c580fe 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -53,8 +53,8 @@ static void test_active(int fd, struct drm_xe_engine *engine)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  #define N_EXEC_QUEUES   2
>  	uint32_t exec_queues[N_EXEC_QUEUES];
> @@ -71,7 +71,7 @@ static void test_active(int fd, struct drm_xe_engine *engine)
>  	struct xe_spin_opts spin_opts = { .preempt = true };
>  	int i, b, ret;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * N_EXEC_QUEUES;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -91,7 +91,7 @@ static void test_active(int fd, struct drm_xe_engine *engine)
>  		for (i = 0; i < N_EXEC_QUEUES; i++) {
>  			exec_queues[i] = xe_exec_queue_create(fd, vm,
>  							      &engine->instance, 0);
> -			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
> +			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
>  			syncobjs[i] = syncobj_create(fd, 0);
>  		}
>  		syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 89dc46fae4..12a53ad539 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -43,8 +43,8 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> @@ -63,17 +63,15 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	fd = drm_open_driver(DRIVER_XE);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	if (flags & BIND_EXEC_QUEUE)
> -		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
> +		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
>  	if (flags & MULTI_VM) {
> -		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> -		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +		vm2 = xe_vm_create(fd, 0, 0);
> +		vm3 = xe_vm_create(fd, 0, 0);
>  		if (flags & BIND_EXEC_QUEUE) {
> -			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
> -									0, true);
> -			bind_exec_queues[2] = xe_bind_exec_queue_create(fd, vm3,
> -									0, true);
> +			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2, 0);
> +			bind_exec_queues[2] = xe_bind_exec_queue_create(fd, vm3, 0);
>  		}
>  	}
>  
> @@ -163,8 +161,8 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  		if (i + 1 == n_execs / 2) {
>  			addr = base_addr;
> -			exec.num_syncs = 1;
> -			exec.syncs = to_user_pointer(sync + 1);
> +			exec.syncs.num_syncs = 1;
> +			exec.syncs.syncs = to_user_pointer(sync + 1);
>  			if (barrier)
>  				pthread_barrier_wait(barrier);
>  		}
> @@ -224,8 +222,8 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t *bo;
> @@ -245,16 +243,13 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	fd = drm_open_driver(DRIVER_XE);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	if (flags & BIND_EXEC_QUEUE)
> -		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
> +		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
>  	if (flags & MULTI_VM) {
> -		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -				   DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  		if (flags & BIND_EXEC_QUEUE)
> -			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
> -									0, true);
> +			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2, 0);
>  	}
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 0c775e5f4d..d182bc9535 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -227,7 +227,7 @@ static void evict_single(int fd, int child, const struct config *config)
>  	uint32_t kb_left = config->mb_per_proc * SZ_1K;
>  	uint32_t min_alloc_kb = config->param->min_size_kb;
>  	uint32_t max_alloc_kb = config->param->max_size_kb;
> -	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	uint32_t vm = xe_vm_create(fd, 0, 0);
>  	uint64_t ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
>  	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
>  	struct object *obj, *tmp;
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 79ff65e891..3814fffb00 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -42,8 +42,8 @@ static void test_all_active(int fd, int gt, int class)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_INSTANCE];
>  	uint32_t syncobjs[MAX_INSTANCE];
> @@ -66,7 +66,7 @@ static void test_all_active(int fd, int gt, int class)
>  	if (num_placements < 2)
>  		return;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * num_placements;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>  
> @@ -181,8 +181,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>  	};
>  	struct drm_xe_exec exec = {
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> @@ -208,7 +208,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	if (num_placements < 2)
>  		return;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>  
> @@ -406,8 +406,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
> @@ -435,8 +435,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	if (num_placements < 2)
>  		return;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index b20581382c..0614141207 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -87,8 +87,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr[MAX_N_EXEC_QUEUES];
>  	uint64_t sparse_addr[MAX_N_EXEC_QUEUES];
> @@ -110,7 +110,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(n_vm <= MAX_N_EXEC_QUEUES);
>  
>  	for (i = 0; i < n_vm; ++i)
> -		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +		vm[i] = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -153,8 +153,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		exec_queues[i] = xe_exec_queue_create(fd, __vm, eci, 0);
>  		if (flags & BIND_EXEC_QUEUE)
>  			bind_exec_queues[i] = xe_bind_exec_queue_create(fd,
> -									__vm, 0,
> -									true);
> +									__vm, 0);
>  		else
>  			bind_exec_queues[i] = 0;
>  		syncobjs[i] = syncobj_create(fd, 0);
> @@ -174,7 +173,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			__xe_vm_bind_assert(fd, vm[i], bind_exec_queues[i],
>  					    0, 0, sparse_addr[i], bo_size,
>  					    DRM_XE_VM_BIND_OP_MAP,
> -					    DRM_XE_VM_BIND_FLAG_ASYNC |
>  					    DRM_XE_VM_BIND_FLAG_NULL, sync,
>  					    1, 0, 0);
>  	}
> @@ -319,8 +317,8 @@ static void test_zero_execs(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	size_t bo_size;
>  	uint32_t bo = 0;
> @@ -334,7 +332,7 @@ static void test_zero_execs(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	int i, b;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 7d3004d658..b51fa880ac 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -94,8 +94,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXECQUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> @@ -114,8 +114,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -124,7 +123,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXECQUEUE)
>  			bind_exec_queues[i] =
> -				xe_bind_exec_queue_create(fd, vm, 0, true);
> +				xe_bind_exec_queue_create(fd, vm, 0);
>  		else
>  			bind_exec_queues[i] = 0;
>  	};
> @@ -153,7 +152,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXECQUEUE)
>  			bind_exec_queues[i] =
> -				xe_bind_exec_queue_create(fd, vm, 0, true);
> +				xe_bind_exec_queue_create(fd, vm, 0);
>  		else
>  			bind_exec_queues[i] = 0;
>  	};
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index ee7cbb6040..67f05c2660 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -112,8 +112,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> @@ -131,8 +131,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -			  DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> @@ -168,7 +167,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXEC_QUEUE)
>  			bind_exec_queues[i] =
> -				xe_bind_exec_queue_create(fd, vm, 0, true);
> +				xe_bind_exec_queue_create(fd, vm, 0);
>  		else
>  			bind_exec_queues[i] = 0;
>  	};
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 0b578510ce..53e08fb0e6 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -56,7 +56,7 @@ static void test_set_property(int xe, int property_name,
>  			      int property_value, int err_val)
>  {
>  	struct drm_xe_engine_class_instance instance = {
> -			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
> +			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
>  	};
>  	struct drm_xe_ext_set_property ext = {
>  		.base.next_extension = 0,
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index edfd27fe0c..f9c0057072 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -35,8 +35,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queue;
>  	uint32_t syncobj;
> @@ -45,7 +45,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>  	struct xe_spin *spin;
>  	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*spin);
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -145,8 +145,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>  	};
>  	struct drm_xe_exec exec = {
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXECQUEUES];
>  	uint32_t syncobjs[MAX_N_EXECQUEUES];
> @@ -177,7 +177,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	if (num_placements < 2)
>  		return;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -343,8 +343,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXECQUEUES];
>  	uint32_t syncobjs[MAX_N_EXECQUEUES];
> @@ -364,7 +364,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -509,8 +509,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXECQUEUES];
>  	size_t bo_size;
> @@ -531,8 +531,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -695,6 +694,8 @@ static void submit_jobs(struct gt_thread_data *t)
>  		exec.exec_queue_id = create.exec_queue_id;
>  		exec.address = addr;
>  		exec.num_batch_buffer = 1;
> +		exec.syncs.num_syncs = 0;
> +		exec.syncs.flags = 0;
>  		xe_exec(fd, &exec);
>  		xe_exec_queue_destroy(fd, create.exec_queue_id);
>  	}
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index dec8546a3c..50f581a268 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -60,8 +60,8 @@ static void store(int fd)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(&sync),
>  	};
>  	struct data *data;
>  	struct drm_xe_engine *engine;
> @@ -76,7 +76,7 @@ static void store(int fd)
>  	syncobj = syncobj_create(fd, 0);
>  	sync.handle = syncobj;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data);
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -129,8 +129,8 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(&sync),
>  	};
>  
>  	int count = flags & PAGES ? NCACHELINES + 1 : 2;
> @@ -145,7 +145,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  	size_t bo_size = 4096;
>  
>  	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
>  	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
>  	syncobjs = syncobj_create(fd, 0);
> @@ -218,8 +218,8 @@ static void store_all(int fd, int gt, int class)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(&sync),
>  	};
>  
>  	struct data *data;
> @@ -233,7 +233,7 @@ static void store_all(int fd, int gt, int class)
>  	struct drm_xe_engine_class_instance *hwe;
>  	int i, num_placements = 0;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data);
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index fcb9266982..31e2173e43 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -52,8 +52,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	};
>  	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
>  	struct drm_xe_exec exec = {
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> @@ -77,7 +77,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	}
>  
>  	if (!vm) {
> -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +		vm = xe_vm_create(fd, 0, 0);
>  		owns_vm = true;
>  	}
>  
> @@ -260,8 +260,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	int64_t fence_timeout;
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> @@ -286,8 +286,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	}
>  
>  	if (!vm) {
> -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> -				  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  		owns_vm = true;
>  	}
>  
> @@ -465,8 +464,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> @@ -491,7 +490,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	}
>  
>  	if (!vm) {
> -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +		vm = xe_vm_create(fd, 0, 0);
>  		owns_vm = true;
>  	}
>  
> @@ -535,7 +534,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXEC_QUEUE)
>  			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
> -									0, true);
> +									0);
>  		else
>  			bind_exec_queues[i] = 0;
>  		syncobjs[i] = syncobj_create(fd, 0);
> @@ -1003,11 +1002,8 @@ static void threads(int fd, int flags)
>  	pthread_cond_init(&cond, 0);
>  
>  	if (flags & SHARED_VM) {
> -		vm_legacy_mode = xe_vm_create(fd,
> -					      DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT,
> -					      0);
> +		vm_legacy_mode = xe_vm_create(fd, 0, 0);
>  		vm_compute_mode = xe_vm_create(fd,
> -					       DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
>  					       DRM_XE_VM_CREATE_FLAG_LR_MODE,
>  					       0);
>  	}
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index 655e9a3ea3..cc9060b1b1 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -280,7 +280,7 @@ static void fast_copy_test(int xe,
>  			region1 = igt_collection_get_value(regions, 0);
>  			region2 = igt_collection_get_value(regions, 1);
>  
> -			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +			vm = xe_vm_create(xe, 0, 0);
>  			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
>  			ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
>  
> diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
> index 035d86ea8f..ca045c41bf 100644
> --- a/tests/intel/xe_huc_copy.c
> +++ b/tests/intel/xe_huc_copy.c
> @@ -157,7 +157,7 @@ test_huc_copy(int fd)
>  	uint32_t vm;
>  	uint32_t tested_gts = 0;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  
>  	xe_for_each_engine(fd, hwe) {
>  		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index 804e176ee6..d3d7a4fb69 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -192,7 +192,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
>  	intel_bb_reset(ibb, true);
>  
>  	if (new_context) {
> -		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +		vm = xe_vm_create(xe, 0, 0);
>  		ctx = xe_exec_queue_create(xe, vm, &xe_engine(xe, 0)->instance,
>  					   0);
>  		intel_bb_destroy(ibb);
> diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
> index c91340784a..2aeea14d0e 100644
> --- a/tests/intel/xe_noexec_ping_pong.c
> +++ b/tests/intel/xe_noexec_ping_pong.c
> @@ -64,7 +64,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine *engine)
>  	 * stats.
>  	 */
>  	for (i = 0; i < NUM_VMS; ++i) {
> -		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +		vm[i] = xe_vm_create(fd, 0, 0);
>  		for (j = 0; j < NUM_BOS; ++j) {
>  			igt_debug("Creating bo size %lu for vm %u\n",
>  				  (unsigned long) bo_size,
> @@ -72,8 +72,8 @@ static void test_ping_pong(int fd, struct drm_xe_engine *engine)
>  
>  			bo[i][j] = xe_bo_create(fd, vm[i], bo_size,
>  						vram_memory(fd, 0), 0);
> -			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
> -				   bo_size, NULL, 0);
> +			xe_vm_bind_async(fd, vm[i], 0, bo[i][j], 0, 0x40000 + j*bo_size,
> +					 bo_size, NULL, 0);
>  		}
>  		exec_queues[i] = xe_exec_queue_create(fd, vm[i],
>  						      &engine->instance, 0);
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 8189390a8a..fafcfc2467 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -254,7 +254,7 @@ static void pat_index_blt(struct xe_pat_param *p)
>  
>  	igt_require(blt_has_fast_copy(fd));
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
>  	ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> @@ -468,7 +468,7 @@ static void pat_index_dw(struct xe_pat_param *p)
>  			break;
>  	}
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	ctx = xe_exec_queue_create(fd, vm, hwe, 0);
>  
>  	ibb = intel_bb_create_full(fd, ctx, vm, NULL, xe_get_default_alignment(fd),
> diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
> index 42cf627291..36d1c16efb 100644
> --- a/tests/intel/xe_perf_pmu.c
> +++ b/tests/intel/xe_perf_pmu.c
> @@ -86,8 +86,8 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queue;
>  	uint32_t syncobj;
> @@ -98,7 +98,7 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
>  	uint32_t pmu_fd;
>  	uint64_t count, idle;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*spin);
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -190,8 +190,8 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_INSTANCE];
>  	uint32_t syncobjs[MAX_INSTANCE];
> @@ -219,7 +219,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
>  	igt_skip_on_f(!num_placements, "Engine class:%d gt:%d not enabled on this platform\n",
>  		      class, gt);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * num_placements;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>  
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c899bd67a0..8942f2f2cb 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -236,8 +236,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> @@ -259,7 +259,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	if (check_rpm)
>  		igt_assert(in_d3(device, d_state));
>  
> -	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(device.fd_xe, 0, 0);
>  
>  	if (check_rpm)
>  		igt_assert(out_of_d3(device, d_state));
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 5542f8fb44..a833f0e65a 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -92,8 +92,8 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>  
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(&sync),
>  	};
>  
>  	vm = xe_vm_create(fd, 0, 0);
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index c75709c4e6..08e8496571 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -150,8 +150,8 @@ static void xe_spin_fixed_duration(int fd)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(&sync),
>  	};
>  	const uint64_t duration_ns = NSEC_PER_SEC / 10; /* 100ms */
>  	uint64_t spin_addr;
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 62bf950504..22874542e4 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -268,7 +268,7 @@ test_bind_one_bo_many_times_many_vm(int fd)
>  
>  static void test_partial_unbinds(int fd)
>  {
> -	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	uint32_t vm = xe_vm_create(fd, 0, 0);
>  	size_t bo_size = 3 * xe_get_default_alignment(fd);
>  	uint32_t bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>  	uint64_t unbind_size = bo_size / 3;
> @@ -318,7 +318,7 @@ static void unbind_all(int fd, int n_vmas)
>  		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>  	};
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>  
>  	for (i = 0; i < n_vmas; ++i)
> @@ -397,8 +397,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES + 1];
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> @@ -416,7 +416,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  	data = malloc(sizeof(*data) * n_bo);
>  	igt_assert(data);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(struct shared_pte_page_data);
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -583,8 +583,8 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  #define N_EXEC_QUEUES	2
>  	uint32_t exec_queues[N_EXEC_QUEUES];
> @@ -601,7 +601,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>  	struct xe_spin_opts spin_opts = { .preempt = true };
>  	int i, b;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * N_EXEC_QUEUES;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -612,7 +612,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>  
>  	for (i = 0; i < N_EXEC_QUEUES; i++) {
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> -		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
> +		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
>  		syncobjs[i] = syncobj_create(fd, 0);
>  	}
>  	syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
> @@ -673,7 +673,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>  		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  		sync[1].handle = syncobjs[!i ? N_EXEC_QUEUES : e];
>  
> -		exec.num_syncs = 2;
> +		exec.syncs.num_syncs = 2;
>  		exec.exec_queue_id = exec_queues[e];
>  		exec.address = batch_addr;
>  		xe_exec(fd, &exec);
> @@ -748,7 +748,7 @@ static void test_zero_binds(int fd, struct drm_xe_engine_class_instance *eci)
>  	uint32_t bo = 0;
>  	struct xe_cork cork;
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = ALIGN(xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
>  	bo = xe_bo_create(fd, vm, bo_size,
> @@ -823,7 +823,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queue, bind_exec_queue = 0;
>  #define BIND_ARRAY_MAX_N_EXEC	16
> @@ -839,7 +839,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  
>  	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
> @@ -850,7 +850,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	if (flags & BIND_ARRAY_BIND_EXEC_QUEUE_FLAG)
> -		bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0, true);
> +		bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
>  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>  
>  	for (i = 0; i < n_execs; ++i) {
> @@ -859,7 +859,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		bind_ops[i].range = bo_size;
>  		bind_ops[i].addr = addr;
>  		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
> -		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
> +		bind_ops[i].flags = 0;
>  		bind_ops[i].prefetch_mem_region_instance = 0;
>  		bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
>  		bind_ops[i].reserved[0] = 0;
> @@ -890,9 +890,9 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  		if (i == n_execs - 1) {
>  			sync[1].handle = syncobj_create(fd, 0);
> -			exec.num_syncs = 2;
> +			exec.syncs.num_syncs = 2;
>  		} else {
> -			exec.num_syncs = 1;
> +			exec.syncs.num_syncs = 1;
>  		}
>  
>  		exec.exec_queue_id = exec_queue;
> @@ -905,7 +905,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  	for (i = 0; i < n_execs; ++i) {
>  		bind_ops[i].obj = 0;
>  		bind_ops[i].op = DRM_XE_VM_BIND_OP_UNMAP;
> -		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
> +		bind_ops[i].flags = 0;
>  	}
>  
>  	syncobj_reset(fd, &sync[0].handle, 1);
> @@ -1012,8 +1012,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr = 0x1ull << 30, base_addr = 0x1ull << 30;
>  	uint32_t vm;
> @@ -1034,7 +1034,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  
>  	if (flags & LARGE_BIND_FLAG_USERPTR) {
>  		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
> @@ -1172,8 +1172,8 @@ static void *hammer_thread(void *tdata)
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 1,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	struct {
>  		uint32_t batch[16];
> @@ -1205,10 +1205,10 @@ static void *hammer_thread(void *tdata)
>  		exec.exec_queue_id = exec_queue;
>  		exec.address = batch_addr;
>  		if (i % 32) {
> -			exec.num_syncs = 0;
> +			exec.syncs.num_syncs = 0;
>  			err = __xe_exec(t->fd, &exec);
>  		} else {
> -			exec.num_syncs = 1;
> +			exec.syncs.num_syncs = 1;
>  			err = __xe_exec(t->fd, &exec);
>  			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
>  						INT64_MAX, 0, NULL));
> @@ -1299,8 +1299,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr = 0x1a00000, base_addr = 0x1a00000;
>  	uint32_t vm;
> @@ -1329,7 +1329,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  			unbind_n_page_offset *= n_page_per_2mb;
>  	}
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = page_size * bo_n_pages;
>  
>  	if (flags & MAP_FLAG_USERPTR) {
> @@ -1600,8 +1600,8 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> +		.syncs.num_syncs = 2,
> +		.syncs.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr = 0x1a00000, base_addr = 0x1a00000;
>  	uint32_t vm;
> @@ -1629,7 +1629,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  			unbind_n_page_offset *= n_page_per_2mb;
>  	}
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = page_size * bo_n_pages;
>  
>  	if (flags & MAP_FLAG_USERPTR) {
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index 3be987954d..acd614c96a 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -94,7 +94,7 @@ waitfence(int fd, enum waittype wt)
>  	uint32_t bo_7;
>  	int64_t timeout;
>  
> -	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	uint32_t vm = xe_vm_create(fd, 0, 0);
>  	bo_1 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
>  	bo_2 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
> @@ -170,7 +170,7 @@ invalid_flag(int fd)
>  		.instances = 0,
>  	};
>  
> -	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	uint32_t vm = xe_vm_create(fd, 0, 0);
>  
>  	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  
> @@ -195,7 +195,7 @@ invalid_ops(int fd)
>  		.instances = 0,
>  	};
>  
> -	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	uint32_t vm = xe_vm_create(fd, 0, 0);
>  
>  	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  
> @@ -220,7 +220,7 @@ invalid_engine(int fd)
>  		.instances = 0,
>  	};
>  
> -	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	uint32_t vm = xe_vm_create(fd, 0, 0);
>  
>  	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
>  
> -- 
> 2.34.1
> 
