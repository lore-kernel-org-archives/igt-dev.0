Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D8510E20D
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jan 2022 08:09:23 +0000 (UTC)
Date: Mon, 3 Jan 2022 09:09:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YdKvL6vTA6DSKe6O@zkempczy-mobl2>
References: <20211231055526.7586-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211231055526.7586-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: Adding
 Local memory support.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 31, 2021 at 11:25:26AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Adding local memory support to many-4K-zero subtest.
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_exec_capture.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 9beb36fc..19cfa53d 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -406,7 +406,7 @@ static struct offset *
>  __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	   const struct intel_execution_engine2 *e,
>  	   unsigned int size, int count,
> -	   unsigned int flags, int *_fence_out)
> +	   unsigned int flags, int *_fence_out, uint32_t region)
>  #define INCREMENTAL 0x1
>  #define ASYNC 0x2
>  {
> @@ -426,7 +426,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	obj = calloc(count + 2, sizeof(*obj));
>  	igt_assert(obj);
>  
> -	obj[0].handle = gem_create(fd, 4096);
> +	obj[0].handle = gem_create_in_memory_regions(fd, 4096, region);
>  	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
>  	obj[0].flags = EXEC_OBJECT_WRITE | (ahnd ? EXEC_OBJECT_PINNED : 0);
>  
> @@ -449,7 +449,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  		}
>  	}
>  
> -	obj[count + 1].handle = gem_create(fd, 4096);
> +	obj[count + 1].handle = gem_create_in_memory_regions(fd, 4096, region);
>  	obj[count + 1].relocs_ptr = (uintptr_t)reloc;
>  	obj[count + 1].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
>  	obj[count + 1].offset = get_offset(ahnd, obj[count + 1].handle, 4096, 0);
> @@ -573,7 +573,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  		configure_hangs(fd, e, ctx->id); \
>  	} while(0)
>  
> -static void many(int fd, int dir, uint64_t size, unsigned int flags)
> +static void many(int fd, int dir, uint64_t size, unsigned int flags, uint32_t region)
>  {
>  	const struct intel_execution_engine2 *e;
>  	const intel_ctx_t *ctx;
> @@ -594,7 +594,7 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  	intel_require_memory(count, size, CHECK_RAM);
>  	ahnd = get_reloc_ahnd(fd, ctx->id);
>  
> -	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL);
> +	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL, region);
>  
>  	blobs = check_error_state(dir, offsets, count, size, !!(flags & INCREMENTAL));
>  	igt_info("Captured %lu %"PRId64"-blobs out of a total of %lu\n",
> @@ -605,7 +605,7 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  }
>  
>  static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
> -		    const struct intel_execution_engine2 *e)
> +		    const struct intel_execution_engine2 *e, uint32_t system_region)

Change system_region -> region, caller is passing this so suggesting name
here is not good idea and can be confusing.

>  {
>  	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_exec_object2 obj = {
> @@ -659,7 +659,7 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
>  		/* Reopen the allocator in the new process. */
>  		ahnd = get_reloc_ahnd(fd, ctx2->id);
>  
> -		free(__captureN(fd, dir, ahnd, ctx2, e, size, count, ASYNC, &fence_out));
> +		free(__captureN(fd, dir, ahnd, ctx2, e, size, count, ASYNC, &fence_out, system_region));

Avoid long lines, here I would break before &fence_out.

With above fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		put_ahnd(ahnd);
>  
>  		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
> @@ -744,6 +744,7 @@ igt_main
>  	struct igt_collection *regions, *set;
>  	char *sub_name;
>  	uint32_t region;
> +	uint32_t system_region = INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0);
>  
>  	igt_fixture {
>  		int gen;
> @@ -780,29 +781,35 @@ igt_main
>  		}
>  	}
>  
> -	igt_subtest_f("many-4K-zero") {
> +	igt_subtest_with_dynamic("many-4K-zero") {
>  		igt_require(gem_can_store_dword(fd, 0));
> -		many(fd, dir, 1<<12, 0);
> +		for_each_combination(regions, 1, set) {
> +			sub_name = memregion_dynamic_subtest_name(regions);
> +			region = igt_collection_get_value(regions, 0);
> +			igt_dynamic_f("%s", sub_name)
> +				many(fd, dir, 1<<12, 0, region);
> +			free(sub_name);
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
> @@ -814,7 +821,7 @@ igt_main
>  
>  	test_each_engine("pi", fd, ctx, e)
>  		igt_dynamic_f("%s", (e)->name)
> -			prioinv(fd, dir, ctx, e);
> +			prioinv(fd, dir, ctx, e, system_region);
>  
>  	igt_fixture {
>  		close(dir);
> -- 
> 2.32.0
> 
