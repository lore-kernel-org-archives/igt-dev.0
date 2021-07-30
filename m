Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 30 Jul 2021 18:06:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20210730180609.GA60763@DUT151-ICLU.fm.intel.com>
References: <20210727182057.78409-1-matthew.brost@intel.com>
 <20210727182057.78409-2-matthew.brost@intel.com>
 <9095b26a-975b-9180-045f-7231d63fe9ff@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9095b26a-975b-9180-045f-7231d63fe9ff@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/1] i915/gem_scheduler:
 Ensure submission order in manycontexts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 30, 2021 at 10:58:38AM +0100, Tvrtko Ursulin wrote:
> 
> On 27/07/2021 19:20, Matthew Brost wrote:
> > With GuC submission contexts can get reordered (compared to submission
> > order), if contexts get reordered the sequential nature of the batches
> > releasing the next batch's semaphore in function timesliceN() get broken
> > resulting in the test taking much longer than if should. e.g. Every
> > contexts needs to be timesliced to release the next batch. Corking the
> > first submission until all the batches have been submitted should ensure
> > submission order.
> 
> The explanation sounds suspect.
> 
> Consider this comment from the test itself:
> 
> 	/*
> 	 * Create a pair of interlocking batches, that ping pong
> 	 * between each other, and only advance one step at a time.
> 	 * We require the kernel to preempt at each semaphore and
> 	 * switch to the other batch in order to advance.
> 	 */
> 
> I'd say the test does not rely on no re-ordering at all, but relies on
> context switch on an unsatisfied semaphore.
>

Yes, let do a simple example with 5 batches. Batch 0 releases batch's
semaphore 1, batch 1 releases batch's 2 semaphore, etc... If the batches
are seen in order the test should take 40 timeslices (8 semaphores in
each batch have to be released).

If the batches are in the below order:
0 2 1 3 4

Now we have 72 timeslices. Now imagine with 67 batches completely out of
order, the number timeslices can explode.

> In the commit you seem to acknowledge GuC does not do that but instead ends
> up waiting for the timeslice to expire, did I get that right? If so, why

I think GuC waits for the timeslice to expire if a semaphore is
unsatisfied, I have to double check on that. I thought that was what
execlists were doing too but I now see it has a convoluted algorithm to
yield the timeslice if subsequent request comes in and the ring is
waiting on a timeslice. Let me check with GuC team and see if they can
/ are doing something similiar. I was thinking the only to switch a
sempahore was clear CTX_CTRL_INHIBIT_SYN_CTX_SWITCH but that appears to
be incorrect.

For what is worth, after this change the run times of test are pretty
similar for execlists & GuC on TGL.

Matt

> does the GuC does not do that and can we fix it?
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   tests/i915/gem_exec_schedule.c | 16 +++++++++++++++-
> >   1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index f03842478..41f2591a5 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -597,12 +597,13 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
> >   	struct drm_i915_gem_execbuffer2 execbuf  = {
> >   		.buffers_ptr = to_user_pointer(&obj),
> >   		.buffer_count = 1,
> > -		.flags = engine | I915_EXEC_FENCE_OUT,
> > +		.flags = engine | I915_EXEC_FENCE_OUT | I915_EXEC_FENCE_SUBMIT,
> >   	};
> >   	uint32_t *result =
> >   		gem_mmap__device_coherent(i915, obj.handle, 0, sz, PROT_READ);
> >   	const intel_ctx_t *ctx;
> >   	int fence[count];
> > +	IGT_CORK_FENCE(cork);
> >   	/*
> >   	 * Create a pair of interlocking batches, that ping pong
> > @@ -614,6 +615,17 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
> >   	igt_require(gem_scheduler_has_timeslicing(i915));
> >   	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
> > +	/*
> > +	 * With GuC submission contexts can get reordered (compared to
> > +	 * submission order), if contexts get reordered the sequential
> > +	 * nature of the batches releasing the next batch's semaphore gets
> > +	 * broken resulting in the test taking much longer than it should (e.g.
> > +	 * every context needs to be timesliced to release the next batch).
> > +	 * Corking the first submission until all batches have been
> > +	 * submitted should ensure submission order.
> > +	 */
> > +	execbuf.rsvd2 = igt_cork_plug(&cork, i915);
> > +
> >   	/* No coupling between requests; free to timeslice */
> >   	for (int i = 0; i < count; i++) {
> > @@ -624,8 +636,10 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
> >   		intel_ctx_destroy(i915, ctx);
> >   		fence[i] = execbuf.rsvd2 >> 32;
> > +		execbuf.rsvd2 >>= 32;
> >   	}
> > +	igt_cork_unplug(&cork);
> >   	gem_sync(i915, obj.handle);
> >   	gem_close(i915, obj.handle);
> > 
