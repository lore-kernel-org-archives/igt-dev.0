Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DF46E880
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 07:45:26 +0000 (UTC)
References: <20210707144337.180693-1-jason@jlekstrand.net>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <692622d7-6641-85a9-a589-ab57faf26d0f@linux.intel.com>
Date: Thu, 8 Jul 2021 09:45:17 +0200
MIME-Version: 1.0
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 00/81] Stop depending on context
 mutation (v4)
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
To: Jason Ekstrand <jason@jlekstrand.net>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Op 07-07-2021 om 16:42 schreef Jason Ekstrand:
> I'm trying to clean up some of our uAPI technical debt in i915.  One of the
> biggest areas we have right now is context mutability.  There's no good
> reason why things like the set of engines or the VM should be able to be
> changed on the fly and no "real" userspace actually relies on this
> functionality.  It does, however, make for a good excuse for tests and lots
> of bug reports as things like swapping out the set of engines under load
> break randomly.  The solution here is to stop allowing that behavior and
> simplify the i915 internals.
>
> In particular, we'd like to remove the following from the i915 API:
>
>  1. I915_CONTEXT_CLONE_*.  These are only used by IGT and have never been
>     used by any "real" userspace.
>
>  2. Changing the VM or set of engines via SETPARAM after they've been
>     "used" by an execbuf or similar.  This would effectively make those
>     parameters create params rather than mutable state.  We can't drop
>     setparam entirely for those because media does use it but we can
>     enforce some rules.
>
>  3. Unused (by non-IGT userspace) GETPARAM for things like engines.
>
> As much as we'd love to do that, we have a bit of a problem in IGT.  The
> way we handle multi-engine testing today relies heavily on this soon-to-be-
> deprecated functionality.  In particular, the standard flow is usually
> something like this:
>
>     static void run_test1(int fd, uint32_t engine)
>     {
>         igt_spin_t *spin;
>
>         ctx = = gem_context_clone_with_engines(fd, 0);
>         __igt_spin_new(fd, ctx, .engine = engine);
>
>         /* do some testing with ctx */
>
>         igt_spin_free(fd, spin);
>         gem_destroy_context(fd, ctx);
>     }
>
>     igt_main
>     {
>         struct intel_execution_engine2 *e;
>
>         /* Usual fixture code */
>
>         __for_each_physical_engine(fd, e)
>             run_test1(fd, e->flags);
>
>         __for_each_physical_engine(fd, e)
>             run_test2(fd, e->flags);
>     }
>
> Let's walk through what this does:
>
>  1. __for_each_physical_engine calls intel_init_engine_list() which resets
>     the set of engines on ctx0 to the full set of engines available as per
>     the engine query.  On older kernels/hardware where we don't have the
>     engines query, it leaves the set alone.
>
>  2. intel_init_engine_list() also returns a set of engines for iteration
>     and __for_each_physical_engine() sets up a for loop to walk the set.
>
>  3. gem_context_clone_with_engines() creates a new context using
>     I915_CONTEXT_CONTEXT_CLONE_ENGINES (not used by anything other than
>     IGT) to ask that the newly created context has the same set of engines
>     as ctx0.  Remember we changed that at the start of loop iteration!
>
>  4. When the context is passed to __igt_spin_new(), it calls
>     gem_context_lookup_engine which does a GETPARAM to introspet the set of
>     engines on the context and figure out the engine class.
>
> If you've been keeping track, this trivial and extremely common example
> uses every single one of these soon-to-be-deprecated APIs even though the
> test author may be completely obvious to it.  It also means that getting
> rid of IGT's use of them is going to require some fairly deep surgery.
>
> The approach proposed and partially implemented here is to add a new
> wrapper struct intel_ctx_t which wraps a GEM context handle as well as the
> full set of parameters used to create it, represented by intel_ctx_cfg_t.
> We can then use the context anywhere we would regularly use a context, we
> just have to do ctx->id.  If we want to clone it, we can do so by re-using
> the create parameters by calling intel_ctx_create(fd, &old_ctx->cfg);
>
> Along with the above rework (which got long, sorry) I've got a few other
> patches in here which delete tests which exist expressly to test APIs that
> are on the chopping block.

Seems some tests start failing. I like this whole removal of uapi though, some of the complicated code related to ww mutex inside the kernel was related to it.

I roughly looked at all the patches, so I can only give this for the whole series:

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Although it seems some tests in the ci full run might still be breaking?

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
