Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9C010E26A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 11:08:12 +0000 (UTC)
Date: Mon, 18 Sep 2023 13:08:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20230918110808.z2m7mnlqqa3gd527@zkempczy-mobl2>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
 <20230915051617.9361-5-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915051617.9361-5-sai.gowtham.ch@intel.com>
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

On Fri, Sep 15, 2023 at 10:46:17AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add copy basic test to exercise copy commands like mem-copy and mem-set.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 199 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  2 files changed, 200 insertions(+)
>  create mode 100644 tests/intel/xe_copy_basic.c
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

For matrix copy you need pitch of each objects too.

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

I wonder should you use blt_copy_data struct or define new one. If you
decide to use blt_copy_data you should add seperate wrapper which
initializes it for mem-set/copy operations. Be aware those commands supports
linear or matrix fills / transfers. Also compression is supported in case
of linear copy so it would be good to test this as well.

> +	blt_set_object(&blt.src, src_handle, row_size, region, src_mocs, 0,
> +		       T_LINEAR, COMPRESSION_DISABLED);

Adding T_MATRIX is problematic as this is not tiling at all and might
be confusing. Apart of this for_each_tiling() iterator would run over
it even it this is not we want. You could hide this after
__BLT_MAX_TILING enum but this is ugly hack and I got mixed feelings
about it. I would rather go toward new enum for supported set/copy
formats and new struct blt_mem_data.

> +	blt_set_object(&blt.dst, dst_handle, row_size, region, dst_mocs, 0,
> +		       T_LINEAR, COMPRESSION_DISABLED);
> +	blt_set_batch(&blt.bb, bb, bb_size, region);
> +	igt_assert(blt.src.size == blt.dst.size);
> +
> +	blt_mem_copy(fd, ctx, NULL, ahnd, &blt, col_size);
> +	result = memcmp(blt.src.ptr, blt.dst.ptr, blt.src.size);
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

For filled object I would expect byte-by-byte check, not memcmp().

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

What for is adding xe_cs_prefetch_size(fd) to buffer size? This is
related to command streamer prefetcher, not accesses to buffers.

> +	uint32_t temp_buffer[bo_size];

I'm not fan of such big allocations on the stack, definitely
use dynamic allocations.

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

Strange pattern, high nibbles will be always 0x0000.
as temp_buffer is uint32_t isn't better just simply assign i
there?

> +
> +	if (cmd == MEM_COPY) {
> +		igt_mem_copy(fd,
> +			     src_handle,/*src_handle*/
> +			     dst_handle,/*dst_handle*/

Useless comments.

> +			     ctx,
> +			     src_size,/*row_size*/
> +			     1,/*col_size*/

Same here.

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
>  	'xe_ccs',
>  	'xe_create',
>  	'xe_compute',
> +	'xe_copy_basic',
>  	'xe_dma_buf_sync',
>  	'xe_debugfs',
>  	'xe_evict',
> -- 
> 2.39.1
>

On PVC I got:

IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.5.0-rc7-xe+ x86_64)
Opened device: /dev/dri/card0
Starting subtest: mem-copy
Test requirement not met in function __igt_unique____real_main149, file ../tests/intel/xe_copy_basic.c:166:
Test requirement: blt_has_mem_copy(fd)
Subtest mem-copy: SKIP (0.000s)
Starting subtest: mem-set
Test requirement not met in function __igt_unique____real_main149, file ../tests/intel/xe_copy_basic.c:182:
Test requirement: blt_has_mem_set(fd)
Subtest mem-set: SKIP (0.000s)

Even if I enforced blt_has_mem_copy|set() returns true (you need
to properly configure this in intel_cmds_info.c) I got failures
on vm_bind_array.

--
Zbigniew
