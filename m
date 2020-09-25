Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200812213300.905759-1-chris@chris-wilson.co.uk>
References: <20200812213300.905759-1-chris@chris-wilson.co.uk>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Message-ID: <160103223316.9735.14746137477896222078@jlahtine-mobl.ger.corp.intel.com>
Date: Fri, 25 Sep 2020 14:10:33 +0300
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_persistence: Exercise
 cleanup after disabling heartbeats
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-08-13 00:33:00)
> We expose the heartbeat interval on each engine, allowing the sysadim to
> disable them if they prefer avoiding any interruption for their GPU
> tasks. A caveat to allowing the contexts to run without checks is that
> we require such contexts to be non-persistent and so cleaned up on
> closure (including abnormal process termination). However, we also need
> to flush any persistent contexts that are still inflight at that time,
> lest they continue to run unchecked.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

As mentioned on the kernel patches, the right thing to do.

Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas

> ---
>  tests/i915/gem_ctx_persistence.c | 92 ++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index e73a3e6a0..ca676d845 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -426,6 +426,87 @@ static void test_nohangcheck_hang(int i915)
>         close(dir);
>  }
>  
> +static bool set_heartbeat(int i915, const char *name, unsigned int value)
> +{
> +       return gem_engine_property_printf(i915, name,
> +                                         "heartbeat_interval_ms",
> +                                         "%d", value) > 0;
> +}
> +
> +static void test_noheartbeat_many(int i915, int count, unsigned int flags)
> +{
> +       cleanup(i915);
> +
> +       /*
> +        * If the user disables the heartbeat, after leaving behind
> +        * a number of long running *persistent* contexts, check they get
> +        * cleaned up.
> +        */
> +
> +       for_each_engine(e, i915) {
> +               igt_spin_t *spin[count];
> +
> +               if (!set_heartbeat(i915, e->full_name, 100))
> +                       continue;
> +
> +               for (int n = 0; n < ARRAY_SIZE(spin); n++) {
> +                       uint32_t ctx;
> +
> +                       ctx = gem_context_create(i915);
> +                       spin[n] = igt_spin_new(i915, ctx, .engine = eb_ring(e),
> +                                              .flags = (IGT_SPIN_FENCE_OUT |
> +                                                        flags));
> +                       gem_context_destroy(i915, ctx);
> +               }
> +
> +               if (set_heartbeat(i915, e->full_name, 0)) {
> +                       for (int n = 0; n < ARRAY_SIZE(spin); n++) {
> +                               igt_assert_eq(wait_for_status(i915, spin[n]->out_fence, reset_timeout_ms),
> +                                             -EIO);
> +                       }
> +               }
> +
> +               for (int n = 0; n < ARRAY_SIZE(spin); n++)
> +                       igt_spin_free(i915, spin[n]);
> +
> +               set_heartbeat(i915, e->full_name, 2500);
> +               cleanup(i915);
> +       }
> +}
> +
> +static void test_noheartbeat_close(int i915, unsigned int flags)
> +{
> +       cleanup(i915);
> +
> +       /*
> +        * Check that non-persistent contexts are also cleaned up if we
> +        * close the context while they are active, but the engine's
> +        * heartbeat has already been disabled.
> +        */
> +
> +       for_each_engine(e, i915) {
> +               igt_spin_t *spin;
> +               uint32_t ctx;
> +
> +               if (!set_heartbeat(i915, e->full_name, 0))
> +                       continue;
> +
> +               ctx = gem_context_create(i915);
> +               gem_context_set_persistence(i915, ctx, false);
> +               spin = igt_spin_new(i915, ctx, .engine = eb_ring(e),
> +                                   .flags = (IGT_SPIN_FENCE_OUT | flags));
> +               gem_context_destroy(i915, ctx);
> +
> +               set_heartbeat(i915, e->full_name, 2500);
> +
> +               igt_assert_eq(wait_for_status(i915, spin->out_fence, reset_timeout_ms),
> +                             -EIO);
> +
> +               igt_spin_free(i915, spin);
> +               cleanup(i915);
> +       }
> +}
> +
>  static void test_nonpersistent_file(int i915)
>  {
>         int debugfs = i915;
> @@ -1157,6 +1238,17 @@ igt_main
>         igt_subtest("hang")
>                 test_nohangcheck_hang(i915);
>  
> +       igt_subtest("heartbeat-stop")
> +               test_noheartbeat_many(i915, 1, 0);
> +       igt_subtest("heartbeat-hang")
> +               test_noheartbeat_many(i915, 1, IGT_SPIN_NO_PREEMPTION);
> +       igt_subtest("heartbeat-many")
> +               test_noheartbeat_many(i915, 16, 0);
> +       igt_subtest("heartbeat-close")
> +               test_noheartbeat_close(i915, 0);
> +       igt_subtest("heartbeat-hostile")
> +               test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
> +
>         igt_subtest_group {
>                 igt_fixture
>                         gem_require_contexts(i915);
> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
