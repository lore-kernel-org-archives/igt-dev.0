Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201123201525.3991343-1-chris@chris-wilson.co.uk>
 <20201130103656.1049951-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <35bd53ab-7722-dfe4-8d00-a07ee5c0dd6f@linux.intel.com>
Date: Mon, 30 Nov 2020 16:20:18 +0000
MIME-Version: 1.0
In-Reply-To: <20201130103656.1049951-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_request_retire: Switch from
 random blitter loads to dummy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 30/11/2020 10:36, Chris Wilson wrote:
> Use the spinners to provide exactly the right amount of background
> busyness.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   lib/igt_dummyload.c             |  23 ++---
>   lib/igt_dummyload.h             |   1 +
>   tests/i915/gem_request_retire.c | 170 ++++----------------------------
>   3 files changed, 34 insertions(+), 160 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index d58f73108..891e4eaab 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -161,19 +161,20 @@ emit_recursive_batch(igt_spin_t *spin,
>   	if (opts->dependency) {
>   		igt_assert(!(opts->flags & IGT_SPIN_POLL_RUN));
>   
> -		r = &relocs[obj[BATCH].relocation_count++];
> -
> -		/* dummy write to dependency */
>   		obj[SCRATCH].handle = opts->dependency;
>   		obj[SCRATCH].offset = addr;
> -		obj[SCRATCH].flags = EXEC_OBJECT_WRITE;
> -
> -		r->presumed_offset = obj[SCRATCH].offset;
> -		r->target_handle = obj[SCRATCH].handle;
> -		r->offset = sizeof(uint32_t) * 1020;
> -		r->delta = 0;
> -		r->read_domains = I915_GEM_DOMAIN_RENDER;
> -		r->write_domain = I915_GEM_DOMAIN_RENDER;
> +		if (!(opts->flags & IGT_SPIN_SOFTDEP)) {
> +			obj[SCRATCH].flags = EXEC_OBJECT_WRITE;
> +
> +			/* dummy write to dependency */
> +			r = &relocs[obj[BATCH].relocation_count++];
> +			r->presumed_offset = obj[SCRATCH].offset;
> +			r->target_handle = obj[SCRATCH].handle;
> +			r->offset = sizeof(uint32_t) * 1020;
> +			r->delta = 0;
> +			r->read_domains = I915_GEM_DOMAIN_RENDER;
> +			r->write_domain = I915_GEM_DOMAIN_RENDER;
> +		}
>   
>   		execbuf->buffer_count++;
>   	} else if (opts->flags & IGT_SPIN_POLL_RUN) {
> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
> index 6d3e65ce2..b8baaa6b4 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -71,6 +71,7 @@ struct igt_spin_factory {
>   #define IGT_SPIN_NO_PREEMPTION (1 << 4)
>   #define IGT_SPIN_INVALID_CS    (1 << 5)
>   #define IGT_SPIN_USERPTR       (1 << 6)
> +#define IGT_SPIN_SOFTDEP       (1 << 7)
>   
>   igt_spin_t *
>   __igt_spin_factory(int fd, const struct igt_spin_factory *opts);
> diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
> index 31fb41987..c23ddfb7b 100644
> --- a/tests/i915/gem_request_retire.c
> +++ b/tests/i915/gem_request_retire.c
> @@ -52,130 +52,6 @@
>   IGT_TEST_DESCRIPTION("Collection of tests targeting request retirement code"
>   		     " paths.");
>   
> -#define WIDTH 4096
> -#define HEIGHT 4096
> -#define BO_SIZE (WIDTH * HEIGHT * sizeof(uint32_t))
> -
> -static uint32_t
> -blit(int fd, uint32_t dst, uint32_t src, uint32_t ctx_id)
> -{
> -	const unsigned int copies = 1000;
> -	uint32_t batch[12 * copies + 5];
> -	struct drm_i915_gem_relocation_entry reloc[2 * copies];
> -	struct drm_i915_gem_exec_object2 obj[3];
> -	struct drm_i915_gem_execbuffer2 exec;
> -	uint32_t handle;
> -	unsigned int i = 0, j, r = 0;
> -
> -	for (j = 0; j < copies; j++) {
> -		reloc[r].target_handle = dst;
> -		reloc[r].delta = 0;
> -		reloc[r].offset = (i + 4) * sizeof(uint32_t);
> -		reloc[r].presumed_offset = 0;
> -		reloc[r].read_domains = I915_GEM_DOMAIN_RENDER;
> -		reloc[r].write_domain = I915_GEM_DOMAIN_RENDER;
> -
> -		r++;
> -
> -		reloc[r].target_handle = src;
> -		reloc[r].delta = 0;
> -		reloc[r].offset = (i + 7) * sizeof(uint32_t);
> -		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -			reloc[r].offset += sizeof(uint32_t);
> -		reloc[r].presumed_offset = 0;
> -		reloc[r].read_domains = I915_GEM_DOMAIN_RENDER;
> -		reloc[r].write_domain = 0;
> -
> -		r++;
> -
> -		batch[i++] = XY_SRC_COPY_BLT_CMD |
> -			XY_SRC_COPY_BLT_WRITE_ALPHA |
> -			XY_SRC_COPY_BLT_WRITE_RGB;
> -		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -			batch[i - 1] |= 8;
> -		else
> -			batch[i - 1] |= 6;
> -
> -		batch[i++] = (3 << 24) | /* 32 bits */
> -			(0xcc << 16) | /* copy ROP */
> -			WIDTH*4;
> -		batch[i++] = 0; /* dst x1,y1 */
> -		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> -		batch[i++] = 0; /* dst reloc */
> -		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -			batch[i++] = 0;
> -		batch[i++] = 0; /* src x1,y1 */
> -		batch[i++] = WIDTH*4;
> -		batch[i++] = 0; /* src reloc */
> -		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -			batch[i++] = 0;
> -	}
> -
> -	batch[i++] = MI_BATCH_BUFFER_END;
> -
> -	while (i % 4)
> -		batch[i++] = MI_NOOP;
> -
> -	handle = gem_create(fd, sizeof(batch));
> -	gem_write(fd, handle, 0, batch, sizeof(batch));
> -
> -	memset(obj, 0, sizeof(obj));
> -	memset(&exec, 0, sizeof(exec));
> -
> -	obj[exec.buffer_count++].handle = dst;
> -	if (src != dst)
> -		obj[exec.buffer_count++].handle = src;
> -	obj[exec.buffer_count].handle = handle;
> -	obj[exec.buffer_count].relocation_count = 2 * copies;
> -	obj[exec.buffer_count].relocs_ptr = to_user_pointer(reloc);
> -	exec.buffer_count++;
> -	exec.buffers_ptr = to_user_pointer(obj);
> -
> -	exec.batch_len = i * sizeof(uint32_t);
> -	exec.flags = I915_EXEC_BLT;
> -	i915_execbuffer2_set_context_id(exec, ctx_id);
> -
> -	gem_execbuf(fd, &exec);
> -
> -	return handle;
> -}
> -
> -static uint32_t
> -noop(int fd, uint32_t src, uint32_t ctx_id)
> -{
> -	uint32_t batch[4];
> -	struct drm_i915_gem_exec_object2 obj[2];
> -	struct drm_i915_gem_execbuffer2 exec;
> -	uint32_t handle;
> -	unsigned int i = 0;
> -
> -	batch[i++] = MI_NOOP;
> -	batch[i++] = MI_BATCH_BUFFER_END;
> -	batch[i++] = MI_NOOP;
> -	batch[i++] = MI_NOOP;
> -
> -	handle = gem_create(fd, 4096);
> -	gem_write(fd, handle, 0, batch, sizeof(batch));
> -
> -	memset(obj, 0, sizeof(obj));
> -	memset(&exec, 0, sizeof(exec));
> -
> -	obj[exec.buffer_count++].handle = src;
> -	obj[exec.buffer_count].handle = handle;
> -	obj[exec.buffer_count].relocation_count = 0;
> -	obj[exec.buffer_count].relocs_ptr = to_user_pointer(0);
> -	exec.buffer_count++;
> -	exec.buffers_ptr = to_user_pointer(obj);
> -
> -	exec.batch_len = i * sizeof(uint32_t);
> -	exec.flags = I915_EXEC_RENDER;
> -	i915_execbuffer2_set_context_id(exec, ctx_id);
> -
> -	gem_execbuf(fd, &exec);
> -
> -	return handle;
> -}
> -
>   /*
>    * A single bo is operated from batchbuffers submitted from two contexts and on
>    * different rings.
> @@ -185,37 +61,33 @@ noop(int fd, uint32_t src, uint32_t ctx_id)
>   static void
>   test_retire_vma_not_inactive(int fd)
>   {
> -	uint32_t ctx_id;
> -	uint32_t src, dst;
> -	uint32_t blit_bb, noop_bb;
> -
> -	igt_require(HAS_BLT_RING(intel_get_drm_devid(fd)));
> +	struct intel_execution_engine2 *e;
>   
> -	ctx_id = gem_context_create(fd);
> +	igt_spin_t *bg = NULL;
>   
> -	/* Create some bos batch buffers will operate on. */
> -	src = gem_create(fd, BO_SIZE);
> -	dst = gem_create(fd, BO_SIZE);
> +	__for_each_physical_engine(fd, e) {
> +		igt_spin_t *spin;
> +		uint32_t ctx;
>   
> -	/* Submit a long running batch. */
> -	blit_bb = blit(fd, dst, src, 0);
> +		if (!bg) {
> +			bg = igt_spin_new(fd, .engine = e->flags);
> +			continue;
> +		}
>   
> -	/* Submit a quick batch referencing the same object. */
> -	noop_bb = noop(fd, src, ctx_id);
> +		ctx = gem_context_clone_with_engines(fd, 0);
> +		spin = igt_spin_new(fd, ctx,
> +				    .engine = e->flags,
> +				    .dependency = bg->handle,
> +				    .flags = IGT_SPIN_SOFTDEP);
> +		gem_context_destroy(fd, ctx);
> +		igt_spin_end(spin);
>   
> -	/* Wait for the quick batch to complete. */
> -	gem_sync(fd, noop_bb);
> -	gem_close(fd, noop_bb);
> -
> -	/* Now destroy the context in which the quick batch was submitted. */
> -	gem_context_destroy(fd, ctx_id);
> -
> -	/* Wait for the slow batch to finish and clean up. */
> -	gem_sync(fd, blit_bb);
> -	gem_close(fd, blit_bb);
> +		gem_sync(fd, spin->handle);
> +		igt_spin_free(fd, spin);
> +	}
>   
> -	gem_close(fd, src);
> -	gem_close(fd, dst);
> +	igt_drop_caches_set(fd, DROP_RETIRE);
> +	igt_spin_free(fd, bg);
>   }
>   
>   int fd;
> 

I wonder how relevant this test is today but anyway doesn't harm. It is 
not exactly like-for-like replacement but I *think* the key was context 
close before involved object is idled so I think is is fine.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
