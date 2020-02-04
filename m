Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <2c33f8e3-0b3e-6cd8-9abb-efad53ea5274@linux.intel.com>
References: <20200204152456.1137083-1-chris@chris-wilson.co.uk>
 <2c33f8e3-0b3e-6cd8-9abb-efad53ea5274@linux.intel.com>
Message-ID: <158083220396.1394.15141668391126974474@skylake-alporthouse-com>
Date: Tue, 04 Feb 2020 16:03:23 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_exec: Cover
 all engines for nohangcheck
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-02-04 15:57:23)
> 
> On 04/02/2020 15:24, Chris Wilson wrote:
> > No engine can be missed when verifying that a rogue user cannot cause a
> > denial-of-service with nohangcheck.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> >   tests/i915/gem_ctx_exec.c | 35 +++++++++++++++++++++++++++++------
> >   1 file changed, 29 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> > index b1ae65774..2a16357a4 100644
> > --- a/tests/i915/gem_ctx_exec.c
> > +++ b/tests/i915/gem_ctx_exec.c
> > @@ -42,6 +42,7 @@
> >   
> >   #include "igt_dummyload.h"
> >   #include "igt_sysfs.h"
> > +#include "sw_sync.h"
> >   
> >   IGT_TEST_DESCRIPTION("Test context batch buffer execution.");
> >   
> > @@ -203,9 +204,9 @@ static bool __enable_hangcheck(int dir, bool state)
> >   
> >   static void nohangcheck_hostile(int i915)
> >   {
> > -     int64_t timeout = NSEC_PER_SEC / 2;
> > -     igt_spin_t *spin;
> > +     int64_t timeout = MSEC_PER_SEC / 2;
> >       igt_hang_t hang;
> > +     int fence = -1;
> >       uint32_t ctx;
> >       int err = 0;
> >       int dir;
> > @@ -223,16 +224,35 @@ static void nohangcheck_hostile(int i915)
> >   
> >       igt_require(__enable_hangcheck(dir, false));
> >   
> > -     spin = igt_spin_new(i915, ctx, .flags = IGT_SPIN_NO_PREEMPTION);
> > +     for_each_physical_engine(e, i915) {
> 
> I think we shouldn't add more of for_each_physical_engine, but to use 
> new style need to think where we are with the overall design of 
> iterators and stuff.

i915 = gem_reopen_driver(i915);
__for_each_physical_engine(i915, backwardse)

> > +             igt_spin_t *spin;
> > +
> > +             spin = igt_spin_new(i915, ctx,
> > +                                 .engine = eb_ring(e),
> > +                                 .flags = (IGT_SPIN_NO_PREEMPTION |
> > +                                           IGT_SPIN_FENCE_OUT));
> > +
> > +             igt_assert(spin->out_fence != -1);
> 
>  >= 0 would be more correct. Or your beloved igt_assert_fd. ;)
> 
> > +             if (fence < 0) {
> > +                     fence = spin->out_fence;
> > +                     spin->out_fence = -1;
> > +             } else {
> > +                     int new;
> > +
> > +                     new = sync_fence_merge(fence, spin->out_fence);
> > +                     close(fence);
> > +
> > +                     fence = new;
> > +             }
> > +     }
> >       gem_context_destroy(i915, ctx);
> > +     igt_assert(fence != -1);
> >   
> > -     if (gem_wait(i915, spin->handle, &timeout)) {
> > +     if (sync_fence_wait(fence, timeout)) {
> >               igt_debugfs_dump(i915, "i915_engine_info");
> >               err = -ETIME;
> >       }
> >   
> > -     igt_spin_free(i915, spin);
> 
> Could keep last for completeness.

We need to walk over the list. So I decided to leak for simplicity.

> >       __enable_hangcheck(dir, true);
> >       gem_quiescent_gpu(i915);
> >       igt_disallow_hang(i915, hang);
> > @@ -240,6 +260,9 @@ static void nohangcheck_hostile(int i915)
> >       igt_assert_f(err == 0,
> >                    "Hostile unpreemptable context was not cancelled immediately upon closure\n");
> >   
> > +     igt_assert_eq(sync_fence_status(fence), -EIO);
> 
> With composite fences I have a feeling -EIO could mean any fence 
> signalled -EIO and we want to check all have, no? At least I hope both 
> my assumptions are correct.

That is true (first error on any fence is promoted to the composite
fence). The way we check that they were all cancelled is by the
timeout. Hangcheck is disabled, they are infinite unstoppable batches, so
the only way out is by an engine reset or worse.
[In gem_ctx_persistence we look to see that only the engine is reset
without collateral damage, here we just make sure the system isn't lost
because of the i915.hangcheck modparam.]
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
