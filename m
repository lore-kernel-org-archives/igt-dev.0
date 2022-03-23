Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D81F89F5B
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 13:39:31 +0000 (UTC)
Date: Wed, 23 Mar 2022 14:39:26 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <YjsjDjdQtaNnuGOU@zkempczy-mobl2>
References: <20220322045429.29933-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220322045429.29933-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: Adding
 Local memory support
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

On Tue, Mar 22, 2022 at 10:24:29AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Adding local memory support to many-4K-zero subtest
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_exec_capture.c | 48 +++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 60f8df04..f00faf85 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -415,7 +415,7 @@ static struct offset *
>  __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	   const struct intel_execution_engine2 *e,
>  	   unsigned int size, int count,
> -	   unsigned int flags, int *_fence_out)
> +	   unsigned int flags, int *_fence_out, uint32_t region)
>  #define INCREMENTAL 0x1
>  #define ASYNC 0x2
>  {
> @@ -436,7 +436,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	obj = calloc(count + 2, sizeof(*obj));
>  	igt_assert(obj);
>  
> -	obj[0].handle = gem_create(fd, 4096);
> +	obj[0].handle = gem_create_in_memory_regions(fd, 4096, region);
>  	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
>  	obj[0].flags = EXEC_OBJECT_WRITE | (ahnd ? EXEC_OBJECT_PINNED : 0);

Add EXEC_OBJECT_SUPPORTS_48B_ADDRESS for each of obj[]. On dg2 where safe alignment
is much bigger we can exceed 2^32 vm space.

>  
> @@ -459,7 +459,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  		}
>  	}
>  
> -	obj[count + 1].handle = gem_create(fd, 4096);
> +	obj[count + 1].handle = gem_create_in_memory_regions(fd, 4096, region);
>  	obj[count + 1].relocs_ptr = (uintptr_t)reloc;
>  	obj[count + 1].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
>  	obj[count + 1].offset = get_offset(ahnd, obj[count + 1].handle, 4096, 0);
> @@ -585,14 +585,15 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  		saved = configure_hangs(fd, e, ctx->id); \
>  	} while(0)
>  
> -static void many(int fd, int dir, uint64_t size, unsigned int flags)
> +static void many(int fd, int dir, uint64_t size, unsigned int flags, uint32_t region)
>  {
>  	const struct intel_execution_engine2 *e;
>  	const intel_ctx_t *ctx;
> -	uint64_t ram, gtt, ahnd;
> +	uint64_t ram, gtt, ahnd, lmem_size;
>  	unsigned long count, blobs;
>  	struct offset *offsets;
>  	struct gem_engine_properties saved_engine;
> +	struct drm_i915_query_memory_regions *info;
>  
>  	find_first_available_engine(fd, ctx, e, saved_engine);
>  
> @@ -601,13 +602,20 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
>  		  gtt, ram);
>  
> -	count = min(gtt, ram) / 4;
> +	info = gem_get_query_memory_regions(fd);
> +	lmem_size = gpu_meminfo_region_total_size(info, I915_MEMORY_CLASS_DEVICE);
> +	
> +	if (region == 0)
> +		count = min(gtt, ram) / 4;
> +	else
> +		count = min(gtt, lmem_size) / 4;

This one is not correct, count is too big (check how you calculate gtt and ram).

> +
>  	igt_require(count > 1);
>  
>  	intel_require_memory(count, size, CHECK_RAM);
>  	ahnd = get_reloc_ahnd(fd, ctx->id);
>  
> -	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL);
> +	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL, region);
>  
>  	blobs = check_error_state(dir, offsets, count, size, !!(flags & INCREMENTAL));
>  	igt_info("Captured %lu %"PRId64"-blobs out of a total of %lu\n",
> @@ -620,7 +628,7 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  }
>  
>  static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
> -		    const struct intel_execution_engine2 *e)
> +		    const struct intel_execution_engine2 *e, uint32_t region)
>  {
>  	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_exec_object2 obj = {
> @@ -677,7 +685,7 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
>  		/* Reopen the allocator in the new process. */
>  		ahnd = get_reloc_ahnd(fd, ctx2->id);
>  
> -		free(__captureN(fd, dir, ahnd, ctx2, e, size, count, ASYNC, &fence_out));
> +		free(__captureN(fd, dir, ahnd, ctx2, e, size, count, ASYNC, &fence_out, region));
>  		put_ahnd(ahnd);
>  
>  		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
> @@ -767,6 +775,7 @@ igt_main
>  	struct igt_collection *regions, *set;
>  	char *sub_name;
>  	uint32_t region;
> +	uint32_t system_region = INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0);
>  
>  	igt_fixture {
>  		int gen;
> @@ -803,29 +812,36 @@ igt_main
>  		}
>  	}
>  
> -	igt_subtest_f("many-4K-zero") {
> +
> +	igt_subtest_with_dynamic("many-4K-zero") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 1<<12, 0);
> +		for_each_combination(regions, 1, set) {
> +			sub_name = memregion_dynamic_subtest_name(regions);
> +			region = igt_collection_get_value(regions, 0);
> +			igt_dynamic_f("%s", sub_name)
> +				many(fd, dir, 1<<12, 0, region);
> +			free(sub_name);

Chris proposed very nice macro: for_each_memory_region() which shrinks above
to single line. Please use it here.

--
Zbigniew

> +		}
>  	}
>  
>  	igt_subtest_f("many-4K-incremental") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 1<<12, INCREMENTAL);
> +		many(fd, dir, 1<<12, INCREMENTAL, system_region);
>  	}
>  
>  	igt_subtest_f("many-2M-zero") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 2<<20, 0);
> +		many(fd, dir, 2<<20, 0, system_region);
>  	}
>  
>  	igt_subtest_f("many-2M-incremental") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 2<<20, INCREMENTAL);
> +		many(fd, dir, 2<<20, INCREMENTAL, system_region);
>  	}
>  
>  	igt_subtest_f("many-256M-incremental") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 256<<20, INCREMENTAL);
> +		many(fd, dir, 256<<20, INCREMENTAL, system_region);
>  	}
>  
>  	/* And check we can read from different types of objects */
> @@ -837,7 +853,7 @@ igt_main
>  
>  	test_each_engine("pi", fd, ctx, e)
>  		igt_dynamic_f("%s", (e)->name)
> -			prioinv(fd, dir, ctx, e);
> +			prioinv(fd, dir, ctx, e, system_region);
>  
>  	igt_fixture {
>  		close(dir);
> -- 
> 2.35.1
> 
