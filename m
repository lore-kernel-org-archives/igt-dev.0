Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B156E0CB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 07:28:53 +0000 (UTC)
Date: Wed, 11 Aug 2021 09:28:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210811072837.GB6002@zkempczy-mobl2>
References: <20210810191425.8391-1-andrzej.turko@linux.intel.com>
 <20210810191425.8391-3-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210810191425.8391-3-andrzej.turko@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/gem_softpin: Exercise
 eviction with softpinning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 09:14:25PM +0200, Andrzej Turko wrote:
> Exercise eviction of many gem objects. The added tests are analogous
> to gem_exec_gttfill, but they use softpin and do not require relocation
> support.
> 
> Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/gem_softpin.c | 212 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 211 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 5e47a0ce3..d085dea34 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -29,6 +29,7 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +#include "igt_rand.h"
>  #include "intel_allocator.h"
>  
>  #define EXEC_OBJECT_PINNED	(1<<4)
> @@ -878,9 +879,208 @@ static void test_allocator_fork(int fd)
>  	intel_allocator_multiprocess_stop();
>  }
>  
> +#define BATCH_SIZE (4096<<10)
> +/* We don't have alignment detection yet, so assume the worst-case scenario. */
> +#define BATCH_ALIGNMENT (1 << 21)
> +
> +struct batch {
> +	uint32_t handle;
> +	void *ptr;
> +};
> +
> +static void xchg_batch(void *array, unsigned int i, unsigned int j)
> +{
> +	struct batch *batches = array;
> +	struct batch tmp;
> +
> +	tmp = batches[i];
> +	batches[i] = batches[j];
> +	batches[j] = tmp;
> +}
> +
> +static void submit(int fd, int gen,
> +		   struct drm_i915_gem_execbuffer2 *eb,
> +		   struct batch *batches, unsigned int count,
> +		   uint64_t ahnd)
> +{
> +	struct drm_i915_gem_exec_object2 obj;
> +	uint32_t batch[16];
> +	uint64_t address;
> +	unsigned n;
> +
> +	memset(&obj, 0, sizeof(obj));
> +	obj.flags = EXEC_OBJECT_PINNED;
> +
> +	for (unsigned i = 0; i < count; i++) {
> +		obj.handle = batches[i].handle;
> +		obj.offset = intel_allocator_alloc(ahnd, obj.handle,
> +						   BATCH_SIZE,
> +						   BATCH_ALIGNMENT);
> +		address = obj.offset + BATCH_SIZE - eb->batch_start_offset - 8;
> +		n = 0;
> +		batch[n] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> +		if (gen >= 8) {
> +			batch[n] |= 1 << 21;
> +			batch[n]++;
> +			batch[++n] = address;
> +			batch[++n] = address >> 32;
> +		} else if (gen >= 4) {
> +			batch[++n] = 0;
> +			batch[++n] = address;
> +		} else {
> +			batch[n]--;
> +			batch[++n] = address;
> +		}
> +		batch[++n] = obj.offset; /* lower_32_bits(value) */
> +		batch[++n] = obj.offset >> 32; /* upper_32_bits(value) / nop */
> +		batch[++n] = MI_BATCH_BUFFER_END;
> +		eb->buffers_ptr = to_user_pointer(&obj);
> +
> +		memcpy(batches[i].ptr + eb->batch_start_offset,
> +		       batch, sizeof(batch));
> +
> +		gem_execbuf(fd, eb);
> +	}
> +	/* As we have been lying about the write_domain, we need to do a sync */
> +	gem_sync(fd, obj.handle);
> +}
> +
> +static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
> +				 unsigned ring, int timeout)
> +{
> +	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	unsigned engines[I915_EXEC_RING_MASK + 1];
> +	volatile uint64_t *shared;
> +	struct timespec tv = {};
> +	struct batch *batches;
> +	unsigned nengine;
> +	unsigned count;
> +	uint64_t size, ahnd;
> +
> +	shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	igt_assert(shared != MAP_FAILED);
> +
> +	nengine = 0;
> +	if (ring == ALL_ENGINES) {
> +		struct intel_execution_engine2 *e;
> +
> +		for_each_ctx_engine(fd, ctx, e) {
> +			if (!gem_class_can_store_dword(fd, e->class))
> +				continue;
> +
> +			engines[nengine++] = e->flags;
> +		}
> +	} else {
> +		engines[nengine++] = ring;
> +	}
> +	igt_require(nengine);
> +	igt_assert(nengine * 64 <= BATCH_SIZE);
> +
> +	size = gem_aperture_size(fd);
> +	if (!gem_uses_full_ppgtt(fd))
> +		size /= 2;
> +	if (size > 1ull<<32) /* Limit to 4GiB as we do not use allow-48b */
> +		size = 1ull << 32;
> +	igt_require(size < (1ull<<32) * BATCH_SIZE);
> +
> +	count = size / BATCH_SIZE + 1;
> +	igt_debug("Using %'d batches to fill %'llu aperture on %d engines\n",
> +		  count, (long long)size, nengine);
> +
> +	intel_allocator_multiprocess_start();
> +	ahnd = intel_allocator_open_full(fd, 0, 0, size / 16,
> +					 INTEL_ALLOCATOR_RELOC,
> +					 ALLOC_STRATEGY_NONE);

Ok, narrowing vm end will increase evictions.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
> +	intel_require_memory(count, BATCH_SIZE, CHECK_RAM);
> +	intel_detect_and_clear_missed_interrupts(fd);
> +
> +	igt_nsec_elapsed(&tv);
> +
> +	memset(&execbuf, 0, sizeof(execbuf));
> +	execbuf.buffer_count = 1;
> +	if (gen < 6)
> +		execbuf.flags |= I915_EXEC_SECURE;
> +
> +	batches = calloc(count, sizeof(*batches));
> +	igt_assert(batches);
> +	for (unsigned i = 0; i < count; i++) {
> +		batches[i].handle = gem_create(fd, BATCH_SIZE);
> +		batches[i].ptr =
> +			gem_mmap__device_coherent(fd, batches[i].handle,
> +						  0, BATCH_SIZE, PROT_WRITE);
> +	}
> +
> +	/* Flush all memory before we start the timer */
> +	submit(fd, gen, &execbuf, batches, count, ahnd);
> +
> +	igt_info("Setup %u batches in %.2fms\n",
> +		 count, 1e-6 * igt_nsec_elapsed(&tv));
> +
> +	igt_fork(child, nengine) {
> +		uint64_t dst, src, dst_offset, src_offset;
> +		uint64_t cycles = 0;
> +
> +		hars_petruska_f54_1_random_perturb(child);
> +		igt_permute_array(batches, count, xchg_batch);
> +		execbuf.batch_start_offset = child * 64;
> +		execbuf.flags |= engines[child];
> +
> +		dst_offset = BATCH_SIZE - child*64 - 8;
> +		if (gen >= 8)
> +			src_offset = child*64 + 3*sizeof(uint32_t);
> +		else if (gen >= 4)
> +			src_offset = child*64 + 4*sizeof(uint32_t);
> +		else
> +			src_offset = child*64 + 2*sizeof(uint32_t);
> +
> +		/* We need to open the allocator again in the new process */
> +		ahnd = intel_allocator_open_full(fd, 0, 0, size / 16,
> +						 INTEL_ALLOCATOR_RELOC,
> +						 ALLOC_STRATEGY_NONE);
> +
> +		igt_until_timeout(timeout) {
> +			submit(fd, gen, &execbuf, batches, count, ahnd);
> +			for (unsigned i = 0; i < count; i++) {
> +				dst = *(uint64_t *)(batches[i].ptr + dst_offset);
> +				src = *(uint64_t *)(batches[i].ptr + src_offset);
> +				igt_assert_eq_u64(dst, src);
> +			}
> +			cycles++;
> +		}
> +		shared[child] = cycles;
> +		igt_info("engine[%d]: %llu cycles\n", child, (long long)cycles);
> +		intel_allocator_close(ahnd);
> +	}
> +	igt_waitchildren();
> +
> +	intel_allocator_close(ahnd);
> +	intel_allocator_multiprocess_stop();
> +
> +	for (unsigned i = 0; i < count; i++) {
> +		munmap(batches[i].ptr, BATCH_SIZE);
> +		gem_close(fd, batches[i].handle);
> +	}
> +	free(batches);
> +
> +	shared[nengine] = 0;
> +	for (unsigned i = 0; i < nengine; i++)
> +		shared[nengine] += shared[i];
> +	igt_info("Total: %llu cycles\n", (long long)shared[nengine]);
> +
> +	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> +}
> +
> +#define test_each_engine(T, i915, ctx, e) \
> +	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
> +		igt_dynamic_f("%s", e->name)
> +
>  igt_main
>  {
> +	const struct intel_execution_engine2 *e;
>  	int fd = -1;
> +	const intel_ctx_t *ctx;
>  
>  	igt_fixture {
>  		fd = drm_open_driver_master(DRIVER_INTEL);
> @@ -888,6 +1088,8 @@ igt_main
>  		gem_require_blitter(fd);
>  		igt_require(gem_has_softpin(fd));
>  		igt_require(gem_can_store_dword(fd, 0));
> +
> +		ctx = intel_ctx_create_all_physical(fd);
>  	}
>  
>  	igt_subtest("invalid")
> @@ -923,6 +1125,12 @@ igt_main
>  
>  		igt_subtest("allocator-fork")
>  			test_allocator_fork(fd);
> +
> +		test_each_engine("allocator-evict", fd, ctx, e)
> +			test_allocator_evict(fd, ctx, e->flags, 20);
> +
> +		igt_subtest("allocator-evict-all-engines")
> +			test_allocator_evict(fd, ctx, ALL_ENGINES, 20);
>  	}
>  
>  	igt_subtest("softpin")
> @@ -950,6 +1158,8 @@ igt_main
>  	igt_subtest("evict-hang")
>  		test_evict_hang(fd);
>  
> -	igt_fixture
> +	igt_fixture {
> +		intel_ctx_destroy(fd, ctx);
>  		close(fd);
> +	}
>  }
> -- 
> 2.25.1
> 
