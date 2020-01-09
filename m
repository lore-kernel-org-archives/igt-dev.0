Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14396E8EB
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2020 09:18:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200109085023.25551-2-krishnaiah.bommu@intel.com>
References: <20200109085023.25551-1-krishnaiah.bommu@intel.com>
 <20200109085023.25551-2-krishnaiah.bommu@intel.com>
Message-ID: <157856151326.13423.7387696609558876020@skylake-alporthouse-com>
Date: Thu, 09 Jan 2020 09:18:33 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/i915/gem_ctx_persistence: Set
 context with supported engines
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Bommu Krishnaiah (2020-01-09 08:50:23)
> Update the context with supported engines on the platform with set_property
> I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
> the available engines only.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  tests/i915/gem_ctx_persistence.c | 34 ++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index d68431ae..e410e85f 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -145,6 +145,15 @@ static void test_clone(int i915)
>         gem_context_destroy(i915, clone);
>  }
>  
> +static uint32_t create_context(int i915, bool persistent)
> +{
> +       uint32_t ctx;
> +
> +       ctx = gem_context_create(i915);
> +       gem_context_set_persistence(i915, ctx, persistent);
> +       gem_context_set_all_engines(i915, ctx);

Really? We only need a single engine, could you not be a little more
precise.

> +       return ctx;
> +}
>  static void test_persistence(int i915, unsigned int engine)
>  {
>         igt_spin_t *spin;
> @@ -156,8 +165,7 @@ static void test_persistence(int i915, unsigned int engine)
>          * request is retired -- no early termination.
>          */
>  
> -       ctx = gem_context_create(i915);
> -       gem_context_set_persistence(i915, ctx, true);
> +       ctx = create_context(i915, true);
>  
>         spin = igt_spin_new(i915, ctx,
>                             .engine = engine,
> @@ -188,8 +196,7 @@ static void test_nonpersistent_cleanup(int i915, unsigned int engine)
>          * any inflight request is cancelled.
>          */
>  
> -       ctx = gem_context_create(i915);
> -       gem_context_set_persistence(i915, ctx, false);
> +       ctx = create_context(i915, false);
>  
>         spin = igt_spin_new(i915, ctx,
>                             .engine = engine,
> @@ -217,8 +224,7 @@ static void test_nonpersistent_mixed(int i915, unsigned int engine)
>                 igt_spin_t *spin;
>                 uint32_t ctx;
>  
> -               ctx = gem_context_create(i915);
> -               gem_context_set_persistence(i915, ctx, i & 1);
> +               ctx = create_context(i915, i & 1);
>  
>                 spin = igt_spin_new(i915, ctx,
>                                     .engine = engine,
> @@ -253,8 +259,7 @@ static void test_nonpersistent_hostile(int i915, unsigned int engine)
>          * the requests and cleanup the context.
>          */
>  
> -       ctx = gem_context_create(i915);
> -       gem_context_set_persistence(i915, ctx, false);
> +       ctx = create_context(i915, false);
>  
>         spin = igt_spin_new(i915, ctx,
>                             .engine = engine,
> @@ -284,8 +289,8 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
>  
>         igt_require(gem_scheduler_has_preemption(i915));
>  
> -       ctx = gem_context_create(i915);
> -       gem_context_set_persistence(i915, ctx, true);
> +       ctx = create_context(i915, true);
> +
>         gem_context_set_priority(i915, ctx, 0);
>         spin[0] = igt_spin_new(i915, ctx,
>                                .engine = engine,
> @@ -385,8 +390,8 @@ static void test_nonpersistent_queued(int i915, unsigned int engine)
>  
>         gem_quiescent_gpu(i915);
>  
> -       ctx = gem_context_create(i915);
> -       gem_context_set_persistence(i915, ctx, false);
> +       ctx = create_context(i915, false);
> +
>         spin = igt_spin_new(i915, ctx,
>                             .engine = engine,
>                             .flags = IGT_SPIN_FENCE_OUT);
> @@ -512,8 +517,7 @@ static void test_process_mixed(int i915, unsigned int engine)
>                         igt_spin_t *spin;
>                         uint32_t ctx;
>  
> -                       ctx = gem_context_create(i915);
> -                       gem_context_set_persistence(i915, ctx, persists);
> +                       ctx = create_context(i915, persists);
>  
>                         spin = igt_spin_new(i915, ctx,
>                                             .engine = engine,
> @@ -727,7 +731,7 @@ igt_main
>         igt_subtest("hangcheck")
>                 test_nohangcheck_hostile(i915);
>  
> -       __for_each_static_engine(e) {
> +       __for_each_physical_engine(i915, e) {

Please note this has to check ABI. We have to confirm that no matter how
the user tries to fool us, they cannot. So the gem_context_set_engines()
should be considered a separate step, or a very, very persuasive
argument made as to why we consider the multiple ABI paths equivalent,
bearing in mind the security implications of getting it wrong.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
