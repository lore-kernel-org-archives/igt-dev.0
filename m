Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB9F10E082
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 08:43:12 +0000 (UTC)
Message-ID: <63817701-e802-41e3-ba1e-b9a8077caded@intel.com>
Date: Fri, 20 Oct 2023 09:42:51 +0100
MIME-Version: 1.0
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20231019144106.560624-1-matthew.auld@intel.com>
 <20231019144106.560624-15-matthew.auld@intel.com>
 <ZTIP1Lrj+fh1QnlY@nvishwa1-DESK>
 <b6e25708-3e3f-ded9-59de-b3d6a2da0cf6@intel.com>
In-Reply-To: <b6e25708-3e3f-ded9-59de-b3d6a2da0cf6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 14/15] tests/xe: add some vm_bind
 pat_index tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Nitish Kumar <nitish.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 20/10/2023 09:21, Matthew Auld wrote:
> On 20/10/2023 06:27, Niranjana Vishwanathapura wrote:
>> On Thu, Oct 19, 2023 at 03:41:05PM +0100, Matthew Auld wrote:
>>> Add some basic tests for pat_index and vm_bind.
>>>
>>> v2: Make sure to actually use srand() with the chosen seed
>>>  - Make it work on xe2; the wt mode now has compression.
>>>  - Also test some xe2+ specific pat_index modes.
>>> v3: Fix decompress step.
>>> v4: (Niranjana)
>>>  - Various improvements, including testing more pat_index modes, like
>>>    wc where possible.
>>>  - Document the idea behind "common" modes.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>>> Cc: Nitish Kumar <nitish.kumar@intel.com>
>>> ---
>>> tests/intel/xe_pat.c | 754 +++++++++++++++++++++++++++++++++++++++++++
>>> tests/meson.build    |   1 +
>>> 2 files changed, 755 insertions(+)
>>> create mode 100644 tests/intel/xe_pat.c
>>>
>>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
>>> new file mode 100644
>>> index 000000000..1e74014b8
>>> --- /dev/null
>>> +++ b/tests/intel/xe_pat.c
>>> @@ -0,0 +1,754 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +/**
>>> + * TEST: Test for selecting per-VMA pat_index
>>> + * Category: Software building block
>>> + * Sub-category: VMA
>>> + * Functionality: pat_index
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "intel_blt.h"
>>> +#include "intel_mocs.h"
>>> +#include "intel_pat.h"
>>> +
>>> +#include "xe/xe_ioctl.h"
>>> +#include "xe/xe_query.h"
>>> +#include "xe/xe_util.h"
>>> +
>>> +#define PAGE_SIZE 4096
>>> +
>>> +static bool do_slow_check;
>>> +
>>> +/**
>>> + * SUBTEST: userptr-coh-none
>>> + * Test category: functionality test
>>> + * Description: Test non-coherent pat_index on userptr
>>> + */
>>> +static void userptr_coh_none(int fd)
>>> +{
>>> +    size_t size = xe_get_default_alignment(fd);
>>> +    uint32_t vm;
>>> +    void *data;
>>> +
>>> +    data = mmap(0, size, PROT_READ |
>>> +            PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>>> +    igt_assert(data != MAP_FAILED);
>>> +
>>> +    vm = xe_vm_create(fd, 0, 0);
>>> +
>>> +    /*
>>> +     * Try some valid combinations first just to make sure we're not 
>>> being
>>> +     * swindled.
>>> +     */
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 
>>> 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>>> +                   DEFAULT_PAT_INDEX, 0),
>>> +              0);
>>> +    xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 
>>> 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_wb(fd), 0),
>>> +              0);
>>> +    xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>>> +
>>> +    /* And then some known COH_NONE pat_index combos which should 
>>> fail. */
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 
>>> 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_uc(fd), 0),
>>> +              -EINVAL);
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 
>>> 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_wt(fd), 0),
>>> +              -EINVAL);
>>> +
>>> +    munmap(data, size);
>>> +    xe_vm_destroy(fd, vm);
>>> +}
>>> +
>>> +/**
>>> + * SUBTEST: pat-index-all
>>> + * Test category: functionality test
>>> + * Description: Test every pat_index
>>> + */
>>> +static void pat_index_all(int fd)
>>> +{
>>> +    uint16_t dev_id = intel_get_drm_devid(fd);
>>> +    size_t size = xe_get_default_alignment(fd);
>>> +    uint32_t vm, bo;
>>> +    uint8_t pat_index;
>>> +
>>> +    vm = xe_vm_create(fd, 0, 0);
>>> +
>>> +    bo = xe_bo_create_caching(fd, 0, size, all_memory_regions(fd),
>>> +                  DRM_XE_GEM_CPU_CACHING_WC,
>>> +                  DRM_XE_GEM_COH_NONE);
>>> +
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_uc(fd), 0),
>>> +              0);
>>> +    xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>>> +
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_wt(fd), 0),
>>> +              0);
>>> +    xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>>> +
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_wb(fd), 0),
>>> +              0);
>>> +    xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>>> +
>>> +    igt_assert(intel_get_max_pat_index(fd));
>>> +
>>> +    for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
>>> +         pat_index++) {
>>> +        if (intel_get_device_info(dev_id)->graphics_ver == 20 &&
>>> +            pat_index >= 16 && pat_index <= 19) { /* hw reserved */
>>> +            igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                           size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                           pat_index, 0),
>>> +                      -EINVAL);
>>> +        } else {
>>> +            igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                           size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                           pat_index, 0),
>>> +                      0);
>>> +            xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>>> +        }
>>> +    }
>>> +
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                   pat_index, 0),
>>> +              -EINVAL);
>>> +
>>> +    gem_close(fd, bo);
>>> +
>>> +    /* Must be at least as coherent as the gem_create coh_mode. */
>>> +    bo = xe_bo_create_caching(fd, 0, size, system_memory(fd),
>>> +                  DRM_XE_GEM_CPU_CACHING_WB,
>>> +                  DRM_XE_GEM_COH_AT_LEAST_1WAY);
>>> +
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_uc(fd), 0),
>>> +              -EINVAL);
>>> +
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_wt(fd), 0),
>>> +              -EINVAL);
>>> +
>>> +    igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>>> +                   size, XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>>> +                   intel_get_pat_idx_wb(fd), 0),
>>> +              0);
>>> +    xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>>> +
>>> +    gem_close(fd, bo);
>>> +
>>> +    xe_vm_destroy(fd, vm);
>>> +}
>>> +
>>> +#define CLEAR_1 0xFFFFFFFF /* something compressible */
>>> +
>>> +static void xe2_blt_decompress_dst(int fd,
>>> +                   intel_ctx_t *ctx,
>>> +                   uint64_t ahnd,
>>> +                   struct blt_copy_data *blt,
>>> +                   uint32_t alias_handle,
>>> +                   uint32_t size)
>>> +{
>>> +    struct blt_copy_object tmp = {};
>>> +
>>> +    /*
>>> +     * Xe2 in-place decompression using an alias to the same physical
>>> +     * memory, but with the dst mapped using some uncompressed 
>>> pat_index.
>>> +     * This should allow checking the object pages via mmap.
>>> +     */
>>> +
>>> +    memcpy(&tmp, &blt->src, sizeof(blt->dst));
>>> +    memcpy(&blt->src, &blt->dst, sizeof(blt->dst));
>>> +    blt_set_object(&blt->dst, alias_handle, size, 0,
>>> +               intel_get_uc_mocs_index(fd),
>>> +               intel_get_pat_idx_uc(fd), /* compression disabled */
>>> +               T_LINEAR, 0, 0);
>>> +    blt_fast_copy(fd, ctx, NULL, ahnd, blt);
>>> +    memcpy(&blt->dst, &blt->src, sizeof(blt->dst));
>>> +    memcpy(&blt->src, &tmp, sizeof(blt->dst));
>>> +}
>>> +
>>> +struct xe_pat_size_mode {
>>> +    uint16_t width;
>>> +    uint16_t height;
>>> +    uint32_t alignment;
>>> +    const char *name;
>>> +};
>>> +
>>> +struct xe_pat_param {
>>> +    int fd;
>>> +
>>> +    const struct xe_pat_size_mode *size;
>>> +
>>> +    uint32_t r1;
>>> +    uint8_t  r1_pat_index;
>>> +    uint16_t r1_coh_mode;
>>> +    bool     r1_force_cpu_wc;
>>> +
>>> +    uint32_t r2;
>>> +    uint8_t  r2_pat_index;
>>> +    uint16_t r2_coh_mode;
>>> +    bool     r2_force_cpu_wc;
>>> +    bool     r2_compressed; /* xe2+ compression */
>>> +
>>> +};
>>> +
>>> +static void pat_index_blt(struct xe_pat_param *p)
>>> +{
>>> +    struct drm_xe_engine_class_instance inst = {
>>> +        .engine_class = DRM_XE_ENGINE_CLASS_COPY,
>>> +    };
>>> +    struct blt_copy_data blt = {};
>>> +    struct blt_copy_object src = {};
>>> +    struct blt_copy_object dst = {};
>>> +    uint32_t vm, exec_queue, src_bo, dst_bo, bb;
>>> +    uint32_t *src_map, *dst_map;
>>> +    uint16_t r1_cpu_caching, r2_cpu_caching;
>>> +    uint32_t r1_flags, r2_flags;
>>> +    intel_ctx_t *ctx;
>>> +    uint64_t ahnd;
>>> +    int width = p->size->width, height = p->size->height;
>>> +    int size, stride, bb_size;
>>> +    int bpp = 32;
>>> +    uint32_t alias, name;
>>> +    int fd = p->fd;
>>> +    int i;
>>> +
>>> +    igt_require(blt_has_fast_copy(fd));
>>> +
>>> +    vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
>>> +    exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>>> +    ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
>>> +    ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>>> +                     INTEL_ALLOCATOR_SIMPLE,
>>> +                     ALLOC_STRATEGY_LOW_TO_HIGH,
>>> +                     p->size->alignment);
>>> +
>>> +    bb_size = xe_get_default_alignment(fd);
>>> +    bb = xe_bo_create_flags(fd, 0, bb_size, system_memory(fd));
>>> +
>>> +    size = width * height * bpp / 8;
>>> +    stride = width * 4;
>>> +
>>> +    r1_flags = 0;
>>> +    if (p->r1 != system_memory(fd))
>>> +        r1_flags |= XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>>> +
>>> +    if (p->r1_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY
>>> +        && p->r1 == system_memory(fd) && !p->r1_force_cpu_wc)
>>> +        r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
>>> +    else
>>> +        r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>> +
>>> +    r2_flags = 0;
>>> +    if (p->r2 != system_memory(fd))
>>> +        r2_flags |= XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>>> +
>>> +    if (p->r2_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY &&
>>> +        p->r2 == system_memory(fd) && !p->r2_force_cpu_wc)
>>> +        r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
>>> +    else
>>> +        r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>> +
>>> +
>>> +    src_bo = xe_bo_create_caching(fd, 0, size, p->r1 | r1_flags, 
>>> r1_cpu_caching,
>>> +                      p->r1_coh_mode);
>>> +    dst_bo = xe_bo_create_caching(fd, 0, size, p->r2 | r2_flags, 
>>> r2_cpu_caching,
>>> +                      p->r2_coh_mode);
>>> +    if (p->r2_compressed) {
>>> +        name = gem_flink(fd, dst_bo);
>>> +        alias = gem_open(fd, name);
>>> +    }
>>> +
>>> +    blt_copy_init(fd, &blt);
>>> +    blt.color_depth = CD_32bit;
>>> +
>>> +    blt_set_object(&src, src_bo, size, p->r1, 
>>> intel_get_uc_mocs_index(fd),
>>> +               p->r1_pat_index, T_LINEAR,
>>> +               COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
>>> +    blt_set_geom(&src, stride, 0, 0, width, height, 0, 0);
>>> +
>>> +    blt_set_object(&dst, dst_bo, size, p->r2, 
>>> intel_get_uc_mocs_index(fd),
>>> +               p->r2_pat_index, T_LINEAR,
>>> +               COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
>>> +    blt_set_geom(&dst, stride, 0, 0, width, height, 0, 0);
>>> +
>>> +    blt_set_copy_object(&blt.src, &src);
>>> +    blt_set_copy_object(&blt.dst, &dst);
>>> +    blt_set_batch(&blt.bb, bb, bb_size, system_memory(fd));
>>> +
>>> +    src_map = xe_bo_map(fd, src_bo, size);
>>> +    dst_map = xe_bo_map(fd, dst_bo, size);
>>> +
>>> +    /* Ensure we always see zeroes for the initial KMD zeroing */
>>> +    blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
>>> +    if (p->r2_compressed)
>>> +        xe2_blt_decompress_dst(fd, ctx, ahnd, &blt, alias, size);
>>> +
>>> +    /*
>>> +     * Only sample random dword in every page if we are doing slow 
>>> uncached
>>> +     * reads from VRAM.
>>> +     */
>>> +    if (!do_slow_check && p->r2 != system_memory(fd)) {
>>> +        int dwords_page = PAGE_SIZE / sizeof(uint32_t);
>>> +        int dword = rand() % dwords_page;
>>> +
>>> +        igt_debug("random dword: %d\n", dword);
>>> +
>>> +        for (i = dword; i < size / sizeof(uint32_t); i += dwords_page)
>>> +            igt_assert_eq(dst_map[i], 0);
>>> +
>>> +    } else {
>>> +        for (i = 0; i < size / sizeof(uint32_t); i++)
>>> +            igt_assert_eq(dst_map[i], 0);
>>> +    }
>>> +
>>> +    /* Write some values from the CPU, potentially dirtying the CPU 
>>> cache */
>>> +    for (i = 0; i < size / sizeof(uint32_t); i++) {
>>> +        if (p->r2_compressed)
>>> +            src_map[i] = CLEAR_1;
>>> +        else
>>> +            src_map[i] = i;
>>> +    }
>>> +
>>> +    /* And finally ensure we always see the CPU written values */
>>> +    blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
>>> +    if (p->r2_compressed)
>>> +        xe2_blt_decompress_dst(fd, ctx, ahnd, &blt, alias, size);
>>> +
>>> +    if (!do_slow_check && p->r2 != system_memory(fd)) {
>>> +        int dwords_page = PAGE_SIZE / sizeof(uint32_t);
>>> +        int dword = rand() % dwords_page;
>>> +
>>> +        igt_debug("random dword: %d\n", dword);
>>> +
>>> +        for (i = dword; i < size / sizeof(uint32_t); i += 
>>> dwords_page) {
>>> +            if (p->r2_compressed)
>>> +                igt_assert_eq(dst_map[i], CLEAR_1);
>>> +            else
>>> +                igt_assert_eq(dst_map[i], i);
>>> +        }
>>> +
>>> +    } else {
>>> +        for (i = 0; i < size / sizeof(uint32_t); i++) {
>>> +            if (p->r2_compressed)
>>> +                igt_assert_eq(dst_map[i], CLEAR_1);
>>> +            else
>>> +                igt_assert_eq(dst_map[i], i);
>>> +        }
>>> +    }
>>> +
>>> +    munmap(src_map, size);
>>> +    munmap(dst_map, size);
>>> +
>>> +    gem_close(fd, src_bo);
>>> +    gem_close(fd, dst_bo);
>>> +    gem_close(fd, bb);
>>> +
>>> +    xe_exec_queue_destroy(fd, exec_queue);
>>> +    xe_vm_destroy(fd, vm);
>>> +
>>> +    put_ahnd(ahnd);
>>> +    intel_ctx_destroy(fd, ctx);
>>> +}
>>> +
>>> +static void pat_index_render(struct xe_pat_param *p)
>>> +{
>>> +    int fd = p->fd;
>>> +    uint32_t devid = intel_get_drm_devid(fd);
>>> +    igt_render_copyfunc_t render_copy = NULL;
>>> +    int size, stride, width = p->size->width, height = p->size->height;
>>> +    struct intel_buf src, dst;
>>> +    struct intel_bb *ibb;
>>> +    struct buf_ops *bops;
>>> +    uint16_t r1_cpu_caching, r2_cpu_caching;
>>> +    uint32_t r1_flags, r2_flags;
>>> +    uint32_t src_bo, dst_bo;
>>> +    uint32_t *src_map, *dst_map;
>>> +    int bpp = 32;
>>> +    int i;
>>> +
>>> +    bops = buf_ops_create(fd);
>>> +
>>> +    render_copy = igt_get_render_copyfunc(devid);
>>> +    igt_require(render_copy);
>>> +    igt_require(!p->r2_compressed); /* XXX */
>>> +    igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
>>> +
>>> +    ibb = intel_bb_create_full(fd, 0, 0, NULL, 
>>> xe_get_default_alignment(fd),
>>> +                   0, 0, p->size->alignment,
>>> +                   INTEL_ALLOCATOR_SIMPLE,
>>> +                   ALLOC_STRATEGY_HIGH_TO_LOW);
>>> +
>>> +    if (p->r1_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY
>>> +        && p->r1 == system_memory(fd) && !p->r1_force_cpu_wc)
>>> +        r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
>>> +    else
>>> +        r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>> +
>>> +    if (p->r2_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY &&
>>> +        p->r2 == system_memory(fd) && !p->r2_force_cpu_wc)
>>> +        r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
>>> +    else
>>> +        r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>> +
>>> +    size = width * height * bpp / 8;
>>> +    stride = width * 4;
>>> +
>>> +    r1_flags = 0;
>>> +    if (p->r1 != system_memory(fd))
>>> +        r1_flags |= XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>>> +
>>> +    src_bo = xe_bo_create_caching(fd, 0, size, p->r1 | r1_flags, 
>>> r1_cpu_caching,
>>> +                      p->r1_coh_mode);
>>> +    intel_buf_init_full(bops, src_bo, &src, width, height, bpp, 0,
>>> +                I915_TILING_NONE, I915_COMPRESSION_NONE, size,
>>> +                stride, p->r1, p->r1_pat_index);
>>> +
>>> +    r2_flags = 0;
>>> +    if (p->r2 != system_memory(fd))
>>> +        r2_flags |= XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>>> +
>>> +    dst_bo = xe_bo_create_caching(fd, 0, size, p->r2 | r2_flags, 
>>> r2_cpu_caching,
>>> +                      p->r2_coh_mode);
>>> +    intel_buf_init_full(bops, dst_bo, &dst, width, height, bpp, 0,
>>> +                I915_TILING_NONE, I915_COMPRESSION_NONE, size,
>>> +                stride, p->r2, p->r2_pat_index);
>>> +
>>> +    src_map = xe_bo_map(fd, src_bo, size);
>>> +    dst_map = xe_bo_map(fd, dst_bo, size);
>>> +
>>> +    /* Ensure we always see zeroes for the initial KMD zeroing */
>>> +    render_copy(ibb,
>>> +            &src,
>>> +            0, 0, width, height,
>>> +            &dst,
>>> +            0, 0);
>>> +    intel_bb_sync(ibb);
>>> +
>>> +    if (!do_slow_check && p->r2 != system_memory(fd)) {
>>> +        int dwords_page = PAGE_SIZE / sizeof(uint32_t);
>>> +        int dword = rand() % dwords_page;
>>> +
>>> +        igt_debug("random dword: %d\n", dword);
>>> +
>>> +        for (i = dword; i < size / sizeof(uint32_t); i += dwords_page)
>>> +            igt_assert_eq(dst_map[i], 0);
>>> +    } else {
>>> +        for (i = 0; i < size / sizeof(uint32_t); i++)
>>> +            igt_assert_eq(dst_map[i], 0);
>>> +    }
>>> +
>>> +    /* Write some values from the CPU, potentially dirtying the CPU 
>>> cache */
>>> +    for (i = 0; i < size / sizeof(uint32_t); i++)
>>> +        src_map[i] = i;
>>> +
>>> +    /* And finally ensure we always see the CPU written values */
>>> +    render_copy(ibb,
>>> +            &src,
>>> +            0, 0, width, height,
>>> +            &dst,
>>> +            0, 0);
>>> +    intel_bb_sync(ibb);
>>> +
>>> +    if (!do_slow_check && p->r2 != system_memory(fd)) {
>>> +        int dwords_page = PAGE_SIZE / sizeof(uint32_t);
>>> +        int dword = rand() % dwords_page;
>>> +
>>> +        igt_debug("random dword: %d\n", dword);
>>> +
>>> +        for (i = dword; i < size / sizeof(uint32_t); i += dwords_page)
>>> +            igt_assert_eq(dst_map[i], i);
>>> +    } else {
>>> +        for (i = 0; i < size / sizeof(uint32_t); i++)
>>> +            igt_assert_eq(dst_map[i], i);
>>> +    }
>>> +
>>> +    munmap(src_map, size);
>>> +    munmap(dst_map, size);
>>> +
>>> +    intel_bb_destroy(ibb);
>>> +
>>> +    gem_close(fd, src_bo);
>>> +    gem_close(fd, dst_bo);
>>> +}
>>> +
>>> +static uint8_t get_pat_idx_uc(int fd, bool *compressed)
>>> +{
>>> +    if (compressed)
>>> +        *compressed = false;
>>> +
>>> +    return intel_get_pat_idx_uc(fd);
>>> +}
>>> +
>>> +static uint8_t get_pat_idx_wt(int fd, bool *compressed)
>>> +{
>>> +    uint16_t dev_id = intel_get_drm_devid(fd);
>>> +
>>> +    if (compressed)
>>> +        *compressed = intel_get_device_info(dev_id)->graphics_ver == 
>>> 20;
>>> +
>>> +    return intel_get_pat_idx_wt(fd);
>>> +}
>>> +
>>> +static uint8_t get_pat_idx_wb(int fd, bool *compressed)
>>> +{
>>> +    if (compressed)
>>> +        *compressed = false;
>>> +
>>> +    return intel_get_pat_idx_wb(fd);
>>> +}
>>> +
>>> +struct pat_index_entry {
>>> +    uint8_t (*get_pat_index)(int fd, bool *compressed);
>>> +
>>> +    uint8_t pat_index;
>>> +    bool compressed;
>>> +
>>> +    const char *name;
>>> +    uint16_t coh_mode;
>>> +    bool force_cpu_wc;
>>> +};
>>> +
>>> +/*
>>> + * The common modes are available on all platforms supported by Xe 
>>> and so should
>>> + * be commonly supported. There are many more possible pat_index 
>>> modes, however
>>> + * most IGTs shouldn't really care about them so likely no need to 
>>> add them to
>>> + * lib/intel_pat.c. We do try to test some on the non-common modes 
>>> here.
>>> + */
>>> +const struct pat_index_entry common_pat_index_modes[] = {
>>> +    { get_pat_idx_uc, 0, 0, "uc", DRM_XE_GEM_COH_NONE                },
>>> +    { get_pat_idx_wt, 0, 0, "wt", DRM_XE_GEM_COH_NONE                },
>>> +    { get_pat_idx_wb, 0, 0, "wb", DRM_XE_GEM_COH_AT_LEAST_1WAY       },
>>> +    { get_pat_idx_wb, 0, 0, "wb-cpu-wc", 
>>> DRM_XE_GEM_COH_AT_LEAST_1WAY, true },
>>> +};
>>> +
>>> +const struct pat_index_entry xelp_pat_index_modes[] = {
>>> +    { NULL, 1, false, "wc", DRM_XE_GEM_COH_NONE },
>>> +};
>>> +
>>> +const struct pat_index_entry xehpc_pat_index_modes[] = {
>>> +    { NULL, 1, false, "wc",    DRM_XE_GEM_COH_NONE          },
>>> +    { NULL, 4, false, "c1-wt", DRM_XE_GEM_COH_NONE          },
>>> +    { NULL, 5, false, "c1-wb", DRM_XE_GEM_COH_AT_LEAST_1WAY },
>>> +    { NULL, 6, false, "c2-wt", DRM_XE_GEM_COH_NONE          },
>>> +    { NULL, 7, false, "c2-wb", DRM_XE_GEM_COH_AT_LEAST_1WAY },
>>> +};
>>> +
>>> +/* Too many, just pick some interesting ones */
>>> +const struct pat_index_entry xe2_pat_index_modes[] = {
>>> +    { NULL, 1, false, "1way", DRM_XE_GEM_COH_AT_LEAST_1WAY       },
>>> +    { NULL, 2, false, "2way", DRM_XE_GEM_COH_AT_LEAST_1WAY       },
>>> +    { NULL, 2, false, "2way-cpu-wc", DRM_XE_GEM_COH_AT_LEAST_1WAY, 
>>> true },
>>> +    { NULL, 3, true,  "uc-comp", DRM_XE_GEM_COH_NONE                },
>>> +    { NULL, 5, false, "uc-1way", DRM_XE_GEM_COH_AT_LEAST_1WAY       },
>>> +};
>>> +
>>> +/*
>>> + * Depending on 2M/1G GTT pages we might trigger different PTE 
>>> layouts for the
>>> + * PAT bits, so make sure we test with and without huge-pages. Also 
>>> ensure we
>>> + * have a mix of different pat_index modes for each PDE.
>>> + */
>>> +const struct xe_pat_size_mode size_modes[] =  {
>>> +    { 256,  256,  0,        "mixed-pde"  },
>>> +    { 1024, 1024, 1u << 21, "single-pde" },
>>> +};
>>
>> I am bit confused with naming here (mixed-pde/single-pde).
>> The first case here creates BOs of size 256*256*8/2 = 256K which means 
>> it will
>> need updating few PTEs could be all under a single PTE. This tests 
>> pat_index
>> setting of PTEs
>> The second case here create BOs of size 1024*1024*8/2 = 4MB which at 
>> 2MB offset
>> will occupy 2 PDEs. This tests pat_index setting of leaf PDEs.
>> Right?
> 
> Yup, the "mixed-pde" just means that the pde contains multiple different 
> mappings using different pat_index. The "single-pde" means that the 
> mapping will entirely consume each pde, hopefully with 2M GTT pages 
> given the alignment. And yes this is mostly to test bit7/bit12 with pat[2].
> 
> I will change this to rather use 2M size, which is maybe less consufing.

Also just realised I forgot to include the xelpg tables. Will fix that also.

> 
>>
>> Other than that, the patch looks fine to me.
>> Reviewed-by: Niranjana Vishwanathapura 
>> <niranjana.vishwanathapura@intel.com>
> 
> Thanks.
> 
>>
>>> +
>>> +typedef void (*copy_fn)(struct xe_pat_param *p);
>>> +
>>> +const struct xe_pat_copy_mode {
>>> +    copy_fn fn;
>>> +    const char *name;
>>> +} copy_modes[] =  {
>>> +    {  pat_index_blt,    "blt"    },
>>> +    {  pat_index_render, "render" },
>>> +};
>>> +
>>> +/**
>>> + * SUBTEST: pat-index-common
>>> + * Test category: functionality test
>>> + * Description: Check the common pat_index modes.
>>> + */
>>> +
>>> +/**
>>> + * SUBTEST: pat-index-xelp
>>> + * Test category: functionality test
>>> + * Description: Check some of the xelp pat_index modes.
>>> + */
>>> +
>>> +/**
>>> + * SUBTEST: pat-index-xehpc
>>> + * Test category: functionality test
>>> + * Description: Check some of the xehpc pat_index modes.
>>> + */
>>> +
>>> +/**
>>> + * SUBTEST: pat-index-xe2
>>> + * Test category: functionality test
>>> + * Description: Check some of the xe2 pat_index modes.
>>> + */
>>> +
>>> +static void subtest_pat_index_modes_with_regions(int fd,
>>> +                         const struct pat_index_entry *modes_arr,
>>> +                         int n_modes)
>>> +{
>>> +    struct igt_collection *copy_set;
>>> +    struct igt_collection *pat_index_set;
>>> +    struct igt_collection *regions_set;
>>> +    struct igt_collection *sizes_set;
>>> +    struct igt_collection *copies;
>>> +    struct xe_pat_param p = {};
>>> +
>>> +    p.fd = fd;
>>> +
>>> +    copy_set = igt_collection_create(ARRAY_SIZE(copy_modes));
>>> +
>>> +    pat_index_set = igt_collection_create(n_modes);
>>> +
>>> +    regions_set = xe_get_memory_region_set(fd,
>>> +                           XE_MEM_REGION_CLASS_SYSMEM,
>>> +                           XE_MEM_REGION_CLASS_VRAM);
>>> +
>>> +    sizes_set = igt_collection_create(ARRAY_SIZE(size_modes));
>>> +
>>> +    for_each_variation_r(copies, 1, copy_set) {
>>> +        struct igt_collection *regions;
>>> +        struct xe_pat_copy_mode copy_mode;
>>> +
>>> +        copy_mode = copy_modes[igt_collection_get_value(copies, 0)];
>>> +
>>> +        for_each_variation_r(regions, 2, regions_set) {
>>> +            struct igt_collection *pat_modes;
>>> +            uint32_t r1, r2;
>>> +            char *reg_str;
>>> +
>>> +            r1 = igt_collection_get_value(regions, 0);
>>> +            r2 = igt_collection_get_value(regions, 1);
>>> +
>>> +            reg_str = xe_memregion_dynamic_subtest_name(fd, regions);
>>> +
>>> +            for_each_variation_r(pat_modes, 2, pat_index_set) {
>>> +                struct igt_collection *sizes;
>>> +                struct pat_index_entry r1_entry, r2_entry;
>>> +                int r1_idx, r2_idx;
>>> +
>>> +                r1_idx = igt_collection_get_value(pat_modes, 0);
>>> +                r2_idx = igt_collection_get_value(pat_modes, 1);
>>> +
>>> +                r1_entry = modes_arr[r1_idx];
>>> +                r2_entry = modes_arr[r2_idx];
>>> +
>>> +                if (r1_entry.get_pat_index)
>>> +                    p.r1_pat_index = r1_entry.get_pat_index(fd, NULL);
>>> +                else
>>> +                    p.r1_pat_index = r1_entry.pat_index;
>>> +
>>> +                if (r2_entry.get_pat_index)
>>> +                    p.r2_pat_index = r2_entry.get_pat_index(fd, 
>>> &p.r2_compressed);
>>> +                else {
>>> +                    p.r2_pat_index = r2_entry.pat_index;
>>> +                    p.r2_compressed = r2_entry.compressed;
>>> +                }
>>> +
>>> +                p.r1_coh_mode = r1_entry.coh_mode;
>>> +                p.r2_coh_mode = r2_entry.coh_mode;
>>> +
>>> +                p.r1_force_cpu_wc = r1_entry.force_cpu_wc;
>>> +                p.r2_force_cpu_wc = r2_entry.force_cpu_wc;
>>> +
>>> +                p.r1 = r1;
>>> +                p.r2 = r2;
>>> +
>>> +                for_each_variation_r(sizes, 1, sizes_set) {
>>> +                    int size_mode_idx = 
>>> igt_collection_get_value(sizes, 0);
>>> +
>>> +                    p.size = &size_modes[size_mode_idx];
>>> +
>>> +                    igt_debug("[r1]: r: %u, idx: %u, coh: %u, wc: 
>>> %d\n",
>>> +                          p.r1, p.r1_pat_index, p.r1_coh_mode, 
>>> p.r1_force_cpu_wc);
>>> +                    igt_debug("[r2]: r: %u, idx: %u, coh: %u, wc: 
>>> %d, comp: %d, w: %u, h: %u, a: %u\n",
>>> +                          p.r2, p.r2_pat_index, p.r2_coh_mode,
>>> +                          p.r2_force_cpu_wc, p.r2_compressed,
>>> +                          p.size->width, p.size->height,
>>> +                          p.size->alignment);
>>> +
>>> +                    igt_dynamic_f("%s-%s-%s-%s-%s",
>>> +                              copy_mode.name,
>>> +                              reg_str, r1_entry.name,
>>> +                              r2_entry.name, p.size->name)
>>> +                        copy_mode.fn(&p);
>>> +                }
>>> +            }
>>> +
>>> +            free(reg_str);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +igt_main
>>> +{
>>> +    uint16_t dev_id;
>>> +    int fd;
>>> +
>>> +    igt_fixture {
>>> +        uint32_t seed;
>>> +
>>> +        fd = drm_open_driver(DRIVER_XE);
>>> +        dev_id = intel_get_drm_devid(fd);
>>> +
>>> +        seed = time(NULL);
>>> +        srand(seed);
>>> +        igt_debug("seed: %d\n", seed);
>>> +
>>> +        xe_device_get(fd);
>>> +    }
>>> +
>>> +    igt_subtest("pat-index-all")
>>> +        pat_index_all(fd);
>>> +
>>> +    igt_subtest("userptr-coh-none")
>>> +        userptr_coh_none(fd);
>>> +
>>> +    igt_subtest_with_dynamic("pat-index-common") {
>>> +        subtest_pat_index_modes_with_regions(fd, 
>>> common_pat_index_modes,
>>> +                             ARRAY_SIZE(common_pat_index_modes));
>>> +    }
>>> +
>>> +    igt_subtest_with_dynamic("pat-index-xelp") {
>>> +        igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
>>> +        subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
>>> +                             ARRAY_SIZE(xelp_pat_index_modes));
>>> +    }
>>> +
>>> +    igt_subtest_with_dynamic("pat-index-xehpc") {
>>> +        igt_require(IS_PONTEVECCHIO(dev_id));
>>> +        subtest_pat_index_modes_with_regions(fd, xehpc_pat_index_modes,
>>> +                             ARRAY_SIZE(xehpc_pat_index_modes));
>>> +    }
>>> +
>>> +    igt_subtest_with_dynamic("pat-index-xe2") {
>>> +        igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
>>> +        subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
>>> +                             ARRAY_SIZE(xe2_pat_index_modes));
>>> +    }
>>> +
>>> +    igt_fixture
>>> +        drm_close_driver(fd);
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 5afcd8cbb..3aecfbee0 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -297,6 +297,7 @@ intel_xe_progs = [
>>>     'xe_mmap',
>>>     'xe_module_load',
>>>     'xe_noexec_ping_pong',
>>> +    'xe_pat',
>>>     'xe_pm',
>>>     'xe_pm_residency',
>>>     'xe_prime_self_import',
>>> -- 
>>> 2.41.0
>>>
