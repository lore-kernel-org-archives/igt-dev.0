Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962FD6E07D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:12:49 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id g10so210835plt.8
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:12:49 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:13 -0500
Message-Id: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 00/30] Stop cloning contexts
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

So far, I'm pretty happy with this solution.  I've converted around 25 test
programs and it's working quite well.  The only real sore point so far is
around dealing with platforms that don't support contexts.  We could
special case ctx0 a bit more but, right now, I'm just adding an if
statement and leaking the intel_ctx_t.  I'm happy to take suggestions
there.

--Jason


Jason Ekstrand (30):
  lib/i915/gem_engine_topology: Expose the __query_engines helper
  lib: Add an intel_ctx wrapper struct and helpers
  lib/i915/gem_engine_topology: Add an iterator for intel_ctx_t
  tests/i915/gem_exec_basic: Convert to intel_ctx_t
  lib/igt_spin: Rename igt_spin_factory::ctx to ctx_id
  lib/igt_spin: Support intel_ctx_t
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
  tests/i915/gem_ctx_exec: Convert to intel_ctx_t
  tests/i915/gem_exec_suspend: Convert to intel_ctx_t
  tests/i915/gem_sync: Convert to intel_ctx_t
  tests/i915/gem_userptr_blits: Convert to intel_ctx_t
  tests/i915/gem_wait: Convert to intel_ctx_t
  tests/i915/gem_request_retire: Convert to intel_ctx_t

 lib/i915/gem_context.c          |  34 ++
 lib/i915/gem_context.h          |   2 +
 lib/i915/gem_engine_topology.c  |  61 ++-
 lib/i915/gem_engine_topology.h  |  16 +-
 lib/igt_dummyload.c             |  30 +-
 lib/igt_dummyload.h             |   6 +-
 lib/igt_gt.c                    |   2 +-
 lib/intel_ctx.c                 | 159 ++++++
 lib/intel_ctx.h                 | 110 ++++
 lib/meson.build                 |   1 +
 tests/amdgpu/amd_prime.c        |  10 +-
 tests/i915/gem_busy.c           |  80 +--
 tests/i915/gem_ctx_engines.c    |   6 +-
 tests/i915/gem_ctx_exec.c       |  14 +-
 tests/i915/gem_ctx_isolation.c  | 111 ++--
 tests/i915/gem_ctx_shared.c     |  16 +-
 tests/i915/gem_eio.c            |   2 +-
 tests/i915/gem_exec_async.c     |  31 +-
 tests/i915/gem_exec_balancer.c  |  26 +-
 tests/i915/gem_exec_basic.c     |  10 +-
 tests/i915/gem_exec_fair.c      |  99 ++--
 tests/i915/gem_exec_fence.c     | 189 ++++---
 tests/i915/gem_exec_latency.c   |   2 +-
 tests/i915/gem_exec_nop.c       | 158 +++---
 tests/i915/gem_exec_reloc.c     | 102 ++--
 tests/i915/gem_exec_schedule.c  | 875 +++++++++++++++++---------------
 tests/i915/gem_exec_store.c     |  38 +-
 tests/i915/gem_exec_suspend.c   |  56 +-
 tests/i915/gem_exec_whisper.c   |  86 ++--
 tests/i915/gem_request_retire.c |  17 +-
 tests/i915/gem_ringfill.c       |  47 +-
 tests/i915/gem_spin_batch.c     |  83 +--
 tests/i915/gem_sync.c           | 162 +++---
 tests/i915/gem_userptr_blits.c  |  31 +-
 tests/i915/gem_vm_create.c      |   4 +-
 tests/i915/gem_wait.c           |  23 +-
 tests/i915/gem_workarounds.c    |   2 +-
 tests/i915/i915_hangman.c       |  35 +-
 tests/i915/perf_pmu.c           | 225 ++++----
 tests/i915/sysfs_clients.c      |  87 ++--
 tests/prime_busy.c              |  19 +-
 tests/prime_vgem.c              |  38 +-
 42 files changed, 1927 insertions(+), 1178 deletions(-)
 create mode 100644 lib/intel_ctx.c
 create mode 100644 lib/intel_ctx.h

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
