Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EBB6E40F
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 15:30:04 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200406092549.24154-1-arjun.melkaveri@intel.com>
References: <20200406092549.24154-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158618699864.6356.977322746988786249@build.alporthouse.com>
Date: Mon, 06 Apr 2020 16:29:58 +0100
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V2]tests/i915/gem_sync.c :Added
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

Quoting Arjun Melkaveri (2020-04-06 10:25:49)
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
> Cc: Dec Katarzyna <katarzyna.dec@intel.com>
> Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_sync.c | 566 +++++++++++++++++++++++++-----------------
>  1 file changed, 343 insertions(+), 223 deletions(-)
> 
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 2ef55ecc..8efa0668 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -79,52 +79,56 @@ out:
>  }
>  
>  static void
> -sync_ring(int fd, unsigned ring, int num_children, int timeout)
> +sync_ring(int fd, const struct intel_execution_engine2 *e,
> +         int num_children, int timeout)
>  {

ALL_ENGINES is compatible with the engine index interface. That will
greatly reduce the churn and eyesore.

> +       const struct intel_execution_engine2 *e2;
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>  
> -       if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +       if (!e) {
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
> -               engines[num_engines++] = ring;
> +               engines[num_engines++] = e->flags;
>         }
>  
>         intel_detect_and_clear_missed_interrupts(fd);
>         igt_fork(child, num_children) {
> +               int i915;
>                 const uint32_t bbe = MI_BATCH_BUFFER_END;
>                 struct drm_i915_gem_exec_object2 object;
>                 struct drm_i915_gem_execbuffer2 execbuf;
>                 double start, elapsed;
>                 unsigned long cycles;
>  
> +               i915 = gem_reopen_driver(fd);
> +               gem_context_copy_engines(fd, 0, i915, 0);

Please do randomly, completely and utterly change the test to do
something else than was originally intended.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
