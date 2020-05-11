Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200511093149.GD9497@platvala-desk.ger.corp.intel.com>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
 <20200511093149.GD9497@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158918986617.1729.17535844826256554961@build.alporthouse.com>
Date: Mon, 11 May 2020 10:37:46 +0100
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] i915/gem_ringfill: Do a
 basic pass over all engines simultaneously
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-05-11 10:31:49)
> On Mon, May 11, 2020 at 09:21:41AM +0100, Chris Wilson wrote:
> > Change the basic pre-mergetest to do a single pass over all engines
> > simultaneously. This should take no longer than checking a single
> > engine, while providing just the right amount of stress regardless of
> > machine size.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  tests/i915/gem_ringfill.c             | 10 ++++++++++
> >  tests/intel-ci/fast-feedback.testlist |  2 +-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> > index a2157bd6f..a90758e08 100644
> > --- a/tests/i915/gem_ringfill.c
> > +++ b/tests/i915/gem_ringfill.c
> > @@ -292,6 +292,16 @@ igt_main
> >               }
> >       }
> >  
> > +     igt_subtest("basic-all") {
> > +             const struct intel_execution_engine2 *e;
> > +
> > +             __for_each_physical_engine(fd, e)
> > +                     igt_fork(child, 1)
> > +                             run_test(fd, e->flags, 0, 1);
> 
> Will it happen simultaneously though without synchronization?

This would allocate separate buffers for each engine, so would be
independent. [That was the intention.]


> (Obvious quip about executing too fast)
> 
> run_test() calls igt_require in a few places, and skips in child
> processes are problematic.

I was trying not to rewrite it!
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
