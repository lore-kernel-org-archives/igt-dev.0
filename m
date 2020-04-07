Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259606E884
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 14:07:13 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200407134716.8872-1-arjun.melkaveri@intel.com>
References: <20200407134716.8872-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158626842871.8918.2286037412899032345@build.alporthouse.com>
Date: Tue, 07 Apr 2020 15:07:08 +0100
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V4]tests/i915/gem_sync.c :Added
 __for_each_physical_engine to utilize all available
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

Quoting Arjun Melkaveri (2020-04-07 14:47:16)
> Replaced the legacy for_each_engine* defines with the ones
> implemented in the gem_engine_topology library.
> 
> Used  gem_context_clone_with_engines
> to make sure that engine index was potentially created
> based on a  default context with engine map configured.
> 
> Added gem_reopen_driver and gem_context_copy_engines
> to transfer the engine map from parent fd default
> context.
> 
> V2:
> Added Legacy engine coverage for sync_ring and sync_all.
> 
> V3:
> Added back ALL_ENGINES. Corrected Test cases that used
> gem_reopen_driver in fork. Which was not recommended.
> 
> V4:
> Removed gem_require_ring and gem_can_store_dword.

Well that was silly.
 
> Cc: Dec Katarzyna <katarzyna.dec@intel.com>
> Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_sync.c | 231 ++++++++++++++++++++++++++++--------------
>  1 file changed, 156 insertions(+), 75 deletions(-)
> 
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 2ef55ecc..b80fd56c 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -81,21 +81,21 @@ out:
>  static void
>  sync_ring(int fd, unsigned ring, int num_children, int timeout)
>  {
> +       const struct intel_execution_engine2 *e2;
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +               __for_each_physical_engine(fd, e2) {
> +                       names[num_engines] = e2->name;
> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>  
>                 num_children *= num_engines;
>         } else {
> -               gem_require_ring(fd, ring);
>                 names[num_engines] = NULL;
>                 engines[num_engines++] = ring;
>         }
> @@ -180,24 +180,23 @@ idle_ring(int fd, unsigned ring, int timeout)
>  static void
>  wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>  {
> +       const struct intel_execution_engine2 *e2;
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       if (!gem_can_store_dword(fd, eb_ring(e)))
> +               __for_each_physical_engine(fd, e2) {
> +                       if (!gem_class_can_store_dword(fd, e2->class))
>                                 continue;
>  
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +                       names[num_engines] = e2->name;
> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>                 igt_require(num_engines);
>         } else {
> -               gem_require_ring(fd, ring);
> -               igt_require(gem_can_store_dword(fd, ring));
>                 names[num_engines] = NULL;
>                 engines[num_engines++] = ring;
>         }
> @@ -292,24 +291,23 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>  
>  static void active_ring(int fd, unsigned ring, int timeout)
>  {
> +       const struct intel_execution_engine2 *e2;
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       if (!gem_can_store_dword(fd, eb_ring(e)))
> +               __for_each_physical_engine(fd, e2) {
> +                       if (!gem_class_can_store_dword(fd, e2->class))
>                                 continue;
>  
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +                       names[num_engines] = e2->name;
> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>                 igt_require(num_engines);
>         } else {
> -               gem_require_ring(fd, ring);
> -               igt_require(gem_can_store_dword(fd, ring));
>                 names[num_engines] = NULL;
>                 engines[num_engines++] = ring;
>         }
> @@ -359,24 +357,23 @@ static void active_ring(int fd, unsigned ring, int timeout)
>  static void
>  active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>  {
> +       const struct intel_execution_engine2 *e2;
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       if (!gem_can_store_dword(fd, eb_ring(e)))
> +               __for_each_physical_engine(fd, e2) {
> +                       if (!gem_class_can_store_dword(fd, e2->class))
>                                 continue;
>  
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +                       names[num_engines] = e2->name;
> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>                 igt_require(num_engines);
>         } else {
> -               gem_require_ring(fd, ring);
> -               igt_require(gem_can_store_dword(fd, ring));
>                 names[num_engines] = NULL;
>                 engines[num_engines++] = ring;
>         }
> @@ -493,26 +490,25 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>  static void
>  store_ring(int fd, unsigned ring, int num_children, int timeout)
>  {
> +       const struct intel_execution_engine2 *e2;
>         const int gen = intel_gen(intel_get_drm_devid(fd));
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       if (!gem_can_store_dword(fd, eb_ring(e)))
> +               __for_each_physical_engine(fd, e2) {
> +                       if (!gem_class_can_store_dword(fd, e2->class))
>                                 continue;
>  
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +                       names[num_engines] = e2->name;
> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>  
>                 num_children *= num_engines;
>         } else {
> -               gem_require_ring(fd, ring);
> -               igt_require(gem_can_store_dword(fd, ring));
>                 names[num_engines] = NULL;
>                 engines[num_engines++] = ring;
>         }
> @@ -608,6 +604,7 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
>  static void
>  switch_ring(int fd, unsigned ring, int num_children, int timeout)
>  {
> +       const struct intel_execution_engine2 *e2;
>         const int gen = intel_gen(intel_get_drm_devid(fd));
>         unsigned engines[16];
>         const char *names[16];
> @@ -616,20 +613,18 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
>         gem_require_contexts(fd);
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       if (!gem_can_store_dword(fd, eb_ring(e)))
> +               __for_each_physical_engine(fd, e2) {
> +                       if (!gem_class_can_store_dword(fd, e2->class))
>                                 continue;
>  
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +                       names[num_engines] = e2->name;
> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>  
>                 num_children *= num_engines;
>         } else {
> -               gem_require_ring(fd, ring);
> -               igt_require(gem_can_store_dword(fd, ring));
>                 names[num_engines] = NULL;
>                 engines[num_engines++] = ring;
>         }
> @@ -933,6 +928,7 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
>  static void
>  store_many(int fd, unsigned ring, int timeout)
>  {
> +       const struct intel_execution_engine2 *e2;
>         unsigned long *shared;
>         const char *names[16];
>         int n = 0;
> @@ -943,22 +939,20 @@ store_many(int fd, unsigned ring, int timeout)
>         intel_detect_and_clear_missed_interrupts(fd);
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       if (!gem_can_store_dword(fd, eb_ring(e)))
> +               __for_each_physical_engine(fd, e2) {
> +                       if (!gem_class_can_store_dword(fd, e2->class))
>                                 continue;
>  
>                         igt_fork(child, 1)
>                                 __store_many(fd,
> -                                            eb_ring(e),
> +                                            e2->flags,
>                                              timeout,
>                                              &shared[n]);
>  
> -                       names[n++] = e->name;
> +                       names[n++] = e2->name;
>                 }
>                 igt_waitchildren();
>         } else {
> -               gem_require_ring(fd, ring);
> -               igt_require(gem_can_store_dword(fd, ring));
>                 __store_many(fd, ring, timeout, &shared[n]);
>                 names[n++] = NULL;
>         }
> @@ -1025,15 +1019,16 @@ sync_all(int fd, int num_children, int timeout)
>  static void
>  store_all(int fd, int num_children, int timeout)
>  {
> +       const struct intel_execution_engine2 *e;
>         const int gen = intel_gen(intel_get_drm_devid(fd));
>         unsigned engines[16];
>         int num_engines = 0;
>  
> -       for_each_physical_engine(e, fd) {
> -               if (!gem_can_store_dword(fd, eb_ring(e)))
> +       __for_each_physical_engine(fd, e) {
> +               if (!gem_class_can_store_dword(fd, e->class))
>                         continue;
>  
> -               engines[num_engines++] = eb_ring(e);
> +               engines[num_engines++] = e->flags;
>                 if (num_engines == ARRAY_SIZE(engines))
>                         break;
>         }
> @@ -1132,22 +1127,22 @@ store_all(int fd, int num_children, int timeout)
>  static void
>  preempt(int fd, unsigned ring, int num_children, int timeout)
>  {
> +       const struct intel_execution_engine2 *e2;
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>         uint32_t ctx[2];
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +               __for_each_physical_engine(fd, e2) {
> +                       names[num_engines] = e2->name;
> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>  
>                 num_children *= num_engines;
>         } else {
> -               gem_require_ring(fd, ring);
>                 names[num_engines] = NULL;
>                 engines[num_engines++] = ring;
>         }
> @@ -1209,6 +1204,7 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
>  
>  igt_main
>  {
> +       const struct intel_execution_engine2 *e2;
>         const struct intel_execution_engine *e;
>         const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>         int fd = -1;
> @@ -1222,31 +1218,114 @@ igt_main
>                 igt_fork_hang_detector(fd);
>         }
>  
> +       /* Legacy testing must be first. */
>         for (e = intel_execution_engines; e->name; e++) {
> -               igt_subtest_f("%s", e->name)
> -                       sync_ring(fd, eb_ring(e), 1, 20);
> -               igt_subtest_f("idle-%s", e->name)
> -                       idle_ring(fd, eb_ring(e), 20);
> -               igt_subtest_f("active-%s", e->name)
> -                       active_ring(fd, eb_ring(e), 20);
> -               igt_subtest_f("wakeup-%s", e->name)
> -                       wakeup_ring(fd, eb_ring(e), 20, 1);
> -               igt_subtest_f("active-wakeup-%s", e->name)
> -                       active_wakeup_ring(fd, eb_ring(e), 20, 1);
> -               igt_subtest_f("double-wakeup-%s", e->name)
> -                       wakeup_ring(fd, eb_ring(e), 20, 2);
> -               igt_subtest_f("store-%s", e->name)
> -                       store_ring(fd, eb_ring(e), 1, 20);
> -               igt_subtest_f("switch-%s", e->name)
> -                       switch_ring(fd, eb_ring(e), 1, 20);
> -               igt_subtest_f("forked-switch-%s", e->name)
> -                       switch_ring(fd, eb_ring(e), ncpus, 20);
> -               igt_subtest_f("many-%s", e->name)
> -                       store_many(fd, eb_ring(e), 20);
> -               igt_subtest_f("forked-%s", e->name)
> -                       sync_ring(fd, eb_ring(e), ncpus, 20);
> -               igt_subtest_f("forked-store-%s", e->name)
> -                       store_ring(fd, eb_ring(e), ncpus, 20);
> +               struct intel_execution_engine2 e2__;
> +
> +               e2__ = gem_eb_flags_to_engine(eb_ring(e));
> +               if (e2__.flags == -1)
> +                       continue;

Beep. Try again.

Maybe look at some of the conversions Tvrtko did as a guide.
28e25ad1f1f987450f017d7f99548d2d7727d388
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
