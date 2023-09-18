Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9410E05C
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 10:48:05 +0000 (UTC)
Message-ID: <25921c10-5f5e-01b0-fe89-bccae64c051c@intel.com>
Date: Mon, 18 Sep 2023 12:47:55 +0200
Content-Language: en-US
To: <sai.gowtham.ch@intel.com>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
 <20230915051617.9361-5-sai.gowtham.ch@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230915051617.9361-5-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] intel/xe_copy_basic: Add copy basic
 test to exercise blt commands
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

On 15.09.2023 07:16, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add copy basic test to exercise copy commands like mem-copy and mem-set.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   tests/intel/xe_copy_basic.c | 199 ++++++++++++++++++++++++++++++++++++
>   tests/meson.build           |   1 +
>   2 files changed, 200 insertions(+)
>   create mode 100644 tests/intel/xe_copy_basic.c
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> new file mode 100644
> index 000000000..0014b022e
> --- /dev/null
> +++ b/tests/intel/xe_copy_basic.c
> @@ -0,0 +1,199 @@
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
> + */
> +
> +/**
> + * SUBTEST: mem-copy
> + * Description: Test validates MEM_COPY command, it takes various
> + *		parameters needed for the filling batch buffer for MEM_COPY command.
> + * Test category: functionality test
> + */
> +static void
> +igt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> +	     const intel_ctx_t *ctx, uint32_t row_size,
> +	     uint32_t col_size, uint32_t region)
> +{
> +	struct blt_copy_data blt = {};
> +	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> +						  INTEL_ALLOCATOR_SIMPLE,
> +						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +	uint32_t bb;
> +	int result;
> +	uint8_t src_mocs = intel_get_uc_mocs(fd);
> +	uint8_t dst_mocs = src_mocs;
> +
> +	bb = xe_bo_create_flags(fd, 0, bb_size, region);
> +
> +	blt_copy_init(fd, &blt);
> +	blt_set_object(&blt.src, src_handle, row_size, region, src_mocs, 0,
> +		       T_LINEAR, COMPRESSION_DISABLED);
> +	blt_set_object(&blt.dst, dst_handle, row_size, region, dst_mocs, 0,
> +		       T_LINEAR, COMPRESSION_DISABLED);
> +	blt_set_batch(&blt.bb, bb, bb_size, region);
> +	igt_assert(blt.src.size == blt.dst.size);
> +
> +	blt_mem_copy(fd, ctx, NULL, ahnd, &blt, col_size);
> +	result = memcmp(blt.src.ptr, blt.dst.ptr, blt.src.size);

This is in addition to Zbigniew's comments -- I'd move 
gem_close/intel_allocator_bind etc., so it's before the assertion. We 
already capture the result, so we can clean everything up before the 
check, and free the resources even if the assertion fails.

The same comment applies to igt_mem_set.

Also, I wonder if we could drop igt_ prefix. These function don't belong 
to the IGT framework or whatsoever.

And one more thing -- could we free the objects via 
blt_destroy_object()? I don't think they're reused between the tests.

> +	igt_assert_f(!result, "source and destination differ\n");
> +
> +	intel_allocator_bind(ahnd, 0, 0);
> +	gem_close(fd, bb);
> +	put_ahnd(ahnd);
> +}
> +
> +/**
> + * SUBTEST: mem-set
> + * Description: Test validates MEM_SET command.
> + * Test category: functionality test
> + */
> +static void igt_mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx,
> +			size_t size, uint32_t height,
> +			uint32_t fill_data, uint32_t region)
> +{
> +	struct blt_copy_data blt = {};
> +	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> +						  INTEL_ALLOCATOR_SIMPLE,
> +						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +	uint32_t bb;
> +	int result;
> +	uint8_t dst_mocs = intel_get_uc_mocs(fd);
> +
> +	bb = xe_bo_create_flags(fd, 0, bb_size, region);
> +	blt_copy_init(fd, &blt);
> +	blt_set_object(&blt.dst, dst_handle, size, region, dst_mocs, 0,
> +		       T_LINEAR, COMPRESSION_DISABLED);
> +	blt_set_batch(&blt.bb, bb, bb_size, region);
> +	blt_set_mem(fd, ctx, NULL, ahnd, &blt, height, fill_data);
> +	result = memcmp(blt.src.ptr, blt.dst.ptr, blt.src.size);
> +	igt_assert_f(!result, "source and destination differ\n");
> +
> +	intel_allocator_bind(ahnd, 0, 0);
> +	gem_close(fd, bb);
> +	put_ahnd(ahnd);
> +}
> +
> +static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd,
> +		      struct drm_xe_engine_class_instance *hwe, uint32_t region)
> +{
> +	uint32_t src_handle, dst_handle, vm, exec_queue, src_size, dst_size;
> +	char c = 'a';
> +	uint32_t bo_size = ALIGN(size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> +	uint32_t temp_buffer[bo_size];
> +	const intel_ctx_t *ctx;
> +
> +	src_handle = xe_bo_create_flags(fd, 0, bo_size, region);
> +	dst_handle = xe_bo_create_flags(fd, 0, bo_size, region);
> +	vm = xe_vm_create(fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> +
> +	src_size = bo_size;
> +	dst_size = bo_size;
> +
> +	/* Fill a pattern in the buffer */
> +	for (int i = 0; i < bo_size; i++) {
> +		temp_buffer[i] = c++ % 16;
> +		temp_buffer[i] |= (c++ % 16) << 8;
> +		temp_buffer[i] |= (c++ % 16) << 16;
> +		temp_buffer[i] |= (c++ % 16) << 24;
> +	}
> +
> +	if (cmd == MEM_COPY) {
> +		igt_mem_copy(fd,
> +			     src_handle,/*src_handle*/
> +			     dst_handle,/*dst_handle*/
> +			     ctx,
> +			     src_size,/*row_size*/
> +			     1,/*col_size*/
> +			     region);
> +	} else if (cmd == MEM_SET) {
> +		igt_mem_set(fd,
> +			    dst_handle, /*dst_handle*/
> +			    ctx,
> +			    dst_size,/*width*/
> +			    1,/*height*/
> +			    temp_buffer[0] & 0xff,/*fill_data*/
> +			    region);
> +		src_size = 1;

Why do we set this after the mem set? Can't we set it before and pass to 
mem_set? Why to override it at all?

All the best,
Karolina

> +	}
> +
> +	gem_close(fd, src_handle);
> +	gem_close(fd, dst_handle);
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
> +
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
> index 7201958b7..753cde31e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -274,6 +274,7 @@ intel_xe_progs = [
>   	'xe_ccs',
>   	'xe_create',
>   	'xe_compute',
> +	'xe_copy_basic',
>   	'xe_dma_buf_sync',
>   	'xe_debugfs',
>   	'xe_evict',
