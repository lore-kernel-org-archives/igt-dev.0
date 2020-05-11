Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200511094910.GE9497@platvala-desk.ger.corp.intel.com>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
 <20200511093924.65748-1-chris@chris-wilson.co.uk>
 <20200511094910.GE9497@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158919083801.1729.7931773800344388565@build.alporthouse.com>
Date: Mon, 11 May 2020 10:53:58 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ringfill: Do a
 basic pass over all engines simultaneously
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-05-11 10:49:10)
> On Mon, May 11, 2020 at 10:39:24AM +0100, Chris Wilson wrote:
> > Change the basic pre-mergetest to do a single pass over all engines
> > simultaneously. This should take no longer than checking a single
> > engine, while providing just the right amount of stress regardless of
> > machine size.
> > 
> > v2: Move around the quiescence and requires to avoid calling them from
> > the children.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > ---
> >  tests/i915/gem_ringfill.c             | 31 ++++++++++++++++++++-------
> >  tests/intel-ci/fast-feedback.testlist |  2 +-
> >  2 files changed, 24 insertions(+), 9 deletions(-)
> > 
> > diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> > index a2157bd6f..05b997ed4 100644
> > --- a/tests/i915/gem_ringfill.c
> > +++ b/tests/i915/gem_ringfill.c
> > @@ -178,13 +178,11 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
> >       struct drm_i915_gem_execbuffer2 execbuf;
> >       igt_hang_t hang;
> >  
> > -     gem_require_ring(fd, ring);
> > -     igt_require(gem_can_store_dword(fd, ring));
> > -
> > -     if (flags & (SUSPEND | HIBERNATE))
> > +     if (flags & (SUSPEND | HIBERNATE)) {
> >               run_test(fd, ring, 0, 0);
> > +             gem_quiescent_gpu(fd);
> > +     }
> >  
> > -     gem_quiescent_gpu(fd);
> >       igt_require(setup_execbuf(fd, &execbuf, obj, reloc, ring) == 0);
> 
> What about this one?

If that fails, I'll accept the punishment of having to debug a
mysterious segfault. That's a require for v3.10.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
