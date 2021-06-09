Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0136EC7A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:30:43 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id c12so17472035pfl.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:30:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:29:46 -0500
Message-Id: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 00/93] Stop depending on context mutation
 (v4)
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

I'm trying to clean up some of our uAPI technical debt in i915.  One of the
biggest areas we have right now is context mutability.  There's no good
reason why things like the set of engines or the VM should be able to be
changed on the fly and no "real" userspace actually relies on this
functionality.  It does, however, make for a good excuse for tests and lots
of bug reports as things like swapping out the set of engines under load
break randomly.  The solution here is to stop allowing that behavior and
simplify the i915 internals.

In particular, we'd like to remove the following from the i915 API:

 1. I915_CONTEXT_CLONE_*.  These are only used by IGT and have never been
    used by any "real" userspace.

 2. Changing the VM or set of engines via SETPARAM after they've been
    "used" by an execbuf or similar.  This would effectively make those
    parameters create params rather than mutable state.  We can't drop
    setparam entirely for those because media does use it but we can
    enforce some rules.

 3. Unused (by non-IGT userspace) GETPARAM for things like engines.

As much as we'd love to do that, we have a bit of a problem in IGT.  The
way we handle multi-engine testing today relies heavily on this soon-to-be-
deprecated functionality.  In particular, the standard flow is usually
something like this:

    static void run_test1(int fd, uint32_t engine)
    {
        igt_spin_t *spin;

        ctx = = gem_context_clone_with_engines(fd, 0);
        __igt_spin_new(fd, ctx, .engine = engine);

        /* do some testing with ctx */

        igt_spin_free(fd, spin);
        gem_destroy_context(fd, ctx);
    }

    igt_main
    {
        struct intel_execution_engine2 *e;

        /* Usual fixture code */

        __for_each_physical_engine(fd, e)
            run_test1(fd, e->flags);

        __for_each_physical_engine(fd, e)
            run_test2(fd, e->flags);
    }

Let's walk through what this does:

 1. __for_each_physical_engine calls intel_init_engine_list() which resets
    the set of engines on ctx0 to the full set of engines available as per
    the engine query.  On older kernels/hardware where we don't have the
    engines query, it leaves the set alone.

 2. intel_init_engine_list() also returns a set of engines for iteration
    and __for_each_physical_engine() sets up a for loop to walk the set.

 3. gem_context_clone_with_engines() creates a new context using
    I915_CONTEXT_CONTEXT_CLONE_ENGINES (not used by anything other than
    IGT) to ask that the newly created context has the same set of engines
    as ctx0.  Remember we changed that at the start of loop iteration!

 4. When the context is passed to __igt_spin_new(), it calls
    gem_context_lookup_engine which does a GETPARAM to introspet the set of
    engines on the context and figure out the engine class.

If you've been keeping track, this trivial and extremely common example
uses every single one of these soon-to-be-deprecated APIs even though the
test author may be completely obvious to it.  It also means that getting
rid of IGT's use of them is going to require some fairly deep surgery.

The approach proposed and partially implemented here is to add a new
wrapper struct intel_ctx_t which wraps a GEM context handle as well as the
full set of parameters used to create it, represented by intel_ctx_cfg_t.
We can then use the context anywhere we would regularly use a context, we
just have to do ctx->id.  If we want to clone it, we can do so by re-using
the create parameters by calling intel_ctx_create(fd, &old_ctx->cfg);

Along with the above rework (which got long, sorry) I've got a few other
patches in here which delete tests which exist expressly to test APIs that
are on the chopping block.

v2 (Jason Ekstrand):
 - Better documentation
 - Two more patches at the end to clean up query APIs even more

v3 (Jason Ekstrand):
 - Improved intel_ctx interface
 - More tests converted to intel_ctx_t
 - Misc. bug fixes

v4 (Jason Ekstrand):
 - Rebased
 - Add tests for new error conditions

--Jason

Jason Ekstrand (93):
  tests/i915: Drop gem_ctx_ringsize
  tests/i915/gem_exec_balancer: Drop the ringsize subtest
  tests/i915/gem_exec_endless: Stop setting the ring size
  tests/i915/gem_ctx_param: Drop the zeromap subtests
  tests/i915: Drop gem_ctx_clone
  docs: Add gem_engine_topology.h to the docs
  lib/i915/gem_engine_topology: Expose the __query_engines helper (v2)
  lib/i915/gem_context: Add gem_context_create_ext helpers
  lib: Add an intel_ctx wrapper struct and helpers (v4)
  lib/i915/gem_engine_topology: Rework query_engine_list()
  lib/i915/gem_engine_topology: Factor out static engine listing
  lib/i915/gem_engine_topology: Add an iterator which doesn't munge
    contexts (v2)
  lib/i915/gem_engine_topology: Add an iterator for intel_ctx_t (v2)
  tests/i915/gem_exec_basic: Convert to intel_ctx_t
  lib/dummyload: Better document igt_spin_factory
  lib/dummyload: Rename igt_spin_factory::ctx to ctx_id
  lib/dummyload: Support intel_ctx_t
  tests/i915/gem_exec_fence: Move the engine data into
    inter_engine_context
  tests/i915/gem_exec_fence: Convert to intel_ctx_t
  tests/i915/gem_exec_schedule: Convert to intel_ctx_t
  tests/i915/perf_pmu: Convert to intel_ctx_t
  tests/i915/gem_exec_nop: Convert to intel_ctx_t
  tests/i915/gem_exec_reloc: Convert to intel_ctx_t
  tests/i915/gem_busy: Convert to intel_ctx_t
  tests/i915/gem_ctx_isolation: Convert to intel_ctx_t
  tests/i915/gem_exec_async: Convert to intel_ctx_t
  tests/i915/sysfs_clients: Convert to intel_ctx_t
  tests/i915/gem_exec_fair: Convert to intel_ctx_t
  tests/i915/gem_spin_batch: Convert to intel_ctx_t
  tests/i915/gem_exec_store: Convert to intel_ctx_t
  tests/amdgpu/amd_prime: Convert to intel_ctx_t
  tests/i915/i915_hangman: Convert to intel_ctx_t
  tests/i915/gem_ringfill: Convert to intel_ctx_t
  tests/prime_busy: Convert to intel_ctx_t
  tests/prime_vgem: Convert to intel_ctx_t
  tests/gem_exec_whisper: Convert to intel_ctx_t
  tests/i915/gem_ctx_exec: Stop cloning contexts in close_race
  tests/i915/gem_ctx_exec: Convert to intel_ctx_t
  tests/i915/gem_exec_suspend: Convert to intel_ctx_t
  tests/i915/gem_sync: Convert to intel_ctx_t
  tests/i915/gem_userptr_blits: Convert to intel_ctx_t
  tests/i915/gem_wait: Convert to intel_ctx_t
  tests/i915/gem_request_retire: Convert to intel_ctx_t
  tests/i915/gem_ctx_shared: Convert to intel_ctx_t
  tests/i915/gem_ctx_shared: Stop cloning contexts
  tests/i915/gem_create: Convert to intel_ctx_t
  tests/i915/gem_ctx_switch: Convert to intel_ctx_t
  tests/i915/gem_exec_parallel: Convert to intel_ctx_t
  tests/i915/gem_exec_latency: Convert to intel_ctx_t
  tests/i915/gem_watchdog: Convert to intel_ctx_t
  tests/i915/gem_shrink: Convert to intel_ctx_t
  tests/i915/gem_exec_params: Convert to intel_ctx_t
  tests/i915/gem_exec_gttfill: Convert to intel_ctx_t
  tests/i915/gem_exec_capture: Convert to intel_ctx_t
  tests/i915/gem_exec_create: Convert to intel_ctx_t
  tests/i915/gem_exec_await: Convert to intel_ctx_t
  tests/i915/gem_ctx_persistence: Drop the clone subtest
  tests/i915/gem_ctx_persistence: Drop the engine replace subtests
  tests/i915/gem_ctx_persistence: Convert to intel_ctx_t
  tests/i915/module_load: Convert to intel_ctx_t
  tests/i915/pm_rc6_residency: Convert to intel_ctx_t
  tests/i915/gem_cs_tlb: Convert to intel_ctx_t
  tests/core_hotplug: Convert to intel_ctx_t
  tests/i915/gem_exec_balancer: Stop cloning engines
  tests/i915/gem_exec_balancer: Don't reset engines on a context
  tests/i915/gem_exec_balancer: Stop munging ctx0 engines
  tests/i915/gem_exec_balancer: Drop bonded tests
  lib/intel_ctx: Add load balancing support
  tests/i915/gem_exec_balancer: Convert to intel_ctx_t
  tests/i915/gem_exec_endless: Stop munging ctx0 engines
  lib/i915: Use for_each_physical_ring for submission tests
  tests/i915/gem_ctx_engines: Rework execute-one*
  tests/i915/gem_ctx_engines: Use better engine iteration
  tests/i915/gem_ctx_engines: Drop the idempotent subtest
  tests/i915/gem_ctx_create: Convert benchmarks to intel_ctx_t
  tests/i915/gem_vm_create: Delete destroy racing tests
  tests/i915/gem_vm_create: Use intel_ctx_t in the execbuf test
  tests/i915/sysfs: Convert to intel_ctx_t
  tests/i915/gem_workarounds: Convert to intel_ctx_t
  lib/i915/gem_context: Delete all the context clone/copy stuff
  tests/i915/gem_ctx_engines: Delete the libapi subtest
  lib/igt_dummyload: Stop supporting ALL_ENGINES without an intel_ctx_t
  lib/i915/gem_engine_topology: Delete the old physical engine iterators
  tests/i915/gem_mmap_gtt: Convert to intel_ctx_t
  igt/dummyload: Require an intel_ctx_t for POLL_RUN and !ALL_ENGINES
  lib/i915: Rework engine API availability checks (v2)
  lib/intel_bb: Remove intel_bb_assign_vm and tests
  tests/i915/gem_ctx_param: Stop setting VMs on old contexts
  tests/i915/gen9_exec_parse: Convert to intel_ctx_t
  tests/i915/gem_ctx_param: Add tests for recently removed params
  tests/i915/gem_ctx_param: Add a couple invalid PARAM_VM cases
  tests/i915/gem_ctx_engines: Add more invalid SET_CONTEXT_PARAM cases
  tests/i915/gem_exec_balancer: Add a test for combind balancing and
    bonding

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   2 +
 lib/i915/gem_context.c                        | 261 ++---
 lib/i915/gem_context.h                        |  21 +-
 lib/i915/gem_engine_topology.c                | 277 +++---
 lib/i915/gem_engine_topology.h                |  78 +-
 lib/i915/gem_submission.c                     |  13 +-
 lib/igt_dummyload.c                           |  25 +-
 lib/igt_dummyload.h                           |  28 +-
 lib/igt_gt.c                                  |   2 +-
 lib/intel_batchbuffer.c                       |  52 -
 lib/intel_batchbuffer.h                       |   3 -
 lib/intel_ctx.c                               | 327 +++++++
 lib/intel_ctx.h                               |  79 ++
 lib/meson.build                               |   1 +
 tests/amdgpu/amd_prime.c                      |  10 +-
 tests/core_hotunplug.c                        |   6 +-
 tests/i915/api_intel_bb.c                     | 104 --
 tests/i915/gem_busy.c                         |  77 +-
 tests/i915/gem_create.c                       |  14 +-
 tests/i915/gem_cs_tlb.c                       |  10 +-
 tests/i915/gem_ctx_clone.c                    | 451 ---------
 tests/i915/gem_ctx_create.c                   |  76 +-
 tests/i915/gem_ctx_engines.c                  | 296 ++----
 tests/i915/gem_ctx_exec.c                     |  54 +-
 tests/i915/gem_ctx_isolation.c                | 112 ++-
 tests/i915/gem_ctx_param.c                    | 108 ++-
 tests/i915/gem_ctx_persistence.c              | 457 +++------
 tests/i915/gem_ctx_ringsize.c                 | 345 -------
 tests/i915/gem_ctx_shared.c                   | 335 ++++---
 tests/i915/gem_ctx_switch.c                   | 115 ++-
 tests/i915/gem_eio.c                          |   2 +-
 tests/i915/gem_exec_async.c                   |  32 +-
 tests/i915/gem_exec_await.c                   |  20 +-
 tests/i915/gem_exec_balancer.c                | 913 +++++-------------
 tests/i915/gem_exec_basic.c                   |   7 +-
 tests/i915/gem_exec_capture.c                 |  30 +-
 tests/i915/gem_exec_create.c                  |   9 +-
 tests/i915/gem_exec_endless.c                 |  14 +-
 tests/i915/gem_exec_fair.c                    | 112 ++-
 tests/i915/gem_exec_fence.c                   | 302 +++---
 tests/i915/gem_exec_gttfill.c                 |  15 +-
 tests/i915/gem_exec_latency.c                 | 118 ++-
 tests/i915/gem_exec_nop.c                     | 156 +--
 tests/i915/gem_exec_parallel.c                |  29 +-
 tests/i915/gem_exec_params.c                  |   4 +-
 tests/i915/gem_exec_reloc.c                   | 102 +-
 tests/i915/gem_exec_schedule.c                | 887 +++++++++--------
 tests/i915/gem_exec_store.c                   |  36 +-
 tests/i915/gem_exec_suspend.c                 |  52 +-
 tests/i915/gem_exec_whisper.c                 |  83 +-
 tests/i915/gem_mmap_gtt.c                     |  18 +-
 tests/i915/gem_request_retire.c               |  17 +-
 tests/i915/gem_ringfill.c                     |  48 +-
 tests/i915/gem_shrink.c                       |  37 +-
 tests/i915/gem_spin_batch.c                   |  79 +-
 tests/i915/gem_sync.c                         | 159 +--
 tests/i915/gem_userptr_blits.c                |  25 +-
 tests/i915/gem_vm_create.c                    | 125 +--
 tests/i915/gem_wait.c                         |  20 +-
 tests/i915/gem_watchdog.c                     | 167 +---
 tests/i915/gem_workarounds.c                  |  11 +-
 tests/i915/gen9_exec_parse.c                  | 106 +-
 tests/i915/i915_hangman.c                     |  37 +-
 tests/i915/i915_module_load.c                 |   7 +-
 tests/i915/i915_pm_rc6_residency.c            |   7 +-
 tests/i915/i915_query.c                       |  17 +-
 tests/i915/perf_pmu.c                         | 226 +++--
 tests/i915/sysfs_clients.c                    |  87 +-
 tests/i915/sysfs_heartbeat_interval.c         |  40 +-
 tests/i915/sysfs_preempt_timeout.c            |  39 +-
 tests/i915/sysfs_timeslice_duration.c         |  51 +-
 tests/meson.build                             |   2 -
 tests/prime_busy.c                            |  19 +-
 tests/prime_vgem.c                            |  35 +-
 74 files changed, 3479 insertions(+), 4562 deletions(-)
 create mode 100644 lib/intel_ctx.c
 create mode 100644 lib/intel_ctx.h
 delete mode 100644 tests/i915/gem_ctx_clone.c
 delete mode 100644 tests/i915/gem_ctx_ringsize.c

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
