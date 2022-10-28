Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0510E873
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 16:39:04 +0000 (UTC)
Message-ID: <236ac42d-0a36-bdf5-6799-f5f26d109eda@intel.com>
Date: Fri, 28 Oct 2022 17:38:58 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20221018071705.3906-1-niranjana.vishwanathapura@intel.com>
 <20221018071705.3906-8-niranjana.vishwanathapura@intel.com>
 <de085c1d-9827-29c4-3cad-8cd11a382da2@intel.com>
 <Y1eK5EQf7uLmxVkw@nvishwa1-DESK>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Y1eK5EQf7uLmxVkw@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 07/11] tests/i915/vm_bind: Add basic
 VM_BIND test support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 25/10/2022 08:06, Niranjana Vishwanathapura wrote:
> On Fri, Oct 21, 2022 at 05:27:56PM +0100, Matthew Auld wrote:
>> On 18/10/2022 08:17, Niranjana Vishwanathapura wrote:
>>> Add basic tests for VM_BIND functionality. Bind the buffer objects in
>>> device page table with VM_BIND calls and have GPU copy the data from a
>>> source buffer object to destination buffer object.
>>> Test for different buffer sizes, buffer object placement and with
>>> multiple contexts.
>>>
>>> v2: Add basic test to fast-feedback.testlist
>>> v3: Run all tests for different memory types,
>>>     pass VA instead of an array for batch_address
>>> v4: Iterate for memory region types instead of hardcoding,
>>>     use i915_vm_bind library functions
>>>
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>>
>>> basic
>>
>> Unwanted change?
>>
> 
> fixed
> 
>>> ---
>>>  tests/i915/i915_vm_bind_basic.c       | 522 ++++++++++++++++++++++++++
>>>  tests/intel-ci/fast-feedback.testlist |   1 +
>>>  tests/meson.build                     |   1 +
>>>  3 files changed, 524 insertions(+)
>>>  create mode 100644 tests/i915/i915_vm_bind_basic.c
>>>
>>> diff --git a/tests/i915/i915_vm_bind_basic.c 
>>> b/tests/i915/i915_vm_bind_basic.c
>>> new file mode 100644
>>> index 0000000000..ede76ba095
>>> --- /dev/null
>>> +++ b/tests/i915/i915_vm_bind_basic.c
>>> @@ -0,0 +1,522 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2022 Intel Corporation
>>> + */
>>> +
>>> +/** @file i915_vm_bind_basic.c
>>> + *
>>> + * This is the basic test for VM_BIND functionality.
>>> + *
>>> + * The goal is to ensure that basics work.
>>> + */
>>> +
>>> +#include <sys/poll.h>
>>> +
>>> +#include "i915/gem.h"
>>> +#include "i915/i915_vm_bind.h"
>>> +#include "igt.h"
>>> +#include "igt_syncobj.h"
>>> +#include <unistd.h>
>>> +#include <stdlib.h>
>>> +#include <stdint.h>
>>> +#include <stdio.h>
>>> +#include <string.h>
>>> +#include <fcntl.h>
>>> +#include <inttypes.h>
>>> +#include <errno.h>
>>> +#include <sys/stat.h>
>>> +#include <sys/ioctl.h>
>>> +#include "drm.h"
>>> +#include "i915/gem_vm.h"
>>> +
>>> +IGT_TEST_DESCRIPTION("Basic test for vm_bind functionality");
>>> +
>>> +#define PAGE_SIZE   4096
>>> +#define PAGE_SHIFT  12
>>> +
>>> +#define GEN9_XY_FAST_COPY_BLT_CMD       (2 << 29 | 0x42 << 22)
>>> +#define BLT_DEPTH_32                    (3 << 24)
>>> +
>>> +#define DEFAULT_BUFF_SIZE  (4 * PAGE_SIZE)
>>> +#define SZ_64K             (16 * PAGE_SIZE)
>>> +#define SZ_2M              (512 * PAGE_SIZE)
>>> +
>>> +#define MAX_CTXTS   2
>>> +#define MAX_CMDS    4
>>> +
>>> +#define BATCH_FENCE  0
>>> +#define SRC_FENCE    1
>>> +#define DST_FENCE    2
>>> +#define EXEC_FENCE   3
>>> +#define NUM_FENCES   4
>>> +
>>> +enum {
>>> +    BATCH_MAP,
>>> +    SRC_MAP,
>>> +    DST_MAP = SRC_MAP + MAX_CMDS,
>>> +    MAX_MAP
>>> +};
>>> +
>>> +struct mapping {
>>> +    uint32_t  obj;
>>> +    uint64_t  va;
>>> +    uint64_t  offset;
>>> +    uint64_t  length;
>>> +    uint64_t  flags;
>>> +};
>>> +
>>> +#define SET_MAP(map, _obj, _va, _offset, _length, _flags)   \
>>> +{                                  \
>>> +    (map).obj = _obj;          \
>>> +    (map).va = _va;            \
>>> +    (map).offset = _offset;       \
>>> +    (map).length = _length;       \
>>> +    (map).flags = _flags;       \
>>> +}
>>> +
>>> +#define MAX_BATCH_DWORD    64
>>> +
>>> +#define abs(x) ((x) >= 0 ? (x) : -(x))
>>> +
>>> +#define TEST_LMEM             BIT(0)
>>> +#define TEST_SKIP_UNBIND      BIT(1)
>>> +#define TEST_SHARE_VM         BIT(2)
>>> +
>>> +#define is_lmem(cfg)        ((cfg)->flags & TEST_LMEM)
>>> +#define do_unbind(cfg)      (!((cfg)->flags & TEST_SKIP_UNBIND))
>>> +#define do_share_vm(cfg)    ((cfg)->flags & TEST_SHARE_VM)
>>> +
>>> +struct test_cfg {
>>> +    const char *name;
>>> +    uint32_t size;
>>> +    uint8_t num_cmds;
>>> +    uint32_t num_ctxts;
>>> +    uint32_t flags;
>>> +};
>>> +
>>> +static uint64_t
>>> +gettime_ns(void)
>>> +{
>>> +    struct timespec current;
>>> +    clock_gettime(CLOCK_MONOTONIC, &current);
>>> +    return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
>>> +}
>>> +
>>> +static bool syncobj_busy(int fd, uint32_t handle)
>>> +{
>>> +    bool result;
>>> +    int sf;
>>> +
>>> +    sf = syncobj_handle_to_fd(fd, handle,
>>> +                  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
>>> +    result = poll(&(struct pollfd){sf, POLLIN}, 1, 0) == 0;
>>> +    close(sf);
>>> +
>>> +    return result;
>>> +}
>>> +
>>> +static inline void vm_bind(int fd, uint32_t vm_id, struct mapping *m,
>>> +               struct drm_i915_gem_timeline_fence *fence)
>>> +{
>>> +    uint32_t syncobj = 0;
>>> +
>>> +    if (fence) {
>>> +        syncobj =  syncobj_create(fd, 0);
>>> +
>>> +        fence->handle = syncobj;
>>> +        fence->flags = I915_TIMELINE_FENCE_WAIT;
>>> +        fence->value = 0;
>>> +    }
>>> +
>>> +    igt_info("VM_BIND vm:0x%x h:0x%x v:0x%lx o:0x%lx l:0x%lx\n",
>>> +         vm_id, m->obj, m->va, m->offset, m->length);
>>
>> This igt_info() and elsewhere are not too loud? Maybe just igt_debug() 
>> for some of these? Looks quite noisy when running this test locally.
> 
> ok, changed it to igt_debug()
> 
>>
>>> +    i915_vm_bind(fd, vm_id, m->va, m->obj, m->offset, m->length, 
>>> syncobj, 0);
>>> +}
>>> +
>>> +static inline void vm_unbind(int fd, uint32_t vm_id, struct mapping *m)
>>> +{
>>> +    /* Object handle is not required during unbind */
>>> +    igt_info("VM_UNBIND vm:0x%x v:0x%lx l:0x%lx\n", vm_id, m->va, 
>>> m->length);
>>> +    i915_vm_unbind(fd, vm_id, m->va, m->length);
>>> +}
>>> +
>>> +static void print_buffer(void *buf, uint32_t size,
>>> +             const char *str, bool full)
>>> +{
>>> +    uint32_t i = 0;
>>> +
>>> +    igt_debug("Printing %s size 0x%x\n", str, size);
>>> +    while (i < size) {
>>> +        uint32_t *b = buf + i;
>>> +
>>> +        igt_debug("\t%s[0x%04x]: 0x%08x 0x%08x 0x%08x 0x%08x %s\n",
>>> +              str, i, b[0], b[1], b[2], b[3], full ? "" : "...");
>>> +        i += full ? 16 : PAGE_SIZE;
>>> +    }
>>> +}
>>> +
>>> +static int gem_linear_fast_blt(uint32_t *batch, uint64_t src,
>>> +                   uint64_t dst, uint32_t size)
>>> +{
>>> +    uint32_t *cmd = batch;
>>> +
>>> +    *cmd++ = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
>>> +    *cmd++ = BLT_DEPTH_32 | PAGE_SIZE;
>>> +    *cmd++ = 0;
>>> +    *cmd++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
>>> +    *cmd++ = lower_32_bits(dst);
>>> +    *cmd++ = upper_32_bits(dst);
>>> +    *cmd++ = 0;
>>> +    *cmd++ = PAGE_SIZE;
>>> +    *cmd++ = lower_32_bits(src);
>>> +    *cmd++ = upper_32_bits(src);
>>> +
>>> +    *cmd++ = MI_BATCH_BUFFER_END;
>>> +    *cmd++ = 0;
>>> +
>>> +    return ALIGN((cmd - batch + 1) * sizeof(uint32_t), 8);
>>> +}
>>> +
>>> +static void __gem_copy(int fd, uint64_t src, uint64_t dst, uint32_t 
>>> size,
>>> +               uint32_t ctx_id, void *batch_addr, unsigned int 
>>> eb_flags,
>>> +               struct drm_i915_gem_timeline_fence *fence)
>>> +{
>>> +    uint32_t len, buf[MAX_BATCH_DWORD] = { 0 };
>>> +    struct drm_i915_gem_execbuffer3 execbuf;
>>> +
>>> +    len = gem_linear_fast_blt(buf, src, dst, size);
>>> +
>>> +    memcpy(batch_addr, (void *)buf, len);
>>> +    print_buffer(buf, len, "batch", true);
>>> +
>>> +    memset(&execbuf, 0, sizeof(execbuf));
>>> +    execbuf.ctx_id = ctx_id;
>>> +    execbuf.batch_address = to_user_pointer(batch_addr);
>>> +    execbuf.engine_idx = eb_flags;
>>> +    execbuf.fence_count = NUM_FENCES;
>>> +    execbuf.timeline_fences = to_user_pointer(fence);
>>> +    gem_execbuf3(fd, &execbuf);
>>> +}
>>> +
>>> +static void i915_gem_copy(int fd, uint64_t src, uint64_t dst, 
>>> uint32_t va_delta,
>>> +              uint32_t delta, uint32_t size, const intel_ctx_t **ctx,
>>> +              uint32_t num_ctxts, void **batch_addr, unsigned int 
>>> eb_flags,
>>> +              struct drm_i915_gem_timeline_fence (*fence)[NUM_FENCES])
>>> +{
>>> +    uint32_t i;
>>> +
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        igt_info("Issuing gem copy on ctx 0x%x\n", ctx[i]->id);
>>> +        __gem_copy(fd, src + (i * va_delta), dst + (i * va_delta), 
>>> delta,
>>> +               ctx[i]->id, batch_addr[i], eb_flags, fence[i]);
>>> +    }
>>> +}
>>> +
>>> +static void i915_gem_sync(int fd, const intel_ctx_t **ctx, uint32_t 
>>> num_ctxts,
>>> +              struct drm_i915_gem_timeline_fence (*fence)[NUM_FENCES])
>>> +{
>>> +    uint32_t i;
>>> +
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        uint64_t fence_value = 0;
>>> +
>>> +        igt_assert(syncobj_timeline_wait(fd, 
>>> &fence[i][EXEC_FENCE].handle,
>>> +                         (uint64_t *)&fence_value, 1,
>>> +                         gettime_ns() + (2 * NSEC_PER_SEC),
>>> +                         DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, 
>>> NULL));
>>> +        igt_assert(!syncobj_busy(fd, fence[i][EXEC_FENCE].handle));
>>> +        igt_info("gem copy completed on ctx 0x%x\n", ctx[i]->id);
>>> +    }
>>> +}
>>> +
>>> +static struct igt_collection *get_region_set(int fd, struct test_cfg 
>>> *cfg, bool lmem_only)
>>> +{
>>> +    uint32_t mem_type[] = { I915_SYSTEM_MEMORY, I915_DEVICE_MEMORY };
>>> +    uint32_t lmem_type[] = { I915_DEVICE_MEMORY };
>>> +    struct drm_i915_query_memory_regions *query_info;
>>> +
>>> +    query_info = gem_get_query_memory_regions(fd);
>>> +    igt_assert(query_info);
>>> +
>>> +    if (lmem_only)
>>> +        return __get_memory_region_set(query_info, lmem_type, 1);
>>> +    else
>>> +        return __get_memory_region_set(query_info, mem_type, 2);
>>> +}
>>> +
>>> +static void create_src_objs(int fd, struct test_cfg *cfg, uint32_t 
>>> src[], uint32_t size,
>>> +                uint32_t num_cmds, void *src_addr[])
>>> +{
>>> +    int i;
>>> +    struct igt_collection *set = get_region_set(fd, cfg, 
>>> is_lmem(cfg) && (num_cmds == 1));
>>> +    uint32_t region;
>>> +
>>> +    for (i = 0; i < num_cmds; i++) {
>>> +        region = igt_collection_get_value(set, i % set->size);
>>> +        src[i] = gem_create_in_memory_regions(fd, size, region);
>>> +        igt_info("Src obj 0x%x created in region 0x%x:0x%x\n", src[i],
>>> +             MEMORY_TYPE_FROM_REGION(region), 
>>> MEMORY_INSTANCE_FROM_REGION(region));
>>> +        src_addr[i] = gem_mmap__cpu(fd, src[i], 0, size, PROT_WRITE);
>>> +    }
>>> +}
>>> +
>>> +static void destroy_src_objs(int fd, struct test_cfg *cfg, uint32_t 
>>> src[], uint32_t size,
>>> +                 uint32_t num_cmds, void *src_addr[])
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < num_cmds; i++) {
>>> +        igt_assert(gem_munmap(src_addr[i], size) == 0);
>>> +        igt_debug("Closing object 0x%x\n", src[i]);
>>> +        gem_close(fd, src[i]);
>>> +    }
>>> +}
>>> +
>>> +static uint32_t create_dst_obj(int fd, struct test_cfg *cfg, 
>>> uint32_t size, void **dst_addr)
>>> +{
>>> +    uint32_t dst;
>>> +    struct igt_collection *set = get_region_set(fd, cfg, is_lmem(cfg));
>>> +    uint32_t region = igt_collection_get_value(set, 0);
>>
>> Maybe just use the gem_memory_region and then we don't need this 
>> igt_collection stuff here and elsewhere? IMO it's a lot nicer.
> 
> ok
> 
>>
>>> +
>>> +    dst = gem_create_in_memory_regions(fd, size, region);
>>> +    igt_info("Dst obj 0x%x created in region 0x%x:0x%x\n", dst,
>>> +         MEMORY_TYPE_FROM_REGION(region), 
>>> MEMORY_INSTANCE_FROM_REGION(region));
>>
>> And then here and elsewhere we can just use gem_memory_region.name, 
>> which is a lot more readable for humans :)
>>
> 
> ok
> 
>>> +    *dst_addr = gem_mmap__cpu(fd, dst, 0, size, PROT_WRITE);
>>> +
>>> +    return dst;
>>> +}
>>> +
>>> +static void destroy_dst_obj(int fd, struct test_cfg *cfg, uint32_t 
>>> dst, uint32_t size, void *dst_addr)
>>> +{
>>> +    igt_assert(gem_munmap(dst_addr, size) == 0);
>>> +    igt_debug("Closing object 0x%x\n", dst);
>>> +    gem_close(fd, dst);
>>> +}
>>> +
>>> +static void pattern_fill_buf(void *src_addr[], uint32_t size, 
>>> uint32_t num_cmds, uint32_t npages)
>>> +{
>>> +    uint32_t i, j;
>>> +    void *buf;
>>> +
>>> +    /* Allocate buffer and fill pattern */
>>> +    buf = malloc(size);
>>> +    igt_require(buf);
>>> +
>>> +    for (i = 0; i < num_cmds; i++) {
>>> +        for (j = 0; j < npages; j++)
>>> +            memset(buf + j * PAGE_SIZE, i * npages + j + 1, PAGE_SIZE);
>>> +
>>> +        memcpy(src_addr[i], buf, size);
>>> +    }
>>> +
>>> +    free(buf);
>>> +}
>>> +
>>> +static void run_test(int fd, const intel_ctx_t *base_ctx, struct 
>>> test_cfg *cfg,
>>> +             const struct intel_execution_engine2 *e)
>>> +{
>>> +    void *src_addr[MAX_CMDS] = { 0 }, *dst_addr = NULL;
>>> +    uint32_t src[MAX_CMDS], dst, i, size = cfg->size;
>>> +    struct drm_i915_gem_timeline_fence 
>>> exec_fence[MAX_CTXTS][NUM_FENCES];
>>> +    uint32_t shared_vm_id, vm_id[MAX_CTXTS];
>>> +    struct mapping map[MAX_CTXTS][MAX_MAP];
>>> +    uint32_t num_ctxts = cfg->num_ctxts;
>>> +    uint32_t num_cmds = cfg->num_cmds;
>>> +    uint32_t npages = size / PAGE_SIZE;
>>> +    const intel_ctx_t *ctx[MAX_CTXTS];
>>> +    bool share_vm = do_share_vm(cfg);
>>> +    uint32_t delta, va_delta = SZ_2M;
>>> +    void *batch_addr[MAX_CTXTS];
>>> +    uint32_t batch[MAX_CTXTS];
>>> +    uint64_t src_va, dst_va;
>>> +
>>> +    delta = size / num_ctxts;
>>> +    if (share_vm)
>>> +        shared_vm_id = gem_vm_create_in_vm_bind_mode(fd);
>>> +
>>> +    /* Create contexts */
>>> +    num_ctxts = min_t(num_ctxts, MAX_CTXTS, num_ctxts);
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        uint32_t vmid;
>>> +
>>> +        if (share_vm)
>>> +            vmid = shared_vm_id;
>>> +        else
>>> +            vmid = gem_vm_create_in_vm_bind_mode(fd);
>>> +
>>> +        ctx[i] = intel_ctx_create(fd, &base_ctx->cfg);
>>> +        gem_context_set_vm(fd, ctx[i]->id, vmid);
>>> +        vm_id[i] = gem_context_get_vm(fd, ctx[i]->id);
>>> +
>>> +        exec_fence[i][EXEC_FENCE].handle = syncobj_create(fd, 0);
>>> +        exec_fence[i][EXEC_FENCE].flags = I915_TIMELINE_FENCE_SIGNAL;
>>> +        exec_fence[i][EXEC_FENCE].value = 0;
>>> +    }
>>> +
>>> +    /* Create objects */
>>> +    num_cmds = min_t(num_cmds, MAX_CMDS, num_cmds);
>>> +    create_src_objs(fd, cfg, src, size, num_cmds, src_addr);
>>> +    dst = create_dst_obj(fd, cfg, size, &dst_addr);
>>> +
>>> +    /*
>>> +     * mmap'ed addresses are not 64K aligned. On platforms requiring
>>> +     * 64K alignment, use static addresses.
>>> +     */
>>> +    if (size < SZ_2M && num_cmds && 
>>> !HAS_64K_PAGES(intel_get_drm_devid(fd))) {
>>> +        src_va = to_user_pointer(src_addr[0]);
>>> +        dst_va = to_user_pointer(dst_addr);
>>> +    } else {
>>> +        src_va = 0xa000000;
>>> +        dst_va = 0xb000000;
>>> +    }
>>> +
>>> +    pattern_fill_buf(src_addr, size, num_cmds, npages);
>>> +
>>> +    if (num_cmds)
>>> +        print_buffer(src_addr[num_cmds - 1], size, "src_obj", false);
>>> +
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        batch[i] = gem_create_in_memory_regions(fd, PAGE_SIZE, 
>>> REGION_SMEM);
>>> +        igt_info("Batch obj 0x%x created in region 0x%x:0x%x\n", 
>>> batch[i],
>>> +             MEMORY_TYPE_FROM_REGION(REGION_SMEM), 
>>> MEMORY_INSTANCE_FROM_REGION(REGION_SMEM));
>>> +        batch_addr[i] = gem_mmap__cpu(fd, batch[i], 0, PAGE_SIZE, 
>>> PROT_WRITE);
>>
>> Hmm, are there any incoherent platforms (non-llc) that will be 
>> entering vm_bind world? I guess nothing currently that is graphics 
>> version >= 12? If something does come along we might see some suprises 
>> here and elsewhere.
>>
> 
> Yah, I too think it should be fine.

It sounds like mtl is perhaps one such platform, but I guess we can 
re-visit this at some later point, if needed.

> 
>> IIRC the old model would be something like mmap__cpu(), 
>> set_domain(CPU), do some CPU writes, and then later execbuf would see 
>> that the object is dirty and would do any clflushes if required before 
>> submit. Maybe the test needs to manually do all clflushing now with 
>> new eb3 model? We can also sidestep for now by using __device() or so.
>>
> 
> Yah we need to take care of this if we are supporting vm_bind on older
> platforms. Worst case, we need loop of vm_bind objects in eb3 and cflush.
> 
>>> +    }
>>> +
>>> +    /* Create mappings */
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        uint64_t va_offset = i * va_delta;
>>> +        uint64_t offset = i * delta;
>>> +        uint32_t j;
>>> +
>>> +        for (j = 0; j < num_cmds; j++)
>>> +            SET_MAP(map[i][SRC_MAP + j], src[j], src_va + va_offset, 
>>> offset, delta, 0);
>>> +        SET_MAP(map[i][DST_MAP], dst, dst_va + va_offset, offset, 
>>> delta, 0);
>>> +        SET_MAP(map[i][BATCH_MAP], batch[i], 
>>> to_user_pointer(batch_addr[i]), 0, PAGE_SIZE, 0);
>>> +    }
>>> +
>>> +    /* Bind the buffers to device page table */
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        vm_bind(fd, vm_id[i], &map[i][BATCH_MAP], 
>>> &exec_fence[i][BATCH_FENCE]);
>>> +        vm_bind(fd, vm_id[i], &map[i][DST_MAP], 
>>> &exec_fence[i][DST_FENCE]);
>>> +    }
>>> +
>>> +    /* Have GPU do the copy */
>>> +    for (i = 0; i < cfg->num_cmds; i++) {
>>> +        uint32_t j;
>>> +
>>> +        for (j = 0; j < num_ctxts; j++)
>>> +            vm_bind(fd, vm_id[j], &map[j][SRC_MAP + i], 
>>> &exec_fence[j][SRC_FENCE]);
>>> +
>>> +        i915_gem_copy(fd, src_va, dst_va, va_delta, delta, size, ctx,
>>> +                  num_ctxts, batch_addr, e->flags, exec_fence);
>>> +
>>> +        i915_gem_sync(fd, ctx, num_ctxts, exec_fence);
>>> +
>>> +        for (j = 0; j < num_ctxts; j++) {
>>> +            syncobj_destroy(fd, exec_fence[j][SRC_FENCE].handle);
>>> +            if (do_unbind(cfg))
>>> +                vm_unbind(fd, vm_id[j], &map[j][SRC_MAP + i]);
>>> +        }
>>> +    }
>>> +
>>> +    /*
>>> +     * Unbind buffers from device page table.
>>> +     * If not, it should get unbound while freeing the buffer.
>>> +     */
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        syncobj_destroy(fd, exec_fence[i][BATCH_FENCE].handle);
>>> +        syncobj_destroy(fd, exec_fence[i][DST_FENCE].handle);
>>> +        if (do_unbind(cfg)) {
>>> +            vm_unbind(fd, vm_id[i], &map[i][BATCH_MAP]);
>>> +            vm_unbind(fd, vm_id[i], &map[i][DST_MAP]);
>>> +        }
>>> +    }
>>> +
>>> +    /* Close batch buffers */
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        syncobj_destroy(fd, exec_fence[i][EXEC_FENCE].handle);
>>> +        gem_close(fd, batch[i]);
>>> +    }
>>> +
>>> +    /* Accessing the buffer will migrate the pages from device to 
>>> host */
>>
>> It shouldn't do that. Do you have some more info?
>>
> 
> This comment is a relic from the days when we had system allocator support.
> Will remove it.
> 
>>> +    print_buffer(dst_addr, size, "dst_obj", false);
>>
>> Normally we only want to dump the buffer if the test fails because 
>> there is some mismatch when comparing the expected value(s)?
>>
> 
> It is dumping it in case of failure. print_buffer uses igt_debug().
> Will rename this function to debug_dump_buffer()
> 
>>> +
>>> +    /* Validate by comparing the last SRC with DST */
>>> +    if (num_cmds)
>>> +        igt_assert(memcmp(src_addr[num_cmds - 1], dst_addr, size) == 
>>> 0);
>>> +
>>> +    /* Free the objects */
>>> +    destroy_src_objs(fd, cfg, src, size, num_cmds, src_addr);
>>> +    destroy_dst_obj(fd, cfg, dst, size, dst_addr);
>>> +
>>> +    /* Done with the contexts */
>>> +    for (i = 0; i < num_ctxts; i++) {
>>> +        igt_debug("Destroying context 0x%x\n", ctx[i]->id);
>>> +        gem_vm_destroy(fd, vm_id[i]);
>>> +        intel_ctx_destroy(fd, ctx[i]);
>>> +    }
>>> +
>>> +    if (share_vm)
>>> +        gem_vm_destroy(fd, shared_vm_id);
>>> +}
>>> +
>>> +igt_main
>>> +{
>>> +    struct test_cfg *t, tests[] = {
>>> +        {"basic", 0, 1, 1, 0},
>>> +        {"multi_cmds", 0, MAX_CMDS, 1, 0},
>>> +        {"skip_copy", 0, 0, 1, 0},
>>> +        {"skip_unbind",  0, 1, 1, TEST_SKIP_UNBIND},
>>> +        {"multi_ctxts", 0, 1, MAX_CTXTS, 0},
>>> +        {"share_vm", 0, 1, MAX_CTXTS, TEST_SHARE_VM},
>>> +        {"64K", (16 * PAGE_SIZE), 1, 1, 0},
>>> +        {"2M", SZ_2M, 1, 1, 0},
>>> +        { }
>>> +    };
>>> +    int fd;
>>> +    uint32_t def_size;
>>> +    struct intel_execution_engine2 *e;
>>> +    const intel_ctx_t *ctx;
>>> +
>>> +    igt_fixture {
>>> +        fd = drm_open_driver(DRIVER_INTEL);
>>> +        igt_require_gem(fd);
>>> +        igt_require(i915_vm_bind_version(fd) == 1);
>>> +        def_size = HAS_64K_PAGES(intel_get_drm_devid(fd)) ?
>>> +               SZ_64K : DEFAULT_BUFF_SIZE;
>>
>> Should be possible to cut over to gtt_alignment, if you feel like it. 
>> For example just stick it in gem_memory_region.
> 
> ok
> 
>>
>>> +        ctx = intel_ctx_create_all_physical(fd);
>>> +        /* Get copy engine */
>>> +        for_each_ctx_engine(fd, ctx, e)
>>> +            if (e->class == I915_ENGINE_CLASS_COPY)
>>> +                break;
>>
>> Maybe igt_require/assert() at least one copy engine? Dunno.
>>
> 
> ok
> 
>>> +    }
>>> +
>>> +    /* Adjust test variables */
>>> +    for (t = tests; t->name; t++)
>>> +        t->size = t->size ? : (def_size * abs(t->num_ctxts));
>>
>> num_ctx can be negative?
>>
> 
> No, it is a relic from older design. I have restructured the code
> here and we no longer will have this loop.
> 
>>> +
>>> +    for (t = tests; t->name; t++) {
>>> +        igt_describe_f("VM_BIND %s", t->name);
>>> +        igt_subtest_with_dynamic(t->name) {
>>> +            for_each_memory_region(r, fd) {
>>> +                struct test_cfg cfg = *t;
>>> +
>>> +                if (r->ci.memory_instance)
>>> +                    continue;
>>> +
>>> +                if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
>>> +                    cfg.flags |= TEST_LMEM;
>>> +
>>> +                igt_dynamic_f("%s", r->name)
>>> +                    run_test(fd, ctx, &cfg, e);
>>
>> Normally we just pass along the gem_memory_region. Can then fish out 
>> useful stuff like gtt_alignment, name, size etc.
>>
> 
> ok
> 
> Thanks,
> Niranjana
> 
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    igt_fixture {
>>> +        intel_ctx_destroy(fd, ctx);
>>> +        close(fd);
>>> +    }
>>> +
>>> +    igt_exit();
>>> +}
>>> diff --git a/tests/intel-ci/fast-feedback.testlist 
>>> b/tests/intel-ci/fast-feedback.testlist
>>> index 185c2fef54..8a47eaddda 100644
>>> --- a/tests/intel-ci/fast-feedback.testlist
>>> +++ b/tests/intel-ci/fast-feedback.testlist
>>> @@ -53,6 +53,7 @@ igt@i915_getparams_basic@basic-eu-total
>>>  igt@i915_getparams_basic@basic-subslice-total
>>>  igt@i915_hangman@error-state-basic
>>>  igt@i915_pciid
>>> +igt@i915_vm_bind_basic@basic-smem
>>>  igt@i915_vm_bind_sanity@basic
>>>  igt@kms_addfb_basic@addfb25-bad-modifier
>>>  igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index d81c6c28c2..1b9529a7e2 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -251,6 +251,7 @@ i915_progs = [
>>>      'sysfs_preempt_timeout',
>>>      'sysfs_timeslice_duration',
>>>      'i915_vm_bind_sanity',
>>> +    'i915_vm_bind_basic',
>>
>> Keep it sorted?
>>
>>>  ]
>>>  msm_progs = [
