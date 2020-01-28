Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87lfprnbpg.fsf@gaia.fi.intel.com>
References: <20200126134811.2084060-1-chris@chris-wilson.co.uk>
 <87lfprnbpg.fsf@gaia.fi.intel.com>
Message-ID: <158020595375.30113.15148617807709910784@skylake-alporthouse-com>
Date: Tue, 28 Jan 2020 10:05:53 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] i915: Inject invalid CS
 into hanging spinners
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Mika Kuoppala (2020-01-28 09:59:23)
> Chris Wilson <chris@chris-wilson.co.uk> writes:
> 
> > Some spinners are used with the intent of never ending and being
> > declared hung by the kernel. In some cases, these are being used to
> > simulate invalid payloads and so we can use an invalid command to
> > trigger a GPU hang. (Other cases, they are simulating infinite workloads
> > that truly never end, but we still need to be able to curtail to provide
> > multi-tasking). This patch adds IGT_SPIN_INVALID_CS to request the
> > injection of 0xdeadbeef into the command stream that should trigger a
> > GPU hang.
> 
> Ok so you want to differentiate between a never ending
> and invalid payload as a separate. And also quicken the
> resolve.
> 
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  lib/igt_dummyload.c              |  2 ++
> >  lib/igt_dummyload.h              |  1 +
> >  tests/i915/gem_busy.c            |  3 ++-
> >  tests/i915/gem_ctx_persistence.c | 39 +++++++++++++++++++++++++++++++-
> >  tests/i915/gem_eio.c             |  1 +
> >  tests/i915/gem_exec_balancer.c   |  4 +++-
> >  tests/i915/gem_exec_fence.c      |  3 ++-
> >  7 files changed, 49 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> > index b7f4caca3..041122af9 100644
> > --- a/lib/igt_dummyload.c
> > +++ b/lib/igt_dummyload.c
> > @@ -189,6 +189,8 @@ emit_recursive_batch(igt_spin_t *spin,
> >       /* Allow ourselves to be preempted */
> >       if (!(opts->flags & IGT_SPIN_NO_PREEMPTION))
> >               *cs++ = MI_ARB_CHK;
> > +     if (opts->flags & IGT_SPIN_INVALID_CS)
> > +             *cs++ = 0xdeadbeef;
> 
> Some cmd streamers might just ignore this but lets
> see how it goes.

See the selftest in
https://patchwork.freedesktop.org/patch/350890/?series=72639&rev=1
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
