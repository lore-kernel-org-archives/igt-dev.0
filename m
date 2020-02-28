Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815BC6E198
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2020 13:41:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <9c896736-164d-f79e-13ca-da6b242f2bd4@linux.intel.com>
References: <20200218082240.21853-1-krishnaiah.bommu@intel.com>
 <20200218082240.21853-2-krishnaiah.bommu@intel.com>
 <9c896736-164d-f79e-13ca-da6b242f2bd4@linux.intel.com>
Message-ID: <158289729413.24106.11399579225916670468@skylake-alporthouse-com>
Date: Fri, 28 Feb 2020 13:41:34 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] lib/i915/gem_ring : set the
 engine to default context
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-02-28 11:15:14)
> 
> On 18/02/2020 08:22, Bommu Krishnaiah wrote:
> > Copy the existing engine map from default context to
> > newly created  default context
> > 
> > v2: addressed review comments
> > 
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >   lib/i915/gem_ring.c              | 8 ++++++--
> >   lib/i915/gem_ring.h              | 2 +-
> >   tests/i915/gem_busy.c            | 2 +-
> >   tests/i915/gem_ctx_persistence.c | 2 +-
> >   tests/i915/gem_eio.c             | 6 +++---
> >   tests/i915/gem_exec_await.c      | 2 +-
> >   tests/i915/gem_exec_fence.c      | 2 +-
> >   tests/i915/gem_exec_latency.c    | 2 +-
> >   tests/i915/gem_exec_schedule.c   | 6 +++---
> >   tests/i915/gem_ringfill.c        | 2 +-
> >   tests/perf_pmu.c                 | 2 +-
> >   11 files changed, 20 insertions(+), 16 deletions(-)
> > 
> > diff --git a/lib/i915/gem_ring.c b/lib/i915/gem_ring.c
> > index 99f4741c..14abfb16 100644
> > --- a/lib/i915/gem_ring.c
> > +++ b/lib/i915/gem_ring.c
> > @@ -143,11 +143,15 @@ __gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags
> >    * Number of batches that fit in the ring
> >    */
> >   unsigned int
> > -gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags flags)
> > +gem_measure_ring_inflight(int sfd, unsigned int engine, enum measure_ring_flags flags, bool copy_engine_map)
> >   {
> >       unsigned int min = ~0u;
> > +     int fd;
> >   
> > -     fd = gem_reopen_driver(fd);
> > +     fd = gem_reopen_driver(sfd);
> > +
> > +     if (copy_engine_map)
> > +             gem_context_copy_engines(sfd, 0, fd, 0);
> 
> Would querying the context for presence of engine map be too hacky? It 
> would avoid having to change the prototype etc. I guess it would be 
> hacky since it could incorrectly imply from which kind of context 
> 'engine' comes.
> 
> Perhaps proper fix it to pass in fd/ctx tuple in here and then decide 
> locally. That sounds better to me than the bool. Chris, your opinion?

I was just planning on adding USE_ENGINE to flags.

The reason we had to add gem_reopen_driver() here was someone converted
some tests to __for_each_physical_engine but later on in the same test
we used gem_measure_ring_inflight with a legacy ring. So I was wary of
that breaking again, and thought the exercise of making the USE_ENGINE
explicit would be useful review of the callers.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
