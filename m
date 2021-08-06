Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04D989956
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 06:56:22 +0000 (UTC)
Date: Fri, 6 Aug 2021 08:56:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210806065617.GD3285@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-11-zbigniew.kempczynski@intel.com>
 <87a6lwtziq.wl-ashutosh.dixit@intel.com>
 <20210805080241.GE3295@zkempczy-mobl2>
 <87czqrtx0b.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czqrtx0b.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 10/52] tests/gem_busy: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 05, 2021 at 02:14:12PM -0700, Dixit, Ashutosh wrote:
> On Thu, 05 Aug 2021 01:02:41 -0700, Zbigniew Kempczyński wrote:
> >
> 
> Please fix the put_ahnd. With that this patch is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> But I want to discuss the intel_allocator_multiprocess_start/stop issue a
> bit more below.
> 
> > On Wed, Aug 04, 2021 at 07:07:41PM -0700, Dixit, Ashutosh wrote:
> > > On Mon, 26 Jul 2021 12:59:44 -0700, Zbigniew Kempczyński wrote:
> > > >
> > > > For newer gens we're not able to rely on relocations. Adopt to use
> > > > offsets acquired from the allocator.
> > > >
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > ---
> > > >  tests/i915/gem_busy.c | 35 +++++++++++++++++++++++++++++++----
> > > >  1 file changed, 31 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> > > > index f0fca0e8a..51ec5ad04 100644
> > > > --- a/tests/i915/gem_busy.c
> > > > +++ b/tests/i915/gem_busy.c
> > > > @@ -108,6 +108,7 @@ static void semaphore(int fd, const intel_ctx_t *ctx,
> > > >	uint32_t handle[3];
> > > >	uint32_t read, write;
> > > >	uint32_t active;
> > > > +	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
> > > >	unsigned i;
> > > >
> > > >	handle[TEST] = gem_create(fd, 4096);
> > > > @@ -117,6 +118,7 @@ static void semaphore(int fd, const intel_ctx_t *ctx,
> > > >	/* Create a long running batch which we can use to hog the GPU */
> > > >	handle[BUSY] = gem_create(fd, 4096);
> > > >	spin = igt_spin_new(fd,
> > > > +			    .ahnd = ahnd,
> > > >			    .ctx = ctx,
> > > >			    .engine = e->flags,
> > > >			    .dependency = handle[BUSY]);
> > >
> > > Missing put_ahnd.
> >
> > Good catch.
> >
> > >
> > > > @@ -428,6 +442,7 @@ igt_main
> > > >
> > > >	igt_subtest_group {
> > > >		igt_fixture {
> > > > +			intel_allocator_multiprocess_start();
> > > >			igt_fork_hang_detector(fd);
> > > >		}
> > > >
> > > > @@ -445,6 +460,21 @@ igt_main
> > > >			}
> > > >		}
> > > >
> > >
> > > Just above here is basic() which doesn't have a fork. Is it ok to do
> > > intel_allocator_multiprocess_start/stop when we don't have a fork? If yes,
> > > then can we _always_ do intel_allocator_multiprocess_start/stop rather than
> > > only when we have fork? Thanks.
> >
> > intel_allocator_multiprocess_start() creates allocator thread which acts
> > for children (igt_fork) to alloc/free offsets. If you use alloc/free within
> > same process (from which thread was spawned) internal structure is mutexed
> > and no IPCs are called. So only consequence of this here is additional thread
> > in system/memory (which does nothing for basic() tests). It will be stopped
> > with intel_allocator_multiprocess_stop().
> 
> OK, in that case let me ask the question I asked above in another way. Can
> we add intel_allocator_multiprocess_start() to common_init() (the program
> entry point) and similarly say intel_allocator_multiprocess_stop() to
> igt_exit() (or common_exit_handler(), basically the program exit point) so
> that these always run and we don't have to add them only for specific tests
> which fork? What would be the disadvantage of doing this? Thanks.

At the moment likely not. Currently each test which completes reinitialize
data structures (intel_allocator_init(), called in exit_subtest()). It
doesn't perform any sysvipc calls (recreating msgqueue). I should
happen to clean the mess from previous (likely failed) run - what
intel_allocator_multiprocess_stop() does now. Starting/stopping allocator
which is designed for Intel i915 mostly would also be called in kms
tests which are vendor agnostic if I'm not wrong.

I still queued to handle situations when child calls assert. This generates
problem now because we're stopping test now without stopping allocator thread
properly.

I would stick at the moment to spawn allocator thread when it is necessary.
Currently allocator implementation  multiprocess environment is fragile and 
handle errors in limited manner.

Putting intel_allocator_multiprocess_start()/stop() in fixture is imo best
way of handling error situations. We ensure something we create/destroy ipc
regardless tests results.

--
Zbigniew

> 
> > But for purity test should work without additional dependencies so I'll fix
> > this - it will be sent in v4.
> >
> > --
> > Zbigniew
