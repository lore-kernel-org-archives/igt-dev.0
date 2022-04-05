Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D857210EE70
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 19:11:38 +0000 (UTC)
Date: Tue, 5 Apr 2022 21:11:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <YkyUZuPKMGew/7fC@zkempczy-mobl2>
References: <20220403090708.24030-1-zbigniew.kempczynski@intel.com>
 <YkxlLFmlg+xf/p2z@kamilkon-DESK1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkxlLFmlg+xf/p2z@kamilkon-DESK1>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_gttfill: Reenable
 test for discrete
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

On Tue, Apr 05, 2022 at 05:50:04PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> Dnia 2022-04-03 at 11:07:08 +0200, Zbigniew Kempczyński napisał(a):
> > Test was turned off unnecessarily for discrete so add softpinning to
> > it and enable it again.
> > 
> > v2: ensure eviction takes place (Chris)
> > 
> > Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4086
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/i915/gem_exec_gttfill.c | 29 +++++++++++++++++++++++------
> >  1 file changed, 23 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> > index f16428714d..a113cdcb14 100644
> > --- a/tests/i915/gem_exec_gttfill.c
> > +++ b/tests/i915/gem_exec_gttfill.c
> > @@ -33,6 +33,7 @@ IGT_TEST_DESCRIPTION("Fill the GTT with batches.");
> >  struct batch {
> >  	uint32_t handle;
> >  	void *ptr;
> > +	uint64_t offset;
> >  };
> >  
> >  static void xchg_batch(void *array, unsigned int i, unsigned int j)
> > @@ -45,7 +46,7 @@ static void xchg_batch(void *array, unsigned int i, unsigned int j)
> >  	batches[j] = tmp;
> >  }
> >  
> > -static void submit(int fd, int gen,
> > +static void submit(int fd, uint64_t ahnd, int gen,
> >  		   struct drm_i915_gem_execbuffer2 *eb,
> >  		   struct drm_i915_gem_relocation_entry *reloc,
> >  		   struct batch *batches, unsigned int count)
> > @@ -56,7 +57,7 @@ static void submit(int fd, int gen,
> >  
> >  	memset(&obj, 0, sizeof(obj));
> >  	obj.relocs_ptr = to_user_pointer(reloc);
> > -	obj.relocation_count = 2;
> > +	obj.relocation_count = !ahnd ? 2 : 0;
> >  
> >  	memset(reloc, 0, 2*sizeof(*reloc));
> >  	reloc[0].offset = eb->batch_start_offset;
> > @@ -93,7 +94,17 @@ static void submit(int fd, int gen,
> >  		reloc[0].target_handle = obj.handle;
> >  		reloc[1].target_handle = obj.handle;
> >  
> > -		obj.offset = 0;
> > +		if (ahnd) {
> > +			uint32_t *delta_ptr = batches[i].ptr + reloc[0].delta;
> > +
> > +			*delta_ptr = batches[i].offset;
> > +			batch[1] = batches[i].offset + reloc[0].delta;
> > +			obj.flags = EXEC_OBJECT_PINNED;
> > +			obj.offset = batches[i].offset;
> > +			batch[3] = batches[i].offset;
> > +		} else {
> > +			obj.offset = 0;
> > +		}
> >  		reloc[0].presumed_offset = obj.offset;
> >  		reloc[1].presumed_offset = obj.offset;
> >  
> > @@ -118,6 +129,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
> >  	unsigned nengine;
> >  	unsigned count;
> >  	uint64_t size;
> > +	uint64_t ahnd;
> >  
> >  	shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> >  	igt_assert(shared != MAP_FAILED);
> > @@ -157,6 +169,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > +	ahnd = get_reloc_ahnd(fd, ctx->id);
> 
> Can we use here simple_l2h ?
> Btw I don't see any put_ahnd below.

No. Simple won't allow us to overlap offsets and evict.

> 
> >  	batches = calloc(count, sizeof(*batches));
> >  	igt_assert(batches);
> >  	for (unsigned i = 0; i < count; i++) {
> > @@ -164,10 +177,12 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
> >  		batches[i].ptr =
> >  			gem_mmap__device_coherent(fd, batches[i].handle,
> >  						  0, BATCH_SIZE, PROT_WRITE);
> > +		batches[i].offset = get_offset(ahnd, batches[i].handle, BATCH_SIZE, 0);
> > +		batches[i].offset %= (1ull << 32) - BATCH_SIZE;
> 
> This looks strange, we lost two allocated offsets here, see some
> dump from end of loop:
> i=1022 offset=ffa00000  -- after -- offset=ffa00000
> i=1023 offset=ffe00000  -- after -- offset=200000
> i=1024 offset=100200000  -- after -- offset=600000
> 
> Those last two offsets will be the same as for i=0,1.

This is intentional, we want to unbind/bind in execbuf.

--
Zbigniew

> 
> >  	}
> >  
> >  	/* Flush all memory before we start the timer */
> > -	submit(fd, gen, &execbuf, reloc, batches, count);
> > +	submit(fd, ahnd, gen, &execbuf, reloc, batches, count);
> >  
> >  	igt_info("Setup %u batches in %.2fms\n",
> >  		 count, 1e-6 * igt_nsec_elapsed(&tv));
> > @@ -179,7 +194,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
> >  		execbuf.batch_start_offset = child*64;
> >  		execbuf.flags |= engines[child];
> >  		igt_until_timeout(timeout) {
> > -			submit(fd, gen, &execbuf, reloc, batches, count);
> > +			submit(fd, ahnd, gen, &execbuf, reloc, batches, count);
> >  			for (unsigned i = 0; i < count; i++) {
> >  				uint64_t offset, delta;
> >  
> > @@ -216,9 +231,9 @@ igt_main
> >  	igt_fixture {
> >  		i915 = drm_open_driver(DRIVER_INTEL);
> >  		igt_require_gem(i915);
> > -		igt_require(gem_has_relocations(i915));
> >  		ctx = intel_ctx_create_all_physical(i915);
> >  		igt_fork_hang_detector(i915);
> > +		intel_allocator_multiprocess_start();
> >  	}
> >  
> >  	igt_subtest("basic") /* just enough to run a single pass */
> > @@ -238,8 +253,10 @@ igt_main
> >  		fillgtt(i915, ctx, ALL_ENGINES, 20);
> >  
> >  	igt_fixture {
> > +		intel_allocator_multiprocess_stop();
> >  		igt_stop_hang_detector();
> >  		intel_ctx_destroy(i915, ctx);
> >  		close(i915);
> > +
> 
> Remove empty line.
> With that fixed you can add my r-b tag.

Ok, I missed that, thanks for the review. As I want to evict 
in the test I dare to take your r-b after fixing that empty 
line issue.

--
Zbigniew

> 
> Regards,
> Kamil
> >  	}
> >  }
> > -- 
> > 2.32.0
> > 
