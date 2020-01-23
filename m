Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189C16F9BD
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 09:27:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200123091824.29850-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200123091824.29850-1-arjun.melkaveri@intel.com>
Message-ID: <157977165683.18920.9714436752574525887@skylake-alporthouse-com>
Date: Thu, 23 Jan 2020 09:27:36 +0000
Subject: Re: [igt-dev] [PATCH V4] i915/gem_exec_nop:Adjusted test to utilize
 all available engines
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arjun Melkaveri (2020-01-23 09:18:24)
> Added __for_each_physical_engine to utilize all available engines.
> Moved single, signal, preempt, poll and headless test cases
> from static to dynamic group.
> 
> Cc: Dec Katarzyna <katarzyna.dec@intel.com>
> Cc: Kempczynski Zbigniew <zbigniew.kempczynski@intel.com>
> Cc: Tahvanainen Jari <jari.tahvanainen@intel.com>
> Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
> V1 -> V2
> 
> Addressed Tvrtko review comments
> 1) removed gem_require_ring
> 2) replaced gem_can_store_dword with gem_class_can_store_dword
> 3) Fixed WhiteSpace issues.
> ---
> V2 -> V3
> 
> Added back missing code. i.e. MIN_PRIO
> ---
> V3 -> V4
> 
> 1) Added gem_context_set_all_engines , that was deleted accidentally
> 2) Removed gem_require_ring from fence_signal
> 3) Passing NULL in fence_signal to run test for all engines.
> ---
>  tests/i915/gem_exec_nop.c | 164 ++++++++++++++++++++++----------------
>  1 file changed, 94 insertions(+), 70 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index dbedb356..c2d45e5e 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -66,8 +66,9 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
>                 (end->tv_nsec - start->tv_nsec)*1e-9);
>  }
>  
> -static double nop_on_ring(int fd, uint32_t handle, unsigned ring_id,
> -                         int timeout, unsigned long *out)
> +static double nop_on_ring(int fd, uint32_t handle,
> +                         const struct intel_execution_engine2 *e, int timeout,
> +                         unsigned long *out)
>  {
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj;
> @@ -80,11 +81,11 @@ static double nop_on_ring(int fd, uint32_t handle, unsigned ring_id,
>         memset(&execbuf, 0, sizeof(execbuf));
>         execbuf.buffers_ptr = to_user_pointer(&obj);
>         execbuf.buffer_count = 1;
> -       execbuf.flags = ring_id;
> +       execbuf.flags = e->flags;
>         execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
>         execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
>         if (__gem_execbuf(fd, &execbuf)) {
> -               execbuf.flags = ring_id;
> +               execbuf.flags = e->flags;
>                 gem_execbuf(fd, &execbuf);
>         }
>         intel_detect_and_clear_missed_interrupts(fd);
> @@ -104,7 +105,8 @@ static double nop_on_ring(int fd, uint32_t handle, unsigned ring_id,
>         return elapsed(&start, &now);
>  }
>  
> -static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
> +static void poll_ring(int fd, const struct intel_execution_engine2 *e,
> +                     int timeout)
>  {
>         const int gen = intel_gen(intel_get_drm_devid(fd));
>         const uint32_t MI_ARB_CHK = 0x5 << 23;
> @@ -121,9 +123,8 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
>         if (gen == 4 || gen == 5)
>                 flags |= I915_EXEC_SECURE;
>  
> -       gem_require_ring(fd, engine);
> -       igt_require(gem_can_store_dword(fd, engine));
> -       igt_require(gem_engine_has_mutable_submission(fd, engine));
> +       igt_require(gem_class_can_store_dword(fd, e->class));
> +       igt_require(gem_class_has_mutable_submission(fd, e->class));
>  
>         memset(&obj, 0, sizeof(obj));
>         obj.handle = gem_create(fd, 4096);
> @@ -187,7 +188,7 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
>         memset(&execbuf, 0, sizeof(execbuf));
>         execbuf.buffers_ptr = to_user_pointer(&obj);
>         execbuf.buffer_count = 1;
> -       execbuf.flags = engine | flags;
> +       execbuf.flags = e->flags | flags;
>  
>         cycles = 0;
>         do {
> @@ -209,7 +210,7 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
>         gem_sync(fd, obj.handle);
>  
>         igt_info("%s completed %ld cycles: %.3f us\n",
> -                name, cycles, elapsed*1e-3/cycles);
> +                e->name, cycles, elapsed*1e-3/cycles);
>  
>         munmap(batch, 4096);
>         gem_close(fd, obj.handle);
> @@ -218,6 +219,7 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
>  static void poll_sequential(int fd, const char *name, int timeout)
>  {
>         const int gen = intel_gen(intel_get_drm_devid(fd));
> +       const struct intel_execution_engine2 *e;
>         const uint32_t MI_ARB_CHK = 0x5 << 23;
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj[2];
> @@ -234,13 +236,14 @@ static void poll_sequential(int fd, const char *name, int timeout)
>                 flags |= I915_EXEC_SECURE;
>  
>         nengine = 0;
> -       for_each_physical_engine(e, fd) {
> -               if (!gem_can_store_dword(fd, eb_ring(e)) ||
> -                   !gem_engine_has_mutable_submission(fd, eb_ring(e)))
> +       __for_each_physical_engine(fd, e) {
> +               if (!gem_class_can_store_dword(fd, e->class) ||
> +                   !gem_class_has_mutable_submission(fd, e->class))
>                         continue;
>  
> -               engines[nengine++] = eb_ring(e);
> +               engines[nengine++] = e->flags;
>         }
> +
>         igt_require(nengine);
>  
>         memset(obj, 0, sizeof(obj));
> @@ -344,21 +347,20 @@ static void poll_sequential(int fd, const char *name, int timeout)
>  }
>  
>  static void single(int fd, uint32_t handle,
> -                  unsigned ring_id, const char *ring_name)
> +                  const struct intel_execution_engine2 *e)
>  {
>         double time;
>         unsigned long count;
>  
> -       gem_require_ring(fd, ring_id);
> -
> -       time = nop_on_ring(fd, handle, ring_id, 20, &count);
> +       time = nop_on_ring(fd, handle, e, 20, &count);
>         igt_info("%s: %'lu cycles: %.3fus\n",
> -                ring_name, count, time*1e6 / count);
> +                 e->name, count, time*1e6 / count);
>  }
>  
>  static double
> -stable_nop_on_ring(int fd, uint32_t handle, unsigned int engine,
> -                  int timeout, int reps)
> +stable_nop_on_ring(int fd, uint32_t handle,
> +                  const struct intel_execution_engine2 *e, int timeout,
> +                  int reps)
>  {
>         igt_stats_t s;
>         double n;
> @@ -372,7 +374,7 @@ stable_nop_on_ring(int fd, uint32_t handle, unsigned int engine,
>                 unsigned long count;
>                 double time;
>  
> -               time = nop_on_ring(fd, handle, engine, timeout, &count);
> +               time = nop_on_ring(fd, handle, e, timeout, &count);
>                 igt_stats_push_float(&s, time / count);
>         }
>  
> @@ -388,7 +390,8 @@ stable_nop_on_ring(int fd, uint32_t handle, unsigned int engine,
>                       "'%s' != '%s' (%f not within %f%% tolerance of %f)\n",\
>                       #x, #ref, x, tolerance * 100.0, ref)
>  
> -static void headless(int fd, uint32_t handle)
> +static void headless(int fd, uint32_t handle,
> +                    const struct intel_execution_engine2 *e)
>  {
>         unsigned int nr_connected = 0;
>         drmModeConnector *connector;
> @@ -411,7 +414,7 @@ static void headless(int fd, uint32_t handle)
>         kmstest_set_vt_graphics_mode();
>  
>         /* benchmark nops */
> -       n_display = stable_nop_on_ring(fd, handle, I915_EXEC_DEFAULT, 1, 5);
> +       n_display = stable_nop_on_ring(fd, handle, e, 1, 5);
>         igt_info("With one display connected: %.2fus\n",
>                  n_display * 1e6);
>  
> @@ -419,7 +422,7 @@ static void headless(int fd, uint32_t handle)
>         kmstest_unset_all_crtcs(fd, res);
>  
>         /* benchmark nops again */
> -       n_headless = stable_nop_on_ring(fd, handle, I915_EXEC_DEFAULT, 1, 5);
> +       n_headless = stable_nop_on_ring(fd, handle, e, 1, 5);
>         igt_info("Without a display connected (headless): %.2fus\n",
>                  n_headless * 1e6);
>  
> @@ -429,6 +432,7 @@ static void headless(int fd, uint32_t handle)
>  
>  static void parallel(int fd, uint32_t handle, int timeout)
>  {
> +       const struct intel_execution_engine2 *e;
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj;
>         unsigned engines[16];
> @@ -439,12 +443,11 @@ static void parallel(int fd, uint32_t handle, int timeout)
>  
>         sum = 0;
>         nengine = 0;
> -       for_each_physical_engine(e, fd) {
> -               engines[nengine] = eb_ring(e);
> -               names[nengine] = e->name;
> -               nengine++;
> +       __for_each_physical_engine(fd, e) {
> +               engines[nengine] = e->flags;
> +               names[nengine++] = e->name;
>  
> -               time = nop_on_ring(fd, handle, eb_ring(e), 1, &count) / count;
> +               time = nop_on_ring(fd, handle, e, 1, &count) / count;
>                 sum += time;
>                 igt_debug("%s: %.3fus\n", e->name, 1e6*time);
>         }
> @@ -490,6 +493,7 @@ static void parallel(int fd, uint32_t handle, int timeout)
>  
>  static void series(int fd, uint32_t handle, int timeout)
>  {
> +       const struct intel_execution_engine2 *e;
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj;
>         struct timespec start, now, sync;
> @@ -500,8 +504,8 @@ static void series(int fd, uint32_t handle, int timeout)
>         const char *name;
>  
>         nengine = 0;
> -       for_each_physical_engine(e, fd) {
> -               time = nop_on_ring(fd, handle, eb_ring(e), 1, &count) / count;
> +       __for_each_physical_engine(fd, e) {
> +               time = nop_on_ring(fd, handle, e, 1, &count) / count;
>                 if (time > max) {
>                         name = e->name;
>                         max = time;
> @@ -509,7 +513,7 @@ static void series(int fd, uint32_t handle, int timeout)
>                 if (time < min)
>                         min = time;
>                 sum += time;
> -               engines[nengine++] = eb_ring(e);
> +               engines[nengine++] = e->flags;
>         }
>         igt_require(nengine);
>         igt_info("Maximum execution latency on %s, %.3fus, min %.3fus, total %.3fus per cycle, average %.3fus\n",
> @@ -580,6 +584,7 @@ static void xchg(void *array, unsigned i, unsigned j)
>  static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
>  {
>         const int ncpus = flags & FORKED ? sysconf(_SC_NPROCESSORS_ONLN) : 1;
> +       const struct intel_execution_engine2 *e;
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj[2];
>         unsigned engines[16];
> @@ -595,14 +600,14 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
>  
>         nengine = 0;
>         sum = 0;
> -       for_each_physical_engine(e, fd) {
> +       __for_each_physical_engine(fd, e) {
>                 unsigned long count;
>  
> -               time = nop_on_ring(fd, handle, eb_ring(e), 1, &count) / count;
> +               time = nop_on_ring(fd, handle, e, 1, &count) / count;
>                 sum += time;
>                 igt_debug("%s: %.3fus\n", e->name, 1e6*time);
>  
> -               engines[nengine++] = eb_ring(e);
> +               engines[nengine++] = e->flags;
>         }
>         igt_require(nengine);
>         igt_info("Total (individual) execution latency %.3fus per cycle\n",
> @@ -625,6 +630,7 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
>  
>                 igt_require(__gem_context_create(fd, &id) == 0);
>                 execbuf.rsvd1 = id;
> +               gem_context_set_all_engines(fd, execbuf.rsvd1);
>         }
>  
>         for (n = 0; n < nengine; n++) {
> @@ -642,8 +648,10 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
>                 obj[0].handle = gem_create(fd, 4096);
>                 gem_execbuf(fd, &execbuf);
>  
> -               if (flags & CONTEXT)
> +               if (flags & CONTEXT) {
>                         execbuf.rsvd1 = gem_context_create(fd);
> +                       gem_context_set_all_engines(fd, execbuf.rsvd1);
> +               }

I do not like gem_context_set_all_engines(). It's magical inference
about the state of the iterator and should be derived or at least
informed by the iterator / iterated-upon-context. I've suggested maybe
we should use a gem_context_clone_with_engines() but it's still an
implicit link to the iterator as to why... And the storm on horizon
suggests we need to keep v4.19 in mind as a target for igt.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
