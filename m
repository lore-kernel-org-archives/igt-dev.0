Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B3D10E64F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 09:34:17 +0000 (UTC)
Message-ID: <956a1367-ca0d-a26d-5f82-30d01e71a106@intel.com>
Date: Tue, 18 Oct 2022 10:34:06 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221018071705.3906-1-niranjana.vishwanathapura@intel.com>
 <20221018071705.3906-10-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071705.3906-10-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 09/11] tests/i915/vm_bind: Add
 gem_exec3_basic test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 18/10/2022 08:17, Niranjana Vishwanathapura wrote:
> Port gem_exec_basic to a new gem_exec3_basic test which
> uses the newer execbuf3 ioctl.
> 
> v2: use i915_vm_bind library functions
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   tests/i915/gem_exec3_basic.c          | 133 ++++++++++++++++++++++++++
>   tests/intel-ci/fast-feedback.testlist |   1 +
>   tests/meson.build                     |   1 +
>   3 files changed, 135 insertions(+)
>   create mode 100644 tests/i915/gem_exec3_basic.c
> 
> diff --git a/tests/i915/gem_exec3_basic.c b/tests/i915/gem_exec3_basic.c
> new file mode 100644
> index 0000000000..3994381748
> --- /dev/null
> +++ b/tests/i915/gem_exec3_basic.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +/** @file gem_exec3_basic.c
> + *
> + * Basic execbuf3 test.
> + * Ported from gem_exec_basic and made to work with
> + * vm_bind and execbuf3.
> + *
> + */
> +
> +#include "i915/gem.h"
> +#include "i915/i915_vm_bind.h"
> +#include "igt.h"
> +#include "igt_collection.h"
> +#include "igt_syncobj.h"
> +
> +#include "i915/gem_create.h"
> +#include "i915/gem_vm.h"
> +
> +IGT_TEST_DESCRIPTION("Basic sanity check of execbuf3-ioctl rings.");
> +
> +#define BATCH_VA	0xa0000000
> +#define PAGE_SIZE	4096
> +
> +static uint64_t gettime_ns(void)
> +{
> +	struct timespec current;
> +	clock_gettime(CLOCK_MONOTONIC, &current);
> +	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
> +}
> +
> +static uint32_t batch_create(int fd, uint64_t *batch_size, uint32_t region)
> +{
> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> +	uint32_t handle;
> +
> +	igt_assert(__gem_create_in_memory_regions(fd, &handle, batch_size, region) == 0);
> +	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> +
> +	return handle;
> +}
> +
> +igt_main
> +{
> +	const struct intel_execution_engine2 *e;
> +	struct drm_i915_query_memory_regions *query_info;
> +	struct igt_collection *regions, *set;
> +	const intel_ctx_t *base_ctx, *ctx;
> +	uint32_t vm_id;
> +	int fd = -1;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_INTEL);
> +		base_ctx = intel_ctx_create_all_physical(fd);
> +
> +		igt_require_gem(fd);
> +		igt_require(i915_vm_bind_version(fd) == 1);

Here and elsewhere, should that rather be >= 1?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> +		igt_fork_hang_detector(fd);
> +
> +		vm_id = gem_vm_create_in_vm_bind_mode(fd);
> +		ctx  = intel_ctx_create(fd, &base_ctx->cfg);
> +		gem_context_set_vm(fd, ctx->id, vm_id);
> +
> +		query_info = gem_get_query_memory_regions(fd);
> +		igt_assert(query_info);
> +
> +		set = get_memory_region_set(query_info,
> +					    I915_SYSTEM_MEMORY,
> +					    I915_DEVICE_MEMORY);
> +	}
> +
> +	igt_describe("Check basic functionality of GEM_EXECBUFFER3 ioctl on every"
> +		     " ring and iterating over memory regions.");
> +	igt_subtest_with_dynamic("basic") {
> +		for_each_combination(regions, 1, set) {
> +			struct drm_i915_gem_timeline_fence exec_fence[GEM_MAX_ENGINES][2] = { };
> +			char *sub_name = memregion_dynamic_subtest_name(regions);
> +			uint32_t region = igt_collection_get_value(regions, 0);
> +			uint32_t bind_syncobj, exec_syncobj[GEM_MAX_ENGINES];
> +			uint64_t fence_value[GEM_MAX_ENGINES] = { };
> +			uint64_t batch_size = PAGE_SIZE;
> +			uint32_t handle, idx = 0;
> +
> +			handle = batch_create(fd, &batch_size, region);
> +			bind_syncobj = syncobj_create(fd, 0);
> +			i915_vm_bind(fd, vm_id, BATCH_VA, handle, 0, batch_size, bind_syncobj, 0);
> +
> +			for_each_ctx_engine(fd, ctx, e) {
> +				igt_dynamic_f("%s-%s", e->name, sub_name) {
> +					struct drm_i915_gem_execbuffer3 execbuf = {
> +						.ctx_id = ctx->id,
> +						.batch_address = BATCH_VA,
> +						.engine_idx = e->flags,
> +						.fence_count = 2,
> +						.timeline_fences = to_user_pointer(&exec_fence[idx]),
> +					};
> +
> +					exec_syncobj[idx] = syncobj_create(fd, 0);
> +					exec_fence[idx][0].handle = bind_syncobj;
> +					exec_fence[idx][0].flags = I915_TIMELINE_FENCE_WAIT;
> +					exec_fence[idx][1].handle = exec_syncobj[idx];
> +					exec_fence[idx][1].flags = I915_TIMELINE_FENCE_SIGNAL;
> +					idx++;
> +
> +					gem_execbuf3(fd, &execbuf);
> +				}
> +			}
> +
> +			igt_assert(syncobj_timeline_wait(fd, exec_syncobj, fence_value, idx,
> +							 gettime_ns() + (2 * NSEC_PER_SEC),
> +							 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
> +			while (idx)
> +				syncobj_destroy(fd, exec_syncobj[--idx]);
> +			syncobj_destroy(fd, bind_syncobj);
> +			i915_vm_unbind(fd, vm_id, BATCH_VA, batch_size);
> +			gem_close(fd, handle);
> +			free(sub_name);
> +		}
> +	}
> +
> +	igt_fixture {
> +		intel_ctx_destroy(fd, ctx);
> +		gem_vm_destroy(fd, vm_id);
> +		free(query_info);
> +		igt_collection_destroy(set);
> +		igt_stop_hang_detector();
> +		intel_ctx_destroy(fd, base_ctx);
> +		close(fd);
> +	}
> +}
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 8a47eaddda..c5be7e300b 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -27,6 +27,7 @@ igt@gem_exec_fence@nb-await
>   igt@gem_exec_gttfill@basic
>   igt@gem_exec_parallel@engines
>   igt@gem_exec_store@basic
> +igt@gem_exec3_basic@basic
>   igt@gem_flink_basic@bad-flink
>   igt@gem_flink_basic@bad-open
>   igt@gem_flink_basic@basic
> diff --git a/tests/meson.build b/tests/meson.build
> index 1b9529a7e2..50de8b7e89 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -252,6 +252,7 @@ i915_progs = [
>   	'sysfs_timeslice_duration',
>   	'i915_vm_bind_sanity',
>   	'i915_vm_bind_basic',
> +	'gem_exec3_basic',
>   ]
>   
>   msm_progs = [
