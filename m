Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F128310FB56
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 04:51:43 +0000 (UTC)
Date: Fri, 29 Apr 2022 06:51:39 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <Ymtu2wXmRazH6EE7@zkempczy-mobl2>
References: <20220427184204.65427-1-zbigniew.kempczynski@intel.com>
 <Ymq71jm8gxP6U3jl@kamilkon-DESK1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ymq71jm8gxP6U3jl@kamilkon-DESK1>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_softpin: Exercise single
 offset eviction on all engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 06:07:50PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2022-04-27 at 20:42:04 +0200, Zbigniew Kempczyński wrote:
> > Verify that eviction works when all engines try to use same offset for
> > different handles. It replaces allocator-evict-all-engines test because
> > it is simpler.
> > 
> > v2: addressing review comments (Kamil)
> > v3: simplifying subtest (Chris)
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  tests/i915/gem_softpin.c | 76 ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 74 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> > index 448b4c4b9e..7dae2a6c44 100644
> > --- a/tests/i915/gem_softpin.c
> > +++ b/tests/i915/gem_softpin.c
> > @@ -1073,6 +1073,77 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
> >  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> >  }
> >  
> > +#define MINIMAL_OFFSET 0x200000
> > +static void single_offset_submit(int fd, struct drm_i915_gem_execbuffer2 *eb,
> > +				 struct batch *batches, unsigned int count)
> > +{
> > +	struct drm_i915_gem_exec_object2 obj = {
> > +		.offset = max_t(uint64_t, gem_detect_safe_start_offset(fd), MINIMAL_OFFSET),
> 
> imho this should be a parameter to this function, so it will be
> calculated once but you can leave it here, your choice.

Safe start offset is cached during first run so following calls returns
it from the cache, without further probing.

> 
> > +		.flags = EXEC_OBJECT_PINNED,
> > +	};
> > +
> > +	eb->buffers_ptr = to_user_pointer(&obj);
> > +
> > +	for (unsigned int i = 0; i < count; i++) {
> > +		obj.handle = batches[i].handle;
> > +		gem_execbuf(fd, eb);
> > +	}
> > +}
> > +
> > +static void evict_single_offset(int fd, const intel_ctx_t *ctx, int timeout)
> > +{
> > +	struct drm_i915_gem_execbuffer2 execbuf;
> > +	struct intel_execution_engine2 *e;
> > +	unsigned int engines[I915_EXEC_RING_MASK + 1];
> > +	struct batch *batches;
> > +	unsigned int nengine;
> > +	unsigned int count;
> > +	uint64_t size, batch_size = BATCH_SIZE;
> > +
> > +	nengine = 0;
> > +	for_each_ctx_engine(fd, ctx, e) {
> > +		engines[nengine++] = e->flags;
> > +	}
> > +	igt_require(nengine);
> > +
> > +	size = gem_aperture_size(fd);
> > +	if (size > 1ull<<32) /* Limit to 4GiB as we do not use allow-48b */
> > +		size = 1ull << 32;
> > +	igt_require(size < (1ull<<32) * BATCH_SIZE);
> > +
> > +	count = size / BATCH_SIZE + 1;
> > +	igt_debug("Using %'d batches to fill %'llu aperture on %d engines\n",
> > +		  count, (long long)size, nengine);
> 
> Please add here print for timeout used and also change printing
> size to MB.

I understand you want to see this with --debug option? Ok, will add this
before merging.

> 
> > +
> > +	intel_require_memory(count, BATCH_SIZE, CHECK_RAM);
> > +	intel_detect_and_clear_missed_interrupts(fd);
> > +
> > +	memset(&execbuf, 0, sizeof(execbuf));
> > +	execbuf.buffer_count = 1;
> > +	execbuf.rsvd1 = ctx->id;
> > +
> > +	batches = calloc(count, sizeof(*batches));
> > +	igt_assert(batches);
> > +	for (unsigned int i = 0; i < count; i++)
> > +		batches[i].handle = batch_create(fd, &batch_size);
> > +
> > +	/* Flush all memory before we start the timer */
> > +	single_offset_submit(fd, &execbuf, batches, count);
> > +
> > +	igt_fork(child, nengine) {
> > +		execbuf.flags |= engines[child];
> > +		igt_until_timeout(timeout)
> > +			single_offset_submit(fd, &execbuf, batches, count);
> > +	}
> > +	igt_waitchildren();
> > +
> > +	for (unsigned int i = 0; i < count; i++)
> > +		gem_close(fd, batches[i].handle);
> > +	free(batches);
> > +
> > +	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> > +}
> > +
> >  static void make_batch(int i915, uint32_t handle, uint64_t size)
> >  {
> >  	uint32_t *bb = gem_mmap__device_coherent(i915, handle, 0, size, PROT_WRITE);
> > @@ -1213,8 +1284,9 @@ igt_main
> >  		test_each_engine("allocator-evict", fd, ctx, e)
> >  			test_allocator_evict(fd, ctx, e->flags, 20);
> >  
> > -		igt_subtest("allocator-evict-all-engines")
> > -			test_allocator_evict(fd, ctx, ALL_ENGINES, 20);
> > +		igt_describe("Use same offset for all engines and for different handles");
> > +		igt_subtest("evict-single-offset")
> > +			evict_single_offset(fd, ctx, 20);
> 
> You are not using allocator here, so maybe move this down after
> evict-hog sibtest ?

Test need to be placed within 'gem_uses_full_ppgtt' group. We may argue
for the location, but I cannot move it outside it.

With above changes I'm going to take your r-b and merge.
--
Zbigniew

> 
> With that small changes you can add my r-b tag.
> 
> Regards,
> Kamil
> >  	}
> >  
> >  	igt_describe("Check start offset and alignment detection");
> > -- 
> > 2.32.0
> > 
