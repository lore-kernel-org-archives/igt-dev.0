Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F7410E269
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 05:06:40 +0000 (UTC)
Date: Thu, 21 Jul 2022 07:06:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <Ytje0guUbMZs2oXR@zkempczy-mobl2>
References: <20220707082820.25823-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707082820.25823-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture : Add
 support for local memory
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

On Thu, Jul 07, 2022 at 01:58:20PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> v1: Adding local memory support to many-4K-zero subtest
>     and used new macro for_each_memory_region for memory regioning.
> 
> v2: Add 48b exec flag for execbuf.
> 
> v3: Iterate make-4k-incremental subtest over memory region and
>     also reducing the number of objects created in lmem so that
>     allocations in lmem is done adequate based on the allocation size
>     available , as lmem is occupied by flatccs + gtt.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/i915/intel_memory_region.c | 15 ++++++++
>  lib/i915/intel_memory_region.h |  2 +
>  tests/i915/gem_exec_capture.c  | 70 +++++++++++++++++-----------------
>  3 files changed, 53 insertions(+), 34 deletions(-)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 93a18982..be0e7d9f 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -339,6 +339,21 @@ struct mmap_supported_region {
>  	struct igt_list_head link;
>  };
>  
> +
> +unsigned long gem_lmem_objects_create_max(int i915, uint64_t size)
> +{
> +	struct drm_i915_query_memory_regions *info;
> +	uint64_t lmem_size, gtt;
> +	unsigned long count;
> +
> +	gtt = gem_aperture_size(i915) / size;
> +	info = gem_get_query_memory_regions(i915);
> +	lmem_size = gpu_meminfo_region_total_size(info, I915_MEMORY_CLASS_DEVICE) / (size * 16);
> +
> +	count = min(gtt, lmem_size) / 8;
> +	return count;
> +}
> +
>  /**
>   * get_dma_buf_mmap_supported_set:
>   * @i915: i915 drm file descriptor
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index e1bfe0ca..6b951c67 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -179,6 +179,8 @@ struct gem_memory_region {
>  	uint64_t cpu_size;
>  };
>  
> +unsigned long gem_lmem_objects_create_max(int i915, uint64_t size);
> +

As we've discussed there's no potential users of this function yet
lets keep it locally. It shape should look like:

uint32_t static get_objects_max_num_in_region(int i915, uint64_t size, uint32_t region)
{

    free = /* acquire from dedicated region */

    __gem_create_in_memory_region(... &size ...) /* adjust size, may be bigger than requested */


    return free / size;    
}

As capturing lmem object is time consuming due to uncached mapping we may
limit this in the test:

#define DEVICE_MEMORY_OBJ_MAX ... /* pick some reasonable max and add appropriate comment */

	numobj = get_objects_max_num_in_region(...);

	if (IS_DEVICE_MEMORY_REGION(region)) {
		numobj = min(numobj, DEVICE_MEMORY_OBJ_MAX);
	else 
		numobj = numbobj / 8; 


Above should keep us in reasonable time limit.

>  struct igt_collection *
>  get_dma_buf_mmap_supported_set(int i915, struct igt_collection *set);
>  
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index a25f529b..e8b9430d 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -31,6 +31,7 @@
>  #include "igt_device.h"
>  #include "igt_rand.h"
>  #include "igt_sysfs.h"
> +#include "i915/intel_memory_region.h"
>  
>  #define MAX_RESET_TIME	600
>  
> @@ -250,7 +251,8 @@ static void wait_to_die(int fence_out)
>  
>  static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  		       const struct intel_execution_engine2 *e,
> -		       uint32_t target, uint64_t target_size, uint32_t region)
> +		       uint32_t target, uint64_t target_size,
> +		       uint32_t region)
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
>  	struct drm_i915_gem_exec_object2 obj[4];
> @@ -384,15 +386,19 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  }
>  
>  static void capture(int fd, int dir, const intel_ctx_t *ctx,
> -		    const struct intel_execution_engine2 *e, uint32_t region)
> +		    const struct intel_execution_engine2 *e, struct gem_memory_region *mr)
>  {
>  	uint32_t handle;
>  	uint64_t ahnd, obj_size = 4096;
>  
> -	igt_assert_eq(__gem_create_with_cpu_access_in_memory_regions(fd, &handle, &obj_size, region), 0);
> +	igt_assert_eq(__gem_create_with_cpu_access_in_memory_regions(fd, &handle, &obj_size,
> +								INTEL_MEMORY_REGION_ID(mr->ci.memory_class,
> +											mr->ci.memory_instance)), 0);

Fix indentation.

>  	ahnd = get_reloc_ahnd(fd, ctx->id);
>  
> -	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, region);
> +	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size,
> +			INTEL_MEMORY_REGION_ID(mr->ci.memory_class,
> +						mr->ci.memory_instance));

Same.

>  
>  	gem_close(fd, handle);
>  	put_ahnd(ahnd);
> @@ -439,7 +445,8 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  
>  	obj[0].handle = gem_create(fd, 4096);
>  	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
> -	obj[0].flags = EXEC_OBJECT_WRITE | (ahnd ? EXEC_OBJECT_PINNED : 0);
> +	obj[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS | EXEC_OBJECT_WRITE |
> +						(ahnd ? EXEC_OBJECT_PINNED : 0);
>  
>  	for (i = 0; i < count; i++) {
>  		if (force_cpu_access)
> @@ -467,7 +474,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	obj[count + 1].relocs_ptr = (uintptr_t)reloc;
>  	obj[count + 1].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
>  	obj[count + 1].offset = get_offset(ahnd, obj[count + 1].handle, 4096, 0);
> -	obj[count + 1].flags = ahnd ? EXEC_OBJECT_PINNED : 0;
> +	obj[count + 1].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS | ahnd ? EXEC_OBJECT_PINNED : 0;

Missing ().

>  
>  	memset(reloc, 0, sizeof(reloc));
>  	reloc[0].target_handle = obj[count + 1].handle; /* recurse */
> @@ -624,7 +631,8 @@ static bool needs_recoverable_ctx(int fd)
>  		saved = configure_hangs(fd, e, ctx->id); \
>  	} while(0)
>  
> -static void many(int fd, int dir, uint64_t size, unsigned int flags)
> +static void many(int fd, int dir, uint64_t size, unsigned int flags,
> +		struct gem_memory_region *mr)

Indentation.

>  {
>  	const struct intel_execution_engine2 *e;
>  	const intel_ctx_t *ctx;
> @@ -649,14 +657,19 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
>  		  gtt, ram);
>  
> -	count = min(gtt, ram) / 4;
> -	igt_require(count > 1);
> +	if (mr->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
> +		count = min(gtt, ram) / 4;
> +	else
> +		count = gem_lmem_objects_create_max(fd, size);
> +	igt_require(count >= 1);
>  
>  	igt_require_memory(count, size, CHECK_RAM);
>  	ahnd = get_reloc_ahnd(fd, ctx->id);
>  
>  	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL,
> -			     REGION_SMEM, true);
> +			INTEL_MEMORY_REGION_ID(mr->ci.memory_class,
> +						mr->ci.memory_instance),
> +			true);

Same.

--
Zbigniew

>  
>  	blobs = check_error_state(dir, offsets, count, size, !!(flags & INCREMENTAL));
>  	igt_info("Captured %lu %"PRId64"-blobs out of a total of %lu\n",
> @@ -775,7 +788,6 @@ static void userptr(int fd, int dir)
>  	uint64_t ahnd;
>  	void *ptr;
>  	int obj_size = 4096;
> -	uint32_t system_region = INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0);
>  	struct gem_engine_properties saved_engine;
>  
>  	find_first_available_engine(fd, ctx, e, saved_engine);
> @@ -794,7 +806,7 @@ static void userptr(int fd, int dir)
>  	igt_require(__gem_userptr(fd, ptr, obj_size, 0, 0, &handle) == 0);
>  	ahnd = get_reloc_ahnd(fd, ctx->id);
>  
> -	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, system_region);
> +	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, REGION_SMEM);
>  
>  	gem_close(fd, handle);
>  	put_ahnd(ahnd);
> @@ -909,10 +921,6 @@ igt_main
>  	igt_hang_t hang;
>  	int fd = -1;
>  	int dir = -1;
> -	struct drm_i915_query_memory_regions *query_info;
> -	struct igt_collection *regions, *set;
> -	char *sub_name;
> -	uint32_t region;
>  
>  	igt_fixture {
>  		int gen;
> @@ -941,20 +949,12 @@ igt_main
>  		dir = igt_sysfs_open(fd);
>  		igt_require(igt_sysfs_set(dir, "error", "Begone!"));
>  		igt_require(safer_strlen(igt_sysfs_get(dir, "error")) > 0);
> -		query_info = gem_get_query_memory_regions(fd);
> -		igt_assert(query_info);
> -		set = get_memory_region_set(query_info,
> -				I915_SYSTEM_MEMORY,
> -				I915_DEVICE_MEMORY);
>  	}
>  
>  	test_each_engine("capture", fd, ctx, e) {
> -		for_each_combination(regions, 1, set) {
> -			sub_name = memregion_dynamic_subtest_name(regions);
> -			region = igt_collection_get_value(regions, 0);
> -			igt_dynamic_f("%s-%s", e->name, sub_name)
> -				capture(fd, dir, ctx, e, region);
> -			free(sub_name);
> +		for_each_memory_region(r, fd) {
> +			igt_dynamic_f("%s-%s", e->name, r->name)
> +				capture(fd, dir, ctx, e, r);
>  		}
>  	}
>  
> @@ -976,27 +976,29 @@ igt_main
>  
>  	igt_subtest_f("many-4K-zero") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 1<<12, 0);
> +		many(fd, dir, 1<<12, 0, REGION_SMEM);
>  	}
>  
> -	igt_subtest_f("many-4K-incremental") {
> -		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 1<<12, INCREMENTAL);
> +	igt_subtest_with_dynamic_f("many-4K-incremental") {
> +		for_each_memory_region(r, fd) {
> +			igt_dynamic_f("%s", r->name)
> +				many(fd, dir, 1<<12, INCREMENTAL, r);
> +		}
>  	}
>  
>  	igt_subtest_f("many-2M-zero") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 2<<20, 0);
> +		many(fd, dir, 2<<20, 0, REGION_SMEM);
>  	}
>  
>  	igt_subtest_f("many-2M-incremental") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 2<<20, INCREMENTAL);
> +		many(fd, dir, 2<<20, INCREMENTAL, REGION_SMEM);
>  	}
>  
>  	igt_subtest_f("many-256M-incremental") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 256<<20, INCREMENTAL);
> +		many(fd, dir, 256<<20, INCREMENTAL, REGION_SMEM);
>  	}
>  
>  	/* And check we can read from different types of objects */
> -- 
> 2.35.1
> 
