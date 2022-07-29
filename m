Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01FB10E314
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 10:22:48 +0000 (UTC)
Date: Fri, 29 Jul 2022 12:22:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YuO08xPrS/fxZ6CZ@kamilkon-desk1>
References: <ceda16ea0f883037750ee6b60eb6951590865d69.1658923128.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ceda16ea0f883037750ee6b60eb6951590865d69.1658923128.git.mchehab@kernel.org>
Subject: Re: [igt-dev] [PATCH] i915/gem_exec_tlb: Look for stale TLB entries
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

I only glanced over code and have some nits, see below.

On 2022-07-27 at 13:58:48 +0200, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> When we remove an object from the ppGTT, we replace its PTE by pointing
> the address back to the scratch page. Fresh access to that address will
> then report the absence of the page, and return the scratch page
> instead. However, concurrent access to that address will reuse the TLB
> address cache and so continue to read the stale physical page, unless
> the TLB are flushed (prior to the page going out of scope).
> 
> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/i915/intel_memory_region.c |    4 +-
>  lib/i915/intel_memory_region.h |    4 +-
>  tests/i915/gem_exec_tlb.c      | 1124 ++++++++++++++++++++++++++++++++
>  tests/i915/gem_gpgpu_fill.c    |    2 +
>  tests/meson.build              |    1 +
>  5 files changed, 1131 insertions(+), 4 deletions(-)
>  create mode 100644 tests/i915/gem_exec_tlb.c
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 93a18982c140..568bace949f6 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -198,7 +198,7 @@ bool gem_has_lmem(int fd)
>  /* A version of gem_create_in_memory_region_list which can be allowed to
>     fail so that the object creation can be retried */
>  int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
> -				       struct drm_i915_gem_memory_class_instance *mem_regions,
> +				       const struct drm_i915_gem_memory_class_instance *mem_regions,
>  				       int num_regions)

Please split this into separate patch.

>  {
>  	struct drm_i915_gem_create_ext_memory_regions ext_regions = {
> @@ -234,7 +234,7 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
>   * @num_regions: @mem_regions length
>   */
>  uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
> -					  struct drm_i915_gem_memory_class_instance *mem_regions,
> +					  const struct drm_i915_gem_memory_class_instance *mem_regions,
>  					  int num_regions)
>  {
>  	uint32_t handle;
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index e1bfe0ca653a..fd04df83b53b 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -65,11 +65,11 @@ unsigned int gem_get_lmem_region_count(int fd);
>  bool gem_has_lmem(int fd);
>  
>  int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
> -				       struct drm_i915_gem_memory_class_instance *mem_regions,
> +				       const struct drm_i915_gem_memory_class_instance *mem_regions,
>  				       int num_regions);
>  
>  uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
> -					  struct drm_i915_gem_memory_class_instance *mem_regions,
> +					  const struct drm_i915_gem_memory_class_instance *mem_regions,
>  					  int num_regions);
>  
>  /*
> diff --git a/tests/i915/gem_exec_tlb.c b/tests/i915/gem_exec_tlb.c
> new file mode 100644
> index 000000000000..ab5c91d6d8fa
> --- /dev/null
> +++ b/tests/i915/gem_exec_tlb.c
> @@ -0,0 +1,1124 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <sys/ioctl.h>
> +#include <sys/poll.h>
> +#include <sys/socket.h>
> +
> +#include "drmtest.h"
> +#include "i830_reg.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +#include "i915/gem_engine_topology.h"
> +#include "i915/gem_mman.h"
> +#include "i915/intel_memory_region.h"
> +#include "igt_aux.h"
> +#include "igt_gt.h"
> +#include "intel_chipset.h"
> +#include "ioctl_wrappers.h"

Please add global test description here.

> +
> +#define TOLERANCE 20 /* ms, allow for a little propagation delay */
> +#define SZ_512K (512 << 10)
> +#define SZ_1M (1 << 20)
> +#define SZ_2M (2 << 20)
> +
> +#define SHRINK 0x1
> +
> +#define NSEC64 ((uint64_t)NSEC_PER_SEC)
> +
> +#define MI_BATCH_BUFFER_START	 (0x31 << 23)
> +#define MI_COND_BATCH_BUFFER_END (0x36 << 23)
> +#define   MI_DO_COMPARE			(1 << 21)
> +#define MI_STORE_DATA_IMM	(0x20 << 23)
> +#define MI_LOAD_REGISTER_IMM	(0x22 << 23)
> +#define MI_STORE_REGISTER_MEM	(0x24 << 23)
> +#define MI_LOAD_REGISTER_MEM	(0x29 << 23)
> +#define MI_SEMAPHORE_WAIT	(0x1c << 23)
> +#define   MI_SEMAPHORE_POLL             (1 << 15)
> +#define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
> +#define   MI_SEMAPHORE_SAD_GTE_SDD      (1 << 12)
> +#define   MI_SEMAPHORE_SAD_LT_SDD       (2 << 12)
> +#define   MI_SEMAPHORE_SAD_LTE_SDD      (3 << 12)
> +#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
> +#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
> +
> +#define MI_MATH                      (0x1a << 23)
> +#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
> +/* Opcodes for MI_MATH_INSTR */
> +#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
> +#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
> +#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
> +#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
> +#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
> +#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
> +#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
> +#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
> +#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
> +#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
> +#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
> +#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
> +/* Registers used as operands in MI_MATH_INSTR */
> +#define   MI_MATH_REG(x)                (x)
> +#define   MI_MATH_REG_SRCA              0x20
> +#define   MI_MATH_REG_SRCB              0x21
> +#define   MI_MATH_REG_ACCU              0x31
> +#define   MI_MATH_REG_ZF                0x32
> +#define   MI_MATH_REG_CF                0x33
> +
> +#define XY_SRC_COPY (2 << 29 | 0x53 << 22)
> +#define XY_COLOR (2 << 29 | 0x50 << 22)
> +
> +#define CS_GPR(x) ((base) + 0x600 + 8 * (x))
> +#define CS_TIMESTAMP ((base) + 0x358)
> +
> +static uint32_t __batch_create(int i915, uint32_t offset)
> +{
> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> +	uint32_t handle;
> +
> +	handle = gem_create(i915, offset + 4);
> +	gem_write(i915, handle, offset, &bbe, sizeof(bbe));
> +
> +	return handle;
> +}
> +
> +static uint32_t batch_create(int i915)
> +{
> +	return __batch_create(i915, 0);
> +}
> +
> +static void bind_at(int i915, const intel_ctx_t *ctx,
> +		    const struct intel_execution_engine2 *e,
> +		    uint32_t handle, uint64_t addr, uint64_t size)
> +{
> +	struct drm_i915_gem_exec_object2 obj[2] = {
> +		{ .handle = handle, .offset = addr, .pad_to_size = size, .flags = EXEC_OBJECT_PINNED },
> +		{ batch_create(i915) }
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(obj),
> +		.buffer_count = ARRAY_SIZE(obj),
> +		.flags = e->flags,
> +		.rsvd1 = ctx->id,
> +	};
> +
> +	gem_execbuf(i915, &execbuf);
> +	gem_sync(i915, obj[1].handle);
> +	gem_close(i915, obj[1].handle);
> +}
> +
> +static unsigned long offset_in_page(void *addr)
> +{
> +	return (uintptr_t)addr & 4095;
> +}
> +
> +static uint32_t __read_at(int i915, const intel_ctx_t *ctx,
> +			  const struct intel_execution_engine2 *e,
> +			  const uint32_t base,
> +			  uint64_t addr, uint64_t from)
> +{
> +	const int gen = intel_gen(intel_get_drm_devid(i915));
> +	const int use_64b_addr = gen >= 8;
> +	struct drm_i915_gem_exec_object2 obj = {
> +		.handle = gem_create(i915, 4096),
> +		.offset = from,
> +		.flags = EXEC_OBJECT_PINNED
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.batch_len = 64,
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +		.flags = e->flags,
> +		.rsvd1 = ctx->id,
> +	};
> +	uint32_t *map =
> +		gem_mmap__device_coherent(i915, obj.handle,
> +					  0, 4096, PROT_WRITE);
> +	uint32_t *cs = map;
> +	uint32_t value;
> +
> +	*cs++ = MI_NOOP | 0x1234;
> +
> +	*cs++ = MI_LOAD_REGISTER_MEM | (1 + use_64b_addr);
> +	*cs++ = CS_GPR(4);
> +	*cs++ = addr;
> +	*cs++ = addr >> 32;
> +
> +	*cs++ = MI_STORE_REGISTER_MEM | (1 + use_64b_addr);
> +	*cs++ = CS_GPR(4);
> +	*cs++ = from;
> +	*cs++ = from >> 32;
> +
> +	*cs++ = MI_BATCH_BUFFER_END;
> +
> +	gem_execbuf(i915, &execbuf);
> +	gem_sync(i915, obj.handle);
> +	gem_close(i915, obj.handle);
> +	value = *map;
> +	munmap(map, 4096);
> +
> +	igt_assert_neq(value, 0x1234);
> +	return value;
> +}
> +
> +static uint32_t read_at(int i915, const intel_ctx_t *ctx,
> +			const struct intel_execution_engine2 *e,
> +			uint64_t addr, uint64_t from)
> +{
> +	return __read_at(i915, ctx, e, gem_engine_mmio_base(i915, e->name),
> +			 addr, from);
> +}
> +
> +static uint32_t copy_from(int i915, const intel_ctx_t *ctx,
> +			  const struct intel_execution_engine2 *e,
> +			  uint64_t addr, uint64_t from)
> +{
> +	const int gen = intel_gen(intel_get_drm_devid(i915));
> +	const int use_64b_addr = gen >= 8;
> +	struct drm_i915_gem_exec_object2 obj = {
> +		.handle = gem_create(i915, 4096),
> +		.offset = from,
> +		.flags = EXEC_OBJECT_PINNED
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.batch_len = 64,
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +		.flags = e->flags,
> +		.rsvd1 = ctx->id,
> +	};
> +	uint32_t *map =
> +		gem_mmap__device_coherent(i915, obj.handle,
> +					  0, 4096, PROT_WRITE);
> +	uint32_t *cs = map;
> +	uint32_t value;
> +
> +	*cs++ = MI_NOOP | 0x1234;
> +
> +	*cs++ = XY_SRC_COPY | (3 << 20) | (6 + 2 * use_64b_addr);
> +	*cs++ = 3 << 24 | 0xcc << 16 | 4096;
> +	*cs++ = 0;
> +	*cs++ = 1 << 16 | 1;
> +	*cs++ = from;
> +	if (use_64b_addr)
> +		*cs++ = from >> 32;
> +	*cs++ = 0;
> +	*cs++ = 4096;
> +	*cs++ = addr;
> +	if (use_64b_addr)
> +		*cs++ = addr >> 32;
> +
> +	*cs++ = MI_BATCH_BUFFER_END;
> +
> +	gem_execbuf(i915, &execbuf);
> +	gem_sync(i915, obj.handle);
> +	gem_close(i915, obj.handle);
> +	value = *map;
> +	munmap(map, 4096);
> +
> +	igt_assert_neq(value, 0x1234);
> +	return value;
> +}
> +
> +static uint64_t find_hole(int i915, const intel_ctx_t *ctx,
> +			  const struct intel_execution_engine2 *e,
> +			  uint64_t size)
> +{
> +	struct drm_i915_gem_exec_object2 obj = {
> +		.handle = __batch_create(i915, 4 * size),
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +		.flags = e->flags,
> +		.rsvd1 = ctx->id,
> +	};
> +	uint64_t hole;
> +
> +	gem_execbuf(i915, &execbuf);
> +	hole = obj.offset + size; /* leave a guard on either side */
> +	gem_close(i915, obj.handle);
> +
> +	obj.handle = batch_create(i915),
> +	obj.offset += 3 * size;
> +	gem_execbuf(i915, &execbuf); /* force an unbind of hole */
> +
> +	gem_sync(i915, obj.handle);
> +	gem_close(i915, obj.handle);
> +
> +	return hole;
> +}
> +
> +static uint32_t stale_create(int i915,
> +			     const struct gem_memory_region *mr,
> +			     uint64_t size, uint8_t val)
> +{
> +	uint32_t handle, *map;
> +
> +	handle = gem_create_in_memory_region_list(i915, size, 0, &mr->ci, 1);
> +
> +	map = gem_mmap__device_coherent(i915, handle, 0, size, PROT_WRITE);
> +	gem_set_domain(i915, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +	memset(map, val, size);
> +	munmap(map, size);
> +
> +	return handle;
> +}
> +
> +static uint32_t userptr_create(int i915, uint64_t size, uint8_t val, void **ptr
> +)
> +{
> +	uint32_t handle;
> +
> +	*ptr = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	igt_assert(*ptr != MAP_FAILED);
> +	memset(*ptr, val, size);
> +
> +	gem_userptr(i915, *ptr, 4096, 0, 0, &handle);
> +	return handle;
> +}
> +
> +
> +static bool has_mi_cond_bb_end(int i915)
> +{
> +	uint32_t devid = intel_get_drm_devid(i915);
> +
> +	return intel_gen(devid) >= 6;
> +}
> +
> +static bool has_xy_src_copy(int i915)
> +{
> +	uint32_t devid = intel_get_drm_devid(i915);
> +
> +	return true;
> +	return intel_gen(devid) < 12; // < PVC
> +}
> +
> +static int has_secure_batches(int i915)
> +{
> +	int v = -1;
> +	drm_i915_getparam_t gp = {
> +		.param = I915_PARAM_HAS_SECURE_BATCHES,
> +		.value = &v,
> +	};
> +
> +	drmIoctl(i915, DRM_IOCTL_I915_GETPARAM, &gp);
> +
> +	return v > 0;
> +}
> +
> +static bool has_mi_math(int i915, const struct intel_execution_engine2 *e)
> +{
> +	uint32_t devid = intel_get_drm_devid(i915);
> +
> +	if (intel_gen(devid) >= 8)
> +		return true;
> +
> +	if (!IS_HASWELL(devid))
> +		return false;
> +
> +	if (!has_secure_batches(i915))
> +		return false;
> +
> +	return e == NULL || e->class == I915_ENGINE_CLASS_RENDER;
> +}
> +
> +static void check_mmap(int i915, uint32_t handle, const uint32_t *hwsp)
> +{
> +	unsigned long count = 0;
> +
> +	while (gem_bo_busy(i915, handle)) {
> +		uint32_t *map, sq;
> +
> +		map = mmap(0, 4096, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
> +		if (map == MAP_FAILED)
> +			continue;
> +
> +		for (int i = 0; i < 5; i++) {
> +			sq = READ_ONCE(*hwsp);
> +			while (READ_ONCE(*hwsp) == sq && gem_bo_busy(i915, handle))
> +				sched_yield();
> +
> +			sq = READ_ONCE(map[rand() % 1024]);
> +			if (sq)
> +				break;
> +		}
> +
> +		munmap(map, 4096);
> +		igt_assert_f(!sq,
> +			     "Found %x in a new (clear) anonymous mmap after %lu tries!\n",
> +			     sq, count);
> +		count++;
> +	}
> +
> +	igt_info("%s(%d) count:%lu\n", __func__, getpid(), count);
> +}
> +
> +static void check_bo(int i915, uint32_t handle, const uint32_t *hwsp)
> +{
> +	int fd = gem_reopen_driver(i915);
> +	unsigned long count = 0;
> +
> +	while (gem_bo_busy(i915, handle)) {
> +		uint32_t *map, sq;
> +
> +		sq = gem_create(fd, 4096);
> +		map = gem_mmap__device_coherent(fd, sq, 0, 4096, PROT_READ);
> +		gem_close(fd, sq);
> +
> +		for (int i = 0; i < 5; i++) {
> +			sq = READ_ONCE(*hwsp);
> +			while (READ_ONCE(*hwsp) == sq && gem_bo_busy(i915, handle))
> +				sched_yield();
> +
> +			sq = READ_ONCE(map[rand() % 1024]);
> +			if (sq)
> +				break;
> +		}
> +
> +		munmap(map, 4096);
> +		igt_assert_f(!sq,
> +			     "Found %x in a new (clear) buffer after %lu tries!\n",
> +			     sq, count);
> +		count++;
> +
> +	}
> +
> +	igt_info("%s(%d) count:%lu\n", __func__, getpid(), count);
> +}
> +
> +static bool
> +find_engine(int i915, const intel_ctx_t *ctx, int class, int instance,
> +	    struct intel_execution_engine2 *out)
> +{
> +	const struct intel_execution_engine2 *e;
> +
> +	for_each_ctx_engine(i915, ctx, e) {
> +		if (e->class == class && e->instance == instance) {
> +			memcpy(out, e, sizeof(*out));
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static bool find_bcs0(int i915, const intel_ctx_t *ctx, struct intel_execution_engine2 *out)
> +{
> +	return find_engine(i915, ctx, I915_ENGINE_CLASS_COPY, 0, out);
> +}
> +
> +static void writer_at(int i915, const intel_ctx_t *ctx,
> +		      uint32_t handle, uint32_t *map,
> +		      const struct intel_execution_engine2 *e,
> +		      const uint32_t base,
> +		      uint64_t addr, uint64_t from)
> +{
> +	struct drm_i915_gem_exec_object2 obj = {
> +		.handle = handle,
> +		.offset = from,
> +		.flags = EXEC_OBJECT_PINNED
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.batch_start_offset = 256,
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +		.flags = e->flags,
> +		.rsvd1 = ctx->id,
> +	};
> +	const int gen = intel_gen(intel_get_drm_devid(i915));
> +	const int use_64b_addr = gen >= 8;
> +	uint32_t *cs, *jmp;
> +
> +	igt_assert(use_64b_addr || (addr >> 32) == 0);
> +	igt_assert(use_64b_addr || (from >> 32) == 0);
> +
> +	cs = map + execbuf.batch_start_offset / sizeof(*map);
> +
> +	*cs++ = MI_LOAD_REGISTER_IMM | (5 - 2);
> +	*cs++ = CS_GPR(0);
> +	*cs++ = 0;
> +	*cs++ = CS_GPR(0) + 4;
> +	*cs++ = 0;
> +
> +	*cs++ = MI_LOAD_REGISTER_IMM | (5 - 2);
> +	*cs++ = CS_GPR(1);
> +	*cs++ = 1;
> +	*cs++ = CS_GPR(1) + 4;
> +	*cs++ = 0;
> +
> +	while (offset_in_page(cs) & 63)
> +		cs++;
> +	jmp = cs;
> +
> +	/* Keep writing to the victim address */
> +	*cs++ = XY_COLOR | (3 << 20) | (4 + use_64b_addr);
> +	*cs++ = 3 << 24 | 0xf0 << 16 | 4096;
> +	*cs++ = 0;
> +	*cs++ = 1 << 16 | 1024;
> +	*cs++ = addr;
> +	if (use_64b_addr)
> +		*cs++ = addr >> 32;
> +	*cs++ = 0xdeadbeef;
> +
> +	*cs++ = MI_FLUSH_DW;
> +	*cs++ = 0;
> +
> +	/* Increment a seqno for each pass */
> +	*cs++ = MI_MATH | (5 - 2);
> +	*cs++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +	*cs++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
> +	*cs++ = MI_MATH_ADD;
> +	*cs++ = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> +
> +	*cs++ = MI_STORE_REGISTER_MEM | (1 + use_64b_addr);
> +	*cs++ = CS_GPR(0);
> +	*cs++ = from;
> +	*cs++ = from >> 32;
> +
> +	map[2] = 0xffffffff;
> +	map[3] = 0xffffffff;
> +	*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | (1 + use_64b_addr);
> +	*cs++ = MI_BATCH_BUFFER_END;
> +	*cs++ = from + 8;
> +	*cs++ = from >> 32;
> +
> +	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | use_64b_addr;
> +	*cs++ = from + offset_in_page(jmp);
> +	*cs++ = from >> 32;
> +
> +	*cs++ = MI_BATCH_BUFFER_END; /* not reached */
> +
> +	igt_debug("Running writer for %"PRIx64" at %"PRIx64" on %s\n",
> +		  addr, from, e->name);
> +	gem_execbuf(i915, &execbuf);
> +
> +	/* Wait until the batch is executing */
> +	while (!READ_ONCE(*map) && gem_bo_busy(i915, handle))
> +		;
> +	igt_assert(gem_bo_busy(i915, handle));
> +}
> +
> +static void close_clear(int i915, const intel_ctx_t *ctx,
> +			const struct gem_memory_region *mr,
> +			const struct intel_execution_engine2 *bcs0,
> +			const struct intel_execution_engine2 *bind)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	const uint32_t base =
> +		gem_engine_mmio_base(i915, intel_gen(intel_get_drm_devid(i915)) >= 8 ? "bcs0" : "rcs0");
> +	uint32_t stale, handle, sample, poison;
> +	uint64_t hole;
> +	uint32_t *map;
> +
> +	stale = stale_create(i915, mr, 4096, 0);
> +
> +	hole = find_hole(i915, ctx, bind, SZ_2M);
> +	poison = read_at(i915, ctx, bind, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" contains poison:%x\n", hole, poison);
> +
> +	/* Bind and sanitycheck reading the address returns our page */
> +	bind_at(i915, ctx, bcs0, stale, hole, 8192);
> +	sample = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_1M);
> +	igt_assert_eq_u32(sample, 0);
> +
> +	handle = gem_create(i915, 4096);
> +	map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> +
> +	writer_at(i915, ctx, handle, map, bcs0, base, hole, hole + SZ_1M);
> +
> +	sample = read_at(i915, ctx, bind, hole, hole + SZ_512K);
> +	igt_debug("Closing hole:%"PRIx64" on %s, sample:%x\n", hole, bind->name, sample);
> +	igt_assert_eq_u32(sample, 0xdeadbeef);
> +	gem_close(i915, stale);
> +
> +	igt_fork(child, 2 * ncpus)
> +		check_mmap(i915, handle, map);
> +	igt_fork(child, 2 * ncpus)
> +		check_bo(i915, handle, map);
> +
> +	sleep(10);
> +	map[2] = MI_BATCH_BUFFER_END;
> +
> +	sample = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_512K);
> +	igt_debug("Rechecking hole:%"PRIx64", sample:%x\n", hole, sample);
> +
> +	igt_waitchildren();
> +
> +	writer_at(i915, ctx, handle, map, bcs0, base, hole, hole + SZ_1M);
> +	map[2] = MI_BATCH_BUFFER_END;
> +	poison = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_512K);
> +	igt_debug("Scratch overwritten? hole:%"PRIx64", sample:%x\n", hole, poison);
> +	igt_assert_eq_u32(sample, poison);
> +	munmap(map, 4096);
> +	gem_close(i915, handle);
> +}
> +
> +static void madv_clear(int i915, const intel_ctx_t *ctx,
> +		       const struct gem_memory_region *mr,
> +		       const struct intel_execution_engine2 *bcs0,
> +		       const struct intel_execution_engine2 *bind)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	const uint32_t base =
> +		gem_engine_mmio_base(i915, intel_gen(intel_get_drm_devid(i915)) >= 8 ? "bcs0" : "rcs0");
> +	uint32_t stale, handle, sample, poison;
> +	uint64_t hole;
> +	uint32_t *map;
> +
> +	stale = stale_create(i915, mr, 4096, 0);
> +
> +	hole = find_hole(i915, ctx, bind, SZ_2M);
> +	poison = read_at(i915, ctx, bind, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" contains poison:%x\n", hole, poison);
> +
> +	/* Bind and sanitycheck reading the address returns our page */
> +	bind_at(i915, ctx, bcs0, stale, hole, 8192);
> +	sample = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_1M);
> +	igt_assert_eq_u32(sample, 0);
> +
> +	handle = gem_create(i915, 4096);
> +	map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> +
> +	writer_at(i915, ctx, handle, map, bcs0, base, hole, hole + SZ_1M);
> +
> +	/* Unbind hole by overlapping the range with a fresh vma */
> +	sample = read_at(i915, ctx, bind, hole, hole + SZ_512K);
> +	igt_debug("Evicting hole:%"PRIx64" on %s, sample:%x\n", hole, bind->name, sample);
> +	igt_assert_eq_u32(sample, 0xdeadbeef);
> +	bind_at(i915, ctx, bind, stale, hole + 4096, 0);
> +	sample = read_at(i915, ctx, bind, hole, hole + SZ_512K);
> +	igt_debug("Checking hole:%"PRIx64", sample:%x\n", hole, sample);
> +	igt_assert_eq_u32(sample, poison);
> +
> +	if (gem_madvise(i915, stale, I915_MADV_DONTNEED))
> +		igt_drop_caches_set(i915, DROP_SHRINK_ALL);
> +
> +	/* Check that we did indeed purge the stale buffer */
> +	igt_assert(!gem_madvise(i915, stale, I915_MADV_DONTNEED));
> +
> +	igt_fork(child, 2 * ncpus)
> +		check_mmap(i915, handle, map);
> +	igt_fork(child, 2 * ncpus)
> +		check_bo(i915, handle, map);
> +
> +	sleep(10);
> +	map[2] = MI_BATCH_BUFFER_END;
> +
> +	sample = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_512K);
> +	igt_debug("Rechecking hole:%"PRIx64", sample:%x\n", hole, sample);
> +
> +	igt_waitchildren();
> +
> +	writer_at(i915, ctx, handle, map, bcs0, base, hole, hole + SZ_1M);
> +	map[2] = MI_BATCH_BUFFER_END;
> +	poison = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_512K);
> +	igt_debug("Scratch overwritten? hole:%"PRIx64", sample:%x\n", hole, poison);
> +	igt_assert_eq_u32(sample, poison);
> +	munmap(map, 4096);
> +	gem_close(i915, handle);
> +	gem_close(i915, stale);
> +}
> +
> +static void userptr_clear(int i915, const intel_ctx_t *ctx,
> +			  const struct intel_execution_engine2 *bcs0,
> +			  const struct intel_execution_engine2 *bind,
> +			  unsigned int flags)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	const uint32_t base =
> +		gem_engine_mmio_base(i915, intel_gen(intel_get_drm_devid(i915)) >= 8 ? "bcs0" : "rcs0");
> +	uint32_t stale, handle, sample, poison;
> +	uint64_t hole;
> +	uint32_t *map;
> +	void *ptr;
> +
> +	stale = userptr_create(i915, 4096, 0, &ptr);
> +
> +	hole = find_hole(i915, ctx, bind, SZ_2M);
> +	poison = read_at(i915, ctx, bind, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" contains poison:%x\n", hole, poison);
> +
> +	/* Bind and sanitycheck reading the address returns our page */
> +	bind_at(i915, ctx, bcs0, stale, hole, 8192);
> +	sample = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_1M);
> +	igt_assert_eq_u32(sample, 0);
> +
> +	handle = gem_create(i915, 4096);
> +	map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> +
> +	writer_at(i915, ctx, handle, map, bcs0, base, hole, hole + SZ_1M);
> +
> +	/* Unbind hole by overlapping the range with a fresh vma */
> +	sample = read_at(i915, ctx, bind, hole, hole + SZ_512K);
> +	igt_debug("Evicting hole:%"PRIx64" on %s, sample:%x\n", hole, bind->name, sample);
> +	igt_assert_eq_u32(sample, 0xdeadbeef);
> +	bind_at(i915, ctx, bind, stale, hole + 4096, 0);
> +	sample = read_at(i915, ctx, bind, hole, hole + SZ_512K);
> +	igt_debug("Checking hole:%"PRIx64", sample:%x\n", hole, sample);
> +	igt_assert_eq_u32(sample, poison);
> +	munmap(ptr, 4096);
> +	if (flags & SHRINK)
> +		igt_drop_caches_set(i915, DROP_SHRINK_ALL);
> +
> +	igt_fork(child, 2 * ncpus)
> +		check_mmap(i915, handle, map);
> +	igt_fork(child, 2 * ncpus)
> +		check_bo(i915, handle, map);
> +
> +	sleep(10);
> +	map[2] = MI_BATCH_BUFFER_END;
> +
> +	sample = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_512K);
> +	igt_debug("Rechecking hole:%"PRIx64", sample:%x\n", hole, sample);
> +
> +	igt_waitchildren();
> +
> +	writer_at(i915, ctx, handle, map, bcs0, base, hole, hole + SZ_1M);
> +	map[2] = MI_BATCH_BUFFER_END;
> +	poison = __read_at(i915, ctx, bcs0, base, hole, hole + SZ_512K);
> +	igt_debug("Scratch overwritten? hole:%"PRIx64", sample:%x\n", hole, poison);
> +	igt_assert_eq_u32(sample, poison);
> +	munmap(map, 4096);
> +	gem_close(i915, handle);
> +	gem_close(i915, stale);
> +}
> +
> +static void clear_tlb(int i915)
> +{
> +	struct intel_execution_engine2 bcs0, bind;
> +	const intel_ctx_t *ctx;
> +
> +	/* See if we can retain a TLB entry past address reuse. */
> +
> +	igt_fixture {
> +		const struct intel_execution_engine2 *e;
> +		bool found;
> +
> +		igt_require(has_xy_src_copy(i915));
> +		igt_require(has_mi_cond_bb_end(i915));
> +
> +		ctx = intel_ctx_create_all_physical(i915);
> +
> +		igt_require(find_bcs0(i915, ctx, &bcs0));
> +		igt_require(has_mi_math(i915, &bcs0));
> +
> +		found = false;
> +		for_each_ctx_engine(i915, ctx, e) {
> +			if (e->flags != bcs0.flags) {
> +				memcpy(&bind, e, sizeof(bind));
> +				found = true;
> +				break;
> +			}
> +		}
> +		igt_require(found);
> +		igt_debug("Writing with %s, issuing binds with %s\n",
> +			  bcs0.name, bind.name);
> +	}
> +

Please add descriptions before new tests.

> +	igt_subtest_with_dynamic("close-clear") {
> +		for_each_memory_region(r, i915) {
> +			igt_dynamic_f("%s", r->name)
> +				close_clear(i915, ctx, r, &bcs0, &bind);
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("madv-clear") {
> +		for_each_memory_region(r, i915) {
> +			if (r->ci.memory_class) /* XXX how to purge lmem? */
> +				continue;
> +
> +			igt_dynamic_f("%s", r->name)
> +				madv_clear(i915, ctx, r, &bcs0, &bind);
> +		}
> +	}
> +
> +	igt_subtest("u-unmap-clear")
> +		userptr_clear(i915, ctx, &bcs0, &bind, 0);
> +	igt_subtest("u-shrink-clear")
> +		userptr_clear(i915, ctx, &bcs0, &bind, SHRINK);
> +}
> +
> +static void dumb_writer_at(int i915, const intel_ctx_t *ctx,
> +			   uint32_t handle, uint32_t *map,
> +			   const struct intel_execution_engine2 *e,
> +			   uint64_t addr, uint64_t from)
> +{
> +	struct drm_i915_gem_exec_object2 obj = {
> +		.handle = handle,
> +		.offset = from,
> +		.flags = EXEC_OBJECT_PINNED
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +		.flags = e->flags,
> +		.rsvd1 = ctx->id,
> +	};
> +	const int gen = intel_gen(intel_get_drm_devid(i915));
> +	const bool uses_parser = gem_has_cmdparser(i915);
> +	const int use_flush_dw = gen >= 6;
> +	const int use_64b_addr = gen >= 8;
> +	uint32_t *cs, *jmp;
> +
> +	igt_assert(use_64b_addr || (addr >> 32) == 0);
> +	igt_assert(use_64b_addr || (from >> 32) == 0);
> +
> +	if (uses_parser)
> +		execbuf.batch_start_offset = 256;
> +
> +	cs = map + execbuf.batch_start_offset / sizeof(*map);
> +	jmp = cs;
> +
> +	/* Keep writing to the victim address */
> +	*cs++ = XY_COLOR | (3 << 20) | (4 + use_64b_addr);
> +	*cs++ = 3 << 24 | 0xf0 << 16 | 4096;
> +	*cs++ = 0;
> +	*cs++ = 1 << 16 | 1024;
> +	*cs++ = addr;
> +	if (use_64b_addr)
> +		*cs++ = addr >> 32;
> +	*cs++ = 0xdeadbeef;
> +
> +	if (use_flush_dw) {
> +		*cs++ = MI_FLUSH_DW;
> +		*cs++ = 0;
> +	} else {
> +		*cs++ = MI_FLUSH;
> +	}
> +
> +	if (uses_parser) {
> +		map[0] = 0xffffffff;
> +		map[1] = 0xffffffff;
> +		*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | (1 + use_64b_addr);
> +		*cs++ = MI_BATCH_BUFFER_END;
> +		*cs++ = from;
> +		*cs++ = from >> 32;
> +	}
> +
> +	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | use_64b_addr;
> +	*cs++ = from + offset_in_page(jmp);
> +	*cs++ = from >> 32;
> +
> +	*cs++ = MI_BATCH_BUFFER_END; /* not reached */
> +
> +	igt_debug("Running writer for %"PRIx64" at %"PRIx64" on %s\n",
> +		  addr, from, e->name);
> +	gem_execbuf(i915, &execbuf);
> +}
> +
> +static void dumb_mmap(int i915, uint32_t handle)
> +{
> +	unsigned long count = 0;
> +
> +	while (gem_bo_busy(i915, handle)) {
> +		uint32_t *map, sq;
> +
> +		map = mmap(0, 4096, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
> +		if (map == MAP_FAILED)
> +			continue;
> +
> +		for (int i = 0; i < 5; i++) {
> +			usleep(1000);
> +			sq = READ_ONCE(map[rand() % 1024]);
> +			if (sq)
> +				break;
> +		}
> +
> +		munmap(map, 4096);
> +		igt_assert_f(!sq,
> +			     "Found %x in a new (clear) anonymous mmap! after %lu tries\n",
> +			     sq, count);
> +		count++;
> +	}
> +
> +	igt_info("%s(%d) count:%lu\n", __func__, getpid(), count);
> +}
> +
> +static void dumb_bo(int i915, uint32_t handle)
> +{
> +	int fd = gem_reopen_driver(i915);
> +	unsigned long count = 0;
> +
> +	while (gem_bo_busy(i915, handle)) {
> +		uint32_t *map, sq;
> +
> +		sq = gem_create(fd, 4096);
> +		map = gem_mmap__device_coherent(fd, sq, 0, 4096, PROT_READ);
> +		gem_close(fd, sq);
> +
> +		for (int i = 0; i < 5; i++) {
> +			usleep(1000);
> +			sq = READ_ONCE(map[rand() % 1024]);
> +			if (sq)
> +				break;
> +		}
> +
> +		munmap(map, 4096);
> +		igt_assert_f(!sq,
> +			     "Found %x in a new (clear) buffer after %lu tries!\n",
> +			     sq, count);
> +		count++;
> +	}
> +
> +	igt_info("%s(%d) count:%lu\n", __func__, getpid(), count);
> +}
> +
> +static void __spin_until_write(uint32_t *map)
> +{
> +	while (!READ_ONCE(*map))
> +		sched_yield();
> +}
> +
> +static void spin_until_write(int i915, uint32_t handle)
> +{
> +	uint32_t *map;
> +
> +	map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_READ);
> +	__spin_until_write(map);
> +	munmap(map, 4096);
> +}
> +
> +static void close_dumb(int i915, const intel_ctx_t *ctx,
> +		       const struct gem_memory_region *mr,
> +		       const struct intel_execution_engine2 *bcs0)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	uint32_t stale, handle, sample, poison;
> +	uint64_t hole;
> +	uint32_t *map;
> +
> +	stale = stale_create(i915, mr, 4096, 0);
> +
> +	hole = find_hole(i915, ctx, bcs0, SZ_2M);
> +	poison = copy_from(i915, ctx, bcs0, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" contains poison:%x\n", hole, poison);
> +
> +	/* Bind and sanitycheck reading the address returns our page */
> +	bind_at(i915, ctx, bcs0, stale, hole, 8192);
> +	sample = copy_from(i915, ctx, bcs0, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" replaced with value:%x\n", hole, sample);
> +	igt_assert_eq_u32(sample, 0);
> +
> +	handle = gem_create(i915, 4096);
> +	map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> +
> +	dumb_writer_at(i915, ctx, handle, map, bcs0, hole, hole + SZ_1M);
> +	spin_until_write(i915, stale);
> +	igt_debug("Closing stale object\n");
> +	gem_close(i915, stale);
> +
> +	igt_fork(child, 2 * ncpus)
> +		dumb_mmap(i915, handle);
> +	igt_fork(child, 2 * ncpus)
> +		dumb_bo(i915, handle);
> +
> +	sleep(10);
> +	*map = MI_BATCH_BUFFER_END;
> +
> +	sample = copy_from(i915, ctx, bcs0, hole, hole + SZ_512K);
> +	igt_debug("Rechecking hole:%"PRIx64", sample:%x\n", hole, sample);
> +
> +	igt_waitchildren();
> +
> +	dumb_writer_at(i915, ctx, handle, map, bcs0, hole, hole + SZ_1M);
> +	*map = MI_BATCH_BUFFER_END;
> +	poison = read_at(i915, ctx, bcs0, hole, hole + SZ_512K);
> +	igt_debug("Scratch overwritten? hole:%"PRIx64", sample:%x\n", hole, poison);
> +	igt_assert_eq_u32(sample, poison);
> +	munmap(map, 4096);
> +	gem_close(i915, handle);
> +}
> +
> +static void madv_dumb(int i915, const intel_ctx_t *ctx,
> +		      const struct gem_memory_region *mr,
> +		      const struct intel_execution_engine2 *bcs0)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	uint32_t stale, handle, sample, poison;
> +	uint64_t hole;
> +	uint32_t *map;
> +
> +	stale = stale_create(i915, mr, 4096, 0);
> +
> +	hole = find_hole(i915, ctx, bcs0, SZ_2M);
> +	poison = copy_from(i915, ctx, bcs0, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" contains poison:%x\n", hole, poison);
> +
> +	/* Bind and sanitycheck reading the address returns our page */
> +	bind_at(i915, ctx, bcs0, stale, hole, 8192);
> +	sample = copy_from(i915, ctx, bcs0, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" replaced with value:%x\n", hole, sample);
> +	igt_assert_eq_u32(sample, 0);
> +
> +	handle = gem_create(i915, 4096);
> +	map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> +
> +	dumb_writer_at(i915, ctx, handle, map, bcs0, hole, hole + SZ_1M);
> +	spin_until_write(i915, stale);
> +	igt_debug("Purging stale object\n");
> +	if (gem_madvise(i915, stale, I915_MADV_DONTNEED))
> +		igt_drop_caches_set(i915, DROP_SHRINK_ALL);
> +
> +	/* Check that we did indeed purge the stale buffer */
> +	igt_assert(!gem_madvise(i915, stale, I915_MADV_DONTNEED));
> +
> +	igt_fork(child, 2 * ncpus)
> +		dumb_mmap(i915, handle);
> +	igt_fork(child, 2 * ncpus)
> +		dumb_bo(i915, handle);
> +
> +	sleep(10);
> +	*map = MI_BATCH_BUFFER_END;
> +
> +	sample = copy_from(i915, ctx, bcs0, hole, hole + SZ_512K);
> +	igt_debug("Rechecking hole:%"PRIx64", sample:%x\n", hole, sample);
> +
> +	igt_waitchildren();
> +
> +	dumb_writer_at(i915, ctx, handle, map, bcs0, hole, hole + SZ_1M);
> +	*map = MI_BATCH_BUFFER_END;
> +	poison = read_at(i915, ctx, bcs0, hole, hole + SZ_512K);
> +	igt_debug("Scratch overwritten? hole:%"PRIx64", sample:%x\n", hole, poison);
> +	igt_assert_eq_u32(sample, poison);
> +	munmap(map, 4096);
> +	gem_close(i915, stale);
> +	gem_close(i915, handle);
> +}
> +
> +static void userptr_dumb(int i915, const intel_ctx_t *ctx,
> +			 const struct intel_execution_engine2 *bcs0,
> +			 unsigned int flags)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	uint32_t stale, handle, sample, poison;
> +	uint64_t hole;
> +	uint32_t *map;
> +	void *ptr;
> +
> +	stale = userptr_create(i915, 4096, 0, &ptr);
> +
> +	hole = find_hole(i915, ctx, bcs0, SZ_2M);
> +	poison = copy_from(i915, ctx, bcs0, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" contains poison:%x\n", hole, poison);
> +
> +	/* Bind and sanitycheck reading the address returns our page */
> +	bind_at(i915, ctx, bcs0, stale, hole, 8192);
> +	sample = copy_from(i915, ctx, bcs0, hole, hole + SZ_1M);
> +	igt_debug("2M hole:%"PRIx64" replaced with value:%x\n", hole, sample);
> +	igt_assert_eq_u32(sample, 0);
> +
> +	handle = gem_create(i915, 4096);
> +	map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> +
> +	dumb_writer_at(i915, ctx, handle, map, bcs0, hole, hole + SZ_1M);
> +	__spin_until_write(ptr);
> +	igt_debug("Release userptr\n");
> +	munmap(ptr, 4096);
> +	if (flags & SHRINK)
> +		igt_drop_caches_set(i915, DROP_SHRINK_ALL);
> +
> +	igt_fork(child, 2 * ncpus)
> +		dumb_mmap(i915, handle);
> +	igt_fork(child, 2 * ncpus)
> +		dumb_bo(i915, handle);
> +
> +	sleep(10);
> +	*map = MI_BATCH_BUFFER_END;
> +
> +	sample = copy_from(i915, ctx, bcs0, hole, hole + SZ_512K);
> +	igt_debug("Rechecking hole:%"PRIx64", sample:%x\n", hole, sample);
> +
> +	igt_waitchildren();
> +
> +	dumb_writer_at(i915, ctx, handle, map, bcs0, hole, hole + SZ_1M);
> +	*map = MI_BATCH_BUFFER_END;
> +	poison = read_at(i915, ctx, bcs0, hole, hole + SZ_512K);
> +	igt_debug("Scratch overwritten? hole:%"PRIx64", sample:%x\n", hole, poison);
> +	igt_assert_eq_u32(sample, poison);
> +	munmap(map, 4096);
> +	gem_close(i915, handle);
> +	gem_close(i915, stale);
> +}
> +
> +static bool find_blitter(int i915, const intel_ctx_t *ctx, struct intel_execution_engine2 *out)
> +{
> +	if (find_engine(i915, ctx, I915_ENGINE_CLASS_COPY, 0, out))
> +		return true;
> +
> +	if (intel_gen(intel_get_drm_devid(i915)) >= 6)
> +		return false;
> +
> +	return find_engine(i915, ctx, I915_ENGINE_CLASS_RENDER, 0, out);
> +}
> +
> +static void dumb_tlb(int i915)
> +{
> +	struct intel_execution_engine2 blt;
> +	const intel_ctx_t *ctx;
> +
> +	/*
> +	 * A simplified test for running across all generations. Nothing fancy,
> +	 * just keep writing to stale addresses looking for a retained TLB
> +	 * entry.
> +	 */
> +
> +	igt_fixture {
> +		ctx = intel_ctx_create_all_physical(i915);
> +		igt_require(has_xy_src_copy(i915));
> +		igt_require(find_blitter(i915, ctx, &blt));
> +	}
> +
> +	igt_subtest_with_dynamic("close-dumb") {
> +		for_each_memory_region(r, i915) {
> +			igt_dynamic_f("%s", r->name)
> +				close_dumb(i915, ctx, r, &blt);
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("madv-dumb") {
> +		for_each_memory_region(r, i915) {
> +			if (r->ci.memory_class) /* XXX how to purge lmem? */
> +				continue;
> +
> +			igt_dynamic_f("%s", r->name)
> +				madv_dumb(i915, ctx, r, &blt);
> +		}
> +	}
> +
> +	igt_subtest("u-unmap-dumb")
> +		userptr_dumb(i915, ctx, &blt, 0);
> +
> +	igt_subtest("u-shrink-dumb")
> +		userptr_dumb(i915, ctx, &blt, SHRINK);
> +
> +	igt_fixture
> +		intel_ctx_destroy(i915, ctx);
> +}
> +
> +igt_main
> +{
> +	int i915 = -1;
> +
> +	igt_fixture {
> +		i915 = drm_open_driver(DRIVER_INTEL);
> +		igt_require_gem(i915);
> +
> +		igt_fork_hang_detector(i915);
> +	}
> +
> +	igt_subtest_group
> +		clear_tlb(i915);
> +
> +	igt_subtest_group
> +		dumb_tlb(i915);
> +
> +	igt_fixture {
> +		igt_stop_hang_detector();
> +		close(i915);
> +	}
> +}
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
> index 74a227f678e7..397f6c38a879 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -152,6 +152,8 @@ igt_main
>  		region_set = get_memory_region_set(region_info,
>  						   I915_SYSTEM_MEMORY,
>  						   I915_DEVICE_MEMORY);
> +
> +		igt_fork_hang_detector(data.drm_fd);
>  	}

Split this to separate patch (looks like a fix).

Regards,
Kamil

>  
>  	igt_subtest_with_dynamic("basic") {
> diff --git a/tests/meson.build b/tests/meson.build
> index b548dc3b4444..6546adb3ed51 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -147,6 +147,7 @@ i915_progs = [
>  	'gem_exec_schedule',
>  	'gem_exec_store',
>  	'gem_exec_suspend',
> +	'gem_exec_tlb',
>  	'gem_exec_whisper',
>  	'gem_fd_exhaustion',
>  	'gem_fence_thrash',
> -- 
> 2.36.1
> 
