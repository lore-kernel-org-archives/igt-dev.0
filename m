Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <bf6adb3d-f86e-4a51-b0ff-bd1367a3a3f7@linux.intel.com>
References: <20201217172618.1637044-1-chris@chris-wilson.co.uk>
 <bf6adb3d-f86e-4a51-b0ff-bd1367a3a3f7@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 17 Dec 2020 17:39:43 +0000
Message-ID: <160822678340.13606.1167891500717793691@build.alporthouse.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/perf_pmu: Exercise
 I915_PMU_SOFTWARE_GT_AWAKE_TIME
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

Quoting Tvrtko Ursulin (2020-12-17 17:33:05)
> 
> On 17/12/2020 17:26, Chris Wilson wrote:
> > Measure the sample gt-awake time while each engine and every engine is
> > busy. They should all report the same duration, the elapsed runtime of
> > the batch.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > ---
> >   include/drm-uapi/i915_drm.h |  3 ++-
> >   tests/i915/perf_pmu.c       | 42 +++++++++++++++++++++++++++++++++++++
> >   2 files changed, 44 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> > index ef696d1a5..bf9ea471c 100644
> > --- a/include/drm-uapi/i915_drm.h
> > +++ b/include/drm-uapi/i915_drm.h
> > @@ -177,8 +177,9 @@ enum drm_i915_pmu_engine_sample {
> >   #define I915_PMU_REQUESTED_FREQUENCY        __I915_PMU_OTHER(1)
> >   #define I915_PMU_INTERRUPTS         __I915_PMU_OTHER(2)
> >   #define I915_PMU_RC6_RESIDENCY              __I915_PMU_OTHER(3)
> > +#define I915_PMU_SOFTWARE_GT_AWAKE_TIME      __I915_PMU_OTHER(4)
> >   
> > -#define I915_PMU_LAST I915_PMU_RC6_RESIDENCY
> > +#define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
> >   
> >   /* Each region is a minimum of 16k, and there are at most 255 of them.
> >    */
> > diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> > index c2b186d39..90182074b 100644
> > --- a/tests/i915/perf_pmu.c
> > +++ b/tests/i915/perf_pmu.c
> > @@ -883,6 +883,42 @@ sema_busy(int gem_fd,
> >       close(fd[1]);
> >   }
> >   
> > +static void test_awake(int i915)
> > +{
> > +     const struct intel_execution_engine2 *e;
> > +     unsigned long slept;
> > +     uint64_t val;
> > +     int fd;
> > +
> > +     fd = perf_i915_open(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
> > +     igt_skip_on(fd < 0);
> > +
> > +     /* Check that each engine is captured by the GT wakeref */
> > +     __for_each_physical_engine(i915, e) {
> > +             igt_spin_new(i915, .engine = e->flags);
> > +
> > +             val = pmu_read_single(fd);
> > +             slept = measured_usleep(batch_duration_ns / 1000);
> > +             val = pmu_read_single(fd) - val;
> > +
> > +             gem_quiescent_gpu(i915);
> > +             assert_within_epsilon(val, slept, tolerance);
> > +     }
> > +
> > +     /* And that the total GT wakeref matches walltime not summation */
> > +     __for_each_physical_engine(i915, e)
> > +             igt_spin_new(i915, .engine = e->flags);
> > +
> > +     val = pmu_read_single(fd);
> > +     slept = measured_usleep(batch_duration_ns / 1000);
> > +     val = pmu_read_single(fd) - val;
> > +
> > +     gem_quiescent_gpu(i915);
> > +     assert_within_epsilon(val, slept, tolerance);
> > +
> 
> Erm who terminates all those spinners? :)

gem_quiescent_gpu() calls igt_terminate_spins(). Hmm, I actually thought
it freed them too, but what's a small leak...
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
