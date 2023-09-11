Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E6B10E2F9
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 13:25:19 +0000 (UTC)
Message-ID: <6a5bfd0a-78a8-0850-4b5e-b28c96b931d3@intel.com>
Date: Mon, 11 Sep 2023 15:14:34 +0200
Content-Language: en-US
To: <sai.gowtham.ch@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
 <20230904110458.24177-2-sai.gowtham.ch@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230904110458.24177-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] intel/xe_copy_basic: Add copy basic
 test to exercise blt commands
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

On 4.09.2023 13:04, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add copy basic test to exercise copy commands like mem-copy and mem-set.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   tests/intel/xe_copy_basic.c | 284 ++++++++++++++++++++++++++++++++++++
>   tests/meson.build           |   1 +
>   2 files changed, 285 insertions(+)
>   create mode 100644 tests/intel/xe_copy_basic.c
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> new file mode 100644
> index 000000000..a9c00ec5a
> --- /dev/null
> +++ b/tests/intel/xe_copy_basic.c
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Authors:
> + *	Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> + */
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "intel_blt.h"
> +#include "lib/intel_cmds_info.h"
> +#include "lib/intel_mocs.h"
> +#include "lib/intel_reg.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe/xe_util.h"
> +
> +/**
> + * TEST: Test to validate copy commands on xe
> + * Category: Software building block
> + * Sub-category: Copy
> + * Functionality: blitter
> + * Test category: functionality test
> + */
> +
> +#define MEM_COPY_MOCS_SHIFT                     25
> +
> +static int objcmp(int fd, uint32_t src, uint32_t dst,
> +		uint32_t src_size, uint32_t dst_size)

Please fix the alignment in this line

> +{
> +	uint32_t *buf_src, *buf_dst;
> +	int ret = 0;
> +
> +	buf_src = xe_bo_map(fd, src, src_size);
> +	buf_dst = xe_bo_map(fd, dst, dst_size);
> +
> +	ret = memcmp(buf_src, buf_dst, src_size);
> +
> +	munmap(buf_src, src_size);
> +	munmap(buf_dst, dst_size);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: mem-copy
> + * Description: Test validates MEM_COPY command, it takes various
> + *		parameters needed for the filling batch buffer for MEM_COPY command.
> + * Run type: FULL
> + */
> +static void
> +igt_mem_copy(int fd, uint32_t src, uint32_t dst, uint32_t size,
> +		uint32_t col_size, uint32_t vm, uint32_t exec_queue,
> +		uint64_t ahnd)

Here as well. It looks fine in my email client, but it's off in the 
code, and checkpatch script also caught it.

The test looks good in general[1], but I'd re-order and merge some of 
the patches so they compile one by one:

squash lib/intel_cmds_info + lib/intel_blt --> intel_reg change --> 
xe_basic_copy test

To reiterate, I'm fine with either extracting the commands to intel_blt 
library or leaving the test as it is. It's all dependent on if we want 
to test MEM_SET and MEM_COPY on i915 or not.

All the best,
Karolina

---------------------------------------------
[1] - I didn't test it, so I hope that you did, not just on the platform 
that supports mem_set

> +{
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +
> +	uint32_t bb_handle, syncobj;
> +	struct {
> +		uint32_t batch[12];
> +		uint32_t data;
> +	} *data;
> +
> +	uint64_t bb_offset, src_offset, dst_offset;
> +	uint64_t alignment;
> +	uint8_t src_mocs = intel_get_uc_mocs(fd);
> +	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint8_t dst_mocs = src_mocs;
> +	int i;
> +
> +	alignment = xe_get_default_alignment(fd);
> +
> +	bb_handle = xe_bo_create_flags(fd, 0, bb_size, visible_vram_if_possible(fd, 0));
> +	data = xe_bo_map(fd, bb_handle, bb_size);
> +
> +	src_offset = get_offset(ahnd, src, size, alignment);
> +	dst_offset = get_offset(ahnd, dst, size, alignment);
> +	bb_offset = get_offset(ahnd, bb_handle, bb_size, alignment);
> +
> +	i = 0;
> +	data->batch[i++] = MEM_COPY_CMD;
> +	data->batch[i++] = size - 1;
> +	data->batch[i++] = col_size - 1;
> +	data->batch[i++] = 0;
> +	data->batch[i++] = 0;
> +	data->batch[i++] = src_offset;
> +	data->batch[i++] = src_offset << 32;
> +	data->batch[i++] = dst_offset;
> +	data->batch[i++] = dst_offset << 32;
> +	data->batch[i++] = src_mocs << MEM_COPY_MOCS_SHIFT | dst_mocs;
> +	data->batch[i++] = MI_BATCH_BUFFER_END;
> +	data->batch[i++] = MI_NOOP;
> +
> +	syncobj = syncobj_create(fd, 0);
> +	sync.handle = syncobj;
> +
> +	xe_vm_bind_sync(fd, vm, bb_handle, 0, bb_offset, bb_size);
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = bb_offset;
> +	sync.handle = syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	gem_close(fd, bb_handle);
> +	put_ahnd(ahnd);
> +	munmap(data, bb_size);
> +	syncobj_destroy(fd, syncobj);
> +}
> +
> +/**
> + * SUBTEST: mem-set
> + * Description: Test validates MEM_SET command.
> + * RUN type: FULL
> + */
> +static void igt_mem_set(int fd, uint32_t dst, size_t size, uint32_t height,
> +			uint32_t fill_data, uint32_t vm, uint32_t exec_queue, uint64_t ahnd)
> +{
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct {
> +		uint32_t batch[12];
> +		uint32_t data;
> +	} *data;
> +
> +	uint32_t syncobj;
> +	uint64_t dst_offset;
> +	uint8_t dst_mocs = intel_get_uc_mocs(fd);
> +	int b;
> +	uint32_t dword0;
> +
> +	data = xe_bo_map(fd, dst, size);
> +	dst_offset = intel_allocator_alloc_with_strategy(ahnd, dst, size, 0,
> +							 ALLOC_STRATEGY_LOW_TO_HIGH);
> +
> +	dword0 = MEM_SET_CMD;
> +	b = 0;
> +	data->batch[b++] = dword0;
> +	data->batch[b++] = size - 1;
> +	data->batch[b++] = height;
> +	data->batch[b++] = 0;
> +	data->batch[b++] = dst_offset;
> +	data->batch[b++] = dst_offset << 32;
> +	data->batch[b++] = (fill_data << 24) | dst_mocs;
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	data->batch[b++] = MI_NOOP;
> +
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	syncobj = syncobj_create(fd, 0);
> +	sync.handle = syncobj;
> +
> +	xe_vm_bind_sync(fd, vm, dst, 0, dst_offset, size);
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = dst_offset;
> +	sync.handle = syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	munmap(data, size);
> +	put_ahnd(ahnd);
> +	syncobj_destroy(fd, syncobj);
> +}
> +
> +static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd,
> +		      struct drm_xe_engine_class_instance *hwe, uint32_t region)
> +{
> +	uint32_t src_size, dst_size;
> +	uint32_t src, dst, vm, exec_queue;
> +	char c = 'a';
> +	uint32_t bo_size = ALIGN(size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> +	uint32_t temp_buffer[bo_size];
> +	uint64_t ahnd;
> +
> +	src = xe_bo_create_flags(fd, 0, bo_size, region);
> +	dst = xe_bo_create_flags(fd, 0, bo_size, region);
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +
> +	/* Fill a pattern in the buffer */
> +	for (int i = 0; i < bo_size; i++) {
> +		temp_buffer[i] = c++ % 16;
> +		temp_buffer[i] |= (c++ % 16) << 8;
> +		temp_buffer[i] |= (c++ % 16) << 16;
> +		temp_buffer[i] |= (c++ % 16) << 24;
> +	}
> +
> +	src_size = bo_size;
> +	dst_size = bo_size;
> +
> +	if (cmd == MEM_COPY) {
> +		igt_mem_copy(fd,
> +			     src,/*src_handle*/
> +			     dst,/*dst_handle*/
> +			     bo_size,/*row_size*/
> +			     1,/*col_size*/
> +			     vm,
> +			     exec_queue,
> +			     ahnd);
> +		igt_assert_eq(objcmp(fd, src, dst, src_size, dst_size), 0);
> +	} else if (cmd == MEM_SET) {
> +		igt_mem_set(fd,
> +			    dst, /*dst_handle*/
> +			    bo_size,/*width*/
> +			    1,/*height*/
> +			    0,/*fill_data*/
> +			    vm,
> +			    exec_queue,
> +			    ahnd);
> +		src_size = 1;
> +	}
> +
> +	gem_close(fd, src);
> +	gem_close(fd, dst);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +	struct igt_collection *set, *regions;
> +	uint32_t region;
> +	uint64_t size[] = {0xFD, 0x369, 0x369, 0x3FFF, 0xFFFF, 0x1FFFF, 0x3FFFF};
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +		set = xe_get_memory_region_set(fd,
> +					       XE_MEM_REGION_CLASS_SYSMEM,
> +					       XE_MEM_REGION_CLASS_VRAM);
> +	}
> +	igt_subtest_with_dynamic_f("mem-copy") {
> +		igt_require(blt_has_mem_copy(fd));
> +		for_each_variation_r(regions, 1, set) {
> +			region = igt_collection_get_value(regions, 0);
> +			xe_for_each_hw_engine(fd, hwe) {
> +				for (int i = 0; i < ARRAY_SIZE(size); i++) {
> +					igt_dynamic_f("size-0x%lx", size[i]) {
> +						copy_test(fd, size[i],
> +							  MEM_COPY, hwe,
> +							  region);
> +					}
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic_f("mem-set") {
> +		igt_require(blt_has_mem_set(fd));
> +		for_each_variation_r(regions, 1, set) {
> +			region = igt_collection_get_value(regions, 0);
> +			xe_for_each_hw_engine(fd, hwe) {
> +				for (int i = 0; i < ARRAY_SIZE(size); i++) {
> +					igt_dynamic_f("size-0x%lx", size[i]) {
> +						copy_test(fd, size[i],
> +							  MEM_SET, hwe, region);
> +					}
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index aa8e3434c..418b7aa53 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -273,6 +273,7 @@ intel_xe_progs = [
>   	'xe_ccs',
>   	'xe_create',
>   	'xe_compute',
> +	'xe_copy_basic',
>   	'xe_dma_buf_sync',
>   	'xe_debugfs',
>   	'xe_evict',
