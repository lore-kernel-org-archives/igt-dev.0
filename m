Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFCD10E519
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 13:40:33 +0000 (UTC)
Message-ID: <93054ffa-abe7-5bce-cc72-e8127754f932@intel.com>
Date: Fri, 18 Aug 2023 15:40:18 +0200
Content-Language: en-US
To: <sai.gowtham.ch@intel.com>
References: <20230818051916.28272-1-sai.gowtham.ch@intel.com>
 <20230818051916.28272-3-sai.gowtham.ch@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230818051916.28272-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe/xe_copy_basic: Add copy
 basic test to exercise blt commands
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

Hi Sai,

On 18.08.2023 07:19, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add copy basic test to exercise copy commands like mem-copy and mem-set.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   tests/meson.build        |   1 +
>   tests/xe/xe_copy_basic.c | 262 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 263 insertions(+)
>   create mode 100644 tests/xe/xe_copy_basic.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 58061dbc2..323c2108a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -266,6 +266,7 @@ xe_progs = [
>   	'xe_ccs',
>   	'xe_create',
>   	'xe_compute',
> +	'xe_copy_basic',
>   	'xe_dma_buf_sync',
>   	'xe_debugfs',
>   	'xe_evict',
> diff --git a/tests/xe/xe_copy_basic.c b/tests/xe/xe_copy_basic.c
> new file mode 100644
> index 000000000..ce1223eb1
> --- /dev/null
> +++ b/tests/xe/xe_copy_basic.c
> @@ -0,0 +1,262 @@
> +/* SPDX-License-Identifier: MIT */

Nit: this line uses formatting dedicated for header files, use // instead

> +/* > +* Copyright © 2023 Intel Corporation

Nit: Add spaces to align *s to /*

> +*
> +* Authors:
> +*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> +*/
> +
> +#include "igt.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "lib/intel_mocs.h"
> +#include "lib/intel_reg.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/xe/xe_util.h"
> +
> +/**
> + * TEST: Test to valiudate copy commands on xe

 From what I understand, the TEST field is just the name of the specific 
test, the rest should go to Description. Also, s/valiudate/validate/

> + * Category: Software building block
> + * Sub-category: Copy
> + * Functionality: blitter
> + * Test category: functionality test
> + */
> +
> +enum command {
> +	MEM_COPY,
> +	MEM_SET,
> +};
> +
> +static int objcmp(int fd, uint32_t src, uint32_t dst,
> +			uint32_t src_size, uint32_t dst_size)

                      ^-- misaligned line

> +{
> +	void *buf_src, *buf_dst;
> +	int ret = 0;
> +
> +	buf_src = xe_bo_map(fd, src, src_size);
> +	buf_dst = xe_bo_map(fd, dst, dst_size);
> +
> +	ret = memcmp(buf_src, buf_dst , src_size);

Whoops, an extra space before ","

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
> + * 		parameters needed for the filling batch buffer for MEM_COPY command.
> + * Run type: FULL
> + */
> +

I _think_ that an empty line before this and the other doc is not 
needed, but I'd need to double-check in other tests.

> +static void
> +igt_mem_copy(int fd, uint32_t src, uint32_t dst,
> +                uint32_t size, uint32_t col_size, uint32_t src_pitch,

Nit: misaligned line that uses spaces instead of tabs, could you correct 
it in the next version?

Also, I have a question about src_pitch and dst_pitch arguments -- is 
there a test case where they are different from 0? If not, could we drop 
them from the arguments list?

> +		uint32_t dst_pitch, uint32_t vm, uint32_t engine)
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
> +	uint64_t ahnd;
> +	int i;
> +
> +	alignment = xe_get_default_alignment(fd);
> +
> +	bb_handle = xe_bo_create_flags(fd, 0, bb_size, visible_vram_if_possible(fd, 0));
> +	data = xe_bo_map(fd, bb_handle, bb_size);
> +
> +	ahnd = intel_allocator_open_full(fd, vm, 0, 0, INTEL_ALLOCATOR_SIMPLE,
> +					ALLOC_STRATEGY_LOW_TO_HIGH, 0);

Slightly misaligned, from what I can see. You can check these with 
scripts/checkpatch.pl from the kernel repo.

> +	src_offset = get_offset(ahnd, src, size, alignment);
> +	dst_offset = get_offset(ahnd, dst, size, alignment);
> +	bb_offset = get_offset(ahnd, bb_handle, bb_size, alignment);
> +
> +	i = 0;
> +	data->batch[i++] = MEM_COPY_CMD;
> +	data->batch[i++] = size - 1;
> +	data->batch[i++] = col_size - 1;
> +	data->batch[i++] = src_pitch;
> +	data->batch[i++] = dst_pitch;
> +	data->batch[i++] = src_offset;
> +	data->batch[i++] = src_offset << 32;
> +	data->batch[i++] = dst_offset;
> +	data->batch[i++] = dst_offset << 32;
> +	data->batch[i++] = src_mocs << MEM_COPY_MOCS_SHIFT | dst_mocs;
> +	data->batch[i++] = MI_BATCH_BUFFER_END;
> +	data->batch[i++] = MI_NOOP;

I see that in both batches we use MI_NOOP -- is there a reason for doing 
that?

> +
> +	syncobj = syncobj_create(fd, 0);
> +	sync.handle = syncobj;
> +
> +	xe_vm_bind_sync(fd, vm, bb_handle, 0, bb_offset, bb_size);
> +
> +	exec.exec_queue_id = engine;
> +	exec.address = bb_offset;
> +	sync.handle = syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	gem_close(fd, bb_handle);
> +	put_ahnd(ahnd);
> +	munmap(data, bb_size);
> +
^--- extra empty line, it would be good to delete it

Also, that's the comment that applies both to mem_copy and mem_set -- 
shouldn't we call syncobj_destroy() at the end of the test?

> +}
> +
> +/**
> + * SUBTEST: mem-set
> + * Description: Test validates MEM_SET command.
> + * RUN type: FULL
> + */
> +
> +static void igt_mem_set(int fd, uint32_t dst, size_t size, uint32_t height,
> +			uint32_t fill_data, uint32_t vm, uint32_t engine)
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
> +	uint64_t dst_offset, ahnd;
> +	uint8_t dst_mocs = intel_get_uc_mocs(fd);
> +	int b;
> +
> +	data = xe_bo_map(fd, dst, size);
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);

Before we had a simple allocator, why do we pick a different one in this 
one?

> +	dst_offset = intel_allocator_alloc_with_strategy(ahnd, dst, size, 0,
> +							ALLOC_STRATEGY_LOW_TO_HIGH);

Alignment is slightly off here

> +
> +	b = 0;
> +	data->batch[b++] = MEM_SET_CMD;
> +	data->batch[b++] = size - 1;
> +	data->batch[b++] = height;
> +	data->batch[b++] = 2 * size - 1;

 From what I understand, this filed is ignored for linear fill and we 
have no matrix case. Do you have a plans of adding one? If not, I think 
it should be fine to set it to 0, but you'd need to test my assumption.

> +	data->batch[b++] = dst_offset;
> +	data->batch[b++] = dst_offset << 32;
> +	data->batch[b++] = (fill_data << 24) | dst_mocs;
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	data->batch[b++] = MI_NOOP;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	syncobj = syncobj_create(fd, 0);
> +	sync.handle = syncobj;
> +
> +	xe_vm_bind_sync(fd, vm, dst, 0, dst_offset, size);
> +
> +	exec.exec_queue_id = engine;
> +	exec.address = dst_offset;
> +	sync.handle = syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	munmap(data, size);
> +	put_ahnd(ahnd);

Is gem_close() call missing from here?

> +}
> +
> +static void copy_test(int fd, enum command cmd,
> +		      struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t src_size, dst_size;
> +	uint32_t src, dst, vm, engine;
> +	char c = 'a';
> +	size_t bo_size = xe_get_default_alignment(fd);
> +	uint32_t temp_buffer[bo_size];
> +
> +	src = xe_bo_create_flags(fd, 0, bo_size, visible_vram_memory(fd, hwe->gt_id));
> +	dst = xe_bo_create_flags(fd, 0, bo_size, visible_vram_memory(fd, hwe->gt_id));

This test only tests lmem<->lmem scenario, what about smem<->smem and 
lmem<->smem?

> +	vm = xe_vm_create(fd, 0, 0);
> +	engine = xe_exec_queue_create(fd, vm, hwe, 0);

Given the recent rename from xe_engine to xe_exec_queue, would it be 
possible to rename this variable and param names to match it? Leaving 
engine here is slightly confusing.

> +
> +	/* Fill a pattern in the buffer */
> +	for (int i = 0; i < bo_size; i++) {
> +		temp_buffer[i] = c++ % 16;
> +		temp_buffer[i] |= (c++ % 16) << 8;
> +		temp_buffer[i] |= (c++ % 16) << 16;
> +		temp_buffer[i] |= (c++ % 16) << 24;

For each byte, we're using a different value. It's more of a nit, but I 
wonder if we could just increment c for each 4 byte chunk, not every byte.

> +	}
> +
> +	src_size = bo_size;
> +	dst_size = bo_size;
> +
> +	switch (cmd) {
> +	case MEM_COPY: /* MEM_COPY_CMD */
> +		igt_mem_copy(fd,
> +			     src,
> +			     dst,
> +			     bo_size,
> +			     1,
> +			     0,
> +			     0,
> +			     vm,
> +			     engine);
> +		break;
> +
> +	case MEM_SET:
> +		igt_mem_set(fd,
> +			    dst,
> +			    bo_size,
> +			    1,
> +			    temp_buffer[0] & 0xff,
> +			    vm,
> +			    engine);
> +		src_size = 1;
> +		break;
> +	}

It's more of a suggestion -- could we add comments to each argument what 
it stands for? That would ease the reading process, it took some time 
for me to map each value with the specific parameter.

> +
> +	igt_assert_eq(objcmp(fd, src, src_size, dst, dst_size), 0);
> +	gem_close(fd, src);
> +	gem_close(fd, dst);
> +
> +	xe_exec_queue_destroy(fd, engine);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);

How is this test going to be run? As a part of CI or manually? If the 
former, I think we should add a check to see if a specific platform 
supports MEM_COPY or MEM_SET and skip if it doesn't. We could do it by 
adding information on supported commands to intel_cmd_info.c and 
implementing a helper to check for it, something similar to 
blt_fast_copy_supports_tiling() function.

All the best,
Karolina

> +	}
> +
> +	igt_subtest("mem-set")
> +		xe_for_each_hw_engine(fd, hwe)
> +			copy_test(fd, MEM_SET, hwe);
> +
> +	igt_subtest("mem-copy")
> +		xe_for_each_hw_engine(fd, hwe)
> +			copy_test(fd, MEM_COPY, hwe);
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> +
