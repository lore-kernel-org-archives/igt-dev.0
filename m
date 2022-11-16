Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <76292787-b4eb-a9b1-fe75-f3ca2a6933f0@linux.intel.com>
Date: Wed, 16 Nov 2022 10:45:46 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20221115103424.109524-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221115103424.109524-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915/madvise: verify
 async eviction with madvise
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 11/15/2022 11:34 AM, Matthew Auld wrote:
> Simple regression test for lmem to check if an in-progress async unbind
> and eviction is syncronised with discarding the pages when marking
> the object as DONTNEED.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/i915/gem_madvise.c | 130 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 129 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 2502d84c..d164df3a 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -36,8 +36,9 @@
>   #include <setjmp.h>
>   #include <signal.h>
>   
> -#include "drm.h"
> +#include "igt_kmod.h"
>   #include "i915/gem_create.h"
> +#include "i915/gem.h"
>   
>   IGT_TEST_DESCRIPTION("Checks that the kernel reports EFAULT when trying to use"
>   		     " purged bo.");
> @@ -188,6 +189,76 @@ dontneed_before_exec(void)
>   	close(fd);
>   }
>   
> +#define PAGE_SIZE 4096
> +
> +static uint32_t batch_create_size(int fd, uint64_t size)
> +{
> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> +	uint32_t handle;
> +
> +	handle = gem_create(fd, size);
> +	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> +
> +	return handle;
> +}
> +
> +static int upload(int fd, uint32_t handle)
> +{
> +	struct drm_i915_gem_exec_object2 exec[2] = {};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&exec),
> +		.buffer_count = 2,
> +	};
> +
> +	exec[0].handle = handle;
> +	exec[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +	exec[1].handle = batch_create_size(fd, PAGE_SIZE);
> +	exec[1].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +
> +	gem_execbuf(fd, &execbuf);
> +	return 0;
> +}
> +

When we have some time in future, we should move above functions to a 
common files.

Thanks Matt, for clarifying my doubts regarding this over Teams.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> +static void test_dontneed_evict_race(int fd,
> +				     struct gem_memory_region *region)
> +{
> +	const uint64_t size = region->size >> 1;
> +	uint64_t ahnd = get_reloc_ahnd(fd, 0);
> +	uint32_t handle1;
> +	igt_spin_t *spin;
> +
> +	handle1 = gem_create_in_memory_region_list(fd, size, 0,
> +						   &region->ci, 1);
> +	spin = igt_spin_new(fd,
> +			    .ahnd = ahnd,
> +			    .dependency = handle1);
> +
> +	igt_fork(child, 1) {
> +		uint32_t handle2;
> +
> +		fd = gem_reopen_driver(fd);
> +
> +		handle2 = gem_create_in_memory_region_list(fd,
> +							   size, 0,
> +							   &region->ci, 1);
> +		/*
> +		 * The actual move when evicting will be pipelined
> +		 * behind the spinner, so can't fire until the spinner
> +		 * is killed.
> +		 */
> +		upload(fd, handle2);
> +		gem_close(fd, handle2);
> +	}
> +
> +	sleep(2); /* Give eviction time to find handle1 */
> +	igt_spin_end(spin);
> +	gem_madvise(fd, handle1, I915_MADV_DONTNEED);
> +	igt_waitchildren();
> +
> +	igt_spin_free(fd, spin);
> +	gem_close(fd, handle1);
> +}
> +
>   igt_main
>   {
>   	igt_describe("Check signal for Segmentation Fault and bus error before"
> @@ -209,4 +280,61 @@ igt_main
>   		     " purged bo for GPU.");
>   	igt_subtest("dontneed-before-exec")
>   		dontneed_before_exec();
> +
> +	igt_subtest_group {
> +		struct drm_i915_query_memory_regions *regions;
> +		int i915 = -1;
> +
> +		igt_fixture {
> +			char *tmp;
> +
> +			if (igt_kmod_is_loaded("i915")) {
> +				i915 = __drm_open_driver(DRIVER_INTEL);
> +				igt_require_fd(i915);
> +				igt_require_gem(i915);
> +				igt_require(gem_has_lmem(i915));
> +				close(i915);
> +			}
> +
> +			igt_i915_driver_unload();
> +			/*
> +			 * To avoid running of ring space and stalling during evicting
> +			 * (while holding the dma-resv lock), we need to use a smaller
> +			 * lmem size, such we can easliy trigger eviction without
> +			 * needing to wait for more ring space. The point of the test is
> +			 * to mark the object as DONTNEED which has an in-progress
> +			 * pipilined unbind/move, which also requires grabbing the
> +			 * dma-resv lock.
> +			 */
> +			igt_assert_eq(igt_i915_driver_load("lmem_size=128"), 0);
> +
> +			i915 = __drm_open_driver(DRIVER_INTEL);
> +			igt_require_fd(i915);
> +			igt_require_gem(i915);
> +			igt_require(gem_has_lmem(i915));
> +
> +			tmp = __igt_params_get(i915, "lmem_size");
> +			igt_skip_on(!tmp);
> +			free(tmp);
> +
> +			regions = gem_get_query_memory_regions(i915);
> +			igt_require(regions);
> +		}
> +
> +		igt_describe("Regression test to verify that madvise will sync against busy dma-resv object for lmem");
> +		igt_subtest("dontneed-evict-race") {
> +			for_each_memory_region(r, i915) {
> +				if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE) {
> +					test_dontneed_evict_race(i915, r);
> +					break;
> +				}
> +			}
> +
> +		}
> +
> +		igt_fixture {
> +			close(i915);
> +			igt_i915_driver_unload();
> +		}
> +	}
>   }
