Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFCB10E029
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 09:37:08 +0000 (UTC)
Date: Tue, 3 Oct 2023 11:35:48 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZRvgdB0rJPokDTeN@fdugast-desk.home>
References: <20230928110516.7-1-francois.dugast@intel.com>
 <20230928110516.7-11-francois.dugast@intel.com>
 <c43b4416c13bd9937ffdbdeb2cf2c8d3cd5b6907.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c43b4416c13bd9937ffdbdeb2cf2c8d3cd5b6907.camel@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 10/14] xe: Update to new VM bind uAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 06:32:55PM +0200, Souza, Jose wrote:
> On Thu, 2023-09-28 at 11:05 +0000, Francois Dugast wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > Sync vs. async changes and new error handling.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > [Rodrigo rebased and fixed conflicts]
> > ---
> >  include/drm-uapi/xe_drm.h          |  50 ++------
> >  lib/igt_fb.c                       |   2 +-
> >  lib/intel_batchbuffer.c            |   2 +-
> >  lib/intel_compute.c                |   2 +-
> >  lib/xe/xe_ioctl.c                  |  15 +--
> >  lib/xe/xe_ioctl.h                  |   3 +-
> >  lib/xe/xe_query.c                  |   2 +-
> >  tests/intel/xe_ccs.c               |   4 +-
> >  tests/intel/xe_create.c            |   6 +-
> >  tests/intel/xe_drm_fdinfo.c        |   4 +-
> >  tests/intel/xe_evict.c             |  23 ++--
> >  tests/intel/xe_exec_balancer.c     |   6 +-
> >  tests/intel/xe_exec_basic.c        |   6 +-
> >  tests/intel/xe_exec_compute_mode.c |   6 +-
> >  tests/intel/xe_exec_fault_mode.c   |   6 +-
> >  tests/intel/xe_exec_reset.c        |   8 +-
> >  tests/intel/xe_exec_store.c        |   4 +-
> >  tests/intel/xe_exec_threads.c      | 112 +++++------------
> >  tests/intel/xe_exercise_blt.c      |   2 +-
> >  tests/intel/xe_guc_pc.c            |   2 +-
> >  tests/intel/xe_huc_copy.c          |   2 +-
> >  tests/intel/xe_intel_bb.c          |   2 +-
> >  tests/intel/xe_pm.c                |   2 +-
> >  tests/intel/xe_vm.c                | 189 ++---------------------------
> >  tests/intel/xe_waitfence.c         |  19 +--
> >  25 files changed, 102 insertions(+), 377 deletions(-)
> > 
> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > index 0a05a12b2..80b4c76f3 100644
> > --- a/include/drm-uapi/xe_drm.h
> > +++ b/include/drm-uapi/xe_drm.h
> > @@ -134,10 +134,11 @@ struct drm_xe_engine_class_instance {
> >  #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
> >  #define DRM_XE_ENGINE_CLASS_COMPUTE		4
> >  	/*
> > -	 * Kernel only class (not actual hardware engine class). Used for
> > +	 * Kernel only classes (not actual hardware engine class). Used for
> >  	 * creating ordered queues of VM bind operations.
> >  	 */
> > -#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> > +#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
> > +#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> >  	__u16 engine_class;
> >  
> >  	__u16 engine_instance;
> > @@ -577,7 +578,7 @@ struct drm_xe_vm_create {
> >  
> >  #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
> >  #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
> > -#define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
> > +#define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
> >  #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
> >  	/** @flags: Flags */
> >  	__u32 flags;
> > @@ -637,34 +638,12 @@ struct drm_xe_vm_bind_op {
> >  #define XE_VM_BIND_OP_MAP		0x0
> >  #define XE_VM_BIND_OP_UNMAP		0x1
> >  #define XE_VM_BIND_OP_MAP_USERPTR	0x2
> > -#define XE_VM_BIND_OP_RESTART		0x3
> > -#define XE_VM_BIND_OP_UNMAP_ALL		0x4
> > -#define XE_VM_BIND_OP_PREFETCH		0x5
> > +#define XE_VM_BIND_OP_UNMAP_ALL		0x3
> > +#define XE_VM_BIND_OP_PREFETCH		0x4
> >  	/** @op: Bind operation to perform */
> >  	__u32 op;
> >  
> >  #define XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
> > -	/*
> > -	 * A bind ops completions are always async, hence the support for out
> > -	 * sync. This flag indicates the allocation of the memory for new page
> > -	 * tables and the job to program the pages tables is asynchronous
> > -	 * relative to the IOCTL. That part of a bind operation can fail under
> > -	 * memory pressure, the job in practice can't fail unless the system is
> > -	 * totally shot.
> > -	 *
> > -	 * If this flag is clear and the IOCTL doesn't return an error, in
> > -	 * practice the bind op is good and will complete.
> > -	 *
> > -	 * If this flag is set and doesn't return an error, the bind op can
> > -	 * still fail and recovery is needed. It should free memory
> > -	 * via non-async unbinds, and then restart all queued async binds op via
> > -	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
> > -	 * VM.
> > -	 *
> > -	 * This flag is only allowed when DRM_XE_VM_CREATE_ASYNC_BIND_OPS is
> > -	 * configured in the VM and must be set if the VM is configured with
> > -	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
> > -	 */
> >  #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 1)
> >  	/*
> >  	 * Valid on a faulting VM only, do the MAP operation immediately rather
> > @@ -905,18 +884,10 @@ struct drm_xe_wait_user_fence {
> >  	/** @extensions: Pointer to the first extension struct, if any */
> >  	__u64 extensions;
> >  
> > -	union {
> > -		/**
> > -		 * @addr: user pointer address to wait on, must qword aligned
> > -		 */
> > -		__u64 addr;
> > -
> > -		/**
> > -		 * @vm_id: The ID of the VM which encounter an error used with
> > -		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
> > -		 */
> > -		__u64 vm_id;
> > -	};
> > +	/**
> > +	 * @addr: user pointer address to wait on, must qword aligned
> > +	 */
> > +	__u64 addr;
> >  
> >  #define DRM_XE_UFENCE_WAIT_EQ	0
> >  #define DRM_XE_UFENCE_WAIT_NEQ	1
> > @@ -929,7 +900,6 @@ struct drm_xe_wait_user_fence {
> >  
> >  #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> >  #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> > -#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
> >  	/** @flags: wait flags */
> >  	__u16 flags;
> >  
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index f0c0681ab..34934855a 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -2892,7 +2892,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
> >  							  &bb_size,
> >  							  mem_region) == 0);
> >  	} else if (is_xe) {
> > -		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
> >  		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
> >  		mem_region = vram_if_possible(dst_fb->fd, 0);
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index 6e668d28c..df82ef5f5 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -953,7 +953,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
> >  
> >  		if (!vm) {
> >  			igt_assert_f(!ctx, "No vm provided for engine");
> > -			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  		}
> >  
> >  		ibb->uses_full_ppgtt = true;
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 0c30f39c1..1ae33cdfc 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -79,7 +79,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv)
> >  		else
> >  			engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> >  
> > -		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
> >  								 engine_class);
> >  	}
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > index 48cd185de..895e3bd4e 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -201,16 +201,8 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
> >  static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> >  			      uint64_t addr, uint64_t size, uint32_t op)
> >  {
> > -	struct drm_xe_sync sync = {
> > -		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> > -		.handle = syncobj_create(fd, 0),
> > -	};
> > -
> > -	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, 0, &sync, 1,
> > +	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, 0, NULL, 0,
> >  			    0, 0);
> > -
> > -	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> > -	syncobj_destroy(fd, sync.handle);
> >  }
> >  
> >  void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> > @@ -276,10 +268,11 @@ uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
> >  	return create.handle;
> >  }
> >  
> > -uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext)
> > +uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async)
> >  {
> >  	struct drm_xe_engine_class_instance instance = {
> > -		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> > +		.engine_class = async ? DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC :
> > +			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
> >  	};
> >  	struct drm_xe_exec_queue_create create = {
> >  		.extensions = ext,
> > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> > index f0e4109dc..a8dbcf376 100644
> > --- a/lib/xe/xe_ioctl.h
> > +++ b/lib/xe/xe_ioctl.h
> > @@ -71,7 +71,8 @@ uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
> >  uint32_t xe_exec_queue_create(int fd, uint32_t vm,
> >  			  struct drm_xe_engine_class_instance *instance,
> >  			  uint64_t ext);
> > -uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
> > +uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext,
> > +				   bool async);
> >  uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
> >  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
> >  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index c356abe1e..ab7b31188 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -316,7 +316,7 @@ bool xe_supports_faults(int fd)
> >  	bool supports_faults;
> >  
> >  	struct drm_xe_vm_create create = {
> > -		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +		.flags = DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  			 DRM_XE_VM_CREATE_FAULT_MODE,
> >  	};
> >  
> > diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> > index 20bbc4448..300b734c8 100644
> > --- a/tests/intel/xe_ccs.c
> > +++ b/tests/intel/xe_ccs.c
> > @@ -343,7 +343,7 @@ static void block_copy(int xe,
> >  		uint32_t vm, exec_queue;
> >  
> >  		if (config->new_ctx) {
> > -			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> >  			surf_ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
> >  			surf_ahnd = intel_allocator_open(xe, surf_ctx->vm,
> > @@ -550,7 +550,7 @@ static void block_copy_test(int xe,
> >  				      copyfns[copy_function].suffix) {
> >  				uint32_t sync_bind, sync_out;
> >  
> > -				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> >  				sync_bind = syncobj_create(xe, 0);
> >  				sync_out = syncobj_create(xe, 0);
> > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> > index 8d845e5c8..d99bd51cf 100644
> > --- a/tests/intel/xe_create.c
> > +++ b/tests/intel/xe_create.c
> > @@ -54,7 +54,7 @@ static void create_invalid_size(int fd)
> >  	uint32_t handle;
> >  	int ret;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  
> >  	xe_for_each_mem_region(fd, memreg, region) {
> >  		memregion = xe_mem_region(fd, region);
> > @@ -140,7 +140,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
> >  
> >  	fd = drm_reopen_driver(fd);
> >  	num_engines = xe_number_hw_engines(fd);
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  
> >  	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
> >  	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
> > @@ -199,7 +199,7 @@ static void create_massive_size(int fd)
> >  	uint32_t handle;
> >  	int ret;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  
> >  	xe_for_each_mem_region(fd, memreg, region) {
> >  		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
> > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> > index 22e410e14..64168ed19 100644
> > --- a/tests/intel/xe_drm_fdinfo.c
> > +++ b/tests/intel/xe_drm_fdinfo.c
> > @@ -71,7 +71,7 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
> >  	struct xe_spin_opts spin_opts = { .preempt = true };
> >  	int i, b, ret;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * N_EXEC_QUEUES;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -90,7 +90,7 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
> >  
> >  		for (i = 0; i < N_EXEC_QUEUES; i++) {
> >  			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > -			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
> > +			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
> >  			syncobjs[i] = syncobj_create(fd, 0);
> >  		}
> >  		syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
> > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> > index 5d8981f8d..eec001218 100644
> > --- a/tests/intel/xe_evict.c
> > +++ b/tests/intel/xe_evict.c
> > @@ -63,15 +63,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> >  
> >  	fd = drm_open_driver(DRIVER_XE);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	if (flags & BIND_EXEC_QUEUE)
> > -		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
> > +		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
> >  	if (flags & MULTI_VM) {
> > -		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > -		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> > +		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  		if (flags & BIND_EXEC_QUEUE) {
> > -			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2, 0);
> > -			bind_exec_queues[2] = xe_bind_exec_queue_create(fd, vm3, 0);
> > +			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
> > +									0, true);
> > +			bind_exec_queues[2] = xe_bind_exec_queue_create(fd, vm3,
> > +									0, true);
> >  		}
> >  	}
> >  
> > @@ -240,15 +242,16 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> >  
> >  	fd = drm_open_driver(DRIVER_XE);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> >  	if (flags & BIND_EXEC_QUEUE)
> > -		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
> > +		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
> >  	if (flags & MULTI_VM) {
> > -		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  				   DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> >  		if (flags & BIND_EXEC_QUEUE)
> > -			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2, 0);
> > +			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
> > +									0, true);
> >  	}
> >  
> >  	for (i = 0; i < n_exec_queues; i++) {
> > diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> > index f4f5440f4..3ca3de881 100644
> > --- a/tests/intel/xe_exec_balancer.c
> > +++ b/tests/intel/xe_exec_balancer.c
> > @@ -66,7 +66,7 @@ static void test_all_active(int fd, int gt, int class)
> >  	if (num_placements < 2)
> >  		return;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * num_placements;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> >  
> > @@ -207,7 +207,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
> >  	if (num_placements < 2)
> >  		return;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> >  
> > @@ -433,7 +433,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
> >  	if (num_placements < 2)
> >  		return;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> > diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> > index e29398aaa..8dbce524d 100644
> > --- a/tests/intel/xe_exec_basic.c
> > +++ b/tests/intel/xe_exec_basic.c
> > @@ -109,7 +109,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  	igt_assert(n_vm <= MAX_N_EXEC_QUEUES);
> >  
> >  	for (i = 0; i < n_vm; ++i)
> > -		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -151,7 +151,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  
> >  		exec_queues[i] = xe_exec_queue_create(fd, __vm, eci, 0);
> >  		if (flags & BIND_EXEC_QUEUE)
> > -			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, __vm, 0);
> > +			bind_exec_queues[i] = xe_bind_exec_queue_create(fd,
> > +									__vm, 0,
> > +									true);
> >  		else
> >  			bind_exec_queues[i] = 0;
> >  		syncobjs[i] = syncobj_create(fd, 0);
> > diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> > index 02e7ef201..b0a677dca 100644
> > --- a/tests/intel/xe_exec_compute_mode.c
> > +++ b/tests/intel/xe_exec_compute_mode.c
> > @@ -113,7 +113,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> > @@ -123,7 +123,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> >  		if (flags & BIND_EXECQUEUE)
> >  			bind_exec_queues[i] =
> > -				xe_bind_exec_queue_create(fd, vm, 0);
> > +				xe_bind_exec_queue_create(fd, vm, 0, true);
> >  		else
> >  			bind_exec_queues[i] = 0;
> >  	};
> > @@ -151,7 +151,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> >  		if (flags & BIND_EXECQUEUE)
> >  			bind_exec_queues[i] =
> > -				xe_bind_exec_queue_create(fd, vm, 0);
> > +				xe_bind_exec_queue_create(fd, vm, 0, true);
> >  		else
> >  			bind_exec_queues[i] = 0;
> >  	};
> > diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> > index c5d6bdcd5..92d8690a1 100644
> > --- a/tests/intel/xe_exec_fault_mode.c
> > +++ b/tests/intel/xe_exec_fault_mode.c
> > @@ -131,7 +131,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> > @@ -165,7 +165,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> >  		if (flags & BIND_EXEC_QUEUE)
> >  			bind_exec_queues[i] =
> > -				xe_bind_exec_queue_create(fd, vm, 0);
> > +				xe_bind_exec_queue_create(fd, vm, 0, true);
> >  		else
> >  			bind_exec_queues[i] = 0;
> >  	};
> > @@ -375,7 +375,7 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
> >  	uint32_t *ptr;
> >  	int i, b, wait_idx = 0;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
> >  	bo_size = sizeof(*data) * n_atomic;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > index ca8d7cc13..44248776b 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -45,7 +45,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
> >  	struct xe_spin *spin;
> >  	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*spin);
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -176,7 +176,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
> >  	if (num_placements < 2)
> >  		return;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -362,7 +362,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >  	if (flags & CLOSE_FD)
> >  		fd = drm_open_driver(DRIVER_XE);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -528,7 +528,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >  	if (flags & CLOSE_FD)
> >  		fd = drm_open_driver(DRIVER_XE);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> > diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> > index 14f7c9bec..90684b8cb 100644
> > --- a/tests/intel/xe_exec_store.c
> > +++ b/tests/intel/xe_exec_store.c
> > @@ -75,7 +75,7 @@ static void store(int fd)
> >  	syncobj = syncobj_create(fd, 0);
> >  	sync.handle = syncobj;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data);
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -132,7 +132,7 @@ static void store_all(int fd, int gt, int class)
> >  	struct drm_xe_engine_class_instance *hwe;
> >  	int i, num_placements = 0;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data);
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> > index c9a51fc00..bb16bdd88 100644
> > --- a/tests/intel/xe_exec_threads.c
> > +++ b/tests/intel/xe_exec_threads.c
> > @@ -77,7 +77,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  	}
> >  
> >  	if (!vm) {
> > -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  		owns_vm = true;
> >  	}
> >  
> > @@ -285,7 +285,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  	}
> >  
> >  	if (!vm) {
> > -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  				  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> >  		owns_vm = true;
> >  	}
> > @@ -454,7 +454,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  static void
> >  test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
> > -		 int n_execs, int rebind_error_inject, unsigned int flags)
> > +		 int n_execs, unsigned int flags)
> >  {
> >  	struct drm_xe_sync sync[2] = {
> >  		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> > @@ -489,7 +489,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  	}
> >  
> >  	if (!vm) {
> > -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  		owns_vm = true;
> >  	}
> >  
> > @@ -531,7 +531,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  		else
> >  			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> >  		if (flags & BIND_EXEC_QUEUE)
> > -			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
> > +			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
> > +									0, true);
> >  		else
> >  			bind_exec_queues[i] = 0;
> >  		syncobjs[i] = syncobj_create(fd, 0);
> > @@ -583,8 +584,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  		exec.address = exec_addr;
> >  		if (e != i && !(flags & HANG))
> >  			 syncobj_reset(fd, &syncobjs[e], 1);
> > -		if ((flags & HANG && e == hang_exec_queue) ||
> > -		    rebind_error_inject > 0) {
> > +		if ((flags & HANG && e == hang_exec_queue)) {
> >  			int err;
> >  
> >  			do {
> > @@ -594,20 +594,10 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  			xe_exec(fd, &exec);
> >  		}
> >  
> > -		if (flags & REBIND && i &&
> > -		    (!(i & 0x1f) || rebind_error_inject == i)) {
> > -#define INJECT_ERROR	(0x1 << 31)
> > -			if (rebind_error_inject == i)
> > -				__xe_vm_bind_assert(fd, vm, bind_exec_queues[e],
> > -						    0, 0, addr, bo_size,
> > -						    XE_VM_BIND_OP_UNMAP,
> > -						    XE_VM_BIND_FLAG_ASYNC |
> > -						    INJECT_ERROR, sync_all,
> > -						    n_exec_queues, 0, 0);
> > -			else
> > -				xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> > -						   0, addr, bo_size,
> > -						   sync_all, n_exec_queues);
> > +		if (flags & REBIND && i && !(i & 0x1f)) {
> > +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> > +					   0, addr, bo_size,
> > +					   sync_all, n_exec_queues);
> >  
> >  			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
> >  			addr += bo_size;
> > @@ -709,7 +699,6 @@ struct thread_data {
> >  	int n_exec_queue;
> >  	int n_exec;
> >  	int flags;
> > -	int rebind_error_inject;
> >  	bool *go;
> >  };
> >  
> > @@ -733,46 +722,7 @@ static void *thread(void *data)
> >  	else
> >  		test_legacy_mode(t->fd, t->vm_legacy_mode, t->addr, t->userptr,
> >  				 t->eci, t->n_exec_queue, t->n_exec,
> > -				 t->rebind_error_inject, t->flags);
> > -
> > -	return NULL;
> > -}
> > -
> > -struct vm_thread_data {
> > -	pthread_t thread;
> > -	int fd;
> > -	int vm;
> > -};
> > -
> > -static void *vm_async_ops_err_thread(void *data)
> > -{
> > -	struct vm_thread_data *args = data;
> > -	int fd = args->fd;
> > -	int ret;
> > -
> > -	struct drm_xe_wait_user_fence wait = {
> > -		.vm_id = args->vm,
> > -		.op = DRM_XE_UFENCE_WAIT_NEQ,
> > -		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
> > -		.mask = DRM_XE_UFENCE_WAIT_U32,
> > -#define BASICALLY_FOREVER	0xffffffffffff
> > -		.timeout = BASICALLY_FOREVER,
> > -	};
> > -
> > -	ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
> > -
> > -	while (!ret) {
> > -		struct drm_xe_vm_bind bind = {
> > -			.vm_id = args->vm,
> > -			.num_binds = 1,
> > -			.bind.op = XE_VM_BIND_OP_RESTART,
> > -		};
> > -
> > -		/* Restart and wait for next error */
> > -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
> > -					&bind), 0);
> > -		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
> > -	}
> > +				 t->flags);
> >  
> >  	return NULL;
> >  }
> > @@ -826,6 +776,10 @@ static void *vm_async_ops_err_thread(void *data)
> >   *	shared vm rebind err
> >   * @shared-vm-userptr-rebind-err:
> >   *	shared vm userptr rebind err
> > + * @rebind-err:
> > + *	rebind err
> > + * @userptr-rebind-err:
> > + *	userptr rebind err
> >   * @shared-vm-userptr-invalidate:
> >   *	shared vm userptr invalidate
> >   * @shared-vm-userptr-invalidate-race:
> > @@ -842,7 +796,7 @@ static void *vm_async_ops_err_thread(void *data)
> >   *	fd userptr invalidate race
> >   * @hang-basic:
> >   *	hang basic
> > -  * @hang-userptr:
> > + * @hang-userptr:
> >   *	hang userptr
> >   * @hang-rebind:
> >   *	hang rebind
> > @@ -864,6 +818,10 @@ static void *vm_async_ops_err_thread(void *data)
> >   *	hang shared vm rebind err
> >   * @hang-shared-vm-userptr-rebind-err:
> >   *	hang shared vm userptr rebind err
> > + * @hang-rebind-err:
> > + *	hang rebind err
> > + * @hang-userptr-rebind-err:
> > + *	hang userptr rebind err
> >   * @hang-shared-vm-userptr-invalidate:
> >   *	hang shared vm userptr invalidate
> >   * @hang-shared-vm-userptr-invalidate-race:
> > @@ -1019,7 +977,6 @@ static void threads(int fd, int flags)
> >  	int n_hw_engines = 0, class;
> >  	uint64_t i = 0;
> >  	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
> > -	struct vm_thread_data vm_err_thread = {};
> >  	bool go = false;
> >  	int n_threads = 0;
> >  	int gt;
> > @@ -1052,18 +1009,12 @@ static void threads(int fd, int flags)
> >  
> >  	if (flags & SHARED_VM) {
> >  		vm_legacy_mode = xe_vm_create(fd,
> > -					      DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
> > +					      DRM_XE_VM_CREATE_ASYNC_DEFAULT,
> >  					      0);
> >  		vm_compute_mode = xe_vm_create(fd,
> > -					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +					       DRM_XE_VM_CREATE_ASYNC_DEFAULT |
> >  					       DRM_XE_VM_CREATE_COMPUTE_MODE,
> >  					       0);
> > -
> > -		vm_err_thread.fd = fd;
> > -		vm_err_thread.vm = vm_legacy_mode;
> > -		pthread_create(&vm_err_thread.thread, 0,
> > -			       vm_async_ops_err_thread, &vm_err_thread);
> > -
> >  	}
> >  
> >  	xe_for_each_hw_engine(fd, hwe) {
> > @@ -1083,11 +1034,6 @@ static void threads(int fd, int flags)
> >  		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
> >  #define N_EXEC		1024
> >  		threads_data[i].n_exec = N_EXEC;
> > -		if (flags & REBIND_ERROR)
> > -			threads_data[i].rebind_error_inject =
> > -				(N_EXEC / (n_hw_engines + 1)) * (i + 1);
> > -		else
> > -			threads_data[i].rebind_error_inject = -1;
> >  		threads_data[i].flags = flags;
> >  		if (flags & MIXED_MODE) {
> >  			threads_data[i].flags &= ~MIXED_MODE;
> > @@ -1190,8 +1136,6 @@ static void threads(int fd, int flags)
> >  	if (vm_compute_mode)
> >  		xe_vm_destroy(fd, vm_compute_mode);
> >  	free(threads_data);
> > -	if (flags & SHARED_VM)
> > -		pthread_join(vm_err_thread.thread, NULL);
> >  	pthread_barrier_destroy(&barrier);
> >  }
> >  
> > @@ -1214,9 +1158,8 @@ igt_main
> >  		{ "shared-vm-rebind-bindexecqueue", SHARED_VM | REBIND |
> >  			BIND_EXEC_QUEUE },
> >  		{ "shared-vm-userptr-rebind", SHARED_VM | USERPTR | REBIND },
> > -		{ "shared-vm-rebind-err", SHARED_VM | REBIND | REBIND_ERROR },
> > -		{ "shared-vm-userptr-rebind-err", SHARED_VM | USERPTR |
> > -			REBIND | REBIND_ERROR},
> > +		{ "rebind-err", REBIND | REBIND_ERROR },
> > +		{ "userptr-rebind-err", USERPTR | REBIND | REBIND_ERROR},
> >  		{ "shared-vm-userptr-invalidate", SHARED_VM | USERPTR |
> >  			INVALIDATE },
> >  		{ "shared-vm-userptr-invalidate-race", SHARED_VM | USERPTR |
> > @@ -1240,10 +1183,9 @@ igt_main
> >  		{ "hang-shared-vm-rebind", HANG | SHARED_VM | REBIND },
> >  		{ "hang-shared-vm-userptr-rebind", HANG | SHARED_VM | USERPTR |
> >  			REBIND },
> > -		{ "hang-shared-vm-rebind-err", HANG | SHARED_VM | REBIND |
> > +		{ "hang-rebind-err", HANG | REBIND | REBIND_ERROR },
> > +		{ "hang-userptr-rebind-err", HANG | USERPTR | REBIND |
> >  			REBIND_ERROR },
> > -		{ "hang-shared-vm-userptr-rebind-err", HANG | SHARED_VM |
> > -			USERPTR | REBIND | REBIND_ERROR },
> >  		{ "hang-shared-vm-userptr-invalidate", HANG | SHARED_VM |
> >  			USERPTR | INVALIDATE },
> >  		{ "hang-shared-vm-userptr-invalidate-race", HANG | SHARED_VM |
> > diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> > index ca85f5f18..2f349b16d 100644
> > --- a/tests/intel/xe_exercise_blt.c
> > +++ b/tests/intel/xe_exercise_blt.c
> > @@ -280,7 +280,7 @@ static void fast_copy_test(int xe,
> >  			region1 = igt_collection_get_value(regions, 0);
> >  			region2 = igt_collection_get_value(regions, 1);
> >  
> > -			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> >  			ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
> >  
> > diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
> > index 0327d8e0e..3f2c4ae23 100644
> > --- a/tests/intel/xe_guc_pc.c
> > +++ b/tests/intel/xe_guc_pc.c
> > @@ -60,7 +60,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> >  	igt_assert(n_execs > 0);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
> > index c9891a729..c71ff74a1 100644
> > --- a/tests/intel/xe_huc_copy.c
> > +++ b/tests/intel/xe_huc_copy.c
> > @@ -117,7 +117,7 @@ test_huc_copy(int fd)
> >  		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
> >  	};
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_VIDEO_DECODE);
> >  	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
> >  	sync.handle = syncobj_create(fd, 0);
> > diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> > index 0159a3164..26e4dcc85 100644
> > --- a/tests/intel/xe_intel_bb.c
> > +++ b/tests/intel/xe_intel_bb.c
> > @@ -191,7 +191,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
> >  	intel_bb_reset(ibb, true);
> >  
> >  	if (new_context) {
> > -		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  		ctx = xe_exec_queue_create(xe, vm, xe_hw_engine(xe, 0), 0);
> >  		intel_bb_destroy(ibb);
> >  		ibb = intel_bb_create_with_context(xe, ctx, vm, NULL, PAGE_SIZE);
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index fd28d5630..b2976ec84 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -259,7 +259,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  	if (check_rpm)
> >  		igt_assert(in_d3(device, d_state));
> >  
> > -	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  
> >  	if (check_rpm)
> >  		igt_assert(out_of_d3(device, d_state));
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index 89df6149a..dd3302337 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -275,7 +275,7 @@ static void unbind_all(int fd, int n_vmas)
> >  		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> >  	};
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo = xe_bo_create(fd, 0, vm, bo_size);
> >  
> >  	for (i = 0; i < n_vmas; ++i)
> > @@ -322,171 +322,6 @@ static void userptr_invalid(int fd)
> >  	xe_vm_destroy(fd, vm);
> >  }
> >  
> > -struct vm_thread_data {
> > -	pthread_t thread;
> > -	int fd;
> > -	int vm;
> > -	uint32_t bo;
> > -	size_t bo_size;
> > -	bool destroy;
> > -};
> > -
> > -/**
> > - * SUBTEST: vm-async-ops-err
> > - * Description: Test VM async ops error
> > - * Functionality: VM
> > - * Test category: negative test
> > - *
> > - * SUBTEST: vm-async-ops-err-destroy
> > - * Description: Test VM async ops error destroy
> > - * Functionality: VM
> > - * Test category: negative test
> > - */
> > -
> > -static void *vm_async_ops_err_thread(void *data)
> > -{
> > -	struct vm_thread_data *args = data;
> > -	int fd = args->fd;
> > -	uint64_t addr = 0x201a0000;
> > -	int num_binds = 0;
> > -	int ret;
> > -
> > -	struct drm_xe_wait_user_fence wait = {
> > -		.vm_id = args->vm,
> > -		.op = DRM_XE_UFENCE_WAIT_NEQ,
> > -		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
> > -		.mask = DRM_XE_UFENCE_WAIT_U32,
> > -		.timeout = MS_TO_NS(1000),
> > -	};
> > -
> > -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
> > -				&wait), 0);
> > -	if (args->destroy) {
> > -		usleep(5000);	/* Wait other binds to queue up */
> > -		xe_vm_destroy(fd, args->vm);
> > -		return NULL;
> > -	}
> > -
> > -	while (!ret) {
> > -		struct drm_xe_vm_bind bind = {
> > -			.vm_id = args->vm,
> > -			.num_binds = 1,
> > -			.bind.op = XE_VM_BIND_OP_RESTART,
> > -		};
> > -
> > -		/* VM sync ops should work */
> > -		if (!(num_binds++ % 2)) {
> > -			xe_vm_bind_sync(fd, args->vm, args->bo, 0, addr,
> > -					args->bo_size);
> > -		} else {
> > -			xe_vm_unbind_sync(fd, args->vm, 0, addr,
> > -					  args->bo_size);
> > -			addr += args->bo_size * 2;
> > -		}
> > -
> > -		/* Restart and wait for next error */
> > -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
> > -					&bind), 0);
> > -		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
> > -	}
> > -
> > -	return NULL;
> > -}
> > -
> > -static void vm_async_ops_err(int fd, bool destroy)
> > -{
> > -	uint32_t vm;
> > -	uint64_t addr = 0x1a0000;
> > -	struct drm_xe_sync sync = {
> > -		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> > -	};
> > -#define N_BINDS		32
> > -	struct vm_thread_data thread = {};
> > -	uint32_t syncobjs[N_BINDS];
> > -	size_t bo_size = 0x1000 * 32;
> > -	uint32_t bo;
> > -	int i, j;
> > -
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > -	bo = xe_bo_create(fd, 0, vm, bo_size);
> > -
> > -	thread.fd = fd;
> > -	thread.vm = vm;
> > -	thread.bo = bo;
> > -	thread.bo_size = bo_size;
> > -	thread.destroy = destroy;
> > -	pthread_create(&thread.thread, 0, vm_async_ops_err_thread, &thread);
> > -
> > -	for (i = 0; i < N_BINDS; i++)
> > -		syncobjs[i] = syncobj_create(fd, 0);
> > -
> > -	for (j = 0, i = 0; i < N_BINDS / 4; i++, j++) {
> > -		sync.handle = syncobjs[j];
> > -#define INJECT_ERROR	(0x1 << 31)
> > -		if (i == N_BINDS / 8)	/* Inject error on this bind */
> > -			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
> > -					    addr + i * bo_size * 2,
> > -					    bo_size, XE_VM_BIND_OP_MAP,
> > -					    XE_VM_BIND_FLAG_ASYNC |
> > -					    INJECT_ERROR, &sync, 1, 0, 0);
> > -		else
> > -			xe_vm_bind_async(fd, vm, 0, bo, 0,
> > -					 addr + i * bo_size * 2,
> > -					 bo_size, &sync, 1);
> > -	}
> > -
> > -	for (i = 0; i < N_BINDS / 4; i++, j++) {
> > -		sync.handle = syncobjs[j];
> > -		if (i == N_BINDS / 8)
> > -			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
> > -					    addr + i * bo_size * 2,
> > -					    bo_size, XE_VM_BIND_OP_UNMAP,
> > -					    XE_VM_BIND_FLAG_ASYNC |
> > -					    INJECT_ERROR, &sync, 1, 0, 0);
> > -		else
> > -			xe_vm_unbind_async(fd, vm, 0, 0,
> > -					   addr + i * bo_size * 2,
> > -					   bo_size, &sync, 1);
> > -	}
> > -
> > -	for (i = 0; i < N_BINDS / 4; i++, j++) {
> > -		sync.handle = syncobjs[j];
> > -		if (i == N_BINDS / 8)
> > -			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
> > -					    addr + i * bo_size * 2,
> > -					    bo_size, XE_VM_BIND_OP_MAP,
> > -					    XE_VM_BIND_FLAG_ASYNC |
> > -					    INJECT_ERROR, &sync, 1, 0, 0);
> > -		else
> > -			xe_vm_bind_async(fd, vm, 0, bo, 0,
> > -					 addr + i * bo_size * 2,
> > -					 bo_size, &sync, 1);
> > -	}
> > -
> > -	for (i = 0; i < N_BINDS / 4; i++, j++) {
> > -		sync.handle = syncobjs[j];
> > -		if (i == N_BINDS / 8)
> > -			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
> > -					    addr + i * bo_size * 2,
> > -					    bo_size, XE_VM_BIND_OP_UNMAP,
> > -					    XE_VM_BIND_FLAG_ASYNC |
> > -					    INJECT_ERROR, &sync, 1, 0, 0);
> > -		else
> > -			xe_vm_unbind_async(fd, vm, 0, 0,
> > -					   addr + i * bo_size * 2,
> > -					   bo_size, &sync, 1);
> > -	}
> > -
> > -	for (i = 0; i < N_BINDS; i++)
> > -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> > -					NULL));
> > -
> > -	if (!destroy)
> > -		xe_vm_destroy(fd, vm);
> > -
> > -	pthread_join(thread.thread, NULL);
> > -}
> > -
> >  /**
> >   * SUBTEST: shared-%s-page
> >   * Description: Test shared arg[1] page
> > @@ -537,7 +372,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
> >  	data = malloc(sizeof(*data) * n_bo);
> >  	igt_assert(data);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(struct shared_pte_page_data);
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -718,7 +553,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
> >  	struct xe_spin_opts spin_opts = { .preempt = true };
> >  	int i, b;
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * N_EXEC_QUEUES;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -728,7 +563,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
> >  
> >  	for (i = 0; i < N_EXEC_QUEUES; i++) {
> >  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > -		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
> > +		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
> >  		syncobjs[i] = syncobj_create(fd, 0);
> >  	}
> >  	syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
> > @@ -898,7 +733,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> >  
> >  	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> > @@ -908,7 +743,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> >  	data = xe_bo_map(fd, bo, bo_size);
> >  
> >  	if (flags & BIND_ARRAY_BIND_EXEC_QUEUE_FLAG)
> > -		bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
> > +		bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0, true);
> >  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> >  
> >  	for (i = 0; i < n_execs; ++i) {
> > @@ -1092,7 +927,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
> >  	}
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  
> >  	if (flags & LARGE_BIND_FLAG_USERPTR) {
> >  		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
> > @@ -1384,7 +1219,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
> >  			unbind_n_page_offset *= n_page_per_2mb;
> >  	}
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = page_size * bo_n_pages;
> >  
> >  	if (flags & MAP_FLAG_USERPTR) {
> > @@ -1684,7 +1519,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
> >  			unbind_n_page_offset *= n_page_per_2mb;
> >  	}
> >  
> > -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_size = page_size * bo_n_pages;
> >  
> >  	if (flags & MAP_FLAG_USERPTR) {
> > @@ -2001,12 +1836,6 @@ igt_main
> >  	igt_subtest("userptr-invalid")
> >  		userptr_invalid(fd);
> >  
> > -	igt_subtest("vm-async-ops-err")
> > -		vm_async_ops_err(fd, false);
> > -
> > -	igt_subtest("vm-async-ops-err-destroy")
> > -		vm_async_ops_err(fd, true);
> > -
> >  	igt_subtest("shared-pte-page")
> >  		xe_for_each_hw_engine(fd, hwe)
> >  			shared_pte_page(fd, hwe, 4,
> > diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> > index 34005fbeb..e0116f181 100644
> > --- a/tests/intel/xe_waitfence.c
> > +++ b/tests/intel/xe_waitfence.c
> > @@ -34,7 +34,7 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> >  
> >  	sync[0].addr = to_user_pointer(&wait_fence);
> >  	sync[0].timeline_value = val;
> > -	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
> > +	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
> >  }
> >  
> >  enum waittype {
> > @@ -63,7 +63,7 @@ waitfence(int fd, enum waittype wt)
> >  	uint32_t bo_7;
> >  	int64_t timeout;
> >  
> > -	uint32_t vm = xe_vm_create(fd, 0, 0);
> > +	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> >  	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
> >  	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
> 
> 
> Missing XE_VM_BIND_FLAG_ASYNC with the async vm... this and other tests here have similar problem.

It seems this flag is set in xe_vm_bind_async() which is called from do_bind(). Without it the
test would fail.

> 
> 
> >  	bo_2 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
> > @@ -96,21 +96,6 @@ waitfence(int fd, enum waittype wt)
> >  			  ", elapsed: %" PRId64 "\n",
> >  			  timeout, signalled, signalled - current);
> >  	}
> > -
> > -	xe_vm_unbind_sync(fd, vm, 0, 0x200000, 0x40000);
> > -	xe_vm_unbind_sync(fd, vm, 0, 0xc0000000, 0x40000);
> > -	xe_vm_unbind_sync(fd, vm, 0, 0x180000000, 0x40000);
> > -	xe_vm_unbind_sync(fd, vm, 0, 0x140000000, 0x10000);
> > -	xe_vm_unbind_sync(fd, vm, 0, 0x100000000, 0x100000);
> > -	xe_vm_unbind_sync(fd, vm, 0, 0xc0040000, 0x1c0000);
> > -	xe_vm_unbind_sync(fd, vm, 0, 0xeffff0000, 0x10000);
> > -	gem_close(fd, bo_7);
> > -	gem_close(fd, bo_6);
> > -	gem_close(fd, bo_5);
> > -	gem_close(fd, bo_4);
> > -	gem_close(fd, bo_3);
> > -	gem_close(fd, bo_2);
> > -	gem_close(fd, bo_1);
> 
> unrelated change.
> 
> >  }
> >  
> >  igt_main
> 
