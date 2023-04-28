Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3DD10E3A2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 08:40:54 +0000 (UTC)
Message-ID: <38558e68-ad22-6efb-cb7e-6025790787f9@intel.com>
Date: Fri, 28 Apr 2023 10:40:50 +0200
MIME-Version: 1.0
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
 <20230428062224.21322-11-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
In-Reply-To: <20230428062224.21322-11-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v8 10/17] lib/intel_batchbuffer: Add Xe
 support in intel-bb
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zbigniew,

On 28.04.2023 08:22, Zbigniew Kempczyński wrote:
> Intention of creating intel-bb was to replace libdrm for i915.
> Due to many code relies on it (kms for example) most rational way
> is to extend and add Xe path to it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/intel_batchbuffer.c | 336 ++++++++++++++++++++++++++++++++--------
>   lib/intel_batchbuffer.h |   6 +
>   2 files changed, 281 insertions(+), 61 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 306b7650e9..38ad792e55 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -28,18 +28,22 @@
>   #include <search.h>
>   #include <glib.h>
>   
> +#include "gpgpu_fill.h"
> +#include "huc_copy.h"
>   #include "i915/gem_create.h"
> +#include "i915/gem_mman.h"
> +#include "i915/i915_blt.h"
> +#include "igt_aux.h"
> +#include "igt_syncobj.h"
>   #include "intel_batchbuffer.h"
>   #include "intel_bufops.h"
>   #include "intel_chipset.h"
>   #include "media_fill.h"
>   #include "media_spin.h"
> -#include "i915/gem_mman.h"
> -#include "veboxcopy.h"
>   #include "sw_sync.h"
> -#include "gpgpu_fill.h"
> -#include "huc_copy.h"
> -#include "i915/i915_blt.h"
> +#include "veboxcopy.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>   
>   #define BCS_SWCTRL 0x22200
>   #define BCS_SRC_Y (1 << 0)
> @@ -828,9 +832,10 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>   
>   /**
>    * __intel_bb_create:
> - * @fd: drm fd
> + * @fd: drm fd - i915 or xe
>    * @ctx: context id
> - * @cfg: intel_ctx configuration, NULL for default context or legacy mode
> + * @cfg: for i915 intel_ctx configuration, NULL for default context or legacy mode,
> + *       unused for xe
>    * @size: size of the batchbuffer
>    * @do_relocs: use relocations or allocator
>    * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
> @@ -842,7 +847,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>    * Before entering into each scenarios generic rule is intel-bb keeps objects
>    * and their offsets in the internal cache and reuses in subsequent execs.
>    *
> - * 1. intel-bb with relocations
> + * 1. intel-bb with relocations (i915 only)
>    *
>    * Creating new intel-bb adds handle to cache implicitly and sets its address
>    * to 0. Objects added to intel-bb later also have address 0 set for first run.
> @@ -850,11 +855,12 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>    * works in reloc mode addresses are only suggestion to the driver and we
>    * cannot be sure they won't change at next exec.
>    *
> - * 2. with allocator
> + * 2. with allocator (i915 or xe)
>    *
>    * This mode is valid only for ppgtt. Addresses are acquired from allocator
> - * and softpinned. intel-bb cache must be then coherent with allocator
> - * (simple is coherent, reloc partially [doesn't support address reservation]).
> + * and softpinned (i915) or vm-binded (xe). intel-bb cache must be then
> + * coherent with allocator (simple is coherent, reloc partially [doesn't
> + * support address reservation]).
>    * When we do intel-bb reset with purging cache it has to reacquire addresses
>    * from allocator (allocator should return same address - what is true for
>    * simple and reloc allocators).
> @@ -883,48 +889,75 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
>   
>   	igt_assert(ibb);
>   
> -	ibb->uses_full_ppgtt = gem_uses_full_ppgtt(fd);
>   	ibb->devid = intel_get_drm_devid(fd);
>   	ibb->gen = intel_gen(ibb->devid);
> +	ibb->ctx = ctx;
> +
> +	ibb->fd = fd;
> +	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
> +					   is_xe_device(fd) ? INTEL_DRIVER_XE : 0;
> +	igt_assert(ibb->driver);
>   
>   	/*
>   	 * If we don't have full ppgtt driver can change our addresses
>   	 * so allocator is useless in this case. Just enforce relocations
>   	 * for such gens and don't use allocator at all.
>   	 */
> -	if (!ibb->uses_full_ppgtt)
> -		do_relocs = true;
> +	if (ibb->driver == INTEL_DRIVER_I915) {
> +		ibb->uses_full_ppgtt = gem_uses_full_ppgtt(fd);
> +		ibb->alignment = gem_detect_safe_alignment(fd);
> +		ibb->gtt_size = gem_aperture_size(fd);
> +		ibb->handle = gem_create(fd, size);
>   
> -	/*
> -	 * For softpin mode allocator has full control over offsets allocation
> -	 * so we want kernel to not interfere with this.
> -	 */
> -	if (do_relocs)
> -		ibb->allows_obj_alignment = gem_allows_obj_alignment(fd);
> +		if (!ibb->uses_full_ppgtt)
> +			do_relocs = true;
> +
> +		/*
> +		 * For softpin mode allocator has full control over offsets allocation
> +		 * so we want kernel to not interfere with this.
> +		 */
> +		if (do_relocs) {
> +			ibb->allows_obj_alignment = gem_allows_obj_alignment(fd);
> +			allocator_type = INTEL_ALLOCATOR_NONE;
> +		} else {
> +			/* Use safe start offset instead assuming 0x0 is safe */
> +			start = max_t(uint64_t, start, gem_detect_safe_start_offset(fd));
> +
> +			/* if relocs are set we won't use an allocator */
> +			ibb->allocator_handle =
> +				intel_allocator_open_full(fd, ctx, start, end,
> +							  allocator_type,
> +							  strategy, 0);
> +		}
>   
> -	/* Use safe start offset instead assuming 0x0 is safe */
> -	start = max_t(uint64_t, start, gem_detect_safe_start_offset(fd));
> +		ibb->vm_id = 0;
> +	} else {
> +		igt_assert(!do_relocs);
> +
> +		ibb->alignment = xe_get_default_alignment(fd);
> +		size = ALIGN(size, ibb->alignment);
> +		ibb->handle = xe_bo_create_flags(fd, 0, size, vram_if_possible(fd, 0));
> +		ibb->gtt_size = 1ull << xe_va_bits(fd);
> +
> +		if (!ctx)
> +			ctx = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +
> +		ibb->uses_full_ppgtt = true;
> +		ibb->allocator_handle =
> +			intel_allocator_open_full(fd, ctx, start, end,
> +						  allocator_type, strategy,
> +						  ibb->alignment);
> +		ibb->vm_id = ctx;
> +		ibb->last_engine = ~0U;
> +	}
>   
> -	/* if relocs are set we won't use an allocator */
> -	if (do_relocs)
> -		allocator_type = INTEL_ALLOCATOR_NONE;
> -	else
> -		ibb->allocator_handle = intel_allocator_open_full(fd, ctx,
> -								  start, end,
> -								  allocator_type,
> -								  strategy, 0);
>   	ibb->allocator_type = allocator_type;
>   	ibb->allocator_strategy = strategy;
>   	ibb->allocator_start = start;
>   	ibb->allocator_end = end;
> -
> -	ibb->fd = fd;
>   	ibb->enforce_relocs = do_relocs;
> -	ibb->handle = gem_create(fd, size);
> +
>   	ibb->size = size;
> -	ibb->alignment = gem_detect_safe_alignment(fd);
> -	ibb->ctx = ctx;
> -	ibb->vm_id = 0;
>   	ibb->batch = calloc(1, size);
>   	igt_assert(ibb->batch);
>   	ibb->ptr = ibb->batch;
> @@ -937,7 +970,6 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
>   		memcpy(ibb->cfg, cfg, sizeof(*cfg));
>   	}
>   
> -	ibb->gtt_size = gem_aperture_size(fd);
>   	if ((ibb->gtt_size - 1) >> 32)
>   		ibb->supports_48b_address = true;
>   
> @@ -961,7 +993,7 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
>   
>   /**
>    * intel_bb_create_full:
> - * @fd: drm fd
> + * @fd: drm fd - i915 or xe
>    * @ctx: context
>    * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>    * @size: size of the batchbuffer
> @@ -992,7 +1024,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx,
>   
>   /**
>    * intel_bb_create_with_allocator:
> - * @fd: drm fd
> + * @fd: drm fd - i915 or xe
>    * @ctx: context
>    * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>    * @size: size of the batchbuffer
> @@ -1027,7 +1059,7 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
>   
>   /**
>    * intel_bb_create:
> - * @fd: drm fd
> + * @fd: drm fd - i915 or xe
>    * @size: size of the batchbuffer
>    *
>    * Creates bb with default context.
> @@ -1047,7 +1079,7 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
>    */
>   struct intel_bb *intel_bb_create(int fd, uint32_t size)
>   {
> -	bool relocs = gem_has_relocations(fd);
> +	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
>   
>   	return __intel_bb_create(fd, 0, NULL, size,
>   				 relocs && !aux_needs_softpin(fd), 0, 0,
> @@ -1057,7 +1089,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
>   
>   /**
>    * intel_bb_create_with_context:
> - * @fd: drm fd
> + * @fd: drm fd - i915 or xe
>    * @ctx: context id
>    * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>    * @size: size of the batchbuffer
> @@ -1073,7 +1105,7 @@ struct intel_bb *
>   intel_bb_create_with_context(int fd, uint32_t ctx,
>   			     const intel_ctx_cfg_t *cfg, uint32_t size)
>   {
> -	bool relocs = gem_has_relocations(fd);
> +	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
>   
>   	return __intel_bb_create(fd, ctx, cfg, size,
>   				 relocs && !aux_needs_softpin(fd), 0, 0,
> @@ -1083,7 +1115,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx,
>   
>   /**
>    * intel_bb_create_with_relocs:
> - * @fd: drm fd
> + * @fd: drm fd - i915
>    * @size: size of the batchbuffer
>    *
>    * Creates bb which will disable passing addresses.
> @@ -1095,7 +1127,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx,
>    */
>   struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>   {
> -	igt_require(gem_has_relocations(fd));
> +	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
>   
>   	return __intel_bb_create(fd, 0, NULL, size, true, 0, 0,
>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
> @@ -1103,7 +1135,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>   
>   /**
>    * intel_bb_create_with_relocs_and_context:
> - * @fd: drm fd
> + * @fd: drm fd - i915
>    * @ctx: context
>    * @cfg: intel_ctx configuration, NULL for default context or legacy mode
>    * @size: size of the batchbuffer
> @@ -1120,7 +1152,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
>   					const intel_ctx_cfg_t *cfg,
>   					uint32_t size)
>   {
> -	igt_require(gem_has_relocations(fd));
> +	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
>   
>   	return __intel_bb_create(fd, ctx, cfg, size, true, 0, 0,
>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
> @@ -1221,12 +1253,76 @@ void intel_bb_destroy(struct intel_bb *ibb)
>   
>   	if (ibb->fence >= 0)
>   		close(ibb->fence);
> +	if (ibb->engine_syncobj)
> +		syncobj_destroy(ibb->fd, ibb->engine_syncobj);
> +	if (ibb->vm_id && !ibb->ctx)
> +		xe_vm_destroy(ibb->fd, ibb->vm_id);
>   
>   	free(ibb->batch);
>   	free(ibb->cfg);
>   	free(ibb);
>   }
>   
> +static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
> +						   uint32_t op, uint32_t region)
> +{
> +	struct drm_i915_gem_exec_object2 **objects = ibb->objects;
> +	struct drm_xe_vm_bind_op *bind_ops, *ops;
> +	bool set_obj = (op & 0xffff) == XE_VM_BIND_OP_MAP;
> +
> +	bind_ops = calloc(ibb->num_objects, sizeof(*bind_ops));
> +	igt_assert(bind_ops);
> +
> +	igt_debug("bind_ops: %s\n", set_obj ? "MAP" : "UNMAP");
> +	for (int i = 0; i < ibb->num_objects; i++) {
> +		ops = &bind_ops[i];
> +
> +		if (set_obj)
> +			ops->obj = objects[i]->handle;
> +
> +		ops->op = op;
> +		ops->obj_offset = 0;
> +		ops->addr = objects[i]->offset;
> +		ops->range = objects[i]->rsvd1;
> +		ops->region = region;
> +
> +		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx\n",
> +			  i, ops->obj, (long long)ops->addr, (long long)ops->range);
> +	}
> +
> +	return bind_ops;
> +}
> +
> +static void __unbind_xe_objects(struct intel_bb *ibb)
> +{
> +	struct drm_xe_sync syncs[2] = {
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ },
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> +	};
> +	int ret;
> +
> +	syncs[0].handle = ibb->engine_syncobj;
> +	syncs[1].handle = syncobj_create(ibb->fd, 0);
> +
> +	if (ibb->num_objects > 1) {
> +		struct drm_xe_vm_bind_op *bind_ops;
> +		uint32_t op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
> +
> +		bind_ops = xe_alloc_bind_ops(ibb, op, 0);
> +		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
> +				 ibb->num_objects, syncs, 2);
> +		free(bind_ops);
> +	} else {
> +		xe_vm_unbind_async(ibb->fd, ibb->vm_id, 0, 0,
> +				   ibb->batch_offset, ibb->size, syncs, 2);
> +	}
> +	ret = syncobj_wait_err(ibb->fd, &syncs[1].handle, 1, INT64_MAX, 0);
> +	igt_assert_eq(ret, 0);
> +	syncobj_destroy(ibb->fd, syncs[1].handle);
> +
> +	ibb->xe_bound = false;
> +}
> +
>   /*
>    * intel_bb_reset:
>    * @ibb: pointer to intel_bb
> @@ -1258,6 +1354,9 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
>   	for (i = 0; i < ibb->num_objects; i++)
>   		ibb->objects[i]->flags &= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>   
> +	if (is_xe_device(ibb->fd) && ibb->xe_bound)

Maybe: 'ibb->driver == INTEL_DRIVER_XE'. Sorry for noticing just now.

Anyway, I uphold:
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Christoph


> +		__unbind_xe_objects(ibb);
> +
>   	__intel_bb_destroy_relocations(ibb);
>   	__intel_bb_destroy_objects(ibb);
>   	__reallocate_objects(ibb);
> @@ -1278,7 +1377,11 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
>   				       ibb->size);
>   
>   	gem_close(ibb->fd, ibb->handle);
> -	ibb->handle = gem_create(ibb->fd, ibb->size);
> +	if (ibb->driver == INTEL_DRIVER_I915)
> +		ibb->handle = gem_create(ibb->fd, ibb->size);
> +	else
> +		ibb->handle = xe_bo_create_flags(ibb->fd, 0, ibb->size,
> +						 vram_if_possible(ibb->fd, 0));
>   
>   	/* Reacquire offset for RELOC and SIMPLE */
>   	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE ||
> @@ -1305,13 +1408,19 @@ int intel_bb_sync(struct intel_bb *ibb)
>   {
>   	int ret;
>   
> -	if (ibb->fence < 0)
> +	if (ibb->fence < 0 && !ibb->engine_syncobj)
>   		return 0;
>   
> -	ret = sync_fence_wait(ibb->fence, -1);
> -	if (ret == 0) {
> -		close(ibb->fence);
> -		ibb->fence = -1;
> +	if (ibb->fence >= 0) {
> +		ret = sync_fence_wait(ibb->fence, -1);
> +		if (ret == 0) {
> +			close(ibb->fence);
> +			ibb->fence = -1;
> +		}
> +	} else {
> +		igt_assert_neq(ibb->engine_syncobj, 0);
> +		ret = syncobj_wait_err(ibb->fd, &ibb->engine_syncobj,
> +				       1, INT64_MAX, 0);
>   	}
>   
>   	return ret;
> @@ -1502,7 +1611,7 @@ static void __remove_from_objects(struct intel_bb *ibb,
>   }
>   
>   /**
> - * intel_bb_add_object:
> + * __intel_bb_add_object:
>    * @ibb: pointer to intel_bb
>    * @handle: which handle to add to objects array
>    * @size: object size
> @@ -1514,9 +1623,9 @@ static void __remove_from_objects(struct intel_bb *ibb,
>    * in the object tree. When object is a render target it has to
>    * be marked with EXEC_OBJECT_WRITE flag.
>    */
> -struct drm_i915_gem_exec_object2 *
> -intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
> -		    uint64_t offset, uint64_t alignment, bool write)
> +static struct drm_i915_gem_exec_object2 *
> +__intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
> +		      uint64_t offset, uint64_t alignment, bool write)
>   {
>   	struct drm_i915_gem_exec_object2 *object;
>   
> @@ -1524,8 +1633,12 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
>   		   || ALIGN(offset, alignment) == offset);
>   	igt_assert(is_power_of_two(alignment));
>   
> +	if (ibb->driver == INTEL_DRIVER_I915)
> +		alignment = max_t(uint64_t, alignment, gem_detect_safe_alignment(ibb->fd));
> +	else
> +		alignment = max_t(uint64_t, ibb->alignment, alignment);
> +
>   	object = __add_to_cache(ibb, handle);
> -	alignment = max_t(uint64_t, alignment, gem_detect_safe_alignment(ibb->fd));
>   	__add_to_objects(ibb, object);
>   
>   	/*
> @@ -1585,9 +1698,27 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
>   	if (ibb->allows_obj_alignment)
>   		object->alignment = alignment;
>   
> +	if (ibb->driver == INTEL_DRIVER_XE) {
> +		object->alignment = alignment;
> +		object->rsvd1 = size;
> +	}
> +
>   	return object;
>   }
>   
> +struct drm_i915_gem_exec_object2 *
> +intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
> +		    uint64_t offset, uint64_t alignment, bool write)
> +{
> +	struct drm_i915_gem_exec_object2 *obj = NULL;
> +
> +	obj = __intel_bb_add_object(ibb, handle, size, offset,
> +				    alignment, write);
> +	igt_assert(obj);
> +
> +	return obj;
> +}
> +
>   bool intel_bb_remove_object(struct intel_bb *ibb, uint32_t handle,
>   			    uint64_t offset, uint64_t size)
>   {
> @@ -2136,6 +2267,82 @@ static void update_offsets(struct intel_bb *ibb,
>   }
>   
>   #define LINELEN 76
> +
> +static int
> +__xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
> +{
> +	uint32_t engine = flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK);
> +	uint32_t engine_id;
> +	struct drm_xe_sync syncs[2] = {
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> +	};
> +	struct drm_xe_vm_bind_op *bind_ops;
> +	void *map;
> +
> +	igt_assert_eq(ibb->num_relocs, 0);
> +	igt_assert_eq(ibb->xe_bound, false);
> +
> +	if (ibb->last_engine != engine) {
> +		struct drm_xe_engine_class_instance inst = { };
> +
> +		inst.engine_instance =
> +			(flags & I915_EXEC_BSD_MASK) >> I915_EXEC_BSD_SHIFT;
> +
> +		switch (flags & I915_EXEC_RING_MASK) {
> +		case I915_EXEC_DEFAULT:
> +		case I915_EXEC_BLT:
> +			inst.engine_class = DRM_XE_ENGINE_CLASS_COPY;
> +			break;
> +		case I915_EXEC_BSD:
> +			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> +			break;
> +		case I915_EXEC_RENDER:
> +			inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> +			break;
> +		case I915_EXEC_VEBOX:
> +			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +			break;
> +		default:
> +			igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
> +		}
> +		igt_debug("Run on %s\n", xe_engine_class_string(inst.engine_class));
> +
> +		ibb->engine_id = engine_id =
> +			xe_engine_create(ibb->fd, ibb->vm_id, &inst, 0);
> +	} else {
> +		engine_id = ibb->engine_id;
> +	}
> +	ibb->last_engine = engine;
> +
> +	map = xe_bo_map(ibb->fd, ibb->handle, ibb->size);
> +	memcpy(map, ibb->batch, ibb->size);
> +	gem_munmap(map, ibb->size);
> +
> +	syncs[0].handle = syncobj_create(ibb->fd, 0);
> +	if (ibb->num_objects > 1) {
> +		bind_ops = xe_alloc_bind_ops(ibb, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, 0);
> +		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
> +				 ibb->num_objects, syncs, 1);
> +		free(bind_ops);
> +	} else {
> +		xe_vm_bind_async(ibb->fd, ibb->vm_id, 0, ibb->handle, 0,
> +				 ibb->batch_offset, ibb->size, syncs, 1);
> +	}
> +	ibb->xe_bound = true;
> +
> +	syncs[0].flags &= ~DRM_XE_SYNC_SIGNAL;
> +	ibb->engine_syncobj = syncobj_create(ibb->fd, 0);
> +	syncs[1].handle = ibb->engine_syncobj;
> +
> +	xe_exec_sync(ibb->fd, engine_id, ibb->batch_offset, syncs, 2);
> +
> +	if (sync)
> +		intel_bb_sync(ibb);
> +
> +	return 0;
> +}
> +
>   /*
>    * __intel_bb_exec:
>    * @ibb: pointer to intel_bb
> @@ -2221,7 +2428,7 @@ int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
>   /**
>    * intel_bb_exec:
>    * @ibb: pointer to intel_bb
> - * @end_offset: offset of the last instruction in the bb
> + * @end_offset: offset of the last instruction in the bb (for i915)
>    * @flags: flags passed directly to execbuf
>    * @sync: if true wait for execbuf completion, otherwise caller is responsible
>    * to wait for completion
> @@ -2231,7 +2438,13 @@ int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
>   void intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
>   		   uint64_t flags, bool sync)
>   {
> -	igt_assert_eq(__intel_bb_exec(ibb, end_offset, flags, sync), 0);
> +	if (ibb->dump_base64)
> +		intel_bb_dump_base64(ibb, LINELEN);
> +
> +	if (ibb->driver == INTEL_DRIVER_I915)
> +		igt_assert_eq(__intel_bb_exec(ibb, end_offset, flags, sync), 0);
> +	else
> +		igt_assert_eq(__xe_bb_exec(ibb, flags, sync), 0);
>   }
>   
>   /**
> @@ -2636,7 +2849,8 @@ static void __intel_bb_reinit_alloc(struct intel_bb *ibb)
>   							  ibb->allocator_start, ibb->allocator_end,
>   							  ibb->allocator_type,
>   							  ibb->allocator_strategy,
> -							  0);
> +							  ibb->alignment);
> +
>   	intel_bb_reset(ibb, true);
>   }
>   
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 4978b6fb29..9a58fb7809 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -246,6 +246,7 @@ struct intel_bb {
>   	uint8_t allocator_type;
>   	enum allocator_strategy allocator_strategy;
>   
> +	enum intel_driver driver;
>   	int fd;
>   	unsigned int gen;
>   	bool debug;
> @@ -268,6 +269,11 @@ struct intel_bb {
>   	uint32_t ctx;
>   	uint32_t vm_id;
>   
> +	bool xe_bound;
> +	uint32_t engine_syncobj;
> +	uint32_t engine_id;
> +	uint32_t last_engine;
> +
>   	/* Context configuration */
>   	intel_ctx_cfg_t *cfg;
>   
