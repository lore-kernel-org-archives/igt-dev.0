Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <3f1bd2ad-f9a2-c6dc-b878-3982eb01f150@linux.intel.com>
References: <20200526141723.401469-1-chris@chris-wilson.co.uk>
 <3f1bd2ad-f9a2-c6dc-b878-3982eb01f150@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159050915299.30979.3270746636887568862@build.alporthouse.com>
Date: Tue, 26 May 2020 17:05:52 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/perf_pmu: Update
 inter-engine semaphore detection
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

Quoting Tvrtko Ursulin (2020-05-26 16:58:05)
> 
> On 26/05/2020 15:17, Chris Wilson wrote:
> > The kernel no longer uses semaphores between engines, unless it can do
> > so by preempting them with timeslices. Update the semaphore-busy to only
> > run when we expect semaphore usage, i.e. not on bdw/bsw.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1939
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >   tests/perf_pmu.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
> > index e54a0d47e..e80f730cf 100644
> > --- a/tests/perf_pmu.c
> > +++ b/tests/perf_pmu.c
> > @@ -822,6 +822,7 @@ sema_busy(int gem_fd,
> >       int fd;
> >   
> >       igt_require(gem_scheduler_has_semaphores(gem_fd));
> > +     igt_require(gem_scheduler_has_preemption(gem_fd));
> >   
> >       fd = open_group(gem_fd,
> >                       I915_PMU_ENGINE_SEMA(e->class, e->instance), -1);
> > 
> 
> Test with perhaps too intimate knowledge of i915..

iirc, part of the intent of the test was to understand how the kernel's
choice of inter-engine sync would show up in the pmu. The challenge we
have is in declaring the expected outcomes, that requires intimate
knowledge of what the kernel might decide to do.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
